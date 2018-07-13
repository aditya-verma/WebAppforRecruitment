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
            String organisation ="";
            String position ="";
            String type_of_emp ="";
            String from ="";
            String to="";
            String pay_in_band = "";
            String agp_gp = "";
            String basic_pay ="";
            String  nature_of_work = "";

            try{Connection present_emp_connection = null;
                Statement present_emp_stmt = null;
                Class.forName("com.mysql.cj.jdbc.Driver");
                present_emp_connection = DriverManager.getConnection((String)session.getAttribute("DatabaseHost"),(String)session.getAttribute("DatabaseUser"),(String)session.getAttribute("DatabasePassword"));
                ResultSet present_emp_res;
                present_emp_stmt = present_emp_connection.createStatement();
                present_emp_res = present_emp_stmt.executeQuery("SELECT * FROM Present_Employee WHERE ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"'");
                if (present_emp_res.next())
                {
                    organisation = present_emp_res.getString(2);
                    position = present_emp_res.getString(3);
                    type_of_emp = present_emp_res.getString(4);
                    from = present_emp_res.getString(5);
                    to = present_emp_res.getString(6);
                    pay_in_band = present_emp_res.getString(7);
                    agp_gp = present_emp_res.getString(8);
                    basic_pay = present_emp_res.getString(9);
                    nature_of_work = present_emp_res.getString(10);


                }
        %>

        <div class="row " style="margin-top: 5%">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="text-capitalize" for="applicant_oragnisation">Organisation</label>
                    <input id="applicant_oragnisation" class="form-control" placeholder="Enter Organisation" name="i1" required value="<%out.println(organisation);%>">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-capitalize" for="position-held">Position held</label>
                    <input id="position-held" class="form-control" placeholder="Enter Position" name="i2" required value="<%out.println(position);%>">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-capitalize" for="type-of-employee">Type of employee</label>
                    <input id="type-of-employee" class="form-control" placeholder="Enter Type"  name="i3"required value="<%out.println(type_of_emp);%>">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-capitalize" for="From8">From</label>
                    <input id="From8" class="form-control" type="text" placeholder="From Date" name="i4" required value="<%out.println(from);%>">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-capitalize" for="To8">To</label>
                    <input id="To8" class="form-control" placeholder="From To" required type="text" name="i5" value="<%out.println(to);%>">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-capitalize" for="pay-band">Pay In Pay Band</label>
                    <select class="form-control" id="pay-band" name="i6" required>
                        <option value="" <%if (pay_in_band.equalsIgnoreCase("")){%>selected<%}%>>Select Pay Band</option>
                        <option value="Option1" <%if (pay_in_band.equalsIgnoreCase("Option1")){%>selected<%}%>>Option 1</option>
                        <option value="Option2" <%if (pay_in_band.equalsIgnoreCase("Option2")){%>selected<%}%>>Option 2</option>
                        <option value="Option3" <%if (pay_in_band.equalsIgnoreCase("Option3")){%>selected<%}%>>Option 3</option>
                        <option value="Option4" <%if (pay_in_band.equalsIgnoreCase("Option4")){%>selected<%}%>>Option 4</option>
                    </select>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-capitalize" for="agp-gp">AGP/GP</label>
                    <select class="form-control" id="agp-gp" name="i7" required >
                        <option value="" <%if (agp_gp.equalsIgnoreCase("")){%>selected<%}%>>AGP/GP</option>
                        <option value="AGP" <%if (agp_gp.equalsIgnoreCase("AGP")){%>selected<%}%>>AGP</option>
                        <option value="GP" <%if (agp_gp.equalsIgnoreCase("GP")){%>selected<%}%>>GP</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="text-capitalize" for="basic-pay">Basic Pay</label>
                    <input id="basic-pay" class="form-control" placeholder="Enter Basic Pay" name="i8" required value="<%out.println(basic_pay);%>">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="text-capitalize" for="nature-of work">Nature Of Work</label>
                    <input id="nature-of work" class="form-control" placeholder="Enter Nature of Work" name="i9" required value="<%out.println(nature_of_work);%>">
                </div>
            </div>
        </div>
        <div class="form-actions" style="margin: 4%;background-color: transparent;text-align: center;">
            <button class="btn btn-lg btn-danger m-1" id="reset" type="reset">Reset</button>
            <button class="btn btn-lg btn-primary m-1" id="submit" value="Insert" type="submit" name="b1">Save and Continue</button>
        </div>
        <%
            if(request.getParameter("b1")!=null) {
                organisation = (request.getParameter("i1"));
                position = request.getParameter("i2");
                type_of_emp = request.getParameter("i3");
                from = request.getParameter("i4");
                to = request.getParameter("i5");
                pay_in_band = request.getParameter("i6");
                agp_gp = request.getParameter("i7");
                basic_pay = request.getParameter("i8");
                nature_of_work = request.getParameter("i9");
                ResultSet present_emp_resultSet = present_emp_stmt.executeQuery("SELECT * FROM Present_Employee WHERE ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"'");
                if (present_emp_resultSet.next() || present_emp_resultSet != null)
                {
                    present_emp_stmt.executeUpdate("UPDATE Present_Employee SET Organisation = '"+organisation+
                            "', PositionHold = '"+position+
                            "', TypeOfEmp = '"+type_of_emp+
                            "', FromDate = '"+from+
                            "', ToDate = '"+to+
                            "', PayInBand = '"+pay_in_band+
                            "', APG_GP = '"+agp_gp+
                            "', BasicPay = '"+basic_pay+
                            "', NatureOfWork = '"+nature_of_work+
                            "' WHERE ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"'");
                    return ;
                }

                String sql = "insert into Present_Employee values('" + ((String) session.getAttribute("ApplicationNumber")) + "','" + organisation + "','" + position + "','" + type_of_emp + "','" + from + "','" + to + "','" + pay_in_band + "','" + agp_gp + "'," + basic_pay + ",'" + nature_of_work + "')";
                int se = present_emp_stmt.executeUpdate(sql);
                if (se != 0){
        %><div class="text-center alert-success">Record Inserted</div> <%
    }
    else {
    %><div class="text-center alert-danger">Record not Inserted</div><%
            }

            }
        present_emp_connection.close();
        present_emp_stmt.close();
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


