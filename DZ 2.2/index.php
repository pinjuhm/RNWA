<!DOCTYPE html>
<html>
<head>
  <title>Hospital database</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="style.css">
</head>
<body>
<nav class="navbar">
  <div class="navbar-content">
    <a href="/hospital-database" class="navbar-logo button"><strong>Hospital database</strong></a>
    <div class="navbar-items">
      <input type="search" id="search" name="search" placeholder="Pretraga baza"/>
      <a href="#najpoznatije-baze" class="bar-item button">Najpoznatije baze</a>
      <a href="#definicija" class="bar-item button">Definicija</a>
      <a href="#kontakt" class="bar-item button">Kontakt</a>
    </div>
  </div>
</nav>

<header class="header" id="najpoznatije-baze">
  <div class="display-middle margin-top center">
    
  </div>
</header>

<main class="content padding" style="max-width:1564px">
<div class="container padding-32 search-result">
    <h3 class="border-bottom border-light-grey padding-16">Rezultat pretrage:</h3>
    <div class="search-result-data"></div>
  </div>

  <div class="container padding-32" id="definicija">
    <h3 class="border-bottom border-light-grey padding-16">Najpoznatije baze podataka</h3>
  </div>
  <div class="row-padding">
    <div class="col l3 m6 margin-bottom">
      <div class="display-container">
        <a href="https://www.oracle.com/database/" target="_blank" class="block is-centered black padding-16">Oracle</a>
      </div>
    </div>
    <div class="col l3 m6 margin-bottom">
      <div class="display-container">
        <a href="https://www.mysql.com/" target="_blank" class="block is-centered black padding-16">MySQL</a>
      </div>
    </div>
    <div class="col l3 m6 margin-bottom">
      <div class="display-container">
        <a href="https://www.microsoft.com/en-us/sql-server/sql-server-downloads" target="_blank" class="block is-centered black padding-16">Microsoft SQL Server</a>
      </div>
    </div>
    <div class="col l3 m6 margin-bottom">
      <div class="display-container">
        <a href="https://www.postgresql.org/" target="_blank" class="block is-centered black padding-16">PostgreSQL</a>
      </div>
    </div>
    <img src="images/Most Popular Databases In the World.jpg" class="image db-image" alt="Najpopularnije baze podataka" />
  </div>
    </div>
  </div>
  <div class="container padding-32" id="uvod">
    <h3 class="border-bottom border-light-grey padding-16">Definicija baza podataka</h3>
    <p>
      Jedna od mogućih definicija baze podataka glasi da je to zbirka zapisa pohranjenih u računalu na sustavan način, tako da joj se računalni program može obratiti prilikom odgovaranja na problem. Svaki se zapis za bolji povratak i razvrstavanje obično prepoznaje kao skup elemenata (činjenica) podataka. Predmeti vraćeni u odgovoru na upitnike postaju informacije koje se mogu koristiti za stvaranje odluka koje bi inače mogle biti mnogo teže ili nemoguće za stvaranje. Računalni program korišten za upravljanje i ispitivanje baze podataka nazvan je sustav upravljanja bazom podataka (SUBP). Svojstva i dizajn sustava baze podataka uključeni su u proučavanje informatičke znanosti. Baza podataka je organizirani skup podataka. Termin je izvorno nastao unutar računalne industrije, a njegovo se značenje proširilo popularnom uporabom toliko da Europska direktiva za baze podataka (koja za baze podataka donosi prava za intelektualno vlasništvo) uključuje i neelektronske baze podataka unutar svoje definicije. Ovaj članak je ograničen više na tehničku upotrebu termina, iako čak i među računalnim profesionalcima neki pripisuju mnogo šire značenje riječi od drugih.
    </p>
  </div>
  <div class="container padding-32" id="kontakt">
    <h3 class="border-bottom border-light-grey padding-16">Kontakt članova tima</h3>
    <p>Email: miljana.pinjuh@gmail.com </p>
  </div>
</main>

<footer class="footer">
  <p>Hospital database 2022.</p>
</footer>

<!-- <script src="scripts/db-search.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- <script src="scripts/db-search-jquery.js"></script> -->
<script type="text/javascript" src="https://unpkg.com/axios@0.25.0/dist/axios.min.js"></script>
<script src="scripts/db-search-axios.js"></script>
</body>
</html>
