<?php

$dsn = 'mysql:host=localhost;dbname=crashcourse';
$username = 'root';
$password = '';

try {
    $pdo = new PDO($dsn, $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->exec('SET NAMES "utf8"');
    echo "<h4>Connection Established to Database.</h4>";
} catch (PDOException $e) {
    $error = 'Unable to connect to the database server.';
    $exceptionError = $e->getMessage();
    include 'view/error.php';
    exit();
}
?>