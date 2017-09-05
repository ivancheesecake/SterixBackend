<?php


$post = json_decode(file_get_contents("php://input"), true);
$service_order_id = $post["service_order_id"];
$device_code = $post["device_code"];
$client_location_area_ID = $post["client_location_area_ID"];
$timestamp = $post["timestamp"];
$device_condition_ID = $post["device_condition_ID"];
$activity_ID = $post["activity_ID"];
$photo_path = $post["photo_path"];
$photo_notes = $post["photo_notes"];

$pest_info = json_decode($post["pest_info"]);

// $service_order_id = "7";
// $device_code = "CTB003";
// $client_location_area_ID = "1";
// $timestamp = "2017-08-27 05:10:10";
// $device_condition_ID = "1";
// $activity_ID = "1";


// $db = new mysqli('localhost', 'root', '', 'sterix');
$db = new mysqli('sterixdb.sterix.online', 'sterixonis', '5t3r1x0nl1n3', 'sterixdb');

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}

$statement = $db->prepare("INSERT INTO `device_monitoring` 
							(`service_order_id`,
							 `device_code`,
							 `client_location_area_ID`,
							 `timestamp`,
							 `device_condition_ID`,
							 `activity_ID`)
						   VALUES  (?,?,?,?,?,?) ");
$statement->bind_param('ssssss',$service_order_id,$device_code,$client_location_area_ID,$timestamp,$device_condition_ID,$activity_ID);
$statement->execute();

// $return["success"] = "true";
$last_device_monitoring_id = $db->insert_id;

$zero = "0";
foreach ($pest_info as $p) {
	
		$statement = $db->prepare("INSERT INTO `pest_found` 
								(`service_order_ID`,
								 `device_monitoring_ID`,
								 `service_order_area_ID`,
								 `pest_ID`,
								 `number`)
							   VALUES  (?,?,?,?,?) ");
		$statement->bind_param('sssss',$service_order_id,$last_device_monitoring_id,$zero,$p->pest_id,$p->number);
		$statement->execute();

}

// Insert photo and notes

$statement = $db->prepare("INSERT INTO `device_monitoring_photos` 
								(`device_monitoring_ID`,
								 `filename_link`,
								 `remarks`)
							   VALUES  (?,?,?) ");
$statement->bind_param('sss',$last_device_monitoring_id,$photo_path,$photo_notes);
$statement->execute();

$return["success"] = "true";

//

echo json_encode($return);
?>