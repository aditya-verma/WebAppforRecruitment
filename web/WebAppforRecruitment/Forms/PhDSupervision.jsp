<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Update Information</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <script src="../jquery/3.3.1/jquery.min.js"></script>
    <script src="../jquery/popper.js/1.14.3/popper.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
        $(function() {
            $( "#PhD_Supervision_Oral" ).datepicker({
                format: "dd-mm-yyyy",
                viewMode: "years",
                minViewMode: "days"});
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
    <form id="PhD_Supervision">
        <div class="form-group row">
            <label for="PhD_Supervision_Name" class="col-md-4">Name</label>
            <div class="col-md-8">
                <input type="text" class="form-control" id="PhD_Supervision_Name" placeholder="Enter Name" name="Name" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="PhD_Supervision_RNumber" class="col-md-4">Registration Number</label>
            <div class="col-md-8">
                <input type="text" id="PhD_Supervision_RNumber" class="form-control" placeholder="Enter Registration Number of student" name="Registration_Number" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="PhD_Supervision_Title" class="col-md-4">Title of Thesis</label>
            <div class="col-md-8">
                <input type="text" class="form-control" id="PhD_Supervision_Title" placeholder="Enter Title of Thesis" name="Title" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="PhD_Supervision_Oral" class="col-md-4">Oral-Viva Date</label>
            <div class="col-md-8">
                <input type="text" class="form-control" pattern="[0-9-]+" id="PhD_Supervision_Oral" placeholder="DD-MM-YYYY" name="Date" required>
            </div>
        </div>
        <fieldset class="form-group">
            <div class="row">
                <label class="col-form-label col-sm-4 pt-0">Whether there are Co-Supervisors</label>
                <div class="col-sm-8">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="PhD_Supervision_Yes" value="Yes" checked>
                        <label class="form-check-label" for="PhD_Supervision_Yes">
                            Yes
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="PhD_Supervision_No" value="No">
                        <label class="form-check-label" for="PhD_Supervision_No">
                            No
                        </label>
                    </div>
                </div>
            </div>
        </fieldset>
        <div class="row">
            <div class="col-sm-4">

            </div>
            <div class="col-md-8">
                <button class="btn btn-lg btn-primary m-1" id="PhD_Supervisionnext" value="Insert" type="submit" name="PhD_Supervision_b1">Submit</button>
            </div>
        </div>
        <%
            if(request.getParameter("PhD_Supervision_b1")!=null)
            {
                Connection con=null;
                Statement st;
                ResultSet rs;
                String name=(request.getParameter("Name"));
                String registration_number =request.getParameter("Registration_Number");
                String title=request.getParameter("Title");
                String completed_on =request.getParameter("Date");
                String radio = request.getParameter("inlineRadioOptions");
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12245685","sql12245685","fpStvI5rK8");
                    // con = DriverManager.getConnection("jdbc:mysql://localhost:3306/summer","root","");
                    st=con.createStatement();
                    String sql="insert into PhD_Supervision values('"+((String) session.getAttribute("ApplicationNumber"))+"','"+name+"','"+registration_number+"','"+title+"','"+completed_on+"','"+radio+"')";
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