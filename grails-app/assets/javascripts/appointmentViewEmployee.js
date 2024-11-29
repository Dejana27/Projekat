'use strict';

let mainContainer = document.querySelector('#main');
// let cardHeader = document.querySelector('#cardHeader');
let arrDayIds = [];
showApprovedAppointments();

function showApprovedAppointments() {

    let params = new FormData();
    let xhr = new XMLHttpRequest();
    xhr.open('POST', getApprovedAppointmentsUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if (jsonResponse["success"] === true) {
                let response = jsonResponse["data"];

                response.forEach(res => {

                    let datum = document.createElement('p');
                    let day = new Date(res.datum).getDate();
                    let month = new Date(res.datum).getMonth();
                    let monthInteger = parseInt(month) + 1;
                    let monthString = monthInteger.toString();
                    let year = new Date(res.datum).getFullYear();
                    datum.innerHTML = `Datum: ${day}.${monthString}.${year}`;

                    let vrijeme = document.createElement('p');
                    vrijeme.innerHTML = `Vrijeme termina: ${res.vrijeme}:00 h`;
                    let nazivUsluge = document.createElement('p');
                    nazivUsluge.innerHTML = `Naziv usluge: ${res.nazivUsluge}`;
                    let cijenaUsluge = document.createElement('p');
                    cijenaUsluge.innerHTML = `Cijena usluge: ${res.cijenaUsluge} €`;
                    let tipUsluge = document.createElement('p');
                    tipUsluge.innerHTML = `Tip usluge: ${res.tipUsluge}`;
                    // divHeader.innerHTML = datum.innerHTML;

                    if(arrDayIds.includes(res.dayId)) {
                        // divHeader.innerHTML = datum.innerHTML;
                        // div.innerHTML = '';
                        let div = document.querySelector(`#day${res.dayId}`);
                        let hr = document.createElement('hr');
                        div.appendChild(hr);
                        div.appendChild(nazivUsluge);
                        div.appendChild(cijenaUsluge);
                        div.appendChild(tipUsluge);
                        div.appendChild(vrijeme);

                    } else {
                        arrDayIds.push(res.dayId);
                        let appointmentsContainer = document.createElement('div');
                        appointmentsContainer.classList.add('card', 'bg-light', 'mb-3', 'col-3');
                        appointmentsContainer.style.width = "18rem";
                        let div = document.createElement('div');
                        div.id = `day${res.dayId}`;
                        let divHeader = document.createElement('div');
                        divHeader.classList.add('card-header');
                        div.classList.add('card-body');
                        divHeader.innerHTML = datum.innerHTML;
                        div.appendChild(nazivUsluge);
                        div.appendChild(cijenaUsluge);
                        div.appendChild(tipUsluge);
                        div.appendChild(vrijeme);
                        appointmentsContainer.appendChild(divHeader);
                        appointmentsContainer.appendChild(div);
                        mainContainer.appendChild(appointmentsContainer);
                    }

                });
            }
        }
    }
}