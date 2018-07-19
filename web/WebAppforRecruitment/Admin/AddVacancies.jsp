<%@ page import="java.io.*" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONException" %>
<%@ page import="org.apache.commons.io.FileUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: ADITYA
  Date: 10 Jul 2018
  Time: 04:02 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add/Update Vacancies</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/backgrounds.css">
    <script src="../jquery/3.3.1/jquery.min.js"></script>
    <script src="../jquery/popper.js/1.14.3/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
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
    <div class="jumbotron" style="height: 10%">
        <div class="container">
            <h1>Administrator Pannel</h1>
            <div class="bg-dark rounded">
                <h3 class="text-primary text-uppercase" style="color: #FFF;padding: 1%;">Add/Update Vacancies</h3>
            </div>
        </div>
    </div>
</header>


<div class="container text-center mb-5">
    <form method="post" action="">
        <%
            int i =0;
            try{
                File dir = new File("D:\\Post\\");
                for (File file : dir.listFiles()) {
                    i++;
                    String x="name-"+i,y="post-"+i,z="vacancy-"+i;
                    FileReader fileReader = new FileReader(file);
                    BufferedReader br = new BufferedReader(fileReader);
                    String str= br.readLine();
                    JSONObject jsonObject = new JSONObject(str);
        %>
        <div class="form-group">
            <div class="row">
                <div class="col-sm-4">
                    <input type="text" class="form-control" placeholder="Post Name" name="<%=x%>" value="<%out.println(jsonObject.getString("name"));%>">
                </div>
                <div class="col-sm-4">
                    <input type="text" class="form-control" placeholder="Post Code" name="<%=y%>" value="<%out.println(jsonObject.getString("post"));%>">
                </div>
                <div class="col-sm-4">
                    <input type="text" class="form-control" placeholder="Vacancy" name="<%=z%>" value="<%out.println(jsonObject.getString("vacancy"));%>">
                </div>
            </div>
        </div>
        <%
                    br.close();
                }
            }
            catch (FileNotFoundException e){}
            catch (JSONException e){}
            catch (IOException e){}
        %>
        <label>ADD New Post</label>
        <div class="form-group">
            <div class="row">
                <div class="col-sm-4">
                    <input type="text" class="form-control" placeholder="Post Name" name="newpostname">
                </div>
                <div class="col-sm-4">
                    <input type="text" class="form-control" placeholder="Post Code" name="newpostcode" >
                </div>
                <div class="col-sm-4">
                    <input type="text" class="form-control" placeholder="Vacancy" name="newpostvacancy">
                </div>
            </div>
        </div>
        <div class="container text-center m-4">
            <button class="btn btn-dark" name="btn-addnew">Add</button>
            <button class="btn btn-success" name="btn-update">Update</button>
        </div>
        <%
            if (request.getParameter("btn-addnew")!=null){
                try{
                    if (request.getParameter("newpostname")!="" && request.getParameter("newpostcode")!=""){
                        JSONObject obj = new JSONObject();
                        obj.put("name",request.getParameter("newpostname"));
                        obj.put("post",request.getParameter("newpostcode"));
                        obj.put("vacancy",request.getParameter("newpostvacancy"));
                        String strPath = "D:\\Post\\"+(i+1)+".json";
                        File strFile = new File(strPath);
                        if (!strFile.exists())
                            strFile.createNewFile();
                        BufferedWriter objWriter = new BufferedWriter(new FileWriter(strFile));
                        objWriter.write(obj.toString());
                        objWriter.close();
                        response.sendRedirect("/WebAppforRecruitment/Admin/AddVacancies.jsp");
                    }
                    else
                    {
        %><div class="alert alert-warning text-center rounded mb-5">Please enter data</div>
        <%
                    }
                }
                catch (FileNotFoundException e){}
                catch (JSONException e){}
                catch (Exception e){}
            }
            if (request.getParameter("btn-update")!=null && i!=0){
                try{

                    FileUtils.cleanDirectory(new File("D:\\Post\\"));
                    for (int j = 1; j <= i ; ) {
                        String x="name-"+j,y="post-"+j,z="vacancy-"+j;
                        JSONObject obj = new JSONObject();
                        obj.put("name",request.getParameter(x));
                        obj.put("post",request.getParameter(y));
                        obj.put("vacancy",request.getParameter(z));
                        String strPath = "D:\\Post\\"+(j)+".json";
                        File strFile = new File(strPath);
                        if (!strFile.exists())
                            strFile.createNewFile();
                        BufferedWriter objWriter = new BufferedWriter(new FileWriter(strFile));
                        objWriter.write(obj.toString());
                        objWriter.close();
                        if (request.getParameter(z).equalsIgnoreCase("0")||request.getParameter(z).equalsIgnoreCase("")){
                            strFile.delete();
                        }
                        j++;
                    }
                    response.sendRedirect("/WebAppforRecruitment/Admin/AddVacancies.jsp");
                }
                catch (FileNotFoundException e){}
                catch (JSONException e){}
                catch (Exception e){}
            }
        %>
    </form>
</div>

<div class="card-footer" style="background-color: #c4c4c4">
    <div class="container text-muted text-center rounded">
        <form method="post" action="../logout.jsp">
            <button class="btn btn-danger btn-sm" name="logout">Logout</button>
        </form>
    </div>
</div>

</body>
</html>