<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 16.4.24.
  Time: 09:04
--%>


<html>
<head>
    <title>Zaposleni</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">
%{--    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">--}%
    <link rel="stylesheet"
          href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
          integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet"/>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <asset:stylesheet src="vendor/bootstrap/css/bootstrap.min.css"/>
    <asset:stylesheet src="vendor/bootstrap-icons/bootstrap-icons.css"/>
    <asset:stylesheet src="vendor/boxicons/css/boxicons.min.css"/>
    <asset:stylesheet src="vendor/glightbox/css/glightbox.min.css"/>
    <asset:stylesheet src="vendor/simple-datatables/style.css" rel="stylesheet"/>
    <asset:stylesheet src="vendor/remixicon/remixicon.css"/>
    <asset:stylesheet src="vendor/swiper/swiper-bundle.min.css"/>
    <asset:stylesheet src="zaposleni.css"/>
    %{--    <asset:stylesheet src="style.css"/>--}%
    %{--    <asset:stylesheet src="tablestyle.css"/>--}%
    %{--    <asset:stylesheet src="table.css"/>--}%
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
                <i class="fs-4 bi-person-square nav_item"></i><span class="ms-1 d-none d-sm-inline nav_item">Registracija</span>
            </g:link>
        </li>
        <li class="nav-item">
            <g:link action="displayAppointmentView" controller="home" class="nav-link px-0 align-middle">
                <i class="fs-4 bi-calendar-heart nav_item"></i><span class="ms-1 d-none d-sm-inline nav_item">Zakazivanja</span>
            </g:link>
        </li>
        <li class="nav-item">
            <button class="btn btn-block btn-primary" id="addEmployeeButton" data-toggle="modal" data-target="#loginModal">
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
                                            <i class="material-icons">person</i>
                                        </span>
                                    </div>
                                    <select class="js-example-basic-multiples" name="states[]" multiple="multiple" id="zaposleniSelect">

                                    </select>
                                </div>
                            </div>


                            <div class="form-group bmd-form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="material-icons">circle</i>
                                        </span>
                                    </div>
                                    <select class="js-example-basic-multiple" name="states[]" multiple="multiple"
                                            id="multiSelect">
                                    </select>

                                    %{--                                    <select class="form-control" id="serviceSelect">--}%

                                    %{--                                    </select>--}%
                                </div>
                            </div>

                            <div class="form-group bmd-form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="material-icons">strike</i>
                                        </span>
                                    </div>

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

<div>
    <br>
    <br>
    <table id="tabelaZaposleni" class="table table-striped" style="width:100%">
        <thead class="headings">
        <tr>
%{--            <th>Naziv salona</th>--}%
%{--            <th>Grad</th>--}%
%{--            <th>Ulica</th>--}%
%{--            <th>Korisnik</th>--}%
%{--            <th></th>--}%
        </tr>
        </thead>
    </table>



    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">

                    <h5 class="title" id="exampleModalLabel">Izmijeni zaposlenog</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                </div>

                <div class="modal-body">
                    <label for="firstName" class="form-label">Ime</label>
                    <input type="text" name="name" class="form-control" id="firstName" required>
                    <br>
                    <label for="lastName" class="form-label">Prezime</label>
                    <input type="text" name="name" class="form-control" id="lastName" required>
                    <br>
                    <label for="phoneNumber" class="form-label">Broj telefona</label>
                    <input type="text" name="name" class="form-control" id="phoneNumber" required>
                    <br>
                    <label for="workHours" class="form-label">Radno vrijeme</label>
                    <input type="text" name="name" class="form-control" id="workHours" required>
                    <br>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Zatvori</button>
                    <button type="button" class="btn btn-primary" id="saveBtn">Sačuvaj</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="showEmployeeModal" tabindex="-1" aria-labelledby="showEmployeeModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">

                    <h5 class="title" id="showEmployeeModalLabel">Prikaz zaposlenog</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                </div>

                <div class="modal-body" id="employeesBody">

                </div>

                %{--                <div class="modal-footer">--}%
                %{--                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Zatvori</button>--}%
                %{--                    <button type="button" class="btn btn-primary" id="saveBtn">Sačuvaj</button>--}%
                %{--                </div>--}%
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
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
    let displaySalonsUrl = "${g.createLink(controller: 'zaposleni', action: 'displaySalon')}";
    let saveEmployeeUrl = "${g.createLink(controller: 'zaposleni', action: 'saveEmployee')}";
    let displayAllEmployeesUrl = "${g.createLink(controller:'zaposleni', action:'displayEmployee')}";
    let displayAllServicesUrl = "${g.createLink(controller: 'zaposleni', action: 'displayAllServices')}";
    let showSalonUrl = "${g.createLink(controller: 'salon', action: 'showSalon')}";
    let editEmployeeUrl = "${g.createLink(controller: 'zaposleni', action: 'editEmployee')}";
    let saveEditedEmployeeUrl = "${g.createLink(controller: 'zaposleni', action: 'saveEditedEmployee')}";
    let deleteEmployeeUrl = "${g.createLink(controller: 'zaposleni', action: 'deleteEmployee')}";
    let showEmployeeDetailsTableUrl = "${g.createLink(controller: 'zaposleni', action: 'showEmployeeDetailTable')}";
    let displayEmployeesUrl = "${g.createLink(controller:'zaposleni', action:'displayEmployees')}";
</script>
<asset:javascript src="zaposleni.js"/>
<asset:javascript src="logout.js"/>
</body>
</html>