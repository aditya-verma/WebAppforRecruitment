<%--
Created by IntelliJ IDEA.
User: ADITYA
Date: 27 Jun 2018
Time: 01:18 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Information</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../jquery/3.3.1/jquery.min.js"></script>
    <script src="../jquery/popper.js/1.14.3/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
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
                <h3 class="text-primary" style="color: #FFF;padding: 1%;">Update Information</h3>
            </div>
        </div>
    </div>
</header>
<div class="container align-middle align-content-center align-items-center">
    <div class="row">
        <div class="col-sm-4">
<<<<<<< HEAD:out/artifacts/Backend_war_exploded/WebAppforRecruitment/login/Update Information.jsp
            <ul class="list-group nav nav-tabs" id="mytabs" role="tablist">
                <li><a class="list-group-item list-group-item-action active" id="list-PersonalInfo-list" data-toggle="tab" href="#list-PersonalInfo" role="tab" aria-controls="Personal Information">Personal Information</a></li>
                <li><a class="list-group-item list-group-item-action " id="list-Publication-list" data-toggle="tab" href="#list-Publication" role="tab" aria-controls="Publication">Publications</a></li>
                <li><a class="list-group-item list-group-item-action " id="list-Patent-list" data-toggle="tab" href="#list-Patent" role="tab" aria-controls="Patent">Patent</a></li>
                <li><a class="list-group-item list-group-item-action " id="list-PhDSupervision-list" data-toggle="tab" href="#list-PhDSupervision" role="tab" aria-controls="PhD Supervision">Ph.D Supervision</a></li>
                <li><a class="list-group-item list-group-item-action " id="list-PGSupervision-list" data-toggle="tab" href="#list-PGSupervision" role="tab" aria-controls="PG Supervision">PG Supervision</a></li>
                <li><a class="list-group-item list-group-item-action " id="list-BTechProjectGuided-list" data-toggle="tab" href="#list-BTechProjectGuided" role="tab" aria-controls="BTech Project">B.Tech Project Guided</a></li>
                <li><a class="list-group-item list-group-item-action " id="list-ActedAsReviewer-list" data-toggle="tab" href="#list-ActedAsReviewer" role="tab" aria-controls="Reviewer">Acted As A Reviewer</a></li>
                <li><a class="list-group-item list-group-item-action " id="list-ExpertInvitedLecture-list" data-toggle="tab" href="#list-ExpertInvitedLecture" role="tab" aria-controls="Invited Lecture">Expert/Invited Lecture Delivered</a></li>
                <li><a class="list-group-item list-group-item-action " id="list-ResearchProjectInvestigated-list" data-toggle="tab" href="#list-ResearchProjectInvestigated" role="tab" aria-controls="Research Project Guided">Research Project Investigated</a></li>
                <li><a class="list-group-item list-group-item-action " id="list-AwardsHonourReceived-list" data-toggle="tab" href="#list-AwardsHonourReceived" role="tab" aria-controls="Awards and Honour">Award/Honour Received</a></li>
                <li><a class="list-group-item list-group-item-action " id="list-EventAttended-list" data-toggle="tab" href="#list-EventAttended" role="tab" aria-controls="Events Attended">Event Attended</a></li>
                <li><a class="list-group-item list-group-item-action " id="list-ExpertLectureOrganized-list" data-toggle="tab" href="#list-ExpertLectureOrganized" role="tab" aria-controls="Expert Lecture Organized">Expert Lecture Organized</a></li>
                <li><a class="list-group-item list-group-item-action " id="list-ConsultancyProvided-list" data-toggle="tab" href="#list-ConsultancyProvided" role="tab" aria-controls="Consultancy Provided">Consultancy Provided</a></li>
            </ul>
