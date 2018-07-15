<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Intellectual Property Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../jquery/3.3.1/jquery.min.js"></script>
    <script src="../jquery/popper.js/1.14.3/popper.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <link href="../css/datepicker.css" rel="stylesheet">
    <script src="../js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
        $(function() {
            $( "#Reviewer_Date" ).datepicker({
                format: "mm-yyyy",
                viewMode: "months",
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
<div class="container"  >
    <form id="Reviewer" action="" style="width: 100%;" method="post">
        <div class="row " >
            <div class="col-sm-4" >
                <p >Whether acted as reviewer for Conference/Journal </p>
            </div>
            <div class="col-sm-8">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio"value="Conference" name="Reviewer" id="Reviewer_Conference">
                    <label class="form-check-label" for="Reviewer_Conference">Conference</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" value="Journal" name="Reviewer" id="Reviewer_Journal">
                    <label class="form-check-label" for="Reviewer_Journal">Journal</label>
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-4">
                <div class="form-group" style="margin-top:3% ">
                    <label for="Reviewer_Name">Full Name of Conference/Journal</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group" >
                    <input type="text" class="form-control" id="Reviewer_Name" name="i1"  placeholder="Enter Name">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-4">
                <div class="form-group" style=" margin-top:3% ">
                    <label for="Reviewer_Publisher">Publisher</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group" >
                    <input type="text" class="form-control" id="Reviewer_Publisher" name="i2"  placeholder="Enter Publisher">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-4">
                <div class="form-group" style=" margin-top:3% ">
                    <label for="Reviewer_Date">Month/Year</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group" >
                    <input type="text" class="form-control" id="Reviewer_Date"   name="i3" placeholder="MM/YYYY">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-4">

            </div>
            <div class="col-sm-8">
                <button class="btn btn-lg btn-primary m-1" id="submit" value="Insert" type="submit" name="b1">ADD</button>
                <button class="btn btn-lg btn-success m-1" id="submit" value="Insert" type="submit" name="b2">Continue</button>

            <%
                    if(request.getParameter("b1")!=null)
                    {
                        Connection con=null;
                        Statement st;
                        ResultSet rs;
                        String Reviewer =(request.getParameter("Reviewer"));
                        String name =request.getParameter("i1");
                        String publisher=request.getParameter("i2");
                        String date =request.getParameter("i3");
                        String status=request.getParameter("Status");
                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12245685","sql12245685","fpStvI5rK8");
                            st=con.createStatement();
                            String sql="insert into Acted_As_Reviewer values('"+((String) session.getAttribute("ApplicationNumber"))+"','"+Reviewer+"','"+name+"','"+publisher+"','"+date+"')";
                            int res=st.executeUpdate(sql);
                            if(res!=0){
                %>
        <button class="btn btn-lg btn-dark m-1" id="add" onclick="myfunc()" type="submit" name="b3">Add More</button>
</div>
</div>
<%
            } else{
                out.println("Record Not Inserted");
            }
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