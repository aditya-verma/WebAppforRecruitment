<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONException" %>
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
    <%!
        String str[] = new String[5];
        String postname[];
        String postcode[];
        String Host = "";
        String databaseUser="";
        String databasePassword="";
    %>
    <%
        try {
            String poststr="";
            String postc="";
            File dir = new File("D:\\Post\\");
            for (File file : dir.listFiles()) {
                FileReader fileReader = new FileReader(file);
                BufferedReader br = new BufferedReader(fileReader);
                String str = br.readLine();
                JSONObject jsonObject = new JSONObject(str);
                poststr+= jsonObject.getString("name")+">";
                postc+=jsonObject.getString("post")+">";
                poststr.substring(0,poststr.length()-1);
                postc.substring(0,postc.length()-1);
                br.close();
            }
            postname = poststr.split(">");
            postcode = postc.split(">");
        }
        catch (JSONException e){out.println("Json Exception occured");}
        catch (Exception e){}
        try {

            FileReader in = new FileReader("D:\\Database.txt");
            BufferedReader br = new BufferedReader(in);
            for (int i=0;i<5;i++)
            {
                str[i]=br.readLine();
            }
            in.close();
            Host= "jdbc:mysql://"+str[0]+":"+str[1]+"/"+str[2];
            databaseUser = str[3];
            databasePassword = str[4];
        }
        catch (FileNotFoundException e){}
    %>
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
                        <div class="col-sm-6 mb-sm-2">
                            <input type="text" name="orangeForm-Fname" class="form-control validate" placeholder="First Name" required>
                        </div>
                        <div class="col-sm-6">
                            <input type="text" name="orangeForm-Lname" class="form-control validate" placeholder="Last Name" required>
                        </div>
                    </div>
                </div>
                <div class="md-form mb-2">
                    <label for="postApplied">Post Applied</label>
                    <select class="form-control" name="orangeForm-post" id="postApplied" required>
                        <option value="" selected disabled>Select Post Applying for</option>
                        <%
                            for (int i = 0; i < postname.length; i++) {
                                %><option><%out.println(postname[i]);%></option> <%
                            }
                        %>
                    </select>
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
                            Connection connection = DriverManager.getConnection(Host,databaseUser,databasePassword);
                            Statement statement = connection.createStatement();
                            String fname = request.getParameter("orangeForm-Fname");
                            String lname = request.getParameter("orangeForm-Lname");
                            String email = request.getParameter("orangeForm-email");
                            String phone = request.getParameter("orangeForm-phone");

                            if ((!phone.startsWith("+91")&&phone.length()==10)||(phone.startsWith("+91")&&phone.length()==13))
                            {
                                phone = "+91"+phone;
                                int year =  Integer.parseInt(new java.text.SimpleDateFormat("yyyy").format(new java.util.Date()));
                                String post = "";
                                for (int i=0; i<postname.length; i++) {
                                    if (postname[i].equalsIgnoreCase(request.getParameter("orangeForm-post"))){
                                        post=postcode[i];
                                    }
                                }
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
                            }
                            else{
                                %><div class="text-center alert-warning">Check your Phone Number!</div><script>$('#modalRegisterForm').modal('show');</script><%
                            }
                            statement.close();
                            connection.close();
                        }
                        catch (java.sql.SQLIntegrityConstraintViolationException e){
                            %><div class="text-center alert-warning">Email Id already registered!</div> <script>$('#modalRegisterForm').modal('show');</script><%
                        }
                        catch (com.mysql.cj.jdbc.exceptions.CommunicationsException e){
                            %><div class="alert-danger text-center">Check Your Internet Connection!</div><script>$('#modalRegisterForm').modal('show');</script><%
                        }
                        catch (Exception e){
                            %><div class="alert-danger text-center"><%out.println(e);%></div> <script>$('#modalRegisterForm').modal('show');</script><%
                        }
                    }
            %>
        </form>
    </div>
</div>

<div class="container-fluid mb-5 pb-5">
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
                <input type="checkbox" name="checkbox-login" value="remember-me"> Remember me
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
                        Connection con=DriverManager.getConnection(Host,databaseUser,databasePassword);
                        Statement stmt=con.createStatement();
                        ResultSet rs=stmt.executeQuery("select * from USERS where ApplicationNumber='"+request.getParameter("AppNumber")+"' and Password='"+request.getParameter("Password")+"'");
                        if (rs.next())
                        {
                            session.setAttribute("ApplicationNumber",rs.getString("ApplicationNumber"));
                            session.setAttribute("DatabaseHost",Host);
                            session.setAttribute("DatabaseUser",databaseUser);
                            session.setAttribute("DatabasePassword",databasePassword);
                            if(request.getParameterValues("checkbox-login") == null)
                            {
                                session.setMaxInactiveInterval(-1);
                            }
                            else {
                                session.setMaxInactiveInterval(60*60*24);
                            }
                            response.sendRedirect("User Page.jsp");
                        }
                        else{
        %><div class="alert-danger text-center">Invalid User Name or Password</div><%
                        }
                }
                catch (com.mysql.cj.jdbc.exceptions.CommunicationsException e){
    %><div class="alert-danger text-center">Check Your Internet Connection!</div><%
                }
                catch(Exception e){ out.println(e);}
            }
        %>
    </form>
</div>
<footer class="card-footer fixed-bottom text-center" style="background-color: #c4c4c4">
    <div class="container">
        <p class="mt-1 mb-1 text-muted text-center">© 2017-2018</p>
    </div>
</footer>
</body>
</html>