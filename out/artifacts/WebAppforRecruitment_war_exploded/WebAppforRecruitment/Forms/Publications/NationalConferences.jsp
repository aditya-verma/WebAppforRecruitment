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
            <input class="form-control" id="NationalConferences-Author" name="NationalConferences-Author" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalConferences-PaperTitle">Paper Title</label>
            <input class="form-control" id="NationalConferences-PaperTitle" name="NationalConferences-PaperTitle" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalConferences-ConferenceName">Confrence Name</label>
            <input class="form-control" id="NationalConferences-ConferenceName" name="NationalConferences-ConferenceName" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalConferences-HeldAt">Held At</label>
            <input class="form-control" id="NationalConferences-HeldAt" name="NationalConferences-HeldAt" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalConferences-Publisher">Publisher</label>
            <input class="form-control" id="NationalConferences-Publisher" name="NationalConferences-Publisher" required>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group text-uppercase">
                    <label for="NationalConferences-Pages">Pages</label>
                    <input class="form-control" id="NationalConferences-Pages" name="NationalConferences-Pages" placeholder="start page - end page" required>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group text-uppercase">
                    <label for="NationalConferences-Month/Year">Month/Year</label>
                    <input class="form-control" id="NationalConferences-Month/Year" name="NationalConferences-Month/Year" placeholder="MM/YYYY" required>
                </div>
            </div>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalConferences-Co-authorFromDept">Wheather Co-authors are faculty from same Department</label>
            <div class="row" id="NationalConferences-Co-authorFromDept">
                <div class="col">
                    <input id="NationalConferences-Co-authorFromDept_yes" name="NationalConferences-Co-authorFromDept" value="Yes" type="radio">
                    <label for="NationalConferences-Co-authorFromDept_yes" class="mr-3">Yes</label>
                    <input id="NationalConferences-Co-authorFromDept_no" name="NationalConferences-Co-authorFromDept" value="No" type="radio">
                    <label for="NationalConferences-Co-authorFromDept_no">No</label>
                </div>
            </div>
        </div>
        <div class="form-action" style="margin: 0;background-color: transparent;text-align: center;">
            <button class="btn btn-primary" name="btn-NationalConference" type="submit">Submit</button>
        </div>
        <%
            try {
                if (request.getParameter("btn-NationalConference") != null)
                {
                    String NtConAuthor = request.getParameter("NationalConferences-Author");
                    String NtConPaperTitle = request.getParameter("NationalConferences-PaperTitle");
                    String NtConConferenceName = request.getParameter("NationalConferences-ConferenceName");
                    String NtConPaperHeldAt = request.getParameter("NationalConferences-HeldAt");
                    String NtConPublisher = request.getParameter("NationalConferences-Publisher");
                    String NtConPages = request.getParameter("NationalConferences-Pages");
                    String NtConMonthYear = request.getParameter("NationalConferences-Month/Year");
                    String NtConCoAuthorFromDept = request.getParameter("NationalConferences-Co-AuthorFromDept");
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12245685","sql12245685","fpStvI5rK8");
                    Statement stmt = connection.createStatement();
                    int i = stmt.executeUpdate("INSERT INTO National_Conference(ApplicationNumber,Authors,PaperTitle,ConferenceName,HeldAt,Publisher,Pages,MonthYear,CoAuthorFromDept) VALUES ('" +
                            session.getAttribute("ApplicationNumber")+"','" +
                            NtConAuthor+"','" +
                            NtConPaperTitle+"','" +
                            NtConConferenceName+"','" +
                            NtConPaperHeldAt+"','" +
                            NtConPublisher+"','" +
                            NtConPages+"','" +
                            NtConMonthYear+"','" +
                            NtConCoAuthorFromDept+"')");
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