<link rel="stylesheet" href="../assets/CSS/style.css">
<h1>Les Fonctions PHP</h1>
<h3>Exercice 1 :</h3>
<h4>Consignes :</h4>
<p>-Ecrivez une fonction qui permette de générer un lien.</p>
<p>-La fonction doit prendre deux paramètres, le lien et le titre</p>
<?php  
    function lien($link, $titre) { 
        echo "<a href=$link>$titre </a>"; 
}; 
            
    lien("https://www.reddit.com/", "Reddit Hug"); 
?>
<h4>Code de l'exercice :</h4>
<pre>
    <code>
            &lt;?php  
            function lien($link, $titre) { 
                echo "&lt;a href=$link&gt;$titre &lt;/a&gt;"; 
        }; 
                    
            lien("https://www.reddit.com/", "Reddit Hug"); 
        ?&gt;
    </code>
</pre>
<h3>Exercice 2 :</h3>
<h4>Consignes :</h4>
<p>Ecrivez une fonction qui calcul la somme des valeurs d'un tableau</p>
<p>La fonction doit prendre un paramètre de type tableau</p>
<?php
$tab = array(4, 3, 8, 2);
function somme($array)
{
    $resultat = array_sum($array);
    return $resultat; 
}
echo "<i>La somme des valeurs du tableau est egal a ".somme($tab)."</i>";
?>
<h4>Code de l'exercice :</h4>
<pre>
    <code>
        &lt;?php
        $tab = array(4, 3, 8, 2);
        function somme($array)
        {
            $resultat = array_sum($array);
            return $resultat; 
        }
        echo "&lt;i&gt;La somme des valeurs du tableau est egal a ".somme($tab)."&lt;/i&gt;";
        ?&gt;
    </code>
</pre>
<h3>Exercice 3 :</h3>
<h4>Consignes :</h4>
<p>-Créer une fonction qui vérifie le niveau de complexité d'un mot de passe</p>
<p>-Elle doit prendra un paramètre de type chaîne de caractères. Elle retournera une valeur booléenne qui vaut true si le paramètre (le mot de passe) respecte les règles suivantes :</p>
<p>-Faire au moins 8 caractères de long</p>
<p>-Avoir au moins 1 chiffre</p>
<p>-Avoir au moins une majuscule et une minuscule</p>
<?php
function complex_password($mdp){
    $longueur = strlen($mdp);
    if($longueur >= 8){
        $check = preg_match('/[A-Z]/',$mdp);
        $check = $check + preg_match('/[a-z]/',$mdp);
        $check = $check + preg_match('/[0-9]/',$mdp);
        if($check == 3){
            $check = true;
        }
        else{
            $check = false;
        }
    }
    else{
        $check = false;
    }
    return $check;
};
$resultat = complex_password("TopSecret42");
var_dump($resultat);
?>
<h4>Code de l'exercice :</h4>
<pre>
    <code>
            &lt;?php
            function complex_password($mdp){
                $longueur = strlen($mdp);
                if($longueur &gt;= 8){
                    $check = preg_match('/[A-Z]/',$mdp);
                    $check = $check + preg_match('/[a-z]/',$mdp);
                    $check = $check + preg_match('/[0-9]/',$mdp);
                    if($check == 3){
                        $check = true;
                    }
                    else{
                        $check = false;
                    }
                }
                else{
                    $check = false;
                }
                return $check;
            };
            $resultat = complex_password("TopSecret42");
            var_dump($resultat);
            ?&gt;
    </code>
</pre>