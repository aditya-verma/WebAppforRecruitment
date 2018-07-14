<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <script type="text/javascript">
        $(function() {
            $( "#PG_Supervision_Completed" ).datepicker({
                format: "mm-yyyy",
                viewMode: "years",
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
    <form id="PG_Supervision">
        <div class="form-group row">
            <label for="PG_Supervision_Name" class="col-md-4">Name</label>
            <div class="col-md-8">
                <input type="text" class="form-control" id="PG_Supervision_Name" placeholder="Enter Name" name="Name">
            </div>
        </div>
        <div class="form-group row">
            <label for="PG_Supervision_RNumber" class="col-md-4">Registration Number</label>
            <div class="col-md-8">
                <input type="text" id="PG_Supervision_RNumber" class="form-control" placeholder="Enter Registration Number of student" name="Registration_Number">
            </div>
        </div>
        <div class="form-group row">
            <label for="PG_Supervision_Title" class="col-md-4">Title of Thesis</label>
            <div class="col-md-8">
                <input type="text" class="form-control" id="PG_Supervision_Title" placeholder="Enter Title of Thesis" name="Title">
            </div>
        </div>
        <div class="form-group row">
            <label for="PG_Supervision_Completed" class="col-md-4">Completed On</label>
            <div class="col-md-8">
                <input class="form-control" type="text" id="PG_Supervision_Completed" name="Completed_On" placeholder="MM-YYYY">
            </div>
        </div>
        <fieldset class="form-group">
            <div class="row">
                <legend class="col-form-label col-sm-4 pt-0">Whether there are Co-Supervisors</legend>
                <div class="col-sm-8">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="PG_Supervision_Yes" value="Yes">
                        <label class="form-check-label" for="PG_Supervision_Yes">
                            Yes
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="PG_Supervision_No" value="No">
                        <label class="form-check-label" for="PG_Supervision_No">
                            No
                        </label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">

                </div>
                <div class="col-md-8">
                    <button class="btn btn-lg btn-primary m-1" id="next" value="Insert" type="submit" name="b1">Submit</button>
                </div>
            </div>
        </fieldset>
        <%
            if(request.getParameter("b1")!=null)
            {
                Connection con=null;
                Statement st;
                ResultSet rs;
                String name=(request.getParameter("Name"));
                String registration_number =request.getParameter("Registration_Number");
                String title=request.getParameter("Title");
                String completed_on =request.getParameter("Completed_On");
                String radio = request.getParameter("inlineRadioOptions");
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12245685","sql12245685","fpStvI5rK8");
                    // con = DriverManager.getConnection("jdbc:mysql://localhost:3306/summer","root","");
                    st=con.createStatement();
                    String sql="insert into PG_Supervision values('"+((String) session.getAttribute("ApplicationNumber"))+"','"+name+"','"+registration_number+"','"+title+"','"+completed_on+"','"+radio+"')";
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