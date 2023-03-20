<?php
$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '';
$dbname = 'milit_transfer';

$con =new mysqli($dbhost, $dbuser, $dbpass, $dbname);
if (!$con)
{
    die('Could not connect : ' . mysqli_error($con));
}
// else
// {
//     echo "Successfully Connected";
// }
?>