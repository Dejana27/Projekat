<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Pages / Login - NiceAdmin Bootstrap Template</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
%{--    <link href="assets/img/favicon.png" rel="icon">--}%
%{--    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">--}%

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

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

    <!-- =======================================================
  * Template Name: NiceAdmin
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Updated: Mar 17 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

<main>
    <div class="container auth">

        <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                        <div class="card mb-3">

                            <div class="card-body">

                                <div class="pt-4 pb-2">
                                    <h5 class="card-title text-center pb-0 fs-4">Ulogujte se u svoj profil</h5>
                                    <p class="text-center small">Ukucajte korisničko ime i lozinku</p>
                                </div>
                                                        %{-- row g-3 needs-validation    --}%
                                <form action="${postUrl}" method="POST" id="loginForm" autocomplete="off" class="login100-form validate-form" novalidate>

                                    <div class="col-12">
                                        <label for="yourUsername" class="form-label">Korisničko ime</label>
                                        <div class="input-group has-validation">
                                            <span class="input-group-text" id="inputGroupPrepend">@</span>
                                            <input type="text" name="username" class="form-control" id="yourUsername" required>
                                            <div class="invalid-feedback">Ukucajte korisničko ime.</div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="col-12">
                                        <label for="yourPassword" class="form-label">Lozinka</label>
                                        <input type="password" name="password" class="form-control" id="yourPassword" required>
                                        <div class="invalid-feedback">Molimo Vas ukucajte svoju lozinku!</div>
                                    </div>
                                    <br>
                                    <div class="col-12">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="remember" value="true" id="rememberMe">
                                            <label class="form-check-label" for="rememberMe">Zapamti</label>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="col-12">
                                        <button class="btn w-100" type="submit" id="loginButton" class="loginBtn">Login</button>
                                    </div>
                                    <div class="col-12">
                                        <p class="small mb-0">Nemate profil? <g:link controller="register" action="show">Kreiraj profil </g:link></p>
                                    </div>
                                </form>

                            </div>
                        </div>



                    </div>
                </div>
            </div>

        </section>

    </div>
</main><!-- End #main -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->

<asset:javascript src="apexcharts/apexcharts.min.js"/>
<asset:javascript src="vendor/aos/aos.js"/>
<asset:javascript src="vendor/bootstrap/js/bootstrap.bundle.min.js"/>
%{--<asset:javascript src="vendor/chart.js/chart.umd.js"/>--}%
<asset:javascript src="vendor/echarts/echarts.min.js"/>
<asset:javascript src="vendor/glightbox/js/glightbox.min.js"/>
%{--<asset:javascript src="vendor/echarts/echarts.min.js"/>--}%
<asset:javascript src="vendor/tinymce/tinymce.min.js"/>
<asset:javascript src="vendor/simple-datatables/simple-datatables.js"/>
<asset:javascript src="vendor/swiper/swiper-bundle.min.js"/>
%{--<script src="assets/vendor/quill/quill.min.js"></script>--}%
%{--<script src="assets/vendor/php-email-form/validate.js"></script>--}%
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<asset:javascript src="main.js"/>
<asset:javascript src="login.js"/>
<script>
    let loginUserUrl = "${g.createLink(controller: 'login', action: 'send')}"
</script>
</body>

</html>