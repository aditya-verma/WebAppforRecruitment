<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("ApplicationNumber")==null||session.getAttribute("ApplicationNumber")=="")
    {
        response.sendRedirect("/WebAppforRecruitment/login/login.jsp");
    }

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="../css/datepicker.css" rel="stylesheet">
    <script src="../js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
        $(function() {
            $( "#InternationalJournal-Month" ).datepicker({
                format: "mm-yyyy",
                viewMode: "months",
                minViewMode: "months",
                pickerPosition: "bottom-left"});
        });
    </script>

</head>

<body>
<div class="container mt-2">
    <form id="InternationalJournal" method="post" action="">
        <div class="form-group text-uppercase">
            <label for="InternationalJournal-Author">Author(s)</label>
            <input class="form-control" name="InternationalJournal-Author" id="InternationalJournal-Author" required placeholder="Separate authors using ';' only">
        </div>
        <div class="form-group text-uppercase">
            <label for="InternationalJournal-PaperTitle">Paper Title</label>
            <input class="form-control" name="InternationalJournal-PaperTitle" id="InternationalJournal-PaperTitle" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="InternationalJournal-JournalName">Journal Name</label>
            <input class="form-control" name="InternationalJournal-JournalName" id="InternationalJournal-JournalName" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="InternationalJournal-Volume">Volume</label>
            <input class="form-control" name="InternationalJournal-Volume" id="InternationalJournal-Volume" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="InternationalJournal-Issue">Issue</label>
            <input class="form-control" name="InternationalJournal-Issue" id="InternationalJournal-Issue" required>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group text-uppercase">
                    <label for="InternationalJournal-Pages">Pages</label>
                    <input class="form-control" name="InternationalJournal-Pages" id="InternationalJournal-Pages" placeholder="start page - end page" required>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group text-uppercase">
                    <label for="InternationalJournal-Month">Month/Year</label>
                    <input class="form-control" pattern="[0-9-]+" name="InternationalJournal-Month" id="InternationalJournal-Month" placeholder="MM-YYYY" required>
                </div>
            </div>
        </div>
        <div class="form-group text-uppercase">
            <label for="InternationalJournal-Publisher">Publisher</label>
            <input class="form-control" name="InternationalJournal-Publisher" id="InternationalJournal-Publisher" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="InternationalJournal-ImpactFactor">Impact factor</label>
            <input class="form-control" name="InternationalJournal-ImpactFactor" id="InternationalJournal-ImpactFactor" required>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group text-uppercase">
                    <label for="InternationalJournal-SCI">Wheather SCI</label>
                    <div class="row" id="InternationalJournal-SCI">
                        <div class="col">
                            <input id="InternationalJournal-SCI_yes" name="InternationalJournal-SCI" value="Yes" type="radio">
                            <label for="InternationalJournal-SCI_yes" class="mr-3">Yes</label>
                            <input id="InternationalJournal-SCI_no" name="InternationalJournal-SCI" value="No" type="radio">
                            <label for="InternationalJournal-SCI_no">No</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group text-uppercase">
                    <label for="InternationalJournal-Scopus">Wheather Scopus</label>
                    <div class="row" id="InternationalJournal-Scopus">
                        <div class="col">
                            <input id="InternationalJournal-Scopus_yes" name="InternationalJournal-Scopus" value="Yes" type="radio">
                            <label for="InternationalJournal-Scopus_yes" class="mr-3">Yes</label>
                            <input id="InternationalJournal-Scopus_no" name="InternationalJournal-Scopus" value="No" type="radio">
                            <label for="InternationalJournal-Scopus_no">No</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group text-uppercase">
            <label for="InternationalJournal-Co-AuthorFromDept">Whether Co-authors are from same Department</label>
            <div class="row" id="InternationalJournal-Co-AuthorFromDept">
                <div class="col">
                    <input id="InternationalJournal-Co-AuthorFromDept_yes" name="InternationalJournal-Co-AuthorFromDept" value="Yes" type="radio">
                    <label for="InternationalJournal-Co-AuthorFromDept_yes" class="mr-3">Yes</label>
                    <input id="InternationalJournal-Co-AuthorFromDept_no" name="InternationalJournal-Co-AuthorFromDept" value="No" type="radio">
                    <label for="InternationalJournal-Co-AuthorFromDept_no">No</label>
                </div>
            </div>
        </div>
        <div class="form-action" style="margin: 0;background-color: transparent;text-align: center;">
            <button class="btn btn-primary" name="btn-IntJ" type="submit">Submit</button>
        </div>
        <%
            if (request.getParameter("btn-IntJ")!=null)
            {
                String IntJAuthor= request.getParameter("InternationalJournal-Author");
                String IntJPaperTitle= request.getParameter("InternationalJournal-PaperTitle");
                String IntJJournalName=request.getParameter("InternationalJournal-JournalName");
                String IntJVolume =request.getParameter("InternationalJournal-Volume");
                String IntJIssue=request.getParameter("InternationalJournal-Issue");
                String IntJPages=request.getParameter("InternationalJournal-Pages");
                String IntJMonthYear=request.getParameter("InternationalJournal-Month");
                String IntJPublisher=request.getParameter("InternationalJournal-Publisher");
                String IntJImpactFactor=request.getParameter("InternationalJournal-ImpactFactor");
                String IntJSCI=request.getParameter("InternationalJournal-SCI");
                String IntJScopus=request.getParameter("InternationalJournal-Scopus");
                String IntJCoAuthorFromDept=request.getParameter("InternationalJournal-Co-AuthorFromDept");
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection((String)session.getAttribute("DatabaseHost"),(String)session.getAttribute("DatabaseUser"),(String)session.getAttribute("DatabasePassword"));
                    Statement stmt = connection.createStatement();
                    int result = stmt.executeUpdate("INSERT INTO International_Journal (ApplicationNumber,Authors,PaperTitle,JournalName," +
                            "Volume,Issue,Pages,MonthYear,Publisher,ImpactFactor" +
                            ",SCI,Scopus,CoAuthorFromDept) VALUES ('" +
                            session.getAttribute("ApplicationNumber")+"','" +
                            IntJAuthor+"','" +
                            IntJPaperTitle+"','" +
                            IntJJournalName+"','"+IntJVolume+"','" +
                            IntJIssue+"','" +
                            IntJPages+"','" +
                            IntJMonthYear+"','" +
                            IntJPublisher+"','" +
                            IntJImpactFactor+"','" +
                            IntJSCI+"','" +
                            IntJScopus+"','" +
                            IntJCoAuthorFromDept+"')");
                    connection.close();
                    stmt.close();
                    if (result>0){
                        %><div class="alert-success">Record Inserted</div> <%
                    }
                    else
                    {
                        %><div class="alert-warning">Record not inserted</div> <%
                    }
                }
                catch (Exception e){
                    %><div class="alert-danger"><%out.print(e);%></div> <%
                }
            }
        %>
    </form>
</div>
</body>
</html>