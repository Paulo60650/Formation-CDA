<link rel="stylesheet" href="../assets/CSS/style.css">
<h3>Exercice 1 :</h3>
<h4>Consignes :</h4>
<p>-Créez un tableau associant à chaque mois de l’année le nombre de jours du mois.</p> 
<p>-Utilisez le nom des mois comme clés de votre tableau associatif.</p>
<p> -Affichez votre tableau (dans un tableau HTML) pour faire apparaitre sur chaque ligne le nom du mois et le nombre de jours du mois.</p>
<?php 
$tab = array(
    "Janvier" => "31",
    "Fevrier" => "28",
    "Mars" => "31",
    "Avril" => "30",
    "Mai" => "31",
    "Juin" => "30",
    "Juillet" => "31",
    "Aout" => "31",
    "Septembre" => "30",
    "Octobre" => "31",
    "Novembre" => "30",
    "Decembre" => "31"
);
?>  
<table>
<thead>
    <td>Mois</td>
    <td>Jours</td>
</thead>
<tbody>
    <?php foreach($tab as $key => $value) { ?>
    <tr>
        <td><?= $key ?></td>
        <td><?= $value ?></td>
    </tr>
    <?php } ?>
</tbody>
</table>
<h4>Code de l'exercice :</h4>
<pre>
    <code class="css">
        &lt;?php 
            $tab = array(
                "Janvier" =&gt; "31",
                "Fevrier" =&gt; "28",
                "Mars" =&gt; "31",
                "Avril" =&gt; "30",
                "Mai" =&gt; "31",
                "Juin" =&gt; "30",
                "Juillet" =&gt; "31",
                "Aout" =&gt; "31",
                "Septembre" =&gt; "30",
                "Octobre" =&gt; "31",
                "Novembre" =&gt; "30",
                "Decembre" =&gt; "31"
            );
            ?&gt;  
            &lt;table&gt;
            &lt;thead&gt;
                &lt;td&gt;Mois&lt;/td&gt;
                &lt;td&gt;Jours&lt;/td&gt;
            &lt;/thead&gt;
            &lt;tbody&gt;
                &lt;?php foreach($tab as $key =&gt; $value) { ?&gt;
                &lt;tr&gt;
                    &lt;td&gt;&lt;?= $key ?&gt;&lt;/td&gt;
                    &lt;td&gt;&lt;?= $value ?&gt;&lt;/td&gt;
                &lt;/tr&gt;
                &lt;?php } ?&gt;
            &lt;/tbody&gt;
            &lt;/table&gt;
    </code>
</pre>
<h4>Consignes :</h4>
<p>Triez ensuite votre tableau en utilisant comme critère le nombre de jours, puis affichez le résultat.</p>  
<?php asort($tab);?>
<table>
    <thead>
        <td>Mois</td>
        <td>Jours</td>
    </thead>
    <tbody>
        <?php foreach($tab as $key => $value) { ?>
            <tr>
                <td><?= $key ?></td>
                <td><?= $value ?></td>
            </tr>
        <?php } ?>
    </tbody>
</table>
<h4>Code de l'exercice :</h4>
<pre>
    <code>
&lt;?php asort($tab);?&gt;
            &lt;table&gt;
                &lt;thead&gt;
                    &lt;td&gt;Mois&lt;/td&gt;
                    &lt;td&gt;Jours&lt;/td&gt;
                &lt;/thead&gt;
                &lt;tbody&gt;
                    &lt;?php foreach($tab as $key =&gt; $value) { ?&gt;
                        &lt;tr&gt;
                            &lt;td&gt;&lt;?= $key ?&gt;&lt;/td&gt;
                            &lt;td&gt;&lt;?= $value ?&gt;&lt;/td&gt;
                        &lt;/tr&gt;
                    &lt;?php } ?&gt;
                &lt;/tbody&gt;
            &lt;/table&gt;  
    </code>
