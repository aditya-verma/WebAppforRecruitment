<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<!DOCTYPE html>
<head>
    <link href="../css/datepicker.css" rel="stylesheet">
    <script src="../js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
        $(function() {
            $( "#phd-date" ).datepicker({
                format: "dd-mm-yyyy",
                viewMode: "months",
                minViewMode: "days",
                pickerPosition: "bottom-left"});
        });
    </script>
</head>
<body>
<form method="post" action="" class="text-center mt-2 mb-5">
    <%
        String phdstatus="";
        String phdtitle="";
        String phdinstitute="";
        String phddate="";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection((String)session.getAttribute("DatabaseHost"),(String)session.getAttribute("DatabaseUser"),(String)session.getAttribute("DatabasePassword"));
            Statement stmt = connection.createStatement();
            ResultSet rs=stmt.executeQuery("SELECT * FROM Educational_Qualification_PhD WHERE ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"'");
            if (rs.next()) {
                phdstatus=rs.getString("Status");
                phdtitle=rs.getString("Title");
                phdinstitute=rs.getString("Institute");
                phddate=rs.getString("Date");
            }
        }
        catch (Exception e){}
    %>
    <label class="label"><strong>Ph.D Details</strong></label>
    <div class="form-row form-group">
        <div class="col-sm-6 mb-3">
            <select name="phd-status" class="form-control">
                <option value="Select Status" disabled>Select Status</option>
                <option value="Awarded" <%if (phdstatus.equalsIgnoreCase("Awarded")){%>selected<%}%> >Awarded</option>
                <option value="Ongoing" <%if (phdstatus.equalsIgnoreCase("Ongoing")){%>selected<%}%> >Ongoing</option>
            </select>
        </div>
        <div class="col-sm-6">
            <input class="form-control" type="text" placeholder="Enter Title" name="phd-title" value="<%=phdtitle%>">
        </div>
    </div>
    <div class="form-row form-group">
        <div class="col-sm-6 mb-3">
            <input class="form-control" type="text" placeholder="Enter Institute/University" name="phd-institute" value="<%=phdinstitute%>">
        </div>
        <div class="col-sm-6">
            <input class="form-control" pattern="[0-9/-]+" type="text" id="phd-date" placeholder="Enter Date of Award" name="phd-date" value="<%=phddate%>">
        </div>
    </div>
    <div class="container text-center">
        <button class="btn btn-dark " id="reset"  type="reset">Reset</button>
        <button class="btn btn-primary" name="submit-phd">Save</button>
    </div>
    <%
        if (request.getParameter("submit-phd")!=null)
        {
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection((String)session.getAttribute("DatabaseHost"),(String)session.getAttribute("DatabaseUser"),(String)session.getAttribute("DatabasePassword"));
                Statement stmt = connection.createStatement();
                String status = request.getParameter("phd-status");
                String title = request.getParameter("phd-title");
                String institute = request.getParameter("phd-institute");
                String date = request.getParameter("phd-date");
                String sql = "INSERT INTO Educational_Qualification_PhD(ApplicationNumber,Status,Title,Institute,Date) VALUES ('"+session.getAttribute("ApplicationNumber")+"','" +
                        status+"','"+title+"','"+institute+"','"+date+"')";
                int result = stmt.executeUpdate(sql);
                if (result<=0){

    %><div class="alert-warning text-center">Error occured please try again!</div><%
                }
            }

            catch (com.mysql.cj.jdbc.exceptions.CommunicationsException e){
    %><div class="alert-danger text-center">Check Your Internet Connection!</div><%
        }
        catch(Exception e){ %><div class="alert-danger text-center"><%out.println(e);%></div><%}
        }
    %>
</form>
</body>