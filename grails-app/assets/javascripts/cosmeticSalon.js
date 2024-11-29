'use strict';

let typeSalon = type;
// let idListContainer = document.querySelector('#list_container'); //ovdje dodajem sve vezano za salon
let idSalonContainer = document.querySelector('#container_salon'); // ovdje naslov i opis

//prikaz svih salona po tipu salona
async function showAllSalonsByType(type) {
    let params = new FormData();
    params.append('type', type);

    try {
        let response = await getData(params, showAllSalonsTypeUrl);

        for (const res of response) {
            if(res.isActive === true) {
            let tagDivText = document.createElement('div');
            let tagDivDescription = document.createElement('div'); // div za naslov

            let tagDivService = document.createElement('div');


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

            // let id = res.id;
            //klikom na h3 treba da mi prikaze odredjeni salon
            h3.addEventListener('click', function (e) {
                e.preventDefault();
                window.open(showSalonByTypeUrl + '?id='+res.id, '_self');
            });

            tagDivListContainer.append(tagDivLeftSide);

            tagDivDescription.classList.add('row');

            tagDivDescription.append(h3);
            tagDivDescription.classList.add('description');
            tagDivRightSide.append(tagDivDescription);


            tagDivText.innerHTML = `Radni dani: ${res.radniDani} <br> Radno vrijeme:  ${res.radnoVrijeme} <br> Ulica: ${res.ulica}  <hr>`;

            tagDivRightSide.append(tagDivText);
            tagDivListContainer.append(tagDivLeftSide, tagDivRightSide);
            idSalonContainer.append(tagDivListContainer);

            let serviceParams = new FormData();
            serviceParams.append('type', type);
            serviceParams.append('id', res.id);

            try {

                let services = await getData(serviceParams, showAllServicesForSalonUrl)

                services.forEach(res => {

                    let tagDivService = document.createElement('div');
                    tagDivService.classList.add('service-list');
                    tagDivService.classList.add('row');

                    let tagName = document.createElement('div');
                    let tagPrice = document.createElement('div');

                    tagName.innerHTML = `Usluga: ${res.nazivUsluge}  <hr>`;
                    tagPrice.innerHTML = `${res.cijenaUsluge}  <hr>`;

                    tagName.classList.add('col-8');
                    tagPrice.classList.add('col-4');

                    tagDivService.append(tagName, tagPrice);
                    tagDivRightSide.append(tagDivService);


                });
            } catch (error) {

            }

            let imageParams = new FormData();
            imageParams.append('type', type);
            imageParams.append('id',  res.id);
            try {

                let response = await getData(imageParams, showAllImagesForSalonUrl);
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
                //  response.forEach(res => {
                //     //{ type: "res.mimeType"}
                //     let arrNew = new Uint8Array(res.image);
                //     const blob = new Blob([arrNew], { type: "image/png"});
                //     const imageUrl = URL.createObjectURL(blob);
                //
                //     let imgElement = document.createElement("img");
                //     imgElement.src = imageUrl;
                //     imgElement.classList.add('image');
                //     tagDivImg.append(imgElement);
                // });
            } catch (error) {

            }

        }
        }
    } catch (error) {

    }
}
//asihrono uzimanje podataka
async function getData(params, url) {
    return new Promise((resolve, reject) => {
        let xhr = new XMLHttpRequest();
        xhr.open('POST', url, true);
        xhr.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                let jsonResponse = JSON.parse(xhr.responseText);
                if (jsonResponse["success"] === true) {
                    resolve(jsonResponse["data"]);
                } else {
                    reject(jsonResponse["error"]);
                }
            }
        }
        xhr.send(params);
    })
}


showAllSalonsByType(typeSalon);
