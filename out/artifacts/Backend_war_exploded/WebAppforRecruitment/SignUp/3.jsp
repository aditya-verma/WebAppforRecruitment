<%@ page import="java.sql.*" %>
<html lang="en">
<body >
<form class="text-center">
    <label class="label text-center"><h4 class="h4"><strong>Post Graduation Details</strong></h4></label>
    <div class="form-row form-group">
        <div class="col-sm-4">
            <input type="text" class="form-control" value="Post Graduation" disabled>
        </div>
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter Degree" name="PGDegree">
        </div>
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter Discipline" name="PGDiscipline">
        </div>
    </div>
    <div class="row form-group">
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter Institute" name="PGInstitute">
        </div>
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter Board/University" name="PGBoard">
        </div>
        <div class="col-sm-4">
            <input type="date" class="form-control" placeholder="Enter Date" name="PGDate">
        </div>
    </div>
    <div class="row form-group">
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter Division" name="PGDivision">
        </div>
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter %age/CGPA" name="PGPercentage">
        </div>
    </div>

    <label class="label text-center"><h4 class="h4"><strong>Graduation Details</strong></h4></label>
    <div class="row form-group">
        <div class="col-sm-4">
            <input type="text" class="form-control" value="Graduation" disabled>
        </div>
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter Degree" name="UGDegree">
        </div>
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter Discipline" name="UGDiscipline">
        </div>
    </div>
    <div class="row form-group">
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter Institute" name="UGInstitute">
        </div>
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter Board/University" name="UGBoard">
        </div>
        <div class="col-sm-4">
            <input type="date" class="form-control" placeholder="Enter Date" name="UGDate">
        </div>
    </div>
    <div class="row form-group">
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter Division" name="UGDivision">
        </div>
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter %age/CGPA" name="UGPercentage">
        </div>
    </div>

    <label class="label text-center"><h4 class="h4"><strong>12<sup>th</sup> Details</strong></h4></label>
    <div class="row form-group">
        <div class="col-sm-4">
            <input type="text" class="form-control" value="12th" disabled>
        </div>
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter Degree" name="12Degree">
        </div>
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter Discipline" name="12Discipline">
        </div>
    </div>
    <div class="row form-group">
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter Institute" name="12Institute">
        </div>
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter Board/University" name="12Board">
        </div>
        <div class="col-sm-4">
            <input type="date" class="form-control" placeholder="Enter Date" name="12Date">
        </div>
    </div>
    <div class="row form-group">
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter Division" name="12Division">
        </div>
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter %age/CGPA" name="12Percentage">
        </div>
    </div>

    <label class="label text-center"><h4 class="h4"><strong>10<sup>th</sup> Details</strong></h4></label>
    <div class="row form-group">
        <div class="col-sm-4">
            <input type="text" class="form-control" value="10th" disabled>
        </div>
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter Degree" name="10Degree">
        </div>
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter Discipline" name="10Discipline">
        </div>
    </div>
    <div class="row form-group">
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter Institute" name="10Institute">
        </div>
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter Board/University" name="10Board">
        </div>
        <div class="col-sm-4">
            <input type="date" class="form-control" placeholder="Enter Date" name="10Date">
        </div>
    </div>
    <div class="row form-group">
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter Division" name="10Division">
        </div>
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Enter %age/CGPA" name="10Percentage">
        </div>
    </div>


    <div class="col-md-12 mb-3" style="margin: 0;text-align: center">
        <button class="btn btn-primary" name="btn-educationalqualification"  type="submit">Submit</button>
        <button class="btn btn-dark " id="reset"  type="reset">Reset</button>
    </div>
