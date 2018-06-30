<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
<form id="BooksChapter">
    <div class="form-group text-uppercase">
        <label for="BookChapter-Author">Author(s)</label>
        <input class="form-control" id="BookChapter-Author" required>
    </div>
    <div class="form-group text-uppercase">
        <label for="BookChapter-Book">Book</label>
        <input class="form-control" id="BookChapter-Book" required>
    </div>
    <div class="form-group text-uppercase">
        <label for="BookChapter-BookChapter">Book Chapter</label>
        <input class="form-control" id="BookChapter-BookChapter" required>
    </div>
    <div class="form-group text-uppercase">
        <label for="BookChapter-Publisher">publisher</label>
        <input class="form-control" id="BookChapter-Publisher" required>
    </div>
    <div class="form-group text-uppercase">
        <label for="BookChapter-ISBN">ISBN</label>
        <input class="form-control" id="BookChapter-ISBN" required>
    </div>
    <div class="form-group text-uppercase">
        <label for="BookChapter-Co-AuthorFromDept">Wheather Co-authors are faculty from same Department</label>
        <div class="row" id="BookChapter-Co-AuthorFromDept">
            <div class="col">
                <input id="BookChapter-Co-AuthorFromDept_yes" name="inlineRadioOptions" type="radio">
                <label for="BookChapter-Co-AuthorFromDept_yes" class="mr-3">Yes</label>
                <input id="BookChapter-Co-AuthorFromDept_no" name="inlineRadioOptions" type="radio">
                <label for="BookChapter-Co-AuthorFromDept_no">No</label>
            </div>
        </div>
    </div>
    <div class="form-group text-uppercase">
        <label for="BookChapter-Month/Year">Published On</label>
        <input class="form-control" id="BookChapter-Month/Year" placeholder="MM/YYYY" required>
    </div>
    <button class="btn btn-primary" type="submit">Submit</button>
</form>
</body>
</html>