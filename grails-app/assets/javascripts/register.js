'use strict';


let firstName = document.querySelector('#yourName');
let lastName = document.querySelector('#lastName');
let username = document.querySelector('#yourUsername');
let email = document.querySelector('#yourEmail');
let phoneNumber = document.querySelector('#phoneNumber');
let password = document.querySelector('#yourPassword');
let repeatedPassword = document.querySelector('#yourRepeatedPassword');
let createButton = document.querySelector('#createButton');
let form = document.querySelector('.registrationForm');


// ovdje moram da promijenim opacity za small - da bude vidljivo, ali i da prikaze odgovarajucu poruku
const saveUser = function () {
    let nameValue = firstName.value;
    let lastNameValue = lastName.value;


    let params = new FormData();
    let xhr = new XMLHttpRequest();

    validateUserName(username);
    validateEmail(email);
    validatePassword(password);
    validateRepeatedPassword(password, repeatedPassword);
    // nije dobro treba na neki nacin da provjerim da li su prosle provjere i na osnovu toga da  odradim dodavanje u bazu
    // :((((((((((((
    // if (setSuccess(username) && setSuccess(email) && setSuccess(password) && setSuccess(repeatedPassword)) {


        let usernameValue = username.value;
        let phoneNumberValue = phoneNumber.value;
        let emailValue = email.value;
        let passwordValue = password.value;
        // let repeatedPasswordValue = repeatedPassword.value;


        params.append('name', nameValue);
        params.append('lastName', lastNameValue);
        params.append('phoneNumber', phoneNumberValue);
        params.append('username', usernameValue);
        params.append('password', passwordValue);
        params.append('email', emailValue);
        xhr.open('POST', registerUserUrl, true);
        xhr.send(params);
        xhr.onreadystatechange = function () {
            if (this.readyState === 4) {
                if (this.status === 200) {
                    let jsonResponse = JSON.parse(xhr.responseText);

                }
            }
        }


        firstName.value = username.value = email.value = password.value = repeatedPassword.value = lastName.value = phoneNumber.value = '';
    // }

}

createButton.onclick = function (e) {
    e.preventDefault();
    saveUser();
    Swal.fire({
        position: "center",
        icon: "success",
        title: "Korisnik je sačuvan",
        showConfirmButton: false,
        timer: 1500
    });
    // location.reload();
}

function validateUserName(username) {
    let userNameValue = username.value.trim();
    if (userNameValue === "") {
        setError(username, "Korisničko ime je obavezno!");
    } else if (userNameValue.length < 3 || userNameValue.length > 15) {
        setError(username, "Korisničko ime mora biti između 3 do 15 slova.")
    } else if (!/[A-Z]/.test(userNameValue)) {
        setError(username, "Korisničko ime mora sadržati barem jedno veliko slovo.");
    }
    else {
        setSuccess(username);
        //ovdje treba da u bazu proslijedim ove podatke
    }
}

function validateEmail(email) {
    let emailValue = email.value.trim();
    if (emailValue === "") {
        setError(email, "Email je obavezan.");
    } else if (!emailValue.includes("@") && !emailValue.includes(".")) {
        setError(email, "Ukucajte validnu email adresu.");
    } else if (emailValue.includes("@") && emailValue.includes(".")) {
        setSuccess(email);
        //ovdje treba da u bazu proslijedim ove podatke
    }
}

function validatePassword(password) {
    let passwordValue = password.value.trim();
    if (passwordValue === "") {
        setError(password, "Šifra je obavezna.")
    } else if (passwordValue.length < 8 || passwordValue.length > 15) {
        setError(password, "Šifra mora biti između 8 do 15 slova.")
    }
    // } else if (!passwordValue.includes("1") || !passwordValue.includes("2") || !passwordValue.includes("3") ||
    //     !passwordValue.includes("4") || !passwordValue.includes("5") || !passwordValue.includes("6") || !passwordValue.includes("7")
    //     || !passwordValue.includes("8") || !passwordValue.includes("9")) {
    //     setError(password, "Šifra mora sadržati bar jedan broj");
    // }
    else if (!passwordValue.charAt(0) >= 'A' || !passwordValue.charAt(0) <= 'Z') {
        //provjera da je prvo slovo veliko
        setError(password, "Šifra mora sadržati prvo veliko slovo.");
    } else {
        setSuccess(password);
        //opet prosljedivanje lozinke
    }
}

function validateRepeatedPassword(password, repeatedPassword) {

    let passwordValue = password.value.trim();
    let repeatedPasswordValue = repeatedPassword.value.trim();
    if (repeatedPasswordValue === "") {

        setError(repeatedPassword, "Molimo Vas potvrdite Vašu šifru.")
    } else if (passwordValue !== repeatedPasswordValue) {
        setError(repeatedPassword, "Šifre moraju da se poklapaju.")
    } else {
        setSuccess(repeatedPassword);
        // opet prosljedjivanje lozinke u bazu
    }
}

const setError = (elem, mess) => {
    const formControl = elem.parentElement;
    const errorDisplay = formControl.querySelector(".small");

    errorDisplay.style.opacity = '1';
    errorDisplay.innerText = mess;
    elem.classList.add("error");
    elem.classList.remove("success");

}

const setSuccess = (elem) => {
    const formControl = elem.parentElement;
    const errorDisplay = formControl.querySelector(".small");

    // errorDisplay.innerText = mess;
    elem.classList.add("success");
    elem.classList.remove("error");

}

