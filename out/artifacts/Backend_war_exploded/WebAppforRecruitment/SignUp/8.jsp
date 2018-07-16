<!DOCTYPE html>
<html lang="en">

<body style="background-color: #f5f5f5;">
<link href="../css/datepicker.css" rel="stylesheet">
<script src="../js/bootstrap-datepicker.js"></script>
<script type="text/javascript">
    $(function() {
        $( "#From8" ).datepicker({
            format: "dd-mm-yyyy",
            viewMode: "months",
            minViewMode: "days",
            pickerPosition: "bottom-left"});

        $( "#To8" ).datepicker({
            format: "dd-mm-yyyy",
            viewMode: "months",
            minViewMode: "days",
            pickerPosition: "bottom-left"});
    });
</script>
<div class="container ">

    <form id="IndustrialInformation" action="#" style="width: 100%;">
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="organisation_name">Organisation</label>
                    <input id="organisation_name" class="form-control" placeholder="" required>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="position">Position</label>
                    <input id="position" class="form-control" placeholder="" required>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="text" for="type_of_employee">Type of Employee</label>
                    <input id="type_of_employee" class="form-control" placeholder="" required>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="From8">From</label>
                    <input id="From8" type="text" class="form-control" placeholder="DD-MM-YYYY" >
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="To8">To</label>
                    <input id="To8" type="text" class="form-control" placeholder="DD-MM-YYYY" >
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="pay_scale">Pay Scale with AGP</label>
                    <input id="pay_scale" class="form-control" placeholder="" required>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="nature_of_work">Nature of Work</label>
                    <input id="nature_of_work" class="form-control" placeholder="" required>
                </div>
            </div>
        </div>
        <div class="col-md-12 mb-3" style="margin: 0;text-align: center">
            <button class="btn btn-dark btn-" id="reset"  type="reset">ADD</button>
        </div>
    </form>
</div>
</body>
</html>
