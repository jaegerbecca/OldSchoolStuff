<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <!-- TELLS PHONES NOT TO LIE ABOUT THEIR WIDTH -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Jaeger, Becca Lab 08 - Aggregate Products By Vendor</title>
        <?php include 'header.php'; ?>
    </head>
    <body>        
        <div class="container">
            <main>
                <div class="row">
                    <div class="col-xs-12">
                        <form action="" method="post" class="form">
                            <input type='hidden' name ='action' value='aggregate'>
                            <div>
                                <div class="form-group">
                                    <label for="vendid">Vendor:</label>
                                    <select class="form-control"  id="vendid" name='vendid'>
                                        <?php foreach ($vendors as $vendor): ?>
                                            <option value='<?php echo($vendor['vend_id']); ?>'> <?php echo ($vendor['vend_name']); ?> </option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <fieldset>
                                    <legend>Aggregate Function:</legend>
                                    <div class="form-check form-check-inline">
                                        <input type="radio" class="form-check-input" name="aggregate" id="Average" value="Average" checked> 
                                        <label class="form-check-label">Average
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input type="radio" name="aggregate" id="Count" value="Count"> 
                                        <label class="form-check-label">Count
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input type="radio" name="aggregate" id="Maximum" value="Maximum"> 
                                        <label class="form-check-label">Maximum
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input type="radio" name="aggregate" id="Minimum" value="Minimum"> 
                                        <label class="form-check-label">Minimum
                                    </div>
                                </fieldset>
                                <input type="submit" id='btnCalculate' class="btn btn-primary" name='Calculate' value="Calculate">
                                <a href="index.php" class="btn btn-primary btn-last">Cancel</a>
                        </form>
                    </div>
                </div>
            </main>
        </div>
        <script src="view/styles/bootstrap-4.2.1-dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>