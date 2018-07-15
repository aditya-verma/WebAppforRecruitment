<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 7/15/2018
  Time: 2:42 PM
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
            $( "#Consultancy_Completed" ).datepicker({
                format: "mm-yyyy",
                viewMode: "months",
                minViewMode: "months",
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
    <form id="ConsutancyProvided" action="" method="post">
        <div class="row" >
            <div class="col-sm-3">
                <div class="form-group" style=" margin-top:3% ">
                    <label for="Consultancy_Organisation">Organisation Served</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group" >
                    <input type="text" class="form-control" id="Consultancy_Organisation" name=""  placeholder="">
                </div>
            </div>
        </div>
        <div class="row" >
            <div class="col-sm-3">
                <div class="form-group" style=" margin-top:3% ">
                    <label for="Consultancy_Description">Description</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group" >
                    <textarea type="text" class="form-control" id="Consultancy_Description"  name="" placeholder="Description "></textarea>
                </div>
            </div>
        </div>
        <div class="row" >
            <div class="col-sm-3">
                <div class="form-group" style=" margin-top:3% ">
                    <label for="Consultancy_Amount">Amount</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group" >
                    <input type="text" class="form-control" id="Consultancy_Amount" name=""  placeholder="In Lakhs">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-3">
                <div class="form-group" style=" margin-top:3% ">
                    <label for="Consultancy_Completed">Completed On</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group" >
                    <input type="text" class="form-control" id="Consultancy_Completed" name=""  placeholder="MM-YYYY">
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
