<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Patent</title>
    <script type="text/javascript">
        $(function() {
            $( "#Patent_Date" ).datepicker({
                format: "dd-mm-yyyy",
                viewMode: "months",
                minViewMode: "days",
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
    <form id="Patent">
        <fieldset class="form-group">
            <div class="row">
                <label class="col-form-label col-sm-2 pt-0">Type</label>
                <div class="col-sm-10">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="Patent_Applied_Option" value="Applied" checked>
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
                <input type="text" class="form-control col-md-10" pattern="[0-9-]+" id="Patent_Date" placeholder="DD-MM-YYYY" name="Date" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="Patent_Number" class="col-md-2">Number</label>
            <div class="col-sm-10">
                <input type="text" class="form-control  col-md-10" pattern="[0-9.:/-]+" id="Patent_Number" placeholder="" name="Number" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="Patent_Type" class="col-md-2">Type</label>
            <div class="col-sm-10">
                <input class="form-control  col-md-10" id="Patent_Type" placeholder="" name="Type" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="Patent_Description" class="col-md-2">Description</label>
            <div class="col-sm-10">
               <textarea class="form-control" id="Patent_Description" placeholder="Write description here. " name="Description" required></textarea>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2" style="display:flex;margin: auto;">
                <button class="btn btn-lg btn-primary btn-block m-1" id="Patent_b1" value="Insert" type="submit" name="Patent_b1" >Submit</button>
            </div>
        </div>
        <%
            if(request.getParameter("Patent_b1")!=null)
            {
                Connection con=null;
                Statement st;
                ResultSet rs;
                String radio = request.getParameter("inlineRadioOptions");
                String date=(request.getParameter("Date"));
                String number =request.getParameter("Number");
                String type=request.getParameter("Type");
                String description =request.getParameter("Description");
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12245685","sql12245685","fpStvI5rK8");
                    // con = DriverManager.getConnection("jdbc:mysql://localhost:3306/summer","root","");
                    st=con.createStatement();
                    String sql="insert into Patent values('"+((String) session.getAttribute("ApplicationNumber"))+"','"+radio+"','"+date+"','"+number+"','"+type+"','"+description+"')";
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
