<!DOCTYPE html>
<html lang="en">
<body style="background-color: #f5f5f5;">
<link href="../css/datepicker.css" rel="stylesheet">
<script src="../js/bootstrap-datepicker.js"></script>
<script type="text/javascript">
    $(function() {
        $( "#From7" ).datepicker({
            format: "dd-mm-yyyy",
            viewMode: "months",
            minViewMode: "days",
            pickerPosition: "bottom-left"});

        $( "#To7" ).datepicker({
            format: "dd-mm-yyyy",
            viewMode: "months",
            minViewMode: "days",
            pickerPosition: "bottom-left"});
    });
</script>
<div class="container ">

    <form id="Research Experience" action="#" style="width: 100%;">
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="organisation_name">Organisation:</label>
                    <input id="organisation_name" class="form-control" placeholder="">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="position">Position:</label>
                    <input id="position" class="form-control" placeholder="">
                </div>
            </div>
        </div>
          <div class="row">
                     <div class="col-sm-6">
                         <div class="form-group">
                             <label class="text" for="From7">From:</label>
                             <input id="From7" type="text" class="form-control" placeholder="" >
                         </div>
                     </div>
                     <div class="col-sm-6">
                         <div class="form-group">
                             <label class="text" for="To7">To:</label>
                             <input id="To7" type="text" class="form-control" placeholder="" >
                         </div>
                     </div>
         		</div>
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="text" for="sal">Salary/Fellowship/Stipend:</label>
                    <input id="sal" type="text" class="form-control" placeholder="" >
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="work">Nature of Work:</label>
                    <input id="work" class="form-control" placeholder="">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="tenure">Tenure:</label>
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