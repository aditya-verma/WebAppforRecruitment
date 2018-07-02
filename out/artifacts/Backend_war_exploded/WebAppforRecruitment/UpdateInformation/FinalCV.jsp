<%--
  Created by IntelliJ IDEA.
  User: amritesh
  Date: 01-07-2018
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CV</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/datepicker.css">
    <script src="../jquery/3.3.1/jquery.min.js"></script>
    <script src="../jquery/popper.js/1.14.3/popper.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <style>
    .rcorners2 {
        border-radius: 20px;
        border: 2px ;
        height: 55px;
        width: 101%;
    }
    </style>
</head>
<body>
<header>
    <nav class="navbar sticky-top navbar-light bg-light"  style="border-bottom-color: #000">
        <div class="container" >
            <div class="navbar-header" >
                <a class="navbar-brand" href="#">
                    <img class="img-fluid float-left" src="../Images/form-background.png"  style="margin-left: 5rem;max-width: 7%; height: auto">
                    <img class="img-fluid " src="../Images/mnnit name.png"  style="margin-left: 3rem;max-width: 80%;height: auto">
                </a>
            </div>
        </div>
    </nav>
    <div class="jumbotron" >
        <div class="container">
            <h1>Recruitment Portal</h1>
            <div class="bg-dark rcorners2 ">
                <h3  style="color: #FFF;padding-top: 1%;padding-left: 1%">Application Form</h3>
            </div>
        </div>
    </div>
</header>
<%
    Connection con=null;
    Statement st=null;
    ResultSet rs=null;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12245685","sql12245685","fpStvI5rK8");
        // con = DriverManager.getConnection("jdbc:mysql://localhost:3306/summer","root","");
        st=con.createStatement();
        String sql="select * from Personal_Information where ApplicationNumber='2018PF000003'";
        rs=st.executeQuery(sql);
        rs.next();
