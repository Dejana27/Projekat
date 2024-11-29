<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 13.6.24.
  Time: 13:31
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Izvještaji</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.3/css/dataTables.dataTables.css"/>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


    <asset:stylesheet src="vendor/animate.css/animate.min.css" rel="stylesheet"/>
    <asset:stylesheet src="vendor/aos/aos.css" rel="stylesheet"/>
    <asset:stylesheet src="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <asset:stylesheet src="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
    <asset:stylesheet src="vendor/boxicons/css/boxicons.min.css" rel="stylesheet"/>
    <asset:stylesheet src="vendor/glightbox/css/glightbox.min.css" rel="stylesheet"/>
    <asset:stylesheet src="vendor/swiper/swiper-bundle.min.css" rel="stylesheet"/>
    <asset:stylesheet src="vendor/remixicon/remixicon.css" rel="stylesheet"/>
    <asset:stylesheet src="vendor/simple-datatables/style.css" rel="stylesheet"/>

    <asset:stylesheet src="style.css"/>
</head>

<body>
<header id="header" class="header fixed-top d-flex align-items-center">
    <div class="d-flex align-items-center justify-content-between">
        <g:link action="index" controller="admin">

            <span class="d-none d-lg-block logo_span1">SrediMe Admin</span>
        </g:link>

    </div>
</header>
<aside id="sidebar" class="sidebar">
    <ul class="sidebar-nav" id="sidebar-nav">
        <li class="nav-item">
            <g:link action="index" controller="admin" class="nav-link collapsed">
                <i class="bi bi-grid"></i>
                <span>Početna</span>
            </g:link>
        </li>
        <!-- End Dashboard Nav -->

        <li class="nav-item">
            <g:link controller="salon" action="index" class="nav-link collapsed">
                <i class="bi bi-search-heart"></i><span>Saloni</span>

            </g:link>
        </li>

        <li class="nav-item">
            <g:link controller="salon" action="showUsers" class="nav-link collapsed">
                <i class="bi bi-search-heart"></i><span>Korisnici</span>
            </g:link>
        </li>

        <li class="nav-item">
            <g:link controller="admin" action="showReports" class="nav-link collapsed"
                    data-bs-target="#tables-nav" data-bs-toggle="collapse">
                <i class="bi bi-layout-text-window-reverse"></i><span>Izvještavanje</span>
            </g:link>
        </li>


        <li class="nav-item">
            <a
                    class="nav-link collapsed"
                    data-bs-target="#charts-nav"
                    data-bs-toggle="collapse"
                    href="#">
                <i class="bi bi-info-circle"></i><span>Obaviještenja</span>
            </a>
        </li>
    </ul>
    <button class="btn-logout">Izloguj se</button>
</aside>
<main id="main" class="main">
    <div class="displaySalon">

    </div>
</main>
<script src="https://cdn.datatables.net/2.0.3/js/dataTables.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
    let displayAllSalonsUrl = "${g.createLink(controller: 'admin', action: 'displayAllSalons')}";
    let getEarningsUrl = "${g.createLink(controller: 'admin', action: 'getEarnings')}";
    let findPricesAndEarningUrl = "${g.createLink(controller: 'admin', action: 'findPricesAndEarnings')}";
</script>
<asset:javascript src="report.js"/>
</body>
</html>