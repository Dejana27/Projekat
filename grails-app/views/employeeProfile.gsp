<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 26.6.24.
  Time: 09:12
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Profil zaposlenog</title>
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
    <link rel="stylesheet" type="text/css"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
            <g:link action="showProfile" controller="zaposleni"
                    class="nav-link px-0 align-middle">
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
<main id="main">
    <div class="row gutters-sm">
        <div class="col-md-4 mb-3">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex flex-column align-items-center text-center">
                        <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle"
                             width="150">

                        <div class="mt-3">
                            <h4>${ime} ${prezime}</h4>

                            <p class="text-secondary mb-1">Frizer</p>

                            <p class="text-muted font-size-sm">Đoka Miraševića 16, Podgorica</p>
                            <button class="btn btn-primary">Follow</button>
                            <button class="btn btn-outline-primary">Message</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card mt-3">
                <br>
                <h5 class="text-center">Usluge koje obavlja</h5>
                <ul class="list-group list-group-flush" id="serviceList">

                </ul>
            </div>
        </div>

        <div class="col-md-8">
            <div class="card mb-3">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-3">
                            <h6 class="mb-0">Ime i prezime</h6>
                        </div>

                        <div class="col-sm-9 text-secondary" id="getName">${ime} ${prezime}</div>
                    </div>
                    <hr>

                    <div class="row">
                        <div class="col-sm-3">
                            <h6 class="mb-0">Email</h6>
                        </div>
                        <div class="col-sm-9 text-secondary" id="getEmail">${email}</div>
                    </div>
                    <hr>

                    <div class="row">
                        <div class="col-sm-3">
                            <h6 class="mb-0">Broj telefona</h6>
                        </div>
                        <div class="col-sm-9 text-secondary" id="getNumber">${brojTelefona}</div>
                    </div>
                    <hr>

                    <div class="row">
                        <div class="col-sm-3">
                            <h6 class="mb-0">Adresa</h6>
                        </div>
                        <div class="col-sm-9 text-secondary" id="getAddress">Đoka Miraševića 16, Podgorica</div>
                    </div>
                    <hr>

                    <div class="row">
                        <div class="col-sm-12">

                            <button class="btn btn-info" id="editButton">Edit</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editModalLabel">Izmijeni podatke</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <div class="modal-body">
                            <label for="yourName" class="form-label md-0">Ime i prezime:</label>
                            <input type="text" name="name" class="form-control" id="yourName" required>
                            <br>
                            <label for="yourEmail" class="form-label md-0">Email:</label>
                            <input type="text" name="email" class="form-control" id="yourEmail" required>
                            <br>
                            <label for="yourNumber" class="form-label md-0">Broj telefona:</label>
                            <input type="text" name="number" class="form-control" id="yourNumber" required>
                            <br>
                            <label for="yourAddress" class="form-label md-0">Adresa:</label>
                            <input type="text" name="address" class="form-control" id="yourAddress" required>
                            <br>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Zatvori</button>
                            <button type="button" class="btn btn-primary" id="saveBtn">Sačuvaj</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script>
    let id = ${id};
    let getEmployeeDataUrl = "${g.createLink(controller: 'zaposleni', action: 'getEmployeeData')}";
    let editEmployeeUrl = "${g.createLink(controller: 'zaposleni', action: 'editEmployeeProfile')}";
</script>
<asset:javascript src="employeeProfile.js"/>
<asset:javascript src="logout.js "/>
</body>
</html>