<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">

<body style="background-color: #f5f5f5;">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/backgrounds.css">
<script src="../jquery/3.3.1/jquery.min.js"></script>
<script src="../jquery/popper.js/1.14.3/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
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
<div class="container ">
    <form id="PresentEmployer" action="" method="post" style="width: 100%">
        <%
            if (session.getAttribute("ApplicationNumber")==null ||session.getAttribute("ApplicationNumber")=="")
            {
                response.sendRedirect("/WebAppforRecruitment/login/login.jsp");
            }
            String present_emplyee_organisation ="";
            String present_emplyee_position ="";
            String present_emplyee_type_of_emp ="";
            String present_emplyee_from ="";
            String present_emplyee_to="";
            String present_emplyee_pay_in_band = "";
            String present_emplyee_agp_gp = "";
            String present_emplyee_basic_pay ="";
            String present_emplyee_nature_of_work = "";

            try{
                Connection present_emp_connection = null;
                Statement present_emp_stmt = null;
                Class.forName("com.mysql.cj.jdbc.Driver");
                present_emp_connection = DriverManager.getConnection((String)session.getAttribute("DatabaseHost"),(String)session.getAttribute("DatabaseUser"),(String)session.getAttribute("DatabasePassword"));
                ResultSet present_emp_res;
                present_emp_stmt = present_emp_connection.createStatement();
                present_emp_res = present_emp_stmt.executeQuery("SELECT * FROM Present_Employee WHERE ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"'");
                if (present_emp_res.next())
                {
                    present_emplyee_organisation = present_emp_res.getString(2);
                    present_emplyee_position = present_emp_res.getString(3);
                    present_emplyee_type_of_emp = present_emp_res.getString(4);
                    present_emplyee_from = present_emp_res.getString(5);
                    present_emplyee_to = present_emp_res.getString(6);
                    present_emplyee_pay_in_band = present_emp_res.getString(7);
                    present_emplyee_agp_gp = present_emp_res.getString(8);
                    present_emplyee_basic_pay = present_emp_res.getString(9);
                    present_emplyee_nature_of_work = present_emp_res.getString(10);

                }
        %>
        <div class="row " style="margin-top: 5%">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="text-capitalize" for="present_employee_applicant_oragnisation">Organisation</label>
                    <input id="present_employee_applicant_oragnisation" class="form-control" placeholder="Enter Organisation" name="i1" required value="<%out.println(present_emplyee_organisation);%>">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-capitalize" for="present_employee_position-held">Position held</label>
                    <input id="present_employee_position-held" class="form-control" placeholder="Enter Position" name="i2" required value="<%out.println(present_emplyee_position);%>">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-capitalize" for="present_employee_type-of-employee">Type of employee</label>
                    <input id="present_employee_type-of-employee" class="form-control" placeholder="Enter Type"  name="i3"required value="<%out.println(present_emplyee_type_of_emp);%>">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-capitalize" for="From8">From</label>
                    <input id="From8" pattern="[0-9-]+" class="form-control" type="text" placeholder="From Date" name="i4" required value="<%out.println(present_emplyee_from);%>">
                </div>
            </div>
            <div class="col-sm-6">
            <div class="form-group">
                <label class="text-capitalize" for="To8">To</label>
                <input id="To8" pattern="[0-9-]+" class="form-control" placeholder="From To" required type="text" name="i5" value="<%out.println(present_emplyee_to);%>">
            </div>
        </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-capitalize" for="present_employee_pay-band">Pay In Pay Band</label>
                    <select class="form-control" id="present_employee_pay-band" name="i6" required>
                        <option value="" <%if (present_emplyee_pay_in_band.equalsIgnoreCase("")){%>selected<%}%>>Select Pay Band</option>
                        <option value="Option1" <%if (present_emplyee_pay_in_band.equalsIgnoreCase("Option1")){%>selected<%}%>>Option 1</option>
                        <option value="Option2" <%if (present_emplyee_pay_in_band.equalsIgnoreCase("Option2")){%>selected<%}%>>Option 2</option>
                        <option value="Option3" <%if (present_emplyee_pay_in_band.equalsIgnoreCase("Option3")){%>selected<%}%>>Option 3</option>
                        <option value="Option4" <%if (present_emplyee_pay_in_band.equalsIgnoreCase("Option4")){%>selected<%}%>>Option 4</option>
                    </select>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-capitalize" for="present_employee_agp-gp">AGP/GP</label>
                    <select class="form-control" id="present_employee_agp-gp" name="i7" required >
                        <option value="" <%if (present_emplyee_agp_gp.equalsIgnoreCase("")){%>selected<%}%>>AGP/GP</option>
                        <option value="AGP" <%if (present_emplyee_agp_gp.equalsIgnoreCase("AGP")){%>selected<%}%>>AGP</option>
                        <option value="GP" <%if (present_emplyee_agp_gp.equalsIgnoreCase("GP")){%>selected<%}%>>GP</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="text-capitalize" for="present_employee_basic-pay">Basic Pay</label>
                    <input id="present_employee_basic-pay" class="form-control" placeholder="Enter Basic Pay" name="i8" required value="<%out.println(present_emplyee_basic_pay);%>">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="text-capitalize" for="present_employee_nature-of work">Nature Of Work</label>
                    <input id="present_employee_nature-of work" class="form-control" placeholder="Enter Nature of Work" name="i9" required value="<%out.println(present_emplyee_nature_of_work);%>">
                </div>
            </div>
        </div>
        <div class="form-actions" style="margin: 4%;background-color: transparent;text-align: center;">
            <button class="btn btn-lg btn-primary m-1" id="submit" value="Insert" type="submit" name="present_employee_b1">Save</button>
        </div>
        <% present_emp_connection.close();
        present_emp_stmt.close();}catch (Exception e){

        }
            if(request.getParameter("present_employee_b1")!=null) {
                present_emplyee_organisation = (request.getParameter("i1"));
                present_emplyee_position = request.getParameter("i2");
                present_emplyee_type_of_emp = request.getParameter("i3");
                present_emplyee_from = request.getParameter("i4");
                present_emplyee_to = request.getParameter("i5");
                present_emplyee_pay_in_band = request.getParameter("i6");
                present_emplyee_agp_gp = request.getParameter("i7");
                present_emplyee_basic_pay = request.getParameter("i8");
                present_emplyee_nature_of_work = request.getParameter("i9");
                int se=0;
                try{
                    Connection present_emp_con = null;
                    Statement present_emp_st = null;
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    present_emp_con = DriverManager.getConnection((String)session.getAttribute("DatabaseHost"),(String)session.getAttribute("DatabaseUser"),(String)session.getAttribute("DatabasePassword"));
                    present_emp_st = present_emp_con.createStatement();
                ResultSet present_emp_resultSet = present_emp_st.executeQuery("SELECT * FROM Present_Employee WHERE ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"'");
                if (present_emp_resultSet.next())
                {
                  se =  present_emp_st.executeUpdate("UPDATE Present_Employee SET Organisation = '"+present_emplyee_organisation+
                            "', PositionHold = '"+present_emplyee_position+
                            "', TypeOfEmp = '"+present_emplyee_type_of_emp+
                            "', FromDate = '"+present_emplyee_from+
                            "', ToDate = '"+present_emplyee_to+
                            "', PayInBand = '"+present_emplyee_pay_in_band+
                            "', APG_GP = '"+present_emplyee_agp_gp+
                            "', BasicPay = '"+present_emplyee_basic_pay+
                            "', NatureOfWork = '"+present_emplyee_nature_of_work+
                            "' WHERE ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"'");

                }

                else{
                    se = present_emp_st.executeUpdate("insert into Present_Employee values('" + ((String) session.getAttribute("ApplicationNumber")) +
                            "','" + present_emplyee_organisation +
                            "','" + present_emplyee_position +
                            "','" + present_emplyee_type_of_emp +
                            "','" + present_emplyee_from +
                            "','" + present_emplyee_to +
                            "','" + present_emplyee_pay_in_band +
                            "','" + present_emplyee_agp_gp +
                            "'," + present_emplyee_basic_pay +
                            ",'" + present_emplyee_nature_of_work + "')");
                }

                if (se != 0){
        %><div class="text-center alert-success">Record Inserted</div> <%
    }
    else {
    %><div class="text-center alert-danger">Record not Inserted</div><%
            }
        present_emp_con.close();
        present_emp_st.close();
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


