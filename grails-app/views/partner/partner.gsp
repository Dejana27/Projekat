<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 28.3.24.
  Time: 12:16
--%>

%{--<%@ page contentType="text/html;charset=UTF-8" %>--}%
<html lang="en">

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
    <asset:stylesheet src="partner.css"/>

</head>

<body>

<!-- ======= Header ======= -->
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
                                <li><g:link action="marketingKlijent" controller="partner"> Nađite nove klijente</g:link></li>
                                <li><a href="#">Budite organizovani</a></li>

                            </ul>
                        </li>
                        <li><a class="nav-link scrollto o" href="#">Softver za salone</a></li>
                        <li><a class="nav-link scrollto" href="#">Cjenovnik</a></li>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav><!-- .navbar -->
            <g:link controller="main" action="index" class="btn-login"> Uloguj se </g:link>
            </div>
        </div>

    </div>
</header><!-- End Header -->

<!-- ======= Hero Section ======= -->
<section id="hero" class="section section--hidden d-flex flex-column justify-content-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-8">
                <h1>SrediMe - PARTNERI</h1>

                <h2>Postani partner besplatno i pridruži se najvećem online servisu za reklamiranje i zakazivanje salona ljepote.</h2>

                <p>Otvorite vrata svog biznisa hiljadama zadovoljnih klijenata i unaprijedite Vaše poslovanje.</p>
                <g:link controller="partner" action="registerSalon" class="btn-register">Prijavite svoj salon</g:link>
            </div>
        </div>
    </div>
</section><!-- End Hero -->

<main id="main">

    <!-- ======= About Us Section ======= -->
    <section id="about" class="about section section--hidden">
        <div class="container">

            <div class="section-title">
                <br>

                <h2>
                    Sa SrediMe kao partnerom Vaš salon se može fokusirati na ono što radi najbolje - vrhunsko sređivanje klijenata, a mi ćemo se
                    pobrinuti za ostalo!
                </h2>
                <br>
            </div>

            <div class="row content">
                <div class="col-lg-6">

                    <p>
                        SrediMe je napravljen da poboljša način kako se pronalaze i zakazuju saloni ljepote, estetske klinike i SPA centri.
                        SrediMe je fokusiran na digitalizaciju u oblasti usluga ljepote sa ciljem da se na bolji način povežu korisnici
                        i saloni na zadovoljstvo obje strane.

                    </p>
                </div>

                <div class="col-lg-6 pt-4 pt-lg-0">
                    <p>
                        Kao potpuno novi kanal prodaje, salonima olakšavamo nalaženje klijenata,
                        a korisnicima omogućavamo lako i efikasno nalaženje dobrih salona i zakazivanje slobodnih termina u njima.
                    </p>
                    <a href="#" class="btn-learn-more">Saznaj više</a>
                </div>
            </div>

        </div>
    </section><!-- End About Us Section -->

