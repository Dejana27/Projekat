<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 28.5.24.
  Time: 20:05
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">
    <asset:stylesheet src="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
    <asset:stylesheet src="likes.css"/>
    <title>Sviđanja</title>
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
%{--            <i class="bi bi-list mobile-nav-toggle"></i>--}%
        </nav>

    </div>
</header>
<h2>Sviđanja</h2>
<div class="likes">

            <div class="liked">
                <ul id="tabs" class="nav nav-tabs vspace hscroll">
                    <li class="nav__item"><g:link controller="home" action="showLikedSalons" class="nav__link">Saloni</g:link></li>
                    <li class="nav__item"><g:link controller="home" action="showLikedLookBooks" class="nav__link">LookBook</g:link></li>
                </ul>
            </div>

</div>
<asset:javascript src="search.js"/>
%{--<asset:javascript src="likes.js"/>--}%
</body>
</html>