'use strict';

let idSalon = id;

let tabPrice = document.querySelector('#tab-1');
let tabAbout = document.querySelector('#tab-2');
let tabImpressions = document.querySelector('#tab-3');
let searchButton = document.querySelector('#searchButton');
let divTabContainer = document.querySelector('#service-1');
let workDaysList = document.querySelector('#workDaysList');
let employees = document.querySelector('#employees');
let logoutButton = document.querySelector('#logout');
let titleService = document.querySelector('.titleService');
let footer = document.querySelector('#page-fixed-footer');
let serviceSelected = document.querySelector('#service-selected-cnt');
let serviceSelectedValue = document.querySelector('#service-selected-value');
let myModal = new bootstrap.Modal(document.querySelector('#serviceModal'));
let chooseTimeButton = document.querySelector('#choose-time');
let closeModalButton = document.querySelector('#closeModal');
let closeButton = document.querySelector('#closeButton');
let saveTimeButton = document.querySelector('#submit-cart');
let selectElement = document.querySelector('#selectTime');
let selectEmployeeElement = document.querySelector('#selectEmployee');
// let exampleModal = new bootstrap.Modal(document.querySelector('#exampleModal'));
//dugme za logout
let arrId = [];
logoutButton.addEventListener('click', function (e) {
    e.preventDefault();
    window.open('http://localhost:8080/logout/index', '_self');
})

//prikaz modala
function showModal() {

    myModal.show();
}


function hideModal() {

    myModal.hide();
}

//prikaz modala na dugme
chooseTimeButton.addEventListener('click', function (e) {
    e.preventDefault();
    showModal();
    showWorkHours(idSalon);
    showEmployees(idSalon);
});

//zatvaranje modala na dugme
closeModalButton.addEventListener('click', function (e) {
    e.preventDefault();
    hideModal();
});
//zatvaranje modala na x
closeButton.addEventListener('click', function (e) {
    e.preventDefault();
    hideModal();
});

//funkcija koja uzima podatke salona - kako bih mogla da ispravno klijentu prikazem naziv, radne dane, radno vrijeme itd.
function getSalonData(id) {

    let params = new FormData();
    let xhr = new XMLHttpRequest();

    params.append('id', id);
    xhr.open('POST', getSalonDataUrl, true);
    xhr.send(params);

    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {

        }
    }
}

getSalonData(idSalon);
//ovdje je samo klik na odredjeni tab da mijenja sekciju
document.querySelector('.nav-tabs').addEventListener('click', function (e) {
    e.preventDefault();
    if (e.target.classList.contains('nav__link')) {
        let id = e.target.getAttribute('href');
        document.querySelector(id).scrollIntoView({behavior: 'smooth'});

        //zelim da klikom na odredjeni tab dvije klase budu nevidljive, a jedna vidljiva - ne treba mi ovo nista
        // if (id === "#tab-1") {
        //     document.querySelector('.section-1').classList.remove('hidden');
        //     document.querySelector('.section-2').classList.add('hidden');
        //     // document.querySelector('.section-3').classList.add('hidden');
        // } else {
        //     document.querySelector('.section-2').classList.remove('hidden');
        //     document.querySelector('.section-1').classList.add('hidden');
        //     // document.querySelector('.section-3').classList.add('hidden');

        // }
        // else  if (id === "#tab-2"){
        //     document.querySelector('.section-3').classList.remove('hidden');
        //     document.querySelector('.section-2').classList.add('hidden');
        //     document.querySelector('.section-1').classList.add('hidden');
        // }
    }
});

