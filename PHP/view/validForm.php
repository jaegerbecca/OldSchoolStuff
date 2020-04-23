<?php

$prodid = filter_input(INPUT_POST, 'prodid');
$vendid = filter_input(INPUT_POST, 'vendid', FILTER_VALIDATE_INT);
$prodname = filter_input(INPUT_POST, 'prodname');
$prodprice = filter_input(INPUT_POST, 'prodprice', FILTER_VALIDATE_FLOAT,2);
$proddesc = filter_input(INPUT_POST, 'proddesc');
$searchString = filter_input(INPUT_POST, 'searchString');

if ($prodid == "") {
    $errorR1 = "Required. ";
}
if (strlen($prodid) > 10) {
    $errorL10 = "Product ID must be 10 characters or less. ";
    $prodid = "";
}
if ($vendid == "error") {
    $errorR2 = "Required. ";
}
if ($vendid === false) {
    $errorInt = "Vendor ID number must be a valid, whole number. ";
}
if ($prodname === "") {
    $errorR3 = "Required. ";
}
if (mb_strlen($prodname) > 255) {
    $errorL255 = "Product name must be 255 characters or less. ";
    $prodname = "";
}
if ($prodprice === "") {
    $errorR4 = "Required. ";
}
if ($prodprice === false) {
    $errorFloat = "Product price must be a valid number. ";
}
if ($prodprice <= 0) {
    $errorNeg = "Product price must be greater than zero. ";
}
if ($prodprice > 999999.99){
    $errorTH = "Product price must be 999999.99 or less";
}
if (strlen($proddesc) > 65535){
    $errorTL = "Product description must be 65,535 characters or less";
}
if ($searchString === "") {
    $errorR5 = "Search string is required.";
}

?>