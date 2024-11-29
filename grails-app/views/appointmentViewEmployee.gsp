<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 25.6.24.
  Time: 13:47
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Zakazivanja za zaposlenog</title>
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
        <h2 id="title_heading">Zaposleni</h2>
    </div>

</header>
<aside id="sidebar" class="sidebar">
    <ul class="sidebar-nav" id="sidebar-nav">
        <li class="nav-item">
            <g:link action="showProfile" controller="zaposleni"  class="nav-link px-0 align-middle">
                <i class="fs-4 bi-person-square nav_item"></i> <span
                    class="ms-1 d-none d-sm-inline nav_item">Profil</span>
            </g:link>
        </li>
        <li class="nav-item">
            <g:link action="showService" controller="zaposleni"
                    class="nav-link px-0 align-middle">
                <i class="fs-4 bi-scissors nav_item"></i> <span
                    class="ms-1 d-none d-sm-inline nav_item">Usluge</span>
            </g:link>
        </li>
        <li class="nav-item">
            <g:link action="showRevenue" controller="zaposleni"
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
<main id="main" class="row main1">
    <h5>Zakazivanja za narednih 7 dana</h5>
%{--    <div class="row" id="showAppointments">--}%

%{--    </div>--}%
%{--    <div class="card bg-light mb-3" style="max-width: 18rem;" id="showAppointments">--}%
%{--        <div class="card-header"id="cardHeader"></div>--}%
%{--        <div class="card-body " id="showAppointments">--}%
%{--            <h5 class="card-title">Zakazivanja za narednih 7 dana</h5>--}%
%{--            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>--}%
%{--        </div>--}%
%{--    </div>--}%
</main>
<script>
    let getApprovedAppointmentsUrl = "${g.createLink(controller: 'zaposleni', action: 'getApprovedAppointments')}";
</script>
<asset:javascript src="appointmentViewEmployee.js"/>
<asset:javascript src="logout.js"/>
</body>
</html>