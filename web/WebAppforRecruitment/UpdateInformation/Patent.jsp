<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Information</title>
    <%
        if (session.getAttribute("ApplicationNumber")==null || session.getAttribute("ApplicationNumber")=="")
        {
            RequestDispatcher dd = request.getRequestDispatcher("/WebAppforRecruitment/login/login.jsp");
            dd.forward(request, response);
        }
    %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/datepicker.css">
    <script src="../jquery/3.3.1/jquery.min.js"></script>
    <script src="../jquery/popper.js/1.14.3/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap-datepicker.js"></script>
</head>
<body>
<header>
    <nav class="navbar sticky-top navbar-light bg-light" style="border-bottom-color: #000">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">
                    <img class="img-fluid float-left" src="../Images/form-background.png"
                         style="margin-left: 5rem;max-width: 7%; height: auto">
                    <img class="img-fluid " src="../Images/mnnit%20name.png"
                         style="margin-left: 3rem;max-width: 80%;height: auto">
                </a>
            </div>
        </div>
    </nav>
    <div class="jumbotron" style="height: 10%">
        <div class="container">
            <h1>Recruitment Portal</h1>
            <div class="bg-dark rounded">
                <h3 style="color: #FFF;padding: 1%;">Update Information</h3>
            </div>
        </div>
    </div>
</header>

