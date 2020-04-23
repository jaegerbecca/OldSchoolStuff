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
        <h1>Something went wrong.</h1>
        <ul class="errormsg">
            <?php
            echo "<li>" . $error . "</li>";
            echo "<li>" . $exceptionError . "</li>";
            ?>
        </ul>
        <script src="view/styles/bootstrap-4.2.1-dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>