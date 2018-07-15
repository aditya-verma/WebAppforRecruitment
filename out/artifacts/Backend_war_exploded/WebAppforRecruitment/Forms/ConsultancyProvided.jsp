<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 7/15/2018
  Time: 2:42 PM
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
    <%
        if (session.getAttribute("ApplicationNumber")==null ||session.getAttribute("ApplicationNumber")=="")
        {
            response.sendRedirect("/WebAppforRecruitment/login/login.jsp");
        }
    %>
    <form id="ConsutancyProvided" action="" method="post">
        <div class="row" >
            <div class="col-sm-3">
                <div class="form-group" style=" margin-top:3% ">
                    <label for="Consultancy_Organisation">Organisation Served</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group" >
                    <input type="text" class="form-control" id="Consultancy_Organisation" name="Consultancy_Organistaion"  placeholder="">
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
                    <textarea type="text" class="form-control" id="Consultancy_Description"  name="Consultancy_Description" placeholder="Description "></textarea>
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
                    <input type="text" class="form-control" id="Consultancy_Amount" name="Consultancy_Amount"  placeholder="In Lakhs">
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
                    <input type="text" class="form-control" id="Consultancy_Completed" name="Consultancy_Completed"  placeholder="MM-YYYY">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">

            </div>
            <div class="col-sm-8">
                <button class="btn btn-lg btn-primary m-1" id="add" value="Insert" type="submit" name="b1">ADD</button>
                <button class="btn btn-lg btn-success m-1" id="submit" value="Insert" type="submit" name="b2">Continue</button>
            </div>
        </div>
        <%
            if(request.getParameter("b1")!=null) {
                String Organisation = (request.getParameter("Consultancy_Organistaion"));
                String Description = (request.getParameter("Consultancy_Description"));
                String Amount = request.getParameter("Consultancy_Amount");
                String Completed= request.getParameter("Consultancy_Completed");
                Connection connection = null;
                Statement stmt = null;
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection((String)session.getAttribute("DatabaseHost"),(String)session.getAttribute("DatabaseUser"),(String)session.getAttribute("DatabasePassword"));
                    stmt = connection.createStatement();
                    String sql = "insert into Consultancy_Provided values('" + ((String) session.getAttribute("ApplicationNumber")) + "','" + Organisation + "','"+Description+"','" +Amount + "','"+Completed+"')";
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
