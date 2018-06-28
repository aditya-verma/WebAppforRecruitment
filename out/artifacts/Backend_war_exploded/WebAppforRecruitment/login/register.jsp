<%@ page import="java.sql.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.security.SecureRandom" %><%--
  Created by IntelliJ IDEA.
  User: ADITYA
  Date: 28 Jun 2018
  Time: 01:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Properties properties = new Properties();
    properties.setProperty("user","root");
    properties.setProperty("password","");
    properties.setProperty("user", "root");
    properties.setProperty("password", "");
    properties.setProperty("useSSL", "false");
    properties.setProperty("autoReconnect", "true");


    final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    SecureRandom rnd = new SecureRandom();
    StringBuilder sb = new StringBuilder( 8 );
    for( int i = 0; i < 8; i++ )
    sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );
    String temp_pass = sb.toString();


%>