=======
            <div class="list-group" id="list-tab" role="tablist">
                <a class="list-group-item list-group-item-action active" id="list-PersonalInformation-list" href="PersonalInformation.jsp" role="tab" >Personal Information</a>
                <a class="list-group-item list-group-item-action " id="list-Publication-list" href="Publications.jsp" role="tab" >Publications</a>
                <a class="list-group-item list-group-item-action " id="list-Patent-list" href="Patent.jsp" role="tab" >Patent</a>
                <a class="list-group-item list-group-item-action " id="list-PhDSupervision-list" href="PhDSupervision.jsp" role="tab" >Ph.D Supervision</a>
                <a class="list-group-item list-group-item-action " id="list-PGSupervision-list"  href="PG Supervision.jsp" role="tab">PG Supervision</a>
                <a class="list-group-item list-group-item-action " id="list-BTechProjectGuided-list"  href="BTechProjectSupervised.jsp" role="tab" >B.Tech Project Guided</a>
                <a class="list-group-item list-group-item-action " id="list-ActedAsReviewer-list"  href="ActedAsReviewer.jsp" role="tab" >Acted As A Reviewer</a>
                <a class="list-group-item list-group-item-action " id="list-ExpertInvitedLecture-list"  href="ExpertInvitedLecture.jsp" role="tab" >Expert/Invited Lecture Delivered</a>
                <a class="list-group-item list-group-item-action " id="list-ResearchProjectInvestigated-list"  href="ResearchProjectInvestigated.jsp" role="tab" >Research Project Investigated</a>
                <a class="list-group-item list-group-item-action " id="list-AwardsHonourReceived-list"  href="AwardsHonourReceived.jsp" role="tab" >Award/Honour Received</a>
                <a class="list-group-item list-group-item-action " id="list-EventAttended-list"  href="EventAttended.jsp" role="tab" >Event Attended</a>
                <a class="list-group-item list-group-item-action " id="list-ExpertLectureOrganized-list"  href="ExpertLectureOrganized.jsp" role="tab" >Expert Lecture Organized</a>
                <a class="list-group-item list-group-item-action " id="list-ConsultancyProvided-list" href="ConsultancyProvided.jsp" role="tab" >Consultancy Provided</a>
            </div>
>>>>>>> dbddf2806fcac0da694eb587135006d9482738af:out/artifacts/Backend_war_exploded/WebAppforRecruitment/UpdateInformation/PersonalInformation.jsp
        </div>
        <div class="col-sm-8">
            <div class="tab-content" id="nav-tabContent">
                <!--------------Personal Information-------------->
<<<<<<< HEAD:out/artifacts/Backend_war_exploded/WebAppforRecruitment/login/Update Information.jsp
                <div class="tab-pane fade active in cont" id="list-PersonalInfo" role="tabpanel" aria-labelledby="list-PersonalInfo-list">
                    <button type="button" id="change1" class="btn btn-primary ">Continue</button>
                </div>
                <!--------------Publication-------------->
                <div class="tab-pane fade cont" id="list-Publication" role="tabpanel" aria-labelledby="list-Publication-list">
                    <%@include file="/WebAppforRecruitment/Forms/Publications.jsp"%>
                    <button type="button" id="change2" class="btn btn-primary ">Continue</button>
                </div>
                <!--------------Patent-------------->
                <div class="tab-pane fade cont" id="list-Patent" role="tabpanel" aria-labelledby="list-Patent-list">
                    <%@include file="/WebAppforRecruitment/Forms/Patent.jsp"%>
                    <button type="button" id="change3" class="btn btn-primary ">Continue</button>

                </div>
                <!--------------PhDSupervision-------------->
                <div class="tab-pane fade cont" id="list-PhDSupervision" role="tabpanel" aria-labelledby="list-PhDSupervision-list">
                    <%--@include file="/WebAppforRecruitment/Forms/Ph.D Supervision.jsp"--%>
                        <button type="button" id="change4" class="btn btn-primary ">Continue</button>
