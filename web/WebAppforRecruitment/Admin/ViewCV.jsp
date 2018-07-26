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
        con = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12245685","sql12245685","fpStvI5rK8");//DriverManager.getConnection(session.getAttribute("DatabaseHost").toString(),session.getAttribute("DatabaseUser").toString(),session.getAttribute("DatabasePassword").toString());
        st=con.createStatement();
        con = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12245685","sql12245685","fpStvI5rK8");
        st=con.createStatement();
        ResultSet rs1 = st.executeQuery("SELECT * from Personal_Information where ApplicationNumber='2018PF000003'");        //where ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"'");
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
    <style>
        @media print {
            body{
                float: none;
            }
            @page  {
                size: A4;
            }
            h3{
                page-break-after: avoid;
            }
            table {
                page-break-inside: avoid;
            }
            .table-bordered th,
            .table-bordered td {
                border: 1px solid #000 !important;
                padding: 0.5rem;
                margin: 5%;
                border-collapse: collapse;
            }
        }
    </style>
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
                        <td class="col-6">NAME</td>
                        <td class="col-6"><%=Name%></td>
                    </tr>
                    <tr>
                        <td class="col-6">SPECIALIZATION</td>
                        <td class="col-6"><%=rs.getString(2)%></td>
                    </tr>
                    <tr>
                        <td class="col-6">EMAIL</td>
                        <td class="col-6"><%=Email%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Post Applying for</td>
                        <td class="col-6"><%=Post%></td>
                    </tr>
                    <tr>
                        <td class="col-6">MARITAL STATUS</td>
                        <td class="col-6"><%=rs.getString("MaritalStatus")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">GENDER</td>
                        <td class="col-6"><%=rs.getString("Gender")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">DOMICILE</td>
                        <td class="col-6"><%=rs.getString("Domicile")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">CATEGORY</td>
                        <td class="col-6"><%=rs.getString("Category")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">HANDICAPPED</td>
                        <td class="col-6"><%=rs.getString("PhysicallyHandicapped")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">DATE OF BIRTH</td>
                        <td class="col-6"><%=rs.getString("DateOfBirth")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">NATIONALITY</td>
                        <td class="col-6"><%=rs.getString("Nationality")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">NAME OF FATHER</td>
                        <td class="col-6"><%=rs.getString("NameOfFather")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">NAME OF MOTHER</td>
                        <td class="col-6"><%=rs.getString("NameOfMother")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">IDENTITY PROOF</td>
                        <td class="col-6"><%=rs.getString("IdentityProofType")+rs.getString("IdentityProofNumber")%></td>
                    </tr>
                    <tr>
                        <td>CORRESPONDANCE ADDRESS</td>
                        <td class="col-6"><%=rs.getString("CorrespondenceAddress")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">PERMANENT ADDRESS</td>
                        <td class="col-6"><%=rs.getString("PermanentAddress")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">PHONE NUMBER</td>
                        <td class="col-6"><%=Number%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Port/Place of Applying Form</td>
                        <td class="col-6"><%=rs.getString("PlaceOfApplying")%></td>
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
                        <td class="col-6">Status</td>
                        <td class="col-6"><%=rs.getString("Status")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Title</td>
                        <td class="col-6"><%=rs.getString("Title")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Institute</td>
                        <td class="col-6"><%=rs.getString("Institute")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Date</td>
                        <td class="col-6"><%=rs.getString("Date")%></td>
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
                        <td class="col-6">Qualification</td>
                        <td class="col-6"><%=rs.getString("Qualification")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Degree</td>
                        <td class="col-6"><%=rs.getString("Degree")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Discipline</td>
                        <td class="col-6"><%=rs.getString("Discipline")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Institute</td>
                        <td class="col-6"><%=rs.getString("Institute")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">BoardOrUniv</td>
                        <td class="col-6"><%=rs.getString("BoardOrUniv")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">DateOfPassing</td>
                        <td class="col-6"><%=rs.getString("DateOfPassing")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Division</td>
                        <td class="col-6"><%=rs.getString("Division")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Percentage</td>
                        <td class="col-6"><%=rs.getString("Percentage")%></td>
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
                        <td class="col-6">Degree</td>
                        <td class="col-6"><%=rs.getString("Degree")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Discipline</td>
                        <td class="col-6"><%=rs.getString("Discipline")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Institute</td>
                        <td class="col-6"><%=rs.getString("Institute")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Board/Univ</td>
                        <td class="col-6"><%=rs.getString("Board")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Marks/CGPA</td>
                        <td class="col-6"><%=rs.getString("Marks")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Max Marks/CGPA</td>
                        <td class="col-6"><%=rs.getString("Max_Marks")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Percentage Marks/CGPA</td>
                        <td class="col-6"><%=rs.getString("Percentage_Marks")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Division</td>
                        <td class="col-6"><%=rs.getString("Division")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Year</td>
                        <td class="col-6"><%=rs.getString("Year")%></td>
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
    <div class="container"><h3>Present Employer</h3>
    <%
        try{
            String sql="select * from Present_Employee where ApplicationNumber='2018PF000003'";                                               //+session.getAttribute("ApplicationNumber")+"'";
            rs=st.executeQuery(sql);
            while (rs.next()){
    %>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-bordered">
                    <tr>
                        <td class="col-6">Organisation</td>
                        <td class="col-6"><%=rs.getString("Organisation")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Type Of Employer</td>
                        <td class="col-6"><%=rs.getString("TypeOfEmp")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">From</td>
                        <td class="col-6"><%=rs.getString("FromDate")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">To</td>
                        <td class="col-6"><%=rs.getString("ToDate")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Pay In Pay Band</td>
                        <td class="col-6"><%=rs.getString("PayInBand")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">APG/GP</td>
                        <td class="col-6"><%=rs.getString("APG_GP")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Basic Pay</td>
                        <td class="col-6"><%=rs.getString("BasicPay")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Nature Of Work</td>
                        <td class="col-6"><%=rs.getString("NatureOfWork")%></td>
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
                        <td class="col-6">Organisation</td>
                        <td class="col-6"><%=rs.getString("Organisation")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Position Held</td>
                        <td class="col-6"><%=rs.getString("PositionHeld")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">From</td>
                        <td class="col-6"><%=rs.getString("FromDate")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">To</td>
                        <td class="col-6"><%=rs.getString("ToDate")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Pay Scale with AGP</td>
                        <td class="col-6"><%=rs.getString("PayScaleWithAGP")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Type Of Employer</td>
                        <td class="col-6"><%=rs.getString("TypeOfEmployee")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Tenure</td>
                        <td class="col-6"><%=rs.getString("Tenure")%></td>
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
                        <td class="col-6">Organisation</td>
                        <td class="col-6"><%=rs.getString("Organisation")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Position Held</td>
                        <td class="col-6"><%=rs.getString("Position_Held")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">From</td>
                        <td class="col-6"><%=rs.getString("FromDate")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">To</td>
                        <td class="col-6"><%=rs.getString("ToDate")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Salary </td>
                        <td class="col-6"><%=rs.getString("Salary")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Nature Of Work</td>
                        <td class="col-6"><%=rs.getString("Nature_Of_Work")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Tenure</td>
                        <td class="col-6"><%=rs.getString("Tenure")%></td>
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
                        <td class="col-6">Organisation</td>
                        <td class="col-6"><%=rs.getString("Organisation")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Position</td>
                        <td class="col-6"><%=rs.getString("Position")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">From</td>
                        <td class="col-6"><%=rs.getString("FromDate")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">To</td>
                        <td class="col-6"><%=rs.getString("ToDate")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Pay Scale with AGP</td>
                        <td class="col-6"><%=rs.getString("Salary")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Type Of Employer</td>
                        <td class="col-6"><%=rs.getString("Type_Of_Employer")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Nature Of Work</td>
                        <td class="col-6"><%=rs.getString("Nature_Of_Work")%></td>
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
                        <td class="col-6">Name</td>
                        <td class="col-6"><%=rs.getString("Name")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Designation</td>
                        <td class="col-6"><%=rs.getString("Designation")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Address</td>
                        <td class="col-6"><%=rs.getString("Address")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">City</td>
                        <td class="col-6"><%=rs.getString("City")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">PIN</td>
                        <td class="col-6"><%=rs.getString("PIN")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Mobile</td>
                        <td class="col-6"><%=rs.getString("Mobile")%></td>
                    </tr>
                    <tr>
                        <td class="col-6">Email</td>
                        <td class="col-6"><%=rs.getString("Email")%></td>
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
                        <td class="col-6">Information</td>
                        <td class="col-6"><%=rs.getString("Information")%></td>
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
    <div class="container"style="height:100% ">
        <iframe src="https://docs.google.com/document/d/e/2PACX-1vRh0HxXwR713emwqjGvuurb8_kDSPXstOWiQsEvhjauJp_G85-Htdc7QsEKFUQ5QmZwxmsh6n4RNyIH/pub?embedded=true" onload='javascript:(function(o){o.style.height=o.contentWindow.document.body.scrollHeight+"px";}(this));' style="height:500px;width:100%;border:none;overflow:hidden;"></iframe>
    </div>
</body>

