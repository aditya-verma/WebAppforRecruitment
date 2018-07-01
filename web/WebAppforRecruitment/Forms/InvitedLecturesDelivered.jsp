<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Intellectual Property Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
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




<div class="container"  >
    <form id="invited_lecture" action="" method="POST"   >
        <div class="row " style="margin-top: 5%">
            <div class="col-sm-4" style="text-align: left">
                <div class="form-group" style="margin-top:3% ">
                    <label for="title">Title of Lecture</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group" >
                    <input type="text" class="form-control" id="title" name="i1" placeholder="Enter Title">
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-4" style="text-align: left">
                <div class="form-group" style="margin-top:3% ">
                    <label for="date">Date of The Event</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group" >
                    <input class="form-control" type="text" id="date" name="i2" placeholder="DD/MM/YYYY" >
                </div>
            </div>
        </div>
        <div class="row " style="margin-top: 2%">
            <div class="col-sm-4" style="text-align: left">
                <div class="form-group" style="margin-top:3% ">
                    <label for="inviter">Inviter to Event</label>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group" >
                    <input type="text" class="form-control" id="inviter" name="i3"  placeholder="Enter Inviter" >
                </div>
            </div>
        </div>

        <div class="row " style="margin-top: 2%">
            <div class="col-sm-4" style="text-align: left">
                <div class="form-group" style="margin-top:3% ">
                    <label for="event">Event Description</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group" >
                    <textarea type="text" class="form-control" id="event"  name="i4" placeholder="Write Event Description "></textarea>
                </div>
            </div>
        </div>

      <!--  <div class="row " style="margin-top: 2%">
            <div class="col-sm-1">

            </div>
            <div class="col-sm-6">
                <button class="btn btn-lg btn-primary m-1" id="submit" value="Insert" type="submit" name="b1">Add</button>
                <button class="btn btn-lg btn-success m-1" id="next" value="Insert" type="submit" name="b2">Continue</button>


                <--%
                    if(request.getParameter("b1")!=null)
                    {
                        Connection con=null;
                        Statement st;
                        ResultSet rs;
                        String title =(request.getParameter("i1"));
                        String date =request.getParameter("i2");
                        String inviter =request.getParameter("i3");
                        String event =request.getParameter("i4");

                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12244587","sql12244587","MnEsSVNIke");
                            st=con.createStatement();
                            String sql="insert into Invited_Lecture_Delivered values('2018PF000001','"+title+"','"+date+"','"+inviter+"','"+event+"')";
                            int res=st.executeUpdate(sql);
                            if(res!=0){%>
                <button class="btn btn-lg btn-dark m-1" id="add" value="Insert" onclick="myfunc()" type="submit" name="b3">Add More</button>
            </div>
        </div>
        <--%
                    }
                    else
                        out.println("Record Not Inserted");
                }catch(Exception e)
                {
                    out.println(e.toString());
                }
            }
        %-->
    </form>
</div>


</body>
</html>