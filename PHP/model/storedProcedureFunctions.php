<?php

try {

    function searchProd($searchString) {
        global $pdo;
        $sql = 'CALL searchProduct(:searchString)';
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':searchString', $searchString, PDO::PARAM_STR);
        $stmt->execute();
        $result = $stmt->fetchAll();
        $stmt->closeCursor();

        return $result;
    }

    function getAggregates($vendid, $aggregate) {
        global $pdo;
        $sql = 'CALL aggProdPrice(:vendid, :aggregate, @result)';
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':vendid', $vendid, PDO::PARAM_INT);
        $stmt->bindParam(':aggregate', $aggregate, PDO::PARAM_STR);
        $stmt->execute();
        $stmt->closeCursor();
        $row = $pdo->query("SELECT @result AS Result")->fetch(PDO::FETCH_ASSOC);
        if ($row) {
            return $row !== false ? $row['Result'] : 'Vendor not found';
        }
    }

} catch (PDOException $e) {
    $error = "Something went wrong: ";
    $exceptionError = $e->getMessage();
    include 'view/error.php';
    exit();
}
?>