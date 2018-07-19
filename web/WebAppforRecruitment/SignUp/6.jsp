<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/backgrounds.css">
<script src="../jquery/3.3.1/jquery.min.js"></script>
<script src="../jquery/popper.js/1.14.3/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<link href="../css/datepicker.css" rel="stylesheet">
<script src="../js/bootstrap-datepicker.js"></script>
<script type="text/javascript">
    $(function() {
        $( "#From6" ).datepicker({
            format: "dd-mm-yyyy",
            viewMode: "months",
            minViewMode: "days",
            pickerPosition: "bottom-left"});
        $( "#To6" ).datepicker({
            format: "dd-mm-yyyy",
            viewMode: "months",
            minViewMode: "days",
            pickerPosition: "bottom-left"});
    });
</script>
<body>
<%
    if (session.getAttribute("ApplicationNumber")==null ||session.getAttribute("ApplicationNumber")=="")
    {
        response.sendRedirect("/WebAppforRecruitment/login/login.jsp");
    }


%>

<div class="container ">
    <form id="Teaching" action="#">
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="Teaching_Experience_Organisation">Organisation</label>
                    <input id="Teaching_Experience_Organisation" class="form-control" name="i10" placeholder="">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="Teaching_Experience_position">Position</label>
                    <input id="Teaching_Experience_position" class="form-control" placeholder="" name="i11" >
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="text" for="Teaching_Experience_type_of_employee">Type of Employee</label>
                    <input id="Teaching_Experience_type_of_employee" class="form-control" name="i15" placeholder="">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="From6">From</label>
                    <input type="text" pattern="[0-9-]+"  class="form-control" id="From6" name="i12" placeholder="DD-MM-YYYY" >
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="To6">To</label>
                    <input type="text" pattern="[0-9-]+" class="form-control" id="To6" name="i13" placeholder="DD-MM-YYYY" >
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="Teaching_Experience_pay_scale">Pay Scale with AGP</label>
                    <input id="Teaching_Experience_pay_scale" class="form-control" name="i14" placeholder="">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="Teaching_Experience_tenure">Tenure(in months)</label>
                    <input type="number" value="0" id="Teaching_Experience_tenure" class="form-control" name="i16" placeholder="" >
                </div>
            </div>
        </div>
        <div class="form-actions" style="margin: 4%;background-color: transparent;text-align: center;">
            <button class="btn btn-lg btn-primary m-1" value="Insert" type="submit" name="Teaching_Experience_b1">ADD</button>
        </div>
        <%
            if(request.getParameter("Teaching_Experience_b1")!=null) {
                String teaching_exp_organisation ="";
                String teaching_exp_position ="";
                String teaching_exp_from ="";
                String teaching_exp_to="";
                String teaching_exp_pay_scale = "";
                String teaching_exp_type_of_emp ="";
                String teaching_exp_tenure = "";

                try{
                    Connection con = null;
                    Statement stmt = null;
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection((String)session.getAttribute("DatabaseHost"),(String)session.getAttribute("DatabaseUser"),(String)session.getAttribute("DatabasePassword"));
                    ResultSet res;
                    stmt = con.createStatement();
                teaching_exp_organisation = (request.getParameter("i10"));
                teaching_exp_position = request.getParameter("i11");
                teaching_exp_from = request.getParameter("i12");
                teaching_exp_to = request.getParameter("i13");
                teaching_exp_pay_scale = request.getParameter("i14");
                teaching_exp_type_of_emp = request.getParameter("i15");
                teaching_exp_tenure = request.getParameter("i16");

                String sql = "insert into Teaching_Experience values('" + ((String) session.getAttribute("ApplicationNumber")) + "','" + teaching_exp_organisation + "','" + teaching_exp_position + "','" + teaching_exp_from + "','" + teaching_exp_to + "','" + teaching_exp_pay_scale + "','" + teaching_exp_type_of_emp + "','" + teaching_exp_tenure + "')";
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