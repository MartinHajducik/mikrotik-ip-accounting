<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
 
<?php
$servername = "localhost";
$username = "user";
$password = "pass";
$dbname = "databasename";
 
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
 
$sql = "select upload.src_address_ipv4,SUBSTRING_INDEX(upload.src_address_ipv4,'.',-1),TRUNCATE(upload.MEGABYTES,1) as 'UP',TRUNCATE(download.MEGABYTES,1) as 'DOWN' from (SELECT `src_address_ipv4`, sum(bytes*0.000001) MEGABYTES FROM `collected_data` WHERE `src_address_ipv4` like '10.93.101%' group by src_address_ipv4 order by src_address_ipv4 asc) upload,(SELECT `dst_address_ipv4`, sum(bytes*0.000001) MEGABYTES FROM `collected_data` WHERE `dst_address_ipv4` like '10.93.101%' group by dst_address_ipv4 order by dst_address_ipv4 asc) download where upload.src_address_ipv4 = download.dst_address_ipv4 order by LPAD(lower(SUBSTRING_INDEX(upload.src_address_ipv4,'.',-1)), 10,0) ASC";
 
 
if ($result->num_rows > 0) {
    echo "<div class='container'><table class='table'><thead><tr><th>IP Address</th><th>Upload</th><th>Download</th></tr></thead>";
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "<tbody><tr class='info'><td>".$row["src_address_ipv4"]."</td><td>".$row["UP"]." MB</td><td>".$row["DOWN"]." MB</td></tr></tbody>";
    }
    echo "</table></div>";
} else {
    echo "0 results";
}
$conn->close();
?>
