<?php
$accueil = "#";
$form = "views/update_form.php";
$add = "views/add_form.php";
$del = "views/delete_form.php";
$css = "assets/CSS/style.css";
include "views/header.php";
require "models/connexion_database.php";

$requete = $co->query("SELECT * FROM disc JOIN artist ON disc.artist_id = artist.artist_id");
$tableau = $requete->fetchAll(PDO::FETCH_OBJ);
$requete->closeCursor();
?>
  <!-- On déclare la table -->
     <table class="table">
     <thead>
     <tr>
     <th>Cover</th>
     <th>Album</th>
     <th>Artist</th>
     <th>Years</th>
     <th>Label</th>
     <th>Genre</th>
     <th>Details</th>
     </tr>
     </thead>
     <tbody>
     <?php
     // Boucle pour récupérer les données et les afficher dans le tableau
    foreach($tableau as $line)
     {
     ?>
     <tr>
     <td><img class="img-thumbnail" src="assets/img/<?= $line->disc_picture ?>"></td>
     <td><?= $line->disc_title ?></td>
     <td><?= $line->artist_name ?></td>
     <td><?= $line->disc_year ?></td>
     <td><?= $line->disc_label ?></td>
     <td><?= $line->disc_genre ?></td>
     <td><input classe="detail" type="button" value="Détails" class="btn btn-dark b_middle"></td>
     </tr>
     <?php    
     }
 // Fermeture du tableau
 ?>
 </tbody>
 </table>
<?php
$js = "assets/JS/script.js";
include "views/footer.php";
?>