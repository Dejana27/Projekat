<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 2.7.24.
  Time: 09:08
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Stranica za budžetiranje</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <asset:stylesheet src="vendor/bootstrap/css/bootstrap.min.css"/>
    <asset:stylesheet src="vendor/bootstrap-icons/bootstrap-icons.css"/>
    <asset:stylesheet src="vendor/quill/quill.snow.css"/>
    <asset:stylesheet src="vendor/quill/quill.bubble.css"/>
    <asset:stylesheet src="vendor/quill/quill.bubble.css"/>
    <asset:stylesheet src="vendor/remixicon/remixicon.css"/>
    <asset:stylesheet src="vendor/simple-datatables/style.css"/>


    <asset:stylesheet src="/style.css"/>


</head>

<body>
<header id="header" class="header fixed-top d-flex align-items-center">
    <div>
        <h2 id="title_heading">Stranica za budžetiranje</h2>
    </div>
</header>
<aside id="sidebar" class="sidebar">
    <ul class="sidebar-nav" id="sidebar-nav">
        <li class="nav-item">
            <g:link action="showProfile" controller="zaposleni" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                <i class="fs-4 bi-person-square nav_item"></i> <span
                    class="ms-1 d-none d-sm-inline nav_item">Profil</span>
            </g:link>
        </li>
        <li class="nav-item">
            <g:link action="showService" controller="usluge" data-bs-toggle="collapse"
                    class="nav-link px-0 align-middle">
                <i class="fs-4 bi-scissors nav_item"></i> <span
                    class="ms-1 d-none d-sm-inline nav_item">Usluge</span>
            </g:link>
        </li>
        <li class="nav-item">
            <g:link action="showEmployee" controller="zaposleni" data-bs-toggle="collapse"
                    class="nav-link px-0 align-middle">
                <i class="fs-4 bi-currency-euro nav_item"></i> <span
                    class="ms-1 d-none d-sm-inline nav_item">Zarada</span>
            </g:link>
        </li>

        <li class="nav-item">
            <g:link action="displayAppointmentView" controller="zaposleni" class="nav-link px-0 align-middle">
                <i class="fs-4 bi-calendar-heart nav_item"></i><span
                    class="ms-1 d-none d-sm-inline nav_item">Zakazivanja</span>
            </g:link>
        </li>
        <li class="nav-item">
            <button class="btn btn-block btn-primary" id="logoutButton">Izloguj se</button>
        </li>
    </ul>

</aside>
<main id="main" class="main">
    <div class="pagetitle">
        <h1>Budžet</h1>
    </div>
    <div class="col-lg-6">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Bar CHart</h5>

                <!-- Bar Chart -->
                <canvas id="barChart" style="max-height: 400px;"></canvas>
                <script>
                    document.addEventListener("DOMContentLoaded", () => {
                        new Chart(document.querySelector('#barChart'), {
                            type: 'bar',
                            data: {
                                labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                                datasets: [{
                                    label: 'Bar Chart',
                                    data: [65, 59, 80, 81, 56, 55, 40],
                                    backgroundColor: [
                                        'rgba(255, 99, 132, 0.2)',
                                        'rgba(255, 159, 64, 0.2)',
                                        'rgba(255, 205, 86, 0.2)',
                                        'rgba(75, 192, 192, 0.2)',
                                        'rgba(54, 162, 235, 0.2)',
                                        'rgba(153, 102, 255, 0.2)',
                                        'rgba(201, 203, 207, 0.2)'
                                    ],
                                    borderColor: [
                                        'rgb(255, 99, 132)',
                                        'rgb(255, 159, 64)',
                                        'rgb(255, 205, 86)',
                                        'rgb(75, 192, 192)',
                                        'rgb(54, 162, 235)',
                                        'rgb(153, 102, 255)',
                                        'rgb(201, 203, 207)'
                                    ],
                                    borderWidth: 1
                                }]
                            },
                            options: {
                                scales: {
                                    y: {
                                        beginAtZero: true
                                    }
                                }
                            }
                        });
                    });
                </script>
                <!-- End Bar CHart -->

            </div>
        </div>
    </div>
</main>
<asset:javascript src="vendor/bootstrap/js/bootstrap.bundle.min.js"/>
<asset:javascript src="vendor/chart.js/chart.umd.js"/>
<asset:javascript src="vendor/quill/quill.min.js"/>
<asset:javascript src="vendor/simple-datatables/simple-datatables.js"/>
<asset:javascript src="vendor/tinymce/tinymce.min.js"/>

<script>
    let findBudgetForMonth = "${g.createLink(controller: 'profile', action: 'getBudgetForMonth')}";
</script>
<!-- Template Main JS File -->
<asset:javascript src="main.js"/>
</body>
</html>