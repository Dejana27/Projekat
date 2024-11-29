'use strict';

let logoutButton = document.querySelector('#logoutButton');
let timeArr = [];
logoutButton.addEventListener('click', function (e) {
    e.preventDefault();
    window.open('http://localhost:8080/logout/index', '_self');
});
showTable();
function  showTable () {

    let params = new FormData();
    let xhr = new XMLHttpRequest();

    xhr.open('POST', showAllAppointmentsUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if(this.readyState === 4) {
            if(this.status === 200) {
                let jsonResponse = JSON.parse(xhr.responseText);
                let fields = [];

                if(jsonResponse["success"] === true && jsonResponse["data"].length > 0) {
                    for(let key in jsonResponse["data"][0]) {
                        fields.push({data: key, name: key, title: key});
                    }
                    fillGrid(fields, jsonResponse["data"]);
                }
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
            // {
            //     "aTargets": [7],
            //     "mData": null,
            //     "className": "text-center",
            //     "mRender": function (data, type, full) {
            //         if (full["Verifikovan"]) {
            //             return `<button type="button" class="btn btn-outline-success" onclick="editVerification(${full.id})">Verifikovan</button>`
            //         }
            //         if (!full["Verifikovan"]) {
            //             return `<button type="button" class="btn btn-outline-danger" onclick="editVerification(${full.id})">Nije verifikovan</button>`
            //         }
            //
            //     }
            // },
            {
                "aTargets": [5],
                "mData": null,
                "className": "text-center",
                "mRender": function (data, type, full) {

                    if (full["Status"] === 'Odobreno') {
                        return `<span class="badge bg-success active">Odobreno</span>`;
                    }
                    else if (full["Status"] === 'Odbijeno') {
                        return `<span class="badge bg-danger active">Odbijeno</span>`;
                    } else {
                        return `<span class="badge bg-warning active">Na čekanju</span>`
                    }

                }
            },
            //
            // {
            //     "aTargets": [9],
            //     "mData": null,
            //     "className": "text-center",
            //     "mRender": function (data, type, full) {
            //
            //         return `<button type="button" class="btn btn-outline-info" onclick="showDetails(${full.id})">Detalji</button>`
            //     }
            // },
            //
            {
                "aTargets": [9],
                "mData": null,
                "className": "text-center",
                "mRender": function (data, type, full) {

                    return `<button type="button" class="btn btn-outline-success" onclick="approveAppoitnment(${full.id})">Odobri</button>`
                }
            },
            {
                "aTargets": [10],
                "mData": null,
                "className": "text-center",
                "mRender": function (data, type, full) {

                    return `<button type="button" class="btn btn-outline-danger" onclick="rejectAppointment(${full.id})">Odbij</button>`
                }
            },
            // {
            //     "aTargets": [11],
            //     "mData": null,
            //     "className": "text-center",
            //     "mRender": function (data, type, full) {
            //         return '<button type="button" class="btn btn-outline-danger" onclick="deleteSalon(' + full.id + ')">Obriši</button>'
            //
            //     }
            // },
            // {
            //     "aTargets": [12],
            //     "mData": null,
            //     "className": "text-center",
            //     "mRender": function (data, type, full) {
            //         return '<button type="button" class="btn btn-outline-secondary" onclick="getReport(' + full.id + ')">Izvještaj</button>'
            //
            //     }
            // },
            {
                "aTargets": [8],
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

function approveAppoitnment(id) {

    let params = new FormData();
    let xhr = new XMLHttpRequest();

    params.append('id', id);
    xhr.open('POST', appointmentApprovedUrl, true);
    xhr.send(params);

    xhr.onreadystatechange = function() {
        if(this.readyState === 4 &&  this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse["success"] === true) {
                location.reload();
            }
        }
    }
}

function rejectAppointment(id) {
    //ovo radi, ali nije idealno jer vrijeme se oslobodi, ali onda nemam informaciju vise nikakvu o tom appointmentu sto mi nema smisla
    //idealno bi bilo da korisnik sa druge strane moze da vidi da je odbijen
    let params = new FormData();
    let xhr = new XMLHttpRequest();

    params.append('id', id);
    xhr.open('POST', appointmentRejectedUrl, true);
    xhr.send(params);

    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse["success"] === true) {
                let response = jsonResponse["data"];
                let vrijeme = response.vrijeme;
                console.log(vrijeme);
                timeArr.push(vrijeme);
                location.reload();
            }
        }
    }
    console.log(timeArr);
}

