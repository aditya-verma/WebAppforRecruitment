<%--
  Created by IntelliJ IDEA.
  User: ADITYA
  Date: 03 Jul 2018
  Time: 10:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.setAttribute("ApplicationNumber", null);
    session.setAttribute("Password",null);
    session.invalidate();
    response.sendRedirect("/WebAppforRecruitment/login/login.jsp");
%>