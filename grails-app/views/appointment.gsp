<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 28.5.24.
  Time: 19:53
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${ime}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.1.4/dist/js/splide.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.1.4/dist/css/splide.min.css" rel="stylesheet">
    <asset:stylesheet src="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
    <asset:stylesheet src="profile.css"/>
    <asset:stylesheet src="appointment.css"/>
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
                <li><g:link action="impression" controller="profile" class="nav-link scrollto">Utisci</g:link></li>
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

<div class="container-app" id="showSalons">
    <span>
        <div style="position: relative">

        </div>

        <div style="position: relative" class="salon">
            <a id="likeButton">
                <span>
                    %{--                    class="bi-heart"--}%
                    <i id="liked"></i>
                </span>
                Sviđa mi se
            </a>

            <h1>${ime}
                <br>
                <small>${tipSalona}</small>
            </h1>

            <div class="workHours">
                Radno vrijeme: ${radnoVrijeme}
                <br>
                Radi: ${radniDani}
            </div>
        </div>
        <div class="image">
            <section id="image-carousel" class="splide" aria-label="Beautiful Images">
                <div class="splide__track">
                    <ul class="splide__list" id="listImg">
%{--                        <li class="splide__slide">--}%
%{--                            <asset:image src="nail1.jpg"/>--}%
%{--                        </li>--}%
%{--                        <li class="splide__slide">--}%
%{--                            <asset:image src="nail2.jpg"/>--}%
%{--                        </li>--}%
%{--                        <li class="splide__slide">--}%
%{--                            <asset:image src="nail3.jpg"/>--}%
%{--                        </li>--}%

                    </ul>
                </div>
            </section>
        </div>
        <div class="services">
            <ul id="tabs" class="nav nav-tabs vspace hscroll">
                <li class="nav__item"><a class="nav__link" href="#tab-1">Cjenovnik</a></li>
                <li class="nav__item"><a class="nav__link" href="#tab-2">O salonu</a></li>
            </ul>
        </div>

        <section class="section section-1" id="tab-1">

                <div id="services-tab">
                    <div class="row">
                        <div class="col-md-9" id="list-container">
                            <div class="service-category">
                                <div class="mt-lg">
                                    <h2 class="titleService">

                                    </h2>
                                </div>

                                <div class="service-list" id="service-1">

                                </div>
                            </div>

                            <div class="service-category"></div>

                            <div class="service-category"></div>
                        </div>
                    </div>
                </div>

                <div id="page-fixed-footer" class="navbar navbar-default navbar-fixed-bottom hidden">
                    <div class="container" id="serviceButton">
                        <div class="row p-sm">
                            <div id="footer-service-cnt" class="col-md-6 col-xs-6 lead">
                                <div>Izabrali ste <span id="service-selected-cnt"></span></div>

                                <div class="strong"><span id="service-selected-value"></span> €</div>
                            </div>

                            <div class="col-md-3 col-xs-6">
                                <button type="button" class="btn btn-primary" data-toggle="modal"
                                        data-target="#serviceModal" id="choose-time">
                                    Izaberite vrijeme
                                </button>

                            </div>
                        </div>
                    </div>
                </div>

        </section>
        <section class="section section-2" id="tab-2">
            <div>
                <div id="about">
                    <div class="row">
                        <h1>${tipSalona} ${ime}</h1>

                        <p>${ulica}</p>

                        <p>${grad}</p>

                        <p>Usluge oglašava i obavlja pravno lice:
                        ${ime}, ${ulica}, ${grad}. PIB broj: -</p>
                    </div>
                    <br>

                    <div class="row aboutCard">
                        <div class="col-4">
                            <div>
                                <fieldset>
                                    <div class="card" style="width: 18rem;">
                                        <div class="card-body">
                                            <h5 class="card-title"><legend class="workingHours"
                                                                           style="padding: 20px">Radno vrijeme</legend>
                                            </h5>

                                            <p class="card-text">
                                            <ul id="workDaysList"></ul>
                                        </p>

                                        </div>
                                    </div>

                                </fieldset>
                            </div>
                        </div>

                        <div class="col-4">
                            <div>
                                <div class="card" style="width: 18rem;">
                                    <div class="card-body">
                                        <h5 class="card-title"><legend class="workingHours"
                                                                       style="padding: 20px">Načini plaćanja</legend>
                                        </h5>

                                        <p class="card-text" style="padding: 60px">
                                            Gotovinsko
                                        </p>

                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="col-4">
                            <div>
                                <div class="card" style="width: 18rem;">
                                    <div class="card-body">
                                        <h5 class="card-title"><legend class="workingHours"
                                                                       style="padding: 20px">Upoznajte tim</legend></h5>

                                        <p class="card-text" id="employees">

                                        </p>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="row"></div>
                </div>
            </div>
        </section>

        <div class="endOfClass">

        </div>

    </span>
</div>

<div class="modal fade" id="serviceModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="serviceModalLongTitle">Izaberi vrijeme</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="closeButton">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <input type="date" id="selectDate">

                <select id="selectTime">

                </select>
                <select id="selectEmployee">

                </select>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="closeModal">Zatvori</button>
                <button type="button" class="btn btn-primary" id="submit-cart">Sačuvaj</button>
            </div>
        </div>
    </div>
</div>
<script>

</script>
<script>
    let id = ${id};
    let type = ${tip};
    %{--let idByType = ${idByType};--}%
    let getSalonDataUrl = "${g.createLink(controller: 'home', action: 'getSalonData')}";
    let servicesAndPricesUrl = "${g.createLink(controller: 'home', action: 'getServicesAndPrices')}";
    let getWorkDaysAndHoursUrl = "${g.createLink(controller: 'home', action: 'getWorkDaysAndHours')}";
    let getServiceTypeUrl = "${g.createLink(controller: 'home', action: 'getServiceType')}";
    let getSalonDataByTypeUrl = '${g.createLink(controller: 'home', action: 'getSalonDataByType')}';
    let makeAppointmentUrl = "${g.createLink(controller: 'home', action: 'makeAppointment')}"
    let submitCartUrl = "${g.createLink(controller: 'home', action: 'submitCart')}";
    let saveLikedSalonsUrl = "${g.createLink(controller: 'home', action: 'saveLikedSalons')}";
    let deleteLikedSalonUrl = "${g.createLink(controller: 'home', action: 'deleteLikedSalon')}";
    let isLikedUrl = "${g.createLink(controller: 'home', action: 'isLiked')}";
    let showWorkHoursUrl = "${g.createLink(controller: 'home', action: 'showWorkHours')}";
    let findFreeTimeUrl = "${g.createLink(controller: 'home', action:'getTime')}";
    let showEmployeesUrl = "${g.createLink(controller: 'home', action:'showEmployees')}";
    let findImageForSalonUrl = "${g.createLink(controller: 'profile', action: 'findImageForSalon')}";
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous">
</script>
<asset:javascript src="salonById.js"/>
<asset:javascript src="salonByType.js"/>
<script>
    document.addEventListener( 'DOMContentLoaded', function () {
        new Splide( '#image-carousel' ).mount();
    } );
</script>
</body>
</html>