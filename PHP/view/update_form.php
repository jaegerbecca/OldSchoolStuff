<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <!-- TELLS PHONES NOT TO LIE ABOUT THEIR WIDTH -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Jaeger, Becca Lab 08 - Department Table</title>
        <?php include 'header.php'; ?>
    </head>
    <body>
        <?php $prodid = filter_input(INPUT_POST, 'prod_id'); ?>
        <div class="container">
            <main>
                <div class="row">
                    <div class="col-xs-12">
                        <form action="" method="post" class="form">
                            <input type='hidden' name ='action' value='update'>
                            <input type="hidden" name="prodid" value="<?php echo $results['prod_id']; ?>">
                            <fieldset>
                                <legend><h2>Product Record Information: </h2></legend>
                                <div class="form-group">
                                    <label for="vendid">Vendor:</label>
                                    <select class="form-control"  id="vendid" name='vendid'>
                                        <?php foreach ($vendors as $vendor): ?>
                                            <option value='<?php echo($vendor['vend_id']); ?>' <?php if (isset($vendid) && $vendid != "error" && $vendor['vend_id']==$vendid) {
                                            echo 'selected';
                                        }
//                                        if (!isset($vendid) OR $vendid == "error") {
//                                            if ($vendor['vend_id']==$results['vend_id']){
//                                            echo "selected";}
//                                        } ?>><?php echo ($vendor['vend_name']); ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                    <?php
                                    if (!empty($errorR2)) {
                                        echo "<span class='errormsg'>$errorR2</span>";
                                    }
                                    if (!empty($errorInt)) {
                                        echo "<span class='errormsg'>$errorInt</span>";
                                    }
                                    ?>
                                </div>
                                <div class="form-group">
                                    <label for="prodname">Product Name:</label>
                                    <textarea class="form-control"  id="prodname" name='prodname'><?php
                                        if (!isset($prodname) OR $prodname == "") {
                                            echo htmlspecialchars($results['prod_name']);
                                        }
                                        if (isset($prodname) && $prodname != "") {
                                            echo htmlspecialchars($prodname);
                                        }
                                        ?></textarea>
                                    <?php
                                    if (!empty($errorR3)) {
                                        echo "<span class='errormsg'>$errorR3</span>";
                                    }
                                    if (!empty($errorL255)) {
                                        echo "<span class='errormsg'>$errorL255</span>";
                                    }
                                    ?>
                                </div>
                                <div class="form-group">
                                    <label for="prodprice">Price:</label>
                                    <input type="text" class="form-control" id="prodprice" name='prodprice' value="<?php
                                    if (!isset($prodprice) OR $prodprice == "") {
                                        echo htmlspecialchars($results['prod_price']);
                                    }
                                    if (isset($prodprice) && $prodprice != "") {
                                        echo htmlspecialchars($prodprice);
                                    }
                                    ?>">
                                           <?php
                                           if (!empty($errorR4)) {
                                               echo "<span class='errormsg'>$errorR4</span>";
                                           }
                                           if (!empty($errorFloat)) {
                                               echo "<span class='errormsg'>$errorFloat</span>";
                                           }
                                           if (!empty($errorNeg)) {
                                               echo "<span class='errormsg'>$errorNeg</span>";
                                           }
                                           ?>
                                </div>
                                <div class="form-group">
                                    <label for="proddesc">Product Description:</label>
                                    <textarea class="form-control"  id="proddesc" name='proddesc'><?php
                                        if (!isset($proddesc) OR $proddesc == "") {
                                            echo htmlspecialchars($results['prod_desc']);
                                        }
                                        if (isset($proddesc) && $proddesc != "") {
                                            echo htmlspecialchars($proddesc);
                                        }
                                        ?></textarea>
                                </div>
                                <input type="submit" id='btnUpdate' class="btn btn-primary" name='Update' value="Update">
                                <a href="index.php" class="btn btn-primary btn-last">Cancel</a>
                            </fieldset>
                        </form>
                    </div>
                </div>
        </div>
    </main>
    <script src="view/styles/bootstrap-4.2.1-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>