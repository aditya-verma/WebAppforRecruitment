<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/backgrounds.css">
<script src="../jquery/3.3.1/jquery.min.js"></script>
<script src="../jquery/popper.js/1.14.3/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<link href="../css/datepicker.css" rel="stylesheet">
<script src="../js/bootstrap-datepicker.js"></script>
<script type="text/javascript">
    $(function() {
        $( "#From6" ).datepicker({
            format: "dd-mm-yyyy",
            viewMode: "months",
            minViewMode: "days",
            pickerPosition: "bottom-left"});
        $( "#To6" ).datepicker({
            format: "dd-mm-yyyy",
            viewMode: "months",
            minViewMode: "days",
            pickerPosition: "bottom-left"});
    });
</script>
<body>

<div class="container ">
    <form id="Teaching" action="#">
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="organisation_name"><b>A)</b>Organisation:</label>
                    <input id="organisation_name" class="form-control" placeholder="">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="position"><b>B)</b>Position:</label>
                    <input id="position" class="form-control" placeholder="">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="From6"><b>C)</b>From:</label>
                    <input type="text" class="form-control" id="From6" name="DateOfBirth" placeholder="">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="To6"><b>D)</b>To:</label>
                    <input type="text" class="form-control" id="To6" name="DateOfBirth" placeholder="">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="pay_scale"><b>E)</b>Pay Scale with AGP:</label>
                    <input id="pay_scale" class="form-control" placeholder="">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="type_of_employee"><b>F)</b>Type of Employee:</label>
                    <input id="type_of_employee" class="form-control" placeholder="">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-uppercase" for="tenure"><b>G)</b>Nature of Work:</label>
                    <input id="tenure" class="form-control" placeholder="">
                </div>
            </div>
        </div>
        <div class="col-md-12 mb-3" style="margin: 0;text-align: center">
            <button class="btn btn-dark btn-" id="reset"  type="reset">Reset</button>
        </div>
    </form>
</div>
</body>
</html>