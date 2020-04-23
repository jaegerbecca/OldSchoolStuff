<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <!-- TELLS PHONES NOT TO LIE ABOUT THEIR WIDTH -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Jaeger, Becca Lab 08 - Search Products</title>
        <?php include 'header.php'; ?>
    </head>
    <body>        
        <div class="container">
            <main>
                <div class="row">
                    <div class="col-xs-12">
                        <form action="" method="post" class="form">
                            <input type='hidden' name ='action' value='search'>
                            <div>
                        <label for="searchString">Search Product Records</label>
                        <input type="text" class="form-control" id="searchString" name ='searchString' autofocus="true">
                        <?php
                                           if (!empty($errorR5)) {
                                               echo "<span class='errormsg'>$errorR5</span>";
                                           }
                                           if (!empty($no_rows)) {
                                               echo "<span class='errormsg'>$no_rows</span>";
                                           }
                                           ?>
                            </div>
                        <input type="submit" id='btnSearch' class="btn btn-primary" name='Search' value="Search">
                        <a href="index.php" class="btn btn-primary btn-last">Cancel</a>
                        </form>
                    </div>
                </div>
            </main>
        </div>
        <script src="viewstyles/bootstrap-4.2.1-dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>