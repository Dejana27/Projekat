'use strict';

let serviceContainer = document.querySelector('#serviceList');
let myModal = new bootstrap.Modal(document.querySelector('#editModal'));
let editButton = document.querySelector('#editButton');
let getName = document.querySelector('#getName');
let getEmail = document.querySelector('#getEmail');
let getNumber = document.querySelector('#getNumber');
let getAddress = document.querySelector('#getAddress');
let employeeName = document.querySelector('#yourName');
let employeeEmail = document.querySelector('#yourEmail');
let employeeNumber = document.querySelector('#yourNumber');
let employeeAddress = document.querySelector('#yourAddress');
let saveButton = document.querySelector('#saveBtn');
//prikaz modala za edit
function showModal() {
    myModal.show();

}

//skrivanje edit modala
function hideModal() {
    myModal.hide();
}

getServices();

function getServices() {

    let sum = 0;
    let params = new FormData();
    let xhr = new XMLHttpRequest();
    xhr.open('POST', getEmployeeDataUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if (jsonResponse["success"] === true) {
                let response = jsonResponse["data"];
                response.forEach(res => {
                    let li = document.createElement('li');
                    let h6 = document.createElement('h6');
                    let span = document.createElement('span');
                    let i = document.createElement('i');

                    h6.innerHTML = `Naziv i cijena usluge `
                    span.innerHTML = `${res.nazivUsluge} ${res.cijenaUsluge} €`;
                    i.classList.add('bi-scissors');
                    h6.classList.add('mb-0');
                    li.classList.add('list-group-item', 'd-flex', 'justify-content-between', 'align-items-center', 'flex-wrap');
                    span.classList.add('text-secondary');

                    h6.appendChild(i);
                    li.appendChild(h6);
                    li.appendChild(span);
                    serviceContainer.appendChild(li);
                    sum += res.cijenaUsluge;
                });
                let p = document.createElement('p');
                p.innerHTML = `Zarada za zaposlenog: ${sum} €`;
                p.style.textAlign = 'right';
                p.style.fontFamily = 'Open Sans';
                p.style.color = '#000';
                p.style.fontWeight = '400';
                p.style.padding = '6px';
                serviceContainer.appendChild(p);
            }
        }
    }
}

editButton.addEventListener('click', function (e) {
    e.preventDefault();
    showModal();

    employeeName.value = getName.innerHTML;
    employeeEmail.value = (getEmail.innerHTML).trim();
    employeeNumber.value = (getNumber.innerHTML).trim();
    employeeAddress.value = getAddress.innerHTML;

    saveButton.onclick = function () {
        Swal.fire({
            title: "Da li želite da sačuvate promjene?",
            showDenyButton: true,
            showCancelButton: true,
            confirmButtonText: "Sačuvaj",
            denyButtonText: `Ne`
        }).then((result) => {
            let name = employeeName.value;
            let email = employeeEmail.value;
            let number = employeeNumber.value;
            let address = employeeAddress.value;

            let params = new FormData();
            let xhr = new XMLHttpRequest();
            params.append('id', id);
            params.append('name', name);
            params.append('email', email);
            params.append('number', number);
            params.append('address', address);
            xhr.open('POST', editEmployeeUrl, true);
            xhr.send(params);
            xhr.onreadystatechange = function () {
                if (this.readyState === 4 && this.status === 200) {
                    // location.reload();
                }
            }
            hideModal();
            if (result.isConfirmed) {
                Swal.fire("Sačuvano!", "", "success");
            } else if (result.isDenied) {
                Swal.fire("Promijene nijesu sačuvane.", "", "info");
            }
        });
    }
});


