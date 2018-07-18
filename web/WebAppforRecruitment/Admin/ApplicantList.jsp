<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONException" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Applicant List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/css/dataTables.bootstrap4.min.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.13/js/dataTables.bootstrap4.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#ApplicantListTable').DataTable();
        });
        function setPost(){

        }
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
            <h1>Administrator Pannel</h1>
            <div class="rounded" style="background: #343a40;">
                <h3 class="text-primary text-uppercase" style="color: #FFF;padding: 1%;">Applicants List</h3>
            </div>
        </div>
    </div>
</header>
<%
    List<String> list = new ArrayList<String>();
    String postname[];
    String poststr="All>";
    try {

        File dir = new File("D:\\Post\\");
        for (File file : dir.listFiles()) {
            FileReader fileReader = new FileReader(file);
            BufferedReader br = new BufferedReader(fileReader);
            String str = br.readLine();
            JSONObject jsonObject = new JSONObject(str);
            poststr+= jsonObject.getString("name")+">";
            br.close();
        }
    }
    catch (FileNotFoundException e){}
    catch (JSONException e){out.println("Json Exception occured");}
    catch (Exception e){}
    poststr.substring(0,poststr.length()-1);
    postname = poststr.split(">");
%>
<div class="container">
    <form action="" method="post">
        <select class="form-control" name="choice" onchange="setPost()">
            <%
                for (int i = 0; i < postname.length; i++) {
            %><option <%if (session.getAttribute("post")!=null&&session.getAttribute("post").equals(postname[i])){%>selected<%}%>><%out.println(postname[i]);%></option> <%
            }
        %>
        </select>
        <div class="container m-2" style="text-align: center;"><button type="submit" name="submitchoice" class="btn btn-primary">Search</button></div>
        <%
            if (request.getParameter("submitchoice")!=null){
                session.setAttribute("post",request.getParameter("choice"));
                response.sendRedirect("ApplicantList.jsp");
            }
        %>
    </form>

    <form>
        <div class="container m-2" style="text-align: center;"><button type="submit" name="submittable" class="btn btn-primary">Submit</button></div>
    <table id="ApplicantListTable" class="table table-striped table-bordered table-hover"width="100%">
        <thead class="table-dark">
        <tr>
            <th scope="col">Application Number</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Phone Number</th>
            <th scope="col">Credit Score</th>
            <th scope="col">Status</th>
            <th scope="col">CV</th>
            <th scope="col">Selected</th>
            <th scope="col">Rejected</th>
        </tr>
        </thead>
        <tbody>
        <%
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection(session.getAttribute("DatabaseHost").toString(),session.getAttribute("DatabaseUser").toString(),session.getAttribute("DatabasePassword").toString());
                Statement statement = connection.createStatement();
                String condition = "";
                if (session.getAttribute("post")!=null && !session.getAttribute("post").equals("All")){
                    condition = "WHERE Post='"+session.getAttribute("post").toString().trim()+"'";
                }
                else
                    condition = "WHERE 1=1";
                ResultSet rs = statement.executeQuery("SELECT * from USERS "+condition);
                while (rs.next())
                {
                    if (rs.getInt("Status")!=0){


                    list.add(rs.getString("ApplicationNumber").trim());
                    String name=rs.getString("ApplicationNumber").trim()+"-radio";
        %>
        <tr>
            <th scope="col"><%out.println(rs.getString("ApplicationNumber"));%></th>
            <th scope="col"><%out.println(rs.getString("FirstName")+" "+rs.getString("LastName"));%></th>
            <th scope="col"><%out.println(rs.getString("Email"));%></th>
            <th scope="col"><%out.println(rs.getString("Phone"));%></th>
            <th scope="col">91</th>
            <th scope="col"><%if (Integer.parseInt(rs.getString("Status")) == 0){
                out.println("Not Submitted");
            }
                else if (Integer.parseInt(rs.getString("Status")) == 1){
                    out.println("Under Screening");
                }
                else if (Integer.parseInt(rs.getString("Status")) == 2){
                    out.println("Accepted");
                }
                else if (Integer.parseInt(rs.getString("Status")) == 3){
                    out.println("Rejected");
                }%></th>
            <th scope="col"><a href="ViewCV.jsp?applicationNumber=<%=rs.getString("ApplicationNumber")%>">View</a></th>
            <th scope="col" style="text-align: center;"><input type="radio" name="<%=name%>" value="yes" <%if (rs.getInt("Status")==2){%>checked<%}%> ></th>
            <th scope="col" style="text-align: center;"><input type="radio" name="<%=name%>" value="no" <%if (rs.getInt("Status")==3){%>checked<%}%> ></th>
        </tr>
        <%
            }
            }
            statement.close();
            connection.close();
        }
        catch (com.mysql.cj.jdbc.exceptions.CommunicationsException e){
        %><div class="alert alert-warning rounded text-center">Check Your Internet Connection!</div> <%
        }
        catch (java.lang.NullPointerException e){
        %><div class="alert alert-warning rounded text-center">Connection cannot be established.. Please try again later!</div> <%
        }
        catch (Exception e){
        %><div class="alert alert-warning rounded text-center"><%out.println(e);%></div> <%
            }
        %>
        </tbody>
    </table>
        <%
            if (request.getParameter("submittable")!=null)
            {
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection(session.getAttribute("DatabaseHost").toString(),session.getAttribute("DatabaseUser").toString(),session.getAttribute("DatabasePassword").toString());
                    Statement statement = connection.createStatement();
                    for (String s:list){
                        String name=s.trim()+"-radio";
                        String  str = request.getParameter(name);
                        if (str.equalsIgnoreCase("yes")){
                            statement.executeUpdate("UPDATE USERS SET Status=2 WHERE ApplicationNumber='"+s+"'");
                        }
                        else if (str.equalsIgnoreCase("no")){
                            statement.executeUpdate("UPDATE USERS SET Status=3 WHERE ApplicationNumber='"+s+"'");
                        }
                    }
                    connection.close();
                    statement.close();
                    response.sendRedirect("ApplicantList.jsp");
                }
                catch (java.lang.NullPointerException e){
                }
                catch (Exception e){
    %><div class="alert alert-warning rounded text-center"><%out.println(e);%></div> <%
                }
            }
        %>
    </form>
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