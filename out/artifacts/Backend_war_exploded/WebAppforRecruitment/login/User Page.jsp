<%@ page import="java.util.Properties" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>@USER</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/backgrounds.css">
    <script src="../jquery/3.3.1/jquery.min.js"></script>
    <script src="../jquery/popper.js/1.14.3/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
<%
    String ApplicationNumber="";
    String Password="";
    String Email="";
    String Name="";
    String Phone ="";
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12244587","sql12244587","MnEsSVNIke");
        ApplicationNumber = (String) session.getAttribute("ApplicationNumber");
        Password = (String) session.getAttribute("Password");
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery("SELECT * from USERS where ApplicationNumber='"+ApplicationNumber+"' and Password ='"+Password+"'");
        if (rs.next()){
            Email = rs.getString("Email");
            Name = rs.getString("FirstName")+" "+rs.getString("LastName");
        }
        statement.close();
        connection.close();
    }catch (Exception e){}
%>
<header>
    <nav class="navbar sticky-top navbar-light bg-light" style="border-bottom-color: #000">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">
                    <img class="img-fluid float-left" src="../Images/form-background.png"
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
            <img class=" img-thumbnail " src="../Images/form-background.png" height="400px" width="300px" alt="User Image">
        </div>
        <div class="card-body text-center">
            <a class="card-link" href="#" id="showApplicationLink">Show Application</a>
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
                        <div class="col-md-6 font-italic" id="card-phone">Value</div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="card-footer text-center">
            <a href="Update%20Information.html" class="card-link">Update Information</a>
        </div>
    </div>
</div>


<div class="card-footer align-bottom mt-2" style="background-color: #c4c4c4">
    <div class="container text-muted text-center rounded">This is footer</div>
</div>

</body>
</html>