<?php

$post = json_decode(file_get_contents("php://input"), true);

 $username = $post['username'];
// $username = "ivancheesecake";
$password = $post['password'];
// $password = "iheartmacy";

$db = new mysqli('localhost', 'root', '', 'sterix');

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}

$statement = $db->prepare("SELECT `username` FROM `user_credentials` WHERE `username` = ? AND `password` = ?");
$statement->bind_param('ss',$username,$password);
$statement->execute();
$statement->bind_result($returned_username);

$results = array();

while($statement->fetch()){
    array_push($results,$returned_username);
}

if(sizeof($results) > 0){
	$return['success'] = "true";
	$return['username'] = $results[0];
}

else{ 
	$return['success'] = "false";
	$return['username'] = "";
}

echo json_encode($return); 

?>

