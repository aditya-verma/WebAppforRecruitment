<%--
  Created by IntelliJ IDEA.
  User: ADITYA
  Date: 29 Jun 2018
  Time: 12:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("ApplicationNumber")=="" || session.getAttribute("ApplicationNumber")==null)
    {
        response.sendRedirect("/WebAppforRecruitment/login/login.jsp");
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

    <script>
        $(function() {
            $('#next1').click(function(e){
                e.preventDefault();
                $('#mytabs a[href="#nav-EducationalInformationPhd"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('Educational InformationPhd');
            })
        });
        $(function() {
            $('#next2').click(function(e){
                e.preventDefault();
                $('#mytabs a[href="#nav-EducationalInformation"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('Educational Information');
            })
        });
        $(function() {
            $('#next3').click(function(e){
                e.preventDefault();
                $('#mytabs a[href="#nav-OtherAcademicQualication"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('Other Academic Information');
            })
        });
        $(function() {
            $('#next4').click(function(e){
                e.preventDefault();
                $('#mytabs a[href="#nav-PresentEmployer"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('Present Employer');
            })
        });
        $(function() {
            $('#next5').click(function(e){
                e.preventDefault();
                $('#mytabs a[href="#nav-TeachingExperience"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('Teaching Experience');
            })
        });
        $(function() {
            $('#next6').click(function(e){
                e.preventDefault();
                $('#mytabs a[href="#nav-ResearchExperience"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('Research Experience');
            })
        });
        $(function() {
            $('#next7').click(function(e){
                e.preventDefault();
                $('#mytabs a[href="#nav-IndustrialExperience"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('Industrial Experience');
            })
        });
        $(function() {
            $('#next8').click(function(e){
                e.preventDefault();
                $('#mytabs a[href="#nav-References"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('References');
            })
        });
        $(function() {
            $('#next9').click(function(e){
                e.preventDefault();
                $('#mytabs a[href="#nav-AnyOtherInfo"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('AnyOtherInfo');
            })
        });
        $(function() {
            $('#back2').click(function(e){
                e.preventDefault();
                $('#mytabs a[href="#nav-PersonalInformation"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('Personal Information');
            })
        });
        $(function() {
            $('#back3').click(function(e){
                e.preventDefault();
                $('#mytabs a[href="#nav-EducationalInformationPhd"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('Educational Information Phd');
            })
        });
        $(function() {
            $('#back4').click(function(e){
                e.preventDefault();
                $('#mytabs a[href="#nav-EducationalInformation"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('Educational Information');
            })
        });
        $(function() {
            $('#back5').click(function(e){
                e.preventDefault();
                $('#mytabs a[href="#nav-OtherAcademicQualication"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('Other Academic Information');
            })
        });
        $(function() {
            $('#back6').click(function(e){
                e.preventDefault();
                $('#mytabs a[href="#nav-PresentEmployer"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('Present Employer');
            })
        });
        $(function() {
            $('#back7').click(function(e){
                e.preventDefault();
                $('#mytabs a[href="#nav-TeachingExperience"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('Teaching Experience');
            })
        });
        $(function() {
            $('#back8').click(function(e){
                e.preventDefault();
                $('#mytabs a[href="#nav-ResearchExperience"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('Research Experience');
            })
        });
        $(function() {
            $('#back9').click(function(e){
                e.preventDefault();
                $('#mytabs a[href="#nav-IndustrialExperience"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('Industrial Experience');
            })
        });
        $(function() {
            $('#back10').click(function(e){
                e.preventDefault();
                $('#mytabs a[href="#nav-References"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('References');
            })
        });
    </script>

        <style>
            body {
                background-color: #f5f5f5;
            }

        </style>
    <script>
        $(function() {
            var activeBreadcrumb = $('.active-breadcrumb');

            $('#mytabs').on('click', '.nav-link', function () {
                var self = $(this);
                activeBreadcrumb.attr('href', self.data('url'));
                activeBreadcrumb.text(self.text());
            });
        });
    </script>

</head>
<body>
<nav aria-label="breadcrumb" class="sticky-top">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="../login/User Page.jsp">User Page</a></li>
        <li class="breadcrumb-item">Update Information</li>
        <li class="breadcrumb-item">Personal Information</li>
        <li class="breadcrumb-item active-breadcrumb" aria-current="page">Personal Information</li>
    </ol>
</nav>

    <ul class="nav nav-tabs" style="padding-top: 1%;" id="mytabs" role="tablist">
        <li><a class="nav-item nav-link active" id="nav-PersonalInformation-tab" data-toggle="tab" href="#nav-PersonalInformation" role="tab" aria-controls="nav-PersonalInformation" aria-selected="true">Personal Information</a></li>
        <li><a class="nav-item nav-link" id="nav-EducationalInformationPhd-tab" data-toggle="tab" href="#nav-EducationalInformationPhd" role="tab" aria-controls="nav-EducationalInformationPhd" aria-selected="false">Educational Information(Ph.D)</a></li>
        <li><a class="nav-item nav-link" id="nav-EducationalInformation-tab" data-toggle="tab" href="#nav-EducationalInformation" role="tab" aria-controls="nav-EducationalInformation" aria-selected="false">Educational Information</a></li>
        <li><a class="nav-item nav-link" id="nav-OtherAcademicQualication-tab" data-toggle="tab" href="#nav-OtherAcademicQualication" role="tab" aria-controls="nav-OtherAcademicQualication" aria-selected="false">Other Academic Information</a></li>
        <li><a class="nav-item nav-link" id="nav-PresentEmployer-tab" data-toggle="tab" href="#nav-PresentEmployer" role="tab" aria-controls="nav-PresentEmployer" aria-selected="false">Present Employer</a></li>
        <li><a class="nav-item nav-link" id="nav-TeachingExperience-tab" data-toggle="tab" href="#nav-TeachingExperience" role="tab" aria-controls="nav-TeachingExperience" aria-selected="false">Teaching Experience</a></li>
        <li><a class="nav-item nav-link" id="nav-ResearchExperience-tab" data-toggle="tab" href="#nav-ResearchExperience" role="tab" aria-controls="nav-ResearchExperience" aria-selected="false">Research Experience/Post Doctoral Work</a></li>
        <li><a class="nav-item nav-link" id="nav-IndustrialExperience-tab" data-toggle="tab" href="#nav-IndustrialExperience" role="tab" aria-controls="nav-IndustrialExperience" aria-selected="false">Industrial Experience</a></li>
        <li><a class="nav-item nav-link" id="nav-References-tab" data-toggle="tab" href="#nav-References" role="tab" aria-controls="nav-References" aria-selected="false">References</a></li>
        <li><a class="nav-item nav-link" id="nav-AnyOtherInfo-tab" data-toggle="tab" href="#nav-AnyOtherInfo" role="tab" aria-controls="nav-AnyOtherInfo" aria-selected="false">Any Other Information</a></li>
    </ul>

<div class="tab-content" id="nav-tabContent">
    <div class="tab-pane fade show active" id="nav-PersonalInformation" role="tabpanel" aria-labelledby="nav-PersonalInformation-tab">
        <%@include file="/WebAppforRecruitment/SignUp/1.jsp"%>
        <button type="button" class="btn btn-outline-success" style="float: right" id="next1">next</button>
    </div>
    <div class="tab-pane fade" id="nav-EducationalInformationPhd" role="tabpanel" aria-labelledby="nav-EducationalInformationPhd-tab">
        <%@include file="/WebAppforRecruitment/SignUp/2.jsp"%>
        <button type="button" class="btn btn-outline-danger" id="back2">previous</button>
        <button type="button" class="btn btn-outline-success" style="float: right" id="next2">next</button>
    </div>
    <div class="tab-pane fade" id="nav-EducationalInformation" role="tabpanel" aria-labelledby="nav-EducationalInformation-tab">
        <%@include file="/WebAppforRecruitment/SignUp/3.jsp"%>
        <button type="button" class="btn btn-outline-danger" id="back3">previous</button>
        <button type="button" class="btn btn-outline-success" style="float: right" id="next3">next</button>
    </div>
    <div class="tab-pane fade" id="nav-OtherAcademicQualication" role="tabpanel" aria-labelledby="nav-OtherAcademicQualication-tab">
        <%@include file="/WebAppforRecruitment/SignUp/4.jsp"%>
        <button type="button" class="btn btn-outline-danger" id="back4">previous</button>
        <button type="button" class="btn btn-outline-success" style="float: right" id="next4">next</button>
    </div>
    <div class="tab-pane fade" id="nav-PresentEmployer" role="tabpanel" aria-labelledby="nav-PresentEmployer-tab">
        <%@include file="/WebAppforRecruitment/SignUp/5.jsp"%>
        <button type="button" class="btn btn-outline-danger" id="back5">previous</button>
        <button type="button" class="btn btn-outline-success" style="float: right" id="next5">next</button>
    </div>
    <div class="tab-pane fade" id="nav-TeachingExperience" role="tabpanel" aria-labelledby="nav-TeachingExperience-tab">
        <%@include file="/WebAppforRecruitment/SignUp/6.jsp"%>
        <button type="button" class="btn btn-outline-danger" id="back6">previous</button>
        <button type="button" class="btn btn-outline-success" style="float: right" id="next6">next</button>
    </div>
    <div class="tab-pane fade" id="nav-ResearchExperience" role="tabpanel" aria-labelledby="nav-ResearchExperience-tab">
        <%@include file="/WebAppforRecruitment/SignUp/7.jsp"%>
        <button type="button" class="btn btn-outline-danger" id="back7">previous</button>
        <button type="button" class="btn btn-outline-success"  style="float: right" id="next7">next</button>
    </div>
    <div class="tab-pane fade" id="nav-IndustrialExperience" role="tabpanel" aria-labelledby="nav-IndustrialExperience-tab">
        <%@include file="/WebAppforRecruitment/SignUp/8.jsp"%>
        <button type="button" class="btn btn-outline-danger" id="back8">previous</button>
        <button type="button" class="btn btn-outline-success" style="float: right" id="next8">next</button>
    </div>
    <div class="tab-pane fade" id="nav-References" role="tabpanel" aria-labelledby="nav-References-tab">
        <%@include file="/WebAppforRecruitment/SignUp/9.jsp"%>
        <button type="button" class="btn btn-outline-danger" id="back9">previous</button>
        <button type="button" class="btn btn-outline-success" style="float: right" id="next9">next</button>
    </div>
    <div class="tab-pane fade" id="nav-AnyOtherInfo" role="tabpanel" aria-labelledby="nav-AnyOtherInfo-tab">
        <%@include file="/WebAppforRecruitment/SignUp/10.jsp"%>
        <button type="button" class="btn btn-outline-danger" id="back10">previous</button>
    </div>
</div>
</body>
</html>
