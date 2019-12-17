<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-3">
  <div class="container">  
  <a class="navbar-brand" href="<?php echo URLROOT_proffesor; ?>"><?php echo SITENAME_proffesor; ?></a>
    <button class="navbar-toggler" type="button" 
    data-toggle="collapse" 
    data-target="#navbarsExampleDefault" 
    aria-controls="navbarsExampleDefault"
    aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse"
    id="navbarsExampleDefault">
    <ul class="navbar-nav mr-auto">
        <li class="nav-item">
            <a class="nav-link" href="<?php echo URLROOT; ?>/proffesor/dnevnik_odeljenja">Dnevnik odeljenja</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<?php echo URLROOT; ?>/proffesor/odobravanje_dolaska_na_otvorena_vrata">Odobravanje dolaska na otvorena vrata</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<?php echo URLROOT; ?>/proffesor/poruke">Poruke</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<?php echo URLROOT; ?>/proffesor/raspored_casova">Raspored časova</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<?php echo URLROOT; ?>/proffesor/generisanje_svedocanstva">Svedočanstvo</a>
            </li>
    </ul>
    
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link" href="<?php echo URLROOT; ?>/pages/logout">Logout</a>
        </li>
    </ul>
    </div>
  </div>
</nav>