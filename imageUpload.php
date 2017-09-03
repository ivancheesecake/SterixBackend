<?php

$post = json_decode(file_get_contents("php://input"), true);

// Get image string posted from Android App
$base=$post['encoded'];
// // Get file name posted from Android App
$filename = $post['filename'];
// Decode Image
$binary=base64_decode($base);
header('Content-Type: bitmap; charset=utf-8');
// Images will be saved under 'www/imgupload/uplodedimages' folder
$file = fopen('uploadedimages/'.$filename, 'wb');
// Create File
fwrite($file, $binary);
fclose($file);
// echo 'Image upload complete, Please check your php file directory';

$return["sucess"] = "true";
echo json_encode($return,JSON_UNESCAPED_UNICODE);



?>