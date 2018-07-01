<!DOCTYPE html>
<html lang="en" style="background-color: #f5f5f5">
<head>
    <style>
        input{
            padding: 5px;
        }
    </style>
</head>
<body >
<form>
    <table class="table table-responsive-xl table-bordered" id="EducationalInformation-table"><tr>
            <td><input type="text" placeholder="Enter Qualification" name="qualification"></td>
            <td><input type="text" placeholder="Enter Degree" name="degree"></td>
            <td><input type="text" placeholder="Enter Discipline" name="discipline"></td>
            <td><input type="text" placeholder="Enter Institute" name="institute"></td>
            <td><input type="text" placeholder="Enter Board/University" name="board"></td>
            <td><input type="text" placeholder="Enter Date" nme="date"></td>
            <td><input type="text" placeholder="Enter Division" name="div"></td>
            <td><input type="text" placeholder="Enter %age/CGPA" name="CGPA"></td>
        </tr>
    </table>
    <div class="col-md-12 mb-3" style="margin: 0;text-align: center">
        <button class="btn btn-dark btn-" id="reset"  type="reset">Reset</button>
    </div>
</form>
<div class="col-md-12 " style="margin: 0;text-align: center">
    <button class="btn btn-dark " id="btn-AddEduInfo"  onclick="addEduInfo()">Add New Row</button>
</div>
</body>
<script>
    function addEduInfo() {
        $("#EducationalInformation-table").append("<tr><td><input type=\"text\" placeholder=\"Enter Qualification\" name=\"qualification\"></td><td><input type=\"text\" placeholder=\"Enter Degree\" name=\"degree\"></td><td><input type=\"text\" placeholder=\"Enter Discipline\" name=\"discipline\"></td><td><input type=\"text\" placeholder=\"Enter Institute\" name=\"institute\"></td><td><input type=\"text\" placeholder=\"Enter Board/University\" name=\"board\"></td><td><input type=\"text\" placeholder=\"Enter Date\" name=\"date\"></td><td><input type=\"text\" placeholder=\"Enter Division\" name=\"div\"></td><td><input type=\"text\" placeholder=\"Enter %age/CGPA\" name=\"CGPA\"></td></tr>");
    }
</script>
</body>
</html>