//ovdje uzimam sve usluge i njihove cijene za odredjeni salon po njegovom id-u i prikazujem ih klijentu
//takodje mogucnost da klijent selektuje odredjenu uslugu i prikaz broj usluga i cijene
function servicesAndPrices(id) {

    let sum = 0;
    let count = 0;
    let params = new FormData();
    let xhr = new XMLHttpRequest();

    params.append('id', id);
    xhr.open('POST', servicesAndPricesUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if (jsonResponse["success"] === true) {
                let response = jsonResponse["data"];

                response.forEach(res => {
                    let ime = `${res.ime}`;
                    let id = `${res.id}`;
                    let cijena = `${res.cijena}`;

                    let divServices = document.createElement('div');
                    let divRow = document.createElement('div');
                    let divCircle = document.createElement('div');
                    let divName = document.createElement('div');
                    let divServiceName = document.createElement('div');
                    let divPrice = document.createElement('div');
                    let spanPrice = document.createElement('span');
                    let circleSelect = document.createElement('i');
                    let h1 = document.createElement('h1');
                    let hr = document.createElement('hr');

                    divServices.id = `service-row-${id}`;
                    divRow.classList.add('row');
                    //,'col-lg-2', 'col-md-2'
                    divCircle.classList.add('col', 'col-1');
                    // ,'col-lg-7', 'col-md-7'
                    circleSelect.classList.add('bi-circle');
                    divName.classList.add('col', 'col-8');
                    // ,'col-lg-3', 'col-md-3'
                    divPrice.classList.add('col', 'text-right', 'col-3');
                    divCircle.appendChild(circleSelect);

                    divServiceName.innerHTML = `${ime}`;
                    divName.appendChild(divServiceName);

                    spanPrice.innerHTML = ` ${cijena} EUR`;
                    spanPrice.classList.add("bi-currency-euro");
                    divPrice.appendChild(spanPrice); //cijena
                    // divName.appendChild(pPrice);

                    divRow.appendChild(divCircle);
                    divRow.appendChild(divName);
                    divRow.appendChild(divPrice);
                    divServices.appendChild(divRow);
                    divTabContainer.append(divServices);
                    divTabContainer.append(hr);
                    // circleButton.style.background = 'transparent';
                    let idUsluga = res.id;

                    circleSelect.addEventListener('click', function (e) {
                        e.preventDefault();
                        footer.classList.remove('hidden');
                        if (circleSelect.classList.contains('bi-circle')) {
                            circleSelect.classList.remove('bi-circle');
                            circleSelect.classList.add('bi-check-circle-fill');
                            circleSelect.id = `circleButton${idUsluga}`;

                            sum = sum + res.cijena;
                            count = count + 1;

                            arrId.push(idUsluga);

                            //treba da znam koju sam uslugu selektovala odnosno njenu cijenu
                            //uzimam id usluge

                            if (count % 10 === 1) {

                                serviceSelected.innerHTML = `${count} uslugu.`;
                                serviceSelectedValue.innerHTML = `${sum}`;
                            } else if (count % 10 === 2 || count % 10 === 3 || count % 10 === 4) {

                                serviceSelected.innerHTML = `${count} usluge.`;
                                serviceSelectedValue.innerHTML = `${sum}`;
                            } else {

                                serviceSelected.innerHTML = `${count} usluga.`;
                                serviceSelectedValue.innerHTML = `${sum}`;
                            }

                        } else {

                            circleSelect.classList.remove('bi-check-circle-fill');
                            circleSelect.classList.add('bi-circle');
                            sum = sum - res.cijena;
                            count = count - 1;
                            arrId = arrId.filter(id => id !== idUsluga);
                            if (count % 10 === 1) {

                                serviceSelected.innerHTML = `${count} uslugu.`;
                                serviceSelectedValue.innerHTML = `${sum}`;
                            } else if (count % 10 === 2 || count % 10 === 3 || count % 10 === 4) {

                                serviceSelected.innerHTML = `${count} usluge.`;
                                serviceSelectedValue.innerHTML = `${sum}`;
                            } else {

                                serviceSelected.innerHTML = `${count} usluga.`;
                                serviceSelectedValue.innerHTML = `${sum}`;
                            }

                            if (sum === 0 && count === 0) {
                                //dodati klasu hidden tom bloku koji prikazujem
                                footer.classList.add('hidden');
                            }
                        }

                        updateAvailableTimes();
                    });
                });
            }
        }
    }
}

servicesAndPrices(idSalon);

