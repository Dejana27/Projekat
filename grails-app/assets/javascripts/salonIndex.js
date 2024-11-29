'use strict';

let showButton = document.querySelector('#showButton');
//prikaz jednog salona po id-u i url adresi
showButton.addEventListener('click', function (e) {
    e.preventDefault();
    showSalon(id);
});


function showSalon(id) {
    window.open(showSalonUrl + '?id=' + id, '_self');

}