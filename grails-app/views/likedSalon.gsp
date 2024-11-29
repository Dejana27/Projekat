<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 4.6.24.
  Time: 09:12
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">
    <asset:stylesheet src="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
    %{--    <asset:stylesheet src="profile.css"/>--}%
    <asset:stylesheet src="likes.css"/>
    <asset:stylesheet src="home.css"/>
    <title>Sviđanja</title>
</head>

<body>
<header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between" id="container">

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
                <li><a class="nav-link scrollto" id="logoutButton">Izloguj se</a></li>
                <li>
                    <input type="text" placeholder="Pretraga.." id="search">
                    <button type="submit" class="button-2" style="padding: 4px !important; border-radius: 10px;" id="submitSearch">
                        <i class="bi bi-search-heart" style="padding-left: 4px; padding-right: 4px; cursor: pointer;"></i>
                    </button>
                </li>
            </ul>
%{--            <i class="bi bi-list mobile-nav-toggle"></i>--}%
        </nav>

    </div>
</header>
<h1 class="h1_title">Sviđanja</h1>
<div class="likes">

    <div class="liked">
        <ul id="tabs" class="nav nav-tabs vspace hscroll">
            <li class="nav__item"><g:link controller="home" action="showLikedSalons" class="nav__link">Saloni</g:link></li>
%{--            <li class="nav__item"><g:link controller="home" action="showLikedLookBooks" class="nav__link">LookBook</g:link></li>--}%
        </ul>
    </div>

</div>
<div id="likedSalons" class="row">

</div>
<script>
    %{--let id = ${id};--}%
    let showLikedSalonsUrl = "${g.createLink(controller: 'home', action: 'showAllLikedSalons')}";
    let showImageUrl  = "${g.createLink(controller: 'home', action: 'showImage')}";
    let showLikedSalonUrl = "${g.createLink(controller: 'home', action: 'showLikedSalon')}";
    let getDataLikedSalonUrl = "${g.createLink(controller: 'home', action:'getDataLikedSalon')}";
    let showSalonByTypeUrl = '${g.createLink(controller: 'home', action: 'showSalonByType')}';
    let getSalonsByNameUrl = "${g.createLink(controller: "profile", action: "getSalonsByName")}";
    let getServicesForSalonUrl = "${g.createLink(controller: "profile", action: "getServicesForSalon")}";
    let showAllImagesForSalonByCityUrl = '${g.createLink(controller: 'home', action: 'showAllImagesForSalonByCity')}';
    let showSalonByIdUrl = "${g.createLink(controller: 'home', action: 'showSalonById')}";
    let searchByNameUrl = "${g.createLink(controller: 'profile', action: 'searchByName')}";
    let searchPageUrl = "${g.createLink(controller: 'profile', action: 'searchPage')}";
</script>
<asset:javascript src="likes.js"/>
<asset:javascript src="logout.js"/>
<asset:javascript src="search.js"/>
</body>
</html>