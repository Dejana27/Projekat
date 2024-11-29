'use strict';

let imeSalona = document.querySelector('#yourName');
let brojTelefona = document.querySelector('#phoneNumber');
let email = document.querySelector('#yourEmail');
let username = document.querySelector('#yourUsername');
let password = document.querySelector('#yourPassword');
let repeatedPassword = document.querySelector('#yourRepeatedPassword');
let selectGrad = document.querySelector('#city');
let selectUlica = document.querySelector('#street');
let selectTipSalona = document.querySelector('#type');
let createBtn = document.querySelector('#createButton');
let radniDani = document.querySelector('#workDays');
let radnoVrijemePocetak = document.querySelector('#startWorkingHours');
let radnoVrijemeKraj = document.querySelector('#endWorkingHours');

//registrovanje salona
createBtn.addEventListener('click', function (e) {
    e.preventDefault();
    let idGrad = selectGrad.value;
    let ulica = selectUlica.value;
    let idTip = selectTipSalona.value;
    let ime = imeSalona.value;
    let broj = brojTelefona.value;
    let emailValue = email.value;
    let passwordValue = password.value;
    let repeatedPasswordValue = repeatedPassword.value;
    let usernameValue = username.value
    let workDays = radniDani.value;
    let workHoursStart = radnoVrijemePocetak.value;
    let workHoursEnd = radnoVrijemeKraj.value;


    let params = new FormData();
    let xhr = new XMLHttpRequest();
    xhr.open('POST', createSalonUrl, true);
    params.append('name', ime);
    params.append('number', broj);
    params.append('email', emailValue);
    if (passwordValue === repeatedPasswordValue) {
        params.append('password', passwordValue);
        params.append('repeatedPassword', repeatedPasswordValue);
    }
    params.append('username', usernameValue);
    params.append('cityId', idGrad);
    params.append('street', ulica);
    params.append('serviceId', idTip);
    params.append('workDays', workDays);
    params.append('workHoursStart', workHoursStart);
    params.append('workHoursEnd', workHoursEnd);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4) {
            if (this.status === 200) {
                let jsonResponse = JSON.parse(xhr.responseText);
                if (jsonResponse["success"] === true) {
                    // alert('Korisnik je uspješno kreiran!');
                    Swal.fire({
                        position: "center",
                        icon: "success",
                        title: "Korisnik je uspješno kreiran!",
                        showConfirmButton: false,
                        timer: 1500
                    });
                    imeSalona.value = brojTelefona.value = email.value = password.value = username.value = repeatedPassword.value = radniDani.value = radnoVrijemePocetak.value = radnoVrijemeKraj.value = '';
                    // location.reload();
                } else {
                    alert(jsonResponse.message);
                }
            } else {
                alert('Došlo je do greške. Molimo pokušajte ponovo.');
            }
        }
    }


});

//prikaz svih gradova
function displayCities() {
    let params = new FormData();
    let xhr = new XMLHttpRequest();

    xhr.open('POST', displayAllCities, true);
    xhr.send(params)
    xhr.onreadystatechange = function () {
        if (this.readyState === 4) {
            if (this.status === 200) {
                let jsonResponse = JSON.parse(xhr.responseText);
                if (jsonResponse["success"] === true) {
                    let response = jsonResponse["cities"];
                    response.forEach(res => {
                        let optionTag = document.createElement('option');
                        optionTag.innerHTML = `${res.ime}`;
                        optionTag.value = `${res.id}`;
                        selectGrad.appendChild(optionTag);
                    });
                }
            }
        }
    }
}

//prikaz svih usluga
function displayServices() {
    let params = new FormData();
    let xhr = new XMLHttpRequest();

    xhr.open('POST', displayAllSalons, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4) {
            if (this.status === 200) {
                let jsonResponse = JSON.parse(xhr.responseText);
                if (jsonResponse["success"] === true) {
                    let response = jsonResponse["salon"];
                    response.forEach(res => {
                        let optionTag = document.createElement('option');
                        optionTag.innerHTML = `${res.naziv}`;
                        optionTag.value = `${res.id}`;
                        selectTipSalona.appendChild(optionTag);
                    });
                }
            }
        }
    }
}

//ovo je multi-select za ulice - odnosno moze da bira ulicu ili da sama doda novu
$(document).ready(function () {
    $("#street").select2({
        tags: true
    })
    displayCities();
    displayServices();
});

