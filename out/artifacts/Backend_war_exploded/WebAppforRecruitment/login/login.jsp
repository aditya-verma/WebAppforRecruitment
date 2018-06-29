<%@ page import="java.util.Properties" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link href="../css/floating-labels.css" rel="stylesheet">
    <script src="../jquery/3.3.1/jquery.min.js"></script>
    <script src="../jquery/popper.js/1.14.3/popper.min.js"></script>
    <script src="../js/bootstrap.js"></script>
</head>
<body>
    <div class="modal fade" tabindex="-1" role="dialog" id="exampleModal">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content" style="background-color: #f5f5f5;">
                <div class="modal-header">
                    <h5 class="modal-title">New User</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
    <form class="form-signin" method="post" action="">
        <img class="img-responsive col-12 mb-lg-5" style="margin-left: -1.5rem  "  src="../Images/mnnit logo.png" alt="MNNIT_LOGO">
        <div class="text-center">
            <h1 class="h3 mb-5 mt-1  font-weight-normal" style="color: #545353;">Recruitment Portal</h1>
        </div>
        <div class="form-label-group">
            <input type="email" id="inputEmail" name="Email" class="form-control" placeholder="Email address" required="" autofocus="">
        </div>
        <div class="form-label-group">
             <input type="password" id="inputPassword" name="Password" class="form-control" placeholder="Password" required="">
        </div>
        <div class="checkbox mb-4">
            <label>
                <input type="checkbox" value="remember-me"> Remember me
            </label>
        </div>
        <div class="row" >
            <div class="col-md-6" style="margin-bottom: 0.75rem">
                <button class="btn btn-lg btn-primary btn-block" name="dologin" type="submit" >Sign in</button>
            </div>
            <div class="col-md-6" style="margin-bottom: 0.75rem">
                <button class="btn btn-lg btn-default btn-block" type="create_user" data-toggle="modal" data-target="#exampleModal">Register</button>
            </div>
        </div><br>
        <a href="#" class="col-12 page-link text-center" style="background-color: #f5f5f5;border: none;">Forgot Password</a>
        <%
            if(request.getParameter("dologin")!=null){
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Properties properties = new Properties();
                    properties.setProperty("user", "root");
                    properties.setProperty("password", "");
                    properties.setProperty("useSSL", "false");
                    properties.setProperty("autoReconnect", "true");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test",properties);
                    Statement stmt=con.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from USERS where email='"+request.getParameter("Email")+"' and Password='"+request.getParameter("Password")+"'");
                    if (!rs.next())
                    {
        %>
                        <div class="alert-danger text-center">User Does Not Exits!</div>
        <%
                    }
                    else{
        %>
        <div class="alert-success text-center">
            <%
                out.println(rs.getString(1)+"  "+rs.getString(2)+"  "+rs.getString(3)+"  "+rs.getString(4)+"  "+rs.getString(5));
            %>
        </div>
        <%            }
                }catch(Exception e){ out.println(e);}
            }
        %>
    </form>
    <footer class="card-footer fixed-bottom text-center" style="background-color: #c4c4c4">
        <div class="container">
            <p class="mt-1 mb-1 text-muted text-center">© 2017-2018</p>
        </div>
    </footer>
    </div>
</body>
</html>

