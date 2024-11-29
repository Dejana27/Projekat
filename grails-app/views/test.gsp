<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 11.4.24.
  Time: 14:49
--%>

<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Test</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">
    <link rel="stylesheet"
          href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
          integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet"/>
    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.js"></script>
    <!-- Vendor CSS Files -->
    <asset:stylesheet src="vendor/bootstrap/css/bootstrap.min.css"/>
    <asset:stylesheet src="vendor/bootstrap-icons/bootstrap-icons.css"/>
    <asset:stylesheet src="vendor/boxicons/css/boxicons.min.css"/>
    <asset:stylesheet src="vendor/glightbox/css/glightbox.min.css"/>
    <asset:stylesheet src="vendor/remixicon/remixicon.css"/>
    <asset:stylesheet src="vendor/swiper/swiper-bundle.min.css"/>

    <asset:stylesheet src="test.css"/>

</head>

<body>
<header id="header" class="header fixed-top d-flex align-items-center">
    <div>
        <h2 id="title_heading">Salon ${nazivSalona}</h2>
    </div>

</header>
<aside id="sidebar" class="sidebar">
    <ul class="sidebar-nav" id="sidebar-nav">
        <li class="nav-item">
            <g:link action="showSalon" controller="salon" class="nav-link px-0 align-middle">
                <i class="fs-4 bi-balloon-heart nav_item"></i> <span
                    class="ms-1 d-none d-sm-inline nav_item">Pregled salona</span>
            </g:link>
        </li>
        <li class="nav-item">
            <g:link action="showService" controller="usluge"
                    class="nav-link px-0 align-middle">
                <i class="fs-4 bi-scissors nav_item"></i> <span
                    class="ms-1 d-none d-sm-inline nav_item">Usluge</span>
            </g:link>
        </li>
        <li class="nav-item">
            <g:link action="showEmployee" controller="zaposleni"
                    class="nav-link px-0 align-middle">
                <i class="fs-4 bi-people nav_item"></i> <span class="ms-1 d-none d-sm-inline nav_item">Zaposleni</span>
            </g:link>
        </li>
        <li class="nav-item">
            <g:link action="addPhotoView" controller="salon"
                    class="nav-link px-0 align-middle">
                <i class="fs-4 bi-camera nav_item"></i><span
                    class="ms-1 d- none d-sm-inline nav_item">Dodaj sliku</span>
            </g:link>
        </li>
        <li class="nav-item">
            <g:link action="registrationEmployee" controller="zaposleni" class="nav-link px-0 align-middle">
                <i class="fs-4 bi-person-square nav_item"></i><span
                    class="ms-1 d-none d-sm-inline nav_item">Registracija</span>
            </g:link>
        </li>
        <li class="nav-item">
            <g:link action="displayAppointmentView" controller="home" class="nav-link px-0 align-middle">
                <i class="fs-4 bi-calendar-heart nav_item"></i><span
                    class="ms-1 d-none d-sm-inline nav_item">Zakazivanja</span>
            </g:link>
        </li>
        <li class="nav-item">
            <div class="row">
                <button class="btn btn-secondary" id="logoutButton">Izloguj se</button>
            </div>
        </li>
    </ul>
</aside>
<main id="main" class="main">

    <div class="col-4" style="margin-left: -11px;">
        <h2>${nazivSalona}</h2>

        <h5>${tipSalona}</h5>

    </div>

    <div class="table">
        <div class="heading">
            <legend style="margin-left: 6px;">Zarada za salon ${nazivSalona}</legend>
        </div>
%{--        <table>--}%
%{--            <caption>Zarada za salon ${nazivSalona}</caption>--}%
%{--            <thead>--}%
%{--            <tr>--}%

%{--                <th style="display: inline-flex; color: #a1a1a1;">--}%
%{--                    <select id="selectRevenueForYear">--}%
%{--                        <option selected="selected">Period zarade</option>--}%
%{--                        <option value="2023">2023-2024</option>--}%
%{--                        <option value="2024">2024-2025</option>--}%
%{--                        <option value="2025">2025-2026</option>--}%
%{--                        <option value="2026">2026-2027</option>--}%
%{--                    </select>--}%
%{--                </th>--}%
%{--                <th>Iznos zarade</th>--}%
%{--            </tr>--}%
%{--            </thead>--}%
%{--            <tbody id="bodyTable">--}%

