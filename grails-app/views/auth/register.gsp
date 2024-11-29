<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Registracija korisnici</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Vendor CSS Files -->
    <asset:stylesheet src="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/boxicons/css/boxicons.min.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/quill/quill.snow.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/quill/quill.bubble.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/remixicon/remixicon.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/simple-datatables/style.css" rel="stylesheet"/>

    <asset:stylesheet src="index.css"/>

</head>

<body>

<main>
    <div class="container">

        <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                        <div class="d-flex justify-content-center py-4">
                            <g:link controller="register" action="index" class="logo d-flex align-items-center w-auto">
                                <span class="d-none d-lg-block">SrediMe</span>
                            </g:link>
                        </div><!-- End Logo -->

                        <div class="card mb-3 registrationForm">

                            <div class="card-body">

                                <div class="pt-4 pb-2">
                                    <h5 class="card-title text-center pb-0 fs-4">Napravi profil</h5>
%{--                                    <p class="text-center small">Enter your personal details to create account</p>--}%
                                </div>

                                <form class="row g-3 needs-validation" novalidate>
%{--                                    <div class="alert alert-danger alert-dismissible fade show" role="alert">--}%
%{--                                        <i class="bi bi-exclamation-octagon me-1"></i>--}%
%{--                                        Već postoji korisnik sa istim kredencijalima.--}%
%{--                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>--}%
%{--                                    </div>--}%
                                    <div class="col-12">
                                        <label for="yourName" class="form-label">Ime</label>
                                        <input type="text" name="fname" class="form-control" id="yourName" required>
                                        <div class="invalid-feedback">Molimo Vas, ukucajte svoje ime!</div>
%{--                                        <small class="small">Error message</small>--}%
                                    </div>

                                    <div class="col-12">
                                        <label for="lastName" class="form-label">Prezime</label>
                                        <input type="text" name="lname" class="form-control" id="lastName" required>
                                        <div class="invalid-feedback">Molimo Vas, ukucajte svoje prezime!</div>
%{--                                        <small class="small">Error message</small>--}%
                                    </div>

                                    <div class="col-12">
                                        <label for="yourEmail" class="form-label">Email</label>
                                        <input type="email" name="email" class="form-control" id="yourEmail" required>
                                        <div class="invalid-feedback">Molimo Vas ukucajte validnu email adresu!</div>
%{--                                        <small class="small">Error message</small>--}%
                                    </div>

                                    <div class="col-12">
                                        <label for="phoneNumber" class="form-label">Broj telefona</label>
                                        <input type="text" name="number" class="form-control" id="phoneNumber" required>
                                        <div class="invalid-feedback">Molimo Vas ukucajte broj telefona!</div>
                                    </div>

                                    <div class="col-12">
                                        <label for="yourUsername" class="form-label">Korisničko ime</label>
                                        <div class="input-group has-validation">
                                            <span class="input-group-text" id="inputGroupPrepend">@</span>
                                            <input type="text" name="username" class="form-control" id="yourUsername" required>
                                            <div class="invalid-feedback">Molimo Vas odaberite korisničko ime.</div>
%{--                                            <small class="small">Error message</small>--}%
                                        </div>

                                    </div>

                                    <div class="col-12">
                                        <label for="yourPassword" class="form-label">Lozinka</label>
                                        <input type="password" name="password" class="form-control" id="yourPassword" required>
                                        <div class="invalid-feedback">Molimo Vas ukucajte lozinku!</div>
%{--                                        <small class="small">Error message</small>--}%
                                    </div>

                                    <div class="col-12">
                                        <label for="yourRepeatedPassword" class="form-label">Ponovite lozinku</label>
                                        <input type="password" name="password" class="form-control" id="yourRepeatedPassword" required>
                                        <div class="invalid-feedback">Molimo Vas potvrdite lozinku!</div>
%{--                                        <small class="small">Error message</small>--}%
                                    </div>

                                    <div class="col-12">
                                        <div class="form-check">
                                            <input class="form-check-input" name="terms" type="checkbox" value="" id="acceptTerms" required>
                                            <label class="form-check-label" for="acceptTerms">Slažem se i prihvatam uslove</label>
                                            <div class="invalid-feedback">Morate prihvatiti uslove prije nego potvrdite.</div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <g:link controller="register" action="createUser">
                                        <button class="btn btn-primary w-100"  id="createButton">Kreirajte nalog</button></g:link>
                                    </div>
                                    <div class="col-12">
                                        <p class="small mb-0">Već imate nalog? <g:link controller="login" action="auth">Ulogujte se</g:link></p>
                                    </div>
                                </form>

                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </section>

    </div>
</main>



<asset:javascript src="apexcharts/apexcharts.min.js"/>
<asset:javascript src="vendor/js/bootstrap.bundle.min.js"/>
<asset:javascript src="vendor/echarts/echarts.min.js"/>
<asset:javascript src="vendor/tinymce/tinymce.min.js"/>
<asset:javascript src="vendor/simple-datatables/simple-datatables.js"/>
<asset:javascript src="vendor/glightbox/js/glightbox.min.js"/>
<asset:javascript src="vendor/swiper/swiper-bundle.min.js"/>
<asset:javascript src="vendor/aos/aos.js"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<asset:javascript src="main.js"/>
<asset:javascript src="register.js"/>
<script>
    let registerUserUrl = "${g.createLink(controller: 'register', action: 'createUser')}"
</script>
</body>

</html>