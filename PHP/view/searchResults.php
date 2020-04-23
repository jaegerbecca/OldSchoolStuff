<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <!-- TELLS PHONES NOT TO LIE ABOUT THEIR WIDTH -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Jaeger, Becca Lab 08 - Search Results</title>
        <?php include 'header.php'; ?>
    </head>
    <body>        
        <div class="container">
            <main>
                <div class="row">
                    <div class="col-xs-12">
                        <table class="table, stripes">
                            <tr>
                                <th>Vendor</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Product Notes</th>
                            </tr>
                            <?php foreach ($results as $row): ?>
                                <tr>
                                    <td><?php echo $row['vend_name']; ?></td>
                                    <td><?php echo $row['prod_name']; ?></td>
                                    <td><?php echo $row['prod_price']; ?></td>
                                    <td class="last"><?php echo $row['note_text']; ?></td>
                                </tr>
                                <?php endforeach; ?>
                        </table>
                    </div>
                </div>
                <a href="?action=list_records" class="btn btn-primary btn-last">All Product Records</a>
                <a href="?action=showAggregateForm" class="btn btn-primary btn-last">Aggregate Product Price by Vendor</a>
            </main>
        </div>
        <script src="view/styles/bootstrap-4.2.1-dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>