//ovdje prikazujem radne dane i radno vrijeme salona - ali na posebnu karticu kao i zaposlene u tom salonu i usluge koje obavlja taj zaposleni
function workDays(id) {

    let params = new FormData();
    let xhr = new XMLHttpRequest();

    params.append('id', id);
    xhr.open('POST', getWorkDaysAndHoursUrl, true);
    xhr.send(params);

    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if (jsonResponse["success"] === true) {
                let response = jsonResponse["data"];

                let radniDani = response.radniDani;
                let radnoVrijeme = response.radnoVrijeme;

                let [...arr] = radniDani.split('-');
                console.log(arr);
                let daysOfTheWeek = ['Ponedeljak', 'Utorak', 'Srijeda', 'Četvrtak', 'Petak', 'Subota', 'Nedelja'];
                let i = 0;

                while (!(arr[1] == daysOfTheWeek[i])) {
                    let span = document.createElement('span');
                    span.innerHTML = radnoVrijeme;
                    span.classList.add('pull-right-workhours');
                    let li = document.createElement('li');

                    li.innerHTML = `${daysOfTheWeek[i]}`;
                    li.classList.add('col-12');
                    li.appendChild(span);
                    li.style.padding = '4px';
                    workDaysList.appendChild(li);
                    i++;


                }
                let li = document.createElement('li');
                let span = document.createElement('span');
                span.innerHTML = radnoVrijeme;
                span.classList.add('pull-right-workhours');
                li.innerHTML = `${arr[1]}`;
                li.classList.add('col-12');
                li.style.padding = '4px';
                li.appendChild(span);
                workDaysList.appendChild(li);

                let responseEmployees = jsonResponse["dataZaposleni"];
                responseEmployees.forEach(res => {
                    let h4Employee = document.createElement('h4');
                    h4Employee.innerHTML = ` ${res.zaposleniIme} ${res.zaposleniPrezime}`;
                    employees.appendChild(h4Employee);
                    employees.style.padding = "30px";
                    //provjera je li niz veci od nule jer mozda nema usluga vezanih za zaposlenog
                    let responseServices = res.usluge;
                    responseServices.forEach(service => {

                        let pService = document.createElement('p');
                        pService.innerHTML = `${service.nazivUsluge}`;
                        employees.appendChild(pService);
                    });

                });


            }
        }
    }
}

workDays(idSalon);

//ovjde tip usluge uzimam kako bi za svaku uslugu postajala odredjena kategorija
function getServiceType(id) {

    let params = new FormData();
    let xhr = new XMLHttpRequest();

    params.append('id', id);
    xhr.open('POST', getServiceTypeUrl, true);
    xhr.send(params);
    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if (jsonResponse["success"] === true) {
                let response = jsonResponse["data"];
                let [...arr] = response;
                let h3 = document.createElement('h3');
                let small = document.createElement('small');
                h3.classList.add("col-12");
                // small.classList.add("bi-currency-euro");
                small.id = "price";
                // small.innerHTML = `EUR`;
                h3.innerHTML = arr[0];
                let test = arr[0];

                for (let i = 1; i < arr.length; i++) {

                    if (arr[i].tipUsluge !== test) {
                        h3.innerHTML = h3.innerHTML + ' i ' + arr[i];
                        test = arr[i];
                    } else {
                        h3.innerHTML = h3.innerHTML;
                    }
                    test = arr[i].tipUsluge;

                }
                h3.append(small);
                titleService.appendChild(h3);


            }
        }
    }
}

getServiceType(idSalon);
document.querySelector('#selectDate').addEventListener('change', function (e) {
    showWorkHours(idSalon);
    updateAvailableTimes();
});

