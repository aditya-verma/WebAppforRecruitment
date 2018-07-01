<!DOCTYPE html>
<body style="background-color: #f5f5f5;">
<!------------This is header part------------->
<form>
    <table class="table table-responsive-xl table-bordered" id="PhDInformation-table"><tr>
        <td><input type="text" placeholder="Enter Status" name="status"></td>
        <td><input type="text" placeholder="Enter Title" name="title"></td>
        <td><input type="text" placeholder="Enter Institute/University" name="institute"></td>
        <td><input type="date" placeholder="Enter Date of Award" name="date"></td>
    </tr>
    </table>
    <div class="col-md-12 mb-3" style="margin: 0;text-align: center">
        <button class="btn btn-dark btn-" id="reset"  type="reset">Reset</button>
    </div>
</form>
    <div class="col-md-12 " style="margin: 0;text-align: center">
        <button class="btn btn-dark " id="btn-addPhdInfo"  onclick="addPhDInfo()">Add New Row</button>
    </div>
</body>
<script>
    function addPhDInfo() {
        $("#PhDInformation-table").append("<tr><td><input type=\"text\" placeholder=\"Enter Status\" name=\"status\"></td><td><input type=\"text\" placeholder=\"Enter Title\" name=\"title\"></td><td><input type=\"text\" placeholder=\"Enter Institute/University\" name=\"institute\"></td><td><input type=\"date\" placeholder=\"Enter Date of Award\" name=\"date\"></td>></td></tr>");
    }
</script>
</body>