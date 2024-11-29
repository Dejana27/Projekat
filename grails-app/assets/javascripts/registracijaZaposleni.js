'use strict'

let employeeName = document.querySelector('#yourName');
let employeeSurname = document.querySelector('#yourLastname');
let employeeEmail = document.querySelector('#yourEmail');
let employeeIDNumber = document.querySelector('#yourIdentificationNumber');
let employeeWorkHoursStart = document.querySelector('#startWorkingHours');
let employeeWorkHoursEnd = document.querySelector('#endWorkingHours');
let employeePhoneNumber = document.querySelector('#phoneNumber');
let employeeUsername = document.querySelector('#yourUsername');
let employeePassword = document.querySelector('#yourPassword');
let employeeRepeatedPassword = document.querySelector('#yourRepeatedPassword');
let saveEmployeeButton = document.querySelector('#createButton');


saveEmployeeButton.addEventListener('click', function (e) {
    e.preventDefault();

    let name = employeeName.value;
    let surname = employeeSurname.value;
    let email = employeeEmail.value;
    let JMBG = employeeIDNumber.value;
    let startWorkHours = employeeWorkHoursStart.value;
    let endWorkHours = employeeWorkHoursEnd.value;
    let username = employeeUsername.value;
    let password = employeePassword.value;
    let repeatedPassword = employeeRepeatedPassword.value;
    let phoneNumber = employeePhoneNumber.value;

    let params = new FormData();
    let xhr = new XMLHttpRequest();
    xhr.open('POST', saveEmployeeUrl, true);
    params.append('name', name);
    params.append('surname', surname);
    params.append('email', email);
    params.append('JMBG', JMBG);
    params.append('startWorkHours', startWorkHours);
    params.append('endWorkHours', endWorkHours);
    params.append('username', username);
    params.append('password', password);
    params.append('repeatedPassword', repeatedPassword);
    params.append('phonenumber', phoneNumber);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse["success"] === true) {
                Swal.fire({
                    position: "center",
                    icon: "success",
                    title: "Korisnik je uspješno kreiran!",
                    showConfirmButton: false,
                    timer: 1500
                });
                employeeName.value = employeeSurname.value = employeeEmail.value = employeeIDNumber.value = employeeWorkHoursStart.value = employeeWorkHoursEnd.value = employeeUsername.value
                    = employeePassword.value = employeeRepeatedPassword.value =
                    employeePhoneNumber.value = '';
            } else {
                Swal.fire({
                    icon: "error",
                    title: "Greška.",
                    text: "Korisnik nije sačuvan!",
                    showConfirmButton: false,
                    timer: 1500
                });
            }
        }
    }
});