
<html>
<head>
    <title>Pretraga saloni</title>
    <asset:stylesheet src="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
    <asset:stylesheet src="vendor/boxicons/css/boxicons.min.css" rel="stylesheet"/>
    <asset:stylesheet src="vendor/bootstrap/css/bootstrap.min.css"/>
    <asset:stylesheet src="cosmeticSalon.css"/>
    <asset:stylesheet src="home.css"/>
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
    <div class="container" id="showSalons" style="margin: 80px;">

    </div>
</body>
<script>
    let getSalonsByNameUrl = "${g.createLink(controller: "profile", action: "getSalonsByName")}";
    let getServicesForSalonUrl = "${g.createLink(controller: "profile", action: "getServicesForSalon")}";
    let showAllImagesForSalonByCityUrl = '${g.createLink(controller: 'home', action: 'showAllImagesForSalonByCity')}';
    let showSalonByIdUrl = "${g.createLink(controller: 'home', action: 'showSalonById')}";
    let searchByNameUrl = "${g.createLink(controller: 'profile', action: 'searchByName')}";
    let searchPageUrl = "${g.createLink(controller: 'profile', action: 'searchPage')}";
    let searchByServiceUrl = "${g.createLink(controller: 'profile', action: 'findSalonsByService')}";
</script>
<asset:javascript src="search.js"/>

</html>