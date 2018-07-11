<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<body>
<div class="container">
    <form id="NationalJournal">
        <div class="form-group text-uppercase">
            <label for="NationalJournal-Author">Author(s)</label>
            <input class="form-control" id="NationalJournal-Author" name="NationalJournal-Author" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalJournal-PaperTitle">Paper Title</label>
            <input class="form-control" id="NationalJournal-PaperTitle" name="NationalJournal-PaperTitle" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalJournal-JournalName">Journal Name</label>
            <input class="form-control" id="NationalJournal-JournalName" name="NationalJournal-JournalName" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalJournal-Volume">Volume</label>
            <input class="form-control" id="NationalJournal-Volume" name="NationalJournal-Volume" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalJournal-Issue">Issue</label>
            <input class="form-control" id="NationalJournal-Issue" name="NationalJournal-Issue" required>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group text-uppercase">
                    <label for="NationalJournal-Pages">Pages</label>
                    <input class="form-control" id="NationalJournal-Pages" name="NationalJournal-Pages" placeholder="start page - end page" required>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group text-uppercase">
                    <label for="NationalJournal-Month/Year">Month/Year</label>
                    <input class="form-control" id="NationalJournal-Month/Year" name="NationalJournal-Month/Year" placeholder="MM/YYYY" required>
                </div>
            </div>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalJournal-Publisher">Publisher</label>
            <input class="form-control" id="NationalJournal-Publisher" name="NationalJournal-Publisher" required>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalJournal-ImpactFactor">Impact factor</label>
            <input class="form-control" id="NationalJournal-ImpactFactor" name="NationalJournal-ImpactFactor" required>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group text-uppercase">
                    <label for="NationalJournal-SCI">Wheather SCI</label>
                    <div class="row" id="NationalJournal-SCI">
                        <div class="col">
                            <input id="NationalJournal-SCI_yes" name="NationalJournal-SCI" value="Yes" type="radio">
                            <label for="NationalJournal-SCI_yes" class="mr-3">Yes</label>
                            <input id="NationalJournal-SCI_no" name="NationalJournal-SCI" value="No" type="radio">
                            <label for="NationalJournal-SCI_no">No</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group text-uppercase">
                    <label for="NationalJournal-Scopus">Wheather Scopus</label>
                    <div class="row" id="NationalJournal-Scopus">
                        <div class="col">
                            <input id="NationalJournal-Scopus_yes" name="NationalJournal-Scopus" value="Yes" type="radio">
                            <label for="NationalJournal-Scopus_yes" class="mr-3">Yes</label>
                            <input id="NationalJournal-Scopus_no" name="NationalJournal-Scopus" value="No" type="radio">
                            <label for="NationalJournal-Scopus_no">No</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group text-uppercase">
            <label for="NationalJournal-Co-AuthorFromDept">Wheather Co-authors are faculty from same Department</label>
            <div class="row" id="NationalJournal-Co-AuthorFromDept">
                <div class="col">
                    <input id="NationalJournal-Co-AuthorFromDept_yes" name="NationalJournal-Co-AuthorFromDept" value="Yes" type="radio">
                    <label for="NationalJournal-Co-AuthorFromDept_yes" class="mr-3">Yes</label>
                    <input id="NationalJournal-Co-AuthorFromDept_no" name="NationalJournal-Co-AuthorFromDept" value="No" type="radio">
                    <label for="NationalJournal-Co-AuthorFromDept_no">No</label>
                </div>
            </div>
        </div>
        <div class="form-action" style="margin: 0;background-color: transparent;text-align: center;">
            <button class="btn btn-primary" name="btn-NtJ" type="submit">Submit</button>
        </div>
        <%
            if (request.getParameter("btn-NtJ")!=null)
            {
                String NtJAuthor= request.getParameter("NationalJournal-Author");
                String NtJPaperTitle= request.getParameter("NationalJournal-PaperTitle");
                String NtJJournalName=request.getParameter("NnationalJournal-JournalName");
                String NtJVolume =request.getParameter("NationalJournal-Volume");
                String NtJIssue=request.getParameter("NationalJournal-Issue");
                String NtJPages=request.getParameter("NationalJournal-Pages");
                String NtJMonthYear=request.getParameter("InternationalJournal-Month/Year");
                String NtJPublisher=request.getParameter("NationalJournal-Publisher");
                String NtJImpactFactor=request.getParameter("NationalJournal-ImpactFactor");
                String NtJSCI=request.getParameter("NationalJournal-SCI");
                String NtJScopus=request.getParameter("NationalJournal-Scopus");
                String NtJCoAuthorFromDept=request.getParameter("NationalJournal-Co-AuthorFromDept");
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection((String)session.getAttribute("DatabaseHost"),(String)session.getAttribute("DatabaseUser"),(String)session.getAttribute("DatabasePassword"));
                    Statement stmt = connection.createStatement();
                    int result = stmt.executeUpdate("INSERT INTO National_Journal (ApplicationNumber,Authors,PaperTitle,JournalName," +
                            "Volume,Issue,Pages,MonthYear,Publisher,ImpactFactor" +
                            ",SCI,Scopus,CoAuthorFromDept) VALUES ('" +
                            session.getAttribute("ApplicationNumber")+"','" +
                            NtJAuthor+"','" +
                            NtJPaperTitle+"','" +
                            NtJIssue+"','" +
                            NtJJournalName+"','"+NtJVolume+"','" +
                            NtJPages+"','" +
                            NtJMonthYear+"','" +
                            NtJPublisher+"','" +
                            NtJImpactFactor+"','" +
                            NtJSCI+"','" +
                            NtJScopus+"','" +
                            NtJCoAuthorFromDept+"')");
                    connection.close();
                    stmt.close();
                    if (result>0){
                        %><div class="alert-success">Saved</div> <%
                    }
                    else
                    {
                        %><div class="alert-warning">Error saving data</div> <%
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