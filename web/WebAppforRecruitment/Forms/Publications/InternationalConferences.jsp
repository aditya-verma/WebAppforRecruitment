<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
<div class="container">
    <form id="InternationalConferences">
        <div class="form-group text-uppercase">
            <label for="InternationalConferences-Author">Author(s)</label>
            <input class="form-control" id="InternationalConferences-Author" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="InternationalConferences-PaperTitle">Paper Title</label>
            <input class="form-control" id="InternationalConferences-PaperTitle" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="InternationalConferences-ConferenceName">Confrence Name</label>
            <input class="form-control" id="InternationalConferences-ConferenceName" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="InternationalConferences-HeldAt">Held At</label>
            <input class="form-control" id="InternationalConferences-HeldAt" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="InternationalConferences-Publisher">publisher</label>
            <input class="form-control" id="InternationalConferences-Publisher" required>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group text-uppercase">
                    <label for="InternationalConferences-Pages">Pages</label>
                    <input class="form-control" id="InternationalConferences-Pages" placeholder="start page - end page" required>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group text-uppercase">
                    <label for="InternationalConferences-Month/Year">Month/Year</label>
                    <input class="form-control" id="InternationalConferences-Month/Year" placeholder="MM/YYYY" required>
                </div>
            </div>
        </div>
        <div class="form-group text-uppercase">
            <label for="InternationalConferences-Co-AuthorFromDept">Wheather Co-authors are faculty from same Department</label>
            <div class="row" id="InternationalConferences-Co-AuthorFromDept">
                <div class="col">
                    <input id="InternationalConferences-Co-AuthorFromDept_yes" name="inlineRadioOptions" type="radio">
                    <label for="InternationalConferences-Co-AuthorFromDept_yes" class="mr-3">Yes</label>
                    <input id="InternationalConferences-Co-AuthorFromDept_no" name="inlineRadioOptions" type="radio">
                    <label for="InternationalConferences-Co-AuthorFromDept_no">No</label>
                </div>
            </div>
        </div>
        <button class="btn btn-primary" type="submit">Submit</button>
    </form>
</div>
</body>
</html>