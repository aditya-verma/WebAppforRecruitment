<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html lang="en" style="background-color: #f5f5f5">
<head>
    <style>
        input{
            padding: 5px;
        }
    </style>
</head>
<body >
<form>
    <table class="table table-responsive-xl table-bordered" id="EducationalInformation-table"><tr>
            <td><input type="text" placeholder="Enter Qualification" name="Qualification"></td>
            <td><input type="text" placeholder="Enter Degree" name="Degree"></td>
            <td><input type="text" placeholder="Enter Discipline" name="Discipline"></td>
            <td><input type="text" placeholder="Enter Institute" name="Institute"></td>
            <td><input type="text" placeholder="Enter Board/University" name="Board"></td>
            <td><input type="date" placeholder="Enter Date" name="Date"></td>
            <td><input type="text" placeholder="Enter Division" name="Division"></td>
            <td><input type="text" placeholder="Enter %age/CGPA" name="Percentage"></td>
        </tr>
    </table>
    <div class="col-md-12 mb-3" style="margin: 0;text-align: center">
        <button class="btn btn-primary"  type="submit">Submit</button>
        <button class="btn btn-dark " id="reset"  type="reset">Reset</button>
    </div>
</form>
<div class="col-md-12 " style="margin: 0;text-align: center">
    <button class="btn btn-dark " id="btn-AddEduInfo"  type="submit" onclick="addEduInfo()">Add New Row</button>
</div>
</body>
<%
    Connection con=null;
    Statement st;
    ResultSet rs;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection((String)session.getAttribute("DatabaseHost"),(String)session.getAttribute("DatabaseUser"),(String)session.getAttribute("DatabasePassword"));
        st = con.createStatement();
        if (request.getParameter("b1") != null) {
            String qualification = (request.getParameter("Qualification"));
            String degree = request.getParameter("Degree");
            String discipline = (request.getParameter("Discipline"));
            String institute = request.getParameter("Institute");
            String board = request.getParameter("BoardOrUniv");
            String dateOfPassing = request.getParameter("DateOfPassing");
            String division = request.getParameter("Division");
            String percentage = request.getParameter("Percentage");
            String sql = "insert into Educational_Qualification values Qualification='" + qualification + "', Degree='" + degree + "',Discipline='" + discipline + "', Institute='" + institute + "',BoardOrUniv='" + board + "',DateOfPassing='" + dateOfPassing + "',Division='" + division + "',Percentage='" + percentage + "'";
            int res = st.executeUpdate(sql);
            if (res != 0)
                response.sendRedirect("../FinalCV.jsp");
            else
                out.println("No Record Updated");
        }
        con.close();
    }catch(Exception e)
    {
        out.println(e.toString());
    }
%>
<script>
    function addEduInfo() {
        $("#EducationalInformation-table").append("<tr><td><input type=\"text\" placeholder=\"Enter Qualification\" name=\"Qualification\"></td><td><input type=\"text\" placeholder=\"Enter Degree\" name=\"Degree\"></td><td><input type=\"text\" placeholder=\"Enter Discipline\" name=\"Discipline\"></td><td><input type=\"text\" placeholder=\"Enter Institute\" name=\"Institute\"></td><td><input type=\"text\" placeholder=\"Enter Board/University\" name=\"BoardOrUniv\"></td><td><input type=\"text\" placeholder=\"Enter Date\" name=\"DateOfPassing\"></td><td><input type=\"text\" placeholder=\"Enter Division\" name=\"Division\"></td><td><input type=\"text\" placeholder=\"Enter %age/CGPA\" name=\"Percentage\"></td></tr>");
    }
</script>
</body>
</html>