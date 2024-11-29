'use strict';

let container = document.querySelector('#showSalons');
let inputSearch = document.querySelector('#search');
let submitSearch = document.querySelector('#submitSearch');
function getSalonsByName() {
    let arr = localStorage.getItem("data");

    let params = new FormData();
    let xhr = new XMLHttpRequest();
    params.append("data", arr);
    xhr.open('POST', getSalonsByNameUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse["success"] === true) {
                let response = jsonResponse["data"];
                response.forEach(res => {
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

                    h3.addEventListener('click', function (e) {
                        e.preventDefault();
                        window.open(showSalonByIdUrl + '?id='+res.id, '_self');
                    });

                    tagDivListContainer.append(tagDivLeftSide);

                    tagDivDescription.classList.add('row');

                    tagDivDescription.append(h3);
                    tagDivDescription.classList.add('description');
                    tagDivRightSide.append(tagDivDescription);


                    tagDivText.innerHTML = `Radni dani: ${res.radniDani} <br> Radno vrijeme:  ${res.radnoVrijeme} <br> Ulica: ${res.ulica} <br> Grad: ${res.grad} <hr>`;


                    tagDivRightSide.append(tagDivText);
                    tagDivListContainer.append(tagDivLeftSide, tagDivRightSide);
                    container.appendChild(tagDivListContainer);

                    let salonId = res.id;
                    let serviceParams = new FormData();
                    let serviceXhr = new XMLHttpRequest();
                    serviceParams.append('id', salonId);
                    serviceXhr.open('POST', getServicesForSalonUrl, true);
                    serviceXhr.send(serviceParams);
                    serviceXhr.onreadystatechange = function () {
                        if(this.readyState === 4 && this.status === 200) {
                            let jsonResponse = JSON.parse(serviceXhr.responseText);
                            if(jsonResponse["success"] === true) {
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
                    let imageXhr = new XMLHttpRequest();
                    imageParams.append('salonId', salonId);
                    imageXhr.open('POST', showAllImagesForSalonByCityUrl, true);
                    imageXhr.send(imageParams);

                    imageXhr.onreadystatechange = function () {
                        if (this.readyState === 4 && this.status === 200) {
                            let jsonResponse = JSON.parse(imageXhr.responseText);
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

                });
            }
        }
    }

}

getSalonsByName();


function search() {

    let params = new FormData();
    let xhr = new XMLHttpRequest();

    let input = inputSearch.value;
    params.append('input', input);
    xhr.open("POST", searchByNameUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse["success"] === true) {
                let response = jsonResponse["data"];
                localStorage.setItem("data", JSON.stringify(response));
                window.open(searchPageUrl, "_self");
            }
        }
    }
}

submitSearch.addEventListener('click', function (e) {
    e.preventDefault();
    search();
    // searchByService();
});
//ovo treba poboljsati
function searchByService() {
    let params = new FormData();
    let xhr = new XMLHttpRequest();

    let input = inputSearch.value;
    params.append('usluga', input);
    xhr.open("POST", searchByServiceUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse['success'] === true) {
                let response = jsonResponse["data"];

                localStorage.setItem("data", JSON.stringify(response));
                window.open(searchPageUrl, "_self");
            }
        }
    }
}