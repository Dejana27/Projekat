'use strict';


let firstName = document.querySelector('#firstNameInput');
let lastName = document.querySelector('#lastNameInput');
let workHours = document.querySelector('#workHoursInput');
let numberInput = document.querySelector('#numberInput');
let jmbgInput = document.querySelector('#jmbgInput');
let selectSalon = document.querySelector('#salonSelect');
let saveButton = document.querySelector('#buttonSave');
let selectService = document.querySelector('#multiSelect');
let goBackButton = document.querySelector('#backButton');
let firstNameInput = document.querySelector('#firstName');
let lastNameInput = document.querySelector('#lastName');
let workHoursInput = document.querySelector('#workHours');
let number = document.querySelector('#phoneNumber');
let buttonSave = document.querySelector('#saveBtn');
let modalBody = document.querySelector('#employeesBody');
let myModal = new bootstrap.Modal(document.querySelector('#exampleModal'));
let showEmployeeModal = new bootstrap.Modal(document.querySelector('#showEmployeeModal'));
let selectEmployee = document.querySelector('#zaposleniSelect');
//prikaz modala za izmjenu zaposlenog
function showModal() {
    myModal.show();
}

//sakrivanje modala
function hideModal() {
    myModal.hide();
}

//prikaz modala za detalje zaposlenog
function showEmployee() {
    showEmployeeModal.show();
}

function hideEmployee() {
    showEmployeeModal.hide();
}


//dugme da mogu da se vratim na prethodnu stranicu
// goBackButton.addEventListener('click', function (e) {
//     e.preventDefault();
//     window.open(showSalonUrl, '_self');
// })
showTable();
//vezem zaposlenog i usluge
saveButton.addEventListener('click', function (e) {
    e.preventDefault();

    // let idEmployee = selectEmployee.value;

    //  let salonId = selectSalon.value;
    let uslugaId = Array.from(selectService.selectedOptions).map(option => option.value);
    let idEmployee = Array.from(selectEmployee.selectedOptions).map(option => option.value);
    let params = new FormData();
    let xhr = new XMLHttpRequest();
    xhr.open('POST', saveEmployeeUrl, true);
    params.append('zaposleniId', idEmployee);
    params.append('uslugaId', uslugaId.join(','));
    // params.append('salonId', salonId);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {

        }
    }

    location.reload();

})
//prikaz svih salona

function displaySalon() {

    let params = new FormData();
    let xhr = new XMLHttpRequest();
    xhr.open('POST', displaySalonsUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if (jsonResponse["success"] === true) {
                let response = jsonResponse["data"];

                let optionTag = document.createElement('option');
                optionTag.innerHTML = response[0].nazivSalona;
                optionTag.value = response.id;
                selectSalon.appendChild(optionTag);

            }
        }
    }
}
//prikaz svih zaposlenih
displayEmployees();
function displayEmployees() {
    let params = new FormData();
    let xhr = new XMLHttpRequest();
    xhr.open('POST', displayEmployeesUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse["success"] === true) {
                let response = jsonResponse["data"];

                response.forEach(res => {
                    let optionTag = document.createElement('option');
                    optionTag.innerHTML = `${res.ime} ${res.prezime}`;
                    optionTag.value = res.id;
                    selectEmployee.appendChild(optionTag);
                });
                $('.js-example-basic-multiples').select2({
                    dropdownParent: $("#loginModal"),
                    placeholder: "Odaberi zaposlenog: ",
                    allowClear: true
                });
            }
        }
    }
}
//prikaz svih usluga

displayAllServices();


function displayAllServices() {
    if (selectService) {
        let params = new FormData()
        let xhr = new XMLHttpRequest()

        xhr.open('POST', displayAllServicesUrl, true);
        xhr.send(params);
        xhr.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                let jsonResponse = JSON.parse(xhr.responseText);
                if (jsonResponse["success"] === true) {
                    let response = jsonResponse["data"];

                    response.forEach(res => {
                        let optionTag = document.createElement('option');
                        optionTag.innerHTML = res.nazivUsluge;
                        optionTag.value = res.id;
                        selectService.appendChild(optionTag);

                    });

                    $('.js-example-basic-multiple').select2({
                        dropdownParent: $("#loginModal"),
                        placeholder: "Odaberi usluge: ",
                        allowClear: true
                    });
                    // $(selectService).select2({
                    //     placeholder: 'Select services',
                    //     allowClear: true
                    // });
                }
                //     new coreui.MultiSelect(selectService, {
                //     name: 'multiSelect',
                //     options: options,
                //     search: true
                // });
            }
        }
    }
}


//prikaza data table
function showTable() {

    let params = new FormData();

    let xhr = new XMLHttpRequest();
    xhr.open('POST', displayAllEmployeesUrl, true);
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

                }else {

                }
            }
        }

    }
}

