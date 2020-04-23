<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <!-- TELLS PHONES NOT TO LIE ABOUT THEIR WIDTH -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Jaeger, Becca Lab 08 - Database errors</title>
        <?php include 'header.php'; ?>
    </head>
    <body>
        <form action="" method="post">
            <input type='hidden' name ='action' value='delete'>
            <?php
          
            $prodid = filter_input(INPUT_POST, 'prod_id');
            
            echo "<p>" . "Are you sure you want to delete ID#" . $results['prod_id'] . ": " . $results['prod_name'] . "?" . "</p>";
            ?>
            <input type="hidden" name="prodid" value="<?php echo $results['prod_id']; ?>">
            <input type="submit" id='btnsubmit' class="btn btn-primary" value="Delete">
            <a href="index.php" class="btn btn-primary btn-last">Cancel</a>
        </form>
        <script src="view/styles/bootstrap-4.2.1-dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
