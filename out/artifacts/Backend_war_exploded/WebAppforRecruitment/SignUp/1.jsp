<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="en">
<%
    String countryList[] = new String[198];
    String postname="";
    try {
        String poststr="";
        String postc="";
        File dir = new File("D:\\Post\\");
        for (File file : dir.listFiles()) {
            FileReader fileReader = new FileReader(file);
            BufferedReader br = new BufferedReader(fileReader);
            String str = br.readLine();
            JSONObject jsonObject = new JSONObject(str);
            postc=jsonObject.getString("post").trim();
            if (session.getAttribute("ApplicationNumber").toString().contains(postc)){
                postname = jsonObject.getString("name").trim();
            }
            br.close();
        }
    }
    catch (FileNotFoundException e){}
    catch (JSONException e){}
    catch (Exception e){}
    try {
        FileReader in = new FileReader("C:\\Users\\ADITYA\\Documents\\GitHub\\WebAppforRecruitment\\web\\WebAppforRecruitment\\resources\\CountryList.txt");
        BufferedReader br = new BufferedReader(in);
        for (int i = 0; i < 198; i++) {
            countryList[i]=br.readLine().trim();
        }
        in.close();
    }
    catch (FileNotFoundException e){}

    String fname ="";
    String lname ="";
    String phone ="";
    String email ="";
    String Specialization="";
    String Marital_Status = "";
    String Gender = "";
    String Domicile ="";
    String Category = "";
    String Handicapped = "";
    String DateOfBirth = "";
    String Nationality = "";
    String NameOfFather = "";
    String NameOfMother = "";
    String idType = "";
    String idNumber = "";
    String CorrespondenceAddress = "";
    String PermanentAddress = "";
    String PlaceOfApplying = "";
    Connection connection = null;
    Statement stmt = null;
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection((String)session.getAttribute("DatabaseHost"),(String)session.getAttribute("DatabaseUser"),(String)session.getAttribute("DatabasePassword"));
        ResultSet rs;
        stmt = connection.createStatement();
        rs = stmt.executeQuery("SELECT * FROM USERS WHERE ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"'");
        if (rs.next())
        {
            fname = rs.getString("FirstName");
            lname = rs.getString("LastName");
            email = rs.getString("Email");
            phone = rs.getString("Phone");
        }
        rs = stmt.executeQuery("SELECT * FROM Personal_Information WHERE ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"'");
        if (rs.next())
        {
            Specialization = rs.getString("Specialization");
            Gender = rs.getString("Gender");
            Domicile = rs.getString("Domicile");
            CorrespondenceAddress = rs.getString("CorrespondenceAddress");
            PermanentAddress = rs.getString("PermanentAddress");
            DateOfBirth = rs.getString("DateOfBirth");
            Marital_Status = rs.getString("MaritalStatus");
            Handicapped = rs.getString("PhysicallyHandicapped");
            NameOfFather = rs.getString("NameOfFather");
            NameOfMother = rs.getString("NameOfMother");
            idType =rs.getString("IdentityProofType");
            idNumber =rs.getString("IdentityProofNumber");
            PlaceOfApplying = rs.getString("PlaceOfApplying");
            Category = rs.getString("Category");
        }
        connection.close();
        stmt.close();
%>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/backgrounds.css">
    <script src="../jquery/3.3.1/jquery.min.js"></script>
    <script src="../jquery/popper.js/1.14.3/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <link href="../css/datepicker.css" rel="stylesheet">
    <script src="../js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
        $(function() {
            $( "#DateOfBirth" ).datepicker({
                format: "dd-mm-yyyy",
                viewMode: "months",
                minViewMode: "days",
                pickerPosition: "bottom-left"});
        });
    </script>
    <script>
        $(document).ready(function(){
            $("#filladdress").on("click", function(){
                if (this.checked) {
                    $("#Permanent_Address").val($("#Correspondence_Address").val());
                }
                else {
                    $("#Permanent_Address").val('');
                }
            });
        });
    </script>
</head>
<body style="background-color: #f5f5f5;">
<div class="container">
    <form id="PersonalInformation" method="post" action="" style="width: 100%;">
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-uppercase" for="applicant_first_name">FIRST NAME</label>
                    <input id="applicant_first_name" class="form-control" placeholder="" required value="<%out.println(fname);%>">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-uppercase" for="applicant_last_name">LAST NAME</label>
                    <input id="applicant_last_name" class="form-control" placeholder="" required value="<%out.println(lname);%>">
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="text-uppercase" for="postApplied">Post Applying for</label>
            <input type="text" class="form-control" id="postApplied"  disabled value="<%=postname%>">
        </div>

        <div class="form-group" >
            <label class="text-uppercase" for="Specialization" >Specialization</label>
            <input id="Specialization" name="Specialization" class="form-control" placeholder="Specialization" value="<%out.println(Specialization);%>">
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group" >
                    <label class="text-uppercase" for="email" >Email</label>
                    <input id="Email" name="Email" class="form-control" type="email" placeholder="" required value="<%out.println(email);%>">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-uppercase" for="Gender">Gender</label>
                    <select class="form-control" name="Gender" id="Gender" required>
                        <option value="" <%if (Gender.equalsIgnoreCase("")){%>selected<%}%>></option>
                        <option value="MALE" <%if (Gender.equalsIgnoreCase("Male")){%>selected<%}%>>MALE</option>
                        <option value="FEMALE"<%if (Gender.equalsIgnoreCase("Female")){%>selected<%}%>>FEMALE</option>
                        <option value="OTHERS" <%if (Gender.equalsIgnoreCase("Others")){%>selected<%}%>>OTHERS</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-uppercase" for="Domicile">Domicile</label>
                    <input id="Domicile" class="form-control" name="Domicile" placeholder="" required value="<%out.println(Domicile);%>">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-uppercase" for="Marital_Status">Marital Status</label>
                    <select class="form-control"  name="Marital_Status" id="Marital_Status" required>
                        <option <%if (Marital_Status.equalsIgnoreCase("")){%>selected<%}%>></option>
                        <option <%if (Marital_Status.equalsIgnoreCase("Single")){%>selected<%}%>>SINGLE</option>
                        <option <%if (Marital_Status.equalsIgnoreCase("Married")){%>selected<%}%>>MARRIED</option>
                        <option <%if (Marital_Status.equalsIgnoreCase("Divorced")){%>selected<%}%>>DIVORCED</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-uppercase" for="Category">Category</label>
                    <select class="form-control" name="Category" id="Category" required>
                        <option <%if (Category.equalsIgnoreCase("")){%>selected<%}%>></option>
                        <option <%if (Category.equalsIgnoreCase("General")){%>selected<%}%>>GENERAL</option>
                        <option <%if (Category.equalsIgnoreCase("OBC-Non Creamy Layer")){%>selected<%}%>>OBC-Non Creamy Layer</option>
                        <option <%if (Category.equalsIgnoreCase("OBC-Creamy Layer")){%>selected<%}%>>OBC-Creamy Layer</option>
                        <option <%if (Category.equalsIgnoreCase("SC/ST")){%>selected<%}%>>SC/ST</option>
                    </select>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-uppercase" for="Handicapped">Handicapped</label>
                    <select class="form-control" id="Handicapped" name="Handicapped" required>
                        <option <%if (Handicapped.equalsIgnoreCase("")){%>selected<%}%>></option>
                        <option <%if (Handicapped.equalsIgnoreCase("Applicable")){%>selected<%}%>>Applicable</option>
                        <option <%if (Handicapped.equalsIgnoreCase("Not Applicable")){%>selected<%}%>>Not Applicable</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-uppercase" for="DateOfBirth">Date Of Birth</label>
                    <input type="text" class="form-control" id="DateOfBirth" name="DateOfBirth" placeholder="dd-mm-yyyy" value="<%out.println(DateOfBirth);%>">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="text-uppercase" for="Nationality">Nationality</label>
                    <select class="form-control" id="Nationality" name="Nationality" required>
                        <%
                            for (int i = 0; i < 198; i++) {
                                %><option <%if (Nationality.equalsIgnoreCase(countryList[i])){%>selected<%}%>><%out.println(countryList[i]);%></option> <%
                            }
                        %>
                    </select>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="text-uppercase" for="Name_Father">Name Of Father</label>
            <input id="Name_Father" name="NameOfFather" class="form-control" placeholder="" value="<%out.println(NameOfFather);%>">
        </div>
        <div class="form-group">
            <label class="text-uppercase" for="Name_Mother">Name of Mother</label>
            <input id="Name_Mother" name="NameOfMother" class="form-control" placeholder="" value="<%out.println(NameOfMother);%>" >
        </div>
        <div class="form-group">
            <label class="text-uppercase" for="ID">Identity Proof</label>
            <div class="row">
                <div class="col-sm-6">
                    <select class="form-control" name="IdentityProofType" id="ID-type" placeholder="ID Type">
                        <option <%if (idType.equalsIgnoreCase("")){%>selected<%}%>></option>
                        <option <%if (idType.equalsIgnoreCase("Aadhar Number")){%>selected<%}%>>Aadhar Number</option>
                        <option <%if (idType.equalsIgnoreCase("Pan Card")){%>selected<%}%>>Pan Card</option>
                    </select>
                </div>
                <div class="col-sm-6">
                    <input id="ID" class="form-control" name="IdentityProofNumber" placeholder="ID number" required value="<%out.println(idNumber);%>">
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="text-uppercase" for="Correspondence_Address">Correspondence Address</label>
            <input id="Correspondence_Address" name="CorrespondenceAddress" class="form-control" placeholder="" required value="<%out.println(CorrespondenceAddress);%>">
        </div>
        <div class="form-group form-check">
            <input type="checkbox" class="form-check-input" id="filladdress" onclick="fillAddress()">
            <label class="form-check-label" for="filladdress" onclick="fillAddress()">Correspondence address same as permanent address</label>
        </div>
        <div class="form-group">
            <label class="text-uppercase" for="Permanent_Address">Permanent Address</label>
            <input id="Permanent_Address" name="PermanentAddress" class="form-control" placeholder="" required value="<%out.println(PermanentAddress);%>">
        </div>
        <div class="form-group">
            <label class="text-uppercase" for="Phone">Phone Number</label>
            <input id="Phone" class="form-control" placeholder="" required value="<%out.println(phone);%>">
        </div>
        <div class="form-group">
            <label class="text-uppercase" for="PlaceOfApplying">Port/Place of Applying Form</label>
            <input id="PlaceOfApplying" name="PlaceOfApplying" class="form-control" placeholder="" required value="<%out.println(PlaceOfApplying);%>">
        </div>
        <div class="form-actions" style="margin: 0;background-color: transparent;text-align: center;">
            <button class="btn btn-lg btn-danger m-1" id="reset" type="reset">Reset</button>
        <button class="btn btn-lg btn-primary m-1" name="submitPersonalInfo1" type="submit">Save and Continue</button>
        </div>
        <%
                if (request.getParameter("submitPersonalInfo1")!= null)
                {
                    Specialization = request.getParameter("Specialization");
                    Marital_Status = request.getParameter("Marital_Status");
                    Gender = request.getParameter("Gender");
                    Domicile =request.getParameter("Domicile");
                    Category = request.getParameter("Category");
                    Handicapped = request.getParameter("Handicapped");
                    DateOfBirth = request.getParameter("DateOfBirth");
                    Nationality = request.getParameter("Nationality");
                    NameOfFather = request.getParameter("NameOfFather");
                    NameOfMother = request.getParameter("NameOfMother");
                    idType = request.getParameter("IdentityProofType");
                    idNumber = request.getParameter("IdentityProofNumber");
                    CorrespondenceAddress = request.getParameter("CorrespondenceAddress");
                    PermanentAddress = request.getParameter("PermanentAddress");
                    PlaceOfApplying = request.getParameter("PlaceOfApplying");
                    connection = DriverManager.getConnection((String)session.getAttribute("DatabaseHost"),(String)session.getAttribute("DatabaseUser"),(String)session.getAttribute("DatabasePassword"));
                    stmt = connection.createStatement();
                    ResultSet resultSet = stmt.executeQuery("SELECT * FROM Personal_Information WHERE ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"'");
                    int i=0;
                    if (resultSet.next())
                    {
                        stmt.executeUpdate("UPDATE Personal_Information SET Specialization = '"+Specialization+
                                "', MaritalStatus = '"+Marital_Status+
                                "', Gender = '"+Gender+
                                "', Domicile = '"+Domicile+
                                "', Category = '"+Category+
                                "', PhysicallyHandicapped = '"+Handicapped+
                                "', DateOfBirth = '"+DateOfBirth+
                                "', Nationality = '"+Nationality+
                                "', NameOfFather = '"+NameOfFather+
                                "', NameOfMother = '"+NameOfMother+
                                "', IdentityProofType = '"+idType+
                                "', IdentityProofNumber = '"+idNumber+
                                "', CorrespondenceAddress = '"+CorrespondenceAddress+
                                "', PermanentAddress = '"+PermanentAddress+
                                "', PlaceOfApplying = '"+PlaceOfApplying+
                                "' WHERE ApplicationNumber='"+session.getAttribute("ApplicationNumber")+"'");
                    }else {
                        i = stmt.executeUpdate("INSERT INTO Personal_Information(ApplicationNumber,Specialization," +
                                "MaritalStatus,Gender," +
                                "Domicile,Category,PhysicallyHandicapped," +
                                "DateOfBirth,Nationality,NameOfFather,NameOfMother," +
                                "IdentityProofType,IdentityProofNumber,CorrespondenceAddress,PermanentAddress,PlaceOfApplying)" +
                                "VALUES ('" + session.getAttribute("ApplicationNumber") + "','" + Specialization + "','" + Marital_Status +
                                "','" + Gender + "','" + Domicile + "','" + Category +
                                "','" + Handicapped + "','" + DateOfBirth + "','" + Nationality +
                                "','" + NameOfFather + "','" + NameOfMother +
                                "','" + idType + "','" + idNumber + "','" + CorrespondenceAddress + "','" + PermanentAddress +
                                "','" + PlaceOfApplying + "')");
                    }
                    connection.close();
                    if (i>0)
                    {
        %><div class="text-center alert-success">Record Inserted</div> <%
                    }
                    else if (i<=0){
        %><div class="text-center alert-danger">Record not Inserted</div> <%
                        }
                }

            stmt.close();
            }
            catch (Exception e){%><div class="alert-warning text-center"><% out.print(e);%></div> <%}
            finally {

            }
        %>
    </form>
</div></body>
</html>