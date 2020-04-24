<link rel="stylesheet" href="../assets/CSS/style.css">
<h1>Les Fonctions PHP</h1>
<h3>Exercice 1 :</h3>
<h4>Consignes :</h4>
<p>-Trouvez le numéro de semaine de la date suivante : 14/07/2019. </p>
<?php
$date = "14-07-2019";
$week = strtotime($date);
echo "<i>Le 14-07-2019 est la ".date('W',$week)." eme semaine de l'annee</i>";
?>
<pre>
    <code>
        &lt;?php
            $date = "14-07-2019";
            $week = strtotime($date);
            echo "&lt;i&gt;Le 14-07-2019 est la ".date('W',$week)." eme semaine de l'annee&lt;/i&gt;";
        ?&gt;
    </code>
</pre>
<h3>Exercice 2 :</h3>
<h4>Consignes :</h4>
<p>-Combien reste-t-il de jours avant la fin de votre formation ?</p>
<?php
$fin = new DateTime('2020-07-20');
$now = new DateTime();
$duree = $fin->diff($now);
echo "<i>Il reste ".$duree->days." jours d'ici la fin de ma formation</i>";
?>
<h4>Code de l'exercice :</h4>
<pre>
    <code>
        &lt;?php
            $fin = new DateTime('2020-07-20');
            $now = new DateTime();
            $duree = $fin-&gt;diff($now);
            echo "&lt;i&gt;Il reste ".$duree-&gt;days." jours d'ici la fin de ma formation&lt;/i&gt;";
        ?&gt;
    </code>
</pre>
<h3>Exercice 3 :</h3>
<h4>Consignes :</h4>
<p>-Comment déterminer si une année est bissextile ?</p>
<?php
 function bissextile($annee)
 {
   return date("m-d", strtotime("$annee-02-29")) == "02-29";
 }
 function affiche($annee){
    if(bissextile($annee) == 1){
        echo "<i>".$annee." est une annee bissextile</i>";
    }
    else{
        echo "<i>".$annee." n'est pas une annee bissextile</i>";
    }
 }
 affiche("2020");
 affiche("2021");
?>
<pre>
    <code>
        &lt;?php
            function bissextile($annee)
            {
            return date("m-d", strtotime("$annee-02-29")) == "02-29";
            }
            function affiche($annee){
                if(bissextile($annee) == 1){
                    echo "&lt;i&gt;".$annee." est une annee bissextile&lt;/i&gt;";
                }
                else{
                    echo "&lt;i&gt;".$annee." n'est pas une annee bissextile&lt;/i&gt;";
                }
            }
            affiche("2020");
            affiche("2021");
        ?&gt;
    </code>
</pre>
<h3>Exercice 4 :</h3>
<h4>Consignes :</h4>
<p>-Montrez que la date du 32/17/2019 est erronée.</p>
<?php	
$date =  DateTime::createFromFormat("d/m/Y" , "32/17/2019");	
$errors = DateTime::getLastErrors();	
if ($errors["error_count"]>0 || $errors["warning_count"]>0) {
    echo "<i>La date 32/17/2019 est invalide</i>";
}
?>
<pre>
    <code>
        &lt;?php	
            $date =  DateTime::createFromFormat("d/m/Y" , "32/17/2019");	
            $errors = DateTime::getLastErrors();	
            if ($errors["error_count"]&gt;0 || $errors["warning_count"]&gt;0) {
                echo "La date 32/17/2019 est invalide";
            }
        ?&gt;
    </code>
</pre>
<h3>Exercice 5 :</h3>
<h4>Consignes :</h4>
<p>-Affichez l'heure courante sous cette forme : 11h25.</p>
<?php
    $now = new DateTime();
    $now = $now->format("H\hh");
    echo "<i>Il est ".$now."</i>";
  ?>
<h4>Code de l'exercice :</h4>
<pre>
    <code>
        &lt;?php
            $now = new DateTime();
            $now = $now-&gt;format("H\hh");
            echo "&lt;i&gt;Il est ".$now."&lt;/i&gt;";
        ?&gt;
    </code>
</pre>
<h3>Exercice 6 :</h3>
<h4>Consignes :</h4>
<p>-Ajoutez 1 mois à la date courante. </p>
<?php
    $now2 = new DateTime();
    $now2 = $now2->add(new DateInterval("P1M"));
    $now2 = $now2->format("d/m/Y");
    echo "<i>Dans un mois nous serons le ".$now2."</i>";
?>
<h4>Code de l'exercice :</h4>
<pre>
    <code>
        &lt;?php
            $now2 = new DateTime();
            $now2 = $now2-&gt;add(new DateInterval("P1M"));
            $now2 = $now2-&gt;format("d/m/Y");
            echo "&lt;i&gt;Dans un mois nous serons le ".$now2."&lt;/i&gt;";
        ?&gt;
    </code>
</pre>
<h3>Exercice :</h3>
<h4>Consignes :</h4>
<p>-Que s'est-il passé le 1000200000</p>
<?php
$time = 1000200000;
$date = new DateTime("@$time");
$date = $date->format("d/m/y");
echo "<i>Nous etions le ".$date."</i>";
?>
<h4>Code de l'exercice :</h4>
<pre>
    <code>
        &lt;?php
            $time = 1000200000;
            $date = new DateTime("@$time");
            $date = $date-&gt;format("d/m/y");
            echo "&lt;i&gt;Nous etions le ".$date."&lt;/i&gt;";
        ?&gt;
    </code>
</pre>