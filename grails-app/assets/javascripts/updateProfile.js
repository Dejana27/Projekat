'use strict';

let logoutLink = document.querySelector('#logout');
let username = document.querySelector('#first_name');
let email = document.querySelector('#email');
let password = document.querySelector('#password');
let saveButton = document.querySelector('#saveButton');
let deleteButton = document.querySelector('#deleteButton');
let id;
//odjava korisnika
logoutLink.addEventListener('click', function (e) {
    e.preventDefault();
    window.open('http://localhost:8080/logout/index', '_self');
});

//uzimanje podataka korisnika koji je ulogovan
function getData() {

    let params = new FormData();
    let xhr = new XMLHttpRequest();

    xhr.open('POST', getProfileDataUrl, true);
    xhr.send(params);

    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse["success"] === true) {
                let response = jsonResponse["data"];
                username.value = response.username;
                email.value = response.email;
                id = response.id;
            }
        }
    }
}
//cuvanje podataka
saveButton.addEventListener('click', function (e) {
        e.preventDefault();

        let usernameValue = username.value;
        let emailValue = email.value;
        let passwordValue = password.value;

        // let encryptedPass = CryptoJS.AES.encrypt(passwordValue, "Secret Passphrase");

        let params = new FormData();
        let xhr = new XMLHttpRequest();

        params.append('username', usernameValue);
        params.append('email', emailValue);
        params.append('password', passwordValue);

        xhr.open('POST', saveUpdatedUserUrl, true);
        xhr.send(params);

        xhr.onreadystatechange = function () {

            if(this.readyState === 4 && this.status === 200) {
                let jsonResponse = JSON.parse(xhr.responseText);
                if(jsonResponse["success"] === true) {

                }
            }
        }

});


getData();

//brisanje korisnickog naloga
deleteButton.addEventListener('click', function (e) {
    e.preventDefault();

    let params = new FormData();
    let xhr = new XMLHttpRequest();
    params.append('id', id);
    xhr.open('POST', deleteUserUrl, true);
    xhr.send(params);

    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {

        }
    }
});