<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Advanced Setup</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/backgrounds.css">
    <script src="../jquery/3.3.1/jquery.min.js"></script>
    <script src="../jquery/popper.js/1.14.3/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <%
        FileReader in = new FileReader("D:\\Database.txt");
        BufferedReader br = new BufferedReader(in);
        String str[] = new String[5];
        for (int i=0;i<5;i++)
        {
            str[i]=br.readLine();
        }
        in.close();
    %>
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
                <h3 class="text-primary text-uppercase" style="color: #FFF;padding: 1%;">Advanced Setup</h3>
            </div>
        </div>
    </div>
</header>


<div class="container">
    <div class="row custom-control-inline">
        <div class="col">
            <div class="card p-2 mb-2" style="width: 20rem; height: 22rem;">
                <div class="card-body">
                    <h5 class="card-title">Add/Update Database Server</h5>
                    <form action="">
                        <div class="row m-1">
                            <input type="text" class="form-control" placeholder="Host Sever" name="HostServer" value="<%=str[0]%>" required>
                        </div>
                        <div class="row m-1">
                            <input type="text" class="form-control" placeholder="Port" name="HostServerPort" value="<%=str[1]%>" required>
                        </div>
                        <div class="row m-1">
                            <input type="text" class="form-control" placeholder="Database Name" name="DatabaseName" value="<%=str[2]%>" required>
                        </div>
                        <div class="row m-1">
                            <input type="text" class="form-control" placeholder="User Name" name="DatabaseUserName" value="<%=str[3]%>" required>
                        </div>
                        <div class="row m-1">
                            <input type="text" class="form-control" placeholder="Password" name="DatabasePassword" value="<%=str[4]%>" required>
                        </div>
                        <div class="container text-center mt-3">
                            <button type="submit" class="btn btn-primary" name="CreateDatabaseEntry" value="Create Database Entry">Create Database Entry</button>
                        </div>
                        <%
                            if (request.getParameter("CreateDatabaseEntry")!=null)
                            {
                                str[0] = request.getParameter("HostServer").trim();
                                str[1] = request.getParameter("HostServerPort").trim();
                                str[2] = request.getParameter("DatabaseName").trim();
                                str[3] = request.getParameter("DatabaseUserName").trim();
                                str[4] = request.getParameter("DatabasePassword").trim();
                                //File creation
                                String strPath = "D:\\Database.txt";
                                File strFile = new File(strPath);
                                if (!strFile.exists())
                                    strFile.createNewFile();
                                BufferedWriter objWriter = new BufferedWriter(new FileWriter(strFile));
                                objWriter.write(str[0]);
                                objWriter.newLine();
                                objWriter.write(str[1]);
                                objWriter.newLine();
                                objWriter.write(str[2]);
                                objWriter.newLine();
                                objWriter.write(str[3]);
                                objWriter.newLine();
                                objWriter.write(str[4]);
                                objWriter.flush();
                                objWriter.close();
                            }
                        %>
                    </form>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card p-2 mb-2" style="width: 20rem; height: 22rem;">
                <div class="card-body text-center">
                    <h5 class="card-title mb-5">Start/Stop Recruitment</h5>

                        <div class="row text-center mt-5 mb-5">
                            <form action="" style="width: 100%;">
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary btn-lg" name="StartRecruiting">Start Recruiting</button>
                                </div>
                            </form>
                        </div>
                        <div class="row text-center mt-5 mb-5">
                            <form action="" style="width: 100%;">
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-danger btn-lg" name="StopRecruiting">Stop Recruiting</button>
                                </div>
                            </form>
                        </div>

                </div>
            </div>
        </div>
        <div class="col">
            <div class="card p-2 mb-2" style="width: 20rem; height: 22rem;">
                <div class="card-body text-center">
                    <h5 class="card-title">Create Database Tables</h5>
                    <img class="card-img-bottom" src="../Images/CreateDatabase.png" alt="Card image cap">
                </div>
            </div>
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