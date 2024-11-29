'use strict';

let mainContainer = document.querySelector('#main');
let selectYear = document.querySelector('#selectYear');
let selectMonth = document.querySelector('#selectMonth');


function getRevenueForEachMonth() {

    let sum = 0;
    let year = selectYear.value;
    let month = selectMonth.value;

    let params = new FormData();
    let xhr = new XMLHttpRequest();

    params.append('year', year);
    params.append('month', month);

    xhr.open('POST', getRevenueForEachMonthUrl, true);
    xhr.send(params);


    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if (jsonResponse["success"] === true) {
                let response = jsonResponse["data"];

                let revenueContainer = document.createElement('div');
                revenueContainer.classList.add('card', 'bg-light', 'mb-3', 'col-3');
                revenueContainer.style.width = "18rem";

                let div = document.createElement('div');
                div.classList.add('card-body');
                let zarada = document.createElement('p');
                let divHeader = document.createElement('div');
                divHeader.classList.add('card-header');
                divHeader.innerHTML = 'Zarada po mjesecima';

                response.forEach(res => {

                    let hr = document.createElement('hr');
                    let nazivUsluge = document.createElement('p');
                    let cijenaUsluge = document.createElement('p');

                    let cijena = parseInt(res.cijenaUsluge);
                    sum += cijena;
                    nazivUsluge.innerHTML = `Usluga: ${res.nazivUsluge}`;
                    cijenaUsluge.innerHTML = `Cijena usluge: ${res.cijenaUsluge} €`;

                    div.appendChild(nazivUsluge);
                    div.appendChild(cijenaUsluge);
                    div.appendChild(hr);

                });
                zarada.innerHTML = `Zarada: ${sum} €`;
                div.appendChild(zarada);
                revenueContainer.appendChild(divHeader);
                revenueContainer.appendChild(div);
                mainContainer.appendChild(revenueContainer);

            }
        }
    }
}

selectMonth.addEventListener("DOMContentLoaded", getRevenueForEachMonth());
selectYear.addEventListener('change', function (e) {
    e.preventDefault();
    getRevenueForEachMonth();
});
selectMonth.addEventListener('change', function (e) {
    e.preventDefault();
    getRevenueForEachMonth();
});