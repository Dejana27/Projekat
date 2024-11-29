<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 12.4.24.
  Time: 10:06
--%>

%{--<%@ page contentType="text/html;charset=UTF-8" %>--}%
<html>
<head>
    <title>Usluge</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">
    %{--    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">--}%
    <link rel="stylesheet"
          href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
          integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.3/css/dataTables.dataTables.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <asset:stylesheet src="vendor/bootstrap/css/bootstrap.min.css"/>
    <asset:stylesheet src="vendor/bootstrap-icons/bootstrap-icons.css"/>
    <asset:stylesheet src="vendor/boxicons/css/boxicons.min.css"/>
    <asset:stylesheet src="vendor/glightbox/css/glightbox.min.css"/>
    <asset:stylesheet src="vendor/simple-datatables/style.css" rel="stylesheet"/>
    <asset:stylesheet src="vendor/remixicon/remixicon.css"/>
    <asset:stylesheet src="vendor/swiper/swiper-bundle.min.css"/>
    <asset:stylesheet src="zaposleni.css"/>

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
            <g:link action="addPhotoView" controller="salon" class="nav-link px-0 align-middle">
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
            <button class="btn btn-block btn-primary" id="addTypeOfService" class="nav-link px-0 align-middle"
                    data-toggle="modal" data-target="#addTypeOfServiceModal">
                <i class="material-icons">launch</i>
                Dodaj tip usluge
                <div class="ripple-container"></div></button>
        </li>
        <li class="nav-item">
            <button class="btn btn-block btn-primary" id="addEmployeeButton" class="nav-link px-0 align-middle"
                    data-toggle="modal" data-target="#loginModal">
                <i class="material-icons">launch</i>
                Dodaj usluge
                <div class="ripple-container"></div></button>
        </li>
        <li>
            <div class="row">
                <button class="btn btn-secondary" id="logoutButton">Izloguj se</button>
            </div>
        </li>
    </ul>

%{--    <div class="row logged">--}%
%{--        <div class="row">--}%
%{--            <div class="col-lg-6">--}%
%{--                <span class="dot"><p class="salonName">${nazivSalona}</p></span>--}%
%{--            </div>--}%

%{--            <div class="col-lg-6">--}%
%{--                <h4 class="name">${nazivSalona}</h4>--}%
%{--            </div>--}%
%{--        </div>--}%

%{--        <div class="row">--}%
%{--            <button class="btn btn-secondary" id="logoutButton">Izloguj se</button>--}%
%{--        </div>--}%
%{--    </div>--}%
</aside>
<main id="main">
    <div class="modal fade show" id="addTypeOfServiceModal" tabindex="-1" role="dialog" style="margin-left: 100px;">
        <div class="modal-dialog modal-login mt-5" role="document">
            <div class="modal-content">
                <div class="card card-signup card-plain">
                    <div class="modal-header">
                        <div class="card-header card-header-primary text-center">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i
                                    class="material-icons">clear</i></button>
                            <h4 class="card-title">Tip usluge u salonu</h4>
                        </div>
                    </div>

                    <div class="modal-body">
                        <form class="form" method="" action="">
                            <p class="description text-center">Dodaj tip usluge</p>

                            <div class="card-body">

                                <div class="form-group bmd-form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="material-icons">star_border</i>
                                            </span>
                                        </div>
                                        <input type="text" class="form-control" placeholder="Naziv..." id="nameOfType">
                                    </div>
                                </div>

                            </div>
                        </form>
                    </div>

                    <div class="modal-footer justify-content-center">
                        <a href="#pablo" class="btn btn-primary btn-link btn-wd btn-lg" id="buttonSaveTypeOfService">Sačuvaj</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade show" id="loginModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-login mt-5" role="document">
            <div class="modal-content">
                <div class="card card-signup card-plain">
                    <div class="modal-header">
                        <div class="card-header card-header-primary text-center">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i
                                    class="material-icons">clear</i></button>
                            <h4 class="card-title">Usluge</h4>
                        </div>
                    </div>

                    <div class="modal-body">
                        <form class="form" method="" action="">
                            <p class="description text-center">Dodaj usluge</p>

                            <div class="card-body">

                                <div class="form-group bmd-form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="material-icons">star_border</i>
                                            </span>
                                        </div>
                                        <input type="text" class="form-control" placeholder="Naziv..." id="nameInput">
                                    </div>
                                </div>

                                <div class="form-group bmd-form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="material-icons">euro_symbol</i>
                                            </span>
                                        </div>
                                        <input type="text" class="form-control" placeholder="0.00€" id="priceInput">
                                    </div>
                                </div>

                                <div class="form-group bmd-form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="material-icons">format_line_spacing</i>
                                            </span>
                                        </div>
                                        <select class="form-control" id="typeSelect">

                                        </select>
                                    </div>
                                </div>

                            </div>
                        </form>
                    </div>

                    <div class="modal-footer justify-content-center">
                        <a href="#pablo" class="btn btn-primary btn-link btn-wd btn-lg" id="buttonSave">Sačuvaj</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <br>
    <br>
    <table id="tabelaUsluge" class="display">
        <thead class="headings">

        </thead>
    </table>

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">

                    <h5 class="title" id="exampleModalLabel">Izmijeni uslugu</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                </div>

                <div class="modal-body">
                    <label for="yourName" class="form-label">Ime usluge</label>
                    <input type="text" name="name" class="form-control" id="yourName" required>
                    <br>
                    <label for="typeService" class="form-label">Tip usluge</label>
                    <select class="form-control" id="typeService"></select>
                    <br>
                    <br>
                    <label for="price" class="form-label">Cijena usluge</label>
                    <input type="text" name="name" class="form-control" id="price" required>
                    <br>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Zatvori</button>
                    <button type="button" class="btn btn-primary" id="saveBtn">Sačuvaj</button>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/2.0.3/js/dataTables.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous">
</script>

<script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js"
        integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U"
        crossorigin="anonymous"></script>
<script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js"
        integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9"
        crossorigin="anonymous"></script>

<script>
    %{--let pdfImage = '${assetPath(src: 'modal.jpg')}';--}%
    %{--document.querySelector('#divImage').style.backgroundImage = pdfImage--}%
    let displayTypeServiceUrl = "${g.createLink(controller: 'usluge', action: 'displayService')}";
    let createServiceUrl = "${g.createLink(controller: 'usluge', action: 'createService')}";
    let displayAllServicesUrl = "${g.createLink(controller: 'usluge', action: 'displayAll')}";
    let deleteServiceUrl = "${g.createLink(controller: 'usluge', action: 'deleteService')}";
    let editServiceUrl = '${g.createLink(controller: 'usluge', action: 'editService')}';
    let showSalonUrl = '${g.createLink(controller: 'salon', action: 'showSalon')}';
    let saveServiceUrl = "${g.createLink(controller: 'usluge', action: 'saveService')}";
    let saveTypeOfServiceUrl = "${g.createLink(controller: 'usluge', action: 'saveTypeOfService')}";
</script>
<asset:javascript src="usluge.js"/>
<asset:javascript src="logout.js"/>
</body>
</html>