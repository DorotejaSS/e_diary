<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-3">
  <div class="container">  
  <a class="navbar-brand" href="<?php echo URLROOT_admin; ?>"><?php echo SITENAME_admin; ?></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
    <ul class="navbar-nav mr-auto">
        <li class="nav-item">
            <a id="kontrolisanje_korisnika" class="nav-link" href="<?php echo URLROOT; ?>/admin/kontrolisanje_korisnika">Kontrola korisnika</a>
        </li>
        <li class="nav-item">
            <a id="kontrolisanje_predmeta_i_odeljenja" class="nav-link" href="<?php echo URLROOT; ?>/admin/kontrolisanje_predmeta_i_odeljenja">Kontrola predmeta i odeljenja</a>
        </li>
        <li class="nav-item">
            <a id="kontrola_rasporeda_casova" class="nav-link" href="<?php echo URLROOT; ?>/admin/kontrola_rasporeda_casova">Kontrola rasporeda časova</a>
        </li>
        <li class="nav-item">
            <a id="obavestenja_roditeljima" class="nav-link" href="<?php echo URLROOT; ?>/admin/obavestenja_roditeljima">Obaveštenja roditeljima</a>
        </li>
        <li class="nav-item">
            <a id="informacije_o_ucenicima" class="nav-link" href="<?php echo URLROOT; ?>/admin/informacije_o_ucenicima">Informacije o učenicima</a>
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