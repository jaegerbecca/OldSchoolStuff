<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <!-- TELLS PHONES NOT TO LIE ABOUT THEIR WIDTH -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Jaeger, Becca Lab 08 - Products Table</title>
        <?php include 'header.php'; ?>
    </head>
    <body>        
        <div class="container">
            <main>
                <div class="row">
                    <div class="col-xs-12">
                        <table class="table, stripes">
                            <tr>
                                <th>Product ID</th>
                                <th>Vendor ID</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Description</th>
                                <th></th>
                                <th></th>
                            </tr>
                            <?php foreach ($products as $one_row): ?>
                                <tr>
                                    <td><?php echo $one_row['prod_id']; ?></td>
                                    <td><?php echo $one_row['vend_id']; ?></td>
                                    <td><?php echo $one_row['prod_name']; ?></td>
                                    <td><?php echo $one_row['prod_price']; ?></td>
                                    <td class="last"><?php echo $one_row['prod_desc']; ?></td>
                                    <td>
                                        <form action="" method="post">
                                            <input type='hidden' name ='action' value='deleteConfirm'>
                                            <input type="hidden" name="prod_id" value="<?php echo $one_row['prod_id']; ?>">
                                            <input type="submit" class="btn-secondary" value="Delete" name="btnDelete">
                                        </form>
                                    </td>
                                     <td>
                                        <form action="" method="post">
                                            <input type='hidden' name ='action' value='showUpdateForm'>
                                            <input type="hidden" name="prod_id" value="<?php echo $one_row['prod_id']; ?>">
                                            <input type="submit" class="btn-secondary" value="Update" name="btnUpdate">
                                        </form>
                                    </td>
                                </tr>
                                <?php endforeach; ?>
                        </table>
                    </div>
                </div>
                <a href="?action=showInsertForm" class="btn btn-primary btn-last">Insert a New Product Record</a>
                <a href="?action=showSearchForm" class="btn btn-primary btn-last">Search Product Records</a>
                <a href="?action=showAggregateForm" class="btn btn-primary btn-last">Aggregate Product Price by Vendor</a>
            </main>
        </div>
        <script src="view/styles/bootstrap-4.2.1-dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
