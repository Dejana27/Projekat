'use strict';

let img = document.querySelector('#image-carousel');
let idCosmeticSalon = document.querySelector('#cosmeticSalon');
let idHairSalon = document.querySelector('#hairSalon');
let idBeautySalon = document.querySelector('#beautySalon');
let idManHairSalon = document.querySelector('#manHairSalon');
let idMassageSalon = document.querySelector('#massageSalon');
let idNailSalon = document.querySelector('#nailSalon');
let idSelectPodgorica = document.querySelector('#selectPodgorica');
let idSelectBar = document.querySelector('#selectBar');
let idSelectBudva = document.querySelector('#selectBudva');
let idSelectCetinje = document.querySelector('#selectCetinje');
let idSelectNiksic = document.querySelector('#selectNiksic');
let idSelectKotor = document.querySelector('#selectKotor');
let changeCity = document.querySelector('#city');
let containerSalon = document.querySelector('#salon');
let logoutLink = document.querySelector('#logout');
let newSalons = document.querySelector('#newSalons');
let visitedSalons = document.querySelector('#visitedSalons');
let mostVisitedSalons = document.querySelector('#mostVisitedSalons');
let inputSearch = document.querySelector('#search');
let submitSearch = document.querySelector('#submitSearch');
//prikaz grada - klikom na ime grada u naslovu otvara se blok sa imenom svih gradova ili ponovim klikom zatvara
function showCity() {
    let id = document.querySelector('#citySelector');
    if (id.style.display === "none") {
        id.style.display = "block";
    } else {
        id.style.display = "none";
    }
}

//splide za prikaz vise slika
new Splide('#image-carousel', {
    // type       : 'loop',
    height: '200px',
    perPage: 3,
    breakpoints: {
        640: {
            height: '100px',
        },
    },
}).mount();

// new Splide('#newSalons-carousel', {
//     // type: 'loop',
//     height: '200px',
//     perPage: 3,
//     breakpoints: {
//         640: {
//             height: '100px',
//         },
//     },
// }).mount();

//po id-u odredjenog tipa salona ocitava se stranica sa svim salonima istog tipa
idCosmeticSalon.addEventListener('click', function (e) {

    e.preventDefault();
    window.open(showAllSalonsByTypeUrl + '?type=' + 2, '_self');

});
//po id-u odredjenog tipa salona ocitava se stranica sa svim salonima istog tipa
idHairSalon.addEventListener('click', function (e) {

    e.preventDefault();
    window.open(showAllSalonsByTypeUrl + '?type=' + 1, '_self');

});
//po id-u odredjenog tipa salona ocitava se stranica sa svim salonima istog tipa
idBeautySalon.addEventListener('click', function (e) {


    e.preventDefault();
    window.open(showAllSalonsByTypeUrl + '?type=' + 3, '_self');

});
//po id-u odredjenog tipa salona ocitava se stranica sa svim salonima istog tipa
idMassageSalon.addEventListener('click', function (e) {
    e.preventDefault();
    window.open(showAllSalonsByTypeUrl + '?type=' + 6, '_self');
})
//po id-u odredjenog tipa salona ocitava se stranica sa svim salonima istog tipa
idManHairSalon.addEventListener('click', function (e) {

    e.preventDefault();
    window.open(showAllSalonsByTypeUrl + '?type=' + 5, '_self');
});
//po id-u odredjenog tipa salona ocitava se stranica sa svim salonima istog tipa
idNailSalon.addEventListener('click', function (e) {

    e.preventDefault();
    window.open(showAllSalonsByTypeUrl + '?type=' + 4, '_self');
});

//ovo ce mi biti funkcija za pretragu
function searchSalonsAndServices() {

}

