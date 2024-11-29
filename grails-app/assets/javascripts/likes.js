'use strict';

let containerLikedSalons = document.querySelector('#likedSalons');

function getDataLikedSalon (id) {

}


//prikaz svih salona koju su označeni sa sviđa mi se i po tipu i po gradovima
function showAllLikedSalons() {

    let params = new FormData();
    let xhr = new XMLHttpRequest();
    xhr.open('POST', showLikedSalonsUrl, true);
    xhr.send(params);

    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if (jsonResponse["success"] === true) {
                let response = jsonResponse["data"];
                response.forEach(res => {

                    let nameSalonH4 = document.createElement('h5');
                    let idSalon = `${res.id}`;
                    let addressP = document.createElement('p');
                    let divImage = document.createElement('div');
                    let salonDiv = document.createElement('div');
                    salonDiv.classList.add('salon');
                    divImage.classList.add('img', 'addClick');
                    addressP.classList.add('address');
                    salonDiv.classList.add('col-3')
                    nameSalonH4.innerHTML = `${res.nazivSalona}`;
                    addressP.innerHTML = `${res.adresa}`;




                    salonDiv.addEventListener('click', function (e) {
                        e.preventDefault();
                        window.open(showSalonByTypeUrl + '?id=' + idSalon, '_self');
                    });

                    let imgParams = new FormData();
                    let imgXhr = new XMLHttpRequest();
                    imgParams.append('id', idSalon);
                    imgXhr.open('POST', showImageUrl, true);
                    imgXhr.send(imgParams);
                    imgXhr.onreadystatechange = function () {
                        if (this.readyState === 4 && this.status === 200) {
                            let jsonResponse = JSON.parse(imgXhr.responseText)
                            if (jsonResponse["success"] === true) {
                                let imgResponse = jsonResponse["data"];
                                let res = imgResponse[0];
                                // imgResponse.forEach(res => {
                                    let arrNew = new Uint8Array(res.image);
                                    const blob = new Blob([arrNew], {type: "image/png"});
                                    const imageUrl = URL.createObjectURL(blob);

                                    let imgElemenet = document.createElement('img');
                                    imgElemenet.src = imageUrl;
                                    imgElemenet.classList.add('image');
                                    divImage.appendChild(imgElemenet);
                                    salonDiv.appendChild(divImage);
                                // });
                            }
                        }

                        salonDiv.appendChild(nameSalonH4);
                        salonDiv.appendChild(addressP);

                    }
                    containerLikedSalons.appendChild(salonDiv);

                });
            }
        }
    }
}

showAllLikedSalons();

