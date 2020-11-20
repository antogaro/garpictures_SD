var text;
var validator = {};

function validateMail() {
    const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if(!re.test(document.getElementById("email").value)) {
        validator.email = false;
        text = "Formato email non valido."
        $("#erroreMail").empty();
        $("#erroreMail").append(text);
        $("#email").css("background-color", "#ffc0ad");
    }else {
        $email = $("#email").val();
        $.post("ControlloEmailAJAX", {field1: $email},
            function(returnedData){
            var found = JSON.parse(returnedData);
            if(found == "vero"){
                validator.email = false;
                $("#erroreMail").empty();
                $("#erroreMail").append("email già presente nel database.");
                $("#email").css("background-color", "#ffc0ad");
            } else{
                validator.email = true;
                $("#erroreMail").empty();
                $("#email").css("background-color", "#ffffff");
            }
        });
    }
}

function validateUserName() {
    const re = /^[A-Za-z0-9]{5,20}$/;
    if(!re.test(document.getElementById("nomeUtente").value)) {
        validator.nomeUtente = false;
        text = "Formato nome utente non valido."
        $("#erroreNomeUtente").empty();
        $("#erroreNomeUtente").append(text);
        $("#nomeUtente").css("background-color", "#ffc0ad");
    }else{
        $nomeUtente = $("#nomeUtente").val();
        $.post("ControlloNomeUtenteAJAX", {field1: $nomeUtente},
            function(returnedData){
                var found = JSON.parse(returnedData);
                if(found == "vero"){
                    validator.nomeUtente = false;
                    $("#erroreNomeUtente").empty();
                    $("#erroreNomeUtente").append("Nome utente già presente nel database.");
                    $("#nomeUtente").css("background-color", "#ffc0ad");
                } else{
                    validator.nomeUtente = true;
                    $("#erroreNomeUtente").empty();
                    $("#nomeUtente").css("background-color", "#ffffff");
                }
            });
    }
}

function validateName() {
    const re = /^[A-Za-z]{3,30}$/;
    if(!re.test(document.getElementById("nome").value)) {
        text = "Formato nome non valido."
        $("#erroreNome").empty();
        $("#erroreNome").append(text);
        $("#nome").css("background-color", "#ffc0ad");
        validator.nome = false;
    }else{
        $("#nome").css("background-color", "#ffffff");
        $("#erroreNome").empty();
        validator.nome = true;
    }
}

function validateSurname() {
    const re = /^[A-Za-z]{3,30}$/;
    if(!re.test(document.getElementById("cognome").value)) {
        text = "Formato cognome non valido."
        $("#erroreCognome").empty();
        $("#erroreCognome").append(text);
        $("#cognome").css("background-color", "#ffc0ad");
        validator.cognome = false;
    }else{
        $("#cognome").css("background-color", "#ffffff");
        $("#erroreCognome").empty();
        validator.cognome = true;
    }
}


function validateVia() {
    const re = /^[A-Za-z]{2,30}((\s[A-z]{2,30})?){1,4}(\s\d{1,4})?$/;
    if(!re.test(document.getElementById("via").value)) {
        text = "Formato via non valido."
        $("#erroreVia").empty();
        $("#erroreVia").append(text);
        $("#via").css("background-color", "#ffc0ad");
        validator.via = false;
    }else{
        $("#erroreVia").empty();
        $("#via").css("background-color", "#ffffff");
        validator.via = true;
    }
}

function validateProvincia() {
    const re = /^[A-Z]{2}?$/;
    if(!re.test(document.getElementById("provincia").value)) {
        text = "Formato provincia non valido."
        $("#erroreProvincia").empty();
        $("#erroreProvincia").append(text);
        $("#provincia").css("background-color", "#ffc0ad");
        validator.provincia = false;
    }else{
        $("#erroreProvincia").empty();
        $("#provincia").css("background-color", "#ffffff");
        validator.provincia = true;
    }
}

function validateCitta() {
    const re = /^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$/;
    if(!re.test(document.getElementById("citta").value)) {
        text = "Formato città non valido."
        $("#erroreCitta").empty();
        $("#erroreCitta").append(text);
        $("#citta").css("background-color", "#ffc0ad");
        validator.citta = false;
    }else{
        $("#erroreCitta").empty();
        $("#citta").css("background-color", "#ffffff");
        validator.citta = true;
    }
}

function validateNumero() {

    const re = /^[0-9]{8,13}$/;
    if(!re.test(document.getElementById("telefono").value)) {
        text = "Formato numero telefono non valido."
        $("#erroreNumero").empty();
        $("#erroreNumero").append(text);
        $("#telefono").css("background-color", "#ffc0ad");
        validator.numero = false;
    }else{
        $("#erroreNumero").empty();
        $("#telefono").css("background-color", "#ffffff");
        validator.numero = true;
    }

}

function validatePassword() {

    const re = /^[A-Za-z0-9_.-]{5,20}$/;
    if(!re.test(document.getElementById("password").value)) {
        text = "Formato password non valido."
        $("#errorePassword").empty();
        $("#errorePassword").append(text);
        $("#password").css("background-color", "#ffc0ad");
        validator.password = false;
    }else{
        $("#errorePassword").empty();
        $("#password").css("background-color", "#ffffff");
        validator.password = true;
    }

}

