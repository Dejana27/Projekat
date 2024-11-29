<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 24.5.24.
  Time: 13:03
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Izmijenite nalog</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <asset:stylesheet src="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
    <asset:stylesheet src="updateProfile.css"/>

</head>

<body>
<header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">

        <h1 class="logo"><g:link controller="profile" action="index">Profil</g:link></h1>

        <nav id="navbar" class="navbar">
            <ul>
                <li><g:link action="index" controller="home" class="nav-link scrollto active">Početna</g:link></li>
                <li> <g:link action="search" controller="profile" class="nav-link scrollto">Istražite</g:link></li>
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
    <div>
        <div class="container app-container">
            <h1>Nalog</h1>
            <div class="row">
                <div class="col-md-8">
                    <form enctype="multipart/form-data" accept-charset="utf-8" class="form-horizontal" method="POST">
                        <div class="form-group required">
                            <label for="first_name" class="control-label col-lg-2 col-sm-4">
                               Korisničko ime
                                <sup>*</sup>
                            </label>
                            <div class="col-lg-10 col-sm-8">
                                <input class="form-control" required id="first_name" type="text" name="first_name">
                            </div>
                        </div>

                        <div class="form-group required">
                            <label for="email" class="control-label col-lg-2 col-sm-4">
                                Email
                                <sup>*</sup>
                            </label>
                            <div class="col-lg-10 col-sm-8">
                                <input class="form-control" required id="email" type="text" name="email">
                            </div>
                        </div>

                         <div class="form-group required">
                             <label for="password" class="control-label col-lg-2 col-sm-4">
                                 Lozinka
                             </label>
                             <div class="col-lg-10 col-sm-8">
                                 <input class="form-control" id="password" type="password" name="password">
                                 <input type="checkbox" onclick="showPassword()" class="showPass"> Prikaži lozinku <br>
                                 <span class="help-block">Samo ukoliko želite da promijenite lozinku, unesite je ovdje</span>
                             </div>
                         </div>
                    </form>
                    <hr>
                    <legend>Preporuke za Vas</legend>
                    <div class="form-group">
                        <label for="gender" class="control-label col-lg-2 col-sm-4">
                            Izbor sadržaja
                        </label>
                        <div class="col-lg-10 col-sm-8">
                            <div>
                                <input type="radio" id="gender" name="drone" value="gender" checked class="colorRadio" />
                                <label for="gender">Zanimaju me svi sadržaji</label>
                            </div>

                            <div>
                                <input type="radio" id="gender2" name="drone" value="gender2" class="colorRadio" />
                                <label for="gender2">Zanimaju me sadržaji za muškarce</label>
                            </div>

                            <div>
                                <input type="radio" id="gender3" name="drone" value="gender3" class="colorRadio" />
                                <label for="gender3">Zanimaju me sadržaji za žene</label>
                            </div>

                        </div>
                    </div>
                    <hr>
                    <div class="form-group">
                        <label for="message" class="control-label col-lg-2 col-sm-4">
                            Preporuke e-mail
                        </label>
                        <div class="col-lg-10 col-sm-8">
                            <div>
                                <input type="radio" id="message" name="recc" value="message" checked class="colorRadio"/>
                                <label for="message">Da, želim da mi SrediMe povremeno šalje promocije, novosti i popuste putem e-pošte.</label>
                            </div>
                            <div>
                                <input type="radio" id="message2" name="recc" value="message2" class="colorRadio"/>
                                <label for="message2">Ne želim preporuke i promotivne poruke.</label>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="form-group">
                        <label for="notification" class="control-label col-lg-2 col-sm-4">
                            Podsjetnik o nedovršenim zakazivanjima
                        </label>
                        <div class="col-lg-10 col-sm-8">
                            <div>
                                <input type="radio" id="notification" name="notf" value="notification" checked class="colorRadio"/>
                                <label for="notification">Da</label>
                            </div>
                            <div>
                                <input type="radio" id="notification2" name="notf" value="notification2" class="colorRadio"/>
                                <label for="notification2">Ne</label>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <legend>Podsjetnici prije termina</legend>
                    <div class="form-group">
                        <label for="mess" class="control-label col-lg-2 col-sm-4">
                            SMS
                        </label>
                        <div class="col-lg-10 col-sm-8">
                            <div>
                                <input type="radio" id="mess" name="message" value="mess" checked class="colorRadio"/>
                                <label for="mess">Da</label>
                            </div>
                            <div>
                                <input type="radio" id="mess2" name="message" value="mess2" class="colorRadio"/>
                                <label for="mess2">Ne</label>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="form-group">
                        <label for="e-mail" class="control-label col-lg-2 col-sm-4">
                            E-pošta
                        </label>
                        <div class="col-lg-10 col-sm-8">
                            <div>
                                <input type="radio" id="e-mail" name="em" value="e-mail" checked class="colorRadio"/>
                                <label for="e-mail">Da</label>
                            </div>
                            <div>
                                <input type="radio" id="e-mail2" name="em" value="e-mail2" class="colorRadio"/>
                                <label for="e-mail2">Ne</label>
                            </div>
                        </div>
                        <hr>
                        <div class="col-lg-offset-2 col-sm-offset-4 col-lg-10 col-sm-8">
                            <input class="btn-block btn-primary btn" type="submit" value="Sačuvaj" id="saveButton"/>
                            <input class="btn-block btn-primary btn" type="submit" value="Obriši nalog" id="deleteButton"/>
                        </div>

                    </div>
                </div>
                <div class="col-md-4"></div>
            </div>
        </div>
    </div>
</body>
<script>
    let getProfileDataUrl = "${g.createLink(controller:'home', action: 'getDataAboutProfile')}";
    let saveUpdatedUserUrl = "${g.createLink(controller: 'home', action: 'saveUpdatedUser')}";
    let deleteUserUrl = "${g.createLink(controller: 'home', action: 'deleteUser')}";
    function showPassword() {
        let pass = document.querySelector('#password');
        if(pass.type === "password") {
            pass.type = "text";
        } else {
            pass.type = "password";
        }
    }
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js" integrity="sha256-/H4YS+7aYb9kJ5OKhFYPUjSJdrtV6AeyJOtTkw6X72o=" crossorigin="anonymous"></script>

<asset:javascript src="updateProfile.js"/>

</html>