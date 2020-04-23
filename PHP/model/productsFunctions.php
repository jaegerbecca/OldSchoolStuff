<?php
try{
function select_all() {
global $pdo;
$SQLselect = 'select prod_id,vend_id,prod_name,prod_price,prod_desc from products';
$statement = $pdo->prepare($SQLselect);
$statement->execute();
$results = $statement->fetchAll();
$statement->closeCursor();
foreach ($results as $one_row) {
$products[] = array('prod_id' => $one_row['prod_id'], 'vend_id' => $one_row['vend_id'], 'prod_name' => $one_row['prod_name'], 'prod_price' => $one_row['prod_price'], 'prod_desc' => $one_row['prod_desc']);
}
return $products;
}

function select_one($prodid) {
global $pdo;
$sqlSELECT_ID = 'SELECT prod_id, vend_id, prod_name, prod_price, prod_desc FROM products WHERE prod_id=:prodid';
$statement = $pdo->prepare($sqlSELECT_ID);
$statement->bindValue(':prodid', $prodid);
$statement->execute();
$results = $statement->fetch();
return $results;
}

function delete_product() {
global $pdo;

$prodid = filter_input(INPUT_POST, 'prodid');

if ($prodid != false) {
$query = 'DELETE FROM products WHERE prod_id = :prodid';
$statement = $pdo->prepare($query);
$statement->bindValue(':prodid', $prodid);
$success = $statement->execute();
$statement->closeCursor();
}
}

function insert_product() {
global $pdo;
$prodid = filter_input(INPUT_POST, 'prodid');
$vendid = filter_input(INPUT_POST, 'vendid', FILTER_VALIDATE_INT);
$prodname = filter_input(INPUT_POST, 'prodname');
$prodprice = filter_input(INPUT_POST, 'prodprice', FILTER_VALIDATE_FLOAT, 2);
$proddesc = filter_input(INPUT_POST, 'proddesc');

$sql = 'INSERT INTO products SET prod_id=:prodid,vend_id=:vendid,prod_name=:prodname,prod_price=:prodprice,prod_desc=:proddesc';
$s = $pdo->prepare($sql);
$s->bindValue(':prodid', $prodid);
$s->bindValue(':vendid', $vendid);
$s->bindValue(':prodname', $prodname);
$s->bindValue(':prodprice', $prodprice);
$s->bindValue(':proddesc', $proddesc);
$s->execute();
}

function update_product() {
global $pdo;
$prodid = filter_input(INPUT_POST, 'prodid');
$vendid = filter_input(INPUT_POST, 'vendid', FILTER_VALIDATE_INT);
$prodname = filter_input(INPUT_POST, 'prodname');
$prodprice = filter_input(INPUT_POST, 'prodprice', FILTER_VALIDATE_FLOAT, 2);
$proddesc = filter_input(INPUT_POST, 'proddesc');

$sql = 'UPDATE products SET vend_id=:vendid,prod_name=:prodname,prod_price=:prodprice,prod_desc=:proddesc WHERE prod_id=:prodid';
$s = $pdo->prepare($sql);
$s->bindValue(':prodid', $prodid);
$s->bindValue(':vendid', $vendid);
$s->bindValue(':prodname', $prodname);
$s->bindValue(':prodprice', $prodprice);
$s->bindValue(':proddesc', $proddesc);
$s->execute();
}

} catch (PDOException $e) {
$error = "Something went wrong: ";
$exceptionError = $e->getMessage();
include 'view/error.php';
exit();
}
?>