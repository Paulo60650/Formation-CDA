$(document).ready(function () {
    var alpha = /(^[a-zA-Zéèêëôœîïûüàáâæç-\s]+$)/;
    // regex demandant une première lettre en majuscule plus tout les caractères spéciaux ensuite
    var mail = /(^[\w\.-]+@[a-z]+[\.][a-z]{2,3}$)/;
    // regex controlant les adresses mails , on autorise tout les carctères alphanumériques
    // ainsi que ". et -" on dis qu'il faut @ ensuite plus au moins false caractère alphabétique
    // puis un point suivi de 2 ou 3 caractères alphabétiques
    var birth = /(^[0-9]{4}[\-]{1}[0-9]{2}[\-]{1}[[0-9]{2}$)/;
    // Ce regex est pour les dates américaines car c'est la valeur renvoyer par la balise
    // de l'input type date .On demande ainsi les 4 chiffres de l'année suivi d'un "-",puis
    // on controle les 2 chiffres correspondant au mois suivi d'un "-" et enfin les 2 chiffres
    // correspondant au jour
    var code = /(^[0-9]{5}$)|^$/;
    // regex controlant le code postal, on controle s'il y a bien 5 chiffres et uniquemnt des chiffres
    // et une prise en compte du champ vide car non obligatoire
    var adr = /(^[0-9]+[a-zA-Z-\s]+$)|^$/;
    // regex controlant l'adresse , il doit y avoir au moins false chiffre suivi de au moins
    // false caractère alphabétique et une prise en compte du champ vide car non obligatoire
    var city = /(^[A-Z]+[a-zA-Zéèêëôœîïûüàáâæç-\s]+$)|^$/;
    // regex controlant la ville , le meme que alpha mais prenant en compte un champ vide car non obligatoire

    // Declaration et execution d'une fonction de controle sur l'evenement keyup du champs Nom
    $("#nom").keyup(function () {
        // Récupère la valeur saisie dans le champ nom     
        var nom = $(this).val();
        if (nom == "") {
            $("#errName").html("Veuillez renseigner ce champs");
            $("#errName").css("color", "crimson");
        }
        else if (!alpha.test(nom)) {
            $("#errName").html("Utilisez uniquement des caractères alphabétiques");
            $("#errName").css("color", "crimson");
        }
        else {
            $("#errName").html("OK");
            $("#errName").css("color", "green");
        }
    });
    // Declaration et execution d'une fonction de controle sur l'evenement keyup du champs Prenom
    $("#prenom").keyup(function () {
        // Récupère la valeur saisie dans le champ prenom  
        var prenom = $(this).val();
        if (prenom == "") {
            $("#errPrenom").html("Veuillez renseigner ce champs");
            $("#errPrenom").css("color", "crimson");
        }
        else if (!alpha.test(prenom)) {
            $("#errPrenom").html("Utilisez uniquement des caractères alphabétiques");
            $("#errPrenom").css("color", "crimson");
        }
        else {
            $("#errPrenom").html("OK");
            $("#errPrenom").css("color", "green");
        }
    });
    // Declaration et execution d'une fonction de controle sur l'evenement blur du champs Date
    $("#date").blur(function () {
        // Récupère la valeur saisie dans le champ date   
        var date = $(this).val();
        if (date == "") {
            $("#errDate").html("Veuillez renseigner ce champs");
            $("#errDate").css("color", "crimson");
        }
        else if (!birth.test(date)) {
            $("#errDate").html("Veuillez saisir une date de naissance valide");
            $("#errDate").css("color", "crimson");
        }
        else {
            $("#errDate").html("OK");
            $("#errDate").css("color", "green");
        }
    });
    // Declaration et execution d'une fonction de controle sur l'evenement keyup du champs Code postal
    $("#codepost").keyup(function () {
        // Récupère la valeur saisie dans le champ code postal     
        var codepost = $(this).val();
        if (codepost == "") {
            $("#errCp").html("");
        }
        else if (!code.test(codepost)) {
            $("#errCP").html("Veuillez saisir un code postal valide");
            $("#errCP").css("color", "crimson");
        }
        else {
            $("#errCP").html("OK");
            $("#errCP").css("color", "green");
        }
    });
    // Declaration et execution d'une fonction de controle sur l'evenement keyup du champs Adresse
    $("#adresse").keyup(function () {
        // Récupère la valeur saisie dans le champ adresse     
        var adresse = $(this).val();
        if (adresse == "") {
            $("#errAdr").html("");
        }
        else if (!adr.test(adresse)) {
            $("#errAdr").html("Veuillez saisir une adresse valide");
            $("#errAdr").css("color", "crimson");
        }
        else {
            $("#errAdr").html("OK");
            $("#errAdr").css("color", "green");
        }
    });
    // Declaration et execution d'une fonction de controle sur l'evenement keyup du champs Ville
    $("#ville").keyup(function () {
        // Récupère la valeur saisie dans le champ ville
        var ville = $(this).val();
        if (ville == "") {
            $("#errVille").html("");
        }
        else if (!city.test(ville)) {
            $("#errVille").html("Veuillez saisir une Ville valide");
            $("#errVille").css("color", "crimson");
        }
        else {
            $("#errVille").html("OK");
            $("#errVille").css("color", "green");
        }
    });
    // Declaration et execution d'une fonction de controle sur l'evenement keyup du champs Mail
    $("#mail").keyup(function () {
        // Récupère la valeur saisie dans le champ mail
        var email = $(this).val();
        if (email == "") {
            $("#errMail").html("Veuillez renseigner ce champ");
            $("#errMail").css("color", "crimson");
        }
        else if (!mail.test(email)) {
            $("#errMail").html("Veuillez saisir un code mail valide");
            $("#errMail").css("color", "crimson");
        }
        else {
            $("#errMail").html("OK");
            $("#errMail").css("color", "green");
        }
    });
    // Declaration et execution d'une fonction sur l'evenement keyup du champs Question
    $("#question").keyup(function () {
        // Récupère la valeur saisie dans le champ question
        var question = $(this).val();
        if (question == "") {
            $("#errQuest").html("Veuillez renseigner ce champ");
            $("#errQuest").css("color", "crimson");
        }
        else {
            $("#errQuest").html("OK");
            $("#errQuest").css("color", "green");
        }
    });
    //Debut de la fonction verif suite au clik sur Envoyer 
    function verif() {
        // Declaration de toutes les variable conteant les valeurs des inputs du formulaire
        var check = true;
        var nom = $("#nom").val();
        var prenom = $("#prenom").val();
        var sexe = $("#inlineRadio1").is(":checked");
        var sexe2 = $("#inlineRadio2").is(":checked");
        var date = $("#date").val();
        var codepost = $("#codepost").val();
        var adresse = $("#adresse").val();
        var ville = $("#ville").val();
        var email = $("#mail").val();
        var sujet = $("#sujet").val();
        var question = $("#question").val();
        var accept = $("#accept").is(":checked");

        // Verif du nom
        if (nom == "") {
            $("#errName").html("Veuillez renseigner ce champs");
            $("#errName").css("color", "crimson");
            check = false;
        }
        else if (!alpha.test(nom)) {
            $("#errName").html("Utilisez uniquement des caractères alphabétiques");
            $("#errName").css("color", "crimson");
            check = false;
        }
        else {
            $("#errName").html("");
        }
        // Verif du prenom
        if (prenom == "") {
            $("#errPrenom").html("Veuillez renseigner ce champs");
            $("#errPrenom").css("color", "crimson");
            check = false;
        }
        else if (!alpha.test(prenom)) {
            $("#errPrenom").html("Utilisez uniquement des caractères alphabétiques");
            $("#errPrenom").css("color", "crimson");
            check = false;
        }
        else {
            $("#errPrenom").html("");
        }
        // Verif du sexe
        if (sexe == false && sexe2 == false) {
            $("#errSexe").html("Champs Obligatoire");
            $("#errSexe").css("color", "crimson");
            check = false;
        }
        else {
            $("#errSexe").html("");
        }
        // Verif date de naissance
        if (date == "") {
            $("#errDate").html("Veuillez renseigner ce champs");
            $("#errDate").css("color", "crimson");
            check = false;
        }
        else if (!birth.test(date)) {
            $("#errDate").html("Veuillez saisir une date de naissance valide");
            $("#errDate").css("color", "crimson");
            check = false;
        }
        else {
            $("#errDate").html("");
        }
        // Verif du code postal
        if (!code.test(codepost)) {
            $("#errCP").html("Veuillez saisir un code postal valide");
            $("#errCP").css("color", "crimson");
            check = false;
        }
        else {
            $("#errCP").html("");
        }
        // Verif de l'adresse
        if (!adr.test(adresse)) {
            $("#errAdr").html("Veuillez saisir une adresse valide");
            $("#errAdr").css("color", "crimson");
            check = false;
        }
        else {
            $("#errAdr").html("");
        }
        // Verif de la ville

        if (!city.test(ville)) {
            $("#errVille").html("Veuillez saisir une Ville valide");
            $("#errVille").css("color", "crimson");
            check = false;
        }
        else {
            $("#errVille").html("");
        }
        // Verif de l'email
        if (email == "") {
            $("#errMail").html("Veuillez renseigner ce champ");
            $("#errMail").css("color", "crimson");
            check = false;
        }
        else if (!mail.test(email)) {
            $("#errMail").html("Veuillez saisir un mail valide");
            $("#errMail").css("color", "crimson");
            check = false;
        }
        else {
            $("#errMail").html("");
        }
        //Verif de la demande
        if (sujet == 1) {
            $("#errSujet").html("Veuillez renseigner ce champ");
            $("#errSujet").css("color", "crimson");
            check = false;
        }
        else {
            $("#errSujet").html("");
        }
        // Verif de la question
        console.log(alpha.test(nom));
        if (question == "") {
            $("#errQuest").html("Veuillez renseigner votre question");
            $("#errQuest").css("color", "crimson");
        }
        else if (!alpha.test(question)) {
            $("#errQuest").html("Certains caracteres sont invalides");
            $("#errQuest").css("color", "crimson");
        }
        else {
            $("#errQuest").html("");
        }
        // Verif de l'acceptation
        if (accept == false) {
            $("#errAccept").html("Veuillez cocher cette case");
            $("#errAccept").css("color", "crimson");
        }
        else {
            $("#errAccept").html("")
        }
        // Verif avant envoie du formulaire
        if (check == true) {
            document.forms[0].submit();
        }
        else {
            return false;
        }
    };
    $("#envoie").click(function (event) {
        event.preventDefault();
        verif();
    });
}); 