<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 28.5.24.
  Time: 11:11
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet">
  <asset:stylesheet src="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
  <asset:stylesheet src="./vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
  <asset:stylesheet src="./vendor/boxicons/css/boxicons.min.css" rel="stylesheet"/>
  <title>Pitanja</title>
<asset:stylesheet src="profile.css"/>
</head>
<body>
<header id="header" class="fixed-top">
  <div class="container d-flex align-items-center justify-content-between">

    <h1 class="logo"><g:link controller="profile" action="index">Profil</g:link></h1>

    <nav id="navbar" class="navbar">
      <ul>
        <li><g:link action="index" controller="home" class="nav-link scrollto active">Početna</g:link></li>
        <li><g:link action="show" controller="search" class="nav-link scrollto">Istražite</g:link></li>
        <li><a class="nav-link scrollto" href="#">LookBook</a></li>
        <li><a class="nav-link scrollto o" href="#">Utisci</a></li>
        <li><a class="nav-link scrollto" href="#">Sviđanja</a></li>
        <li><a class="nav-link scrollto" href="#pricing">Zakazivanja</a></li>
        <li><g:link controller="profile" action="index" class="nav-link scrollto">Profil</g:link></li>
        <li><a class="nav-link scrollto" id="logout">Izloguj se</a></li>
      </ul>
      <i class="bi bi-list mobile-nav-toggle"></i>
    </nav>

  </div>
</header>
<div>
  <div class="container">
    <div class="row">
      <section>
        <h1>Najčešće postavljana pitanja</h1>
        <div>
          <h2>Opšta pitanja</h2>
          <h4>
            <br>
            Šta je SrediMe?
          </h4>
          <p>
            Nov i uzbudljiv, SrediMe je inovativni onlajn servis koji unaprijeđuje iskustvo zakazivanja termina u salonima ljepote. Inspirišemo ljude da pronalaze nove načine da iskažu svoju ljepotu, da istražuju najnovije trendove u svijetu kozmetike i brige o licu i tijelu i da uživaju u tome!
          </p>
          <p>
            SrediMe je bolji način za otkrivanje izvrsnih salona ljepote, frizerskih i kozmetičkih salona, SPA centara i masaža. Sada možete direktno zakazati svoj termin, onda kada Vama odgovara, sa više povjerenja i više mogućnosti izbora. Zakazivanje tretmana ljepote treba da bude ljepše, lakše, brže i spremni smo da Vam to i omogućimo
          </p>
          <p>
            Ako želite više podataka o nama, posetite stranu O nama ili nam se slobodno javite na info@sredime.me - rado ćemo odgovoriti na sva Vaša pitanja :)
          </p>
          <h4>
            <br>
          </h4>
          <h4>U kojim sve gradovima je dostupan?</h4>
          <p>SrediMe trenutno radi u većim gradovima Crne Gore i regije, a planiramo širenje na veći broj gradova.</p>
          <h4>
            <br>
            Da li je SrediMe salon ljepote?
          </h4>
          <p>Ne, mi nismo salon niti smo mi vlasnici salona. Takođe, nismo ni proizvođači kozmetike. Mi samo pomažemo u otkrivanju dobrih salona i preciznom zakazivanju termina u njima i trudimo se da u tome budemo najbolji.</p>
          <h4>
            <br>
            Da li je SrediMe besplatan?
          </h4>
          <p>
            Da! Ovo je 100% besplatna usluga - SrediMe nikada ne naplaćuje svoje usluge korisnicima, možete ga koristiti potpuno besplatno.
          </p>
          <h3>
            <blockquote>Sve cijene na SrediMe su iste (ili povoljnije) kao u salonima, bez razlike na koji način zakazujete.</blockquote>
          </h3>
          <h4><br></h4>
          <h2>Zakazivanje termina</h2>
          <h4>
            <br>
            Kako da zakažem termin?
          </h4>
          <p>
            Ako tražite neki konkretan salon, u zaglavlju svih stranica SrediMe možete unijeti njegovo ime i direktno preći na ponudu željenog salona.
          </p>
          <p>
            Ukoliko želite da pregledate ponudu raznih salona, krenite od početne strane sajta i pretražite salone po gradu i/ili vrsti usluge koju želite. Salone možete dodatno filtrirati po mnogo različitih parametara, kako bi što brže došli do željene usluge.
          </p>
          <p>
            Kada pronađete salon koji Vas zanima, izaberite uslugu/tretman iz cjenovnika salona, te odaberite jedan od slobodnih termina. Unesite svoje podatke i provjerite ispravnosti broja mobilnog telefona. I to je to :) Upravo ste zakazali svoj termin u salonu!
          </p>
          <p>
            SrediMe će Vam poslati e-mail sa detaljima zakazivanja čim salon potvrdi rezervaciju termina.
            <br>
          </p>
          <p>
            <br>
          </p>
          <h4>Da li mogu da zakažem više usluga?</h4>
          <p>Naravno, možete izabrati više usluga, a SrediMe će pronaći optimalne termine da ih obavite zaredom u jednoj posjeti salonu, poštujući redoslijed izvođenja usluga u salonima.</p>
          <p><br></p>
          <h4>Kako radi zakazivanje termina?</h4>
          <p>SrediMe je opremio salone sa softverom za praćenje slobodnih termina i saloni mogu nezavisno i u bilo kom trenutku ažurirati svoju ponudu i slobodne termine. Svi saloni su prošli kroz obuku upravljanja slobodnim terminima. Na taj način SrediMe može prikazati sve dostupne termine salona i omogućiti zakazivanje termina u realnom vremenu. Ako ipak primjetite bilo kakvu netačnost, molimo Vas da nam javite i što prije ćemo to srediti.
          </p>
          <p><br></p>
          <div>
            <h4>Kako da znam da je moj termin uspješno zakazan?</h4>
            <p></p>
          </div>
          <p>
            Stanje svih svojih zakazivanja možete provjeriti na stranici Moji termini, a poslaćemo Vam i e-mail sa detaljima zakazivanja čim salon potvrdi zakazivanje. Salon će Vas očekivati u vrijeme koje ste izabrali i nije potrebno da nosite bilo kakve potvrde o rezervaciji. Samo dođite i ponesite dobro raspoloženje :)
          </p>
          <p>
            Ukoliko se desi da ne dobijete potvrdni e-mail, provjerite da li je možda završio u Vašem spam folderu među neželjenom poštom. Da biste u budućnosti to izbjegli, dodajte nas u svoj e-mail adresar.
          </p>
        </div>
        <div>
          <br>
        </div>
        <div>
          <h4>Kako i gdje plaćam?</h4>
          <p></p>
        </div>
        <p>Plaćate u salonu nakon obavljene usluge, po cjenovniku salona, kao da ste zakazali na bilo koji drugi način ili otišli u salon bez zakazivanja.</p>
        <p>Sve usluge salona možete platiti gotovinom u salonu, a na SrediMe ćete za svaki salon vidjeti i druge načine na koji možete platiti u salonu.</p>
      </section>
    </div>
  </div>
</div>
</body>
</html>