<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="../css/datepicker.css" rel="stylesheet">
    <script src="../js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
        $(function() {
            $( "#BookChapter-Month" ).datepicker({
                format: "mm-yyyy",
                viewMode: "months",
                minViewMode: "months",
                pickerPosition: "bottom-left"});
        });
    </script>
</head>
<body>
<div class="container">
    <form id="BooksChapter">
        <div class="form-group text-uppercase">
            <label for="BookChapter-Author">Author(s)</label>
            <input class="form-control" id="BookChapter-Author"  name="BookChapter-Author" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="BookChapter-Book">Book</label>
            <input class="form-control" id="BookChapter-Book" name="BookChapter-Book">
        </div>
        <div class="form-group text-uppercase">
            <label for="BookChapter-BookChapter">Book Chapter</label>
            <input class="form-control" id="BookChapter-BookChapter" name="BookChapter-BookChapter">
        </div>
        <div class="form-group text-uppercase">
            <label for="BookChapter-Publisher">Publisher</label>
            <input class="form-control" id="BookChapter-Publisher" name="BookChapter-Publisher" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="BookChapter-ISBN">ISBN</label>
            <input class="form-control" id="BookChapter-ISBN" name="BookChapter-ISBN" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="BookChapter-Month">Published On</label>

            <input class="form-control" pattern="[0-9-]+" id="BookChapter-Month"  name="BookChapter-Month" placeholder="MM-YYYY" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="BookChapter-Co-AuthorFromDept">Wheather Co-authors are faculty from same Department</label>
            <div class="row" id="BookChapter-Co-AuthorFromDept">
                <div class="col">
                    <input id="BookChapter-Co-AuthorFromDept_yes" name="BookChapter-Co-AuthorFromDept" value="Yes" type="radio">
                    <label for="BookChapter-Co-AuthorFromDept_yes" class="mr-3">Yes</label>
                    <input id="BookChapter-Co-AuthorFromDept_no" name="BookChapter-Co-AuthorFromDept" value="No" type="radio">
                    <label for="BookChapter-Co-AuthorFromDept_no">No</label>
                </div>
            </div>
        </div>
        <div class="form-action" style="margin: 0;background-color: transparent;text-align: center;">
            <button class="btn btn-primary" name="btn-Books/BookChapters" type="submit">Submit</button>
        </div>
        <%
            try {
                if (request.getParameter("btn-Books/BookChapters") != null)
                {
                    String BookChapterAuthor = request.getParameter("BookChapter-Author");
                    String BookChapterBook = request.getParameter("BookChapter-Book");
                    String BookChapterBookChapter = request.getParameter("BookChapter-BookChapter");
                    String BookChapterPublisher = request.getParameter("BookChapter-Publisher");
                    String BookChapterISBN = request.getParameter("BookChapter-ISBN");
                    String BookChapterMonthYear = request.getParameter("BookChapter-Month");
                    String IntConCoAuthorFromDept = request.getParameter("InternationalConferences-Co-AuthorFromDept");
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection((String)session.getAttribute("DatabaseHost"),(String)session.getAttribute("DatabaseUser"),(String)session.getAttribute("DatabasePassword"));
                    Statement stmt = connection.createStatement();
                    int i = stmt.executeUpdate("INSERT INTO Books_BookChapters(ApplicationNumber,Authors,Book,BookChapters,Publisher,ISBN,MonthYear,CoAuthorFromDept) VALUES ('" +
                            session.getAttribute("ApplicationNumber")+"','" +
                            BookChapterAuthor+"','" +
                            BookChapterBook+"','" +
                            BookChapterBookChapter+"','" +
                            BookChapterPublisher+"','" +
                            BookChapterISBN+"','" +
                            BookChapterMonthYear+"','" +
                            IntConCoAuthorFromDept+"')");
                    if (i>0){
                        %><div class="alert-success">Record Inserted</div> <%
                    }
                    else{
                        %><div class="alert-warning">Record not inserted</div> <%
                    }
                }
            }
            catch (Exception e){
                %><div class="alert-danger"><%out.print(e);%></div> <%
            }
        %>
    </form>
</div>
</body>
</html>


