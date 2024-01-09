<?php
include 'main.php';
include 'contact.php';
include 'admin_p.php';

session_start();
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "conference_system";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Function to handle participant login
function participantLogin($email, $password) {
    global $conn;
    $sql = "SELECT * FROM Participant_userName WHERE Pemail = '$email' AND Ppassword = '$password'";
    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        $_SESSION['participant_email'] = $email;
        return true;
    } else {
        return false;
    }
}

// Function to handle participant logout
function participantLogout() {
    session_unset();
    session_destroy();
}

// Function to handle sending a comment with an attached file
function sendComment($participantEmail, $comment, $fileName) {
    // Your logic to handle file upload (move_uploaded_file, etc.)
    // Save file details in the database along with the comment
}

// Function to display participant information
function displayParticipantInfo($email) {
    global $conn;
    $sql = "SELECT * FROM Conference_participant WHERE Pemail = '$email'";
    $result = $conn->query($sql);
    return ($result->num_rows > 0) ? $result->fetch_assoc() : null;
}

// Function to update participant information
function updateParticipantInfo($email, $newInfo) {
    global $conn;
    // Your logic to update participant information in the database
}

// Function to delete participant information
function deleteParticipantInfo($email) {
    global $conn;
    // Your logic to delete participant information from the database
}



// sendComment("participant@example.com", "This is a comment", "file.txt");

// $participantInfo = displayParticipantInfo("participant@example.com");
// updateParticipantInfo("participant@example.com", ["Pfname" => "Updated Name"]);
// deleteParticipantInfo("participant@example.com");

// Logout participant
// participantLogout();

$conn->close();
?>
