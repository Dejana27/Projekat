'use strict';

let logOutButton = document.querySelector('.btn-logout');

logOutButton.addEventListener('click', function (e) {
     e.preventDefault();
     window.open('http://localhost:8080/logout/index', '_self');
});

function getSumForEachSalon() {

}