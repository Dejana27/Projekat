<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 24.6.24.
  Time: 13:18
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Registracija zaposleni</title>
    <meta content="" name="description">
    <meta content="" name="keywords">



    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Vendor CSS Files -->
    <asset:stylesheet src="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/boxicons/css/boxicons.min.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/quill/quill.snow.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/quill/quill.bubble.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/remixicon/remixicon.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/simple-datatables/style.css" rel="stylesheet"/>

    <!-- Template Main CSS File -->
    <asset:stylesheet src="index.css"/>

</head>

<body>
<main>
    <div class="container">

        <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
            <div class="container">
                <div class="row registration_row justify-content-center">
                    <div class="col-lg-6 col-md-6 d-flex flex-column align-items-center justify-content-center">

                        <div class="d-flex justify-content-center py-4">
                            <a href="index.html" class="logo d-flex align-items-center w-auto">

                                <span class="d-none d-lg-block sredime_partneri">SrediMe</span>
                            </a>
                        </div>

                        <div class="card mb-3 registrationForm">

                            <div class="card-body">

                                <div class="pt-4 pb-2">
                                    <h5 class="card-title text-center pb-0 fs-4">Napravi profil</h5>
                                </div>

                                <form class="row registration_row needs-validation" novalidate>
                                    <div class="col-12">
                                        <label for="yourName" class="form-label">Ime </label>
                                        <input type="text" name="name" class="form-control" id="yourName" required>
                                        <div class="invalid-feedback">Molimo Vas, ukucajte svoje ime!</div>
                                    </div>
                                    <div class="col-12">
                                        <label for="yourName" class="form-label">Prezime </label>
                                        <input type="text" name="name" class="form-control" id="yourLastname" required>
                                        <div class="invalid-feedback">Molimo Vas, ukucajte svoje prezime!</div>
                                    </div>
                                    <div class="col-12">
                                        <label for="yourName" class="form-label">JMBG </label>
                                        <input type="text" name="name" class="form-control" id="yourIdentificationNumber" required>
                                        <div class="invalid-feedback">Molimo Vas, ukucajte svoj JMBG!</div>
                                    </div>
                                    <div class="col-12">
                                        <label for="startWorkingHours" class="form-label">Radno vrijeme od:</label>
                                        <input type="number" name="days" class="form-control" id="startWorkingHours" required>
                                        <label for="endWorkingHours" class="form-label">do: </label>
                                        <input type="number" name="time" class="form-control" id="endWorkingHours" required>
                                        <div class="invalid-feedback">Molimo Vas, ukucajte radno vrijeme</div>
                                    </div>
                                    <div class="col-12">
                                        <label for="phoneNumber" class="form-label">Broj telefona</label>
                                        <input type="text" name="number" class="form-control" id="phoneNumber">
                                    </div>

                                    <div class="col-12">
                                        <label for="yourEmail" class="form-label">Email</label>
                                        <input type="email" name="email" class="form-control" id="yourEmail" required>
                                        <div class="invalid-feedback">Molimo Vas ukucajte validnu email adresu!</div>
                                    </div>

                                    <div class="col-12">
                                        <label for="yourUsername" class="form-label">Korisničko ime</label>
                                        <div class="input-group has-validation">
                                            <span class="input-group-text" id="inputGroupPrepend">@</span>
                                            <input type="text" name="username" class="form-control" id="yourUsername" required>
                                            <div class="invalid-feedback">Molimo Vas odaberite korisničko ime.</div>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="yourPassword" class="form-label">Lozinka</label>
                                        <input type="password" name="password" class="form-control" id="yourPassword" required>
                                        <div class="invalid-feedback">Molimo Vas ukucajte lozinku!</div>
                                    </div>

                                    <div class="col-12">
                                        <label for="yourRepeatedPassword" class="form-label">Ponovite lozinku</label>
                                        <input type="password" name="password" class="form-control" id="yourRepeatedPassword" required>
                                        <div class="invalid-feedback">Molimo Vas potvrdite lozinku!</div>
                                    </div>


                                    <div class="col-12">
                                        <g:link controller="zaposleni" action="createEmployee">
                                            <button class="btn btn-primary w-100"  id="createButton">Kreirajte nalog</button></g:link>
                                    </div>
%{--                                    <div class="col-12">--}%
%{--                                        <g:link controller="main" action="index"> <p class="small mb-0">Već imate nalog? Ulogujte se</p> </g:link>--}%
%{--                                    </div>--}%


                                </form>

                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </section>

    </div>
</main>
<asset:javascript src="registracijaZaposleni.js"/>
<script>
    let saveEmployeeUrl = "${g.createLink(action: 'createEmployee', controller: 'zaposleni')}";
</script>
</body>
</html>