'use strict';

let appointmentsContainer = document.querySelector('#showAppointments');
let logoutButton = document.querySelector('#logoutButton');

function showAppointments() {

    let params = new FormData();
    let xhr = new XMLHttpRequest();
    let sum = 0;
    xhr.open('POST', showAppointmentUrl, true);
    xhr.send(params);
    appointmentsContainer.innerHTML = '';
    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if (jsonResponse["success"] === true) {
                let response = jsonResponse["data"];

                response.forEach(res => {

                    let div = document.createElement('div');
                    div.classList.add('col-3');
                    let salonName = document.createElement("legend");
                    salonName.innerHTML = `Ime salona: ${res.nazivSalona}`;
                    let time = document.createElement('p');
                    time.innerHTML = `Vrijeme tretmana: ${res.vrijeme}:00 h`;
                    let nazivUsluge = document.createElement('p');
                    nazivUsluge.innerHTML = `Naziv usluge: ${res.nazivUsluge}`;
                    let datum = document.createElement('p');
                    let day = new Date(res.datum).getDate();
                    let month = new Date(res.datum).getMonth();
                    let monthInteger = parseInt(month) + 1;
                    let monthString = monthInteger.toString();
                    let year = new Date(res.datum).getFullYear();
                    datum.innerHTML = `Datum: ${day}.${monthString}.${year}`;

                    let status = document.createElement('span');
                    status.classList.add('badge');

                    if (res.status === 'Odobreno') {
                        status.classList.add('bg-success');
                        status.innerHTML = `Zakazano`;
                    } else if (res.status === 'Na čekanju') {
                        status.classList.add('bg-warning');
                        status.innerHTML = `Na čekanju`;
                    } else {
                        status.classList.add('bg-danger');
                        status.innerHTML = `Odbijeno`;
                    }

                    let cijenaUsluge = document.createElement('p');
                    // console.log(res.cijenaUsluge);
                    // if (res.cijenaUsluge.length > 1) {
                    //     for (let i = 0; i < res.cijenaUsluge.length; i++) {
                    //         sum += res.cijenaUsluge[i];
                    //     }
                    //     cijenaUsluge.innerHTML = `Cijena usluge: ${sum} €`;
                    // } else if (res.cijenaUsluge.length === 1) {
                    cijenaUsluge.innerHTML = `Cijena usluge: ${res.cijenaUsluge} €`;
                    // } else {
                    //     cijenaUsluge.innerHTML = '';
                    //     salonName.innerHTML = '';
                    //     nazivUsluge.innerHTML = '';
                    //     time.innerHTML = '';
                    //     div.innerHTML = '';
                    // }
                    div.innerHTML = '';
                    div.appendChild(salonName);
                    div.appendChild(time);
                    div.appendChild(datum);
                    div.appendChild(nazivUsluge);
                    div.appendChild(cijenaUsluge);
                    div.appendChild(status);
                    appointmentsContainer.appendChild(div);
                });
            }
        }
    }
}

logoutButton.addEventListener('click', function (e) {
    e.preventDefault();
    window.open('http://localhost:8080/logout/index', '_self');
});
showAppointments();