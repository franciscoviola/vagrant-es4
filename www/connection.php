<?php
$servername = "10.10.20.15";
$username = "vagrant";
$password = "vagrantpass";

$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
?>