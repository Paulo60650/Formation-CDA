<?php
$accueil = "#";
$add = "views/add_form.php";
$css = "assets/CSS/style.css";
include "views/header.php";
require "models/connexion_database.php";

$requete = $co->query("SELECT * FROM disc JOIN artist ON disc.artist_id = artist.artist_id");
$tableau = $requete->fetchAll(PDO::FETCH_OBJ);
$requete->closeCursor();

$requete2 = $co->query("SELECT COUNT(disc_id) FROM disc");
$tableau2 = $requete2->fetchAll(PDO::FETCH_OBJ);
$requete2->closeCursor();
foreach($tableau2 as $count){
  echo $count->disc_id;
};


?>
 <div class="col-12">
    <div class="row ml-5 pt-5">
     <?php
     // Foreach pour récupérer les données du tableau et les afficher dans le Formulaire
    foreach($tableau as $line)
     {
     ?>
      <form action="views/detail.php" method="get">
      <div class="card text-center text-white bg-dark mb-3 ml-3" style="width: 18rem;">
          <img class="card-img-top" id='img' name='img' src="assets/img/<?= $line->disc_picture?>" alt="Cover image">
          <div class="card-body">
            <ul class="list-unstyled">
              <li><p class="card-text" name="title"><strong>Title : </strong><?= $line->disc_title ?></p></li>
              <li><p class="card-text" name="name"><strong>Name : </strong><?= $line->artist_name ?></p></li>
              <li><p class="card-text" name="label"><strong>Label : </strong><?= $line->disc_label ?></p></li>
              <li><p class="card-text" name="year"><strong>Year : </strong><?= $line->disc_year ?></p></li>
              <li><p class="card-text"name="genre"><strong>Genre : </strong><?= $line->disc_genre ?></p></li>
            </ul>
              <input type="hidden" name="id" value="<?= $line->disc_id ?>">
              <input type="hidden" name="nom" value="<?= $line->artist_id ?>">
              <input type="submit" name="action" class="btn btn-primary" value="Détails">
          </div>
      </div>
</form>
<?php } ?>
  </div>   
</div>
<?php
$js = "assets/JS/script.js";
include "views/footer.php";
?>