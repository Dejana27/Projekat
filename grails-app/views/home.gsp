<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 8.5.24.
  Time: 12:34
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    %{--    <meta name="layout" content="index">--}%
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.1.4/dist/js/splide.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.1.4/dist/css/splide.min.css" rel="stylesheet">
    <asset:stylesheet src="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
    <asset:stylesheet src="vendor/boxicons/css/boxicons.min.css" rel="stylesheet"/>
    <title>Početna korisnik</title>

    <asset:stylesheet src="home.css"/>
</head>

<body>
<header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">
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
                <li>
                    <input type="text" placeholder="Pretraga.." id="search">
                    <button type="submit" class="button-2" style="padding: 4px !important; border-radius: 10px;" id="submitSearch">
                        <i class="bi bi-search-heart" style="padding-left: 4px; padding-right: 4px; cursor: pointer;"></i>
                    </button>
                </li>
            </ul>

        </nav>

    </div>
</header>

<div class="main_container">
    <section id="findSalon" class="section justify-content-center" style="padding: 100px;">
        <div class="row justify-content-center">
            <br>
            <br>

            <h1>Pronađite i zakažite najbolje salone
                <a class="bold-text" href="#" onclick="showCity()"><span class="citySpan" id="city">u Podgorici</span>
                    <i class="bi bi-box-arrow-in-down citySpan"></i>
                </a>
            </h1>
        </div>
    </section>

    <div id="citySelector" class="collapse alert selectCity" style="display:none;">
        <h4 class="bi bi-pin-map cities">Izaberite svoj grad za cijelu listu salona u blizini.</h4>
        <br>

        <div class="row cities">
            <div class="col-2">
                <a class="city">
                    <b id="selectPodgorica">Podgorica</b>
                </a>
            </div>

            <div class="col-2">
                <a>
                    <b id="selectBar">Bar</b>
                </a>
            </div>

            <div class="col-2">
                <a>
                    <b id="selectBudva">Budva</b>
                </a>
            </div>

            <div class="col-2">
                <a>
                    <b id="selectCetinje">Cetinje</b>
                </a>
            </div>

            <div class="col-2">
                <a>
                    <b id="selectNiksic">Nikšić</b>
                </a>
            </div>

            <div class="col-2">
                <a>
                    <b id="selectKotor">Kotor</b>
                </a>
            </div>
        </div>

    </div>
