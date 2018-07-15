<%--
  Created by IntelliJ IDEA.
  User: ADITYA
  Date: 29 Jun 2018
  Time: 12:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        body {
            background-color: #f5f5f5;
        }

    </style>
</head>
<body>
<nav>
    <div class="nav nav-tabs" style="padding-top: 1%" id="nav-tab" role="tablist">
        <a class="nav-item nav-link active" id="nav-InternationalJournal-tab" data-toggle="tab" href="#nav-InternationalJournal" role="tab" aria-controls="nav-InternationalJournal" aria-selected="true">Internaltional Journal</a>
        <a class="nav-item nav-link" id="nav-NationalJournal-tab" data-toggle="tab" href="#nav-NationalJournal" role="tab" aria-controls="nav-NationalJournal" aria-selected="false">National Journal</a>
        <a class="nav-item nav-link" id="nav-InternationalConference-tab" data-toggle="tab" href="#nav-InternationalConference" role="tab" aria-controls="nav-InternationalConference" aria-selected="false">International Conference</a>
        <a class="nav-item nav-link" id="nav-NationalConference-tab" data-toggle="tab" href="#nav-NationalConference" role="tab" aria-controls="nav-NationalConference" aria-selected="false">National Conference</a>
        <a class="nav-item nav-link" id="nav-BooksChapter-tab" data-toggle="tab" href="#nav-BooksChapter" role="tab" aria-controls="nav-BooksChapter" aria-selected="false">Books/Book Chapters</a>
    </div>
</nav>
<div class="tab-content" id="nav-tabContent">
    <div class="tab-pane fade show active" id="nav-InternationalJournal" role="tabpanel" aria-labelledby="nav-InternationalJournal-tab"><%@include file="Publications/InternationalJournal.jsp"%></div>
    <div class="tab-pane fade" id="nav-NationalJournal" role="tabpanel" aria-labelledby="nav-NationalJournal-tab"><%@include file="Publications/NationalJournal.jsp"%></div>
    <div class="tab-pane fade" id="nav-InternationalConference" role="tabpanel" aria-labelledby="nav-InternationalConference-tab"><%@include file="Publications/InternationalConferences.jsp"%></div>
    <div class="tab-pane fade" id="nav-NationalConference" role="tabpanel" aria-labelledby="nav-NationalConference-tab"><%@include file="Publications/NationalConferences.jsp"%></div>
    <div class="tab-pane fade" id="nav-BooksChapter" role="tabpanel" aria-labelledby="nav-BooksChapter-tab"><%@include file="Publications/BooksChapters.jsp"%></div>
</div>
</body>
</html>