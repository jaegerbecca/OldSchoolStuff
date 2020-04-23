<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <!-- TELLS PHONES NOT TO LIE ABOUT THEIR WIDTH -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Jaeger, Becca Lab 08 - Aggregate Results</title>
        <?php include 'header.php'; ?>
    </head>
    <body>        
        <div class="container">
            <main>
                <div class="row">
                    <div class="col-xs-12">
                        <?php 
                            $vendid = filter_input(INPUT_POST, 'vend_id');
                        
                        echo "The " . $aggregate . " of the product price for " . $vend['vend_name'] . " is :" . $agg; ?>
                    </div>
                </div>
                <a href="?action=list_records" class="btn btn-primary btn-last">All Product Records</a>
                <a href="?action=showSearchForm" class="btn btn-primary btn-last">Search Products</a>
            </main>
        </div>
        <script src="view/styles/bootstrap-4.2.1-dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>