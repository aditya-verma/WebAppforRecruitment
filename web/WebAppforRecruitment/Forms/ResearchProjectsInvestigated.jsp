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
                    <input class="form-check-input" type="radio" name="Project_Investigated_Role" value="PI" id="Project_Investigated_Pi" checked>
                    <label class="form-check-label" for="Project_Investigated_Pi">PI</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="Project_Investigated_Role" value="Co-PI" id="Project_Investigated_Co_Pi">
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
                    <input type="text" class="form-control" name="Project_Investigated_i1" id="Project_Investigated_P_Title"  placeholder="Enter Title" required>
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
                    <input type="text" class="form-control" name="Project_Investigated_Funding_Agency" id="Project_Investigated_Funding_Agency"  placeholder="Enter Funding Agency" required>
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
                    <input type="text" class="form-control" pattern="[0-9/-:]+" name="Project_Investigated_Amount" id="Project_Investigated_Amount"  placeholder="Numeric Amount" required>
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-4" >
                <p >Status</p>
            </div>
            <div class="col-sm-8">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" value="Completed" name="Project_Investigated_Status" id="Project_Investigated_Complete" checked>
                    <label class="form-check-label" for="Project_Investigated_Complete">Complete</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" value="Ongoing" name="Project_Investigated_Status" id="Project_Investigated_Ongoing">
                    <label class="form-check-label" for="Project_Investigated_Ongoing">Ongoing</label>
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-4">
            </div>
            <div class="col-sm-8">
                <button class="btn btn-lg btn-primary m-1" id="Research_project_Investigated_submit" value="Insert" type="submit" name="Research_project_Investigated_submit">Add</button>
            </div>
        </div>
        <%
            if(request.getParameter("Research_project_Investigated_submit")!=null)
            {

                String Project_Investigated_Role =(request.getParameter("Project_Investigated_Role"));
                String Project_Investigated_P_Title =request.getParameter("Project_Investigated_P_Title");
                String Project_Investigated_Funding_Agency=request.getParameter("Project_Investigated_Funding_Agency");
                String Project_Investigated_Amount=request.getParameter("Project_Investigated_Amount");
                String Project_Investigated_Status=request.getParameter("Project_Investigated_Status");
                try{
                    Connection con=null;
                    Statement st;
                    ResultSet rs;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12245685","sql12245685","fpStvI5rK8");
                    st=con.createStatement();
                    String sql="insert into Research_Project_Investigated values('"+((String) session.getAttribute("ApplicationNumber"))+"','"+Project_Investigated_Role+"','"+Project_Investigated_P_Title+"','"+Project_Investigated_Funding_Agency+"','"+Project_Investigated_Amount+"','"+Project_Investigated_Status+"')";
                    int res=st.executeUpdate(sql);
                    if(res!=0){
        %><div class="text-center alert-success">Record Inserted</div><%
    }
    else{
    %><div class="text-center alert-danger">Record not Inserted</div><%
        }
        con.close();
        st.close();
    }catch(Exception e)
    {
    %><div class="alert-warning text-center"><% out.print(e);%></div> <%
            }
        }
    %>
    </form>
</div>
</body>
</html>