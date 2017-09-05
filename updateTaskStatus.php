<?php

$post = json_decode(file_get_contents("php://input"), true);

$task_id = $post['task_id'];
$status = $post['status'];
$timestamp = $post['timestamp'];
// $timestamp = "06:49:00";

// $task_id = 1;
// $status = 1;

// $db = new mysqli('localhost', 'root', '', 'sterix');
$db = new mysqli('sterixdb.sterix.online', 'sterixonis', '5t3r1x0nl1n3', 'sterixdb');

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}

if($status == 0){
	$status = "5";
	$statement = $db->prepare("UPDATE `service_order_task` SET `status` = ?  WHERE `ID` = ?  ");
	$statement->bind_param('ss',$status,$task_id);
	$statement->execute();
}

else if ($status == 1){
	
	$status = "1";

	$statement = $db->prepare("SELECT `actual_start_time`
								  
							   FROM `service_order_task` 

							   WHERE `ID` = ?
					        ");

	$statement->bind_param('s',$task_id);
	$statement->execute();
	$statement->bind_result($actual_start_time);

	while($statement->fetch()){}

	if($actual_start_time == NULL || $actual_start_time == ""){
		$statement2 = $db->prepare("UPDATE `service_order_task` SET `status` = ?, `actual_start_time` = ?  WHERE `ID` = ?  ");
		$statement2->bind_param('sss',$status,$timestamp,$task_id);
		$statement2->execute();
	}

	else{

		$statement2 = $db->prepare("UPDATE `service_order_task` SET `status` = ?  WHERE `ID` = ?  ");
		$statement2->bind_param('ss',$status,$task_id);
		$statement2->execute();
	}


}

else{
	$status = "4";
	$statement = $db->prepare("UPDATE `service_order_task` SET `status` = ?, `actual_end_time` = ?  WHERE `ID` = ?  ");
	$statement->bind_param('sss',$status,$timestamp,$task_id);
	$statement->execute();


}


// $statement = $db->prepare("UPDATE `service_order_task` SET `status` = ?, `actual_start_time` = NULL  WHERE `ID` = ?  ");
// $statement->bind_param('ss',$status,$task_id);
// $statement->execute();

$return['success'] = "true";

echo json_encode($return)
?>