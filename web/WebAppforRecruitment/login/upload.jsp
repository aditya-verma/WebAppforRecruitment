<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%--
  Created by IntelliJ IDEA.
  User: ADITYA
  Date: 08 Jul 2018
  Time: 02:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    File file;
    int maxSize=5000*20;
    int maxFactSize=5000*20;
    String path="C:/Users/ADITYA/Documents/GitHub/WebAppforRecruitment/web/WebAppforRecruitment/Images/UserImages";
%>
<%
    String type = request.getContentType();
    if (type.indexOf("multipart/form-data")>=0)
    {
        DiskFileItemFactory disFact=new DiskFileItemFactory();
        disFact.setSizeThreshold(maxFactSize);
        disFact.setRepository(new File("c:\\temp"));
        ServletFileUpload servletFileUpload=new ServletFileUpload(disFact);
        servletFileUpload.setSizeMax(maxSize);
        List list=servletFileUpload.parseRequest(request);
        Iterator itr=list.iterator();
        while (itr.hasNext()){
            String str;
            FileItem item = (FileItem)itr.next();
            if (!item.isFormField()){
                str = item.getName();
                str = session.getAttribute("ApplicationNumber")+(str.substring(str.indexOf(".")));
                file=new File(path,str);
                item.write(file);
                out.println("Uploaded successfully");
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12245685","sql12245685","fpStvI5rK8");
                    Statement statement = connection.createStatement();
                    int i = statement.executeUpdate("UPDATE Personal_Information SET ImageLocation= '"+str+"' WHERE ApplicationNumber = '"+session.getAttribute("ApplicationNumber")+"'");
                    if (i>0){
                        out.println("Successful");
                        response.sendRedirect("/WebAppforRecruitment/login/User%20Page.jsp");
                    }
                    else
                        out.println("Unsuccessful");
                    connection.close();
                    statement.close();
                }
                catch (Exception e){out.println(e);}
            }
        }
    }
%>
</body>
</html>
