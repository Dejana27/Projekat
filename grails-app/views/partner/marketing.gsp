<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 2.4.24.
  Time: 10:00
--%>

<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>SrediMe-Partneri</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

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
                </nav><!-- .navbar -->

                <a href="#about" class="get-started-btn scrollto">POSTANITE PARTNER</a>
            </div>
        </div>

    </div>
</header><!-- End Header -->
<section id="hero" class="d-flex flex-column justify-content-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-8">

                <h1>Besplatan marketing Vašeg salona</h1>

                <p>Reklame putem raznih sajtova, grupnih popusta, radija i štampe... znamo da se ih probali i da niste baš oduševljeni povratom investicije u marketing.
                Mi radimo drugačije, jer smo sigurni u efikasnost - marketing i softver Vam dajemo besplatno, a zarađujemo samo ukoliko Vi prvo zaradite.</p>
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

                    <h1>Marketinške kampanje za naše partnere</h1>
                    <br>
                    <p>Postoje razne druge online ponude za salone koji od Vas traže mjesečno ili godišnje plaćanje. Problem sa njihovom efikasnošću je u tome što su njihovi ciljevi drugačiji od Vaših ciljeva. Budući da Vam naplaćuju fiksan iznos za listing, nemaju posebnog razloga da ulažu novac u intenzivne marketinške kampanje.
                    SrediMe radi drugačije, jer zarađuje samo ukoliko Vi prvo zaradite.</p>
                    <br>
                    <br>

                    <p>Zbog toga ulažemo velika sredstva u online i offline marketing, reklamirajući i naše partnere i sam Sredime, kako bismo salonima obezbijedili što veći broj zakazivanja, što je jedini način kako zarađujemo. Naše marketinške aktivnosti takođe podižu svijest o prednostima korišćenja usluga registrovanih i
                    profesionalnih salona ljepote i estetskih klinika.</p>
                    <br>
                    <br>

                    <p>Naši i Vaši ciljevi su isti i niko drugi nije toliko jako zainteresovan da Vam obezbijedi klijente kao mi.
                    Ukoliko Vam ne dovedemo nove klijente, marketing je potpuno besplatan za Vas!</p>
                </div>
            </div>
        </div>
    </section>
    <section id="profile">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <br>

                    <h1>Zauzmite svoje mjesto na najvećoj regionalnoj platformi za zakazivanje usluga ljepote</h1>
                    <br>
                    <p>Digitalna revolucija je odavno počela i ne zaustavlja se.
                    Danas, sve više ljudi očekuje da ono što žele mogu dobiti online, bilo da je u pitanju naručivanje hrane, smještaja,
                    avio karata, ali i usluga ljepote.</p>
                    <br>

                    <h3>Vaš SrediMe profil</h3>
                    <br>

                    <p>SrediMe je centralno mjesto na kome hiljade zainteresovanih klijenata traže i pronalaze vrhunske usluge ljepote.
                    Otvorite svoj besplatan online profil na SrediMe i dobijte kompletan listing, softverska rješenja i podršku.
                    No, najvažnije od svega, dobijte veliku vidljivost svog salona!</p>
                    <br>

                    <h3>Budite rangirani na Guglu</h3>
                    <br>

                    <p>Povećajte svoju online vidljivost svojim prisutvom na SrediMe, koji će biti vidljiv na svim pretraživačima,
                    a posebno dobro rangiran na Google pretragama. Osim podataka o salonu, klijenti će moći da Vas pronađu i tražeći usluge, dijelove grada,
                    ali i preporuke drugih korisnika.</p>
                    <br>

                    <h3>Pokažite svoje umijeće</h3>
                    <br>

                    <p>SrediMe usluga LookBook direktno povezuje vaše usluge sa fotografijama tih usluga iz Vašeg salona,
                    širom otvarajući vrata Vašeg salona za sve korisnike koji vizuelno pretražuju Google po slikama usluga,
                    ne zaustavljajući se samo na pregledu slike, već dajući i mogućnost direktnog zakazivanja te usluge.
                    Pokažite po čemu ste jedinstveni!
                    </p>
                </div>
                <div class="col-lg-5">
                    <asset:image src="meeting.png"/>
                </div>
            </div>
        </div>
    </section>
    <section id="other">
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