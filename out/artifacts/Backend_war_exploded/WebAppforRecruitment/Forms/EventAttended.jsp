<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 7/14/2018
  Time: 4:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Intellectual Property Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../jquery/3.3.1/jquery.min.js"></script>
    <script src="../jquery/popper.js/1.14.3/popper.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <link href="../css/datepicker.css" rel="stylesheet">
    <script src="../js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
        $(function() {
            $( "#Event_Attended_From" ).datepicker({
                format: "dd-mm-yyyy",
                viewMode: "months",
                minViewMode: "date",
                pickerPosition: "bottom-left"});
            $( "#Event_Attended_To" ).datepicker({
                format: "dd-mm-yyyy",
                viewMode: "months",
                minViewMode: "date",
                pickerPosition: "bottom-left"});
        });
    </script>
    <style>
        body {

            background-color: #f5f5f5;
        }


    </style>
</head>
<body>
<div class="container">
    <form id="EventAttended" action="" method="post">
        <div class="row " >
            <div class="col-sm-3" >
                <p >Type</p>
            </div>
            <div class="col-sm-8">
                <div class="form-check ">
                    <input class="form-check-input" type="radio" value="Conference" name="Attended" id="Attended_Int_Conference">
                    <label class="form-check-label" for="Attended_Int_Conference"> International Conference</label>
                </div>
                <div class="form-check ">
                    <input class="form-check-input" type="radio" value="Journal" name="Attended" id="Attended_Nat_Conference">
                    <label class="form-check-label" for="Attended_Nat_Conference">National Conference</label>
                </div>
                <div class="form-check ">
                    <input class="form-check-input" type="radio" value="Journal" name="Attended" id="Attended_Workshop">
                    <label class="form-check-label" for="Attended_Workshop">Workshop</label>
                </div>
                <div class="form-check ">
                    <input class="form-check-input" type="radio" value="Journal" name="Attended" id="Attended_Faculty_Development">
                    <label class="form-check-label" for="Attended_Faculty_Development">Faculty Development Program</label>
                </div>
                <div class="form-check ">
                    <input class="form-check-input" type="radio" value="Journal" name="Attended" id="Attended_Others">
                    <label class="form-check-label" for="Attended_Others">Others</label>
                    <input type="text" class="form-control" id="Reviewer_Name" name="Attended"  placeholder="Please Specify">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-3">
                <div class="form-group" style=" margin-top:3% ">
                    <label for="Event_Attended_Name">Name of Event</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group" >
                    <input type="text" class="form-control" id="Event_Attended_Name" name=""  placeholder="">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-3">
                <div class="form-group" style=" margin-top:3% ">
                    <label for="Event_Attended_Place">Place</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group" >
                    <input type="text" class="form-control" id="Event_Attended_Place" name=""  placeholder="">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-3">
                <div class="form-group" style=" margin-top:3% ">
                    <label for="Event_Attended_From">Duration(From)</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group" >
                    <input type="text" class="form-control" id="Event_Attended_From" name=""  placeholder="DD-MM-YYYY">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-3">
                <div class="form-group" style=" margin-top:3% ">
                    <label for="Event_Attended_To">Duration(To)</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group" >
                    <input type="text" class="form-control" id="Event_Attended_To" name=""  placeholder="DD-MM-YYYY">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-3">
                <div class="form-group" style=" margin-top:3% ">
                    <label for="Event_Attended_Funding">Funding Agency</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group" >
                    <input type="text" class="form-control" id="Event_Attended_Funding" name=""  placeholder="">
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
