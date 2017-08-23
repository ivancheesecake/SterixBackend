<?php

$post = json_decode(file_get_contents("php://input"), true);

//$userID = $post['user_id'];
$userID = '12';

$db = new mysqli('localhost', 'root', '', 'sterix');

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}

$statement = $db->prepare("SELECT `so`.`service_order_ID`, 
								  `st`.`service_type_name`,
								  `clai`.`client_location_area_name`,
								  `so`.`start_date`,
								  `so`.`start_time`,
								  `so`.`end_date`,
								  `so`.`end_time`,
								  `so`.`service_order_status_type_ID`


							FROM `service_order` `so`

							INNER JOIN `client_location_area_info` `clai` ON `clai`.`client_location_area_ID` = `so`.`location_ID` 
							
							INNER JOIN `service_type` `st` ON `st`.`service_type_ID` = `so`.`service_type_ID` 
							
							WHERE `so`.`user_ID` = ? ");



$statement->bind_param('s',$userID);
$statement->execute();
$statement->bind_result($service_order_id,$service_type_name,$client_location_area_name,$start_date,$start_time,$end_date,$end_time,$service_order_status_type_ID);


// $data = array();
// // $data2 = array();
 
// $data[0]["service_order_id"] = 10;
// $data[0]["service_order_location_id"] = 20;
// $data[0]["service_order_location"] = "Pilipinas";
// $data[1]["service_order_id"] = 12;
// $data[1]["service_order_location_id"] = 22;
// $data[1]["service_order_location"] = "Korea";
// $data[2]["service_order_id"] = 6;
// $data[2]["service_order_location_id"] = 6;
// $data[2]["service_order_location"] = "Japan";

$return["service_order"] = array();


while($statement->fetch()){

	$service_order = array();
	$service_order["service_order_ID"] = $service_order_id;    
	$service_order["service_type_name"] = $service_type_name;    
	$service_order["client_location_area_name"] = $client_location_area_name;    
	$service_order["start_date"] = $start_date;    
	$service_order["start_time"] = $start_time;    
	$service_order["end_date"] = $end_date;    
	$service_order["end_time"] = $end_time;    
	$service_order["service_order_status_type_ID"] = $service_order_status_type_ID;   

    array_push($return["service_order"], $service_order);

}

// $return['client_location_area_name'] = $client_location_area_name;
// $return['service_order_id'] = $service_order_id;
// $return['data'] = $data;


// while($statement->fetch()){
    
// 	if(base64_encode(sha1($password . $returned_salt, true) . $returned_salt) == $returned_password){
		
// 		$return['success'] = "true";
// 		$return['username'] = $username;

// 	}
    
// }

echo json_encode($return); 

?>

