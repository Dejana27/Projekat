<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 2.4.24.
  Time: 14:06
--%>

%{--<%@ page contentType="text/html;charset=UTF-8" %>--}%
<html>
<head>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>SrediMe-Partneri</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
              rel="stylesheet">

        <!-- Vendor CSS Files -->
        <asset:stylesheet src="vendor/bootstrap/css/bootstrap.min.css"/>
        <asset:stylesheet src="vendor/bootstrap-icons/bootstrap-icons.css"/>
        <asset:stylesheet src="vendor/boxicons/css/boxicons.min.css"/>
        <asset:stylesheet src="vendor/glightbox/css/glightbox.min.css"/>
        <asset:stylesheet src="vendor/remixicon/remixicon.css"/>
        <asset:stylesheet src="vendor/swiper/swiper-bundle.min.css"/>
        %{--    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">--}%

        <!-- Template Main CSS File -->
        <asset:stylesheet src="marketingKlijenti.css"/>
        <asset:stylesheet src="marketing.css"/>
</head>

<body>
<header id="header" class="fixed-top header-scrolled">
    <div class="container-fluid">

        <div class="row justify-content-center">
            <div class="col-xl-9 d-flex align-items-center justify-content-lg-between">
                <h1 class="logo me-auto me-lg-0"><a href="index.html">Partneri</a></h1>

                <nav id="navbar" class="navbar order-last order-lg-0">
                    <ul>
                        <li><g:link action="index" controller="partner"
                                    class="nav-link scrollto active">Početna</g:link></li>
                        <li class="dropdown"><a href="#"><span>Rješenja</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <li><g:link action="marketing" controller="partner">Budite vidljivi</g:link></li>
                                <li><g:link action="marketingKlijent" controller="partner">Nađite nove klijente</g:link></li>
                                <li><g:link action="marketing">Budite organizovani</g:link></li>

                            </ul>
                        </li>
                        <li><a class="nav-link scrollto o" href="#">Softver za salone</a></li>
                        <li><a class="nav-link scrollto" href="#">Cjenovnik</a></li>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav>
                <g:link action="registerSalon" controller="partner" class="get-started-btn scrollto">
                    POSTANITE PARTNER
                </g:link>

            </div>
        </div>

    </div>
</header>
<section id="hero" class="d-flex flex-column justify-content-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-8">

                <h1>Popunjavajte kalendar 24 sata dnevno</h1>

                <p>Budite uvijek otvoreni, nikada prezauzeti da se javite na poziv. Zaboravite na propuštene pozive, poruke koje dugo čekaju da budu odgovorene i
                gledajte kako se Vaš kalendar puni novim klijentima čak i tokom noći.</p>
                <br>
                <br>
                <br>

                <h1>SrediMe</h1>
            </div>
            <asset:image src="b.jpg" class="hero_image"/>
        </div>
    </div>
</section><!-- End Hero -->
<main id="main">
    <section id="marketing" class="marketing">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-8">
                    <br>

                    <h1>Primajte zakazivanja na svim platformama</h1>
                    <br>
                    <p>SrediMe, Facebook, Instagram, Google pretraga, Vaš sajt, bilo gdje.... Otvorite mogućnost online zakazivanja u svom salonu besplatno pomoću SrediMe rješenja za prijem zakazivanja.
                    Neka Vaši klijenti zakažu termin kada god žele i kako god žele.</p>
                    <br>
                    <br>

                    <h1>Zakazivanje na mobilnim aplikacijama</h1>
                    <p>Vaš salon će se moći zakazati i kroz popularne Android i iOS aplikacije SrediMe,
                    kako biste bili još bliže svojim klijentima, kada god im trebate.</p>
                    <br>
                    <br>

                    <h1>Samo Vaša strana za zakazivanje</h1>
                    <p>Partnerski saloni servisa SrediMe osim listinga na SrediMe dobijaju i privatnu stranicu (Widget) samo za Vaš salon sa mogućnošću online zakazivanja putem računara i mobilnih telefona.
                    Za sva zakazivanja se Vaše privatne stranice ne plaćate nikakvu proviziju - besplatna su.</p>
                </div>
            </div>
        </div>
    </section>
    <section id="adds">
        <div class="container">
            <div class="section-title">
                <h1>Efikasna marketinška, prodajna i softverska rješenja za rast Vašeg salona,
                klinike ili estetskog centra</h1>
            </div>

            <div class="row add1">
                <div class="col-sm-6 add_img">
                    <asset:image src="people.png" class="first"/>
                </div>

                <div class="col-sm-6 box_1">
                    <div class="box_text">
                        <b class="box_link1">NAĐITE NOVE KLIJENTE</b>

                        <h1 class="box_heading">Dobijajte nove klijente i kada ne radite</h1>
                        <br>

                        <p class="add_text">Ne gubite klijente jer trenutno ne radite ili ne možete da razgovarate telefonom.
                        Neka se Vaš kalendar zakazivanja puni  novim klijentima 24/7 potpuno automatski.</p>
                    </div>

                    <div class="box_button">
                        <button class="btn-add1">Kako do više zakazivanja?</button>
                    </div>
                </div>
            </div>
            <br>

            <div class="row add1">
                <div class="col-sm-6 box_1">
                    <div class="box_text">
                        <b class="box_link2">BUDITE ORGANIZOVANI</b>
                        <h1 class="box_heading1">Manje dosadnih poslova, više vremena za ono što volite</h1>
                        <br>

                        <p>Sa mnogo manje truda kontrolišite rad svog salona, sa bilo kog mjesta i u bilo koje vrijeme,
                        a dobijeno vrijeme iskoristite za ono što je stvarno bitno.</p>
                    </div>

                    <div class="box_button">
                        <button class="btn-add1">Preuzmite kontrolu</button>
                    </div>
                </div>

                <div class="col-sm-6 add_img">
                    <asset:image src="laptop.png" class="first" />
                </div>
            </div>
        </div>
    </section>
</main>
</body>
</html>