</pre>
<h3>Exercice 2 :</h3>
<h4>Consignes :</h4>
<p>-Affichez la liste des capitales (par ordre alphabétique) suivie du nom du pays.</p>
<?php
$capitales = array(
    "Bucarest" => "Roumanie",
    "Bruxelles" => "Belgique",
    "Oslo" => "Norvège",
    "Ottawa" => "Canada",
    "Paris" => "France",
    "Port-au-Prince" => "Haïti",
    "Port-d'Espagne" => "Trinité-et-Tobago",
    "Prague" => "République tchèque",
    "Rabat" => "Maroc",
    "Riga" => "Lettonie",
    "Rome" => "Italie",
    "San José" => "Costa Rica",
    "Santiago" => "Chili",
    "Sofia" => "Bulgarie",
    "Alger" => "Algérie",
    "Amsterdam" => "Pays-Bas",
    "Andorre-la-Vieille" => "Andorre",
    "Asuncion" => "Paraguay",
    "Athènes" => "Grèce",
    "Bagdad" => "Irak",
    "Bamako" => "Mali",
    "Berlin" => "Allemagne",
    "Bogota" => "Colombie",
    "Brasilia" => "Brésil",
    "Bratislava" => "Slovaquie",
    "Varsovie" => "Pologne",
    "Budapest" => "Hongrie",
    "Le Caire" => "Egypte",
    "Canberra" => "Australie",
    "Caracas" => "Venezuela",
    "Jakarta" => "Indonésie",
    "Kiev" => "Ukraine",
    "Kigali" => "Rwanda",
    "Kingston" => "Jamaïque",
    "Lima" => "Pérou",
    "Londres" => "Royaume-Uni",
    "Madrid" => "Espagne",
    "Malé" => "Maldives",
    "Mexico" => "Mexique",
    "Minsk" => "Biélorussie",
    "Moscou" => "Russie",
    "Nairobi" => "Kenya",
    "New Delhi" => "Inde",
    "Stockholm" => "Suède",
    "Téhéran" => "Iran",
    "Tokyo" => "Japon",
    "Tunis" => "Tunisie",
    "Copenhague" => "Danemark",
    "Dakar" => "Sénégal",
    "Damas" => "Syrie",
    "Dublin" => "Irlande",
    "Erevan" => "Arménie",
    "La Havane" => "Cuba",
    "Helsinki" => "Finlande",
    "Islamabad" => "Pakistan",
    "Vienne" => "Autriche",
    "Vilnius" => "Lituanie",
    "Zagreb" => "Croatie"
);
ksort($capitales);
?>
<table>
<thead>
    <td>Capitales</td>
    <td>Pays</td>
</thead>
<tbody>
    <?php foreach($capitales as $key => $value) { ?>
    <tr>
        <td><?= $key ?></td>
        <td><?= $value ?></td>
    </tr>
    <?php } ?>
</tbody>
</table>
<h4>Code de l'exercice :</h4>
<pre>
    <code>
            ksort($capitales);
            ?&gt;
            &lt;table&gt;
            &lt;thead&gt;
                &lt;td&gt;Capitales&lt;/td&gt;
                &lt;td&gt;Pays&lt;/td&gt;
            &lt;/thead&gt;
            &lt;tbody&gt;
                &lt;?php foreach($capitales as $key =&gt; $value) { ?&gt;
                &lt;tr&gt;
                    &lt;td&gt;&lt;?= $key ?&gt;&lt;/td&gt;
                    &lt;td&gt;&lt;?= $value ?&gt;&lt;/td&gt;
                &lt;/tr&gt;
                &lt;?php } ?&gt;
            &lt;/tbody&gt;
            &lt;/table&gt;
    </code>
</pre>
<h4>Consignes :</h4>
<p>-Affichez la liste des pays (par ordre alphabétique) suivie du nom de la capitale.</p>
<?php asort($capitales);?>
<table>
<thead>
    <td>Pays</td>
    <td>Capitales</td>
</thead>
<tbody>
    <?php foreach($capitales as $key => $value) { ?>
    <tr>
        <td><?= $value ?></td>
        <td><?= $key ?></td>
    </tr>
    <?php } ?>
</tbody>
</table>
<h4>Code de l'exercice :</h4>
<pre>
    <code>
            &lt;?php asort($capitales);?&gt;
            &lt;table&gt;
            &lt;thead&gt;
                &lt;td&gt;Pays&lt;/td&gt;
                &lt;td&gt;Capitales&lt;/td&gt;
            &lt;/thead&gt;
            &lt;tbody&gt;
                &lt;?php foreach($capitales as $key =&gt; $value) { ?&gt;
                &lt;tr&gt;
                    &lt;td&gt;&lt;?= $value ?&gt;&lt;/td&gt;
                    &lt;td&gt;&lt;?= $key ?&gt;&lt;/td&gt;
                &lt;/tr&gt;
                &lt;?php } ?&gt;
            &lt;/tbody&gt;
            &lt;/table&gt;
    </code>
</pre>
<h4>Consignes :</h4>
<p>-Affichez le nombre de pays dans le tableau.</p>
<?php
$nombre = count($capitales);
echo "<i>Il y a " .$nombre. " pays dans le tableau</i>";
?>
<h4>Code de l'exercice :</h4>
<pre>
    <code>
            &lt;?php
            $nombre = count($capitales);
            echo "&lt;p&gt;Il y a " .$nombre. " pays dans le tableau&lt;/p&gt;";
            ?&gt;
    </code>
</pre>
<h4>Consignes :</h4>
<p>-Supprimer du tableau toutes les capitales ne commençant par la lettre 'B', puis affichez le contenu du tableau.</p>
<?php
$b = '/^(B)/';
foreach($capitales as $key => $value) {
    if(!preg_match($b, $key))
        unset ($capitales[$key]);
}
?>
<table>
<thead>
    <td>Capitales</td>
    <td>Pays</td>
