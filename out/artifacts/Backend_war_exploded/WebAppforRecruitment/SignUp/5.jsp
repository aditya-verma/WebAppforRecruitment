<!DOCTYPE html>
<html lang="en">

<body style="background-color: #f5f5f5;">
<link href="../css/datepicker.css" rel="stylesheet">
<script src="../js/bootstrap-datepicker.js"></script>
<script type="text/javascript">
    $(function() {
        $( "#From" ).datepicker({
            format: "dd-mm-yyyy",
            viewMode: "months",
            minViewMode: "days",
            pickerPosition: "bottom-left"});

        $( "#To" ).datepicker({
            format: "dd-mm-yyyy",
            viewMode: "months",
            minViewMode: "days",
            pickerPosition: "bottom-left"});
    });
</script>

<div class="container ">
    <form id="PresentEmployer" >
        <div class="row">
            <div class="col-sm-12">
                <label class="text" for="organisation_name"><b>A)</b>Organisation:</label>
                <input id="organisation_name" class="form-control" placeholder="" required>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="position"><b>B)</b>Position:</label>
                    <input id="position" class="form-control" placeholder="" required>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="type_of_employee"><b>C)</b>Type of Employee:</label>
                    <input id="type_of_employee" class="form-control" placeholder="" required>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="From"><b>D)</b>From:</label>
                    <input id="From" type="text" class="form-control" placeholder="" required>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="To"><b>E)</b>To:</label>
                    <input id="To" type="text" class="form-control" placeholder="" required>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="pay"><b>F)</b>Pay in Pay Band:</label>
                    <input id="pay" class="form-control" placeholder="" required>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="agp"><b>G)</b>AGP/GP:</label>
                    <input id="agp" class="form-control" placeholder=""required>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="basic_pay"><b>H)</b>Basic Pay:</label>
                    <input id="basic_pay" class="form-control" placeholder="" required>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="work"><b>I)</b>Nature of Work:</label>
                    <input id="work" class="form-control" placeholder=""required>
                </div>
            </div>
        </div>
        <div class="col-md-12 mb-3" style="margin: 0;text-align: center">
            <button class="btn btn-dark btn-" id="reset"  type="reset">Reset</button>
        </div>
    </form>
</div>
<!----------This footer part-------------->
</body>
</html>