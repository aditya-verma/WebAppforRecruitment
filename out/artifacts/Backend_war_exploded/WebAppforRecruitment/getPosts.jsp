<%--
  Created by IntelliJ IDEA.
  User: ADITYA
  Date: 14 Jul 2018
  Time: 03:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONException" %>
<%@ page import="java.io.*" %>
<%
    String string="";
    String arr[];
    try {
        File dir = new File("D:\\Post\\");
        for (File file : dir.listFiles()) {
            FileReader fileReader = new FileReader(file);
            BufferedReader br = new BufferedReader(fileReader);
            String str = br.readLine();
            JSONObject jsonObject = new JSONObject(str);
            string+= jsonObject.getString("name")+">";
            string.substring(0,string.length()-1);
            arr = string.split(">");
            br.close();
        }
    }
    catch (JSONException e){out.println("Json Exception occured");}
    catch (Exception e){}

%>