//po id-u odredjenog grada - ocitava sve salone koji se nalaze u tom gradu
idSelectPodgorica.addEventListener('click', function (e) {
    e.preventDefault();
    changeCity.innerHTML = 'u Podgorici';
    //kad kliknem na Podgoricu treba da mi po id-u prepozna da je to Podgorica i da na taj nacin vrati sve salone
    //sa tim id-om
    let name = idSelectPodgorica.innerHTML;
    let params = new FormData();

    params.append('name', name);
    let xhr = new XMLHttpRequest();
    xhr.open('POST', showCityUrl, true);
    xhr.send(params);

    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if (jsonResponse["success"] === true) {
                let response = jsonResponse["data"];

                window.open(showAllSalonsByCityUrl + '?id='+response.id, '_self');
            }
        }
    }
});
//po id-u odredjenog grada - ocitava sve salone koji se nalaze u tom gradu
idSelectNiksic.addEventListener('click', function(e) {

    changeCity.innerHTML = 'u Nikšiću';
    let name = idSelectNiksic.innerHTML;
    let params = new FormData();

    params.append('name', name);
    let xhr = new XMLHttpRequest();
    xhr.open('POST', showCityUrl, true);
    xhr.send(params);

    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse["success"] === true) {
                let response = jsonResponse["data"];

                window.open(showAllSalonsByCityUrl + '?id='+response.id, '_self');
            }
        }
    }
});
//po id-u odredjenog grada - ocitava sve salone koji se nalaze u tom gradu
idSelectCetinje.addEventListener('click', function(e) {

    changeCity.innerHTML = 'na Cetinju';
    let name = idSelectCetinje.innerHTML;
    let params = new FormData();

    params.append('name', name);
    let xhr = new XMLHttpRequest();
    xhr.open('POST', showCityUrl, true);
    xhr.send(params);

    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse["success"] === true) {
                let response = jsonResponse["data"];

                window.open(showAllSalonsByCityUrl + '?id='+response.id, '_self');
            }
        }
    }
});
//po id-u odredjenog grada - ocitava sve salone koji se nalaze u tom gradu
idSelectBudva.addEventListener('click', function(e) {

    changeCity.innerHTML = 'u Budvi';
    let name = idSelectBudva.innerHTML;
    let params = new FormData();

    params.append('name', name);
    let xhr = new XMLHttpRequest();
    xhr.open('POST', showCityUrl, true);
    xhr.send(params);

    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse["success"] === true) {
                let response = jsonResponse["data"];

                window.open(showAllSalonsByCityUrl + '?id='+response.id, '_self');
            }
        }
    }
});
//po id-u odredjenog grada - ocitava sve salone koji se nalaze u tom gradu
idSelectBar.addEventListener('click', function(e) {

    changeCity.innerHTML = 'u Baru';
    let name = idSelectBar.innerHTML;
    let params = new FormData();

    params.append('name', name);
    let xhr = new XMLHttpRequest();
    xhr.open('POST', showCityUrl, true);
    xhr.send(params);

    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse["success"] === true) {
                let response = jsonResponse["data"];

                window.open(showAllSalonsByCityUrl + '?id='+response.id, '_self');
            }
        }
    }
});
//po id-u odredjenog grada - ocitava sve salone koji se nalaze u tom gradu
idSelectKotor.addEventListener('click', function(e) {

    changeCity.innerHTML = 'u Kotoru';
    let name = idSelectKotor.innerHTML;
    let params = new FormData();

    params.append('name', name);
    let xhr = new XMLHttpRequest();
    xhr.open('POST', showCityUrl, true);
    xhr.send(params);

    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse["success"] === true) {
                let response = jsonResponse["data"];

                window.open(showAllSalonsByCityUrl + '?id='+response.id, '_self');
            }
        }
    }
});

//pomocna funkcija za uzimanje parametara i url adrese
function getData(params, url) {

    let xhr = new XMLHttpRequest();
    xhr.open('POST', url, true);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if (jsonResponse["success"] === true) {
                return jsonResponse["data"];
            } else {

            }
        }
    }
    xhr.send(params);

}

//logout sa stranice
logoutLink.addEventListener('click', function (e) {
    e.preventDefault();
    window.open('http://localhost:8080/logout/index', '_self');
});


function findNewestSalons() {
    //treba da sliku dodam tj. izvucem isto i da stilizujem ovo
    let params = new FormData();
    let xhr = new XMLHttpRequest();

    xhr.open('POST', findNewestSalonsUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if (jsonResponse["success"] === true) {
                let response = jsonResponse["data"];
                if (response.length <= 4) {
                response.forEach(res => {
                    if(res.status === true) {
                    let div = document.createElement('div');
                    div.classList.add('col-3');
                    let nameSalon = document.createElement('h4');
                    nameSalon.innerHTML = res.nazivSalona;
                    nameSalon.style.textAlign = 'center'
                    let city = document.createElement('p');
                    city.innerHTML = res.grad;
                    city.style.paddingLeft = "10px";
                    let street = document.createElement('p');
                    street.innerHTML = res.ulica;
                    street.style.paddingLeft = "10px";
                    let type = document.createElement('p');
                    type.innerHTML = res.tip;
                    type.style.paddingLeft = "10px";
                    let divImage = document.createElement('div');
                    div.style.cursor = 'pointer';
                    div.appendChild(nameSalon);
                    div.appendChild(city);
                    div.appendChild(street);
                    div.appendChild(type);

                    let id = res.id;

                    div.addEventListener('click', function (e) {
                        e.preventDefault();
                        window.open(showSalonByTypeUrl + '?id=' + id, '_self');
                    });

                    let imgParams = new FormData();
                    let imgXhr = new XMLHttpRequest();
                    imgParams.append('id', id);
                    imgXhr.open('POST', findImageForSalonUrl, true);
                    imgXhr.send(imgParams);
                    imgXhr.onreadystatechange = function () {
                        if (this.readyState === 4 && this.status === 200) {
                            let jsonResponse = JSON.parse(imgXhr.responseText);
                            if (jsonResponse["success"] === true) {
                                let imgResponse = jsonResponse["data"];
                                let res = imgResponse[0];
                                if (imgResponse.length > 0) {
                                    let arrNew = new Uint8Array(res.image);
                                    const blob = new Blob([arrNew], {type: "image/png"});
                                    const imageUrl = URL.createObjectURL(blob);

                                    let imgElement = document.createElement("img");
                                    imgElement.src = imageUrl;
                                    imgElement.classList.add('image');
                                    divImage.append(imgElement);
                                    div.appendChild(divImage);
                                } else {
                                    console.log('prazan niz');
                                }
                                // imgResponse.forEach(res => {
                                //
                                //     let arr = new Uint8Array(res.image);
                                //     const blob = new Blob([arr], {type: "image/png"});
                                //     const imageUrl = URL.createObjectURL(blob);
                                //
                                //     let imgElemenet = document.createElement('img');
                                //     imgElemenet.src = imageUrl;
                                //     imgElemenet.classList.add('image');
                                //     divImage.appendChild(imgElemenet);
                                //     div.appendChild(divImage);
                                //
                                // });
                            }
                        }
                    }
                    newSalons.appendChild(div);
                }
                });
            }
        }
    }
}
}

