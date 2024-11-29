'use strict';


let showDetailsModal = new bootstrap.Modal(document.querySelector('#showDetailsModal'));
let modalBodyEmployee = document.querySelector('#detailsModalBody');
let btnLogout = document.querySelector('.btn-logout');
let modalBody = document.querySelector('#detailsModalBody');

btnLogout.addEventListener('click', function (e) {
    e.preventDefault();
    window.open('http://localhost:8080/logout/index', '_self');
});
//prikaz modala sa detaljima o korisniku
function showModal () {
    showDetailsModal.show();
}
//skrivanje modala sa detaljima o korisniku
function  hideModal() {
    showDetailsModal.hide();
}

function showTable () {

    let params = new FormData();
    let xhr = new XMLHttpRequest();
    xhr.open('POST', showAllUsersUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            let fields = [];

            if(jsonResponse["success"] && jsonResponse["data"].length > 0) {
                for (let key in jsonResponse["data"][0]) {
                    fields.push({data: key, name: key, title: key});
                }
                fillGrid(fields, jsonResponse["data"]);
            } else {

            }
        }
    }
}

showTable();

function fillGrid(fields, data) {
    let tableColumns = "";
    fields.forEach(function (field) { //creating the needed columns (headers)
        tableColumns += "<th>" + field["title"] + "</th>";
    });

    document.querySelector("#tabelaSalon").innerHTML = "<thead><tr>" + tableColumns + "</tr></thead>"; //appended columns on the table's first row

    $('#tabelaSalon').DataTable({ //initialize the DataTable on the HTML table with the ID "myTable"
        language: {
            search: "Pretraga : ",
            sLengthMenu: "_MENU_",
            sInfo: "",
            emptyTable: "Nema salona za prikaz."
        },
        data: data, //data being displayed
        columns: fields, //column configuration
        order: [[0, "desc"]], //initial sorting order of the first column ([0]) in descending order ("desc").
        destroy: true, //Destroys any existing DataTable instance associated with the target table before creating a new one. This is useful when reinitializing a table.
        aoColumnDefs: [

            {
                "aTargets" : [3],
                "mData": null,
                "className": "text-center",
                "mRender": function (data, type, full) {

                    return `<button type="button" class="btn btn-outline-info" onclick="showDetails(${full.id})">Detalji</button>`
                }
            },
            {
                "aTargets" : [5],
                "mData": null,
                "className": "text-center",
                "mRender": function (data, type, full) {

                    return `<button type="button" class="btn btn-outline-danger" onclick="deleteUser(${full.id})">Izbriši</button>`
                }
            },

            {
                "aTargets": [4],
                "visible": false,
                "searchable": false,
            },

        ],

        // "scrollX": true, // Enables horizontal scrolling if the table content overflows.
        aLengthMenu: [[5, 10, 15, 20], [5, 10, 15, 20]],
        layout: {
            topStart: {
                // buttons: [
                //     {
                //         text: 'Kreiraj salon',
                //         action: function (e, dt, node, config) {
                //             alert('Button activated');
                //         }
                //     }
                // ]
            }
        },

    });
}
hideModal();
//prikaz detalja o korisniku po id-u
function showDetails(id) {

    let name = document.querySelector('#name');
    let username = document.querySelector('#username');
    let email = document.querySelector('#email');
    let likedSalons = document.querySelector('#likedSalons');
    let appointments = document.querySelector('#appointments');
    let likedSalonHeading = document.querySelector('#likedSalonHeading');
    let appointmentHeading = document.querySelector('#appointmentHeading');
    name.textContent = "";
    username.textContent = "";
    email.textContent = "";
    likedSalons.textContent = "";
    appointments.textContent = "";
    modalBody.textContent = "";

    let params = new FormData();
    let xhr  = new XMLHttpRequest();

    params.append('id', id);
    xhr.open('POST', showUsersDetaislUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse["success"] === true) {
                let response = jsonResponse["data"];

                name.textContent = response.ime;
                username.textContent = response.korisnickoIme;
                email.textContent = response.mejl;
                let liked = response.likedSalons;
                let appointmentsMade = response.appointments;
                
                if(liked.length === 0) {
                    likedSalonHeading.textContent = "";
                } else {
                    likedSalonHeading.textContent = "Lajkovani saloni: "
                    liked.forEach(salon => {
                        let salons = document.createElement('p');
                        salons.innerHTML = `${salon.nazivSalona}`;
                        likedSalons.append(salons);
                    });
                }
                if(appointmentsMade.length === 0) {
                    appointmentHeading.textContent = "";
                } else {
                    appointmentHeading.textContent = "Zakazani termini: ";
                    appointmentsMade.forEach(appointment => {
                        let appointmentMade = document.createElement('p');
                        appointmentMade.innerHTML = `${appointment.nazivUsluge}`;
                        appointments.appendChild(appointmentMade);
                    });
                }


            }
            showModal();
        }
    }
}
//brisanje korisnika
function deleteUser(id) {
    Swal.fire({
        title: "Da li ste sigurni?",
        text: "Nemate mogućnost vraćanja ovih podataka",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Da, obriši!",
        cancelButtonText: "Izađi"
    }).then((result) => {
        if (result.isConfirmed) {
    let params = new FormData();
    let xhr = new XMLHttpRequest();

    params.append('id', id);
    xhr.open('POST', deleteUserUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {


        }
    }
            Swal.fire({
                title: "Obrisano!",
                text: "Salon je obrisan.",
                icon: "success"
            });
        }
    });
}