<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 5.6.24.
  Time: 10:33
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <asset:stylesheet src="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
    <asset:stylesheet src="vendor/boxicons/css/boxicons.min.css" rel="stylesheet"/>

    <title>Svečane frizure</title>
    <asset:stylesheet src="header.css"/>
    <asset:stylesheet src="allHairstyles.css"/>
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
                <li><g:link action="likes" controller="profile" class="nav-link scrollto">Sviđanja</g:link></li>
                <li><g:link action="appointment" controller="profile"
                            class="nav-link scrollto">Zakazivanja</g:link></li>

                <li><g:link controller="profile" action="index" class="nav-link scrollto">Profil</g:link></li>
                <li><a class="nav-link scrollto" id="logout">Izloguj se</a></li>
            </ul>
            %{--            <i class="bi bi-list mobile-nav-toggle"></i>--}%
        </nav>

    </div>
</header>
<section id="hero" class="d-flex align-items-center">
    <div class="container position-relative" data-aos="fade-up" data-aos-delay="100">
        <div class="row icon-boxes">
            <div class="col-md-6 col-lg-4 d-flex align-items-stretch mb-5 mb-lg-0">
                <asset:image src="hairstyle.jpg" class="image"/>
            </div>

            <div class="col-md-6 col-lg-4 d-flex align-items-stretch mb-5 mb-lg-0">
                <asset:image src="womanhaircut.jpg" class="image"/>
            </div>

            <div class="col-md-6 col-lg-4 d-flex align-items-stretch mb-5 mb-lg-0">
                <asset:image src="hairstylewoman.jpg" class="image"/>
            </div>

        </div>

        <div class="row icon-boxes">

            <div class="col-md-6 col-lg-4 d-flex align-items-stretch mb-5 mb-lg-0">
                <asset:image src="hair.jpg" class="image"/>
            </div>

            <div class="col-md-6 col-lg-4 d-flex align-items-stretch mb-5 mb-lg-0">
                <asset:image src="hair2.jpg" class="image"/>
            </div>

            <div class="col-md-6 col-lg-4 d-flex align-items-stretch mb-5 mb-lg-0">
                <asset:image src="hair3.jpg" class="image"/>
            </div>
        </div>
        <div class="row icon-boxes">

            <div class="col-md-6 col-lg-4 d-flex align-items-stretch mb-5 mb-lg-0">
                <asset:image src="hair4.jpg" class="image"/>
            </div>

            <div class="col-md-6 col-lg-4 d-flex align-items-stretch mb-5 mb-lg-0">
                <asset:image src="hair5.jpg" class="image"/>
            </div>

            <div class="col-md-6 col-lg-4 d-flex align-items-stretch mb-5 mb-lg-0">
                <asset:image src="hair6.jpg" class="image"/>
            </div>
        </div>
    </div>
</section>
</body>
</html>