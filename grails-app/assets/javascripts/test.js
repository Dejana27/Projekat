'use strict';

let imageInput = document.querySelector('#imageInput');
let saveImageButton = document.querySelector('#saveImageButton');

//dodavanje slike sa strane ulogovanog salona
imageInput.addEventListener('change', function (e) {
    if(e.target.files) {
        let imageFile = e.target.files[0];
        let reader = new FileReader();
        reader.onload = function (e) {
            let img = document.createElement('img');
            img.onload = function (event) {

                let canvas = document.createElement('canvas');
                let ctx = canvas.getContext('2d');

                ctx.drawImage(img, 0, 0, 300, 300);

                let dataUrl = canvas.toDataURL(imageFile.type);
                document.getElementById('preview').src = dataUrl;
            }

            img.src = e.target.result;
        }
        reader.readAsDataURL(imageFile);
    }
});
//cuvanje slike
saveImageButton.addEventListener('click', function (e) {
    e.preventDefault();
    Swal.fire({
        title: "Da li želite da sačuvate fotografiju?",
        showDenyButton: true,
        showCancelButton: true,
        confirmButtonText: "Sačuvaj",
        denyButtonText: `Ne`
    }).then((result) => {
    let images = imageInput.files

    let params =  new FormData();
    let xhr = new XMLHttpRequest();

    let imagesForImport = [];
    for(let i = 0; i < images.length; i++) {

        if( i < 1) {
            imagesForImport = images[0];
        } else {
            imagesForImport.push(images[i]);
        }
    }

    params.append('imageFile', imagesForImport);

    xhr.open('POST', saveImageUrl, true);
    xhr.send(params);

    xhr.onreadystatechange = function () {
        if(this.readyState === 4 && this.status === 200) {

        }

    }
        if (result.isConfirmed) {
            Swal.fire("Sačuvano!", "", "success");
            location.reload();
        } else if (result.isDenied) {
            Swal.fire("Nije sačuvano", "", "info");
        }
    });

    // location.reload();

});
//odjava salona na pocetnu stranu
let logoutButton = document.querySelector('#logoutButton');
logoutButton.addEventListener('click', function (e) {
    e.preventDefault();
    window.open('http://localhost:8080/logout/index', '_self');
});

