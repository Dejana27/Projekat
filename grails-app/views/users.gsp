<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 5.6.24.
  Time: 14:43
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Pregled korisnika</title>
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
    <asset:stylesheet src="tablestyle.css"/>
    <asset:stylesheet src="table.css"/>
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
    <table id="tabelaSalon" class="table table-striped table-bordered" style="width:100%">
        <thead class="headings">
        <tr>
            <th>Ime korisnika</th>
            <th>Korisničko ime</th>
            <th>Email</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
    </table>
</main>
<div class="modal fade" id="showDetailsModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="detailsModalTitle" id="showDetailsModalLabel">Detaljni prikaz korisnika</h5>
                <button type="button" class="btn-close" id="btnClose" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>

            <div class="modalBody">
                <h6 class="headingsDetails">Ime korisnika:</h6><b id="name"></b>
                <h6 class="headingsDetails">Korisničko ime:</h6><b id="username"></b>
                <h6 class="headingsDetails">Email:</h6><b id="email"></b>
                <h6 class="headingsDetails" id="likedSalonHeading">Lajkovani saloni:</h6><b id="likedSalons"></b>
                <h6 class="headingsDetails" id="appointmentHeading">Zakazani termini:</h6><b id="appointments"></b>

                <div id="detailsModalBody">

                </div>
                <hr>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.datatables.net/2.0.3/js/dataTables.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
    let showAllUsersUrl = "${g.createLink(controller: 'salon', action: 'showAllUsers')}";
    let showUsersDetaislUrl = "${g.createLink(controller: 'salon', action: 'showUsersDetail')}";
    let deleteUserUrl = "${g.createLink(controller: 'salon', action: 'deleteUser')}";
</script>
<asset:javascript src="user.js"/>
</body>
</html>