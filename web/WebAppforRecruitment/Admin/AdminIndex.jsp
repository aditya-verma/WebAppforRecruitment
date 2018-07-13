<%@ page import="java.util.Properties" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Pannel</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/backgrounds.css">
    <script src="../jquery/3.3.1/jquery.min.js"></script>
    <script src="../jquery/popper.js/1.14.3/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
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
    <div class="jumbotron" style="height: 10%">
        <div class="container">
            <h1>Recruitment Portal</h1>
            <div class="bg-dark rounded">
                <h3 class="text-primary text-uppercase" style="color: #FFF;padding: 1%;">Administrator Pannel</h3>
            </div>
        </div>
    </div>
</header>


<div class="container align-middle">
    <div class="row custom-control-inline">
        <div class="col">
            <a href="ApplicantList.jsp" class="focus">
                <div class="card p-2 mb-2" style="width: 15rem;">
                    <img class="card-img-top" src="../Images/Applicants.svg" alt="Card image cap">
                    <div class="card-body text-center">
                        <p class="card-text">List of Applicants</p>
                    </div>
                </div>
            </a>
        </div>
        <div class="col">
            <div class="card p-2 mb-2" style="width: 15rem;">
                <img class="card-img-top" src="../Images/SelectedApplicants.png" alt="Card image cap">
                <div class="card-body text-center">
                    <p class="card-text">Qualified Applicants</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card p-2 m-2" style="width: 15rem;">
                <img class="card-img-top" src="../Images/SearchApplicant.png" alt="Card image cap">
                <div class="card-body text-center">
                    <p class="card-text">Search Applicant</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card p-2 mb-2" style="width: 15rem;">
                <img class="card-img-top" src="../Images/Calculate-Credit-Points.svg" alt="Card image cap">
                <div class="card-body text-center">
                    <p class="card-text">Calculate Credit Points</p>
                </div>
            </div>
        </div>
        <div class="col">
            <a href="AddVacancies.jsp" class="focus">
                <div class="card p-2 mb-2" style="width: 15rem;">
                    <img class="card-img-top" src="../Images/AddJobs.svg" alt="Card image cap">
                    <div class="card-body text-center">
                        <p class="card-text">Add/Update Vacancies</p>
                    </div>
                </div>
            </a>
        </div>
        <div class="col">
            <div class="card p-2 mb-2" style="width: 15rem;">
                <img class="card-img-top" src="../Images/AddCreditCriteria.svg" alt="Card image cap">
                <div class="card-body text-center">
                    <p class="card-text">Add/Edit Credit Criteria</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card p-2 mb-2" style="width: 15rem;">
                <img class="card-img-top" src="../Images/SearchApplicant.png" alt="Card image cap">
                <div class="card-body text-center">
                    <p class="card-text">Search Applicantt</p>
                </div>
            </div>
        </div>
        <div class="col">
            <a href="AdvancedSetup.jsp">
                <div class="card p-2 mb-2" style="width: 15rem;">
                    <img class="card-img-top" src="../Images/AdvancedSettings.png" alt="Card image cap">
                    <div class="card-body text-center">
                        <p class="card-text">Advanced Setup</p>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>


<div class="card-footer align-bottom mt-2" style="background-color: #c4c4c4">
    <div class="container text-muted text-center rounded">
        <form method="post" action="../logout.jsp">
            <button class="btn btn-danger btn-sm" name="logout">Logout</button>
        </form>
    </div>
</div>

</body>
</html>