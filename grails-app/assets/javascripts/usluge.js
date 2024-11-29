'use strict';

let typeServiceSelect = document.querySelector('#typeSelect');
let buttonSave = document.querySelector('#buttonSave');
let priceInput = document.querySelector('#priceInput');
let nameInput = document.querySelector('#nameInput');
let myModal = new bootstrap.Modal(document.querySelector('#exampleModal'));
let serviceName = document.querySelector('#yourName');
let servicePrice = document.querySelector('#price');
let typeOfService = document.querySelector('#typeService');
let saveButton = document.querySelector('#saveBtn');
let saveTypeOfServiceButton = document.querySelector('#buttonSaveTypeOfService');
let nameOfType = document.querySelector('#nameOfType');


displayTypeService();
showTable();
//prikaz modala
function showModal() {
    myModal.show();

}
//sakrivanje modala
function hideModal() {
    myModal.hide();
}


// //dugme da se vratim na prethodnu stranicu
// let goBackButton = document.querySelector('#backButton');
//
// goBackButton.addEventListener('click', function (e) {
//     e.preventDefault();
//     window.open(showSalonUrl, '_self');
// })

//prikaz svih tipova usluga
function displayTypeService() {

    let params = new FormData();
    let xhr = new XMLHttpRequest();
    xhr.open('POST', displayTypeServiceUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if (jsonResponse["success"] === true) {
                let response = jsonResponse["services"];
                response.forEach(res => {
                    let optionTag = document.createElement('option');
                    optionTag.innerHTML = res.nazivUsluge;
                    optionTag.value = res.id;

                    typeServiceSelect.appendChild(optionTag);
                })
                response.forEach(res => {
                    let optionTag = document.createElement('option');
                    optionTag.innerHTML = res.nazivUsluge;
                    optionTag.value = res.id;

                    typeOfService.appendChild(optionTag);
                })
            }
        }
    }

}
//cuvanje usluge i podataka o njoj
buttonSave.addEventListener('click', function (e) {
    e.preventDefault();

    let price = priceInput.value;
    let name = nameInput.value;
    let selectType = typeServiceSelect.value;

    let params = new FormData();
    let xhr = new XMLHttpRequest();

    xhr.open('POST', createServiceUrl, true);
    params.append('price', price);
    params.append('name', name);
    params.append('typeId', selectType);
    xhr.send(params);
    if (this.readyState === 4 && this.status === 200) {
        location.reload();
    }

    priceInput.value = nameInput.value = '';
    location.reload();

})
//prikaz data tabele
function showTable() {

    let params = new FormData();

    let xhr = new XMLHttpRequest();
    xhr.open('POST', displayAllServicesUrl, true);
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
//mijenjanje usluge
function editService(id) {


    let params = new FormData();
    let xhr = new XMLHttpRequest();

    params.append('id', id);
    xhr.open('POST', editServiceUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse["success"] === true) {
                let response = jsonResponse["data"];

                serviceName.value = response.nazivUsluge
                servicePrice.value = response.cijenaUsluge
                typeOfService.value = response.tipUsluge
                showModal();

                saveButton.onclick = function() {
                    Swal.fire({
                        title: "Da li želite da sačuvate promjene?",
                        showDenyButton: true,
                        showCancelButton: true,
                        confirmButtonText: "Sačuvaj",
                        cancelButtonText: "Izađi",
                        denyButtonText: `Ne`
                    }).then((result) => {
                        /* Read more about isConfirmed, isDenied below */
                        if (result.isConfirmed) {
                        let serviceId = id;
                        let sn = serviceName.value;
                        let sp  = servicePrice.value;
                        let ts = typeOfService.value;

                        let params = new FormData();
                        let xhr = new XMLHttpRequest();

                        params.append('id', serviceId);
                        params.append('serviceName', sn);
                        params.append('servicePrice', sp);
                        params.append('typeId', ts);
                        xhr.open('POST', saveServiceUrl, true);
                        xhr.send(params);
                        xhr.onreadystatechange = function () {
                            if(this.readyState === 4 && this.status === 200) {

                            }
                        }
                        hideModal();
                        // location.reload();

                            Swal.fire("Sačuvano!", "", "success");
                        } else if (result.isDenied) {
                            Swal.fire("Promjene nijesu sačuvane!", "", "info");
                        }
                    });

                }
            }
        }
    }
}
//brisanje usluge
function deleteService(id) {
    Swal.fire({
        title: "Da li ste sigurni?",
        text: "Nemate mogućnost vraćanja nakon ovoga!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        cancelButtonText: "Izađi",
        confirmButtonText: "Da, obriši!"
    }).then((result) => {
        if (result.isConfirmed) {
            let params = new FormData();
            let xhr = new XMLHttpRequest();
            params.append('id', id);
            xhr.open('POST', deleteServiceUrl, true);
            xhr.send(params);
            xhr.onreadystatechange = function () {
                if (this.readyState === 4) {
                    if (this.status === 200) {

                    }
                }

            }
        }
    });

}
//popunjavanje tabele
function fillGrid(fields, data) {
    let tableColumns = "";
    fields.forEach(function (field) { //creating the needed columns (headers)
        tableColumns += "<th>" + field["title"] + "</th>";
    });

    document.querySelector("#tabelaUsluge").innerHTML = "<thead><tr>" + tableColumns + "</tr></thead>"; //appended columns on the table's first row

    $('#tabelaUsluge').DataTable({ //initialize the DataTable on the HTML table with the ID "myTable"
        language: {
            search: "Pretraga : ",
            sLengthMenu: "_MENU_",
            sInfo: "",
            emptyTable: "Nema usluga za prikaz."
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
            // {
            //     "aTargets": [7],
            //     "mData": null,
            //     "className": "text-center",
            //     "mRender": function (data, type, full) {
            //         if(full["Verifikovan"]) {
            //             return `<button type="button" class="btn btn-outline-success" onclick="editVerification(${full.id})">Verifikovan</button>`
            //         }
            //         if(!full["Verifikovan"]) {
            //             return `<button type="button" class="btn btn-outline-danger" onclick="editVerification(${full.id})">Nije verifikovan</button>`
            //         }
            //
            //     }
            // },
            {
                "aTargets": [4],
                "mData": null,
                "className": "text-center",
                "mRender": function (data, type, full) {

                    return `<button type="button" class="btn btn-outline-success" onclick="editService(${full.id})">Edit</button>`
                }
            },
            {
                "aTargets": [5],
                "mData": null,
                "className": "text-center",
                "mRender": function (data, type, full) {
                    return `<button type="button" class="btn btn-outline-danger" onclick="deleteService(${full.id})">Delete</button>`

                }
            },

            {
                "aTargets": [3],
                "visible": false,
                "searchable": false,
            },
            // {
            //     "aTargets": [4],
            //     "visible": false,
            //     "searchable": false,
            // },
        ],
        // "scrollX": true, // Enables horizontal scrolling if the table content overflows.
        aLengthMenu: [[10, 25, 50, 100], [10, 25, 50, 100]],
        // layout: {
        //    top2Start: function () {
        //       let toolbar = document.createElement('div');
        //       toolbar.classList.add("table__dl");
        //       // toolbar.innerHTML = '<p>Download Table:</p>';
        //
        //       return toolbar;
        //    },
        //    topEnd:"search",
        //    topStart: {
        //       buttons: ['excelHtml5', 'csvHtml5', 'pdfHtml5']
        //    }
        // },
        // fixedHeader: true,
        // responsive: true
    });
}

saveTypeOfServiceButton.addEventListener('click', function (e) {

    e.preventDefault();

    let params = new FormData();
    let xhr = new XMLHttpRequest();

    let typeOfService = nameOfType.value;

    params.append('type', typeOfService);
    xhr.open('POST', saveTypeOfServiceUrl, true);
    xhr.send(params);

    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse["success"] === true) {
                Swal.fire({
                    title: "Sačuvano!",
                    text: "Sačuvali ste tip usluge!",
                    icon: "success"
                });

            }
        }
        location.reload();
    }

});
