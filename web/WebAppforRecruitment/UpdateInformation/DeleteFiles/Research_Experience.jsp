<%--
  Created by IntelliJ IDEA.
  User: amrit
  Date: 09-07-2018
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.*"%>
<%
    String id=(request.getParameter("id"));
    Connection con=null;
    Statement st;
    ResultSet rs;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12245685","sql12245685","fpStvI5rK8");
        st=con.createStatement();
        String sql="delete from Research_Experience where Application_Number='"+id+"' and FromDate='"+request.getParameter("date")+"'";
        int res=st.executeUpdate(sql);
        if(res!=0)
            response.sendRedirect("/WebAppforRecruitment/UpdateInformation/FinalCV.jsp");
        else
            out.println("Record Not Deleted");
    }catch(Exception e)
    {
        out.println(e.toString());
    }
%>
