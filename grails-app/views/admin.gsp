<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 3.4.24.
  Time: 10:47
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Admin</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
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

    <div>
        <h2 id="title_heading">Početna</h2>
    </div>

</header>
<!-- End Header -->
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
            <g:link controller="salon" action="index" class="nav-link collapsed" data-bs-target="#components-nav"
                    data-bs-toggle="collapse">
                <i class="bi bi-search-heart"></i><span>Saloni</span>

            </g:link>
        </li>

        <li class="nav-item">
            <g:link controller="salon" action="showUsers" class="nav-link collapsed"
                    data-bs-target="#tables-nav"
                    data-bs-toggle="collapse">
                <i class="bi bi-search-heart"></i><span>Korisnici</span>
            </g:link>
        </li>

%{--        <li class="nav-item">--}%
%{--            <g:link controller="admin" action="showReports" class="nav-link collapsed"--}%
%{--                    data-bs-target="#tables-nav" data-bs-toggle="collapse">--}%
%{--                <i class="bi bi-layout-text-window-reverse"></i><span>Izvještavanje</span>--}%
%{--            </g:link>--}%
%{--            </a>--}%
%{--        </li>--}%

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
<main id="main">
%{--    <section class="section-dashboard">--}%
%{--        <div class="card">--}%
%{--            <h5 class="bi bi-reception-4 title_first">Statistika</h5>--}%

%{--            <p></p>--}%

%{--            <p></p>--}%

%{--            <p></p>--}%

%{--            <p></p>--}%

%{--            <p></p>--}%

%{--            <p></p>--}%

%{--            <p></p>--}%
%{--        </div>--}%

%{--        <div class="card">--}%
%{--            <h5 class="bi bi-info-circle title_first">Obaviještenja</h5>--}%

%{--            <p></p>--}%

%{--            <p></p>--}%

%{--            <p></p>--}%

%{--            <p></p>--}%

%{--            <p></p>--}%

%{--            <p></p>--}%

%{--            <p></p>--}%
%{--        </div>--}%
%{--    </section>--}%
</main>
<script>
    let getSumForEachSalonUrl = "${g.createLink(controller: 'salon', action: 'getSumForEachSalon')}"
</script>
<asset:javascript src="admin.js"/>
</body>
</html>