//prikaz kad su termini slobodni prilikom zakazivanja
function showWorkHours(id) {

    selectElement.innerHTML = '';
    let params = new FormData();
    let xhr = new XMLHttpRequest();
    let date = document.querySelector('#selectDate').value;

    params.append('id', id);
    params.append('date', date);
    xhr.open('POST', showWorkHoursUrl, true);
    xhr.send(params);

    let modalBody = document.querySelector('.modal-body');

    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if (jsonResponse["success"] === true) {
                let response = jsonResponse["data"];
                let pocetakRadnoVrijeme = response.pocetak;
                let krajRadnoVrijeme = response.kraj;

                // let divElement = document.querySelector('#selectTime');

                let arr = [];
                let time = [];
                for (let i = pocetakRadnoVrijeme; i <= krajRadnoVrijeme; i++) {
                    arr.push(i);
                }
                let paramsTime = new FormData();
                let xhrTime = new XMLHttpRequest();
                let selectedTime = selectElement.value;

                paramsTime.append('id', idSalon);
                paramsTime.append('date', date);
                xhrTime.open("POST", findFreeTimeUrl, true);
                xhrTime.send(paramsTime);
                xhrTime.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        let jsonResponse = JSON.parse(xhrTime.responseText);
                        if (jsonResponse["success"] === true) {

                            let response = jsonResponse["data"];
                            response.forEach(res => {
                                time.push(res.vrijeme);

                            });

                            let newArr = [];

                            for (let i = 0; i < arr.length; i++) {
                                if (!time.includes(arr[i])) {
                                    newArr.push(arr[i]);
                                }
                            }

                            newArr.forEach(el => {

                                let vrijeme = document.createElement('option');
                                // vrijeme.classList.add('btn', 'btn-outline-secondary');
                                vrijeme.innerHTML = el;
                                vrijeme.value = el;
                                selectElement.appendChild(vrijeme);
                            });
                            updateAvailableTimes();

                            selectElement.addEventListener('change', function (e) {
                                updateAvailableTimes();
                            });
                        }
                    }

                }

                modalBody.appendChild(selectElement);


            }
        }
    }

}

//biram kog zaposlenog zelim da selektujem za obavljanje usluge
function showEmployees(id) {

    let params = new FormData();
    let xhr = new XMLHttpRequest();
    params.append('id', id);
    xhr.open('POST', showEmployeesUrl, true);
    xhr.send(params);


    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if (jsonResponse["success"] === true) {
                let response = jsonResponse["data"];
                response.forEach(res => {

                    let ime = res.ime;
                    let prezime = res.prezime;
                    let brojTelefona = res.brojTelefona;

                    let zaposleni = document.createElement('option');
                    zaposleni.innerHTML = `${ime} ${prezime}`;
                    zaposleni.value = `${res.id}`;
                    selectEmployeeElement.appendChild(zaposleni);
                });
            }
        }
    }
}

//cuvanje zakazanog termina
saveTimeButton.addEventListener('click', function (e) {
    e.preventDefault();

    let params = new FormData();
    let xhr = new XMLHttpRequest();

    let timeSelect = selectElement.value;
    let employeeSelect = selectEmployeeElement.value;
    let dateSelect = document.querySelector('#selectDate').value;

    params.append("time", timeSelect);
    params.append("date", dateSelect);
    params.append("data", JSON.stringify(arrId));
    params.append("idSalon", idSalon);
    params.append("zaposleni", employeeSelect);
    //korisinik koji je ulogovan mogu preko spring Security
    xhr.open("POST", makeAppointmentUrl, true);
    xhr.send(params);

    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let jsonResponse = JSON.parse(xhr.responseText);
            if(jsonResponse["success"] === true) {
                hideModal();
                location.reload();
            } else {
                Swal.fire({
                    icon: "error",
                    title: "Neispravan datum ili vrijeme.",
                    text: "Ne možete zakazati termin za datum koji je prošao i termin mora biti minimum dva sata od trenutnog vremena!",
                    // footer: '<a href="#">Why do I have this issue?</a>'
                });
            }

        }

    }


});

//cuvanje vise usluga za vise sati - 2 usluge 2 sata, 3 usluge 3 sata itd.
function updateAvailableTimes() {
    //niz usluga - broj usluga duzina niza
    let selectedServicesCount = arrId.length;
    //vrijeme koje zauzimamo - npr. 10h
    let selectedTime = parseInt(selectElement.value);
    //pravi option tag za svo selektovano vrijeme
    let options = selectElement.querySelectorAll('option');

    //prolazak forEach petljom kroz niz vremena
    options.forEach(option => {
        let time = parseInt(option.value);

        if (time >= selectedTime && time < selectedTime + selectedServicesCount) {
            option.disabled = true;
        } else {
            option.disabled = false;
        }
    });
}
