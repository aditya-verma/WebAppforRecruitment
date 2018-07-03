<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="../js/bootstrap-datepicker.js"></script>
    <link href="../css/datepicker.css" rel="stylesheet">
    <script type="text/javascript">
        $(function() {
            $( "#Awards_Received_Date" ).datepicker({
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

    <form id="Awards_Received" action="" method="post" style="width: 100%;">
        <div class="row " style="margin-top: 5%">
            <div class="col-sm-4" style="text-align: left">
                <div class="form-group" >
                    <label >Description</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group" >
                    <textarea type="text" class="form-control" id="event"  name="i1" placeholder="Write Event Description "></textarea>
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-4" style="text-align: left">
                <div class="form-group" >
                    <label for="Awards_Received_Date">Received on</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group" >
                    <input type="text" class="form-control" name="i2" id="Awards_Received_Date"  placeholder="DD/MM/YYYY">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-4">
            </div>
            <div class="col-sm-8">
                <button class="btn btn-lg btn-success m-1" id="next" value="Insert" type="submit" name="b2">Submit</button>
            </div>
        </div>
        <%
            if(request.getParameter("b1")!=null)
            {
                Connection con=null;
                Statement st;
                ResultSet rs;
                String des =(request.getParameter("i1"));
                String date =request.getParameter("i2");

                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12245685","sql12245685","fpStvI5rK8");
                    // con = DriverManager.getConnection("jdbc:mysql://localhost:3306/summer","root","");
                    st=con.createStatement();
                    String sql="insert into Award_Honour_Received values('"+((String) session.getAttribute("ApplicationNumber"))+"','"+des+"','"+date+"')";
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

</body>
</html>