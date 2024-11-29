<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 23.5.24.
  Time: 11:49
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Saloni po gradovima</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <asset:stylesheet src="vendor/bootstrap/css/bootstrap.min.css"/>
    <asset:stylesheet src="cosmeticSalon.css"/>
    <asset:javascript src="vendor/js/bootstrap.min.js"/>

</head>

<body>
<header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">
        <h1 class="logo"><g:link controller="profile" action="index">Profil</g:link></h1>
        <nav id="navbar" class="navbar">
            <ul>
                <li><g:link action="index" controller="home" class="nav-link scrollto active">Početna</g:link></li>
                <li><g:link action="search" controller="profile" class="nav-link scrollto">Istražite</g:link></li>
                <li><g:link action="lookbook" controller="profile">LookBook</g:link></li>
                <li><g:link action="impression" controller="profile" class="nav-link scrollto">Utisci</g:link></li>
                <li><g:link action="likes" controller="profile" class="nav-link scrollto">Sviđanja</g:link></li>
                <li><g:link action="appointment" controller="profile"
                            class="nav-link scrollto">Zakazivanja</g:link></li>
                <li><g:link controller="profile" action="index" class="nav-link scrollto">Profil</g:link></li>
                <li><a class="nav-link scrollto" id="logout">Izloguj se</a></li>
            </ul>

        </nav>

    </div>
</header>
<div class="container" id="showSalons">
    <div>
        <div class="container-fluid" id="cityName">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <ul></ul>
                    </div>
                </div>

                <div class="hidden" id="filter">
                    <div class="filter">
                        <div class="col"></div>

                        <div class="col"></div>

                        <div class="col"></div>

                        <div class="col"></div>

                        <div class="col"></div>

                        <div class="col"></div>

                        <div class="col"></div>

                        <div class="col"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container" id="salon">
            <div class="row">
                <div class="row" id="container_salon">
                    <ul></ul>

                    <h1></h1>

                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script>
    let id = ${id};
    let showCityNameUrl = "${g.createLink(controller: 'home', action: 'showCityName')}"
    let showAllSalonsAndServicesByCityUrl = "${g.createLink(controller: 'home', action: 'showAllSalonsAndServicesByCity')}";
    let showAllServicesForSalonUrl = '${g.createLink(controller: 'home', action: 'showAllServicesForSalon')}';
    let showAllImagesForSalonByCityUrl = '${g.createLink(controller: 'home', action: 'showAllImagesForSalonByCity')}';
    let showSalonByIdUrl = "${g.createLink(controller: 'home', action: 'showSalonById')}";
    let getDataForSalonUrl = "${g.createLink(controller: 'home', action: 'getDataForSalon')}";
</script>
<asset:javascript src="city.js"/>
</body>
</html>