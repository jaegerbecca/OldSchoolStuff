<?php

require_once 'model/dbconnect.php';
require_once 'model/productsFunctions.php';
require_once 'model/vendorFunctions.php';
require_once 'model/storedProcedureFunctions.php';

$action = filter_input(INPUT_POST, 'action');

if ($action == NULL) {
    $action = filter_input(INPUT_GET, 'action');
    if ($action == NULL) {
        $action = 'list_records';
    }
}

if ($action == 'list_records') {
    $products = select_all();
    include('view/listAllProducts.php');
    exit();
} elseif ($action == 'showInsertForm') {
    $vendors = get_vendor();
    include('view/insert_form.php');
    exit();
} elseif ($action == 'showUpdateForm') {
    $prodid = filter_input(INPUT_POST, 'prod_id');
    $vendors = get_vendor();
    $results = select_one($prodid);
    include('view/update_form.php');
    exit();
} elseif ($action == 'deleteConfirm') {
    $prodid = filter_input(INPUT_POST, 'prod_id');
    $results = select_one($prodid);
    include('view/delete_confirmation.php');
    exit();
} elseif ($action == 'delete') {
    $prodid = filter_input(INPUT_POST, 'prod_id');
    delete_product();
    header('Location:  .');
} elseif ($action == 'insert') {
    $vendors = get_vendor();
    include('view/validForm.php');
    if ((isset($errorR1)) or ( isset($errorR2)) or ( isset($errorR3))or ( isset($errorR4)) or ( isset($errorFloat)) or ( isset($errorNeg)) or ( isset($errorL10)) or ( isset($errorL255)) or ( isset($errorL10)) or ( isset($errorInt)) or ( isset($errorTH)) or ( isset($errorTL))) {
        include('view/insert_form.php');
        exit();
    } else {
        insert_product();
        header('Location:  .');
    };
} elseif ($action == 'update') {
    $vendors = get_vendor();
    $prodid = filter_input(INPUT_POST, 'prod_id');
    $results = select_one($prodid);
    include('view/validForm.php');
    if ((isset($errorR1)) or ( isset($errorR2)) or ( isset($errorR3))or ( isset($errorR4)) or ( isset($errorFloat)) or ( isset($errorNeg)) or ( isset($errorL10)) or ( isset($errorL255)) or ( isset($errorL10)) or ( isset($errorInt)) or ( isset($errorTH)) or ( isset($errorTL))) {
        include('view/update_form.php');
        exit();
    } else {
        update_product();
        header('Location:  .');
    };
} elseif ($action == 'showSearchForm') {
    include 'view/searchProducts.php';
    exit();
} elseif ($action == 'showAggregateForm') {
    $vendors = get_vendor();
    include 'view/aggregateByVendor.php';
    exit();
} elseif ($action == 'search') {
    $searchString = filter_input(INPUT_POST, 'searchString');
    include 'view/validForm.php';
    if (isset($errorR5)) {
        include('view/searchProducts.php');
    }else{
        $results = searchProd($searchString);
        if ($results == NULL){
            $no_rows = 'There were no products containing that sequence of characters.';
            include 'view/searchProducts.php';
        }else{ 
        include 'view/searchResults.php';
        }
    };
    exit();
} elseif ($action == 'aggregate') {
    $aggregate = filter_input(INPUT_POST, 'aggregate');
    $vendid = filter_input(INPUT_POST, 'vendid');
    $vend = one_vendor($vendid);
    $agg = getAggregates($vendid, $aggregate);
    include 'view/aggResults.php';
    exit();
}
?>