<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 4.6.24.
  Time: 14:47
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">
    <asset:stylesheet src="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
    %{--    <asset:stylesheet src="profile.css"/>--}%
    <asset:stylesheet src="appointmentChecked.css"/>
    <title>Zakazani termini</title>
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
                <li><g:link action="likes" controller="profile" class="nav-link scrollto">Sviđanja</g:link></li>
                <li><g:link action="appointment" controller="profile"
                            class="nav-link scrollto">Zakazivanja</g:link></li>
                <li><g:link controller="profile" action="index" class="nav-link scrollto">Profil</g:link></li>
                <li><a class="nav-link scrollto" id="logoutButton" style="cursor: pointer;">Izloguj se</a></li>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav>

    </div>
</header>
<h4 class="heading_title">Zakazivanja</h4>
<div class="appointments">

    <div id="showAppointments" class="row">

    </div>
</div>
<script>
    let showAppointmentUrl = "${g.createLink(controller: 'profile', action: 'showAppointmentForUser')}";
</script>
<asset:javascript src="appointmentChecked.js"/>
%{--<asset:javascript src="logout.js"/>--}%
</body>
</html>