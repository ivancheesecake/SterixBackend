<?php

// sleep(2);


$post = json_decode(file_get_contents("php://input"), true);

// $userID = '12';

$userID = $post['user_id'];
$taskUpdates = $post['task_updates'];
$device_monitoring_updates= json_decode($post['device_monitoring_updates']);
$area_monitoring_updates= json_decode($post['area_monitoring_updates']);
$area_monitoring_pest_updates= json_decode($post['area_monitoring_pest_updates']);

// $userID = "12";
// $taskUpdates = "";
// $device_monitoring_updates = array();
// $area_monitoring_updates = array();
// $area_monitoring_pest_updates = array();
// $device_monitoring_updates= json_decode('[{"service_order_id":"7","client_location_area_id":"3","device_code":"CTB007","device_condition_id":"4","activity_id":"5","timestamp":"2017-09-02 20:25:02","pests":"[{\"pest_ID\":\"0\",\"number\":\"69\"},{\"pest_ID\":\"1\",\"number\":\"11\"},{\"pest_ID\":\"2\",\"number\":\"10\"},{\"pest_ID\":\"4\",\"number\":\"10\"},{\"pest_ID\":\"5\",\"number\":\"11\"},{\"pest_ID\":\"6\",\"number\":\"11\"},{\"pest_ID\":\"8\",\"number\":\"10\"},{\"pest_ID\":\"9\",\"number\":\"69\"},{\"pest_ID\":\"10\",\"number\":\"69\"},{\"pest_ID\":\"13\",\"number\":\"69\"},{\"pest_ID\":\"15\",\"number\":\"11\"},{\"pest_ID\":\"17\",\"number\":\"10\"}]"},{"service_order_id":"8","client_location_area_id":"5","device_code":"CTB013","device_condition_id":"","activity_id":"","timestamp":"2017-09-02 20:26:19","pests":"[{\"pest_ID\":\"0\",\"number\":\"22\"},{\"pest_ID\":\"2\",\"number\":\"12\"},{\"pest_ID\":\"5\",\"number\":\"93\"}]"}]');

// $area_monitoring_updates = json_decode('[{"service_order_id":"7","client_location_area_id":"3","findings":"neomu","proposed_action":"neomu","timestamp":"2017-09-03 06:54:29"},{"service_order_id":"8","client_location_area_id":"5","findings":"molla","proposed_action":"molla","timestamp":"2017-09-03 06:55:13"}]');

// Connect to Database
$db = new mysqli('localhost', 'root', '', 'sterix');

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}

// Fetch Service Orders


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
							
							WHERE `so`.`user_ID` = ?

							ORDER BY `so`.`service_order_ID` ASC
							");



$statement->bind_param('s',$userID);
$statement->execute();
$statement->bind_result($service_order_id,$service_type_name,$client_location_area_name,$start_date,$start_time,$end_date,$end_time,$service_order_status_type_ID);

$service_order_ids = "";
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

	$service_order_ids .= "'".$service_order_id."',";
	// array_push($service_order_ids,$service_order_id);
    array_push($return["service_orders"], $service_order);

}

/* 
 * Fetch Service Order Tasks
 *
 * * * * * * * * * * * * * * * */

// Run update queue first!

