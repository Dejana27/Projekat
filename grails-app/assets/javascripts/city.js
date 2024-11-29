'use strict';


let idCity = id;
let idSalonContainer = document.querySelector('#container_salon');
let container = document.querySelector('#cityName');
let logoutLink = document.querySelector('#logout');

logoutLink.addEventListener('click', function (e) {
    e.preventDefault();
    window.open('http://localhost:8080/logout/index', '_self');
});

//prikaz salona po gradu kao i prikaz detalja salona
function showAllSalonsByCity(id) {

    let cityParams = new FormData();
    cityParams.append('idCity', id);

    let xhrCity = new XMLHttpRequest();
    xhrCity.open('POST', showCityNameUrl, true);
    xhrCity.send(cityParams);

    xhrCity.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhrCity.responseText);
            if (jsonResponse["success"] === true) {
                let response = jsonResponse["name"];
                let h1 = document.createElement('h1');
                if (response === 'Podgorica') {
                    h1.innerHTML = `Saloni ljepote u Podgorici`;
                } else if (response === 'Bar') {
                    h1.innerHTML = `Saloni ljepote u Baru`;
                } else if (response === 'Budva') {
                    h1.innerHTML = `Saloni ljepote u Budvi`;
                } else if (response === 'Nikšić') {
                    h1.innerHTML = `Saloni ljepote u Nikšiću`;
                } else if (response === 'Cetinje') {
                    h1.innerHTML = `Saloni ljepote na Cetinju`;
                } else {
                    h1.innerHTML = `Saloni ljepote u Kotoru`;
                }

                    container.append(h1);
            }
        }
    }


    let salonParams = new FormData();
    salonParams.append('idCity', id);

    let xhrSalon = new XMLHttpRequest();

    xhrSalon.open('POST', showAllSalonsAndServicesByCityUrl, true);
    xhrSalon.send(salonParams);

    xhrSalon.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhrSalon.responseText);
            if (jsonResponse["success"] === true) {
                let response = jsonResponse["data"];


                for (let res of response) {
                    if(res.isActive === true) {
                    let tagDivText = document.createElement('div');
                    let tagDivDescription = document.createElement('div');

                    let tagDivListContainer = document.createElement('div');
                    tagDivListContainer.classList.add('list_container', 'row');

                    let tagDivRightSide = document.createElement('div'); // div za opis i usluge
                    tagDivRightSide.classList.add('col-6', 'salonDiv');

                    let tagDivLeftSide = document.createElement('div'); // div za slike
                    tagDivLeftSide.classList.add('col-6');

                    let tagDivImg = document.createElement('div'); //slika koja treba da ide lijevo
                    // tagDivImg.innerHTML = 'ovdje ce ici slika. Test';
                    tagDivLeftSide.append(tagDivImg);

                    let h3 = document.createElement('h3');
                    h3.innerHTML = res.nazivSalona;
                    h3.classList.add('title');

                    //ovdje bi trebalo dodati kad kliknem na odredjeni salon da otvara stranu za taj salon
                    h3.addEventListener('click', function (e) {
                        e.preventDefault();
                        window.open(showSalonByIdUrl + '?id='+res.id, '_self');
                    });

                    let getDataParams = new FormData();
                    let xhrGetData = new XMLHttpRequest();
                    getDataParams.append('idSalon', res.id);
                    xhrGetData.open("POST", getDataForSalonUrl, true);
                    xhrGetData.send(getDataParams);
                    xhrGetData.onreadystatechange = function() {
                        if(this.readyState === 4 && this.status === 200) {

                        } else {
                            console.error('Nemoguće je učitati podatke salona: ', jsonResponse.error);
                        }
                    }
                    tagDivListContainer.append(tagDivLeftSide);

                    tagDivDescription.classList.add('row');

                    tagDivDescription.append(h3);
                    tagDivDescription.classList.add('description');
                    tagDivRightSide.append(tagDivDescription);


                    tagDivText.innerHTML = `Radni dani: ${res.radniDani} <br> Radno vrijeme:  ${res.radnoVrijeme} <br> Ulica: ${res.ulica} <hr>`;


                    tagDivRightSide.append(tagDivText);
                    tagDivListContainer.append(tagDivLeftSide, tagDivRightSide);
                    idSalonContainer.append(tagDivListContainer);


                    let salonId = res.id;
                    let serviceParams = new FormData();
                    serviceParams.append('id', salonId);

                    let xhrServices = new XMLHttpRequest();
                    xhrServices.open('POST', showAllServicesForSalonUrl, true);
                    xhrServices.send(serviceParams);

                    xhrServices.onreadystatechange = function () {
                        if (this.readyState === 4 && this.status === 200) {
                            let jsonResponse = JSON.parse(xhrServices.responseText);
                            if (jsonResponse["success"] === true) {
                                let services = jsonResponse["data"];
                                services.forEach(res => {

                                    let tagDivService = document.createElement('div');
                                    tagDivService.classList.add('service-list');
                                    tagDivService.classList.add('row');

                                    let tagName = document.createElement('div');
                                    let tagPrice = document.createElement('div');

                                    tagName.innerHTML = `Usluga: ${res.nazivUsluge} <hr>`;
                                    tagPrice.innerHTML = `${res.cijenaUsluge}  <hr>`;

                                    tagName.classList.add('col-8');
                                    tagPrice.classList.add('col-4');

                                    tagDivService.append(tagName, tagPrice);
                                    tagDivRightSide.append(tagDivService);
                                });
                            }
                        }
                    }

                    let imageParams = new FormData();
                    imageParams.append('salonId', res.id);
                    let xhrImages = new XMLHttpRequest();
                    xhrImages.open('POST', showAllImagesForSalonByCityUrl, true);
                    xhrImages.send(imageParams);

                    xhrImages.onreadystatechange = function () {
                        if (this.readyState === 4 && this.status === 200) {
                            let jsonResponse = JSON.parse(xhrImages.responseText);
                            if (jsonResponse["success"] === true) {
                                let response = jsonResponse["data"];

                                let res = response[0];
                                if (response.length > 0) {
                                    let arrNew = new Uint8Array(res.image);
                                    const blob = new Blob([arrNew], {type: "image/png"});
                                    const imageUrl = URL.createObjectURL(blob);

                                    let imgElement = document.createElement("img");
                                    imgElement.src = imageUrl;
                                    imgElement.classList.add('image');
                                    tagDivImg.append(imgElement);
                                } else {
                                    console.log('prazan niz');
                                }

                            }
                        }
                    }

                }
                }
            }
        }
    }
}

showAllSalonsByCity(idCity);

