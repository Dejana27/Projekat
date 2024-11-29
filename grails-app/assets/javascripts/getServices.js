'use strict';
let mainContainer = document.getElementById('main');
function showServicesForEmployee() {

    let params = new FormData();
    let xhr = new XMLHttpRequest();
    xhr.open('POST', showServicesForEmployeeUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse["success"] === true){
                let response = jsonResponse["data"];
                response.forEach(res => {
                   let nazivUsluge = document.createElement('p');
                   nazivUsluge.innerHTML = `Naziv usluge: ${res.nazivUsluge}`;
                   let cijenaUsluge = document.createElement('p');
                   cijenaUsluge.innerHTML = `Cijena usluge: ${res.cijenaUsluge} €`;

                   let servicesContainer = document.createElement('div');
                    servicesContainer.classList.add('card', 'bg-light', 'mb-3', 'col-3');
                    servicesContainer.style.width = "18rem";
                    let div = document.createElement('div');
                    let divHeader = document.createElement('div');
                    divHeader.classList.add('card-header');
                    div.classList.add('card-body');
                    divHeader.innerHTML = 'Usluga koju obavlja zaposleni';

                    div.appendChild(nazivUsluge);
                    div.appendChild(cijenaUsluge);
                    servicesContainer.appendChild(divHeader);
                    servicesContainer.appendChild(div);
                    mainContainer.appendChild(servicesContainer);
                });
            }
        }
    }
}

showServicesForEmployee()