%{--            </tbody>--}%
%{--        </table>--}%
        <table id="tabelaZarada" class="table table-striped table-bordered" style="width:100%">
            <thead class="headings">
            <tr>

            </tr>
            </thead>
        </table>

        <table id="tabelaZaradaZaMjesec" class="table table-striped table-bordered" style="width:100%">
            <thead class="headings">
            <tr>
                <select id="year">
                    <option value="2023">2023</option>
                    <option value="2024"selected="selected">2024</option>
                    <option value="2025">2025</option>
                    <option value="2026">2026</option>
                    <option value="2027">2027</option>
                </select>
                <select id="month">
                    <option value="1">Januar</option>
                    <option value="2">Februar</option>
                    <option value="3">Mart</option>
                    <option value="4">April</option>
                    <option value="5">Maj</option>
                    <option value="6">Jun</option>
                    <option value="7" selected="selected">Jul</option>
                    <option value="8">Avgust</option>
                    <option value="9">Septembar</option>
                    <option value="10">Oktobar</option>
                    <option value="11">Novembar</option>
                    <option value="12">Decembar</option>
                </select>

            </tr>
            </thead>
        </table>
    </div>

    <div class="pagetitle">
        <h4 style="margin-left: 2px">Budžet</h4>
    </div>

    <div class="row">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-body" id="budgetForMonth">
                    <h5 class="card-title">Zarada za mjesec</h5>
                    <select id="selectYear">
                        <option value="2023">2023</option>
                        <option value="2024" selected="selected">2024</option>
                        <option value="2025">2025</option>
                        <option value="2026">2025</option>
                    </select>
                    <select id="selectMonth">
                        <option value="1">Januar</option>
                        <option value="2">Februar</option>
                        <option value="3">Mart</option>
                        <option value="4">April</option>
                        <option value="5">Maj</option>
                        <option value="6">Jun</option>
                        <option value="7" selected="selected">Jul</option>
                        <option value="8">Avgust</option>
                        <option value="9">Septembar</option>
                        <option value="10">Oktobar</option>
                        <option value="11">Novembar</option>
                        <option value="12">Decembar</option>
                    </select>

                    <canvas id="pieChart" style="max-height: 400px;"></canvas>
                    <script>
                        let pieChart;
                        let month = document.querySelector('#selectMonth').value;
                        document.addEventListener("DOMContentLoaded", () => {
                            pieChart = new Chart(document.querySelector('#pieChart'), {
                                type: 'pie',
                                data: {
                                    labels: [],
                                    datasets: [{
                                        label: `Zarada za mjesec`,
                                        data: [],
                                        backgroundColor: [],
                                        hoverOffset: 4
                                    }]
                                }
                            });
                        });
                    </script>

                </div>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="card">
                <div class="card-body" id="budgetForYear">
                    <h5 class="card-title">Zarada za godinu</h5>

                    <select id="getYear">
                        <option value="2023">2023</option>
                        <option value="2024" selected="selected">2024</option>
                        <option value="2025">2025</option>
                        <option value="2026">2026</option>
                    </select>

                    <canvas id="barChartYear" style="max-height: 400px;"></canvas>
                    <script>
                        let chartYear;
                        document.addEventListener("DOMContentLoaded", () => {
                            chartYear = new Chart(document.querySelector('#barChartYear'), {
                                type: 'bar',
                                data: {
                                    labels: ['Januar', 'Februar', 'Mart', 'April', 'Maj', 'Jun', 'Jul', 'Avgust', 'Septembar', 'Novembar', 'Decembar'],
                                    datasets: [{
                                        label: 'Zarada za mjesec',
                                        data: [],
                                        backgroundColor: [
                                            'rgba(255, 99, 132, 0.2)',
                                            'rgba(255, 159, 64, 0.2)',
                                            'rgba(255, 205, 86, 0.2)',
                                            'rgba(75, 192, 192, 0.2)',
                                            'rgba(54, 162, 235, 0.2)',
                                            'rgba(153, 102, 255, 0.2)',
                                            'rgba(0,63,184,0.64)',
                                            'rgb(87,208,85, 0.64)',
                                            'rgba(199,2,168,0.65)',
                                            'rgba(255,189,0,0.89)',
                                            'rgba(199,2,2,0.65)',
                                            'rgba(203,203,203,0.6)',
                                        ],
                                        borderColor: [
                                            'rgb(255, 99, 132)',
                                            'rgb(255, 159, 64)',
                                            'rgb(255, 205, 86)',
                                            'rgb(75, 192, 192)',
                                            'rgb(54, 162, 235)',
                                            'rgb(153, 102, 255)',
                                            'rgb(5,20,52)',
                                            'rgba(0,184,89)',
                                            'rgb(217,137,241)',
                                            'rgb(232,207,170)',
                                            'rgba(248,96,96)',
                                            'rgb(147,149,153)',
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

                </div>
            </div>
        </div>
    </div>
    %{--    <div class="col-lg-6">--}%
    %{--        <div class="card">--}%
    %{--            <div class="card-title">--}%

    %{--            </div>--}%
    %{--            <div class="card-body">--}%

    %{--            </div>--}%
    %{--        </div>--}%
    %{--    </div>--}%
</main>
<script src="https://cdn.datatables.net/2.0.3/js/dataTables.js"></script>
<script>
    let idSalon = ${idSalon};
    %{--let saveImageUrl = "${g.createLink(controller: 'salon', action: 'saveImage')}";--}%
    let addPhotoUrl = "${g.createLink(controller: 'salon', action: 'addPhotoView')}";
    let findBudgetForMonthUrl = "${g.createLink(controller: 'profile', action: 'getBudgetForMonth')}";
    let findBudgetForYearUrl = "${g.createLink(controller: 'profile', action: 'getBudgetForYear')}";
    let getRevenueForYearUrl = "${g.createLink(controller: 'profile', action: 'getRevenueForYear')}";
    let getRevenueForMonthUrl = "${g.createLink(controller: 'profile', action: 'getRevenueForMonth')}";
    

</script>
<asset:javascript src="vendor/bootstrap/js/bootstrap.bundle.min.js"/>
<asset:javascript src="vendor/chart.js/chart.umd.js"/>
<asset:javascript src="vendor/quill/quill.min.js"/>
<asset:javascript src="vendor/simple-datatables/simple-datatables.js"/>
<asset:javascript src="vendor/tinymce/tinymce.min.js"/>
</body>
<asset:javascript src="logout.js"/>
<asset:javascript src="budget.js"/>
</html>

