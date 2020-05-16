<?php
include "../models/connexion_database.php";
$id = $_GET["id"];
$detail = $co->query("SELECT * FROM disc JOIN artist ON disc.artist_id = artist.artist_id WHERE disc.disc_id = $id");
$tab = $detail->fetchAll(PDO::FETCH_OBJ);
$detail->closeCursor();

foreach($tab as $value)
$title = $value->disc_title;
$name = $value->artist_name;
$label = $value->disc_label;
$year = $value->disc_year;
$genre = $value->disc_genre;
$price = $value->disc_price;
$nom = $value ->artist_id;


// $req = $db->prepare('UPDATE disc SET disc_title = ? , disc_year = ? , disc_picture= ?,disc_label = ? , disc_genre= ?, disc_price = ?, artist_id= ? WHERE disc_id = ?');
//         $req->execute(array($titre,$year,$file,$label,$genre,$price,$idart,$id));


//         $req=$db->prepare('DELETE FROM `disc` WHERE disc_id= :id and disc_year = :truc');
//         $req->bindParam(':id' , $id,PDO::PARAM_INT);
//         $req->bindParam(':truc' , $year,PDO::PARAM_STRING);
//         $req->execute();

?>