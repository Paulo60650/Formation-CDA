<?php
$accueil = "../index.php";
$add = "add_form.php";
$css ="../assets/CSS/style.css";
include "header.php";
require "../models/connexion_database.php";
require "../models/m_cd.php";
?>
<div class="col-12">
    <div class="row ml-5 pt-5">
     <?php
     // Boucle pour récupérer les données et les afficher dans le tableau
    foreach($tab as $line)
     {
     ?>
      <form action="update_form.php" method="get">
      <div class="card text-center text-white bg-dark mb-3 " style="width: 18rem;">
          <img class="card-img-top" id='img' name='img' src="../assets/img/<?= $line->disc_picture ?>" alt="Cover image">
          <div class="card-body">
            <ul class="list-unstyled">
              <li><p class="card-text" name="title"><strong>Title : </strong><?= $line->disc_title ?></p></li>
              <li><p class="card-text" name="name"><strong>Name : </strong><?= $line->artist_name ?></p></li>
              <li><p class="card-text" name="label"><strong>Label : </strong><?= $line->disc_label ?></p></li>
              <li><p class="card-text" name="year"><strong>Year : </strong><?= $line->disc_year ?></p></li>
              <li><p class="card-text"name="genre"><strong>Genre : </strong><?= $line->disc_genre ?></p></li>
              <li><p class="card-text"name="price"><strong>Price : </strong><?= $line->disc_price ?></p></li>
            </ul>
              <input type="hidden" name="id" value="<?= $line->disc_id ?>">
              <input type="hidden" name="nom" value="<?= $line->artist_id ?>">
              <input type="submit" name="mofifier" class="btn btn-primary" value="Modifier">
              <button type="button" class="btn btn-primary">Supprimer</button>
          </div>
      </div>
</form>
<?php } ?>
  </div>   
</div>
<?php 
$js = "../assets/JS/script.js";
include "footer.php";
?>