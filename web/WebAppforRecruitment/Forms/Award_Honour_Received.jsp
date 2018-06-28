<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Intellectual Property Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <<link rel="stylesheet" href="../css/bootstrap.min.css">
    <link href="../css/datepicker.css" rel="stylesheet">
    <script src="../jquery/3.3.1/jquery.min.js"></script>
    <script src="../jquery/popper.js/1.14.3/popper.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
        $(function() {
            $( "#date" ).datepicker({
                format: "dd-mm-yyyy",
                viewMode: "months",
                minViewMode: "date",
                pickerPosition: "bottom-left"});
        });
    </script>

    <style>
        body {

            background-color: #f5f5f5;
        }
        .rcorners2 {
            border-radius: 20px;
            border: 2px ;
            height: 50px;
            width: 101%;
        }

    </style>

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
                <h3  style="color: #FFF;padding: 1%; ">Awards/Acheivements:</h3>
            </div>
        </div>
    </div>
</header>
<div class="container">
    <form id="Awards_Received" action="" method="post" style="width: 100%;padding-left: 30%;">
        <div class="row " style="margin-top: 5%">
            <div class="col-sm-2" style="text-align: left">
                <div class="form-group" >
                    <label for="Awards_Received_Description">Description</label>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group" >
                    <input type="text" class="form-control" id="Awards_Received_Description" name="i1"  placeholder="Enter Description">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-2" style="text-align: left">
                <div class="form-group" >
                    <label for="Awards_Received_Date">Received on</label>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group" >
                    <input type="text" class="form-control" name="i2" id="Awards_Received_Date"  placeholder="DD/MM/YYYY">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-2">

            </div>
            <div class="col-sm-4">
                <button class="btn btn-lg btn-success m-1" id="next" value="Insert" type="submit" name="b2">Submit</button>
            </div>
        </div>
        <%
            if(request.getParameter("b1")!=null)
            {
                Connection con=null;
                Statement st;
                ResultSet rs;
                String org =(request.getParameter("i1"));
                String pos =request.getParameter("i2");
                String type=request.getParameter("i3");
                String from =request.getParameter("i4");
                String to=request.getParameter("i5");
                String payinband=request.getParameter("i6");
                String agp=request.getParameter("i7");
                int basicpay =Integer.parseInt(request.getParameter("i8"));
                String nature=request.getParameter("i9");
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12244587","sql12244587","MnEsSVNIke");
                    // con = DriverManager.getConnection("jdbc:mysql://localhost:3306/summer","root","");
                    st=con.createStatement();
                    String sql="insert into Present_Employee values('A123','"+org+"','"+pos+"','"+type+"','"+from+"','"+to+"','"+payinband+"','"+agp+"',"+basicpay+",'"+nature+"')";
                    int res=st.executeUpdate(sql);
                    if(res!=0)
                        out.println("Record Inserted");
                    else
                        out.println("Record Not Inserted");
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