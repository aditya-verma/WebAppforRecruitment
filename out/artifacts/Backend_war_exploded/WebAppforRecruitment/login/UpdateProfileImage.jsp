<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%--
  Created by IntelliJ IDEA.
  User: ADITYA
  Date: 02 Jul 2018
  Time: 12:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Profile Image</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link href="../css/floating-labels.css" rel="stylesheet">
    <script src="../jquery/3.3.1/jquery.min.js"></script>
    <script src="../jquery/popper.js/1.14.3/popper.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <%
        if (session.getAttribute("ApplicationNumber")==null || session.getAttribute("ApplicationNumber")=="")
        {
            session.invalidate();
            response.sendRedirect("/WebAppforRecruitment/login/login.jsp");
        }
    %>
    <style>
        /* layout.css Style */

        .image-preview-input {
            position: relative;
            overflow: hidden;
            margin: 0px;
            color: #333;
            background-color: #fff;
            border-color: #ccc;
        }
        .image-preview-input input[type=file] {
            position: absolute;
            right: 0;
            margin: 0;
            padding: 0;
            font-size: 20px;
            cursor: pointer;
            opacity: 0;
            filter: alpha(opacity=0);
        }
        .image-preview-input-title {
            margin-left:2px;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function(){
            $('input[type="file"]').change(function(e){
                var fileName = e.target.files[0].name;
                $("#previewName").val(fileName);
            });
        });
        $(document).ready(function() {
            var holder = document.getElementById('drop-zone');
            holder.ondragover = function () { this.className = ''; return false; };
            holder.ondrop = function (e) {
                e.preventDefault();
                var file = e.dataTransfer.files[0];
                var reader = new FileReader();
                reader.onload = function (event) {
                }
                reader.readAsDataURL(file);
            };
        });

    </script>
</head>
<body>
<header>
    <nav class="navbar sticky-top navbar-light bg-light" style="border-bottom-color: #000">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">
                    <img class="img-fluid float-left d-sm-none d-md-block" src="../Images/form-background.png"
                         style="margin-left: 5rem;max-width: 7%; height: auto">
                    <img class="img-fluid " src="../Images/mnnit%20name.png"
                         style="margin-left: 3rem;max-width: 80%;height: auto">
                </a>
            </div>
        </div>
    </nav>
    <div class="jumbotron" >
        <div class="container">
            <h1>Recruitment Portal</h1>
            <div class="bg-dark rounded p-2">
                <h3 class="text-primary text-uppercase" style="color: #FFF;">Update Profile Image</h3>
            </div>
        </div>
    </div>
</header>

<div class="container mb-5"> <br />
    <div class="row">
        <form class="col-md-12" action = "upload.jsp" method = "post" enctype = "multipart/form-data">
            <div class="panel panel-default">
                <div class="panel-heading"><strong>Upload Image</strong></div>
                <br>
                <div class="panel-body">
                    <div class="input-group image-preview">
                        <input placeholder="" type="text" id="previewName" class="form-control image-preview-filename mr-1" disabled="disabled">
                        <span class="input-group-btn">
                            <!-- image-preview-input -->
						<div class="btn btn-default image-preview-input">
                            <span class="glyphicon glyphicon-folder-open"></span>
                            <span class="image-preview-input-title">Browse</span>
							<input type="file" name="uploadImg"/>
						</div>
						<button type="submit" class="btn btn-labeled btn-primary" name="uploadImg">
                            <span class="btn-label">
                                <i class="glyphicon glyphicon-upload"></i> Upload
                            </span>
                        </button>
						</span>
                    </div>
                    <!-- /input-group image-preview [TO HERE]-->

                </div>
            </div>
        </form>
    </div>
</div>

<div class="card-footer align-bottom fixed-bottom mt-5" style="background-color: #c4c4c4">
    <div class="container text-muted text-center rounded">This is footer</div>
</div>
</body>
</html>