// $taskUpdates = "1,0|2,0|3,0|";
if ($taskUpdates!=""){

	$pieces = explode("|",substr($taskUpdates,0,-1));
	// print_r($pieces=NULL);

	foreach($pieces as $piece){
		
		$pieces2 = explode(",",$piece);

		$task_id =  $pieces2[0];
		$status =   $pieces2[1];

		if($status == "0")
			$status_converted = "5";
		else if($status == "2" )
			$status_converted = "4";
		else
			$status_converted = "1";

		$statement = $db->prepare("UPDATE `service_order_task` 
								   SET `status` = ?	
								   WHERE `ID` = ?
						        ");


		$statement->bind_param('ii',$status_converted,$task_id);
		$statement->execute();
	}
}

// Select all service order tasks with service orders realated to current user

$service_order_ids = substr($service_order_ids, 0,-1);
// echo $service_order_ids;

$statement = $db->prepare("SELECT `id`,
								  `service_order_ID`, 
								  `task`,
								  `target_start_time`,
								  `status`

							FROM `service_order_task` 

							WHERE `service_order_ID` IN ($service_order_ids)

							ORDER BY `service_order_ID` ASC
					        ");



// $statement->bind_param('s',$userID);
$statement->execute();
$statement->bind_result($id,$service_order_id,$task,$target_start_time,$status);

$return["service_order_tasks"] = array();

while($statement->fetch()){

	$service_order_task = array();
	$service_order_task["id"] = $id;    
	$service_order_task["service_order_ID"] = $service_order_id;    
	$service_order_task["task"] = $task;    
	$service_order_task["start_time"] = $target_start_time;

	if($status == "5")
		$status_converted = "0";
	else if($status == "4" )
		$status_converted = "2";
	else
		$status_converted = "1";

	$service_order_task["status"] = $status_converted;    

    array_push($return["service_order_tasks"], $service_order_task);

}

/* 
 * Fetch Service Order Areas
 *
 * * * * * * * * * * * * * * * */

//Update status first

$statement = $db->prepare("SELECT `soa`.`service_order_ID`,
								  `soa`.`client_location_area_ID`,
								  `clai`.`client_location_area_name`, 
								  `soa`.`status`

							FROM `service_order_area` `soa`

							INNER JOIN `client_location_area_info` `clai` ON `clai`.`client_location_area_ID` = `soa`.`client_location_area_ID`

							WHERE `soa`.`service_order_ID` IN ($service_order_ids)

							ORDER BY `soa`.`service_order_ID` ASC
					        ");


$statement->execute();
$statement->bind_result($service_order_id,$client_location_area_ID,$client_location_area_name,$status);

$return["service_order_areas"] = array();

$client_location_area_ids = "";
while($statement->fetch()){

	$service_order_area = array();
	$service_order_area["service_order_ID"] = $service_order_id;    
	$service_order_area["client_location_area_ID"] = $client_location_area_ID;    
	$service_order_area["client_location_area_name"] = utf8_encode($client_location_area_name);    
	$service_order_area["status"] = $status;    
    array_push($return["service_order_areas"], $service_order_area);
	
    // Get client location area IDs, important for;
	$client_location_area_ids .= "'".$client_location_area_ID."',";
	$client_location_area_service_order[$client_location_area_ID] = $service_order_id;


}

/* 
 * Fetch Device Monitoring
 *
 * * * * * * * * * * * * * * * */

//Update device monitoring first
$zero ="0";
foreach($device_monitoring_updates as $d){

	$service_order_id = $d->service_order_id;
	$device_code = $d->device_code;
	$client_location_area_ID = $d->client_location_area_id;
	$timestamp = $d->timestamp;
	$device_condition_ID = $d->device_condition_id;
	$activity_ID = $d->activity_id;
	$photo = $d->image;
	$notes = $d->notes;
	$pests = json_decode($d->pests);

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

	$last_device_monitoring_id = $db->insert_id;

	$statement = $db->prepare("INSERT INTO `device_monitoring_photos` 
							(`device_monitoring_ID`,
							 `filename_link`,
							 `remarks`)
						   VALUES  (?,?,?) ");

	$statement->bind_param('sss',$last_device_monitoring_id,$photo,$notes);
	$statement->execute();


	// print_r($pests);
	foreach($pests as $pest){

		$statement = $db->prepare("INSERT INTO `pest_found` 
							(`service_order_id`,
							 `device_monitoring_ID`,
							 `service_order_area_ID`,
							 `pest_ID`,
							 `number`)
						   VALUES  (?,?,?,?,?) ");

		$statement->bind_param('sssss',$service_order_id,$last_device_monitoring_id,$zero,$pest->pest_ID,$pest->number);
		$statement->execute();

	}

}


$client_location_area_ids = substr($client_location_area_ids, 0,-1);
// echo $client_location_area_ids;

// Fetch all devices to initialize devices with no device monitoring updates
// HUHU TYPO YUNG NASA SCHEMA
$statement = $db->prepare("SELECT `device_code`,
								  `client_location_area_ID`

							FROM `device_identificaiton` 

							WHERE `client_location_area_ID` IN ($client_location_area_ids)

					        ");


$statement->execute();
$statement->bind_result($device_code,$client_location_area_ID);

$device_monitoring = array();

while($statement->fetch()){

	$device_monitoring[$device_code]["device_monitoring_ID"] = "0";    
	$device_monitoring[$device_code]["service_order_ID"] = $client_location_area_service_order[$client_location_area_ID];    
	$device_monitoring[$device_code]["client_location_area_ID"] = $client_location_area_ID;
	$device_monitoring[$device_code]["device_code"] = $device_code;    
	$device_monitoring[$device_code]["device_condition_ID"] = "";    
	$device_monitoring[$device_code]["device_condition"] = "";    
	$device_monitoring[$device_code]["activity_ID"] = "";    
	$device_monitoring[$device_code]["activity"] = "";    
	$device_monitoring[$device_code]["timestamp"] = "";
	$device_monitoring[$device_code]["photo"] = "";
	$device_monitoring[$device_code]["notes"] = "";
	// echo $device_code."<br />";

}

// Special thanks to:
// https://stackoverflow.com/questions/612231/how-can-i-select-rows-with-maxcolumn-value-distinct-by-another-column-in-sql

$statement = $db->prepare("SELECT `dm`.`device_monitoring_ID`,
								  `dm`.`service_order_ID`,
								  `dm`.`client_location_area_ID`,					
								  `dm`.`device_code`,
								  `dm`.`device_condition_ID`,
								  `dc`.`ConditionName`,
								  `dm`.`activity_ID`,
								  `da`.`device_activity_name`,
								  `dm`.`timestamp`,
								  `dp`.`filename_link`,
								  `dp`.`remarks`

							FROM `device_monitoring` `dm`

							LEFT JOIN `device_activity` `da`
							ON `da`.`device_activity_ID` = `dm`.`activity_ID`

							LEFT JOIN `device_condition` `dc`
							ON `dc`.`Condition_ID` = `dm`.`device_condition_ID`

							LEFT JOIN `device_monitoring_photos` `dp`
							ON `dp`.`device_monitoring_ID` = `dm`.`device_monitoring_ID`	

							WHERE `dm`.`service_order_ID` IN ($service_order_ids)

							ORDER BY `timestamp` ASC

					        ");

$statement->execute();
$statement->bind_result($device_monitoring_ID,$service_order_id,$client_location_area_id,$device_code,$device_condition_ID,$device_condition,$activity_ID,$activity,$timestamp,$filename_link,$remarks);

$return["device_monitoring"] = array();


// Re-evaluate this approach, pero for now, this shit works
// Thanks, ORDER BY

while($statement->fetch()){

	// echo $device_code."<br />";
	$device_monitoring[$device_code]["device_monitoring_ID"] = $device_monitoring_ID;    
	$device_monitoring[$device_code]["service_order_ID"] = $service_order_id;    
	$device_monitoring[$device_code]["client_location_area_ID"] = $client_location_area_id;
	$device_monitoring[$device_code]["device_code"] = $device_code;
	
	if($device_condition_ID == 0)
		$device_condition_ID ="";
	if($device_condition == null)
		$device_condition ="";	    
	
	$device_monitoring[$device_code]["device_condition_ID"] = $device_condition_ID;    
	$device_monitoring[$device_code]["device_condition"] = $device_condition; 

	if($activity_ID == 0)
		$activity_ID ="";
	if($activity == null)
		$activity ="";	
	$device_monitoring[$device_code]["activity_ID"] = $activity_ID;    
	$device_monitoring[$device_code]["activity"] = $activity;    

	$device_monitoring[$device_code]["timestamp"] = $timestamp;
	if($filename_link == null)
		$filename_link ="";	
	$device_monitoring[$device_code]["photo"] = $filename_link;
	if($remarks == null)
		$remarks ="";	
	$device_monitoring[$device_code]["notes"] = $remarks;
	// echo $device_code." ".$timestamp."<br />";    
    // array_push($return["device_monitoring"], $device_monitoring);

	// print_r($return["device_monitoring"][$device_code]);
	// echo "<br />";

}

$device_monitoring_ids = "";

foreach ($device_monitoring as $k) {
	array_push($return["device_monitoring"] , $k);
	// print_r($k["device_code"]);
	// echo "<br />";
	$device_monitoring_ids .= "'".$k["device_monitoring_ID"]."',";

}

// Fetch Device Monitoring Pests

$device_monitoring_ids = substr($device_monitoring_ids, 0,-1);
// echo $device_monitoring_ids."<br />";

$statement = $db->prepare("SELECT `pf`.`service_order_ID`,
								  `pf`.`device_monitoring_ID`,					
								  `dm`.`device_code`,
								  `pf`.`pest_id`,
								  `pf`.`number`
								  
							FROM `pest_found` `pf`

							INNER JOIN `device_monitoring` `dm`
							ON `dm`.`device_monitoring_ID` = `pf`.`device_monitoring_ID`

							WHERE `pf`.`device_monitoring_ID` IN ($device_monitoring_ids) 
							-- AND `pf`.`service_order_area_ID` = `0`

							ORDER BY `pf`.`device_monitoring_ID` ASC	

					        ");

$statement->execute();
$statement->bind_result($service_order_ID,$device_monitoring_ID,$device_code,$pest_id,$number);

$return["device_monitoring_pest"] = array();

while($statement->fetch()){


	$device_monitoring_pest = array();
	$device_monitoring_pest["service_order_ID"] = $service_order_id;    
	$device_monitoring_pest["device_monitoring_ID"] = $device_monitoring_ID;    
	$device_monitoring_pest["device_code"] = $device_code;    
	$device_monitoring_pest["pest_id"] = $pest_id;    
	$device_monitoring_pest["number"] = $number;    
	
    array_push($return["device_monitoring_pest"], $device_monitoring_pest);
	
}

/* 
 * Fetch Area Monitoring
 *
 * * * * * * * * * * * * * * * */

// Update first

foreach($area_monitoring_updates as $d){

	// print_r($d);
	// echo "<br />";

	$service_order_ID = $d->service_order_id;
	$client_location_area_ID = $d->client_location_area_id;
	$findings = $d->findings;
	$proposed_action = $d->proposed_action;
	$timestamp = $d->timestamp;

	$statement = $db->prepare("INSERT INTO `area_monitoring` 
							(`service_order_ID`,
							 `client_location_area_ID`,
							 `findings`,
							 `proposed_action`,
							 `timestamp`)
						   VALUES  (?,?,?,?,?) ");

	$statement->bind_param('sssss',$service_order_ID,$client_location_area_ID,$findings,$proposed_action,$timestamp);
	$statement->execute();

}

$statement = $db->prepare("SELECT `service_order_ID`,
								  `client_location_area_ID`,					
								  `findings`,
								  `proposed_action`,
								  `timestamp`
								  
							FROM `area_monitoring` 


							WHERE `service_order_ID` IN ($service_order_ids) 
							-- AND `pf`.`service_order_area_ID` = `0`

							ORDER BY `timestamp` ASC	

					        ");

$statement->execute();
$statement->bind_result($service_order_ID,$client_location_area_ID,$findings,$proposed_action,$timestamp);

$return["area_monitoring"] = array();

while($statement->fetch()){


	$area_monitoring = array();
	$area_monitoring["service_order_ID"] = $service_order_ID;    
	$area_monitoring["client_location_area_ID"] = $client_location_area_ID;    
	$area_monitoring["findings"] = $findings;    
	$area_monitoring["proposed_action"] = $proposed_action;    
	$area_monitoring["timestamp"] = $timestamp;    
	
    array_push($return["area_monitoring"], $area_monitoring);
	
}

/* 
 * Fetch Area Monitoring Pest
 *
 * * * * * * * * * * * * * * * */
// Update first!!!!!

foreach($area_monitoring_pest_updates as $d){

	// print_r($d);
	// echo "<br />";

	$service_order_ID = $d->service_order_id;
	$service_order_area_ID = $d->service_order_area_id;
	$pest_ID = $d->pest_id;
	$number = $d->number;


	$statement = $db->prepare("INSERT INTO `pest_found` 
							(`service_order_ID`,
							 `device_monitoring_ID`,
							 `service_order_area_ID`,
							 `pest_ID`,
							 `number`)
						   VALUES  (?,?,?,?,?) ");

	$statement->bind_param('sssss',$service_order_ID,$zero,$service_order_area_ID,$pest_ID,$number);
	$statement->execute();

}

$statement = $db->prepare("SELECT `service_order_ID`,
								  `service_order_area_ID`,					
								  `pest_ID`,
								  `number`
								  
							FROM `pest_found` 

							WHERE `service_order_ID` IN ($service_order_ids) 
							AND   `device_monitoring_ID` = ? ORDER BY `pest_found_ID` ASC	");
$statement->bind_param("s",$zero);
$statement->execute();
$statement->bind_result($service_order_ID,$client_location_area_ID,$pest_ID,$number);

$return["area_monitoring_pest"] = array();

while($statement->fetch()){


	$area_monitoring_pest = array();
	$area_monitoring_pest["service_order_ID"] = $service_order_ID;    
	$area_monitoring_pest["client_location_area_ID"] = $client_location_area_ID;    
	$area_monitoring_pest["pest_ID"] = $pest_ID;    
	$area_monitoring_pest["number"] = $number;    
	
    array_push($return["area_monitoring_pest"], $area_monitoring_pest);
	
}

echo json_encode($return,JSON_UNESCAPED_UNICODE);

?>

