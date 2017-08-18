<?php

$post = json_decode(file_get_contents("php://input"), true);

$task_id = $post['task_id'];
$status = $post['status'];

// $task_id = 1;
// $status = 1;

if($status == 0)
	$status = "5";
else if ($status == 1)
	$status = "1";
else
	$status = "4";

$db = new mysqli('localhost', 'root', '', 'sterix');

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}

$statement = $db->prepare("UPDATE `service_order_task` SET `status` = ?  WHERE `ID` = ?  ");
$statement->bind_param('ss',$status,$task_id);
$statement->execute();

$return['success'] = "true";

echo json_encode($return)
?>