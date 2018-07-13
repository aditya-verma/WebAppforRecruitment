<!DOCTYPE html>
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
    String teaching_exp_organisation ="";
    String teaching_exp_position ="";
    String teaching_exp_from ="";
    String teaching_exp_to="";
    String teaching_exp_pay_scale = "";
    String teaching_exp_type_of_emp ="";
    String teaching_exp_tenure = "";

    try{Connection teaching_exp_con = null;
        Statement teaching_exp_stmt = null;
        Class.forName("com.mysql.cj.jdbc.Driver");
        teaching_exp_con = DriverManager.getConnection((String)session.getAttribute("DatabaseHost"),(String)session.getAttribute("DatabaseUser"),(String)session.getAttribute("DatabasePassword"));
        ResultSet res;
        teaching_exp_stmt = teaching_exp_con.createStatement();
        res = teaching_exp_stmt.executeQuery("SELECT * FROM Teaching_Experience WHERE ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"'");
        if (res.next())
        {
            teaching_exp_organisation = res.getString(2);
            teaching_exp_position = res.getString(3);
            teaching_exp_from = res.getString(4);
            teaching_exp_to = res.getString(5);
            teaching_exp_pay_scale = res.getString(6);
            teaching_exp_type_of_emp = res.getString(7);
            teaching_exp_tenure = res.getString(8);
        }
%>

<div class="container ">
    <form id="Teaching" action="#">
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="organisation_name">Organisation</label>
                    <input id="organisation_name" class="form-control" name="i1" placeholder=""  value="<%out.println(teaching_exp_organisation);%>">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="position">Position</label>
                    <input id="position" class="form-control" placeholder="" name="i2" value="<%out.println(teaching_exp_position);%>">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="From6">From</label>
                    <input type="text" class="form-control" id="From6" name="i3" placeholder="" value="<%out.println(teaching_exp_from);%>">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="To6">To</label>
                    <input type="text" class="form-control" id="To6" name="i4" placeholder="" value="<%out.println(teaching_exp_to);%>">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="pay_scale">Pay Scale with AGP</label>
                    <input id="pay_scale" class="form-control" name="i5" placeholder=""value="<%out.println(teaching_exp_pay_scale);%>">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="type_of_employee">Type of Employee</label>
                    <input id="type_of_employee" class="form-control" name="i6" placeholder="" value="<%out.println(teaching_exp_type_of_emp);%>">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-uppercase" for="tenure">Tenure</label>
                    <input id="tenure" class="form-control" name="i7" placeholder="" value="<%out.println(teaching_exp_tenure);%>">
                </div>
            </div>
        </div>
        <div class="col-md-12 mb-3" style="margin: 0;text-align: center">
            <button class="btn btn-lg btn-danger m-1" id="reset" type="reset">Reset</button>
            <button class="btn btn-lg btn-primary m-1" id="submit" value="Insert" type="submit" name="b1">Save and Continue</button>
        </div>
        <%
            if(request.getParameter("b1")!=null) {
                teaching_exp_organisation = (request.getParameter("i1"));
                teaching_exp_position = request.getParameter("i2");
                teaching_exp_from = request.getParameter("i3");
                teaching_exp_to = request.getParameter("i4");
                teaching_exp_pay_scale = request.getParameter("i5");
                teaching_exp_type_of_emp = request.getParameter("i6");
                teaching_exp_tenure = request.getParameter("i7");
                ResultSet resultSet = teaching_exp_stmt.executeQuery("SELECT * FROM Teaching_Experience WHERE ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"'");
                if (resultSet.next() || resultSet != null)
                {
                    teaching_exp_stmt.executeUpdate("UPDATE Teaching_Experience SET Organisation = '"+teaching_exp_organisation+
                            "', PositionHeld = '"+teaching_exp_position+
                            "', TypeOfEmployee = '"+teaching_exp_type_of_emp+
                            "', FromDate = '"+teaching_exp_from+
                            "', ToDate = '"+teaching_exp_to+
                            "', PayScaleWithAGP = '"+teaching_exp_pay_scale+
                            "', Tenure = '"+teaching_exp_tenure+
                            "' WHERE ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"'");
                    return ;
                }

                String sql = "insert into Teaching_Experience values('" + ((String) session.getAttribute("ApplicationNumber")) + "','" + teaching_exp_organisation + "','" + teaching_exp_position + "','" + teaching_exp_from + "','" + teaching_exp_to + "','" + teaching_exp_pay_scale + "','" + teaching_exp_type_of_emp + "','" + teaching_exp_tenure + "')";
                int se = teaching_exp_stmt.executeUpdate(sql);
                if (se != 0){
        %><div class="text-center alert-success">Record Inserted</div> <%
    }
    else {
    %><div class="text-center alert-danger">Record not Inserted</div><%
            }

        }
        teaching_exp_con.close();
        teaching_exp_stmt.close();
    }
    catch(Exception e)
    {
    %><div class="alert-warning text-center"><% out.print(e);%></div> <%
        }

    %>
    </form>
</div>
</body>
</html>