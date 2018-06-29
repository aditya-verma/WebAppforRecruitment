<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
<header>
    <nav class="navbar sticky-top navbar-light bg-light"  style="border-bottom-color: #000">
        <div class="container" >
            <div class="navbar-header" >
                <a class="navbar-brand" href="#">
                    <img class="img-fluid float-left" src="../Images/form-background.png" style="margin-left: 5rem;max-width: 7%; height: auto">
                    <img class="img-fluid " src="../Images/mnnit%20name.png" style="margin-left: 3rem;max-width: 80%;height: auto">
                </a>
            </div>
        </div>
    </nav>
    <div class="jumbotron" style="height: 10%">
        <div class="container" >
            <h1>Intellectual Property Portal</h1>
            <div class="bg-dark rcorners2 ">
                <h3  style="color: #FFF;padding: 1%; ">Research Projects Completed/Ongoing:</h3>
            </div>
            <% if(request.getParameter("b1")!=null)
            {%>
            <div class="alert alert-success rcorners2" style="margin-top: 3%">
                <strong>Record Inserted! </strong><b>ADD MORE</b> or press <b>Continue</b> to proceed.
            </div>
            <% }%>
        </div>
    </div>
</header>

<div class="container">
    <form id="Project_Investigated" action="" method="post" style="width: 100%;padding-left: 30%;">
        <div class="row " style="margin-top: 5%">
            <div class="col-sm-2" >
                <p >Role</p>
            </div>
            <div class="col-sm-4">
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
            <div class="col-sm-2" style="text-align: left">
                <div class="form-group" >
                    <label for="Project_Investigated_P_Title">Title</label>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group" >
                    <input type="text" class="form-control" name="i1" id="Project_Investigated_P_Title"  placeholder="Enter Title">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-2" style="text-align: left">
                <div class="form-group" style="margin-top:3% ">
                    <label for="Project_Investigated_Funding_Agency">Funding Agency</label>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group" >
                    <input type="text" class="form-control" name="i2" id="Project_Investigated_Funding_Agency"  placeholder="Enter Funding Agency">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-2" style="text-align: left">
                <div class="form-group" style="margin-top:3% ">
                    <label for="Project_Investigated_Amount">Amount</label>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group" >
                    <input type="text" class="form-control" name="i3" id="Project_Investigated_Amount"  placeholder="Enter Amount">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-2" >
                <p >Status</p>
            </div>
            <div class="col-sm-4">
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
            <div class="col-sm-2">

            </div>
            <div class="col-sm-6">
                <button class="btn btn-lg btn-primary m-1" id="submit" value="Insert" type="submit" name="b1">ADD</button>
                <button class="btn btn-lg btn-success m-1" id="submit" value="Insert" type="submit" name="b2">Continue</button>


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
                            con = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12244587","sql12244587","MnEsSVNIke");
                            st=con.createStatement();
                            String sql="insert into Research_Project_Investigated values('A123','"+role+"','"+title+"','"+fundingAgency+"',"+amount+",'"+status+"')";
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