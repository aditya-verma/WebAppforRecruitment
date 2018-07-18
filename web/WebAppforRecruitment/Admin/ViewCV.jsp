<%--
  Created by IntelliJ IDEA.
  User: amrit
  Date: 17-07-2018
  Time: 02:14
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String path ="../Images/UserImages/user.png";
    String Email="",Name="",Post="",Number="";
    Connection con=null;
    Statement st=null;
    ResultSet rs=null;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(session.getAttribute("DatabaseHost").toString(),session.getAttribute("DatabaseUser").toString(),session.getAttribute("DatabasePassword").toString());
        st=con.createStatement();
        ResultSet rs1 = st.executeQuery("SELECT * from Personal_Information where ApplicationNumber='"+request.getParameter("applicationNumber")+"'");        //where ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"'");
        if (rs1.next()){
            String str =rs1.getString("ImageLocation");
            str.trim();
            if (str!=null||str!="")
                path = "../Images/UserImages/"+str;
        }
    }
    catch (Exception e){}
    try{
        rs=st.executeQuery("SELECT * from USERS where ApplicationNumber='2018PF000003'");        //where ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"'");
        if (rs.next()){
          Email = rs.getString("Email");
          Name = rs.getString("FirstName")+" "+rs.getString("LastName");
          Post = rs.getString("Post");
          Number = rs.getString("Phone");
        };
        String sql="select * from Personal_Information where ApplicationNumber='2018PF000003'";                                               //+session.getAttribute("ApplicationNumber")+"'";
        rs=st.executeQuery(sql);
        while (rs.next()){
%>
<head>
    <title>CV</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../jquery/3.3.1/jquery.min.js"></script>
    <script src="../jquery/popper.js/1.14.3/popper.min.js"></script>
    <script src="../js/bootstrap.js"></script>
</head>
<body>
    <div class="row">
        <div class="col-md-12">
            <img class="img-fluid float-left" src="../Images/form-background.png"  style="margin-left: 5rem;max-width: 7%; height: auto">
            <img class="img-fluid " src="../Images/mnnit name.png"  style="margin-left: 3rem;max-width: 80%;height: auto">
        </div>
    </div>
    <hr>
    <div class="container">
        <h3>Personal Information</h3>
        <div class="row">
            <div class="col-md-9">
                <table class="table table-bordered">
                    <tr>
                        <td>NAME</td>
                        <td><%=Name%></td>
                    </tr>
                    <tr>
                        <td>SPECIALIZATION</td>
                        <td><%=rs.getString(2)%></td>
                    </tr>
                    <tr>
                        <td>EMAIL</td>
                        <td><%=Email%></td>
                    </tr>
                    <tr>
                        <td>Post Applying for</td>
                        <td><%=Post%></td>
                    </tr>
                    <tr>
                        <td>MARITAL STATUS</td>
                        <td><%=rs.getString("MaritalStatus")%></td>
                    </tr>
                    <tr>
                        <td>GENDER</td>
                        <td><%=rs.getString("Gender")%></td>
                    </tr>
                    <tr>
                        <td>DOMICILE</td>
                        <td><%=rs.getString("Domicile")%></td>
                    </tr>
                    <tr>
                        <td>CATEGORY</td>
                        <td><%=rs.getString("Category")%></td>
                    </tr>
                    <tr>
                        <td>HANDICAPPED</td>
                        <td><%=rs.getString("PhysicallyHandicapped")%></td>
                    </tr>
                    <tr>
                        <td>DATE OF BIRTH</td>
                        <td><%=rs.getString("DateOfBirth")%></td>
                    </tr>
                    <tr>
                        <td>NATIONALITY</td>
                        <td><%=rs.getString("Nationality")%></td>
                    </tr>
                    <tr>
                        <td>NAME OF FATHER</td>
                        <td><%=rs.getString("NameOfFather")%></td>
                    </tr>
                    <tr>
                        <td>NAME OF MOTHER</td>
                        <td><%=rs.getString("NameOfMother")%></td>
                    </tr>
                    <tr>
                        <td>IDENTITY PROOF</td>
                        <td><%=rs.getString("IdentityProofType")%></td>
                        <td><%=rs.getString("IdentityProofNumber")%></td>
                    </tr>
                    <tr>
                        <td>CORRESPONDANCE ADDRESS</td>
                        <td><%=rs.getString("CorrespondenceAddress")%></td>
                    </tr>
                    <tr>
                        <td>PERMANENT ADDRESS</td>
                        <td><%=rs.getString("PermanentAddress")%></td>
                    </tr>
                    <tr>
                        <td>PHONE NUMBER</td>
                        <td><%=Number%></td>
                    </tr>
                    <tr>
                        <td>Port/Place of Applying Form</td>
                        <td><%=rs.getString("PlaceOfApplying")%></td>
                    </tr>
                </table>
            </div>
            <div class="col-md-3">
                <div>
                    <img  class="img-fluid" src="<%=path%>"  alt="Photo.jpg" >
                </div>
            </div>
        </div>
    </div>
    <%
            }
        }
        catch (Exception e){out.print(e);}
    %>
    <hr>
    <div class="container"><h3>Educational Details(PhD)</h3></div>
    <%
        try{
            String sql="select * from Educational_Qualification_PhD where ApplicationNumber='2018PF000003'";                                               //+session.getAttribute("ApplicationNumber")+"'";
            rs=st.executeQuery(sql);
            while (rs.next()){
    %>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <table class="table table-bordered">
                    <tr>
                        <td>Status</td>
                        <td><%=rs.getString("Status")%></td>
                    </tr>
                    <tr>
                        <td>Title</td>
                        <td><%=rs.getString("Title")%></td>
                    </tr>
                    <tr>
                        <td>Institute</td>
                        <td><%=rs.getString("Institute")%></td>
                    </tr>
                    <tr>
                        <td>Date</td>
                        <td><%=rs.getString("Date")%></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <%
        }
        }
        catch (Exception e){out.print(e);}
    %>
    <hr>
    <div class="container"><h3>Educational Details</h3></div>
    <%
        try{
            String sql="select * from Educational_Qualification where ApplicationNumber='2018PF000003'";                                               //+session.getAttribute("ApplicationNumber")+"'";
            rs=st.executeQuery(sql);
            while (rs.next()){
    %>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <table class="table table-bordered">
                    <tr>
                        <td>Qualification</td>
                        <td><%=rs.getString("Qualification")%></td>
                    </tr>
                    <tr>
                        <td>Degree</td>
                        <td><%=rs.getString("Degree")%></td>
                    </tr>
                    <tr>
                        <td>Discipline</td>
                        <td><%=rs.getString("Discipline")%></td>
                    </tr>
                    <tr>
                        <td>Institute</td>
                        <td><%=rs.getString("Institute")%></td>
                    </tr>
                    <tr>
                        <td>BoardOrUniv</td>
                        <td><%=rs.getString("BoardOrUniv")%></td>
                    </tr>
                    <tr>
                        <td>DateOfPassing</td>
                        <td><%=rs.getString("DateOfPassing")%></td>
                    </tr>
                    <tr>
                        <td>Division</td>
                        <td><%=rs.getString("Division")%></td>
                    </tr>
                    <tr>
                        <td>Percentage</td>
                        <td><%=rs.getString("Percentage")%></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <%
            }
        }
        catch (Exception e){out.print(e);}
    %>
    <hr>
    <div class="container"><h3>Other Academic Qualifications</h3></div>
    <%
        try{
            String sql="select * from Other_Academic_Qualification where Application_Number='2018PF000003'";                                               //+session.getAttribute("ApplicationNumber")+"'";
            rs=st.executeQuery(sql);
            while (rs.next()){
    %>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <table class="table table-bordered">
                    <tr>
                        <td>Degree</td>
                        <td><%=rs.getString("Degree")%></td>
                    </tr>
                    <tr>
                        <td>Discipline</td>
                        <td><%=rs.getString("Discipline")%></td>
                    </tr>
                    <tr>
                        <td>Institute</td>
                        <td><%=rs.getString("Institute")%></td>
                    </tr>
                    <tr>
                        <td>Board/Univ</td>
                        <td><%=rs.getString("Board")%></td>
                    </tr>
                    <tr>
                        <td>Marks/CGPA</td>
                        <td><%=rs.getString("Marks")%></td>
                    </tr>
                    <tr>
                        <td>Max Marks/CGPA</td>
                        <td><%=rs.getString("Max_Marks")%></td>
                    </tr>
                    <tr>
                        <td>Percentage Marks/CGPA</td>
                        <td><%=rs.getString("Percentage_Marks")%></td>
                    </tr>
                    <tr>
                        <td>Division</td>
                        <td><%=rs.getString("Division")%></td>
                    </tr>
                    <tr>
                        <td>Year</td>
                        <td><%=rs.getString("Year")%></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <%
            }
        }
        catch (Exception e){out.print(e);}
    %>
    <hr>
    <div class="container"><h3>Present Employer</h3></div>
    <%
        try{
            String sql="select * from Present_Employee where ApplicationNumber='2018PF000003'";                                               //+session.getAttribute("ApplicationNumber")+"'";
            rs=st.executeQuery(sql);
            while (rs.next()){
    %>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <table class="table table-bordered">
                    <tr>
                        <td>Organisation</td>
                        <td><%=rs.getString("Organisation")%></td>
                    </tr>
                    <tr>
                        <td>Type Of Employer</td>
                        <td><%=rs.getString("TypeOfEmp")%></td>
                    </tr>
                    <tr>
                        <td>From</td>
                        <td><%=rs.getString("FromDate")%></td>
                    </tr>
                    <tr>
                        <td>To</td>
                        <td><%=rs.getString("ToDate")%></td>
                    </tr>
                    <tr>
                        <td>Pay In Pay Band</td>
                        <td><%=rs.getString("PayInBand")%></td>
                    </tr>
                    <tr>
                        <td>APG/GP</td>
                        <td><%=rs.getString("APG_GP")%></td>
                    </tr>
                    <tr>
                        <td>Basic Pay</td>
                        <td><%=rs.getString("BasicPay")%></td>
                    </tr>
                    <tr>
                        <td>Nature Of Work</td>
                        <td><%=rs.getString("NatureOfWork")%></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <%
            }
        }
        catch (Exception e){out.print(e);}
    %>
    <hr>
    <div class="container"><h3>Teaching Experience</h3></div>
    <%
        try{
            String sql="select * from Teaching_Experience where ApplicationNumber='2018PF000003'";                                               //+session.getAttribute("ApplicationNumber")+"'";
            rs=st.executeQuery(sql);
            while (rs.next()){
    %>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <table class="table table-bordered">
                    <tr>
                        <td>Organisation</td>
                        <td><%=rs.getString("Organisation")%></td>
                    </tr>
                    <tr>
                        <td>Position Held</td>
                        <td><%=rs.getString("PositionHeld")%></td>
                    </tr>
                    <tr>
                        <td>From</td>
                        <td><%=rs.getString("FromDate")%></td>
                    </tr>
                    <tr>
                        <td>To</td>
                        <td><%=rs.getString("ToDate")%></td>
                    </tr>
                    <tr>
                        <td>Pay Scale with AGP</td>
                        <td><%=rs.getString("PayScaleWithAGP")%></td>
                    </tr>
                    <tr>
                        <td>Type Of Employer</td>
                        <td><%=rs.getString("TypeOfEmployee")%></td>
                    </tr>
                    <tr>
                        <td>Tenure</td>
                        <td><%=rs.getString("Tenure")%></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <%
            }
        }
        catch (Exception e){out.print(e);}
    %>
    <hr>
    <div class="container"><h3>Research Experience/Post Doctoral Research</h3></div>
    <%
        try{
            String sql="select * from Research_Experience where Application_Number='2018PF000003'";                                               //+session.getAttribute("ApplicationNumber")+"'";
            rs=st.executeQuery(sql);
            while (rs.next()){
    %>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <table class="table table-bordered">
                    <tr>
                        <td>Organisation</td>
                        <td><%=rs.getString("Organisation")%></td>
                    </tr>
                    <tr>
                        <td>Position Held</td>
                        <td><%=rs.getString("Position_Held")%></td>
                    </tr>
                    <tr>
                        <td>From</td>
                        <td><%=rs.getString("FromDate")%></td>
                    </tr>
                    <tr>
                        <td>To</td>
                        <td><%=rs.getString("ToDate")%></td>
                    </tr>
                    <tr>
                        <td>Salary </td>
                        <td><%=rs.getString("Salary")%></td>
                    </tr>
                    <tr>
                        <td>Nature Of Work</td>
                        <td><%=rs.getString("Nature_Of_Work")%></td>
                    </tr>
                    <tr>
                        <td>Tenure</td>
                        <td><%=rs.getString("Tenure")%></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <%
            }
        }
        catch (Exception e){out.print(e);}
    %>
    <hr>
    <div class="container"><h3>Industrial Experience</h3></div>
    <%
        try{
            String sql="select * from Industrial_Experience where Application_Number='2018PF000003'";                                               //+session.getAttribute("ApplicationNumber")+"'";
            rs=st.executeQuery(sql);
            while (rs.next()){
    %>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <table class="table table-bordered">
                    <tr>
                        <td>Organisation</td>
                        <td><%=rs.getString("Organisation")%></td>
                    </tr>
                    <tr>
                        <td>Position</td>
                        <td><%=rs.getString("Position")%></td>
                    </tr>
                    <tr>
                        <td>From</td>
                        <td><%=rs.getString("FromDate")%></td>
                    </tr>
                    <tr>
                        <td>To</td>
                        <td><%=rs.getString("ToDate")%></td>
                    </tr>
                    <tr>
                        <td>Pay Scale with AGP</td>
                        <td><%=rs.getString("Salary")%></td>
                    </tr>
                    <tr>
                        <td>Type Of Employer</td>
                        <td><%=rs.getString("Type_Of_Employer")%></td>
                    </tr>
                    <tr>
                        <td>Nature Of Work</td>
                        <td><%=rs.getString("Nature_Of_Work")%></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <%
            }
        }
        catch (Exception e){out.print(e);}
    %>
    <hr>
    <div class="container"><h3>Reference(s):</h3></div>
    <%
        try{
            String sql="select * from Reference where Application_Number='2018PF000003'";                                               //+session.getAttribute("ApplicationNumber")+"'";
            rs=st.executeQuery(sql);
            while (rs.next()){
    %>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <table class="table table-bordered">
                    <tr>
                        <td>Name</td>
                        <td><%=rs.getString("Name")%></td>
                    </tr>
                    <tr>
                        <td>Designation</td>
                        <td><%=rs.getString("Designation")%></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><%=rs.getString("Address")%></td>
                    </tr>
                    <tr>
                        <td>City</td>
                        <td><%=rs.getString("City")%></td>
                    </tr>
                    <tr>
                        <td>PIN</td>
                        <td><%=rs.getString("PIN")%></td>
                    </tr>
                    <tr>
                        <td>Mobile</td>
                        <td><%=rs.getString("Mobile")%></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><%=rs.getString("Email")%></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <%
            }
        }
        catch (Exception e){out.print(e);}
    %>
    <hr>
    <div class="container"><h3>Any Other Information:</h3></div>
    <%
        try{
            String sql="select * from Any_Other_Information where ApplicationNumber='2018PF000003'";                                               //+session.getAttribute("ApplicationNumber")+"'";
            rs=st.executeQuery(sql);
            while (rs.next()){
    %>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <table class="table table-bordered">
                    <tr>
                        <td>Information</td>
                        <td><%=rs.getString("Information")%></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <%
            }
            con.close();
        }
        catch (Exception e){out.print(e);}
    %>
    <hr>
</body>

