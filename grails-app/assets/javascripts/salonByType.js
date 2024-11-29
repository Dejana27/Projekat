'use strict';


let salonId = id;
let likeButton = document.querySelector('#likeButton');
let liked = document.querySelector('#liked');
let ul = document.querySelector('#listImg');
// let submitCartButton = document.querySelector('#submit-cart');
//prikaz salona po tipu
function showSalonsByType(id) {

    let params = new FormData();
    let xhr = new XMLHttpRequest();

    params.append('type', type);
    xhr.open('POST', getSalonDataByTypeUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse["success"] === true) {

            }
        }
    }
}

showSalonsByType(salonId);
//funkcija koja uzima podatke salona - kako bih mogla da ispravno klijentu prikazem naziv, radne dane, radno vrijeme itd.
function  getSalonDataByType(id) {

    let params = new FormData();
    let xhr = new XMLHttpRequest();
    params.append('id', id);
    xhr.open('POST', getSalonDataByTypeUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {

        }
    }
}

getSalonDataByType(salonId);
//lajkujem salone koji mi se svidjaju
likeButton.addEventListener('click', function (e) {
    e.preventDefault();

    if(liked.classList.contains('bi-heart')) {
        liked.classList.remove('bi-heart');
        liked.classList.add('bi-heart-fill');

        let params  = new FormData();
        let xhr = new XMLHttpRequest();
        params.append('id', idSalon);
        xhr.open('POST', saveLikedSalonsUrl, true);
        xhr.send(params);
        xhr.onreadystatechange = function () {
            if(this.readyState === 4 && this.status === 200) {

            }
        }
        //treba da provjerim da li je liked = true ako jeste onda treba da dugme ostaje na svidja mi se, a ako nije prazno
    } else {

        liked.classList.remove('bi-heart-fill');
        liked.classList.add('bi-heart');

        let params = new FormData();
        let xhr = new XMLHttpRequest();
        params.append('id', idSalon);
        xhr.open('POST', deleteLikedSalonUrl, true);
        xhr.send(params);
        xhr.onreadystatechange = function () {
            if(this.readyState === 4 && this.status === 200) {

            }
        }
    }
});


//provjeravam je li salon lajkovan, ako jeste ostaje srce puno, ako ne prazno
function isLiked(id) {

    let params = new FormData();
    let xhr = new XMLHttpRequest();
    params.append('id', id);
    xhr.open('POST', isLikedUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse["success"] === true) {
                let response = jsonResponse["isLiked"];

                if(response === true) {
                    liked.classList.add('bi-heart-fill');
                }
                // } else if(response === null) {
                //     liked.classList.add('bi-heart');
                // }
                else {
                    liked.classList.add('bi-heart');
                }
            }
        }
    }
}
isLiked(idSalon);

function showImages(id) {
    let params = new FormData();
    let xhr = new XMLHttpRequest();
    params.append('id', id);
    xhr.open('POST', findImageForSalonUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse["success"] === true) {
                let response = jsonResponse["data"];

                response.forEach(res => {

                   let li = document.createElement('li');
                   li.classList.add('splide__slide');
                   let arr = new Uint8Array(res.image);
                   const blob = new Blob([arr], {type: 'image/png'});
                   const imageUrl = URL.createObjectURL(blob);

                   let imgElement = document.createElement('img');
                   imgElement.src = imageUrl;
                   imgElement.classList.add('image');
                   li.appendChild(imgElement);
                   ul.appendChild(li);
                });
            }
        }
    }
}
showImages(idSalon);