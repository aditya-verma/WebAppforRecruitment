<!DOCTYPE html>
<head>
    <script>
        function validatenum(evt) {
            var theEvent = evt || window.event;
            var key = theEvent.keyCode || theEvent.which;
            key = String.fromCharCode(key);
            var regex = /[0-9]|\./;
            if(!regex.test(key)) {
                theEvent.returnValue = false;
                if(theEvent.preventDefault) theEvent.preventDefault();
            }
        }
    </script>

</head>
<body style="background-color: #f5f5f5;">
<%
    if (session.getAttribute("ApplicationNumber")==null ||session.getAttribute("ApplicationNumber")=="")
    {
        response.sendRedirect("/WebAppforRecruitment/login/login.jsp");
    }
%>
<div class="container ">
    <form id="References" action="" style="width: 100%;">
       <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="References_name">Name</label>
                    <input type="text" id="References_name" class="form-control" pattern="[a-zA-Z ]+" name="References_name" placeholder="" required>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="References_designation">Designation</label>
                    <input type="text" id="References_designation"  class="form-control" pattern="[a-zA-Z ]+" name="References_designation" placeholder="" required>
                </div>
            </div>
       </div>
       <div class="row">
            <div class="col-sm-12">
               <div class="form-group">
               <label class="text" for="References_Address">Address</label>
                <input type="text" id="References_Address" class="form-control" name="References_Address" placeholder="" required>
                 </div>
            </div>
       </div>
       <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="References_city">City</label>
                    <input  id="References_city" class="form-control" pattern="[a-zA-Z ]+" name="References_city" placeholder="" required>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="References_pin">PIN</label>
                    <input  type="text"  id="References_pin" class="form-control" name="References_pin" placeholder="" onkeypress='validatenum(event)'  value="${cpCon.receiveNo}"  tabindex="34" onCopy="return false" onDrag="return false" onDrop="return false" onPaste="return false" autocomplete=off required>
                </div>
            </div>
       </div>
       <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text" for="References_mobile">Mobile no</label>
                    <input type="text" id="References_mobile" class="form-control" name="References_mobile" placeholder="" onkeypress='validatenum(event)' minlength="10" maxlength="11" value="${cpCon.receiveNo}"  tabindex="34" onCopy="return false" onDrag="return false" onDrop="return false" onPaste="return false" autocomplete=off required>
                </div>
            </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="text" for="References_email">Email</label>
                        <input type="email" id="References_email" class="form-control" name="References_email" placeholder="" required>
                    </div>
                </div>
       </div>
       <div class="form-actions" style="margin: 4%;background-color: transparent;text-align: center;">
            <button class="btn btn-lg btn-primary m-1"  value="Insert" type="submit" name="References_Experience_b1">ADD</button>
       </div>
        <%
            if(request.getParameter("References_Experience_b1")!=null) {
                String References_name ="";
                String References_designation ="";
                String References_Address ="";
                String References_city="";
                int References_pin ;
                String References_mobile ="";
                String References_email = "";

                try{
                    Connection con = null;
                    Statement stmt = null;
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection((String)session.getAttribute("DatabaseHost"),(String)session.getAttribute("DatabaseUser"),(String)session.getAttribute("DatabasePassword"));
                    stmt = con.createStatement();
                    References_name = (request.getParameter("References_name"));
                    References_designation = request.getParameter("References_designation");
                    References_Address = request.getParameter("References_Address");
                    References_city = request.getParameter("References_city");
                    References_pin = Integer.parseInt(request.getParameter("References_pin"));
                    References_mobile = request.getParameter("References_mobile");
                    References_email = request.getParameter("References_email");

                    String sql = "insert into Reference values('" + ((String) session.getAttribute("ApplicationNumber")) + "','" + References_name + "','" + References_designation + "','" +References_Address + "','" + References_city + "','" +References_pin   + "','" + References_mobile  + "','" + References_email + "')";
                    int se = stmt.executeUpdate(sql);
                    if (se != 0){
        %><div class="text-center alert-success">Record Inserted</div> <%
    }
    else {
    %><div class="text-center alert-danger">Record not Inserted</div><%
        }con.close();
        stmt.close();

    }


    catch(Exception e)
    {
    %><div class="alert-warning text-center"><% out.print(e);%></div> <%
            }

        }
    %>
    </form>
</div>
</body>
</body>
</html>