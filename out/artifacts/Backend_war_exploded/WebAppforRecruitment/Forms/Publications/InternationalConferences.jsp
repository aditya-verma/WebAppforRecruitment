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
            <input class="form-control" id="InternationalConferences-Author" name="InternationalConferences-Author" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="InternationalConferences-PaperTitle">Paper Title</label>
            <input class="form-control" id="InternationalConferences-PaperTitle" name="InternationalConferences-PaperTitle" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="InternationalConferences-ConferenceName">Confrence Name</label>
            <input class="form-control" id="InternationalConferences-ConferenceName" name="InternationalConferences-ConferenceName" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="InternationalConferences-HeldAt">Held At</label>
            <input class="form-control" id="InternationalConferences-HeldAt" name="InternationalConferences-HeldAt" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="InternationalConferences-Publisher">Publisher</label>
            <input class="form-control" id="InternationalConferences-Publisher" name="InternationalConferences-Publisher" required>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group text-uppercase">
                    <label for="InternationalConferences-Pages">Pages</label>
                    <input class="form-control" id="InternationalConferences-Pages" name="InternationalConferences-Pages" placeholder="start page - end page" required>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group text-uppercase">
                    <label for="InternationalConferences-Month/Year">Month/Year</label>
                    <input class="form-control" id="InternationalConferences-Month/Year" name="InternationalConferences-Month/Year" placeholder="MM/YYYY" required>
                </div>
            </div>
        </div>
        <div class="form-group text-uppercase">
            <label for="InternationalConferences-Co-AuthorFromDept">Wheather Co-authors are faculty from same Department</label>
            <div class="row" id="InternationalConferences-Co-AuthorFromDept">
                <div class="col">
                    <input id="InternationalConferences-Co-AuthorFromDept_yes" name="InternationalConferences-Co-AuthorFromDept" value="Yes" type="radio">
                    <label for="InternationalConferences-Co-AuthorFromDept_yes" class="mr-3">Yes</label>
                    <input id="InternationalConferences-Co-AuthorFromDept_no" name="InternationalConferences-Co-AuthorFromDept" value="No" type="radio">
                    <label for="InternationalConferences-Co-AuthorFromDept_no">No</label>
                </div>
            </div>
        </div>
        <div class="form-action" style="margin: 0;background-color: transparent;text-align: center;">
            <button class="btn btn-primary" name="btn-InternationalConference" type="submit">Submit</button>
        </div>
        <%
            try {
                if (request.getParameter("btn-InternationalConference") != null)
                {
                    String IntConAuthor = request.getParameter("InternationalConferences-Author");
                    String IntConPaperTitle = request.getParameter("InternationalConferences-PaperTitle");
                    String IntConConferenceName = request.getParameter("InternationalConferences-ConferenceName");
                    String IntConPaperHeldAt = request.getParameter("InternationalConferences-HeldAt");
                    String IntConPublisher = request.getParameter("InternationalConferences-Publisher");
                    String IntConPages = request.getParameter("InternationalConferences-Pages");
                    String IntConMonthYear = request.getParameter("InternationalConferences-Month/Year");
                    String IntConCoAuthorFromDept = request.getParameter("InternationalConferences-Co-AuthorFromDept");
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection((String)session.getAttribute("DatabaseHost"),(String)session.getAttribute("DatabaseUser"),(String)session.getAttribute("DatabasePassword"));
                    Statement stmt = connection.createStatement();
                    int i = stmt.executeUpdate("INSERT INTO International_Conference(ApplicationNumber,Authors,PaperTitle,ConferenceName,HeldAt,Publisher,Pages,MonthYear,CoAuthorFromDept) VALUES ('" +
                            session.getAttribute("ApplicationNumber")+"','" +
                            IntConAuthor+"','" +
                            IntConPaperTitle+"','" +
                            IntConConferenceName+"','" +
                            IntConPaperHeldAt+"','" +
                            IntConPublisher+"','" +
                            IntConPages+"','" +
                            IntConMonthYear+"','" +
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