=======
                <div class="tab-pane fade show active" id="list-PersonalInfo" role="tabpanel" aria-labelledby="list-PersonalInfo-list">
                    <%@include file="/WebAppforRecruitment/Forms/PersonalInformation.jsp"%>
                </div>
                <!--------------Publication-------------->
                <div class="tab-pane fade" id="list-Publication" role="tabpanel" aria-labelledby="list-Publication-list">
                    <%--@include file="/WebAppforRecruitment/Forms/Publications.jsp"--%>
                </div>
                <!--------------Patent-------------->
                <div class="tab-pane fade" id="list-Patent" role="tabpanel" aria-labelledby="list-Patent-list">
                    <%--@include file="/WebAppforRecruitment/Forms/Patent.jsp"--%>
                </div>
                <!--------------PhDSupervision-------------->
                <div class="tab-pane fade" id="list-PhDSupervision" role="tabpanel" aria-labelledby="list-PhDSupervision-list">
                    <%--@include file="/WebAppforRecruitment/Forms/PhDSupervision.jsp"--%>
>>>>>>> dbddf2806fcac0da694eb587135006d9482738af:out/artifacts/Backend_war_exploded/WebAppforRecruitment/UpdateInformation/PersonalInformation.jsp
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
<<<<<<< HEAD:out/artifacts/Backend_war_exploded/WebAppforRecruitment/login/Update Information.jsp
                <div class="tab-pane fade cont" id="list-ActedAsReviewer" role="tabpanel" aria-labelledby="list-ActedAsReviewer-list">
                    <%@ include file="/WebAppforRecruitment/Forms/Acted_As_Reviewer.jsp" %>
                    <button type="button" id="change7" class="btn btn-primary ">Continue</button>
=======
                <div class="tab-pane fade" id="list-ActedAsReviewer" role="tabpanel" aria-labelledby="list-ActedAsReviewer-list">
                    <%--@include file="/WebAppforRecruitment/Forms/ActedAsReviewer.jsp"--%>
>>>>>>> dbddf2806fcac0da694eb587135006d9482738af:out/artifacts/Backend_war_exploded/WebAppforRecruitment/UpdateInformation/PersonalInformation.jsp
                </div>
                <!--------------ExpertInvited Lecture-------------->
                <div class="tab-pane fade" id="list-ExpertInvitedLecture" role="tabpanel" aria-labelledby="list-ExpertInvitedLecture-list">
                    <%--@include file="/WebAppforRecruitment/Forms/Invited_Lecture_Delivered.jsp"--%>
                </div>
                <!--------------Research Project Investigated-------------->
<<<<<<< HEAD:out/artifacts/Backend_war_exploded/WebAppforRecruitment/login/Update Information.jsp
                <div class="tab-pane fade cont" id="list-ResearchProjectInvestigated" role="tabpanel" aria-labelledby="list-ResearchProjectInvestigated-list">
                    <%--@ include file="/WebAppforRecruitment/Forms/Research_Project_Investigated.jsp"--%>
                        <button type="button" id="change9" class="btn btn-primary ">Continue</button>
                </div>
                <!--------------Awards Honour Received-------------->
                <div class="tab-pane fade cont" id="list-AwardsHonourReceived" role="tabpanel" aria-labelledby="list-AwardsHonourReceived-list">
                    <%--@include file="/WebAppforRecruitment/Forms/Award_Honour_Received.jsp"--%>
                        <button type="button" id="change10" class="btn btn-primary ">Continue</button>
=======
                <div class="tab-pane fade" id="list-ResearchProjectInvestigated" role="tabpanel" aria-labelledby="list-ResearchProjectInvestigated-list">
                    <%--@include file="/WebAppforRecruitment/Forms/ResearchProjectInvestigated.jsp"--%>
                </div>
                <!--------------Awards Honour Received-------------->
                <div class="tab-pane fade" id="list-AwardsHonourReceived" role="tabpanel" aria-labelledby="list-AwardsHonourReceived-list">
                    <%--@include file="/WebAppforRecruitment/Forms/AwardHonourReceived.jsp"--%>
>>>>>>> dbddf2806fcac0da694eb587135006d9482738af:out/artifacts/Backend_war_exploded/WebAppforRecruitment/UpdateInformation/PersonalInformation.jsp
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