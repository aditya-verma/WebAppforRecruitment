<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Patent</title>
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
            $( "#Date" ).datepicker({
                format: "dd-mm-yyyy",
                viewMode: "days",
                minViewMode: "days",
                pickerPosition: "bottom-left"});
        });
    </script>
</head>
<body>
<div class="container">
    <form id="Patent">
        <fieldset class="form-group">
            <div class="row">
                <legend class="col-form-label col-sm-2 pt-0">Type</legend>
                <div class="col-sm-10">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="Patent_Applied_Option" value="Applied">
                        <label class="form-check-label" for="Patent_Applied_Option">
                            Applied
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="Patent_Granted_Option" value="Granted">
                        <label class="form-check-label" for="Patent_Granted_Option">
                            Granted
                        </label>
                    </div>
                </div>
            </div>
        </fieldset>
        <div class="form-group row">
            <label for="Patent_Date" class="col-md-2">Date</label>
            <div class="col-sm-10">
                <input type="text" class="form-control  col-md-10" id="Patent_Date" placeholder="DD/MM/YYYY" name="Date">
            </div>
        </div>
        <div class="form-group row">
            <label for="Patent_Number" class="col-md-2">Number</label>
            <div class="col-sm-10">
                <input type="text" class="form-control  col-md-10" id="Patent_Number" placeholder="" name="Number">
            </div>
        </div>
        <div class="form-group row">
            <label for="Patent_Type" class="col-md-2">Type</label>
            <div class="col-sm-10">
                <input class="form-control  col-md-10" id="Patent_Type" placeholder="" name="Type">
            </div>
        </div>
        <div class="form-group row">
            <label for="Patent_Description" class="col-md-2">Description</label>
            <div class="col-sm-10">
               <textarea class="form-control" id="Patent_Description" placeholder="Write description here. " name="Description"></textarea>
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
                String radio = request.getParameter("inlineRadioOptions");
                String project_title=(request.getParameter("Date"));
                String students =request.getParameter("Number");
                String registration_numbers=request.getParameter("Type");
                String completed_on =request.getParameter("Description");
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
