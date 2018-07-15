<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 7/14/2018
  Time: 4:32 PM
  To change this template use File | Settings | File Templates.
--%>
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
        $(function() {
            $('input[name="Attended_Type"]').on('click', function() {
                if ($(this).val() == 'Others') {
                    $('#textbox').show();
                }
                else {
                    $('#textbox').hide();
                }
            });
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
        <%
            if (session.getAttribute("ApplicationNumber")==null ||session.getAttribute("ApplicationNumber")=="")
        {
        response.sendRedirect("/WebAppforRecruitment/login/login.jsp");
        }
        %>
        <div class="row " >
            <div class="col-sm-3" >
                <p >Type</p>
            </div>
            <div class="col-sm-8">
                <div class="form-check ">
                    <input class="form-check-input" type="radio" value="International Conference" name="Attended_Type" id="Attended_Int_Conference">
                    <label class="form-check-label" for="Attended_Int_Conference"> International Conference</label>
                </div>
                <div class="form-check ">
                    <input class="form-check-input" type="radio" value="National Conference" name="Attended_Type" id="Attended_Nat_Conference">
                    <label class="form-check-label" for="Attended_Nat_Conference">National Conference</label>
                </div>
                <div class="form-check ">
                    <input class="form-check-input" type="radio" value="Workshop" name="Attended_Type" id="Attended_Workshop">
                    <label class="form-check-label" for="Attended_Workshop">Workshop</label>
                </div>
                <div class="form-check ">
                    <input class="form-check-input" type="radio" value="Faculty Development Program" name="Attended_Type" id="Attended_Faculty_Development">
                    <label class="form-check-label" for="Attended_Faculty_Development">Faculty Development Program</label>
                </div>
                <div class="form-check ">
                    <input class="form-check-input" type="radio" value="Others" name="Attended_Type" id="Attended_Others">
                    <label class="form-check-label" for="Attended_Others">Others</label>
                    <div id="textbox" style="display: none">
                    <input type="text" class="form-control" id="Attended_Specification"  name="Attended_Specification" placeholder="Please Specify" >
                    </div>
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
                    <input type="text" class="form-control" id="Event_Attended_Name" name="Attended_Name"  placeholder="">
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
                    <input type="text" class="form-control" id="Event_Attended_Place" name="Attended_Place"  placeholder="">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-3">
                <div class="form-group" style=" margin-top:3% ">
                    <label for="Event_Attended_From">Duration</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group" >
                    <input type="text" class="form-control" id="Event_Attended_From" name="Attended_From"  placeholder="From">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-3">
                <div class="form-group" style=" margin-top:3% ">
                    <label for="Event_Attended_To">Duration</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group" >
                    <input type="text" class="form-control" id="Event_Attended_To" name="Attended_To"  placeholder="To">
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
                    <input type="text" class="form-control" id="Event_Attended_Funding" name="Attended_Agency"  placeholder="">
                </div>
            </div>
        </div>
        <div class="row">
        <div class="col-sm-8">
            <button class="btn btn-lg btn-primary m-1" id="add" value="Insert" type="submit" name="b1">ADD</button>
            <button class="btn btn-lg btn-success m-1" id="submit" value="Insert" type="submit" name="b2">Continue</button>
        </div>
        </div>
        <%
            if(request.getParameter("b1")!=null) {
                String Type = (request.getParameter("Attended_Type"));
                String Specification = (request.getParameter("Attended_Specification"));
                String Name = request.getParameter("Attended_Name");
                String Place= request.getParameter("Attended_Place");
                String From = request.getParameter("Attended_From");
                String To = request.getParameter("Attended_To");
                String Agency = request.getParameter("Attended_Agency");
                Connection connection = null;
                Statement stmt = null;
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection((String)session.getAttribute("DatabaseHost"),(String)session.getAttribute("DatabaseUser"),(String)session.getAttribute("DatabasePassword"));
                    stmt = connection.createStatement();
                String sql = "insert into Event_Attended values('" + ((String) session.getAttribute("ApplicationNumber")) + "','" + Type + "','"+Specification+"','" +Name + "','"+Place+"','" + From + "','" + To + "','" + Agency + "')";
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
