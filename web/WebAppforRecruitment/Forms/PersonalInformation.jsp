<%--
  Created by IntelliJ IDEA.
  User: ADITYA
  Date: 29 Jun 2018
  Time: 12:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ApplicationNumber = "";
    if (session.getAttribute("ApplicationNumber")==null || session.getAttribute("ApplicationNumber")==""){
        session.invalidate();
        response.sendRedirect("/WebAppforRecruitment/login/login.jsp");
    }
    else
    {
        ApplicationNumber = session.getAttribute("ApplicationNumber").toString();
    }
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Information</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/datepicker.css">
    <script src="../jquery/3.3.1/jquery.min.js"></script>
    <script src="../jquery/popper.js/1.14.3/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
<nav>
    <div class="nav nav-tabs" id="nav-tab" role="tablist">
        <a class="nav-item nav-link active" id="nav-PersonalInformation-tab" data-toggle="tab" href="#nav-PersonalInformation" role="tab" aria-controls="nav-PersonalInformation" aria-selected="true">Personal Information</a>
        <a class="nav-item nav-link" id="nav-EducationalInformationPhd-tab" data-toggle="tab" href="#nav-EducationalInformationPhd" role="tab" aria-controls="nav-EducationalInformationPhd" aria-selected="false">Educational Information(Ph.D)</a>
        <a class="nav-item nav-link" id="nav-EducationalInformation-tab" data-toggle="tab" href="#nav-EducationalInformation" role="tab" aria-controls="nav-EducationalInformation" aria-selected="false">Educational Information</a>
        <a class="nav-item nav-link" id="nav-OtherAcademicQualication-tab" data-toggle="tab" href="#nav-OtherAcademicQualication" role="tab" aria-controls="nav-OtherAcademicQualication" aria-selected="false">Other Acedamic Information</a>
        <a class="nav-item nav-link" id="nav-PresentEmployer-tab" data-toggle="tab" href="#nav-PresentEmployer" role="tab" aria-controls="nav-PresentEmployer" aria-selected="false">Present Employer</a>
        <a class="nav-item nav-link" id="nav-TeachingExperience-tab" data-toggle="tab" href="#nav-TeachingExperience" role="tab" aria-controls="nav-TeachingExperience" aria-selected="false">Teaching Experience</a>
        <a class="nav-item nav-link" id="nav-ResearchExperience-tab" data-toggle="tab" href="#nav-ResearchExperience" role="tab" aria-controls="nav-ResearchExperience" aria-selected="false">Research Experience/Post Doctoral Work</a>
        <a class="nav-item nav-link" id="nav-IndustrialExperience-tab" data-toggle="tab" href="#nav-IndustrialExperience" role="tab" aria-controls="nav-IndustrialExperience" aria-selected="false">Industrial Experience</a>
        <a class="nav-item nav-link" id="nav-References-tab" data-toggle="tab" href="#nav-References" role="tab" aria-controls="nav-References" aria-selected="false">References</a>
        <a class="nav-item nav-link" id="nav-AnyOtherInfo-tab" data-toggle="tab" href="#nav-AnyOtherInfo" role="tab" aria-controls="nav-AnyOtherInfo" aria-selected="false">Any Other Information</a>
    </div>
</nav>
<div class="tab-content" id="nav-tabContent">
    <div class="tab-pane fade show active" id="nav-PersonalInformation" role="tabpanel" aria-labelledby="nav-PersonalInformation-tab"><%@include file="/WebAppforRecruitment/SignUp/1.jsp"%></div>
    <div class="tab-pane fade" id="nav-EducationalInformationPhd" role="tabpanel" aria-labelledby="nav-EducationalInformationPhd-tab"><%@include file="/WebAppforRecruitment/SignUp/2.jsp"%></div>
    <div class="tab-pane fade" id="nav-EducationalInformation" role="tabpanel" aria-labelledby="nav-EducationalInformation-tab"><%@include file="/WebAppforRecruitment/SignUp/3.jsp"%></div>
    <div class="tab-pane fade" id="nav-OtherAcademicQualication" role="tabpanel" aria-labelledby="nav-OtherAcademicQualication-tab"><%@include file="/WebAppforRecruitment/SignUp/4.jsp"%></div>
    <div class="tab-pane fade" id="nav-PresentEmployer" role="tabpanel" aria-labelledby="nav-PresentEmployer-tab"><%@include file="/WebAppforRecruitment/SignUp/5.jsp"%></div>
    <div class="tab-pane fade" id="nav-TeachingExperience" role="tabpanel" aria-labelledby="nav-TeachingExperience-tab"><%@include file="/WebAppforRecruitment/SignUp/6.jsp"%></div>
    <div class="tab-pane fade" id="nav-ResearchExperience" role="tabpanel" aria-labelledby="nav-ResearchExperience-tab"><%@include file="/WebAppforRecruitment/SignUp/7.jsp"%></div>
    <div class="tab-pane fade" id="nav-IndustrialExperience" role="tabpanel" aria-labelledby="nav-IndustrialExperience-tab"><%@include file="/WebAppforRecruitment/SignUp/8.jsp"%></div>
    <div class="tab-pane fade" id="nav-References" role="tabpanel" aria-labelledby="nav-References-tab"><%@include file="/WebAppforRecruitment/SignUp/9.jsp"%></div>
    <div class="tab-pane fade" id="nav-AnyOtherInfo" role="tabpanel" aria-labelledby="nav-AnyOtherInfo-tab"><%@include file="/WebAppforRecruitment/SignUp/10.jsp"%></div>
</div>
</body>
</html>
