<!DOCTYPE html>
<html lang="en">
<head>
    <link href="../css/datepicker.css" rel="stylesheet">
    <script src="../js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
        $(function() {
            $( "#From8" ).datepicker({
                format: "dd-mm-yyyy",
                viewMode: "months",
                minViewMode: "days",
                pickerPosition: "bottom-left"});

            $( "#To8" ).datepicker({
                format: "dd-mm-yyyy",
                viewMode: "months",
                minViewMode: "days",
                pickerPosition: "bottom-left"});
        });
    </script>
</head>
<body style="background-color: #f5f5f5;">
<%
    if (session.getAttribute("ApplicationNumber")==null ||session.getAttribute("ApplicationNumber")=="")
    {
        response.sendRedirect("/WebAppforRecruitment/login/login.jsp");
    }


%>
<div class="container ">
    <form id="IndustrialInformation" action="" style="width: 100%;">
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="Industrial_Experience_Organisation">Organisation</label>
                    <input id="Industrial_Experience_Organisation" class="form-control" name="Industrial_Experience_Organisation" placeholder="" required>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="Industrial_Experience_Position">Position</label>
                    <input id="Industrial_Experience_Position" class="form-control" name="Industrial_Experience_Position" placeholder="" required>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="text" for="Industrial_Experience_Employee">Type of Employee</label>
                    <input id="Industrial_Experience_Employee" class="form-control" name="Industrial_Experience_Employee" placeholder="" required>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="From8">From</label>
                    <input id="From8" type="text" class="form-control" name="From8" placeholder="DD-MM-YYYY" >
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="To8">To</label>
                    <input id="To8" type="text" class="form-control" name="To8" placeholder="DD-MM-YYYY" >
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="Industrial_Experience_Pay_Scale">Pay Scale with AGP</label>
                    <input id="Industrial_Experience_Pay_Scale" class="form-control" name="Industrial_Experience_Pay_Scale" placeholder="" required>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="Industrial_Experience_Work">Nature of Work</label>
                    <input id="Industrial_Experience_Work" class="form-control" name="Industrial_Experience_Work" placeholder="" required>
                </div>
            </div>
        </div>
        <div class="form-actions" style="margin: 4%;background-color: transparent;text-align: center;">
            <button class="btn btn-lg btn-primary m-1"  value="Insert" type="submit" name="Research_Experience_b1">Save</button>
        </div>
        <%
            if(request.getParameter("Research_Experience_b1")!=null) {
                String Industrial_Experience_Organisation ="";
                String Industrial_Experience_Position ="";
                String Industrial_Experience_Employee ="";
                String From8="";
                String To8 = "";
                String Industrial_Experience_Pay_Scale ="";
                String Industrial_Experience_Work = "";

                try{
                    Connection con = null;
                    Statement stmt = null;
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection((String)session.getAttribute("DatabaseHost"),(String)session.getAttribute("DatabaseUser"),(String)session.getAttribute("DatabasePassword"));
                    ResultSet res;
                    stmt = con.createStatement();
                    Industrial_Experience_Organisation = (request.getParameter("Industrial_Experience_Organisation"));
                    Industrial_Experience_Position = request.getParameter("Industrial_Experience_Position");
                    Industrial_Experience_Employee = request.getParameter("Industrial_Experience_Employee");
                    From8 = request.getParameter("From8");
                    To8 = request.getParameter("To8");
                    Industrial_Experience_Pay_Scale = request.getParameter("Industrial_Experience_Pay_Scale");
                    Industrial_Experience_Work = request.getParameter("Industrial_Experience_Work");

                    String sql = "insert into Industrial_Experience values('" + ((String) session.getAttribute("ApplicationNumber")) + "','" + Industrial_Experience_Organisation + "','" + Industrial_Experience_Position + "','" + From8 + "','" +To8+ "','" + Industrial_Experience_Pay_Scale  + "','" + Industrial_Experience_Employee + "','" + Industrial_Experience_Work + "')";
                    int se = stmt.executeUpdate(sql);
                    if (se != 0){
        %><div class="text-center alert-success">Record Inserted</div> <%
    }
    else {
    %><div class="text-center alert-danger">Record not Inserted</div><%
        }con.close();
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
