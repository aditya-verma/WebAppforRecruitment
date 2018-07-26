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
            $('#pubnext1').click(function(e){
                e.preventDefault();
                $('#mypubtabs a[href="#nav-NationalJournal"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('National Journal');
            });

        });
        $(function() {
            $('#pubnext2').click(function(e){
                e.preventDefault();
                $('#mypubtabs a[href="#nav-InternationalConference"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('International Conference');
            })
        });
        $(function() {
            $('#pubnext3').click(function(e){
                e.preventDefault();
                $('#mypubtabs a[href="#nav-NationalConference"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('National Conference');
            })
        });
        $(function() {
            $('#pubnext4').click(function(e){
                e.preventDefault();
                $('#mypubtabs a[href="#nav-BooksChapter"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('Books Chapter');
            })
        });
        $(function() {
            $('#pubback2').click(function(e){
                e.preventDefault();
                $('#mypubtabs a[href="#nav-InternationalJournal"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('International Journal');
            })
        });
        $(function() {
            $('#pubback3').click(function(e){
                e.preventDefault();
                $('#mypubtabs a[href="#nav-NationalJournal"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('National Journal');
            })
        });
        $(function() {
            $('#pubback4').click(function(e){
                e.preventDefault();
                $('#mypubtabs a[href="#nav-InternationalConference"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('International Conference');
            })
        });
        $(function() {
            $('#pubback5').click(function(e){
                e.preventDefault();
                $('#mypubtabs a[href="#nav-NationalConference"]').tab('show');
                var activeBreadcrumb = $('.active-breadcrumb');
                activeBreadcrumb.text('National Conference');
            })
        });
    </script>
    <script>
        $(function() {
            var activeBreadcrumb = $('.active-breadcrumb');
            $('#mypubtabs').on('click', '.nav-link', function () {
                var self = $(this);
                activeBreadcrumb.attr('href', self.data('url'));
                activeBreadcrumb.text(self.text());
            });
        });
    </script>


</head>
<body>
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="../login/User Page.jsp">User Page</a></li>
        <li class="breadcrumb-item">Update information</li>
        <li class="breadcrumb-item">Publications</li>
        <li class="breadcrumb-item active-breadcrumb" aria-current="page">International Journal</li>
    </ol>
</nav>
<nav>
    <ul class="nav nav-tabs"  style="padding-top: 1%" id="mypubtabs" role="tablist">
        <li><a class="nav-item nav-link active" id="nav-InternationalJournal-tab" data-toggle="tab" href="#nav-InternationalJournal" role="tab" aria-controls="nav-InternationalJournal" aria-selected="true">Internaltional Journal</a></li>
        <li><a class="nav-item nav-link" id="nav-NationalJournal-tab" data-toggle="tab" href="#nav-NationalJournal" role="tab" aria-controls="nav-NationalJournal" aria-selected="false">National Journal</a></li>
        <li><a class="nav-item nav-link" id="nav-InternationalConference-tab" data-toggle="tab" href="#nav-InternationalConference" role="tab" aria-controls="nav-InternationalConference" aria-selected="false">International Conference</a></li>
        <li><a class="nav-item nav-link" id="nav-NationalConference-tab" data-toggle="tab" href="#nav-NationalConference" role="tab" aria-controls="nav-NationalConference" aria-selected="false">National Conference</a></li>
        <li><a class="nav-item nav-link" id="nav-BooksChapter-tab" data-toggle="tab" href="#nav-BooksChapter" role="tab" aria-controls="nav-BooksChapter" aria-selected="false">Books/Book Chapters</a></li>
    </ul>
</nav>

<div class="tab-content" id="nav-pubtabContent">
    <div class="tab-pane fade show active" id="nav-InternationalJournal" role="tabpanel" aria-labelledby="nav-InternationalJournal-tab">
        <%@include file="Publications/InternationalJournal.jsp"%>
        <button type="button" class="btn btn-outline-success" style="float: right" id="pubnext1">next</button>
    </div>
    <div class="tab-pane fade" id="nav-NationalJournal" role="tabpanel" aria-labelledby="nav-NationalJournal-tab">
        <%@include file="Publications/NationalJournal.jsp"%>
        <button type="button" class="btn btn-outline-danger" id="pubback2">previous</button>
        <button type="button" class="btn btn-outline-success" style="float: right" id="pubnext2">next</button>
    </div>
    <div class="tab-pane fade" id="nav-InternationalConference" role="tabpanel" aria-labelledby="nav-InternationalConference-tab">
        <%@include file="Publications/InternationalConferences.jsp"%>
        <button type="button" class="btn btn-outline-danger" id="pubback3">previous</button>
        <button type="button" class="btn btn-outline-success" style="float: right" id="pubnext3">next</button>
    </div>
    <div class="tab-pane fade" id="nav-NationalConference" role="tabpanel" aria-labelledby="nav-NationalConference-tab">
        <%@include file="Publications/NationalConferences.jsp"%>
        <button type="button" class="btn btn-outline-danger" id="pubback4">previous</button>
        <button type="button" class="btn btn-outline-success" style="float: right" id="pubnext4">next</button>
    </div>
    <div class="tab-pane fade" id="nav-BooksChapter" role="tabpanel" aria-labelledby="nav-BooksChapter-tab">
        <%@include file="Publications/BooksChapters.jsp"%>
        <button type="button" class="btn btn-outline-danger" id="pubback5">previous</button>
    </div>
</div>
</body>
</html>