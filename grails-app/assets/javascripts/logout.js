'use strict';

let logoutButton = document.querySelector('#logoutButton');
logoutButton.addEventListener('click', function (e) {
    e.preventDefault();
    window.open('http://localhost:8080/logout/index', '_self');
});

