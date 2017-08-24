<?php


// sleep(2);

$post = json_decode(file_get_contents("php://input"), true);

$userID = $post['user_id'];
$max_service_order_id = $post['max_service_order_id'];


// $userID = '12';
// $max_service_order_id = '7';

$db = new mysqli('localhost', 'root', '', 'sterix');

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}

$statement = $db->prepare("SELECT `so`.`service_order_ID`, 
								  `st`.`service_type_name`,
								  `cli`.`client_location_name`,
								  `so`.`start_date`,
								  `so`.`start_time`,
								  `so`.`end_date`,
								  `so`.`end_time`,
								  `so`.`service_order_status_type_ID`


							FROM `service_order` `so`

							INNER JOIN `client_location_info` `cli` ON `cli`.`client_location_ID` = `so`.`location_ID` 
							
							INNER JOIN `service_type` `st` ON `st`.`service_type_ID` = `so`.`service_type_ID` 
							
							WHERE `so`.`user_ID` = ? AND `so`.`service_order_ID` > ?

							ORDER BY `so`.`service_order_ID` ASC

							");



$statement->bind_param('si',$userID,$max_service_order_id);
$statement->execute();
$statement->bind_result($service_order_id,$service_type_name,$client_location_area_name,$start_date,$start_time,$end_date,$end_time,$service_order_status_type_ID);

$return["service_orders"] = array();


while($statement->fetch()){

	$service_order = array();
	$service_order["service_order_ID"] = $service_order_id;    
	$service_order["service_type_name"] = $service_type_name;    
	$service_order["client_location_name"] = $client_location_area_name;    
	$service_order["start_date"] = $start_date;    
	$service_order["start_time"] = $start_time;    
	$service_order["end_date"] = $end_date;    
	$service_order["end_time"] = $end_time;    
	$service_order["service_order_status_type_ID"] = $service_order_status_type_ID;   

    array_push($return["service_orders"], $service_order);

}


echo json_encode($return); 

?>

