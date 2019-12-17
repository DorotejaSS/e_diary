<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-3">
  <div class="container">  
  <a class="navbar-brand" href="<?php echo URLROOT_principal; ?>"><?php echo SITENAME_principal; ?></a>
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
            <a class="nav-link" href="<?php echo URLROOT; ?>/principal/uspesnost_odeljenja_po_predmetima">Uspešnost odeljenja po predmetima</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<?php echo URLROOT; ?>/principal/uspesnost_po_predmetima_na_nivou_skole">Uspešnost po predmetima na nivou škole</a>
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