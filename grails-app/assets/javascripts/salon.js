'use strict';

let container = document.querySelector('.container');
let tagBody = document.querySelector('#tagBody');
let h = document.querySelector('.headings');
let deleteBtn = document.querySelector('#deleteButton');
let salonName = document.querySelector('#yourName');
let workHours = document.querySelector('#workingHours');
let workDays = document.querySelector('#workingDays');
let selectTypeSalon = document.querySelector('#type');
let selectTypeService = document.querySelector('#typeService');
let saveButton = document.querySelector('#saveBtn');
let selectGrad = document.querySelector('#city');
let selectUlica = document.querySelector('#street');
let buttonFirst = document.querySelector('#firstButton');
let buttonSecond = document.querySelector('#secondButton');
let buttonThird = document.querySelector('#thirdButton');
let modalBodyEmployee = document.querySelector('#detailsModalBody');
let headingEmployee = document.createElement('h6');
let closeButton = document.querySelector('#btnClose');
let verifiedSalon = document.querySelector('#verifiedSalon');
let textVerified = document.querySelector('#verifiedText');
let zaposleniHeading = document.querySelector('#zaposleni');
let salonNameEarnings = document.querySelector('#salonNameEarnings');
let earnings = document.querySelector('#earnings');

showTable();
let myModal = new bootstrap.Modal(document.querySelector('#exampleModal'));
let showDetailsModal = new bootstrap.Modal(document.querySelector('#showDetailsModal'));
let showEarningsModal = new bootstrap.Modal(document.querySelector('#showEarningsModal'));
//prikaz modala za edit
function showModal() {
    myModal.show();

}

//skrivanje edit modala
function hideModal() {
    myModal.hide();
}

//prikaz modala za detalje o salonu
function detailModalShow() {

    showDetailsModal.show();
}

//skrivanje modala za detalje o salonu
function hideDetailModal() {

    showDetailsModal.hide();
}

//prikaz zarada
function earningsModalShow() {
    showEarningsModal.show();
}

//skrivanje modala o zaradi
function  earningsModalHide() {
    showEarningsModal.hide();
}
displayTypeSalon();

//prikaz tipa salona
function displayTypeSalon() {
    let params = new FormData();
    let xhr = new XMLHttpRequest();

    xhr.open('POST', displayTypesUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if (jsonResponse["success"] === true) {
                let response = jsonResponse["salon"];
                response.forEach(res => {
                    let optionTag = document.createElement('option');
                    optionTag.innerHTML = res.naziv;
                    optionTag.value = res.id;
                    selectTypeSalon.appendChild(optionTag);

                })
            }
        }
    }
}

//dugme koje prikazuje sve salone bez obzira da li su verifikovani ili nisu gdje se poziva funkcija za to
buttonFirst.addEventListener('click', function (e) {
    e.preventDefault();
    showTable();
});

//prikaz samo verifikovanih salona gdje se poziva funkcija za to
buttonSecond.addEventListener('click', function (e) {
    e.preventDefault();
    showVerified();
})
//prikaz samo neverifikovanih salona gdje se poziva funkcija za to
buttonThird.addEventListener('click', function (e) {
    e.preventDefault();
    showUnverified();
})

function showVerified() {

    let params = new FormData();
    let xhr = new XMLHttpRequest();
    xhr.open('POST', showVerifiedSalonsUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4) {
            if (this.status === 200) {
                let jsonResponse = JSON.parse(xhr.responseText);
                let fields = [];

                if (jsonResponse["success"] === true) {
                    for (let key in jsonResponse["data"][0]) {
                        fields.push({data: key, name: key, title: key});
                    }
                    fillGrid(fields, jsonResponse["data"]);

                } else {

                }
            }
        }

    }
}

function showUnverified() {
    let params = new FormData();

    let xhr = new XMLHttpRequest();
    xhr.open('POST', showUnverifiedSalonsUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4) {
            if (this.status === 200) {
                let jsonResponse = JSON.parse(xhr.responseText);
                let fields = [];

                if (jsonResponse["success"] === true) {
                    for (let key in jsonResponse["data"][0]) {
                        fields.push({data: key, name: key, title: key});
                    }
                    fillGrid(fields, jsonResponse["data"]);

                } else {

                }
            }
        }

    }
}

