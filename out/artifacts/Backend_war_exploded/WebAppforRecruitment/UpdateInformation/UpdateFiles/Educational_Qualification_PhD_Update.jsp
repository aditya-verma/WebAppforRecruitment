<%--
  Created by IntelliJ IDEA.
  User: amrit
  Date: 02-07-2018
  Time: 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Educational Details(PhD)</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/datepicker.css">
    <script src="../../jquery/3.3.1/jquery.min.js"></script>
    <script src="../../jquery/popper.js/1.14.3/popper.min.js"></script>
    <script src="../../js/bootstrap.js"></script>
    <script src="../../js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
        $(window).on('load',function(){
            $('#myModal').modal('show');

            $( "#Date" ).datepicker({
                format: "yyyy-mm-dd",
                viewMode: "months",
                minViewMode: "days",
                pickerPosition: "bottom-left"});
            container: '#myModal modal-body'


        });
    </script>
    <style>
        .datepicker {
            z-index: 1151 !important; /* has to be larger than 1050 */
        }
    </style>
</head>
<%
    String id=request.getParameter("id");
    String title=request.getParameter("title");
    Connection con=null;
    Statement st;
    ResultSet rs;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12245685","sql12245685","fpStvI5rK8");
        st=con.createStatement();
        String sql="select * from Educational_Qualification_PhD where Application_Number='"+id+"' and Title='"+title+"'";
        rs=st.executeQuery(sql);
        rs.next();
%>
<body>
<div class="modal " id="myModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
            </div>
            <div class="modal-body">
                <form method="post" action="">
                    <label class="text">Status</label>
                    <input class="form-control" type="text" value="<%=rs.getString(2)%>" name="Status" /><br>
                    <label class="text">Title</label>
                    <input class="form-control" type="text" value="<%=rs.getString(3)%>" name="Title" /><br>
                    <label class="text">Institute</label>
                    <input class="form-control" type="text" value="<%=rs.getString(4)%>" name="Institute" /><br>
                    <label class="text">Date</label>
                    <input class="form-control" type="text" id="Date" value="<%=rs.getString(5)%>" name="Date" /><br>
                    <button class="btn btn-dark" type="submit" value="Update" name="b1">Save changes</button>
                    <button type="submit" class="btn btn-outline-dark" name="close">Cancel</button>
                </form>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>
    <%
        if(request.getParameter("close")!=null){
            response.sendRedirect("/WebAppforRecruitment/UpdateInformation/FinalCV.jsp");
        }
        if(request.getParameter("b1")!=null)
        {

            String status,title2,inst,date;
            status=(request.getParameter("Status"));
            title2=request.getParameter("Title");
            inst=(request.getParameter("Institute"));
            date=request.getParameter("Date");
            sql="update Educational_Qualification_PhD set Status='"+status+"', Title='"+title+"',Institute='"+inst+"', Date='"+date+"' where Application_Number='"+id+"' and Title='"+title+"'";
            int res=st.executeUpdate(sql);
            if(res!=0)
                response.sendRedirect("../FinalCV.jsp");
            else
                out.println("No Record Updated");
        }
        con.close();
    %>
</body>
<%
    }catch(Exception e)
    {
        out.println(e.toString());
    }
    finally {

    }
%>
</html>