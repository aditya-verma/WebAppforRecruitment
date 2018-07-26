<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: ADITYA
  Date: 18 Jul 2018
  Time: 11:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String ApplicationNumber=request.getParameter("ApplicationNumber");
    int Totalcredit=0;
    int credit=0;
    int MaxCredit=0;
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection((String) session.getAttribute("DatabaseHost"),(String)session.getAttribute("DatabaseUser"),(String)session.getAttribute("DatabasePassword"));
        Statement statement = connection.createStatement();
        ResultSet rs;
        //Start For consultancy projects
        rs = statement.executeQuery("SELECT * FROM Consultancy_Provided WHERE ApplicationNumber='"+ApplicationNumber+"'");
        MaxCredit=10;
        while(rs.next()){
            credit += Integer.parseInt(rs.getString("Amount"));
        }

        //End For consultancy projects
    }
    catch (com.mysql.cj.jdbc.exceptions.CommunicationsException e){}
    catch (Exception e){}
%>
</body>
</html>
