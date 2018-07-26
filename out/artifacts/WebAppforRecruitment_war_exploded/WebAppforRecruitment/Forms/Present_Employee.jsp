<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Present Employer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link href="../css/datepicker.css" rel="stylesheet">
    <script src="../jquery/3.3.1/jquery.min.js"></script>
    <script src="../jquery/popper.js/1.14.3/popper.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
        $(function() {
            $( "#from" ).datepicker({
                format: "dd-mm-yyyy",
                viewMode: "months",
                minViewMode: "date",
                pickerPosition: "bottom-left"});
            $( "#to" ).datepicker({
                format: "dd-mm-yyyy",
                viewMode: "months",
                minViewMode: "date",
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

<header>







<div class="container">
    <form id="PresentEmployer" action="" method="post" style="width: 100%">
        <div class="row " style="margin-top: 5%">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="text-capitalize" for="applicant_oragnisation">Organisation</label>
                    <input id="applicant_oragnisation" class="form-control" placeholder="Enter Organisation" name="i1" required>
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-capitalize" for="position-held">Position held</label>
                    <input id="position-held" class="form-control" placeholder="Enter Position" name="i2" required>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-capitalize" for="type-of-employee">Type of employee</label>
                    <input id="type-of-employee" class="form-control" placeholder="Enter Type"  name="i3"required>
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-capitalize" for="from">From</label>
                    <input id="from" class="form-control" type="text" placeholder="From Date" name="i4" required>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-capitalize" for="to">To</label>
                    <input id="to" class="form-control" placeholder="To Date" required type="text" name="i5" >
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-capitalize" for="pay-band">Pay In Pay Band</label>
                    <select class="form-control" id="pay-band" name="i6" required>
                        <option value="" selected disabled>Select Pay Band</option>
                        <option>Option 1</option>
                        <option>Option 2</option>
                        <option>Option 3</option>
                        <option>Option 4</option>
                    </select>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-capitalize" for="agp-gp">AGP/GP</label>
                    <select class="form-control" id="agp-gp" name="i7" required >
                        <option value="" selected disabled>AGP/GP</option>
                        <option>AGP</option>
                        <option>GP</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="text-capitalize" for="basic-pay">Basic Pay</label>
                    <input id="basic-pay" class="form-control" placeholder="Enter Basic Pay" name="i8" required>
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="text-capitalize" for="nature-of work">Nature Of Work</label>
                    <input id="nature-of work" class="form-control" placeholder="Enter Nature of Work" name="i9" required>
                </div>
            </div>
        </div>
        <div class="form-actions" style="margin: 4%;background-color: transparent;text-align: center;">
            <button class="btn btn-lg btn-danger m-1" id="reset" type="reset">Reset</button>
            <button class="btn btn-lg btn-primary m-1" id="submit" value="Insert" type="submit" name="b1">Save and Continue</button>
        </div>
        <%
            if(request.getParameter("b1")!=null)
            {
                Connection con=null;
                Statement st;
                ResultSet rs;
                String org =(request.getParameter("i1"));
                String pos =request.getParameter("i2");
                String type=request.getParameter("i3");
                String from =request.getParameter("i4");
                String to=request.getParameter("i5");
                String payinband=request.getParameter("i6");
                String agp=request.getParameter("i7");
                int basicpay =Integer.parseInt(request.getParameter("i8"));
                String nature=request.getParameter("i9");
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12245685","sql12245685","fpStvI5rK8");
                    // con = DriverManager.getConnection("jdbc:mysql://localhost:3306/summer","root","");
                    st=con.createStatement();
                    String sql="insert into Present_Employee values('"+((String) session.getAttribute("ApplicationNumber"))+"','"+org+"','"+pos+"','"+type+"','"+from+"','"+to+"','"+payinband+"','"+agp+"',"+basicpay+",'"+nature+"')";
                    int res=st.executeUpdate(sql);
                    if(res!=0)
                        out.println("Record Inserted");
                    else
                        out.println("Record Not Inserted");
                }catch(Exception e)
                {
                    out.println(e.toString());
                }
            }
        %>
    </form>
</div>

</body>
</html>

