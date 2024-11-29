<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title> SrediMe - Početna </title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <!-- Vendor CSS Files -->
    <asset:stylesheet src="vendor/animate.css/animate.min.css" rel="stylesheet"/>
    <asset:stylesheet src="vendor/aos/aos.css" rel="stylesheet"/>
    <asset:javascript src="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <asset:stylesheet src="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
    <asset:stylesheet src="vendor/boxicons/css/boxicons.min.css" rel="stylesheet"/>
    <asset:stylesheet src="vendor/glightbox/css/glightbox.min.css" rel="stylesheet"/>
    <asset:stylesheet src="vendor/swiper/swiper-bundle.min.css" rel="stylesheet"/>


    <asset:stylesheet src="index.css"/>

</head>

<body>
<header id="header" class="fixed-top d-flex align-items-center">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-lg-between">

        <h1 class="logo me-auto me-lg-0"><a href="index.gsp">SrediMe</a></h1>

        <nav id="navbar" class="navbar order-last order-lg-0">
            <ul>
                <li><g:link action="index" controller="home" class="nav-link scrollto">Istražite</g:link></li>
                <li><g:link action="lookbook" controller="profile">LookBook</g:link></li>
                <li><g:link action="impression" controller="profile" class="nav-link scrollto">Utisci</g:link></li>
                <li><g:link action="likes" controller="profile" class="nav-link scrollto">Sviđanja</g:link></li>
                <li><g:link action="appointment" controller="profile"
                            class="nav-link scrollto">Zakazivanja</g:link></li>
                <li><g:link action="index" controller="profile" class="nav-link scrollto">Profil</g:link></li>
                <li><g:link action="index" controller="partner" class="book-a-table-btn scrollto d-none d-lg-flex">Poslovni korisnici</g:link></li>
            </ul>
            <i class="bi bi-list d-xl-none mobile-nav-toggle"></i>
        </nav>



    </div>
</header><!-- End Header -->

<!-- ======= Hero Section ======= -->
<section id="hero" class="d-flex align-items-center">
    <div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100">
        <div class="row logo_name">
            <div class="col-lg-8">
                <h1>Dobrodošli na <span>SrediMe</span></h1>
                <div class="btns">
                    <g:link action="index" controller="main"  class="btn-menu animated fadeInUp scrollto"> Login </g:link>
                    <g:link action="show" controller="register"   class="btn-book animated fadeInUp scrollto">Register</g:link>
                </div>
            </div>


        </div>
    </div>
</section><!-- End Hero -->
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

</body>
</html>
