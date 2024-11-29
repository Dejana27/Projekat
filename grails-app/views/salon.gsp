<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 4.4.24.
  Time: 09:42
--%>


<html>
<head>

    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Pregled salona</title>
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
    <section class="section-dashboard">
        <div class="card">
            <div class="row">
                <div class="btn-group" role="group" aria-label="Basic outlined example">
                    <button type="button" class="btn btn-outline-primary" id="firstButton">Svi saloni</button>
                    <button type="button" class="btn btn-outline-primary" id="secondButton">Verifikovani saloni</button>
                    <button type="button" class="btn btn-outline-primary"
                            id="thirdButton">Neverifikovani saloni</button>
                </div>
            </div>
        </div>

        <table id="tabelaSalon" class="table table-striped table-bordered" style="width:100%">
            <thead class="headings">
            <tr>
                <th>Naziv salona</th>
                <th>Grad</th>
                <th>Ulica</th>
                <th>Korisnik</th>
                <th></th>
            </tr>
            </thead>
        </table>
    </section>
</main>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Izmijeni salon</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body">
                <label for="yourName" class="form-label">Ime salona</label>
                <input type="text" name="name" class="form-control" id="yourName" required>
                <br>
                <label for="workingHours" class="form-label">Radno vrijeme</label>
                <input type="text" name="name" class="form-control" id="workingHours" required>
                <br>
                <label for="type" class="form-label">Tip salona</label>
                <select class="form_control" id="type"></select>
                <br>
                <br>
                <label for="workingDays" class="form-label">Radni dani</label>
                <input type="text" name="name" class="form-control" id="workingDays" required>
                <br>
                <label for="city" class="form-label">Grad</label>
                <select class="form_control" id="city"></select>
                <br>
                <br>
                <label for="number" class="form-label">Broj telefona</label>
                <input type="text" name="name" class="form-control" id="number">
                <br>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Zatvori</button>
                <button type="button" class="btn btn-primary" id="saveBtn">Sačuvaj</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="showDetailsModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="detailsModalTitle" id="showDetailsModalLabel">Detaljni prikaz salona</h5>
                <button type="button" class="btn-close" id="btnClose" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>

            <div class="modalBody">
                <h6>Status:</h6><span class="dot" id="verifiedSalon"></span><b id="verifiedText"></b>
                <h6 class="headingsDetails">Naziv salona:</h6><b id="salonName"></b>
                <h6 class="headingsDetails">Grad:</h6><b id="cityName"></b>
                <h6 class="headingsDetails">Ulica:</h6><b id="streetName"></b>
                <h6 class="headingsDetails">Tip salona:</h6><b id="typeSalon"></b>
                <h6 class="headingsDetails" id="zaposleni">Zaposleni:</h6>

                <div id="detailsModalBody">

                </div>
                <hr>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="showEarningsModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="detailsModalTitle" id="showEarningsModalLabel">Izvještaj za salon</h5>
                <button type="button" class="btn-close" id="btnCloseEarnings" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>

            <div class="modalBody">
                <h6 class="headingsDetails">Naziv salona:</h6><b id="salonNameEarnings"></b>
                <h6 class="headingsDetails">Zarada:</h6><b id="earnings"></b>

                <div id="showEarningsModalBody">

                </div>
                <hr>
            </div>
        </div>
    </div>
</div>
<script>
    let showAllSalons = "${g.createLink(controller: 'salon', action: 'displayAll')}";
    let deleteSalonUrl = "${g.createLink(controller: 'salon', action:'deleteSalon')}";
    let editSalonUrl = "${g.createLink(controller: 'salon', action: 'editSalon')}";
    let displayTypesUrl = "${g.createLink(controller: 'salon', action:'displaySalon')}";
    let displayTypeServiceUrl = "${g.createLink(controller: 'usluge', action: 'displayService')}";
    let displayAllCities = "${g.createLink(controller: 'grad', action: 'createCities')}";
    let saveSalonUrl = "${g.createLink(controller: 'salon', action:'saveSalon')}";
    let editVerificationUrl = "${g.createLink(controller: 'salon', action: 'editVerification')}";
    let showVerifiedSalonsUrl = "${g.createLink(controller: 'salon', action: 'showVerifiedSalons')}";
    let showUnverifiedSalonsUrl = "${g.createLink(controller: 'salon', action: 'showUnverifiedSalons')}";
    let showDetailsUrl = "${g.createLink(controller: 'salon', action: 'showDetails')}";
    let findPricesAndEarningUrl = "${g.createLink(controller: 'admin', action: 'findPricesAndEarnings')}";

</script>
<script src="https://cdn.datatables.net/2.0.3/js/dataTables.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous">
</script>
<asset:javascript src="salon.js"/>
<asset:javascript src="admin.js"/>

<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
</body>
</html>