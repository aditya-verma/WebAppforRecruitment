<%@ page import="java.util.Properties" %>
<%@ page import="java.sql.*"%>
<%--
  Created by IntelliJ IDEA.
  User: ADITYA
  Date: 28 Jun 2018
  Time: 12:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Properties properties = new Properties();
        properties.setProperty("user", "root");
        properties.setProperty("password", "");
        properties.setProperty("useSSL", "false");
        properties.setProperty("autoReconnect", "true");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test",properties);
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery("select * from USERS where email='"+request.getParameter("Email")+"' and Password='"+request.getParameter("Password")+"'");
        if (!rs.next())
        {
            out.println("User Does Not Exits!");
        }
        else{
            out.println("Welcome!\n\n\n\n\n\n\n\n\n\n\n");
            out.println(rs.getString(1)+"  "+rs.getString(2)+"  "+rs.getString(3)+"  "+rs.getString(4)+"  "+rs.getString(5));
        }
    }catch(Exception e){ out.println(e);}
%>