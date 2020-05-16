<?php

$artist = $co->query("SELECT * FROM artist");
$tabartist = $artist->fetchAll(PDO::FETCH_OBJ);
$artist->closeCursor();
?>