%>
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <div id="list-example" class="list-group">
        <a class="list-group-item list-group-item-action" href="#list-item-1">Personal Information</a>
        <a class="list-group-item list-group-item-action" href="#list-item-2">Educational Details(PhD)</a>
        <a class="list-group-item list-group-item-action" href="#list-item-3">Educational Details</a>
        <a class="list-group-item list-group-item-action" href="#list-item-4">Item 4</a>
    </div>
        </div>
        <div class="col-md-7">
            <div data-spy="scroll" data-target="#list-example" data-offset="0" class="scrollspy-example">
        <h4 id="list-item-1">Personal Information</h4>
        <form id="PersonalInformation" action="#" style="width: 100%;">
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="text-uppercase" for="applicant_first_name">NAME</label>
                        <input id="applicant_first_name" class="form-control" placeholder="" value="<%=session.getAttribute("Name")%>" required name="Personal_Information_First_Name">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="text-uppercase" for="postApplied">Post Applying for</label>
                <select class="form-control" id="postApplied" required name="Personal_Information_Post">
                    <option></option>
                    <!---------Fill this using jsp------------>
                </select>
            </div>

            <div class="form-group" >
                <label class="text-uppercase" for="Specialization" >Specialization</label>
                <input id="Specialization" class="form-control" placeholder="" name="Personal_Information_Specialization" value="<%=rs.getString(2)%>">
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group" >
                        <label class="text-uppercase" for="email" >Email</label>
                        <input id="email" class="form-control" type="email" placeholder="" required name="Personal_Information_Email" value="<%=session.getAttribute("Email")%>">
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="text-uppercase" for="Gender">Gender</label>
                        <select class="form-control" id="Gender" required name="Personal_Information_Gender">
                            <option><%=rs.getString(4)%></option>
                            <option>MALE</option>
                            <option>FEMALE</option>
                            <option>OTHERS</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="text-uppercase" for="Domicile">Domicile</label>
                        <input id="Domicile" class="form-control" placeholder="" required name="Personal_Information_Domicile" value="<%=rs.getString(5)%>">
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="text-uppercase" for="Marital_Status">Marital Status</label>
                        <select class="form-control" id="Marital_Status" required name="Personal_Information_Marital_Status">
                            <option><%=rs.getString(3)%></option>
                            <option>SINGLE</option>
                            <option>MARRIED</option>
                            <option>DIVORCED</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="text-uppercase" for="Category">Category</label>
                        <select class="form-control" id="Category" required name="Personal_Information_Category">
                            <option><%=rs.getString(6)%></option>
                            <option>GENERAL</option>
                            <option>OBC</option>
                            <option>OBC-Creamy Layer</option>
                            <option>SC/ST</option>
                        </select>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="text-uppercase" for="Handicapped">Handicapped</label>
                        <select class="form-control" id="Handicapped" required name="Personal_Information_Handicapped">
                            <option><%=rs.getString(7)%></option>
                            <option>Applicable</option>
                            <option>Not Applicable</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="text-uppercase" for="DateOfBirth">Date Of Birth</label>
                        <input id="DateOfBirth" type="date" class="form-control" placeholder="" name="Personal_Information_DOB" value="<%=rs.getString(8)%>">
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="text-uppercase" for="Nationality">Nationality</label>
                        <select class="form-control text-uppercase" id="Nationality" required name="Personal_Information_Country">
                            <option><%=rs.getString(9)%></option>
                            <option value="IN">India</option>
                            <option value="AF">Afghanistan</option>
                            <option value="AX">Åland Islands</option>
                            <option value="AL">Albania</option>
                            <option value="DZ">Algeria</option>
                            <option value="AS">American Samoa</option>
                            <option value="AD">Andorra</option>
                            <option value="AO">Angola</option>
                            <option value="AI">Anguilla</option>
                            <option value="AQ">Antarctica</option>
                            <option value="AG">Antigua and Barbuda</option>
                            <option value="AR">Argentina</option>
                            <option value="AM">Armenia</option>
                            <option value="AW">Aruba</option>
                            <option value="AU">Australia</option>
                            <option value="AT">Austria</option>
                            <option value="AZ">Azerbaijan</option>
                            <option value="BS">Bahamas</option>
                            <option value="BH">Bahrain</option>
                            <option value="BD">Bangladesh</option>
                            <option value="BB">Barbados</option>
                            <option value="BY">Belarus</option>
                            <option value="BE">Belgium</option>
                            <option value="BZ">Belize</option>
                            <option value="BJ">Benin</option>
                            <option value="BM">Bermuda</option>
                            <option value="BT">Bhutan</option>
                            <option value="BO">Bolivia, Plurinational State of</option>
                            <option value="BQ">Bonaire, Sint Eustatius and Saba</option>
                            <option value="BA">Bosnia and Herzegovina</option>
                            <option value="BW">Botswana</option>
                            <option value="BV">Bouvet Island</option>
                            <option value="BR">Brazil</option>
                            <option value="IO">British Indian Ocean Territory</option>
                            <option value="BN">Brunei Darussalam</option>
                            <option value="BG">Bulgaria</option>
                            <option value="BF">Burkina Faso</option>
                            <option value="BI">Burundi</option>
                            <option value="KH">Cambodia</option>
                            <option value="CM">Cameroon</option>
                            <option value="CA">Canada</option>
                            <option value="CV">Cape Verde</option>
                            <option value="KY">Cayman Islands</option>
                            <option value="CF">Central African Republic</option>
                            <option value="TD">Chad</option>
                            <option value="CL">Chile</option>
                            <option value="CN">China</option>
                            <option value="CX">Christmas Island</option>
                            <option value="CC">Cocos (Keeling) Islands</option>
                            <option value="CO">Colombia</option>
                            <option value="KM">Comoros</option>
                            <option value="CG">Congo</option>
                            <option value="CD">Congo, the Democratic Republic of the</option>
                            <option value="CK">Cook Islands</option>
                            <option value="CR">Costa Rica</option>
                            <option value="CI">Côte d'Ivoire</option>
                            <option value="HR">Croatia</option>
                            <option value="CU">Cuba</option>
                            <option value="CW">Curaçao</option>
                            <option value="CY">Cyprus</option>
                            <option value="CZ">Czech Republic</option>
                            <option value="DK">Denmark</option>
                            <option value="DJ">Djibouti</option>
                            <option value="DM">Dominica</option>
                            <option value="DO">Dominican Republic</option>
                            <option value="EC">Ecuador</option>
                            <option value="EG">Egypt</option>
                            <option value="SV">El Salvador</option>
                            <option value="GQ">Equatorial Guinea</option>
                            <option value="ER">Eritrea</option>
                            <option value="EE">Estonia</option>
                            <option value="ET">Ethiopia</option>
                            <option value="FK">Falkland Islands (Malvinas)</option>
                            <option value="FO">Faroe Islands</option>
                            <option value="FJ">Fiji</option>
                            <option value="FI">Finland</option>
                            <option value="FR">France</option>
                            <option value="GF">French Guiana</option>
                            <option value="PF">French Polynesia</option>
                            <option value="TF">French Southern Territories</option>
                            <option value="GA">Gabon</option>
                            <option value="GM">Gambia</option>
                            <option value="GE">Georgia</option>
                            <option value="DE">Germany</option>
                            <option value="GH">Ghana</option>
                            <option value="GI">Gibraltar</option>
                            <option value="GR">Greece</option>
                            <option value="GL">Greenland</option>
                            <option value="GD">Grenada</option>
                            <option value="GP">Guadeloupe</option>
                            <option value="GU">Guam</option>
                            <option value="GT">Guatemala</option>
                            <option value="GG">Guernsey</option>
                            <option value="GN">Guinea</option>
                            <option value="GW">Guinea-Bissau</option>
                            <option value="GY">Guyana</option>
                            <option value="HT">Haiti</option>
                            <option value="HM">Heard Island and McDonald Islands</option>
                            <option value="VA">Holy See (Vatican City State)</option>
                            <option value="HN">Honduras</option>
                            <option value="HK">Hong Kong</option>
                            <option value="HU">Hungary</option>
                            <option value="IS">Iceland</option>
                            <option value="ID">Indonesia</option>
                            <option value="IR">Iran, Islamic Republic of</option>
                            <option value="IQ">Iraq</option>
                            <option value="IE">Ireland</option>
                            <option value="IM">Isle of Man</option>
                            <option value="IL">Israel</option>
                            <option value="IT">Italy</option>
                            <option value="JM">Jamaica</option>
                            <option value="JP">Japan</option>
                            <option value="JE">Jersey</option>
                            <option value="JO">Jordan</option>
                            <option value="KZ">Kazakhstan</option>
                            <option value="KE">Kenya</option>
                            <option value="KI">Kiribati</option>
                            <option value="KP">Korea, Democratic People's Republic of</option>
                            <option value="KR">Korea, Republic of</option>
                            <option value="KW">Kuwait</option>
                            <option value="KG">Kyrgyzstan</option>
                            <option value="LA">Lao People's Democratic Republic</option>
                            <option value="LV">Latvia</option>
                            <option value="LB">Lebanon</option>
                            <option value="LS">Lesotho</option>
                            <option value="LR">Liberia</option>
                            <option value="LY">Libya</option>
                            <option value="LI">Liechtenstein</option>
                            <option value="LT">Lithuania</option>
                            <option value="LU">Luxembourg</option>
                            <option value="MO">Macao</option>
                            <option value="MK">Macedonia, the former Yugoslav Republic of</option>
                            <option value="MG">Madagascar</option>
                            <option value="MW">Malawi</option>
                            <option value="MY">Malaysia</option>
                            <option value="MV">Maldives</option>
                            <option value="ML">Mali</option>
                            <option value="MT">Malta</option>
                            <option value="MH">Marshall Islands</option>
                            <option value="MQ">Martinique</option>
                            <option value="MR">Mauritania</option>
                            <option value="MU">Mauritius</option>
                            <option value="YT">Mayotte</option>
                            <option value="MX">Mexico</option>
                            <option value="FM">Micronesia, Federated States of</option>
                            <option value="MD">Moldova, Republic of</option>
                            <option value="MC">Monaco</option>
                            <option value="MN">Mongolia</option>
                            <option value="ME">Montenegro</option>
                            <option value="MS">Montserrat</option>
                            <option value="MA">Morocco</option>
                            <option value="MZ">Mozambique</option>
                            <option value="MM">Myanmar</option>
                            <option value="NA">Namibia</option>
                            <option value="NR">Nauru</option>
                            <option value="NP">Nepal</option>
                            <option value="NL">Netherlands</option>
                            <option value="NC">New Caledonia</option>
                            <option value="NZ">New Zealand</option>
                            <option value="NI">Nicaragua</option>
                            <option value="NE">Niger</option>
                            <option value="NG">Nigeria</option>
                            <option value="NU">Niue</option>
                            <option value="NF">Norfolk Island</option>
                            <option value="MP">Northern Mariana Islands</option>
                            <option value="NO">Norway</option>
                            <option value="OM">Oman</option>
                            <option value="PK">Pakistan</option>
                            <option value="PW">Palau</option>
                            <option value="PS">Palestinian Territory, Occupied</option>
                            <option value="PA">Panama</option>
                            <option value="PG">Papua New Guinea</option>
                            <option value="PY">Paraguay</option>
                            <option value="PE">Peru</option>
                            <option value="PH">Philippines</option>
                            <option value="PN">Pitcairn</option>
                            <option value="PL">Poland</option>
                            <option value="PT">Portugal</option>
                            <option value="PR">Puerto Rico</option>
                            <option value="QA">Qatar</option>
                            <option value="RE">Réunion</option>
                            <option value="RO">Romania</option>
                            <option value="RU">Russian Federation</option>
                            <option value="RW">Rwanda</option>
                            <option value="BL">Saint Barthélemy</option>
                            <option value="SH">Saint Helena, Ascension and Tristan da Cunha</option>
                            <option value="KN">Saint Kitts and Nevis</option>
                            <option value="LC">Saint Lucia</option>
                            <option value="MF">Saint Martin (French part)</option>
                            <option value="PM">Saint Pierre and Miquelon</option>
                            <option value="VC">Saint Vincent and the Grenadines</option>
                            <option value="WS">Samoa</option>
                            <option value="SM">San Marino</option>
                            <option value="ST">Sao Tome and Principe</option>
                            <option value="SA">Saudi Arabia</option>
                            <option value="SN">Senegal</option>
                            <option value="RS">Serbia</option>
                            <option value="SC">Seychelles</option>
                            <option value="SL">Sierra Leone</option>
                            <option value="SG">Singapore</option>
                            <option value="SX">Sint Maarten (Dutch part)</option>
                            <option value="SK">Slovakia</option>
                            <option value="SI">Slovenia</option>
                            <option value="SB">Solomon Islands</option>
                            <option value="SO">Somalia</option>
                            <option value="ZA">South Africa</option>
                            <option value="GS">South Georgia and the South Sandwich Islands</option>
                            <option value="SS">South Sudan</option>
                            <option value="ES">Spain</option>
                            <option value="LK">Sri Lanka</option>
                            <option value="SD">Sudan</option>
                            <option value="SR">Suriname</option>
                            <option value="SJ">Svalbard and Jan Mayen</option>
                            <option value="SZ">Swaziland</option>
                            <option value="SE">Sweden</option>
                            <option value="CH">Switzerland</option>
                            <option value="SY">Syrian Arab Republic</option>
                            <option value="TW">Taiwan, Province of China</option>
                            <option value="TJ">Tajikistan</option>
                            <option value="TZ">Tanzania, United Republic of</option>
                            <option value="TH">Thailand</option>
                            <option value="TL">Timor-Leste</option>
                            <option value="TG">Togo</option>
                            <option value="TK">Tokelau</option>
                            <option value="TO">Tonga</option>
                            <option value="TT">Trinidad and Tobago</option>
                            <option value="TN">Tunisia</option>
                            <option value="TR">Turkey</option>
                            <option value="TM">Turkmenistan</option>
                            <option value="TC">Turks and Caicos Islands</option>
                            <option value="TV">Tuvalu</option>
                            <option value="UG">Uganda</option>
                            <option value="UA">Ukraine</option>
                            <option value="AE">United Arab Emirates</option>
                            <option value="GB">United Kingdom</option>
                            <option value="US">United States</option>
                            <option value="UM">United States Minor Outlying Islands</option>
                            <option value="UY">Uruguay</option>
                            <option value="UZ">Uzbekistan</option>
                            <option value="VU">Vanuatu</option>
                            <option value="VE">Venezuela, Bolivarian Republic of</option>
                            <option value="VN">Viet Nam</option>
                            <option value="VG">Virgin Islands, British</option>
                            <option value="VI">Virgin Islands, U.S.</option>
                            <option value="WF">Wallis and Futuna</option>
                            <option value="EH">Western Sahara</option>
                            <option value="YE">Yemen</option>
                            <option value="ZM">Zambia</option>
                            <option value="ZW">Zimbabwe</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="text-uppercase" for="Name_Father">Name Of Father</label>
                <input id="Name_Father" class="form-control" placeholder="" name="Personal_Information_Father" value="<%=rs.getString(10)%>">
            </div>
            <div class="form-group">
                <label class="text-uppercase" for="Name_Mother">Name of Mother</label>
                <input id="Name_Mother" class="form-control" placeholder="" name="Personal_Information_Mother" value="<%=rs.getString(11)%>">
            </div>
            <div class="form-group">
                <label class="text-uppercase" for="ID">Identity Proof</label>
                <div class="row">
                    <div class="col-sm-6">
                        <select class="form-control" id="ID-type" placeholder="ID Type" name="Personal_Information_ID_Proof">
                            <option><%=rs.getString(12)%></option>
                            <option>Aadhar Number</option>
                            <option>Pan Card</option>
                        </select>
                    </div>
                    <div class="col-sm-6">
                        <input id="ID" class="form-control" placeholder="ID number" required name="Personal_Information_ID_Photo" value="<%="xxxxxxx-xxxxxx-xxx"%>">
                        <!--ADD ID NUMBER COLUMN IN PERSONAL INFORMATION TABLE-->
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="text-uppercase" for="Correspondence_Address">Correspondence Address</label>
                <input id="Correspondence_Address" class="form-control" placeholder="" required name="Personal_Information_Correspondance_Address" value="<%=rs.getString(13)%>">
            </div>
            <div class="form-group">
                <label class="text-uppercase" for="Permanent_Address">Permanent Address</label>
                <input id="Permanent_Address" class="form-control" placeholder="" required name="Personal_Information_Permanent_Address" value="<%=rs.getString(14)%>">
            </div>
            <div class="form-group">
                <label class="text-uppercase" for="Phone">Phone Number</label>
                <input id="Phone" class="form-control" placeholder="" required name="Personal_Information_Phone_Number" value="<%=rs.getString(15)%>">
                <!--Change PHONE NUMBER TYPE IN SQL TO ACCOMMODATE 10 DIGIT PHONE NUMBER -->
            </div>
            <div class="form-group">
                <label class="text-uppercase" for="ApplyingPlace">Port/Place of Applying Form</label>
                <input id="ApplyingPlace" class="form-control" placeholder="" required name="Personal_Information_Port" value="<%=rs.getString(16)%>">
            </div>
            <%
                }catch(Exception e)
                {
                    out.println(e.toString());
                }
                rs=null;
            %>
            <!--Includ Jsp File after updation of Personal Information jsp-->
        </form>
        <h4 id="list-item-2">Educational Details(PhD)</h4>
                <%
                    try{
                        String sql="select * from Educational_Qualification_PhD where Application_Number='2018PF000003'";
                        rs=st.executeQuery(sql);
                %>
                <form class="table-responsive" id="Educational_Details(PhD)" action="" method="post">
                <table class=" table  table-bordered" >
                        <thead class="table-dark" >
                            <tr>
                            <th scope="col">Status</th>
                            <th scope="col">Title</th>
                            <th scope="col">Institute/University</th>
                            <th scope="col">Date of Award</th>
                                <th scope="col">Edit</th>
                                <th scope="col">Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%while(rs.next()){%>
                            <tr>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td><%=rs.getString(5)%></td>
                                <td><a href="Update%20Files/Educational_Qualification_PhD_Update.jsp?id=2018PF000003&title=<%=rs.getString(3)%>"><i class="fa fa-edit"></i></a></td>
                                <td><a href="Delete%20Files/Educational_Qualification_PhD_Delete.jsp?id=2018PF000003&title=<%=rs.getString(3)%>"><i class="fa fa-trash-alt"></i></a></td>
                            </tr>
                            <%}%>
                        </tbody>
                </table>
            </form>
                <%
                    }
                    catch (Exception e){
                        out.print(e.toString());
                    }
                    rs=null;
                %>
        <h4 id="list-item-3">Educational Details</h4>
                <%
                    try{
                        String sql="select * from Educational_Qualification where ApplicationNumber='2018PF000003'";
                        rs=st.executeQuery(sql);
                %>
                <form class="table-responsive-sm" id="Educational_Details" action="" method="post">
                    <table class=" table  table-bordered" >
                        <thead class="table-dark" >
                        <tr>
                            <th scope="col">Qualification</th>
                            <th scope="col">Degree</th>
                            <th scope="col">Discipline</th>
                            <th scope="col">Institute</th>
                            <th scope="col">Board/Univ</th>
                            <th scope="col">Date of Passing</th>
                            <th scope="col">Division</th>
                            <th scope="col">%age/CGPA</th>
                            <th scope="col">Edit</th>
                            <th scope="col">Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%while(rs.next()){%>
                        <tr>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                            <td><%=rs.getString(6)%></td>
                            <td><%=rs.getString(7)%></td>
                            <td><%=rs.getString(8)%></td>
                            <td><%=rs.getString(9)%></td>
                            <td><a href="Update%20Files/Educational_Qualification_Update.jsp?id=2018PF000003&date=<%=rs.getString(7)%>" >Edit</a></td>
                            <td><a href="Delete%20Files/Educational_Qualification_Delete.jsp?id=2018PF000003&date=<%=rs.getString(7)%>" ><i class="fa fa-trash"></i></a></td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </form>
                <%
                        con.close();
                    }
                    catch (Exception e){
                        out.print(e.toString());
                    }
                    rs=null;
                %>
        <h4 id="list-item-4">Item 4</h4>
        <p>...</p>
    </div>
        </div>
        <div class="col-md-2">
            <img  class="img-thumbnail" src="../Images/form-background.png" <%--=rs.getString(17)--%> alt="Photo.jpg">
        </div>
    </div>
</div>
</body>
</html>