//popunjavanje data table
function fillGrid(fields, data) {
    let tableColumns = "";
    fields.forEach(function (field) { //creating the needed columns (headers)
        tableColumns += "<th>" + field["title"] + "</th>";
    });

    document.querySelector("#tabelaZaposleni").innerHTML = "<thead><tr>" + tableColumns + "</tr></thead>"; //appended columns on the table's first row

    $('#tabelaZaposleni').DataTable({ //initialize the DataTable on the HTML table with the ID "myTable"
        language: {
            search: "Pretraga : ",
            sLengthMenu: "_MENU_",
            sInfo: "",
            emptyTable: "Nema zaposlenih za prikaz."
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
                    // let id = full.id;
                    // let name = full.nazivSalona;
                    // let city = full.grad;

                    return `<button type="button" class="btn btn-outline-success" onclick="editEmployee(${full.id})">Edit</button>`
                }
            },
            {
                "aTargets": [8],
                "mData": null,
                "className": "text-center",
                "mRender": function (data, type, full) {
                    return '<button type="button" class="btn btn-outline-danger" onclick="deleteEmployee(' + full.id + ')">Delete</button>'

                }
            },
            {
                "aTargets": [9],
                "mData": null,
                "className": "text-center",
                "mRender": function (data, type, full) {
                    return '<button type="button" class="btn btn-outline-info" onclick="showEmployeeDetailsTable(' + full.id + ')">Prikaz</button>'

                }
            },
            // {
            //     "aTargets": [10],
            //     "mData": null,
            //     "className": "text-center",
            //     "mRender": function (data, type, full) {
            //         return '<button type="button" class="btn btn-outline-info" onclick="showSalon(' + full.id + ')">Show</button>'
            //
            //     }
            // },

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

//izmjena podataka o zaposlenom
function editEmployee(id) {

    let params = new FormData();
    let xhr = new XMLHttpRequest();
    params.append('id', id);
    xhr.open('POST', editEmployeeUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if (jsonResponse["success"] === true) {
                let response = jsonResponse["data"];
                firstNameInput.value = response.ime;
                lastNameInput.value = response.prezime;
                workHoursInput.value = response.radnoVrijeme;
                number.value = response.brojTelefona;
                showModal();

                buttonSave.onclick = function () {
                    Swal.fire({
                        title: "Da li želite da sačuvate promjene?",
                        showDenyButton: true,
                        showCancelButton: true,
                        confirmButtonText: "Sačuvaj",
                        denyButtonText: `Ne`,
                    }).then((result) => {
                        /* Read more about isConfirmed, isDenied below */
                        let zaposleniId = id;
                        let fn = firstNameInput.value;
                        let ln = lastNameInput.value;
                        let wh = workHoursInput.value;
                        let num = number.value;

                        let params = new FormData();
                        let xhr = new XMLHttpRequest();

                        params.append('id', zaposleniId);
                        params.append('ime', fn);
                        params.append('prezime', ln);
                        params.append('radnoVrijeme', wh);
                        params.append('brojTelefona', num);
                        xhr.open('POST', saveEditedEmployeeUrl, true);
                        xhr.send(params);

                        xhr.onreadystatechange = function () {
                            if (this.readyState === 4 && this.status === 200) {

                            }
                        }
                        hideModal();
                        if (result.isConfirmed) {
                            Swal.fire("Sačuvano!", "", "success");

                        } else if (result.isDenied) {
                            Swal.fire("Promjene nijesu sačuvane.", "", "info");
                        }
                        // location.reload(); // ovo nije dobro - treba da se stranica reloada tek nakon klika na ok dugme
                    });


                }

            }
        }
    }
}

//brisanje zaposlenog
function deleteEmployee(id) {
    Swal.fire({
        title: "Da li ste sigurni?",
        text: "Nemate mogućnost vraćanja ovih podataka!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Da, obriši!"
    }).then((result) => {
        if (result.isConfirmed) {
            let params = new FormData();
            let xhr = new XMLHttpRequest();
            params.append('id', id);
            xhr.open('POST', deleteEmployeeUrl, true);
            xhr.send(params);
            xhr.onreadystatechange = function () {
                if (this.readyState === 4 && this.status === 200) {
                    let jsonResponse = JSON.parse(xhr.responseText);
                    if(jsonResponse["success"] === true) {
                        Swal.fire({
                            title: "Obrisano!",
                            text: "Uspiješno ste obrisali zaposlenog.",
                            icon: "success"
                        });
                    } else {
                        Swal.fire({
                            title: "Neuspiješno!",
                            text: "Nije moguće obrisati zaposlenog jer postoje zakazani termini.",
                            icon: "error"
                        });
                    }
                }
            }

        }
    });

}

function showEmployeeDetailsTable(id) {
    showEmployee();

    let params = new FormData();
    let xhr = new XMLHttpRequest();

    params.append('id', id);
    xhr.open('POST', showEmployeeDetailsTableUrl, true);
    xhr.send(params);
    modalBody.innerHTML = '';
    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if (jsonResponse["success"] === true) {
                let response = jsonResponse["data"];
                let ime = response.ime;
                let prezime = response.prezime;
                let brojTelefona = response.brojTelefona;
                let usluge = response.usluge;

                let imeElement = document.createElement('p');
                let prezimeElement = document.createElement('p');
                let brojTelefonaElement = document.createElement('p');
                imeElement.innerHTML = ime;
                prezimeElement.innerHTML = prezime;
                brojTelefonaElement.innerHTML = brojTelefona;
                modalBody.appendChild(imeElement);
                modalBody.appendChild(prezimeElement);
                modalBody.appendChild(brojTelefonaElement);

                usluge.forEach(usluga => {
                    let imeUslugeElement = document.createElement('p');
                    imeUslugeElement.innerHTML = usluga.nazivUsluge;
                    modalBody.appendChild(imeUslugeElement);

                });
            }
        }
    }
}