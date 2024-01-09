<?php
include 'contact.php';
include 'particioant_p.php';
include 'main.php';

// Assuming you have a valid database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "participant_userName";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Function to add a participant
function addParticipant($name, $email, $password) {
    global $conn;
    $sql = "INSERT INTO Conference_participant (Pfname, Pemail, Ppassword) VALUES ('$name', '$email', '$password')";
    return $conn->query($sql);
}

// Function to delete a participant
function deleteParticipant($pid) {
    global $conn;
    $sql = "DELETE FROM Conference_participant WHERE Pid = $pid";
    return $conn->query($sql);
}

// Function to update participant information
function updateParticipant($pid, $name, $email, $password) {
    global $conn;
    $sql = "UPDATE Conference_participant SET Pfname = '$name', Pemail = '$email', Ppassword = '$password' WHERE Pid = $pid";
    return $conn->query($sql);
}

// Function to search for a participant
function searchParticipant($name) {
    global $conn;
    $sql = "SELECT * FROM Conference_participant WHERE Pfname LIKE '%$name%'";
    $result = $conn->query($sql);
    return ($result->num_rows > 0) ? $result->fetch_assoc() : null;
}

// Function to display all participants
function displayAllParticipants() {
    global $conn;
    $sql = "SELECT * FROM Conference_participant";
    $result = $conn->query($sql);
    $participants = [];

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $participants[] = $row;
        }
    }

    return $participants;
}

// Example usage:
// $result = addParticipant("John Doe", "john@example.com", "password123");
// $result = deleteParticipant(1);
// $result = updateParticipant(2, "Updated Name", "updated@example.com", "updatedpassword");
// $result = searchParticipant("John");
// $participants = displayAllParticipants();

// Close the connection
$conn->close();
?>
