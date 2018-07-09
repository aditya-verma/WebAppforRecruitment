<%--
  Created by IntelliJ IDEA.
  User: amrit
  Date: 09-07-2018
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Update</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link href="../../css/floating-labels.css" rel="stylesheet">
    <script src="../../jquery/3.3.1/jquery.min.js"></script>
    <script src="../../jquery/popper.js/1.14.3/popper.min.js"></script>
    <script src="../../js/bootstrap.js"></script>
    <script type="text/javascript">
        $(window).on('load',function(){
            $('#myModal').modal('show');
        });
    </script>
</head>
<%
    String id=request.getParameter("id");
    String date=request.getParameter("date");
    Connection con=null;
    Statement st;
    ResultSet rs;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12245685","sql12245685","fpStvI5rK8");
        st=con.createStatement();
        String sql="select * from Other_Academic_Qualification where Application_Number='"+id+"' and Year='"+date+"'";
        rs=st.executeQuery(sql);
        rs.next();
%>
<body>
<div class="modal " id="myModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Update Academic Qualfication</h5>
            </div>
            <div class="modal-body">
                <form method="post" action="">
                    <input class="form-control" type="text" value="<%=rs.getString(2)%>" name="Degree"/><br>
                    <input class="form-control" type="text" value="<%=rs.getString(3)%>" name="Discipline"/><br>
                    <input class="form-control" type="text" value="<%=rs.getString(4)%>" name="Institute"/><br>
                    <input class="form-control" type="text" value="<%=rs.getString(5)%>" name="BoardOrUniv"/><br>
                    <input class="form-control" type="text" value="<%=rs.getString(6)%>" name="Marks/CGPA"/><br>
                    <input class="form-control" type="text" value="<%=rs.getString(7)%>" name="Max Marks/CGPA"/><br>
                    <input class="form-control" type="text" value="<%=rs.getString(8)%>" name="Percentage Marks/CGPA"/><br>
                    <input class="form-control" type="text" value="<%=rs.getString(9)%>" name="Division"/><br>
                    <input class="form-control" type="text" value="<%=rs.getString(10)%>" name="Year"/><br>
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
        String degree=request.getParameter("Degree");
        String discipline=(request.getParameter("Discipline"));
        String institute=request.getParameter("Institute");
        String board =request.getParameter("BoardOrUniv");
        String division =request.getParameter("Division");
        String marks =request.getParameter("Marks/CGPA");
        String maxMarks =request.getParameter("Max Marks/CGPA");
        String percentage =request.getParameter("Percentage Marks/CGPA");
        String year =request.getParameter("Year");
        sql="update Other_Academic_Qualification set Degree='"+degree+"',Discipline='"+discipline+"', Institute='"+institute+"',Board='"+board+"',Division='"+division+"',Marks ='"+marks+"',Max_Marks ='"+maxMarks+"',Percentage_Marks='"+percentage+"',Year='"+year+"' where Application_Number='"+id+"' and Year='"+date+"'";
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