<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title> SrediMe - Početna </title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    %{--    <link href="assets/img/favicon.png" rel="icon">--}%
    %{--    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">--}%

    <!-- Google Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <!-- Vendor CSS Files -->
    <asset:javascript src="vendor/animate.css/animate.min.css" rel="stylesheet"/>
    <asset:javascript src="vendor/aos/aos.css" rel="stylesheet"/>
    <asset:javascript src="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <asset:javascript src="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
    <asset:javascript src="vendor/boxicons/css/boxicons.min.css" rel="stylesheet"/>
    <asset:javascript src="vendor/glightbox/css/glightbox.min.css" rel="stylesheet"/>
    <asset:javascript src="vendor/swiper/swiper-bundle.min.css" rel="stylesheet"/>


    <asset:stylesheet src="salonIndex.css"/>

</head>

<body>
<nav></nav>
<header id="header" class="fixed-top d-flex align-items-center">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-lg-between">



        <nav id="navbar" class="navbar order-last order-lg-0">
%{--            <ul>--}%
                <button class="btns btn-create animated fadeInUp scrollto" id="showButton">Prikaži salon</button>

%{--                <li><a class="nav-link scrollto" href="#about">Izmijeni</a></li>--}%
%{--                <li><a class="nav-link scrollto" href="#menu">Utisci</a></li>--}%
%{--                <li><a class="nav-link scrollto" href="#specials">Sviđanja</a></li>--}%
%{--                <li><a class="nav-link scrollto" href="#events">Zakazivanja</a></li>--}%
%{--                <li><a class="nav-link scrollto" href="#chefs">Profil</a></li>--}%

%{--            </ul>--}%
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->
%{--    <g:link action="index" controller="partner" class="book-a-table-btn scrollto d-none d-lg-flex">Poslovni korisnici</g:link>--}%


    </div>
</header><!-- End Header -->
<!-- ======= Hero Section ======= -->
<section id="hero" class="d-flex align-items-center">
    <div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100">
        <div class="row logo_name">
            <div class="col-lg-8">
                <h1>Dobrodošli na <span>SrediMe</span></h1>

            </div>


        </div>
    </div>
</section>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Kreiraj salon</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <label for="yourName" class="form-label">Ime salona</label>
                <input type="text" name="name" class="form-control" id="yourName" required>
                <label for="workingHours" class="form-label">Radno vrijeme</label>
                <input type="text" name="name" class="form-control" id="workingHours" required>
                <label for="type" class="form-label">Tip salona</label>
                <input type="text" name="name" class="form-control" id="type" required>
                <label for="workingDays" class="form-label">Radni dani</label>
                <input type="text" name="name" class="form-control" id="workingDays" required>
                <button class="btns btn-create animated fadeInUp scrollto" id="btnAddImage">Dodaj slike</button>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
<asset:javascript src="vendor/aos/aos.js"/>
<asset:javascript src="vendor/bootstrap/js/bootstrap.bundle.min.js"/>
<asset:javascript src="vendor/glightbox/js/glightbox.min.js"/>
<asset:javascript src="vendor/isotope-layout/isotope.pkgd.min.js"/>
<asset:javascript src="vendor/swiper/swiper-bundle.min.js"/>
<asset:javascript src="vendor/php-email-form/validate.js"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<asset:javascript src="main.js"/>
<script>
    let showSalonUrl = "${g.createLink(controller: 'salon', action:'showSalon')}"
</script>
</body>
</html>
