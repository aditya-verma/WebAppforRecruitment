<%@page import="java.sql.*"%>
<%@ page import="com.mysql.cj.Session" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../jquery/3.3.1/jquery.min.js"></script>
    <script src="../jquery/popper.js/1.14.3/popper.min.js"></script>
    <script src="../js/bootstrap.js"></script>


    <style>
        body {

            background-color: #f5f5f5;
        }
    </style>
</head>
<body>



<div class="container">
    <form id="Project_Investigated" action="" method="post" style="width: 100%;">
        <div class="row " >
            <div class="col-sm-4" >
                <p >Role</p>
            </div>
            <div class="col-sm-8">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="Role" value="PI" id="Project_Investigated_Pi">
                    <label class="form-check-label" for="Project_Investigated_Pi">PI</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="Role" value="Co-PI" id="Project_Investigated_Co_Pi">
                    <label class="form-check-label" for="Project_Investigated_Co_Pi">Co-PI</label>
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-4" style="text-align: left">
                <div class="form-group" >
                    <label for="Project_Investigated_P_Title">Title</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group" >
                    <input type="text" class="form-control" name="i1" id="Project_Investigated_P_Title"  placeholder="Enter Title">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-4" style="text-align: left">
                <div class="form-group" style="margin-top:3% ">
                    <label for="Project_Investigated_Funding_Agency">Funding Agency</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group" >
                    <input type="text" class="form-control" name="i2" id="Project_Investigated_Funding_Agency"  placeholder="Enter Funding Agency">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-4" style="text-align: left">
                <div class="form-group" style="margin-top:3% ">
                    <label for="Project_Investigated_Amount">Amount</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group" >
                    <input type="text" class="form-control" name="i3" id="Project_Investigated_Amount"  placeholder="Enter Amount">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-4" >
                <p >Status</p>
            </div>
            <div class="col-sm-8">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" value="Completed" name="Status" id="Project_Investigated_Complete">
                    <label class="form-check-label" for="Project_Investigated_Complete">Complete</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" value="Ongoing" name="Status" id="Project_Investigated_Ongoing">
                    <label class="form-check-label" for="Project_Investigated_Ongoing">Ongoing</label>
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-4">

            </div>
            <div class="col-sm-8">
                <button class="btn btn-lg btn-primary m-1" id="submit" value="Insert" type="submit" name="b1">ADD</button>


                <%
                    if(request.getParameter("b1")!=null)
                    {
                        Connection con=null;
                        Statement st;
                        ResultSet rs;
                        String role =(request.getParameter("Role"));
                        String title =request.getParameter("i1");
                        String fundingAgency=request.getParameter("i2");
                        int amount =Integer.parseInt(request.getParameter("i3"));
                        String status=request.getParameter("Status");
                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12245685","sql12245685","fpStvI5rK8");
                            st=con.createStatement();
                            String sql="insert into Research_Project_Investigated values('"+session.getAttribute("ApplicationNumber")+"','"+role+"','"+title+"','"+fundingAgency+"',"+amount+",'"+status+"')";
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