var text;
var validator = {};

function validateMail() {
    const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if(!re.test(document.getElementById("nuovaEmail").value)) {
        text = "Formato email non valido."
        $("#erroreMail").empty();
        $("#erroreMail").append(text);
        $("#nuovaEmail").css("background-color", "#ffc0ad");
        validator.mail = false;
    }else {
        $email = $("#nuovaEmail").val();
        $.post("ControlloEmailAJAX", {field1: $email},
            function(returnedData){
                var found = JSON.parse(returnedData);
                if(found == "vero"){
                    $("#erroreMail").empty();
                    $("#erroreMail").append("email già presente nel database.");
                    $("#nuovaEmail").css("background-color", "#ffc0ad");
                    validator.mail = false;
                } else{
                    $("#erroreMail").empty();
                    $("#nuovaEmail").css("background-color", "#ffffff");
                    validator.mail = true;
                }
            });
    }
}

function validatePassword() {

    const re = /^[A-Za-z0-9_.-]{5,20}$/;
    if(!re.test(document.getElementById("nuovaPassword").value)) {
        text = "Formato password non valido."
        $("#erroreNuovaPassword").empty();
        $("#erroreNuovaPassword").append(text);
        $("#nuovaPassword").css("background-color", "#ffc0ad");
        validator.password = false;

    }else{
        validateConfermaPassword();
            $("#erroreNuovaPassword").empty();
            $("#nuovaPassword").css("background-color", "#ffffff");
            validator.password = true;

        }

}

function validateConfermaPassword() {

    if(document.getElementById("nuovaPasswordConferma").value != document.getElementById("nuovaPassword").value) {
        text = "le due password devono coincidere."
        $("#erroreNuovaPasswordConferma").empty();
        $("#erroreNuovaPasswordConferma").append(text);
        validator.NuovaPassword = false;

    }else{
        $("#erroreNuovaPasswordConferma").empty();
        $("#password").css("background-color", "#ffffff");
        validator.NuovaPassword = true;
    }

}

function validateNuovaVia() {
    const re = /^[A-Za-z]{2,30}((\s[A-z]{2,30})?){1,4}(\s\d{1,4})?$/;
    if(!re.test(document.getElementById("nuovaVia").value)) {
        text = "Formato via non valido."
        $("#erroreNuovaVia").empty();
        $("#erroreNuovaVia").append(text);
        $("#nuovaVia").css("background-color", "#ffc0ad");
        validator.via = false;
    }else{
        $("#erroreNuovaVia").empty();
        $("#nuovaVia").css("background-color", "#ffffff");
        validator.via = true;
    }
}

function validateNuovaProvincia() {
    const re = /^[A-Z]{2}?$/;
    if(!re.test(document.getElementById("nuovaProvincia").value)) {
        text = "Formato provincia non valido."
        $("#erroreNuovaProvincia").empty();
        $("#erroreNuovaProvincia").append(text);
        $("#nuovaProvincia").css("background-color", "#ffc0ad");
        validator.provincia = false;
    }else{
        $("#erroreNuovaProvincia").empty();
        $("#nuovaProvincia").css("background-color", "#ffffff");
        validator.provincia = true;
    }
}

function validateNuovaCitta() {
    const re = /^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$/;
    if(!re.test(document.getElementById("nuovaCitta").value)) {
        text = "Formato città non valido."
        $("#erroreNuovaCitta").empty();
        $("#erroreNuovaCitta").append(text);
        $("#nuovaCitta").css("background-color", "#ffc0ad");
        validator.citta = false;
    }else{
        $("#erroreNuovaCitta").empty();
        $("#nuovaCitta").css("background-color", "#ffffff");
        validator.citta = true;
    }
}


document.addEventListener("DOMContentLoaded", function() {
    $("#modificaPassword").submit(function(e){
        if(validator.password == false || validator.NuovaPassword ==false || validator.password == null|| validator.NuovaPassword == null){
            e.preventDefault();
            validatePassword();
            validateConfermaPassword();
        }
    })

    $("#modificaIndirizzo").submit(function(e){
        if(validator.citta == false || validator.citta ==null || validator.via == false|| validator.via == null || validator.provincia == false|| validator.provincia == null){
            e.preventDefault();
            validateNuovaCitta();
            validateNuovaProvincia();
            validateNuovaVia();
        }
    })

    $("#modificaEmail").submit(function (e) {
        if(validator.mail == false || validator.mail == null){
            e.preventDefault();
            validateMail();
        }
    })
});



