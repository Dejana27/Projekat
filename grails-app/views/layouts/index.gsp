<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 8.5.24.
  Time: 14:33
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
%{--    <asset:stylesheet src="vendor/animate.css/animate.min.css" rel="stylesheet"/>--}%
%{--    <asset:stylesheet src="vendor/aos/aos.css" rel="stylesheet"/>--}%
%{--    <asset:stylesheet src="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>--}%
%{--    <asset:stylesheet src="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>--}%
%{--    <asset:stylesheet src="vendor/boxicons/css/boxicons.min.css" rel="stylesheet"/>--}%
%{--    <asset:stylesheet src="vendor/glightbox/css/glightbox.min.css" rel="stylesheet"/>--}%
%{--    <asset:stylesheet src="vendor/swiper/swiper-bundle.min.css" rel="stylesheet"/>--}%

    <asset:stylesheet src="navbar.css"/>
    <title></title>
</head>

<body>
<nav id="navbar" class="navbar order-last order-lg-0">
    <ul>
        <li><a class="nav-link scrollto active" href="#hero">Istražite</a></li>
        <li><a class="nav-link scrollto" href="#about">LookBook</a></li>
        <li><a class="nav-link scrollto" href="#menu">Utisci</a></li>
        <li><a class="nav-link scrollto" href="#specials">Sviđanja</a></li>
        <li><a class="nav-link scrollto" href="#events">Zakazivanja</a></li>
        <li><g:link action="index" controller="profile">Profil</g:link></li>

    </ul>
</nav>
<div class="content-page">
    <div class="content">
        <g:layoutBody/>
    </div>
</div>
</body>
</html>