<!-- ======= Services Section ======= -->
    <section id="services" class="services section section--hidden">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
                    <div class="icon-box">
                        <div class="icon"><i class="bi-laptop"></i></div>
                        <h4><a href="">Budite vidljivi</a></h4>

                        <p>SrediMe je najveća regionalna platforma za usluge ljepote sa desetinama hiljada redovnih korisnika - ponudite im svoje usluge besplatno!</p>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
                    <div class="icon-box">
                        <div class="icon"><i class="bi-person"></i></div>
                        <h4><a href="">Nađite nove klijente</a></h4>

                        <p>Zadobijte nove klijente i primajte zakazivanja 24 sata dnevno, čak i kada ne radite, bez trošenja vremena na pozive.</p>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
                    <div class="icon-box">
                        <div class="icon"><i class="bi-heart"></i></div>
                        <h4><a href="">Zadržite klijente</a></h4>

                        <p>Iznenadite svoje klijente modernim alatima za zakazivanje, podsjetnicima i zapamćenim napomenama za svakog klijenta.</p>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
                    <div class="icon-box">
                        <div class="icon"><i class="bi-calendar-heart"></i></div>
                        <h4><a href="">Budite organizovani</a></h4>

                        <p>Uštedite svoje dragocjeno vrijeme i vrijeme svojih zaposlenih automatizacijom prvoklasnim besplatnim alatima. Preuzmite kontrolu nad svojim biznisom.</p>
                    </div>
                </div>
            </div>

        </div>
    </section><!-- End Services Section -->

    <section id="cta" class="cta section section--hidden">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 text-center text-lg-start">
                    <h3>Postanite premium partner</h3>

                    <p></p>
                </div>

                <div class="col-lg-3 cta-btn-container text-center">
                    <a class="cta-btn align-middle" href="#">Prijava</a>
                </div>
            </div>
        </div>
    </section>

    <!-- ======= Features Section ======= -->
    <section id="features" class="features section section--hidden">
        <div class="container">
            <div class="section-title">
                <br>

                <h2>
                    Pametno rješenje za sve vrste salona ljepote i SPA centre
                </h2>
                <br>
            </div>

            <div class="row">
                <div class="col-lg-6 order-2 order-lg-1">
                    <div class="icon-box mt-5 mt-lg-0">
                        <i class="bi-check"></i>
                        <h4>Frizerski saloni</h4>
                    </div>

                    <div class="icon-box mt-5">
                        <i class="bi-check"></i>
                        <h4>Masažni studio</h4>
                    </div>

                    <div class="icon-box mt-5">
                        <i class="bi-check"></i>
                        <h4>Estetski centar</h4>
                    </div>

                    <div class="icon-box mt-5">
                        <i class="bi-check"></i>
                        <h4>Studio ljepote</h4>
                    </div>

                    <div class="icon-box mt-5">
                        <i class="bi-check"></i>
                        <h4>SPA centri</h4>
                    </div>

                    <div class="icon-box mt-5">
                        <i class="bi-check"></i>
                        <h4>Kozmetički saloni</h4>
                    </div>

                    <div class="icon-box mt-5">
                        <i class="bi-check"></i>
                        <h4>Make-up studio</h4>
                    </div>

                    <div class="icon-box mt-5">
                        <i class="bi-check"></i>
                        <h4>Berbernica</h4>
                    </div>

                    <div class="icon-box mt-5">
                        <i class="bi-check"></i>
                        <h4>Nail salon</h4>
                    </div>
                </div>

                <div class="image col-lg-6 order-1 order-lg-2"></div>
            </div>

        </div>
    </section>
    <section id="other section section--hidden">
        <div class="container">
            <div class="section-title">
                <br>

                <h1>Mediji o SrediMe</h1>
                <br>
            </div>

            <div class="row content other">
                <div class="col-lg-4">
                    <asset:image src="men.jpeg" class="img_other"/>
                    <blockquote class="quotes">
                        Posjetite SrediMe online, besplatni servis za zakazivanje tretmana u kozmetičkim salonima
                        i odaberite tretmane koji će vam pomoći da se na brzaka vratite u top formu.
                    </blockquote>
                </div>

                <div class="col-lg-4">
                    <asset:image src="cosmopolitan.png" class="img_other"/>
                    <blockquote class="quotes">
                        Sve tretmane možete vrlo jednostavno i bez muke zakazati na SrediMe
                        i na taj način pojednostaviti i ubrzati svoju pripremu za posebnu priliku.
                    </blockquote>
                </div>

                <div class="col-lg-4">
                    <asset:image src="elle.png" class="img_other"/>
                    <blockquote class="quotes">
                        Ako ste još uvek neodlučni pogledajte ponudu kozmetičkih salona na SrediMe i
                        zakažite svoj najdraži izabrani tretman za put do glatke i nježne kože!
                    </blockquote>
                </div>
            </div>
        </div>
    </section>
    <section id="adds" class="section section--hidden">
        <div class="container">
            <div class="section-title">
                <h1>Efikasna marketinška, prodajna i softverska rješenja za rast Vašeg salona,
                klinike ili estetskog centra</h1>
            </div>

            <div class="row add1">
                <div class="col-sm-6 box_1">
                    <div class="box_text">
                        <b class="box_link">BUDITE VIDLJIVI</b>

                        <h1 class="box_heading">Neka svi vide koliko ste posebni</h1>
                        <br>

                        <p>Hiljade korisnika Interneta traga za svojim novim omiljenim salonom na SrediMe. Neka im to postane baš Vaš salon.</p>
                    </div>

                    <div class="box_button">
                        <button class="btn-add1">Kako da reklamiram salon?</button>
                    </div>
                </div>

                <div class="col-sm-6 add_img">
                    <asset:image src="meeting.png" class="first"/>
                </div>
            </div>
            <br>

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
    <!-- ======= Counts Section ======= -->
    <section id="counts" class="counts section">
        <div class="container">

            <div class="text-center title">
                <h2>Šta smo postigli do sad?</h2>
                <br>
                <h5>Više od 1000 zadovoljnih partnerskih salona.</h5>

                <p>SrediMe radi samo sa registrovanim i provjereno dobrim salonima ljepote i estetskim centrima, širom regije.
                Rezultat toga je da imamo i zadovoljne partnere i zadovoljne korisnike koji su salonima u prosjeku dali ocjenu 9.6 od 10.</p>
            </div>
            <br>
            <br>

            <div class="row counters position-relative">
                <div class="col-lg-5 col-6 text-center">
                    <span data-purecounter-start="0" data-purecounter-end="521" data-purecounter-duration="1"
                          class="purecounter"></span>

                    <h2>100 000+ zadovoljnih korisnika.</h2>
                    <br>
                    <br>

                    <p>SrediMe korisnici su pretežno mladi i srednjih godina, 80% korisnika su ženskog pola, sa nadprosječnim prihodima, iz naše zemlje, regije, ali i iz inostranstva,
                    otvoreni za nove tehnologije i nove vrste tretmana ljepote, a fokus stavljaju na kvalitet usluge i udobnost, prije nego na cijene.</p>
                </div>

                <div class="col-lg-7 col-6 text-center">
                    <asset:image src="peoplesmiling.jpg" class="count_img"/>
                </div>

            </div>

        </div>
    </section><!-- End Counts Section -->
