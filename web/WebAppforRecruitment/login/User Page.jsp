<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%
    if (session.getAttribute("ApplicationNumber")==null || session.getAttribute("ApplicationNumber")=="")
    {
        response.sendRedirect("/WebAppforRecruitment/login/login.jsp");
    }
    %>
    <meta charset="UTF-8">
    <title><%out.println(session.getAttribute("ApplicationNumber"));%></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/backgrounds.css">
    <script src="../jquery/3.3.1/jquery.min.js"></script>
    <script src="../jquery/popper.js/1.14.3/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function userImagefun() {
            $(document).ready(function(){
                document.getElementById("userImage").setAttribute("src","../Images/UserImages/user.png");
            });
        }
    </script>
</head>
<body>
<%
    String ApplicationNumber="";
    String Password="";
    String Email="";
    String Name="";
    String Phone ="";
    String path ="../Images/UserImages/user.png";
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(session.getAttribute("DatabaseHost").toString(),session.getAttribute("DatabaseUser").toString(),session.getAttribute("DatabasePassword").toString());
        ApplicationNumber = (String) session.getAttribute("ApplicationNumber");
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery("SELECT * from USERS where ApplicationNumber='"+ApplicationNumber+"'");
        if (rs.next()){
            Email = rs.getString("Email");
            Name = rs.getString("FirstName")+" "+rs.getString("LastName");
            Phone = rs.getString("Phone");
        }
        ResultSet rs1 = statement.executeQuery("SELECT * from Personal_Information where ApplicationNumber='"+ApplicationNumber+"'");
        if (rs1.next()){
            String str =rs1.getString("ImageLocation");
            str.trim();
            if (str!=null||str!="")
                path = "../Images/UserImages/"+str;
        }
        statement.close();
        connection.close();
    }catch (Exception e){}
<<<<<<< HEAD
    if (status == 0){
        Status = "Not Yet Submitted";
    }
    else if (status == 1){
        Status = "Application Under Screening";
    }
    else if (status == 2){
    Status = "Application Accepted";
    }
    else if (status == 3){
        Status = "Application Rejected";
    }
=======
>>>>>>> 7ce5be0d27908d2caa3fe8f0781bdc11bf238ba8
%>
<header>
    <nav class="navbar sticky-top navbar-light bg-light" style="border-bottom-color: #000">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">
                    <img class="img-fluid float-left d-sm-none d-md-block" src="../Images/form-background.png"
                         style="margin-left: 5rem;max-width: 7%; height: auto">
                    <img class="img-fluid " src="../Images/mnnit%20name.png"
                         style="margin-left: 3rem;max-width: 80%;height: auto">
                </a>
            </div>
        </div>
    </nav>
    <div class="jumbotron" style="height: 10%">
        <div class="container">
            <h1>Recruitment Portal</h1>
            <div class="bg-dark rounded">
                <h3 class="text-primary text-uppercase" style="color: #FFF;padding: 1%;">Welcome to recruitment portal of mnnit Allahabad</h3>
            </div>
        </div>
    </div>
</header>


<div class="container text-center">
    <div class="card " >
        <div class="card-header align-content-center" style="background:
        radial-gradient(black 15%, transparent 16%) 0 0,
radial-gradient(black 15%, transparent 16%) 8px 8px,
radial-gradient(rgba(255,255,255,.1) 15%, transparent 20%) 0 1px,
radial-gradient(rgba(255,255,255,.1) 15%, transparent 20%) 8px 9px;
background-color:#282828;
background-size:16px 16px;">
                <img class="img-thumbnail" id="userImage" src="<%=path%>" onerror="userImagefun()" height="350px" width="300px">
        </div>
        <div class="card-body text-center">
            <div class="row">
                <div class="col-sm-6">
                    <a class="card-link" href="../UpdateInformation/FinalCV.jsp" id="showApplicationLink">Show Application</a>
                </div>
                <div class="col-sm-6">
                    <a class="card-link" href="UpdateProfileImage.jsp" id="UpdateProfileImageLink">Update Image</a>
                </div>
            </div>
        </div>
        <div class="card-body text-center p-1">
            <ul class="list-group list-group-flush border col">
                <li class="list-group-item">
                    <div class="row text-left">
                        <div class="col-md-6 text-uppercase font-weight-bold">name</div>
                        <div class="col-md-6 font-italic" id="card-name"><%out.println(Name);%></div>
                    </div>
                </li>

                <li class="list-group-item">
                    <div class="row text-left">
                        <div class="col-md-6 text-uppercase font-weight-bold">Application number</div>
                        <div class="col-md-6 font-italic" id="card-application-number"><%out.println(ApplicationNumber);%></div>
                    </div>
                </li>

                <li class="list-group-item">
                    <div class="row text-left">
                        <div class="col-md-6 text-uppercase font-weight-bold">Email</div>
                        <div class="col-md-6 font-italic" id="card-email"><%out.println(Email);%></div>
                    </div>
                </li>

                <li class="list-group-item list-group-flush">
                    <div class="row text-left">
                        <div class="col-md-6 text-uppercase font-weight-bold">Phone</div>
                        <div class="col-md-6 font-italic" id="card-phone"><%out.println(Phone);%></div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="card-footer text-center">
            <a href="../UpdateInformation/PersonalInformation.jsp" class="card-link">Update Information</a>
        </div>
    </div>
</div>


<div class="card-footer align-bottom mt-2" style="background-color: #c4c4c4">
    <div class="container text-muted text-center rounded">
        <form method="post" action="../logout.jsp">
            <button class="btn btn-danger btn-sm" name="logout">Logout</button>
        </form>
    </div>
</div>

</body>
</html>