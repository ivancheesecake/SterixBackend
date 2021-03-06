<?php

$post = json_decode(file_get_contents("php://input"), true);

$username = $post['username'];
// $username = "ivan";
$password = $post['password'];
// $password = "ivan";


// $db = new mysqli('localhost', 'root', '', 'sterix');
$db = new mysqli('sterixdb.sterix.online', 'sterixonis', '5t3r1x0nl1n3', 'sterixdb');

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}

$statement = $db->prepare("SELECT `user_info`.`user_ID`, `password` , `salt` FROM `user_info` LEFT JOIN `user_access` ON `user_access`.`user_ID` = `user_info`.`user_ID` 
								WHERE `user_info`.`username` = ? AND `user_access`.`user_roles_ID` = 3 ");
$statement->bind_param('s',$username);
$statement->execute();
$statement->bind_result($returned_userID, $returned_password, $returned_salt);

$results = array();

$return['success'] = "false";
$return['username'] = "";

while($statement->fetch()){
    
	if(base64_encode(sha1($password . $returned_salt, true) . $returned_salt) == $returned_password){
		
		$return['success'] = "true";
		$return['username'] = $username;
		$return['user_id'] = $returned_userID;

	}
    
}

echo json_encode($return); 

?>

