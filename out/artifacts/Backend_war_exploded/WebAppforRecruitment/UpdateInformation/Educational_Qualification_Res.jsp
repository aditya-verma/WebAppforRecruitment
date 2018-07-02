<%--
  Created by IntelliJ IDEA.
  User: amrit
  Date: 02-07-2018
  Time: 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.*" %>
<html>
<body>
<%
    Connection con=null;
    Statement st;
    ResultSet rs;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12244587","sql12244587","MnEsSVNIke");
        st=con.createStatement();
        rs=st.executeQuery("update table Educational_Qualification_PhD set Status=''");
        while(rs.next())
        {
            out.println("<tr><td>");
            out.println(rs.getString(1));
            out.println("</td><td>");
            out.println(rs.getString(2));
            out.println("</td><td>");
            out.println(rs.getString(3));
            out.println("</td><td>");
            out.println(rs.getString(4));
            out.println("</td><td>");
            out.println(rs.getString(5));
            out.println("</td></tr>");
        }
    }catch(Exception e)
    {
        out.println(e.toString());
    }
    out.println("</table>");
%>
</body>
</html>