findNewestSalons();

function findMostVisitedSalons() {

    let params = new FormData();
    let xhr = new XMLHttpRequest();

    xhr.open('POST', findMostVisitedSalonsUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse["success"] === true) {
                let response = jsonResponse["data"];
                if(response.length === 0) {
                    visitedSalons.innerHTML = '';
                } else {

                    response.forEach(res => {
                        if (res.status === true) {
                        let div = document.createElement('div');
                        div.classList.add('col-3');
                        let nameSalon = document.createElement('h4');
                        nameSalon.innerHTML = res.nazivSalona;
                        nameSalon.style.textAlign = 'center'
                        let city = document.createElement('p');
                        city.innerHTML = res.grad;
                        city.style.paddingLeft = "10px";
                        let street = document.createElement('p');
                        street.innerHTML = res.ulica;
                        street.style.paddingLeft = "10px";
                        let type = document.createElement('p');
                        type.innerHTML = res.tip;
                        type.style.paddingLeft = "10px";
                        let divImage = document.createElement('div');
                        div.style.cursor = 'pointer';
                        div.appendChild(nameSalon);
                        div.appendChild(city);
                        div.appendChild(street);
                        div.appendChild(type);


                        let id = res.id;

                        div.addEventListener('click', function (e) {
                            e.preventDefault();
                            window.open(showSalonByTypeUrl + '?id=' + id, '_self');
                        });

                        let imgParams = new FormData();
                        let imgXhr = new XMLHttpRequest();
                        imgParams.append('id', id);

                        imgXhr.open('POST', findImageForSalonUrl, true);
                        imgXhr.send(imgParams);

                        imgXhr.onreadystatechange = function() {
                            if(this.readyState === 4 && this.status === 200) {
                                let jsonResponse = JSON.parse(imgXhr.responseText);
                                if(jsonResponse["success"] === true) {
                                    let imgResponse = jsonResponse["data"];
                                    // imgResponse.forEach(res => {
                                    //
                                    //     let arr = new Uint8Array(res.image);
                                    //     const blob = new Blob([arr], {type: "image/png"});
                                    //     const imageUrl = URL.createObjectURL(blob);
                                    //
                                    //     let imgElemenet = document.createElement('img');
                                    //     imgElemenet.src = imageUrl;
                                    //     imgElemenet.classList.add('image');
                                    //     divImage.appendChild(imgElemenet);
                                    //     div.appendChild(divImage);
                                    //
                                    // });
                                    let res = imgResponse[0];
                                    if (imgResponse.length > 0) {
                                        let arrNew = new Uint8Array(res.image);
                                        const blob = new Blob([arrNew], {type: "image/png"});
                                        const imageUrl = URL.createObjectURL(blob);

                                        let imgElement = document.createElement("img");
                                        imgElement.src = imageUrl;
                                        imgElement.classList.add('image');
                                        divImage.append(imgElement);
                                        div.appendChild(divImage);
                                    } else {
                                        console.log('prazan niz');
                                    }
                                }
                            }
                        }
                        mostVisitedSalons.appendChild(div);
                        }
                    });

                }

            }
        }
    }
}
findMostVisitedSalons();

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

submitSearch.addEventListener('click', function (e) {
    e.preventDefault();
    // if(inputSearch.value = ''){
    //     search();
    // } else {
    //     search();
    //     searchByService();
    // }
    search();

});

