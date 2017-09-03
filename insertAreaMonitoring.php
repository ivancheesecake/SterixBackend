<?php


$post = json_decode(file_get_contents("php://input"), true);
$service_order_id = $post["service_order_id"];
$client_location_area_ID = $post["client_location_area_ID"];
$findings = $post["findings"];
$proposed_action = $post["proposed_action"];
$timestamp = $post["timestamp"];

// $service_order_id = "0";
// $client_location_area_ID = "0";
// $findings = "Walang";
// $proposed_action = "pagasa";
// $timestamp = "walang oras";
// $pest_info = json_decode($post["pest_info"]);

$db = new mysqli('localhost', 'root', '', 'sterix');

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}

$statement = $db->prepare("INSERT INTO `area_monitoring` 
							(`service_order_ID`,
							 `client_location_area_ID`,
							 `findings`,
							 `proposed_action`,
							 `timestamp`) 
						   VALUES  (?,?,?,?,?) ");
// print_r($statement);
$statement->bind_param('sssss',$service_order_id,$client_location_area_ID,$findings,$proposed_action,$timestamp);
$statement->execute();

// // $return["success"] = "true";
// $last_device_monitoring_id = $db->insert_id;
// $zero = "0";
// foreach ($pest_info as $p) {
	
// 		$statement = $db->prepare("INSERT INTO `pest_found` 
// 								(`service_order_ID`,
// 								 `device_monitoring_ID`,
// 								 `service_order_area_ID`,
// 								 `pest_ID`,
// 								 `number`)
// 							   VALUES  (?,?,?,?,?) ");
// 		$statement->bind_param('sssss',$service_order_id,$last_device_monitoring_id,$zero,$p->pest_id,$p->number);
// 		$statement->execute();


// }


$return["success"] = "true";

echo json_encode($return);
?>