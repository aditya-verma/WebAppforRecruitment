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
    <script>
        $(function() {
            $('#next1').click(function(e){
                e.preventDefault();
                $('#mypubtabs a[href="#nav-NationalJournal"]').tab('show');
            })
        });
        $(function() {
            $('#next2').click(function(e){
                e.preventDefault();
                $('#mypubtabs a[href="#nav-InternationalConference"]').tab('show');
            })
        });
        $(function() {
            $('#next3').click(function(e){
                e.preventDefault();
                $('#mypubtabs a[href="#nav-NationalConference"]').tab('show');
            })
        });
        $(function() {
            $('#next4').click(function(e){
                e.preventDefault();
                $('#mypubtabs a[href="#nav-BooksChapter"]').tab('show');
            })
        });
        $(function() {
            $('#back2').click(function(e){
                e.preventDefault();
                $('#mypubtabs a[href="#nav-InternationalJournal"]').tab('show');
            })
        });
        $(function() {
            $('#back3').click(function(e){
                e.preventDefault();
                $('#mypubtabs a[href="#nav-NationalJournal"]').tab('show');
            })
        });
        $(function() {
            $('#back4').click(function(e){
                e.preventDefault();
                $('#mypubtabs a[href="#nav-InternationalConference"]').tab('show');
            })
        });
        $(function() {
            $('#back5').click(function(e){
                e.preventDefault();
                $('#mypubtabs a[href="#nav-NationalConference"]').tab('show');
            })
        });
    </script>
</head>
<body>
<nav>
    <ul class="nav nav-tabs" style="padding-top: 1%" id="mypubtabs" role="tablist">
        <li><a class="nav-item nav-link active" id="nav-InternationalJournal-tab" data-toggle="tab" href="#nav-InternationalJournal" role="tab" aria-controls="nav-InternationalJournal" aria-selected="true">Internaltional Journal</a></li>
        <li><a class="nav-item nav-link" id="nav-NationalJournal-tab" data-toggle="tab" href="#nav-NationalJournal" role="tab" aria-controls="nav-NationalJournal" aria-selected="false">National Journal</a></li>
        <li><a class="nav-item nav-link" id="nav-InternationalConference-tab" data-toggle="tab" href="#nav-InternationalConference" role="tab" aria-controls="nav-InternationalConference" aria-selected="false">International Conference</a></li>
        <li><a class="nav-item nav-link" id="nav-NationalConference-tab" data-toggle="tab" href="#nav-NationalConference" role="tab" aria-controls="nav-NationalConference" aria-selected="false">National Conference</a></li>
        <li><a class="nav-item nav-link" id="nav-BooksChapter-tab" data-toggle="tab" href="#nav-BooksChapter" role="tab" aria-controls="nav-BooksChapter" aria-selected="false">Books/Book Chapters</a></li>
    </ul>
</nav>
<div class="tab-content" id="nav-tabContent">
    <div class="tab-pane fade show active" id="nav-InternationalJournal" role="tabpanel" aria-labelledby="nav-InternationalJournal-tab">
        <%@include file="Publications/InternationalJournal.jsp"%>
        <button type="button" class="btn btn-outline-success" style="float: right" id="next1">next</button>
    </div>
    <div class="tab-pane fade" id="nav-NationalJournal" role="tabpanel" aria-labelledby="nav-NationalJournal-tab">
        <%@include file="Publications/NationalJournal.jsp"%>
        <button type="button" class="btn btn-outline-danger" id="back2">previous</button>
        <button type="button" class="btn btn-outline-success" style="float: right" id="next2">next</button>
    </div>
    <div class="tab-pane fade" id="nav-InternationalConference" role="tabpanel" aria-labelledby="nav-InternationalConference-tab">
        <%@include file="Publications/InternationalConferences.jsp"%>
        <button type="button" class="btn btn-outline-danger" id="back3">previous</button>
        <button type="button" class="btn btn-outline-success" style="float: right" id="next3">next</button>
    </div>
    <div class="tab-pane fade" id="nav-NationalConference" role="tabpanel" aria-labelledby="nav-NationalConference-tab">
        <%@include file="Publications/NationalConferences.jsp"%>
        <button type="button" class="btn btn-outline-danger" id="back4">previous</button>
        <button type="button" class="btn btn-outline-success" style="float: right" id="next4">next</button>
    </div>
    <div class="tab-pane fade" id="nav-BooksChapter" role="tabpanel" aria-labelledby="nav-BooksChapter-tab">
        <%@include file="Publications/BooksChapters.jsp"%>
        <button type="button" class="btn btn-outline-danger" id="back5">previous</button>
    </div>
</div>
</body>
</html>