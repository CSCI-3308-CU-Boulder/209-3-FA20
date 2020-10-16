<?php
$hostname = "localhost";
$dbname = "info_db";
$username = "maclong";
$pass = "Mlong89_";

// Create connection
$db_conn = pg_connect(" host = $hostname dbname = $dbname user = $username password = $pass ");

if (isset($_POST['submit'])) {
    $fname = $_POST['firstname'];
    $lname = $_POST['lastname'];
    $uname = $_POST['firstname'];
    $email = $_POST['firstname'];

    $query = pg_query($db_conn, "INSERT  INTO user_info(firstname, lastname, username, email) VALUES ('$fname','$lname', '$uname', '$email');");
    if ( $query ) {
        echo  "Record Successfully Added!";
    }
}
?>
