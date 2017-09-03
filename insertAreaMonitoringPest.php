<?php


$post = json_decode(file_get_contents("php://input"), true);
$service_order_ID = $post["service_order_id"];
$client_location_area_ID = $post["client_location_area_id"];
$pest_ID = $post["pest_id"];
$number = $post["number"];
$zero = "0";

$db = new mysqli('localhost', 'root', '', 'sterix');

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}


$statement = $db->prepare("INSERT INTO `pest_found` 
							(`service_order_ID`,
							 `device_monitoring_ID`,	
							 `service_order_area_ID`,
							 `pest_ID`,
							 `number`) 
						   VALUES  (?,?,?,?,?) ");

$statement->bind_param('sssss',$service_order_ID,$zero,$client_location_area_ID,$pest_ID,$number);
$statement->execute();

$return["success"] = "true";

echo json_encode($return);
?>