<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 3.6.24.
  Time: 10:24
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">
    <asset:stylesheet src="./vendor/aos/aos.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <asset:stylesheet src="./vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
    <title>Zakazivanja usluga</title>
    <asset:stylesheet src="makeAppointment.css"/>
</head>

<body>
<header>
    <div class="container d-flex align-items-center justify-content-between">
        <h1 class="logo"><g:link controller="home" action="index">SREDIME</g:link></h1>
        <nav id="navbar" class="navbar">

        </nav>

    </div>
</header>

<div>
    <div class="container-app">
        <div>
            <div class="cart">
                <div class="row">
                    <div class="col-md-6">
                        <fieldset>
                            <legend>Koji termin Vam najviše odgovara?</legend>
                            <div>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <i></i>
                                            </td>
                                            <td>
                                                <small></small>
                                            </td>
                                            <td>
                                                <i></i>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div>
                                    <style></style>
                                    <table></table>
                                    <div></div>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <p class="pull-right"></p>
                                <h3 class="panel-title">

                                </h3>
                                <div>
                    %{--    adresa iz baze --}%
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="service-list">
                                    <div class="service">
                                        <div class="row service-name-row">
                                            <div class="col-xs-9">
                                                <span class="service-name"></span>
                                                <span class="minutes"></span>
                                            </div>
                                            <div class="col-xs-3 text-right">
                                                <span>
                                                %{--  cijena--}%
                                                </span>
                                                <a>
                                        %{-- link za brisanje usluge i vracanje nazad na salon--}%
                                                </a>
                                            </div>
                                        </div>
                                        <div class="cart-employee-sector">
                                            <div class="dropdown bootstrap-select select-employee form-control bs3">
                                                <select class="select-employee form-control">
                                                    <option></option>
                                                </select>
                                                <button type="button">
                                                    <div>
                                                        <div>
                                                            <div>
                                                                <img/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <span>
                                                        <span></span>
                                                    </span>
                                                </button>
                                                <div class="dropdown-menu open">
                                                    <div>
                                                        <ul></ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        Načini plaćanja:
                                        <b>Plaćanje u salonu</b>
                                    </div>
                                    <hr>
                                    <div class="text-right">
                                        <h4>
                                            <b>
                                        %{-- cijena  --}%
                                            </b>
                                        </h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    let getSalonDataUrl = "${g.createLink(controller: 'home', action: 'getSalonData')}";
</script>
</body>
</html>