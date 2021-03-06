<%--
  Created by IntelliJ IDEA.
  User: amrit
  Date: 09-07-2018
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Research Experience/Post Doctoral Research</title>
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

            $( "#Teaching_From_Date" ).datepicker({
                format: "yyyy-mm-dd",
                viewMode: "months",
                minViewMode: "days",
                pickerPosition: "bottom-left"});
            container: '#myModal modal-body'

            $( "#Teaching_To_Date" ).datepicker({
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
    Connection con=null;
    Statement st;
    ResultSet rs;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12245685","sql12245685","fpStvI5rK8");
        st=con.createStatement();
        String sql="select * from Research_Experience where Application_Number='"+request.getParameter("id")+"' and FromDate='"+request.getParameter("date")+"'";
        rs=st.executeQuery(sql);
        rs.next();
%>
<body>
<div class="modal " id="myModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Update Teaching Experience</h5>
            </div>
            <div class="modal-body">
                <form method="post" action="">
                    <label class="text">Organisation</label>
                    <input class="form-control" type="text" value="<%=rs.getString(2)%>" name="Organisation"/><br>
                    <label class="text">Position Held</label>
                    <input class="form-control" type="text" value="<%=rs.getString(3)%>" name="Position Held"/><br>
                    <label class="text">From</label>
                    <input class="form-control" type="text" value="<%=rs.getString(4)%>" name="From" id="Teaching_From_Date"/><br>
                    <label class="text">To</label>
                    <input class="form-control" type="text" value="<%=rs.getString(5)%>" name="To" id="Teaching_To_Date"/><br>
                    <label class="text">Salary</label>
                    <input class="form-control" type="text" value="<%=rs.getString(6)%>" name="Salary"/><br>
                    <label class="text">Nature Of Work</label>
                    <input class="form-control" type="text" value="<%=rs.getString(7)%>" name="Nature Of Work"/><br>
                    <label class="text">Tenure</label>
                    <input class="form-control" type="text" value="<%=rs.getString(8)%>" name="Tenure"/><br>
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
        String organisation=request.getParameter("Organisation");
        String positionHeld=(request.getParameter("Position Held"));
        String from=request.getParameter("From");
        String to =request.getParameter("To");
        String salary =request.getParameter("Salary");
        String natureOfWork =request.getParameter("Nature Of Work");
        String tenure =request.getParameter("Tenure");
        sql="update Research_Experience set Organisation='"+organisation+"', Position_Held='"+positionHeld+"', FromDate='"+from+"',ToDate='"+to+"',Salary='"+salary+"',Nature_Of_Work ='"+natureOfWork+"',Tenure ='"+tenure+"'  where Application_Number='"+request.getParameter("id")+"'  and FromDate='"+request.getParameter("date")+"'";
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