%{--    <!-- ======= Faq Section ======= -->--}%
    <section id="faq" class="faq section section--hidden">
        <div class="container-fluid">

            <div class="row">

                <div class="col-lg-7 d-flex flex-column justify-content-center align-items-stretch  order-2 order-lg-1">

                    <div class="content">
                        <h3>Najčešće postavljana <strong>pitanja</strong></h3>
                    </div>

                    <div class="accordion-list">
                        <ul>
                            <li>
                                <a data-bs-toggle="collapse" class="collapse"
                                   data-bs-target="#accordion-list-1">Kako da se postavim svoj salon ili kliniku na SrediMe? <i
                                        class="bx bx-chevron-down icon-show"></i><i
                                        class="bx bx-chevron-up icon-close"></i></a>

                                <div id="accordion-list-1" class="collapse show" data-bs-parent=".accordion-list">
                                    <p>
                                        Procedura je vrlo jednostavna i brza. Dovoljno je da popunite  Prijavu partnera i
                                        kontaktiraćemo Vas kako bismo što prije postavili Vaš salon na SrediMe.
                                    </p>
                                </div>
                            </li>

                            <li>
                                <a data-bs-toggle="collapse" data-bs-target="#accordion-list-2"
                                   class="collapsed">Kako SrediMe naplaćuje usluge? <i
                                        class="bx bx-chevron-down icon-show"></i><i
                                        class="bx bx-chevron-up icon-close"></i></a>

                                <div id="accordion-list-2" class="collapse" data-bs-parent=".accordion-list">
                                    <p>
                                        Pristupanje, softver, unos podataka, ažuriranje i konsalting uopšte ne naplaćujemo. Plaća se samo provizija za dovođenje klijenata preko SrediMe platforme i to ili fiksno ili procentualno,
                                        zavisno od tarifnog paketa koji izaberete. Pogledajte cjenovnik za detalje.
                                    </p>
                                </div>
                            </li>

                            <li>
                                <a data-bs-toggle="collapse" data-bs-target="#accordion-list-3"
                                   class="collapsed">Da li postoji ugovorna obaveza?<i
                                        class="bx bx-chevron-down icon-show"></i><i
                                        class="bx bx-chevron-up icon-close"></i></a>

                                <div id="accordion-list-3" class="collapse" data-bs-parent=".accordion-list">
                                    <p>
                                        Ne, SrediMe je uvjeren u efikasnost i vrijednost za partnere, tako da ne postoji bilo kakvo uslovljavanje
                                        - ukoliko Vam se ne sviđa možete bilo kada da prekinete saradnju.
                                    </p>
                                </div>
                            </li>
                            <li>
                                <a data-bs-toggle="collapse" data-bs-target="#accordion-list-4"
                                   class="collapsed">Da li podržavate zakazivanja na Facebooku, Instagramu i na sajtu mog salona?<i
                                        class="bx bx-chevron-down icon-show"></i><i
                                        class="bx bx-chevron-up icon-close"></i></a>

                                <div id="accordion-list-4" class="collapse" data-bs-parent=".accordion-list">
                                    <p>
                                        Da, i to besplatno! SrediMe zakazivanja možete integrisati u svoju Facebook stranu, Instagram profil ili na svoj sajt i tako dobijena zakazivanja se ne naplaćuju.
                                        Ukoliko nemate sajt, stranica za zakazivanje koju će Vam SrediMe napraviti može da služi i kao sajt!
                                    </p>
                                </div>
                            </li>
                            <li>
                                <a data-bs-toggle="collapse" data-bs-target="#accordion-list-5"
                                   class="collapsed">U kojim gradovima je SrediMe dostupan?<i
                                        class="bx bx-chevron-down icon-show"></i><i
                                        class="bx bx-chevron-up icon-close"></i></a>

                                <div id="accordion-list-5" class="collapse" data-bs-parent=".accordion-list">
                                    <p>
                                        SrediMe radi u većim gradovima Crne Gore i regije.
                                        Ukoliko još uvijek ne radimo u Vašem gradu, prijavite se i možemo da otvorimo servis i za vaš grad.
                                    </p>
                                </div>
                            </li>
                            <li>
                                <a data-bs-toggle="collapse" data-bs-target="#accordion-list-6"
                                   class="collapsed">Da li moramo sami da unosimo cjenovnik i ažuriramo cijene?<i
                                        class="bx bx-chevron-down icon-show"></i><i
                                        class="bx bx-chevron-up icon-close"></i></a>

                                <div id="accordion-list-6" class="collapse" data-bs-parent=".accordion-list">
                                    <p>
                                        Ne, naša korisnička podrška to može uraditi besplatno za Vas.
                                        Naravno, ukoliko to želite možete i samostalno da ažurirate cjenovnik i sve podatke o svom salonu.
                                    </p>
                                </div>
                            </li>
                            <li>
                                <a data-bs-toggle="collapse" data-bs-target="#accordion-list-7"
                                   class="collapsed">Koliko se plaća korišćenje salonskog softvera?<i
                                        class="bx bx-chevron-down icon-show"></i><i
                                        class="bx bx-chevron-up icon-close"></i></a>

                                <div id="accordion-list-7" class="collapse" data-bs-parent=".accordion-list">
                                    <p>
                                        Za razliku od drugih softverskih rješenja na tržištu, naš softver je besplatan.Detaljnije o Buker aplikaciji.
                                    </p>
                                </div>
                            </li>
                            <li>
                                <a data-bs-toggle="collapse" data-bs-target="#accordion-list-8"
                                   class="collapsed">Da li nudite SMS napomene korisnicima prije termina?<i
                                        class="bx bx-chevron-down icon-show"></i><i
                                        class="bx bx-chevron-up icon-close"></i></a>

                                <div id="accordion-list-8" class="collapse" data-bs-parent=".accordion-list">
                                    <p>
                                        Da, nudimo email i SMS podsjetnike korisnicima prije zakazanog termina. Napomene su besplatne za sva SrediMe zakazivanja. Za zakazivanja Vaših direktnih klijenata su besplatni email podsjetnici,
                                        dok se SMS za takva zakazivanja naplaćuju minimalno, u skladu sa Cjenovnikom.
                                    </p>
                                </div>
                            </li>

                        </ul>
                    </div>

                </div>

                <div class="col-lg-5  align-items-stretch order-1 order-lg-2 img">&nbsp;
                </div>
            </div>

        </div>
    </section><!-- End Faq Section -->
    <!-- ======= Contact Section ======= -->
        <section id="contact" class="contact section section--hidden">
            <div class="container">

                <div class="section-title">
                    <h2>Contact</h2>
                </div>
            </div>


            <div class="container">

                <div class="row mt-5">

                    <div class="col-lg-4">
                        <div class="info">
                            <div class="address">
                                <i class="ri-map-pin-line"></i>
                                <h4>Lokacija:</h4>
                                <p>4 Ivana Vujoševića, Podgorica</p>
                            </div>

                            <div class="email">
                                <i class="ri-mail-line"></i>
                                <h4>Email:</h4>
                                <p>sredime@gmail.com</p>
                            </div>

                            <div class="phone">
                                <i class="ri-phone-line"></i>
                                <h4>Call:</h4>
                                <p>+382 67 000 000</p>
                            </div>

                        </div>

                    </div>

                    <div class="col-lg-8 mt-5 mt-lg-0">

                        <form action="forms/contact.php" method="post" role="form" class="php-email-form">
                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <input type="text" name="name" class="form-control" id="name" placeholder="Vaše ime" required>
                                </div>
                                <div class="col-md-6 form-group mt-3 mt-md-0">
                                    <input type="email" class="form-control" name="email" id="email" placeholder="Vaš email" required>
                                </div>
                            </div>
                            <div class="form-group mt-3">
                                <input type="text" class="form-control" name="subject" id="subject" placeholder="Tema" required>
                            </div>
                            <div class="form-group mt-3">
                                <textarea class="form-control" name="message" rows="5" placeholder="Poruka" required></textarea>
                            </div>
                            <div class="my-3">
                                <div class="loading">Loading</div>
                                <div class="error-message"></div>
                                <div class="sent-message">Vaša poruka je poslata. Hvala!</div>
                            </div>
                            <div class="text-center"><button type="submit">Pošaljite poruku</button></div>
                        </form>

                    </div>

                </div>

            </div>
        </section><!-- End Contact Section -->