</form>
</body>
<%

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection((String)session.getAttribute("DatabaseHost"),(String)session.getAttribute("DatabaseUser"),(String)session.getAttribute("DatabasePassword"));
        Statement st = con.createStatement();
        if (request.getParameter("btn-educationalqualification") != null) {
            String qualification = "";
            String degree = "";
            String discipline = "";
            String institute = "";
            String board = "";
            String dateOfPassing = "";
            String division = "";
            String percentage = "";
            String sql="";
            int res1=0,res2=0,res3=0,res4=0;

            qualification = "Post Graduation";
            degree = request.getParameter("PGDegree");
            discipline = (request.getParameter("PGDiscipline"));
            institute = request.getParameter("PGInstitute");
            board = request.getParameter("PGBoard");
            dateOfPassing = request.getParameter("PGDate");
            division = request.getParameter("PGDivision");
            percentage = request.getParameter("PGPercentage");
            ResultSet rs= st.executeQuery("SELECT * FROM Educational_Qualification WHERE Qualification='Post Graduation' AND ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"'");
            if(rs.next()){
                st.executeUpdate("UPDATE Educational_Qualification SET Degree = '"+degree+
                        "', Discipline = '"+discipline+
                        "', Institute = '"+institute+
                        "', BoardOrUniv = '"+board+
                        "', DateOfPassing = '"+dateOfPassing+
                        "', Division = '"+division+
                        "', Percentage = '"+percentage+
                        "' WHERE ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"' AND Qualification='Post Graduation'");
            }
            else{
                sql = "insert into Educational_Qualification (ApplicationNumber,Qualification,Degree,Discipline,Institute,BoardOrUniv,DateOfPassing,Division,Percentage) " +
                        "values ('"+session.getAttribute("ApplicationNumber")+"','" + qualification + "','"
                        + degree + "','" + discipline + "', '"
                        + institute + "','" + board + "','"
                        + dateOfPassing + "','" + division
                        + "','" + percentage + "')";
                res1 = st.executeUpdate(sql);
            }


            qualification = "Graduation";
            degree = request.getParameter("UGDegree");
            discipline = (request.getParameter("UGDiscipline"));
            institute = request.getParameter("UGInstitute");
            board = request.getParameter("UGBoard");
            dateOfPassing = request.getParameter("UGDate");
            division = request.getParameter("UGDivision");
            percentage = request.getParameter("UGPercentage");
            rs= st.executeQuery("SELECT * FROM Educational_Qualification WHERE Qualification='Graduation' AND ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"'");
            if(rs.next()){
                st.executeUpdate("UPDATE Educational_Qualification SET Degree = '"+degree+
                        "', Discipline = '"+discipline+
                        "', Institute = '"+institute+
                        "', BoardOrUniv = '"+board+
                        "', DateOfPassing = '"+dateOfPassing+
                        "', Division = '"+division+
                        "', Percentage = '"+percentage+
                        "' WHERE ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"' AND Qualification='Graduation'");
            }
            else {
                sql = "insert into Educational_Qualification (ApplicationNumber,Qualification,Degree,Discipline,Institute,BoardOrUniv,DateOfPassing,Division,Percentage) " +
                        "values ('"+session.getAttribute("ApplicationNumber")+"','" + qualification + "','"
                        + degree + "','" + discipline + "', '"
                        + institute + "','" + board + "','"
                        + dateOfPassing + "','" + division
                        + "','" + percentage + "')";
                res2 = st.executeUpdate(sql);
            }


            qualification = "12th";
            degree = request.getParameter("12Degree");
            discipline = (request.getParameter("12Discipline"));
            institute = request.getParameter("12Institute");
            board = request.getParameter("12Board");
            dateOfPassing = request.getParameter("12Date");
            division = request.getParameter("12Division");
            percentage = request.getParameter("12Percentage");
            rs= st.executeQuery("SELECT * FROM Educational_Qualification WHERE Qualification='12th' AND ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"'");
            if(rs.next()){
                st.executeUpdate("UPDATE Educational_Qualification SET Degree = '"+degree+
                        "', Discipline = '"+discipline+
                        "', Institute = '"+institute+
                        "', BoardOrUniv = '"+board+
                        "', DateOfPassing = '"+dateOfPassing+
                        "', Division = '"+division+
                        "', Percentage = '"+percentage+
                        "' WHERE ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"' AND Qualification='12th'");
            }
            else {
                sql = "insert into Educational_Qualification (ApplicationNumber,Qualification,Degree,Discipline,Institute,BoardOrUniv,DateOfPassing,Division,Percentage) " +
                        "values ('"+session.getAttribute("ApplicationNumber")+"','" + qualification + "','"
                        + degree + "','" + discipline + "', '"
                        + institute + "','" + board + "','"
                        + dateOfPassing + "','" + division
                        + "','" + percentage + "')";
                res3 = st.executeUpdate(sql);
            }

            qualification = "10th";
            degree = request.getParameter("10Degree");
            discipline = (request.getParameter("10Discipline"));
            institute = request.getParameter("10Institute");
            board = request.getParameter("10Board");
            dateOfPassing = request.getParameter("10Date");
            division = request.getParameter("10Division");
            percentage = request.getParameter("10Percentage");
            rs= st.executeQuery("SELECT * FROM Educational_Qualification WHERE Qualification='10th' AND ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"'");
            if(rs.next()){
                st.executeUpdate("UPDATE Educational_Qualification SET Degree = '"+degree+
                        "', Discipline = '"+discipline+
                        "', Institute = '"+institute+
                        "', BoardOrUniv = '"+board+
                        "', DateOfPassing = '"+dateOfPassing+
                        "', Division = '"+division+
                        "', Percentage = '"+percentage+
                        "' WHERE ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"' AND Qualification='10th'");
            }
            else {
                sql = "insert into Educational_Qualification (ApplicationNumber,Qualification,Degree,Discipline,Institute,BoardOrUniv,DateOfPassing,Division,Percentage) " +
                        "values ('"+session.getAttribute("ApplicationNumber")+"','" + qualification + "','"
                        + degree + "','" + discipline + "', '"
                        + institute + "','" + board + "','"
                        + dateOfPassing + "','" + division
                        + "','" + percentage + "')";
                res4 = st.executeUpdate(sql);
            }
        }
        con.close();
    }
    catch (com.mysql.cj.jdbc.exceptions.CommunicationsException e){
%><div class="alert-danger text-center">Check Your Internet Connection!</div><%
    }
    catch(Exception e)
    {
%><div class="alert-danger text-center"><%out.println(e);%></div><%
    }
%>
</body>
</html>