%{--    <section>--}%
%{--        <div class="input-group rounded">--}%
%{--            <input type="search" class="form-control rounded" placeholder="Pretražite salone i usluge..."--}%
%{--                   aria-label="Search"--}%
%{--                   aria-describedby="search-addon" onclick="searchSalonsAndServices()"/>--}%
%{--            <span class="input-group-text border-0" id="search-addon">--}%
%{--                <button id="search-button" type="button" class="btn btn-secondary">--}%
%{--                    <i class="bi bi-search"></i>--}%
%{--                </button>--}%
%{--            </span>--}%
%{--        </div>--}%
%{--    </section>--}%
    <br>
    <main id="main">
        <section style="padding: 10px">
            <div class="row">
                <h2 style="padding: 40px;">
                    Kategorije usluga
                </h2>
            </div>

            <div class="row">
                <section id="image-carousel" class="splide" aria-label="Beautiful Images">
                    <div class="splide__track">
                        <ul class="splide__list">

                            <li class="splide__slide">
                                <div class="splide__slide__container" id="cosmeticSalon">
                                    <div class="card">
                                        <h4>Kozmetički saloni</h4>
                                        <asset:image src="beauty.jpg"
                                                     class="card-img-top">Kozmetički saloni</asset:image>
                                    </div>
                                </div>
                            </li>
                            <li class="splide__slide">
                                <div class="splide__slide__container" id="hairSalon">
                                    <div class="card">
                                        <h4>Frizerski saloni</h4>
                                        <asset:image src="hairstyle.jpg"
                                                     class="card-img-top">Frizerski saloni</asset:image>
                                    </div>
                                </div>
                            </li>
                            <li class="splide__slide">
                                <div class="splide__slide__container" id="nailSalon">
                                    <div class="card">
                                        <h4>Nokti</h4>
                                        <asset:image src="nailsalon.jpg" class="card-img-top">Nokti</asset:image>
                                    </div>
                                </div>
                            </li>

                            <li class="splide__slide">
                                <div class="splide__slide__container" id="massageSalon">
                                    <div class="card">
                                        <h4>Masaža</h4>
                                        <asset:image src="massage.jpg" class="card-img-top">Masaža</asset:image>
                                    </div>
                                </div>
                            </li>
                            <li class="splide__slide">
                                <div class="splide__slide__container" id="manHairSalon">
                                    <div class="card">
                                        <h4>Muški frizeri</h4>
                                        <asset:image src="manhaircut.jpg"
                                                     class="card-img-top">Muški frizeri</asset:image>
                                    </div>
                                </div>
                            </li>
                            <li class="splide__slide">
                                <div class="splide__slide__container" id="beautySalon">
                                    <div class="card">
                                        <h4>Lice</h4>
                                        <asset:image src="lice.jpg" class="card-img-top">Lice</asset:image>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </section>
            </div>
        </section>
        <section>
        <div class="row">
            <h2>Popularno</h2>
        </div>

        <div class="row">
        <div class="col-6" style="marign:10px;">
                <div class="card-title" style="padding: 10px; text-align: center; color: rgba(127,92,24,0.85); font-weight: bolder;" >
                    Frizure
                </div>
                <g:link controller="home" action="showAllHairstyles">
                    <asset:image src="womanhaircut.jpg" class="card-img-top images">Frizure</asset:image>
                </g:link>
        </div>

            <div class="col-6" style="maring:10px;">
                <div class="card-title" style="padding: 10px; text-align: center; color: rgba(127,92,24,0.85); font-weight: bolder;">
                    Svečane frizure
                </div>
                <g:link controller="home" action="showHairstyles">
                    <asset:image src="hairstylewoman.jpg" class="card-img-top images">Svečane frizure</asset:image>
                </g:link>
            </div>



        <div class="col-6">

                <div class="card-title" style="padding: 10px; text-align: center; color: rgba(127,92,24,0.85); font-weight: bolder;">
                    Nokti
                </div>
                <g:link controller="home" action="showNailsInspo">
                    <asset:image src="nailinspiration.jpg" class="card-img-top images">Nokti</asset:image>
                </g:link>
        </div>

            <div class="col-6">
                <div class="card-title" style="padding: 10px; text-align: center; color: rgba(127,92,24,0.85); font-weight: bolder;">
                    Pramenovi
                </div>
                <g:link controller="home" action="showBalayage">
                    <asset:image src="hairhighlights.jpg" class="card-img-top images">Pramenovi</asset:image>
                </g:link>
            </div>


        </div>
        </section>
        <section id="visitedSalons">
            <div class="row">
                <h2>Preporuke za Vas</h2>
            </div>
            <div class="row" id="mostVisitedSalons">

            </div>
        </section>
        <section>
        <div class="row">
            <h2>Novi saloni na SrediMe</h2>
        </div>
        <div class="row" id="newSalons">

        </div>
        </section>
    </main>
</div>


%{--<asset:javascript src="city.js"/>--}%
<script>
    let showAllSalonsByTypeUrl = "${g.createLink(controller: 'home', action: 'showAllCosmeticsSalons')}";
    let showCityUrl = "${g.createLink(controller: 'home', action: 'showCity')}";
    let showAllSalonsByCityUrl = "${g.createLink(controller: 'home', action: 'showAllSalonsByCity')}";
    let findNewestSalonsUrl = "${g.createLink(controller: 'profile', action: 'findNewestSalons')}";
    let findImageForSalonUrl = "${g.createLink(controller: 'profile', action: 'findImageForSalon')}";
    let showSalonByTypeUrl = '${g.createLink(controller: 'home', action: 'showSalonByType')}';
    let findMostVisitedSalonsUrl = "${g.createLink(controller: 'profile', action: 'findMostVisitedSalons')}";
    let searchByNameUrl = "${g.createLink(controller: 'profile', action: 'searchByName')}";
    let searchPageUrl = "${g.createLink(controller: 'profile', action: 'searchPage')}";
    let searchByServiceUrl = "${g.createLink(controller: 'profile', action: 'findSalonsByService')}";
    let getDataForSalonUrl = "${g.createLink(controller: 'home', action: 'getDataForSalon')}";
</script>
<asset:javascript src="home.js"/>
</body>
</html>