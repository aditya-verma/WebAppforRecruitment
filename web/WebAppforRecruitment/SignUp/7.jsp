<!DOCTYPE html>
<html lang="en">
<head>
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
</head>
<body style="background-color: #f5f5f5;">
<%
    if (session.getAttribute("ApplicationNumber")==null ||session.getAttribute("ApplicationNumber")=="")
    {
        response.sendRedirect("/WebAppforRecruitment/login/login.jsp");
    }


%>
<div class="container ">
    <form id="Research Experience" action="" style="width: 100%;">
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="Research_Experience_Organisation">Organisation</label>
                    <input id="Research_Experience_Organisation" class="form-control" name="Research_Experience_Organisation" placeholder="">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="Research_Experience_Position">Position</label>
                    <input id="Research_Experience_Position" class="form-control" name="Research_Experience_Position" placeholder="">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="text" for="Research_Experience_Salary">Salary/Fellowship/Stipend</label>
                    <input id="Research_Experience_Salary" type="text" class="form-control" name="Research_Experience_Salary" placeholder="" >
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="From7">From</label>
                        <input id="From7" pattern="[0-9-]+ type="text" class="form-control" name="From7" placeholder="DD-MM-YYYY" >
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="To7">To</label>
                        <input id="To7"  pattern="[0-9-]+" type="text" class="form-control" name="To7" placeholder="DD-MM-YYYY" >
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="Research_Experience_Work">Nature of Work</label>
                    <input id="Research_Experience_Work" class="form-control" name="Research_Experience_Work" placeholder="">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="Research_Experience_Tenure">Tenure</label>
                    <input type="number" value="0" id="Research_Experience_Tenure" class="form-control" name="Research_Experience_Tenure" placeholder="">
                </div>
            </div>
        </div>
        <div class="form-actions" style="margin: 4%;background-color: transparent;text-align: center;">
            <button class="btn btn-lg btn-primary m-1"  value="Insert" type="submit" name="Research_Experience_b1">Save</button>
        </div>
        <%
            if(request.getParameter("Research_Experience_b1")!=null) {
                String Research_Experience_Organisation ="";
                String Research_Experience_Position ="";
                String Research_Experience_Salary ="";
                String From7="";
                String To7 = "";
                String Research_Experience_Work ="";
                String Research_Experience_Tenure = "";

                try{
                    Connection con = null;
                    Statement stmt = null;
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection((String)session.getAttribute("DatabaseHost"),(String)session.getAttribute("DatabaseUser"),(String)session.getAttribute("DatabasePassword"));
                    ResultSet res;
                    stmt = con.createStatement();
                    Research_Experience_Organisation = (request.getParameter("Research_Experience_Organisation"));
                    Research_Experience_Position = request.getParameter("Research_Experience_Position");
                    Research_Experience_Salary = request.getParameter("Research_Experience_Salary");
                    From7 = request.getParameter("From7");
                    To7 = request.getParameter("To7");
                    Research_Experience_Work = request.getParameter("Research_Experience_Work");
                    Research_Experience_Tenure = request.getParameter("Research_Experience_Tenure");

                    String sql = "insert into Research_Experience values('" + ((String) session.getAttribute("ApplicationNumber")) + "','" + Research_Experience_Organisation + "','" + Research_Experience_Position + "','" + From7 + "','" +To7+ "','" +  Research_Experience_Salary + "','" + Research_Experience_Work + "','" + Research_Experience_Tenure + "')";
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