</thead>
<tbody>
    <?php foreach($capitales as $key => $value) { ?>
    <tr>
        <td><?= $key ?></td>
        <td><?= $value ?></td>
    </tr>
    <?php } ?>
</tbody>
</table>
<h4>Code de l'exercice :</h4>
<pre>
    <code>
            &lt;?php
            $b = '/^(B)/';
            foreach($capitales as $key =&gt; $value) {
                if(!preg_match($b, $key))
                    unset ($capitales[$key]);
            }
            ?&gt;
            &lt;table&gt;
            &lt;thead&gt;
                &lt;td&gt;Capitales&lt;/td&gt;
                &lt;td&gt;Pays&lt;/td&gt;
            &lt;/thead&gt;
            &lt;tbody&gt;
                &lt;?php foreach($capitales as $key =&gt; $value) { ?&gt;
                &lt;tr&gt;
                    &lt;td&gt;&lt;?= $key ?&gt;&lt;/td&gt;
                    &lt;td&gt;&lt;?= $value ?&gt;&lt;/td&gt;
                &lt;/tr&gt;
                &lt;?php } ?&gt;
            &lt;/tbody&gt;
            &lt;/table&gt;
    </code>
</pre>
<h3>Exercice 3 :</h3>
<h4>Consignes :</h4>
<p>-Affichez la liste des régions (par ordre alphabétique) suivie du nom des départements.</p>
<?php
$departements = array(
    "Hauts-de-france" => array("Aisne", "Nord", "Oise", "Pas-de-Calais", "Somme"),
    "Bretagne" => array("Côtes d'Armor", "Finistère", "Ille-et-Vilaine", "Morbihan"),
    "Grand-Est" => array("Ardennes", "Aube", "Marne", "Haute-Marne", "Meurthe-et-Moselle", "Meuse", "Moselle", "Bas-Rhin", "Haut-Rhin", "Vosges"),
    "Normandie" => array("Calvados", "Eure", "Manche", "Orne", "Seine-Maritime") 
);
ksort($departements);
?>
<table>
    <thead>
        <td>Regions</td>
        <td>Departements</td>
    </thead>
    <tbody>
<?php 
    foreach ($departements as $key => $value) { 
        echo "<tr><td>$key</td><td>";
    foreach ($value as $value2) {
        echo " $value2, ";
}
        echo "</td></tr>";     
}?>
    </tbody>
</table>
<h4>Code de l'exercice :</h4>
<pre>
    <code>
            &lt;?php
            $departements = array(
                "Hauts-de-france" =&gt; array("Aisne", "Nord", "Oise", "Pas-de-Calais", "Somme"),
                "Bretagne" =&gt; array("Côtes d'Armor", "Finistère", "Ille-et-Vilaine", "Morbihan"),
                "Grand-Est" =&gt; array("Ardennes", "Aube", "Marne", "Haute-Marne", "Meurthe-et-Moselle",
                "Meuse", "Moselle", "Bas-Rhin", "Haut-Rhin", "Vosges"),
                "Normandie" =&gt; array("Calvados", "Eure", "Manche", "Orne", "Seine-Maritime") 
            );
            ksort($departements);
            ?&gt;
            &lt;table&gt;
                &lt;thead&gt;
                    &lt;td&gt;Regions&lt;/td&gt;
                    &lt;td&gt;Departements&lt;/td&gt;
                &lt;/thead&gt;
                &lt;tbody&gt;
            &lt;?php 
                foreach ($departements as $key =&gt; $value) { 
                    echo "&lt;tr&gt;&lt;td&gt;$key&lt;/td&gt;&lt;td&gt;";
                foreach ($value as $value2) {
                    echo " $value2, ";
            }
                    echo "&lt;/td&gt;&lt;/tr&gt;";     
            }?&gt;
                &lt;/tbody&gt;
            &lt;/table&gt;
    </code>
</pre>
<h4>Consignes :</h4>
<p>-Affichez la liste des régions suivie du nombre de départements</p>
<table>
<thead>
    <td>Regions</td>
    <td>Departements</td>
</thead>
<tbody>
    <?php foreach($departements as $key => $value) { ?>
    <tr>
        <td><?= $key ?></td>
        <td><?= count($value) ?></td>
    </tr>
    <?php } ?>
</tbody>
</table>
<h4>Code de l'exercice :</h4>
<pre>
    <code>
            &lt;table&gt;
            &lt;thead&gt;
                &lt;td&gt;Regions&lt;/td&gt;
                &lt;td&gt;Departements&lt;/td&gt;
            &lt;/thead&gt;
            &lt;tbody&gt;
                &lt;?php foreach($departements as $key =&gt; $value) { ?&gt;
                &lt;tr&gt;
                    &lt;td&gt;&lt;?= $key ?&gt;&lt;/td&gt;
                    &lt;td&gt;&lt;?= count($value) ?&gt;&lt;/td&gt;
                &lt;/tr&gt;
                &lt;?php } ?&gt;
            &lt;/tbody&gt;
            &lt;/table&gt;
    </code>
</pre>