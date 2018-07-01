<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
<div class="container">
    <form id="NationalConferences">
        <div class="form-group text-uppercase">
            <label for="NationalConferences-Author">Author(s)</label>
            <input class="form-control" id="NationalConferences-Author" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalConferences-PaperTitle">Paper Title</label>
            <input class="form-control" id="NationalConferences-PaperTitle" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalConferences-ConferenceName">Confrence Name</label>
            <input class="form-control" id="NationalConferences-ConferenceName" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalConferences-HeldAt">Held At</label>
            <input class="form-control" id="NationalConferences-HeldAt" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalConferences-Publisher">publisher</label>
            <input class="form-control" id="NationalConferences-Publisher" required>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group text-uppercase">
                    <label for="NationalConferences-Pages">Pages</label>
                    <input class="form-control" id="NationalConferences-Pages" placeholder="start page - end page" required>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group text-uppercase">
                    <label for="NationalConferences-Month/Year">Month/Year</label>
                    <input class="form-control" id="NationalConferences-Month/Year" placeholder="MM/YYYY" required>
                </div>
            </div>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalConferences-Co-authorFromDept">Wheather Co-authors are faculty from same Department</label>
            <div class="row" id="NationalConferences-Co-authorFromDept">
                <div class="col">
                    <input id="NationalConferences-Co-authorFromDept_yes" name="inlineRadioOptions" type="radio">
                    <label for="NationalConferences-Co-authorFromDept_yes" class="mr-3">Yes</label>
                    <input id="NationalConferences-Co-authorFromDept_no" name="inlineRadioOptions" type="radio">
                    <label for="NationalConferences-Co-authorFromDept_no">No</label>
                </div>
            </div>
        </div>
        <button class="btn btn-primary" type="submit">Submit</button>
    </form>
</div>
</body>
</html>