'use strict';



let selectMonth = document.querySelector('#getMonth');
let selectYear = document.querySelector('#getYear');
let budgetForMonth = document.querySelector('#budgetForMonth');
let budgetForYear = document.querySelector('#budgetForYear');
let bodyTable = document.querySelector('#bodyTable');
let selectRevenueForYear = document.querySelector('#selectRevenueForYear');


document.addEventListener('DOMContentLoaded', updateMonthlyServiceRevenue);
document.addEventListener('DOMContentLoaded', getBudgetForYear);

document.getElementById('selectYear').addEventListener('change', updateMonthlyServiceRevenue);
document.getElementById('selectMonth').addEventListener('change', updateMonthlyServiceRevenue);

function updateMonthlyServiceRevenue() {

    let year = document.getElementById('selectYear').value;
    let month = document.getElementById('selectMonth').value;

    let params = new FormData();
    let xhr = new XMLHttpRequest();
    params.append('year', year);
    params.append('month', month);


    xhr.open('POST', findBudgetForMonthUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if (jsonResponse.success === true) {
                let response = jsonResponse.data;

                let sumResponse = jsonResponse["sum"];
                let legend = document.createElement('legend');
                legend.innerHTML = `Ukupno: ${sumResponse} €`;

                updateChartData(response);
                budgetForMonth.appendChild(legend);
            }
        }
    }
}

function updateChartData(serviceRevenue) {
    let labels = Object.keys(serviceRevenue);
    let data = Object.values(serviceRevenue);
    let backgroundColor = labels.map(() => getRandomColor());

    pieChart.data.labels = labels;
    pieChart.data.datasets[0].data = data;
    pieChart.data.datasets[0].backgroundColor = backgroundColor;
    pieChart.update();
}

function getRandomColor() {
    let letters = '0123456789ABCDEF';
    let color = '#';
    for (let i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}
selectYear.addEventListener('change', function (e) {
    e.preventDefault();
    getBudgetForYear();
});

function  getBudgetForYear() {

    let params = new FormData();
    let xhr = new XMLHttpRequest();

    let year = selectYear.value;
    params.append('year', year);
    xhr.open('POST', findBudgetForYearUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse["success"] === true) {
                let response = jsonResponse["data"];
                let sumResponse = jsonResponse["sum"];
                // console.log(sumResponse);

                let legend = document.createElement('legend');
                legend.innerHTML = `Ukupno: ${sumResponse} €`;

                updateChartDataForYear(response);
                budgetForYear.appendChild(legend);
            }
        }
    }
}



function updateChartDataForYear(budget) {
    chartYear.data.datasets[0].data = budget;
    chartYear.update();

}


// function fillGrid(fields, data) {
//     let tableColumns = "";
//     fields.forEach(function (field) { //creating the needed columns (headers)
//         tableColumns += "<th>" + field["title"] + "</th>";
//     });
//
//     document.querySelector("#tabelaZarada").innerHTML = "<thead><tr>" + tableColumns + "</tr></thead>"; //appended columns on the table's first row
//
//     $('#tabelaSalon').DataTable({ //initialize the DataTable on the HTML table with the ID "myTable"
//         language: {
//             search: "Pretraga : ",
//             sLengthMenu: "_MENU_",
//             sInfo: "",
//             emptyTable: "Nema zarade za prikaz."
//         },
//         data: data, //data being displayed
//         columns: fields, //column configuration
//         order: [[0, "desc"]], //initial sorting order of the first column ([0]) in descending order ("desc").
//         destroy: true, //Destroys any existing DataTable instance associated with the target table before creating a new one. This is useful when reinitializing a table.
//         aoColumnDefs: [
//             // {
//             //    "aTargets": [4],
//             //    "mData": null,
//             //    "className": "text-center",
//             //    "mRender": function (data, type, full) {
//             //
//             //       if(full["isLocked"])
//             //       {
//             //          return '<span class="badge bg-danger">'+'Locked'+'</span>';
//             //       }
//             //       if(!full["isLocked"])
//             //       {
//             //          return '<span class="badge bg-success">'+'NOT Locked'+'</span>';
//             //       }
//             //
//             //    }
//             // },
//             // },
//             // {
//             //     "aTargets": [7],
//             //     "mData": null,
//             //     "className": "text-center",
//             //     "mRender": function (data, type, full) {
//             //         if (full["Verifikovan"]) {
//             //             return `<button type="button" class="btn btn-outline-success" onclick="editVerification(${full.id})">Verifikovan</button>`
//             //         }
//             //         if (!full["Verifikovan"]) {
//             //             return `<button type="button" class="btn btn-outline-danger" onclick="editVerification(${full.id})">Nije verifikovan</button>`
//             //         }
//             //
//             //     }
//             // },
//
//             {
//                 "aTargets": [5],
//                 "visible": false,
//                 "searchable": false,
//             },
//             {
//                 "aTargets": [4],
//                 "visible": false,
//                 "searchable": false,
//             },
//         ],
//
//         // "scrollX": true, // Enables horizontal scrolling if the table content overflows.
//         aLengthMenu: [[5, 10, 15, 20], [5, 10, 15, 20]],
//         layout: {
//             topStart: {
//                 // buttons: [
//                 //     {
//                 //         text: 'Kreiraj salon',
//                 //         action: function (e, dt, node, config) {
//                 //             alert('Button activated');
//                 //         }
//                 //     }
//                 // ]
//             }
//         },
//
//     });
// }

function showTable() {

    let params = new FormData();
    params.append('startYear', 2023);
    params.append('endYear', 2029);
    let xhr = new XMLHttpRequest();
    xhr.open('POST', getRevenueForYearUrl, true);
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

function fillGrid(fields, data) {
    $('#tabelaZarada').DataTable({
        language: {
            search: "Pretraga : ",
            sLengthMenu: "_MENU_",
            sInfo: "",
            emptyTable: "Nema zarade za prikaz."
        },
        destroy: true,
        data: data,
        columns: fields,
        order: [[0, "asc"]]
    });
}

$(document).ready(function() {
    showTable();
    showTableForMonths();

});

document.getElementById('year').addEventListener('change', showTableForMonths);
document.getElementById('month').addEventListener('change', showTableForMonths);
function showTableForMonths() {

    let year = document.getElementById('year').value;
    let month = document.getElementById('month').value;

    let params = new FormData();
    let xhr = new XMLHttpRequest();

    params.append('year', year);
    params.append('month', month);

    xhr.open('POST', getRevenueForMonthUrl, true);
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
                    fillGridForMonths(fields, jsonResponse["data"]);

                } else {

                }
            }
        }

    }
}

function fillGridForMonths(fields, data) {
    $('#tabelaZaradaZaMjesec').DataTable({
        language: {
            search: "Pretraga : ",
            sLengthMenu: "_MENU_",
            sInfo: "",
            emptyTable: "Nema zarade za prikaz."
        },
        destroy: true,
        data: data,
        columns: fields,
        order: [[0, "asc"]]
    });
}