function validateTitolo() {
    const re = /^[a-zA-Z0-9_\s]{2,40}$/;
    if(!re.test(document.getElementById("titolo").value)) {
        text = "Formato titolo non valido."
        $("#erroreTitolo").empty();
        $("#erroreTitolo").append(text);
        $("#titolo").css("background-color", "#ffc0ad");
        validator.titolo = false;
    }else{
        $("#titolo").css("background-color", "#ffffff");
        $("#erroreTitolo").empty();
        validator.titolo = true;
    }
}

function validateDescrizione() {
    const re = /^[ A-Za-z0-9_@./#&+-_\s]{2,}$/;
    if(!re.test(document.getElementById("descrizione").value)) {
        text = "Formato descrizione non valido."
        $("#erroreDescrizione").empty();
        $("#erroreDescrizione").append(text);
        $("#descrizione").css("background-color", "#ffc0ad");
        validator.descrizione = false;
    }else{
        $("#descrizione").css("background-color", "#ffffff");
        $("#erroreDescrizione").empty();
        validator.descrizione = true;
    }
}

function validatePrezzo() {
    const re = /(\d+\.\d{1,2})/;
    if(!re.test(document.getElementById("prezzo").value)) {
        text = "Formato prezzo non valido."
        $("#errorePrezzo").empty();
        $("#errorePrezzo").append(text);
        $("#prezzo").css("background-color", "#ffc0ad");
        validator.prezzo = false;
    }else{
        $("#prezzo").css("background-color", "#ffffff");
        $("#errorePrezzo").empty();
        validator.prezzo = true;
    }
}

function validateTag() {
    const re = /^[a-zA-Z0-9,]{2,}$/;
    if(!re.test(document.getElementById("tagsDaInserire").value)) {
        text = "Formato tags non valido."
        $("#erroreTags").empty();
        $("#erroreTags").append(text);
        $("#tagsDaInserire").css("background-color", "#ffc0ad");
        validator.tag = false;
    }else{
        $("#tagsDaInserire").css("background-color", "#ffffff");
        $("#erroreTags").empty();
        validator.tag = true;
    }
}

function validateFile(){
        var fileName = $("#prodotto").val();
        if(fileName) {
            validator.file = true;
            $("#erroreInserimento").empty();
        } else {
            validator.file = false;
            $("#erroreInserimento").empty();
            $("#erroreInserimento").append("E' necessario caricare un file.");
        }
}

function validateCVV(){
    const re = /^[0-9]{3}$/;
    if(!re.test(document.getElementById("tagsDaInserire").value)) {
        text = "Formato cvv non valido."
        $("#erroreCVV").empty();
        $("#erroreCVV").append(text);
        $("#CVV").css("background-color", "#ffc0ad");
        validator.cvv = false;
    }else{
        $("#CVV").css("background-color", "#ffffff");
        $("#erroreCVV").empty();
        validator.cvv = true;
    }
}

function validateCarta(){
    const re = /^\d{4}([ \-]?)((\d{6}\1?\d{5})|(\d{4}\1?\d{4}\1?\d{4}))$/;
    if(!re.test(document.getElementById("tagsDaInserire").value)) {
        text = "Formato carta non valido."
        $("#erroreCarta").empty();
        $("#erroreCarta").append(text);
        $("#carta").css("background-color", "#ffc0ad");
        validator.carta = false;
    }else{
        $("#carta").css("background-color", "#ffffff");
        $("#erroreCarta").empty();
        validator.carta = true;
    }
}
document.addEventListener("DOMContentLoaded", function() {
    $("#formRegistrazione").submit(function(e){
        if(validator.email == false || validator.nome == false || validator.cognome == false || validator.nomeUtente == false || validator.provincia == false || validator.citta == false || validator.via == false || validator.numero == false || validator.password == false
            || validator.email == null || validator.nome == null || validator.cognome == null || validator.nomeUtente == null || validator.provincia == null || validator.citta == null || validator.via == null || validator.numero == null || validator.password == null) {
            e.preventDefault();
            validateMail();
            validateUserName();
            validateName();
            validatePassword();
            validateSurname();
            validateProvincia();
            validateVia();
            validateCitta();
            validateNumero();
        }
    })

    $("#caricaProdotto").submit(function (e) {
        if(validator.titolo == false || validator.descrizione == false || validator.prezzo == false || validator.file == false || validator.tag == false
            || validator.titolo == null  || validator.descrizione == null || validator.prezzo == null || validator.file == null || validator.tag == null){
            e.preventDefault();
            validateTitolo();
            validateDescrizione();
            validatePrezzo();
            validateTag();
            validateFile();
        }
    })

    $("#completaPagamento").submit(function (e) {
        e.preventDefault();
        console.log("titolo"+validator.titolo);
        console.log("descrizione"+validator.descrizione);
        console.log("prezzo"+validator.prezzo);
        console.log("tag"+validator.tag);
        console.log("file"+validator.file);
        if(validator.mail == false || validator.mail == null || validator.cvv == false ||
            validator.cvv == null || validator.carta == false || validator.carta == null){
            e.preventDefault();
            validateMail();
            validateCVV();
            validateCarta();
        }
    })
});


