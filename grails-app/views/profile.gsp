<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>Profil</title>
    <meta content="" name="description">
    <meta content="" name="keywords">


    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

    <!-- Vendor CSS Files -->

    <asset:stylesheet src="./vendor/aos/aos.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/boxicons/css/boxicons.min.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/glightbox/css/glightbox.min.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/remixicon/remixicon.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/swiper/swiper-bundle.min.css" rel="stylesheet"/>
    <!-- Template Main CSS File -->
    <asset:stylesheet src="profile.css" rel="stylesheet"/>
</head>

<body>

<header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between" id="container">

        <h1 class="logo"><g:link controller="profile" action="index">Profil</g:link></h1>

        <nav id="navbar" class="navbar">
            <ul>
                <li><g:link action="index" controller="home" class="nav-link scrollto active">Početna</g:link></li>
                <li><g:link action="search" controller="profile" class="nav-link scrollto">Istražite</g:link></li>
                <li><g:link action="showAllHairstyles" controller="home">LookBook</g:link></li>
                <li><g:link action="likes" controller="profile" class="nav-link scrollto">Sviđanja</g:link></li>
                <li><g:link action="appointment" controller="profile"
                            class="nav-link scrollto">Zakazivanja</g:link></li>
                <li><g:link controller="profile" action="index" class="nav-link scrollto">Profil</g:link></li>
                <li><a class="nav-link scrollto" id="logout">Izloguj se</a></li>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav>

    </div>
</header>
<!-- ======= Hero Section ======= -->
<section id="hero" class="d-flex align-items-center">
    <div class="container position-relative" data-aos="fade-up" data-aos-delay="100">
        <div class="row justify-content-center" id="welcomeMessage">
            <div class="col-xl-7 col-lg-9 text-center heading">
                <h1>Dobrodošli, ${name} <i class="bi-pen" class="btn-block btn-primary btn" type="submit"
                                           value="Izmijeni" id="editButton"></i></h1>

                %{--                <h1>${name} <i class="bi-pen" class="btn-block btn-primary btn" type="submit" value="Izmijeni" id="editButton"></i></h1>--}%

            </div>
        </div>


        <div class="row icon-boxes">
            <div class="col-md-6 col-lg-4 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="zoom-in"
                 data-aos-delay="200">
                <g:link action="appointment" controller="profile">
                    <div class="icon-box">
                        <div class="icon"><i class="bi-calendar"></i></div>
                        <h4 class="title">Zakazivanja</h4>

                        <p class="description">Upravljajte svojim zakazanim terminima.</p>
                    </div>
                </g:link>
            </div>

            <div class="col-md-6 col-lg-4 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="zoom-in"
                 data-aos-delay="300">
                <g:link action="likes" controller="profile">
                    <div class="icon-box">
                        <div class="icon"><i class="bi-hearts"></i></div>
                        <h4 class="title">Sviđanja</h4>

                        <p class="description">Saloni i slike koje Vam se sviđaju na profilu.</p>
                    </div>
                </g:link>
            </div>

            <div class="col-md-6 col-lg-4 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="zoom-in"
                 data-aos-delay="400">
                <g:link action="impression" controller="profile">
                    <div class="icon-box">
                        <div class="icon"><i class="bi-heart"></i></div>
                        <h4 class="title">Utisci</h4>

                        <p class="description">Utisci i ocjene salona koje ste objavili. &nbsp &nbsp</p>
                    </div>
                </g:link>
            </div>

        </div>

        <div class="row icon-boxes" style="padding-bottom: 80px">

            <div class="col-md-6 col-lg-4 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="zoom-in"
                 data-aos-delay="500">
                <g:link action="update" controller="profile">
                    <div class="icon-box">
                        <div class="icon"><i class="bi-person-rolodex"></i></div>
                        <h4 class="title">Nalog</h4>

                        <p class="description">Vaši podaci za prijavu i broj telefona. &nbsp &nbsp &nbsp &nbsp</p>
                    </div>
                </g:link>
            </div>

            <div class="col-md-6 col-lg-4 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="zoom-in"
                 data-aos-delay="600">
                <g:link action="faq" controller="profile">
                    <div class="icon-box">
                        <div class="icon"><i class="bi-patch-question-fill"></i></div>
                        <h4 class="title">Pitanja</h4>

                        <p class="description">Najčešća pitanja i odgovori. &nbsp  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</p>
                    </div>
                </g:link>
            </div>

            <div class="col-md-6 col-lg-4 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="zoom-in"
                 data-aos-delay="700">
                <g:link action="index" controller="partner">
                    <div class="icon-box">
                        <div class="icon"><i class="bi-search-heart"></i></div>
                        <h4 class="title">Izlistajte svoj salon.</h4>

                        <p class="description">Za vlasnike salona ljepote.  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</p>
                    </div>
                </g:link>
            </div>
        </div>
    </div>
</section><!-- End Hero -->

<!-- Vendor JS Files -->
<asset:javascript src="vendor/purecounter/purecounter_vanilla.js"/>
<asset:javascript src="vendor/aos/aos.js"/>
<asset:javascript src="vendor/bootstrap/js/bootstrap.bundle.min.js"/>
<asset:javascript src="vendor/glightbox/js/glightbox.min.js"/>
<asset:javascript src="vendor/isotope-layout/isotope.pkgd.min.js"/>
<asset:javascript src="vendor/swiper/swiper-bundle.min.js"/>
%{--<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>--}%
%{--<script src="assets/vendor/php-email-form/validate.js"></script>--}%

<!-- Template Main JS File -->
%{--<script src="assets/js/main.js"></script>--}%
<script>

</script>
<asset:javascript src="profile.js"/>
</body>

</html>