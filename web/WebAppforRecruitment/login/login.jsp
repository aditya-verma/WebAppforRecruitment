<%@ page import="java.util.Properties" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.security.SecureRandom" %>
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
<div class="modal fade" id="modalRegisterForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <form method="post" action="" class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Register</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body mx-3">
                <div class="md-form mb-2">
                    <div class="row">
                        <div class="col-sm-6">
                            <input type="text" name="orangeForm-Fname" class="form-control validate" placeholder="FName" required>
                        </div>
                        <div class="col-sm-6">
                            <input type="text" name="orangeForm-Lname" class="form-control validate" placeholder="LName" required>
                        </div>
                    </div>
                </div>
                <div class="md-form mb-2">
                    <input type="email" name="orangeForm-email" class="form-control validate" placeholder="Email" required>
                </div>
                <div class="md-form mb-2">
                    <input type="text" name="orangeForm-phone" class="form-control validate" placeholder="Mobile Number" required>
                </div>
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <button class="btn btn-primary" name="register-btn">Register</button>
            </div>
            <%
                if (request.getParameter("register-btn")!=null){
                    try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection connection = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12244587","sql12244587","MnEsSVNIke");
                        Statement statement = connection.createStatement();
                        String fname = request.getParameter("orangeForm-Fname");
                        String lname = request.getParameter("orangeForm-Lname");
                        String email = request.getParameter("orangeForm-email");
                        String phone = request.getParameter("orangeForm-phone");
                        if (!phone.startsWith("+91")&& phone.length()==10)
                            phone = "+91"+phone;
                        else if (phone.length()!=10 || phone.length()!=13){
                            %><div class="alert-danger"><%out.print("Invalid Phone number!");%></div> <%
                        }
                        int year =  Integer.parseInt(new java.text.SimpleDateFormat("yyyy").format(new java.util.Date()));
                        String post = "PF";
                        statement.executeUpdate("INSERT INTO TEMP_USER(Year,POST,Email,FirstName,LastName,Phone) VALUES ("+year+",'"+post+"','"+email+"','"+fname+"','"+lname+"','"+phone+"')");
                        ResultSet rs = statement.executeQuery("SELECT Serial from TEMP_USER where email='"+email+"' and phone='"+phone+"'");
                        String ApplicationNum="";
                        if (rs.next())
                        {
                            String temp = Integer.toString(rs.getInt("Serial"));
                            while (temp.length()<6)
                                temp = "0"+temp;
                            ApplicationNum = Integer.toString(year)+post+temp;
                            final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
                            SecureRandom rnd = new SecureRandom();
                            StringBuilder sb = new StringBuilder( 8 );
                            for( int i = 0; i < 8; i++ )
                                sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );
                            String temp_pass = sb.toString();
                            statement.executeUpdate("INSERT INTO USERS(ApplicationNumber,FirstName,LastName,Email,Password,Phone) VALUES ('"+ApplicationNum+"','"+fname+"','"+lname+"','"+email+"','"+temp_pass+"','"+phone+"')");
                        }
                        statement.close();
                        connection.close();
                    }catch (Exception e){
                        %><div class="alert-danger mr-2 ml-2"><%out.println(e);%></div> <%
                    }
                }
            %>
        </form>
    </div>
</div>

    <div class="container-fluid">
    <form class="form-signin" method="post" action="">
        <img class="img-responsive col-12 mb-lg-5" style="margin-left: -1.5rem  "  src="../Images/mnnit logo.png" alt="MNNIT_LOGO">
        <div class="text-center">
            <h1 class="h3 mb-5 mt-1  font-weight-normal" style="color: #545353;">Recruitment Portal</h1>
        </div>
        <div class="form-label-group">
            <input type="text" id="inputApplication" name="AppNumber" class="form-control" placeholder="Application Number" required="" autofocus="">
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
                <button class="btn btn-lg btn-default btn-block" type="create_user" data-toggle="modal" data-target="#modalRegisterForm">Register</button>
            </div>
        </div><br>
        <a href="#" class="col-12 page-link text-center" style="background-color: #f5f5f5;border: none;">Forgot Password</a>
        <%
            if(request.getParameter("dologin")!=null){
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    //Use properties if database and server are on same machine
                    /*
                    Properties properties = new Properties();
                    properties.setProperty("user","root");
                    properties.setProperty("password","");
                    properties.setProperty("useSSL","true");
                    properties.setProperty("autoReconnect","true");
                     */
                    Connection con=DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12244587","sql12244587","MnEsSVNIke");
                    Statement stmt=con.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from USERS where ApplicationNumber='"+request.getParameter("AppNumber")+"' and Password='"+request.getParameter("Password")+"'");
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
                session.setAttribute("ApplicationNumber",rs.getString("ApplicationNumber"));
                session.setAttribute("Password",rs.getString("Password"));
                response.sendRedirect("User Page.jsp");
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