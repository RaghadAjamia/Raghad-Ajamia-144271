<?php
include 'admin_p.php';
include 'participant_p.php';
include 'Contact.php';

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "participant_userName";

$conn = new mysqli($servername, $username, $password, $dbname);

// Get info from HTML
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST["email"];
    $password = $_POST["password"];
    $loginType = $_POST["loginType"];
    $login=$_POST["login"];

}

if (empty($email) || empty($password) || empty($loginType)) {
echo("some thing went wrong!");
    header("Location: login.html"); 
    exit();
}


// Check if a MySQL database connection is valid
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Regular expressions
$password_regexp = "/^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6}$/";
$email_regexp = "/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/";

if (preg_match($password_regexp, $password)) {
    echo "Password is valid!";
} else {
    echo "Password is invalid!";
}

if (preg_match($email_regexp, $email)) {
    echo "Email is valid!";
} else {
    echo "Email is invalid!";
}

$role = "admin";
if ($loginType === "admin") {
    header("Location: admin_p.php");
    exit();
} elseif ($loginType === "participant") {
    header("Location: participant_p.php");
    exit();
}

// Close the database connection
$conn->close();
?>
