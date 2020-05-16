<?php
$accueil = "../index.php";
$add = "#";
$css ="../assets/CSS/style.css";
include "header.php";
require "../models/connexion_database.php";
require "../models/m_artist.php";
?>
<section class="row">
    <form action="http://bienvu.net/script.php" method="POST" class="col-5">
      <fieldset>
        <legend class="titre2">Ajouter un vynile</legend>
        <div class="form-row">
          <label for="title">Title</label>
          <input type="text" id="title" class="form-control" name="title" placeholder="Fugazi">
          <span id="errTitle"></span>
        </div>
        <div>
          <label>Artist</label>
          <select class="form-control" id="artist">
            <option value="1">Choisissez</option>
            <?php foreach($tabartist as $row) {?>
            <option value="<?= $row->artist_name ?>"><?= $row->artist_name ?></option>
            <?php } ?>
          </select>   
          <span id="errArtist"></span>
        </div>
        <div class="form-row">
          <label for="year">Year</label>
          <input id="year" type="text" class="form-control" name="year" placeholder="1984">
          <span id="errYear"></span>
        </div>
        <div class="form-row">
          <label for="genre">Genre</label>
          <input id="genre" type="text" class="form-control" name="genre" placeholder="Prog">
          <span id="errGenre"></span>
        </div>
        <div class="form-row">
          <label for="label">Label</label>
          <input id="label" type="text" class="form-control" name="label" placeholder="EMI">
          <span id="errLabel"></span>
        </div>
        <div class="form-row">
          <label for="mail">Price</label>
          <input id="price" type="text" class="form-control" name="price" placeholder="14.99">
          <span id="errPrice"></span>
        </div>
        <div id='bouton'>
            <input id="envoie" class="btn btn-primary" type="submit" value="Ajouter">
            <input class="btn btn-primary" type="reset" value="Annuler">
        </div>
      </fieldset>
    </form>
</section>
<?php
$js = "../assets/JS/script.js";
include "footer.php"
?>