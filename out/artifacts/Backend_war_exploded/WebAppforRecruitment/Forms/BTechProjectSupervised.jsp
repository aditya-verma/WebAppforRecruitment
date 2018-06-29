<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Btech Project</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link href="../css/datepicker.css" rel="stylesheet">
    <script src="../jquery/3.3.1/jquery.min.js"></script>
    <script src="../jquery/popper.js/1.14.3/popper.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
    $(function() {
        $( "#BTech_Project_Completed" ).datepicker({
            format: "mm-yyyy",
            viewMode: "months",
            minViewMode: "months"});
    });
</script>
</head>
<body>
<div class="container">
    <form id="BTech_Project">
        <div class="form-group row">
            <label for="BTech_Project_Title" class="col-md-2">Title Of Project</label>
            <div class="col-md-10">
                <input type="text" class="form-control" id="BTech_Project_Title" placeholder="Enter Project Title" name="Project_Title">
            </div>
        </div>
        <div class="form-group row">
            <label for="BTech_Project_Names" class="col-md-2">Name of Students</label>
            <div class="col-md-10">
                <input type="text" id="BTech_Project_Names" class="form-control" placeholder="Enter Names of student" name="Students">
            </div>
        </div>
        <div class="form-group row">
            <label for="BTech_Project_RNumber" class="col-md-2">Registration Numbers of Students</label>
            <div class="col-md-10">
                <input type="text" class="form-control" id="BTech_Project_RNumber" placeholder="Enter Registration Numbers" name="Registration_Numbers">
            </div>
        </div>
        <div class="form-group row">
            <label for="BTech_Project_Completed" class="col-md-2">Completed On</label>
            <div class="col-md-10">
                <input class="form-control" type="text" id="BTech_Project_Completed" name="Completed_On">
            </div>
        </div>
        <div class="row">
        <div class="col-sm-2" style="display:flex;margin: auto;">
            <button class="btn btn-lg btn-primary btn-block m-1" id="next" value="Insert" type="submit" name="b1" >Submit</button>
        </div>
        </div>
        <%
            if(request.getParameter("b1")!=null)
            {
                Connection con=null;
                Statement st;
                ResultSet rs;
                String project_title=(request.getParameter("Project_Title"));
                String students =request.getParameter("Students");
                String registration_numbers=request.getParameter("Registration_Numbers");
                String completed_on =request.getParameter("Completed_On");
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12244587","sql12244587","MnEsSVNIke");
                    // con = DriverManager.getConnection("jdbc:mysql://localhost:3306/summer","root","");
                    st=con.createStatement();
                    String sql="insert into BTech_Project_Supervised values('"+((String) session.getAttribute("ApplicationNumber"))+"','"+project_title+"','"+students+"','"+registration_numbers+"','"+completed_on+"')";
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