</main><!-- End #main -->

<!-- ======= Footer ======= -->
%{--<footer id="footer">--}%
%{--    <div class="container">--}%
%{--        <h3>KnightOne</h3>--}%
%{--        <p>Et aut eum quis fuga eos sunt ipsa nihil. Labore corporis magni eligendi fuga maxime saepe commodi placeat.</p>--}%
%{--        <div class="social-links">--}%
%{--            <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>--}%
%{--            <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>--}%
%{--            <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>--}%
%{--            <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>--}%
%{--            <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>--}%
%{--        </div>--}%
%{--        <div class="copyright">--}%
%{--            &copy; Copyright <strong><span>KnightOne</span></strong>. All Rights Reserved--}%
%{--        </div>--}%
%{--        <div class="credits">--}%
%{--            <!-- All the links in the footer should remain intact. -->--}%
%{--            <!-- You can delete the links only if you purchased the pro version. -->--}%
%{--            <!-- Licensing information: https://bootstrapmade.com/license/ -->--}%
%{--            <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/knight-simple-one-page-bootstrap-template/ -->--}%
%{--            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>--}%
%{--        </div>--}%
%{--    </div>--}%
%{--</footer><!-- End Footer -->--}%

%{--<div id="preloader"></div>--}%
%{--<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>--}%

<!-- Vendor JS Files -->
<asset:javascript src=" vendor/purecounter/purecounter_vanilla.js"/>
<asset:javascript src="vendor/bootstrap/js/bootstrap.bundle.min.js"/>
<asset:javascript src="vendor/glightbox/js/glightbox.min.js"/>
%{--<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>--}%
%{--<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>--}%
%{--<script src="assets/vendor/php-email-form/validate.js"></script>--}%

%{--<!-- Template Main JS File -->--}%
%{--<script src="assets/js/main.js"></script>--}%
<asset:javascript src="partner.js"/>
</body>

</html>