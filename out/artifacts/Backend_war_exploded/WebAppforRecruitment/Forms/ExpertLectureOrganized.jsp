<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*"%>
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
    <script>
        $(function() {
            $('input[name="Organised_Type"]').on('click', function() {
                if ($(this).val() == 'Others') {
                    $('#textbox').show();
                }
                else {
                    $('#textbox').hide();}
            });
        });
    </script>
    <script>
        function myFunc() {
            $('#Organised_Others').val((document.getElementById("Organised_Specification").value));

        }
    </script>
    <style>
        body {

            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
<div class="container">
<form id="EventOrganised" action="" method="post">
        <%
            if (session.getAttribute("ApplicationNumber")==null ||session.getAttribute("ApplicationNumber")=="")
            {
                response.sendRedirect("/WebAppforRecruitment/login/login.jsp");
            }
        %>
    <div class="row ">
        <div class="col-sm-3" >
            <p >Type</p>
        </div>
        <div class="col-sm-8">
            <div class="form-check ">
                <input class="form-check-input" type="radio" value="International Conference" name="Organised_Type" id="Organised_Int_Conference" checked>
                <label class="form-check-label" for="Organised_Int_Conference"> International Conference</label>
            </div>
            <div class="form-check ">
                <input class="form-check-input" type="radio" value="National Conference" name="Organised_Type" id="Organised_Nat_Conference">
                <label class="form-check-label" for="Organised_Nat_Conference">National Conference</label>
            </div>
            <div class="form-check ">
                <input class="form-check-input" type="radio" value="Workshop" name="Organised_Type" id="Organised_Workshop">
                <label class="form-check-label" for="Organised_Workshop">Workshop</label>
            </div>
            <div class="form-check ">
                <input class="form-check-input" type="radio" value="Faculty Development Program" name="Organised_Type" id="Organised_Faculty_Development">
                <label class="form-check-label" for="Organised_Faculty_Development">Faculty Development Program</label>
            </div>
            <div class="form-check ">
                <input class="form-check-input" type="radio" value="Others" name="Organised_Type" id="Organised_Others">
                <label class="form-check-label" for="Organised_Others">Others</label>
                <div id="textbox" style="display: none">
                    <input type="text" class="form-control" id="Organised_Specification"  name="Organised_Specification" placeholder="Please Specify" >
                </div>
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
                <input type="text" class="form-control" id="Event_Organised_Name" name="Organised_Name"  placeholder="">
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
                <input type="text" class="form-control" id="Event_Organised_Place" name="Organised_Place"  placeholder="">
            </div>
        </div>
    </div>
    <div class="row " style="margin-top: 2%">
        <div class="col-sm-3">
            <div class="form-group" style=" margin-top:3% ">
                <label for="Event_Organised_From">Duration</label>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="form-group" >
                <input type="text" class="form-control" id="Event_Organised_From" name="Organised_From"  placeholder="From">
            </div>
        </div>
    </div>
    <div class="row " style="margin-top: 2%">
        <div class="col-sm-3">
            <div class="form-group" style=" margin-top:3% ">
                <label for="Event_Organised_To">Duration</label>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="form-group" >
                <input type="text" class="form-control" id="Event_Organised_To" name="Organised_To"  placeholder="To">
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
                <input type="text" class="form-control" id="Event_Organised_Funding" name="Organised_Agency"  placeholder="">
            </div>
        </div>
    </div>
    <div class="row " style="margin-top: 2%">
        <div class="col-sm-3">
            <div class="form-group" style=" margin-top:3% ">
                <label for="Event_Organised_Budget">Budget</label>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="form-group" >
                <input type="text" class="form-control" id="Event_Organised_Budget" name="Organised_Budget"  placeholder="In Lakhs">
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
                <input type="text" class="form-control" id="Event_Organised_Participants" name="Organised_Participants"  placeholder="">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-3">

        </div>
        <div class="col-sm-8">
            <button class="btn btn-lg btn-primary m-1" id="add" value="Insert" type="submit" onclick="myFunc()" name="Organised_b1">ADD</button>
        </div>
    </div>
    <%
        if(request.getParameter("Organised_b1")!=null) {
            String Type = (request.getParameter("Organised_Type"));
            String Name = request.getParameter("Organised_Name");
            String Place= request.getParameter("Organised_Place");
            String From = request.getParameter("Organised_From");
            String To = request.getParameter("Organised_To");
            String Agency = request.getParameter("Organised_Agency");
            String Budget = request.getParameter("Organised_Budget");
            String Participants = request.getParameter("Organised_Participants");
            Connection connection = null;
            Statement stmt = null;
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection((String)session.getAttribute("DatabaseHost"),(String)session.getAttribute("DatabaseUser"),(String)session.getAttribute("DatabasePassword"));
                stmt = connection.createStatement();
                String sql = "insert into ExpertLectureOrganised values('" + ((String) session.getAttribute("ApplicationNumber")) + "','" + Type +"','" +Name + "','"+Place+"','" + From + "','" + To + "','" + Agency+ "','" +Budget+"','"+Participants+ "')";
                int se = stmt.executeUpdate(sql);
                if (se != 0){
    %><div class="text-center alert-success">Record Inserted</div> <%
}
else {
%><div class="text-center alert-danger">Record not Inserted</div><%
    }
    connection.close();
    stmt.close();
}


catch(Exception e)
{
%><div class="alert-warning text-center"><% out.print(e);%></div> <%
        }
    }
%>
</form>
</div>
</body>
</html>