<div class="container align-middle align-content-center align-items-center">
    <div class="row">
        <div class="col-sm-4">
            <div class="list-group" id="list-tab" role="tablist">
                <a class="list-group-item list-group-item-action " id="list-PersonalInformation-list" href="PersonalInformation.jsp" role="tab" >Personal Information</a>
                <a class="list-group-item list-group-item-action " id="list-Publication-list" href="Publications.jsp" role="tab" >Publications</a>
                <a class="list-group-item list-group-item-action active" id="list-Patent-list" href="Patent.jsp" role="tab" >Patent</a>
                <a class="list-group-item list-group-item-action " id="list-PhDSupervision-list" href="PhDSupervision.jsp" role="tab" >Ph.D Supervision</a>
                <a class="list-group-item list-group-item-action " id="list-PGSupervision-list"  href="PG Supervision.jsp" role="tab">PG Supervision</a>
                <a class="list-group-item list-group-item-action " id="list-BTechProjectGuided-list"  href="BTechProjectSupervised.jsp" role="tab" >B.Tech Project Guided</a>
                <a class="list-group-item list-group-item-action " id="list-ActedAsReviewer-list"  href="ActedAsReviewer.jsp" role="tab" >Acted As A Reviewer</a>
                <a class="list-group-item list-group-item-action " id="list-ExpertInvitedLecture-list"  href="InvitedLecturesDelivered.jsp" role="tab" >Expert/Invited Lectures Delivered</a>
                <a class="list-group-item list-group-item-action " id="list-ResearchProjectInvestigated-list"  href="ResearchProjectsInvestigated.jsp" role="tab" >Research Project Investigated</a>
                <a class="list-group-item list-group-item-action " id="list-AwardsHonourReceived-list"  href="AwardsHonourReceived.jsp" role="tab" >Award/Honour Received</a>
                <a class="list-group-item list-group-item-action " id="list-EventAttended-list"  href="EventAttended.jsp" role="tab" >Event Attended</a>
                <a class="list-group-item list-group-item-action " id="list-ExpertLectureOrganized-list"  href="ExpertLectureOrganized.jsp" role="tab" >Expert Lecture Organized</a>
                <a class="list-group-item list-group-item-action " id="list-ConsultancyProvided-list" href="ConsultancyProvided.jsp" role="tab" >Consultancy Provided</a>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="tab-content" id="nav-tabContent">
                <!--------------Personal Information-------------->
                <div class="tab-pane fade" id="list-PersonalInfo" role="tabpanel" aria-labelledby="list-PersonalInfo-list">
                </div>
                <!--------------Publication-------------->
                <div class="tab-pane fade " id="list-Publication" role="tabpanel" aria-labelledby="list-Publication-list">
                    <%--@include file="/WebAppforRecruitment/Forms/Publications.jsp"--%>
                </div>
                <!--------------Patent-------------->
                <div class="tab-pane fade show active" id="list-Patent" role="tabpanel" aria-labelledby="list-Patent-list">
                    <nav aria-label="breadcrumb" class="sticky-top">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="../login/User Page.jsp">User Page</a></li>
                            <li class="breadcrumb-item">Update Information</li>
                            <li class="breadcrumb-item">Patent</li>
                        </ol>
                    </nav>
                    <%@include file="/WebAppforRecruitment/Forms/Patent.jsp"%>
                </div>
                <!--------------PhDSupervision-------------->
                <div class="tab-pane fade" id="list-PhDSupervision" role="tabpanel" aria-labelledby="list-PhDSupervision-list">
                    <%--@include file="/WebAppforRecruitment/Forms/PhDSupervision.jsp"--%>
                </div>
                <!--------------PGSupervision-------------->
                <div class="tab-pane fade" id="list-PGSupervision" role="tabpanel" aria-labelledby="list-PGSupervision-list">
                    <%--@include file="/WebAppforRecruitment/Forms/PG Supervision.jsp"--%>
                </div>
                <!--------------Btech Project guided-------------->
                <div class="tab-pane fade" id="list-BTechProjectGuided" role="tabpanel" aria-labelledby="list-BTechProjectGuided-list">
                    <%--@include file="/WebAppforRecruitment/Forms/BTechProjectSupervised.jsp"--%>
                </div>
                <!--------------Acted As Reviewer-------------->
                <div class="tab-pane fade" id="list-ActedAsReviewer" role="tabpanel" aria-labelledby="list-ActedAsReviewer-list">
                    <%--@include file="/WebAppforRecruitment/Forms/ActedAsReviewer.jsp"--%>
                </div>
                <!--------------ExpertInvited Lecture-------------->
                <div class="tab-pane fade" id="list-ExpertInvitedLecture" role="tabpanel" aria-labelledby="list-ExpertInvitedLecture-list">
                    <%--@include file="/WebAppforRecruitment/Forms/Invited_Lecture_Delivered.jsp"--%>
                </div>
                <!--------------Research Project Investigated-------------->
                <div class="tab-pane fade" id="list-ResearchProjectInvestigated" role="tabpanel" aria-labelledby="list-ResearchProjectInvestigated-list">
                    <%--@include file="/WebAppforRecruitment/Forms/ResearchProjectsInvestigated.jsp"--%>
                </div>
                <!--------------Awards Honour Received-------------->
                <div class="tab-pane fade" id="list-AwardsHonourReceived" role="tabpanel" aria-labelledby="list-AwardsHonourReceived-list">
                    <!--%@include file="/WebAppforRecruitment/Forms/AwardHonourReceived.jsp"%-->
                </div>
                <!--------------Event Attended-------------->
                <div class="tab-pane fade" id="list-EventAttended" role="tabpanel" aria-labelledby="list-EventAttended-list">
                    <%--@include file="/WebAppforRecruitment/Forms/Event_Attended.jsp"--%>
                </div>
                <!--------------Expert Lecture Organized-------------->
                <div class="tab-pane fade" id="list-ExpertLectureOrganized" role="tabpanel" aria-labelledby="list-ExpertLectureOrganized-list">
                    Expert Lecture Organized
                </div>
                <!--------------Consultancy Provided-------------->
                <div class="tab-pane fade" id="list-ConsultancyProvided" role="tabpanel" aria-labelledby="list-ConsultancyProvided-list">
                    Consultancy Provided
                </div>
            </div>
        </div>
    </div>
</div>

<div class="card-footer align-bottom mt-2" style="background-color: #c4c4c4">
    <div class="container text-muted text-center rounded">This is footer</div>
</div>

</body>
</html>