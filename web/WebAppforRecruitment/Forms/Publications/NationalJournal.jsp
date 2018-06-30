<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
<div class="container">
    <form id="NationalJournal">
        <div class="form-group text-uppercase">
            <label for="NationalJournal-Author">Author(s)</label>
            <input class="form-control" id="NationalJournal-Author" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalJournal-PaperTitle">Paper Title</label>
            <input class="form-control" id="NationalJournal-PaperTitle" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalJournal-JournalName">Journal Name</label>
            <input class="form-control" id="NationalJournal-JournalName" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalJournal-Volume">Volume</label>
            <input class="form-control" id="NationalJournal-Volume" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalJournal-Issue">Issue</label>
            <input class="form-control" id="NationalJournal-Issue" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalJournal-Pages">Pages</label>
            <input class="form-control" id="NationalJournal-Pages" placeholder="start page - end page" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalJournal-Month/Year">Month/Year</label>
            <input class="form-control" id="NationalJournal-Month/Year" placeholder="MM/YYYY" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalJournal-Publisher">publisher</label>
            <input class="form-control" id="NationalJournal-Publisher" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalJournal-ImpactFactor">Impact factor</label>
            <input class="form-control" id="NationalJournal-ImpactFactor" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalJournal-SCI">Wheather SCI</label>
            <div class="row" id="NationalJournal-SCI">
                <div class="col">
                    <input id="NationalJournal-SCI_yes" name="inlineRadioOptions" type="radio">
                    <label for="NationalJournal-SCI_yes" class="mr-3">Yes</label>
                    <input id="NationalJournal-SCI_no" name="inlineRadioOptions" type="radio">
                    <label for="NationalJournal-SCI_no">No</label>
                </div>
            </div>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalJournal-Scopus">Wheather Scopus</label>
            <div class="row" id="NationalJournal-Scopus">
                <div class="col">
                    <input id="NationalJournal-Scopus_yes" name="inlineRadioOptions" type="radio">
                    <label for="NationalJournal-Scopus_yes" class="mr-3">Yes</label>
                    <input id="NationalJournal-Scopus_no" name="inlineRadioOptions" type="radio">
                    <label for="NationalJournal-Scopus_no">No</label>
                </div>
            </div>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalJournal-Co-AuthorFromDept">Wheather Co-authors are faculty from same Department</label>
            <div class="row" id="NationalJournal-Co-AuthorFromDept">
                <div class="col">
                    <input id="NationalJournal-Co-AuthorFromDept_yes" name="inlineRadioOptions" type="radio">
                    <label for="NationalJournal-Co-AuthorFromDept_yes" class="mr-3">Yes</label>
                    <input id="NationalJournal-Co-AuthorFromDept_no" name="inlineRadioOptions" type="radio">
                    <label for="NationalJournal-Co-AuthorFromDept_no">No</label>
                </div>
            </div>
        </div>
        <button class="btn btn-primary" type="submit">Submit</button>
    </form>
</div>
</body>
</html>