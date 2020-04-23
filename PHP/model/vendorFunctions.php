<?php
try{
function get_vendor(){
global $pdo; 
$SQLselectVendor='select vend_id, vend_name from vendors ORDER BY vend_name';
$statementVendor=$pdo->prepare($SQLselectVendor);
$statementVendor->execute();
$resultVendor=$statementVendor->fetchAll();
$statementVendor->closeCursor();
foreach ($resultVendor as $row){
    $vendors[]=array('vend_id'=>$row['vend_id'], 'vend_name'=>$row['vend_name']);
}
return $vendors;
}

function one_vendor($vendid) {
global $pdo;
$sqlSELECT_ID = 'SELECT vend_id, vend_name FROM vendors WHERE vend_id=:vendid';
$statement = $pdo->prepare($sqlSELECT_ID);
$statement->bindValue(':vendid', $vendid);
$statement->execute();
$results = $statement->fetch();
return $results;
}

} catch (PDOException $e) {
$error = "Something went wrong: ";
$exceptionError = $e->getMessage();
include 'view/error.php';
exit();
}

?>