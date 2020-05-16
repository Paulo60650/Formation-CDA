<?php
require "../models/connexion_database.php";
function up_cds($title,$year,$genre,$price,$label,$id,$co){
    $update ='UPDATE disc SET disc_title ="'. $title.'", disc_label ="'.$label.'", disc_year ='.intval($year).', disc_genre = "'.$genre.'", disc_price = '.floatval($price).' WHERE disc_id ='.intval($id);
    $stmt = $co->prepare($update);
    $stmt->execute();
    //$stmt->debugDumpParams();
    if ($stmt->rowCount()){
        echo " Modification effectué";
        header( "refresh:3;url=../index.php" );
    } 
    else{
        echo "Un problème est survenue";
        header( "refresh:3;url=../views/update_form.php" );
    }
}
if(isset($_POST))
{
  $res=up_cds($_POST['title'], $_POST['year'], $_POST['genre'], $_POST['price'], $_POST['label'], $_POST['id'], $co);
  
}
 ?>
