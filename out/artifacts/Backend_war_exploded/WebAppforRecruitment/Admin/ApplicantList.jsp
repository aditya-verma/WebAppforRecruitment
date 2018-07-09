<%@ page import="java.util.Properties" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/css/dataTables.bootstrap4.min.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/js/jquery.dataTables.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.13/js/dataTables.bootstrap4.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#ApplicantListTable').DataTable();
        });
    </script>
</head>
<body>
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
    <div class="jumbotron" style="height: 5%;">
        <div class="container">
            <h1>Recruitment Portal</h1>
            <div class="rounded" style="background: #343a40;">
                <h3 class="text-primary text-uppercase" style="color: #FFF;padding: 1%;">Administrator Pannel</h3>
            </div>
        </div>
    </div>
</header>

<div class="container">
    <table id="ApplicantListTable" class="table table-striped table-bordered table-hover"width="100%">
        <thead class="table-dark">
        <tr>
            <th scope="col">Application Number</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Phone Number</th>
            <th scope="col">Credit Score</th>
            <th scope="col">View CV</th>
        </tr>
        </thead>
        <tbody>
        <%
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12245685","sql12245685","fpStvI5rK8");
                Statement statement = connection.createStatement();
                ResultSet rs = statement.executeQuery("SELECT * from USERS");
                while (rs.next())
                {
        %>
        <tr>
            <th scope="col"><%=rs.getString("ApplicationNumber")%></th>
            <th scope="col"><%=rs.getString("FirstName")+" "+rs.getString("LastName")%></th>
            <th scope="col"><%=rs.getString("Email")%></th>
            <th scope="col"><%=rs.getString("Phone")%></th>
            <th scope="col">91</th>
            <th scope="col"><a href="#">View CV</a></th>
        </tr>
        <%
                }
                statement.close();
                connection.close();
            }
            catch (com.mysql.cj.jdbc.exceptions.CommunicationsException e){

            }
            catch (Exception e){

            }
        %>
        </tbody>
    </table>
</div>

<div class="card-footer align-bottom mt-2" style="background-color: #c4c4c4; ">
    <div class="container text-center rounded" style="position:relative; text-align: center" >
        <form method="post" action="../logout.jsp">
            <button class="btn btn-danger btn-sm" name="logout">Logout</button>
        </form>
    </div>
</div>

</body>
</html>