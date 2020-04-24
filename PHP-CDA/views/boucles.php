<link rel="stylesheet" href="../assets/CSS/style.css">
<h1>Les Boucles PHP</h1>
<h3>Exercice 1 :</h3>
<h4>Consigne :</h4>
<p>-Ecrire un script PHP qui affiche tous les nombres impairs entre 0 et 150, par ordre croissant : 1 3 5 7...</p>
<div class="boucle">
<?php 
  for ($i = 1; $i <= 149; $i += 2) {
    if($i == 149){
      echo $i;
    }
    else{
      echo $i.", ";
    }
  }
?> 
</div>
<h4>Code de l'exercice :</h4>
<!-- Incorporation du code de l'exercice 1 grace aux balises <pre> et <code> -->
<pre>
  <code>
  &lt;?php 
      for ($i = 1; $i &lt;= 149; $i += 2) {
        if($i == 149){
      echo $i;
    }
    else{
      echo $i.", ";
    }
  }
    ?&gt; 
  </code>
</pre>
<!-- Debut de l'exercice 2 -->
<h3>Exercice 2 :</h3>
<h4>Consigne :</h4>
<p>-Écrire un programme qui écrit 500 fois la phrase "Je dois faire des sauvegardes régulières de mes fichiers"</p>
<div class="boucle">
  <?php 
  for ($i = 1; $i <= 500; $i++) { 
    echo "$i. Je dois faire des sauvegardes régulières de mes fichiers."."<br>";  
  } 
  ?> 
  </div>
  <h4>Code l'exercice :</h4>
  <!-- Incorporation du code de l'exercice 2 grace aux balises <pre> et <code> -->
  <pre>
  <code>
    &lt;?php 
  for ($i = 1; $i &lt;= 500; $i++) { 
    echo "$i. Je dois faire des sauvegardes régulières de mes fichiers."."&lt;br&gt;";  
  } 
  ?&gt; 
    </code>
  </pre>
  <br>
  <!-- Debut de l'exercice 3 -->
  <h3>Exercice 3 :</h3>
  <h4>Consigne :</h4>
  <p>- Ecrire un script qui affiche la table de multiplication totale de {1,...,12} par {1,...,12} dans un tableau HTML</p>
  <div class="boucle">
  <?php 
     echo "<table>";
     echo "<tr>";
     echo "<td>X</td>";
     for ($i = 0; $i <= 12; $i++)
     {
       echo "<td>$i</td>";
     }
     echo "</tr>";
     for ($i = 0; $i <= 12; $i++)
     {
      echo "<tr>";
      echo "<td>$i</td>";
      for ($j = 0; $j <= 12; $j++)
      {
        $res = $i * $j;
        echo "<td> $res </td>";
      }
      echo "</tr>";
     }
     echo "</table>";
  ?> 
  </div>
  <h4>Code l'exercice :</h4>
  <!-- Incorporation du code de l'exercice 3 grace aux balises <pre> et <code> -->
  <pre>
    <code>
    &lt;?php 
     echo "&lt;table>";
     echo "&lt;tr>";
     echo "&lt;td>X&lt;/td>";
     for ($i = 0; $i &lt;= 12; $i++)
     {
       echo "&lt;td>$i&lt;/td>";
     }
     echo "&lt;/tr>";
     for ($i = 0; $i &lt;= 12; $i++)
     {
      echo "&lt;tr>";
      echo "&lt;td>$i&lt;/td>";
      for ($j = 0; $j &lt;= 12; $j++)
      {
        $res = $i * $j;
        echo "&lt;td&gt;$res &lt;/td>";
      }
      echo "&lt;/tr>";
     }
     echo "&lt;/table>";
  ?&gt;
    </code>
  </pre>