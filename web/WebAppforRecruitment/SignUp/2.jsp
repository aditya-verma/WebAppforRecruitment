<!DOCTYPE html>
<body style="background-color: #f5f5f5;">
<!------------This is header part------------->
<form>
    <table class="table table-responsive-xl table-bordered" id="PhDInformation-table"><tr>
        <td><input type="text" placeholder="Enter Status" name="status"></td>
        <td><input type="text" placeholder="Enter Title" name="title"></td>
        <td><input type="text" placeholder="Enter Institute/University" name="institute"></td>
        <td><input type="date" placeholder="Enter Date of Award" name="date"></td>
    </tr>
    </table>
    <div class="row" style="margin: 0;text-align: center">
        <button class="btn btn-dark " id="reset"  type="reset">Reset</button>
    </div>
    <div class="row" style="margin: 0;text-align: center">
        <button class="btn btn-primary" name="submit-phd">Save</button>
    </div>
    <%
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection =DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12245685","sql12245685","fpStvI5rK8");
            Statement stmt = connection.createStatement();
            String statusphd= request.getParameter("status");
            String titlephd = request.getParameter("title");
            String institute = request.getParameter("institute");
            String datephd = request.getParameter("date");
            int i = stmt.executeUpdate("INSERT INTO Educational_Qualification_PhD (ApplicationNumber,Status,Title,Institute,Date) VALUES ('"+
                    session.getAttribute("ApplicationNumber")+"','"+
                    statusphd+"','"+titlephd+"','"+institute+"','"+datephd+"')");
            if (i>0){
                %><div class="alert alert-success text-center">Record Inserted</div> <%
            }
            else {
                %><div class="alert alert-warning text-center">Record not Inserted</div><%
            }
        }
        catch (Exception e)
        {
            %><div class="alert alert-danger"><%out.print(e);%></div> <%
        }
    %>
</form>
    <div class="col-md-12 " style="margin: 0;text-align: center">
        <button class="btn btn-dark " id="btn-addPhdInfo"  onclick="addPhDInfo()">Add New Row</button>
    </div>
</body>
<script>
    function addPhDInfo() {
        $("#PhDInformation-table").append("<tr><td><input type=\"text\" placeholder=\"Enter Status\" name=\"status\"></td><td><input type=\"text\" placeholder=\"Enter Title\" name=\"title\"></td><td><input type=\"text\" placeholder=\"Enter Institute/University\" name=\"institute\"></td><td><input type=\"date\" placeholder=\"Enter Date of Award\" name=\"date\"></td>></td></tr>");
    }
</script>
</body>