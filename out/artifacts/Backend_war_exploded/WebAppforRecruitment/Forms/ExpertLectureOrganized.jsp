
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
            $( "#Event_Organised_From" ).datepicker({
                format: "dd-mm-yyyy",
                viewMode: "months",
                minViewMode: "date",
                pickerPosition: "bottom-left"});
            $( "#Event_Organised_To" ).datepicker({
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
<form id="EventOrganised" action="" method="post">
    <div class="row ">
        <div class="col-sm-3" >
            <p >Type</p>
        </div>
        <div class="col-sm-8">
            <div class="form-check ">
                <input class="form-check-input" type="radio" value="Conference" name="Organised" id="Organised_Int_Conference">
                <label class="form-check-label" for="Organised_Int_Conference"> International Conference</label>
            </div>
            <div class="form-check ">
                <input class="form-check-input" type="radio" value="Journal" name="Organised" id="Organised_Nat_Conference">
                <label class="form-check-label" for="Organised_Nat_Conference">National Conference</label>
            </div>
            <div class="form-check ">
                <input class="form-check-input" type="radio" value="Journal" name="Organised" id="Organised_Workshop">
                <label class="form-check-label" for="Organised_Workshop">Workshop</label>
            </div>
            <div class="form-check ">
                <input class="form-check-input" type="radio" value="Journal" name="Organised" id="Organised_Faculty_Development">
                <label class="form-check-label" for="Organised_Faculty_Development">Faculty Development Program</label>
            </div>
            <div class="form-check ">
                <input class="form-check-input" type="radio" value="Journal" name="Organised" id="Organised_Others">
                <label class="form-check-label" for="Organised_Others">Others</label>
                <input type="text" class="form-control" id="Reviewer_Name" name="Organised"  placeholder="Please Specify">
            </div>
        </div>
    </div>
    <div class="row " style="margin-top: 2%">
        <div class="col-sm-3">
            <div class="form-group" style=" margin-top:3% ">
                <label for="Event_Organised_Name">Name of Event</label>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="form-group" >
                <input type="text" class="form-control" id="Event_Organised_Name" name=""  placeholder="">
            </div>
        </div>
    </div>
    <div class="row " style="margin-top: 2%">
        <div class="col-sm-3">
            <div class="form-group" style=" margin-top:3% ">
                <label for="Event_Organised_Place">Place</label>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="form-group" >
                <input type="text" class="form-control" id="Event_Organised_Place" name=""  placeholder="">
            </div>
        </div>
    </div>
    <div class="row " style="margin-top: 2%">
        <div class="col-sm-3">
            <div class="form-group" style=" margin-top:3% ">
                <label for="Event_Organised_From">Duration(From)</label>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="form-group" >
                <input type="text" class="form-control" id="Event_Organised_From" name=""  placeholder="DD-MM-YYYY">
            </div>
        </div>
    </div>
    <div class="row " style="margin-top: 2%">
        <div class="col-sm-3">
            <div class="form-group" style=" margin-top:3% ">
                <label for="Event_Organised_To">Duration(To)</label>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="form-group" >
                <input type="text" class="form-control" id="Event_Organised_To" name=""  placeholder="DD-MM-YYYY">
            </div>
        </div>
    </div>
    <div class="row " style="margin-top: 2%">
        <div class="col-sm-3">
            <div class="form-group" style=" margin-top:3% ">
                <label for="Event_Organised_Funding">Funding Agency</label>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="form-group" >
                <input type="text" class="form-control" id="Event_Organised_Funding" name=""  placeholder="">
            </div>
        </div>
    </div>
    <div class="row " style="margin-top: 2%">
        <div class="col-sm-3">
            <div class="form-group" style=" margin-top:3% ">
                <label for="Event_Organised_Budget">Budget(in lakhs)</label>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="form-group" >
                <input type="text" class="form-control" id="Event_Organised_Budget" name=""  placeholder="">
            </div>
        </div>
    </div>
    <div class="row " style="margin-top: 2%">
        <div class="col-sm-3">
            <div class="form-group" style=" margin-top:3% ">
                <label for="Event_Organised_Participants">Number of Participants</label>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="form-group" >
                <input type="text" class="form-control" id="Event_Organised_Participants" name=""  placeholder="">
            </div>
        </div>
    </div>
</form>
</body>
</html>