//brisanje salona po id-u
function deleteSalon(idUser) {
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
            params.append('userId', idUser);
            xhr.open('POST', deleteSalonUrl, true);
            xhr.send(params);
            xhr.onreadystatechange = function () {
                if (this.readyState === 4) {
                    if (this.status === 200) {

                    }
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

//izmjena salona
function editSalon(salonId) {


    let params = new FormData();
    let xhr = new XMLHttpRequest();
    // let salonTypeId = selectTypeSalon.value;
    params.append('id', salonId);
    xhr.open('POST', editSalonUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4) {
            if (this.status === 200) {
                let jsonResponse = JSON.parse(xhr.responseText);
                if (jsonResponse["success"] === true) {
                    let response = jsonResponse["data"];
                    salonName.value = response.nazivSalona;
                    workHours.value = response.radnoVrijeme;
                    workDays.value = response.radniDani;
                    selectGrad.value = response.grad;
                    selectTypeSalon.value = response.tipSalona;
                    showModal();

                    saveButton.onclick = function () {
                        Swal.fire({
                            title: "Da li želite da sačuvate promjene?",
                            showDenyButton: true,
                            showCancelButton: true,
                            confirmButtonText: "Sačuvaj",
                            denyButtonText: `Ne`
                        }).then((result) => {
                            /* Read more about isConfirmed, isDenied below */
                            let idSalon = salonId;
                            let sn = salonName.value;
                            let wh = workHours.value;
                            let wd = workDays.value;
                            let sg = selectGrad.value;
                            let ts = selectTypeSalon.value;

                            let params = new FormData();
                            let xhr = new XMLHttpRequest();

                            params.append('idSalon', idSalon);
                            params.append('nazivSalona', sn);
                            params.append('radnoVrijeme', wh);
                            params.append('radniDani', wd);
                            params.append('gradId', sg);
                            params.append('typeSalonId', ts);
                            xhr.open('POST', saveSalonUrl, true);
                            xhr.send(params);
                            xhr.onreadystatechange = function () {
                                if (this.readyState === 4 && this.status === 200) {

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
                }
            }
        }
    }
}


function showTable() {

    let params = new FormData();

    let xhr = new XMLHttpRequest();
    xhr.open('POST', showAllSalons, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4) {
            if (this.status === 200) {
                let jsonResponse = JSON.parse(xhr.responseText);
                let fields = [];

                if (jsonResponse["success"] === true && jsonResponse["data"].length > 0) {
                    for (let key in jsonResponse["data"][0]) {
                        fields.push({data: key, name: key, title: key});
                    }
                    fillGrid(fields, jsonResponse["data"]);

                } else {

                }
            }
        }

    }
}

function showSalon(id) {
    window.open(showSalonUrl + '?id=' + id, '_self');

}

//mijenjanje verifikacije salona na dugme koje odobrava admin
function editVerification(id) {

    let params = new FormData;
    let xhr = new XMLHttpRequest();


    params.append('id', id);
    // params.append('isVerified', status);
    xhr.open('POST', editVerificationUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if (jsonResponse["success"] === true) {
                let response = jsonResponse["data"];
                location.reload();

            }
        }
    }

}

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
            // {
            //    "aTargets": [4],
            //    "mData": null,
            //    "className": "text-center",
            //    "mRender": function (data, type, full) {
            //
            //       if(full["isLocked"])
            //       {
            //          return '<span class="badge bg-danger">'+'Locked'+'</span>';
            //       }
            //       if(!full["isLocked"])
            //       {
            //          return '<span class="badge bg-success">'+'NOT Locked'+'</span>';
            //       }
            //
            //    }
            // },
            // },
            {
                "aTargets": [7],
                "mData": null,
                "className": "text-center",
                "mRender": function (data, type, full) {
                    if (full["Verifikovan"]) {
                        return `<button type="button" class="btn btn-outline-success" onclick="editVerification(${full.id})">Verifikovan</button>`
                    }
                    if (!full["Verifikovan"]) {
                        return `<button type="button" class="btn btn-outline-danger" onclick="editVerification(${full.id})">Nije verifikovan</button>`
                    }

                }
            },
            {
                "aTargets": [8],
                "mData": null,
                "className": "text-center",
                "mRender": function (data, type, full) {

                    if (full["Aktivan"]) {
                        return `<span class="badge bg-success active">Aktivan</span>`;
                    }
                    if (!full["Aktivan"]) {
                        return `<span class="badge bg-danger active">Neaktivan</span>`;
                    }

                }
            },

            {
                "aTargets": [9],
                "mData": null,
                "className": "text-center",
                "mRender": function (data, type, full) {

                    return `<button type="button" class="btn btn-outline-info" onclick="showDetails(${full.id})">Detalji</button>`
                }
            },

            {
                "aTargets": [10],
                "mData": null,
                "className": "text-center",
                "mRender": function (data, type, full) {

                    return `<button type="button" class="btn btn-outline-success" onclick="editSalon(${full.id})">Izmijeni</button>`
                }
            },
            {
                "aTargets": [11],
                "mData": null,
                "className": "text-center",
                "mRender": function (data, type, full) {
                    return '<button type="button" class="btn btn-outline-danger" onclick="deleteSalon(' + full.id + ')">Obriši</button>'

                }
            },
            {
                "aTargets": [12],
                "mData": null,
                "className": "text-center",
                "mRender": function (data, type, full) {
                    return '<button type="button" class="btn btn-outline-secondary" onclick="getReport(' + full.id + ')">Izvještaj</button>'

                }
            },
            {
                "aTargets": [5],
                "visible": false,
                "searchable": false,
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

displayCities();

//prikaz svih gradova
function displayCities() {
    let params = new FormData();
    let xhr = new XMLHttpRequest();

    xhr.open('POST', displayAllCities, true);
    xhr.send(params)
    xhr.onreadystatechange = function () {
        if (this.readyState === 4) {
            if (this.status === 200) {
                let jsonResponse = JSON.parse(xhr.responseText);
                if (jsonResponse["success"] === true) {
                    let response = jsonResponse["cities"];
                    response.forEach(res => {
                        let optionTag = document.createElement('option');
                        optionTag.innerHTML = `${res.ime}`;
                        optionTag.value = `${res.id}`;
                        selectGrad.appendChild(optionTag);
                    })
                }
            }
        }
    }
}

hideDetailModal();

//prikaz detalja salona
function showDetails(id) {

    let nameSalon = document.querySelector('#salonName');
    let typeSalon = document.querySelector('#typeSalon');
    let nameCity = document.querySelector('#cityName');
    let streetName = document.querySelector('#streetName');
    nameSalon.textContent = ""
    typeSalon.textContent = ""
    nameCity.textContent = ""
    streetName.textContent = ""
    modalBodyEmployee.innerHTML = ""

    let params = new FormData();
    let xhr = new XMLHttpRequest();

    params.append('id', id);
    xhr.open('POST', showDetailsUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if (jsonResponse["success"] === true) {
                let response = jsonResponse["data"];

                let salonName = response.nazivSalona;
                let city = response.Grad;
                let street = response.Ulica;
                let type = response.Tip;
                let employees = response.Zaposleni;

                let verified = response.Verifikovan;
                if (verified) {
                    verifiedSalon.classList.remove("bg-danger");
                    verifiedSalon.classList.add("bg-success");
                    verifiedSalon.id = "badge";
                    verifiedSalon.innerHTML = "";
                    textVerified.innerHTML = "Verifikovan";
                } else {
                    verifiedSalon.classList.remove("bg-success");
                    verifiedSalon.classList.add("bg-danger");
                    verifiedSalon.id = "badge";
                    verifiedSalon.innerHTML = "";
                    textVerified.innerHTML = "Nije verifikovan";
                }
                nameSalon.textContent = salonName;
                nameCity.textContent = city;
                streetName.textContent = street;
                typeSalon.textContent = type;

                if (employees.length === 0) {
                    zaposleniHeading.textContent = "";

                } else {
                    zaposleniHeading.textContent = "Zaposleni: ";
                    employees.forEach(employee => {
                        let paragraph = document.createElement('p');
                        paragraph.innerHTML = `${employee.ime}  ${employee.prezime}`;
                        modalBodyEmployee.appendChild(paragraph);
                    })
                }

                detailModalShow();

            }
        }
    }

}
//podaci o zaradi svakog salona
function getReport(id) {
    earningsModalShow();
    let sum = 0;
    let params = new FormData();
    let xhr = new XMLHttpRequest();
    params.append('id', id);
    xhr.open('POST', findPricesAndEarningUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if (jsonResponse["success"] === true) {
                let response = jsonResponse["data"];
                let nazivSalona = jsonResponse["nazivSalona"];
                salonNameEarnings.innerHTML = '';
                earnings.innerHTML = '';
                salonNameEarnings.append(nazivSalona);
                response.forEach(res =>  {
                    sum += res.sum;
                });
                sum = `${sum} €`;
                earnings.append(sum);
            }
        }
    }

}