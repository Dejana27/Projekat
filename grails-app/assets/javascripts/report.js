'use strict';

let logoutButton = document.querySelector('.btn-logout');
let salonBody = document.querySelector('.displaySalon');
let salonId
logoutButton.addEventListener('click', function (e) {
    e.preventDefault();
    window.open('http://localhost:8080/logout/index', '_self');
});
//po id-u salona gledam njegovu zaradu
function getEarnings(id) {

    let params = new FormData();
    let xhr = new XMLHttpRequest();
    params.append('id', id);
    xhr.open('POST', getEarningUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {

        }
    }
}
//prikaz svih salona i zarade koje je ostvario svaki salon
function displaySalons() {
    let params = new FormData();
    let xhr = new XMLHttpRequest();
    xhr.open('POST', displayAllSalonsUrl, true);
    xhr.send(params);

    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse["success"] === true) {
                let response = jsonResponse["data"];
                response.forEach(res =>{
                   let salonTag= document.createElement('p');
                   salonTag.innerHTML = `${res.nazivSalona}`;
                   salonTag.id = `${res.id}`;
                   salonId = res.id;
                   salonBody.appendChild(salonTag);
                  document.getElementById(`${res.id}`).addEventListener('click', function(e){
                     let id = res.id;

                     let serviceParams = new FormData();
                     let xhrServices = new XMLHttpRequest();
                     serviceParams.append('id', id);
                     xhrServices.open('POST', findPricesAndEarningUrl, true);
                     xhrServices.send(serviceParams);
                     xhrServices.onreadystatechange = function () {
                        if(this.readyState === 4 && this.status === 200) {
                            let jsonResponse = JSON.parse(xhrServices.responseText);
                            if(jsonResponse["success"] === true) {
                                let response = jsonResponse["data"];
                                console.log(response);
                            }
                        }
                     }
                  });
                });

            }
        }
    }
}

displaySalons();