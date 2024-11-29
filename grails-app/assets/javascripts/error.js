'use strict';

const setError = (elem, mess) => {
    const formControl = elem.parentElement;
    const errorDisplay = formControl.querySelector("small");

    errorDisplay.innerText = mess;
    formControl.classList.add("error");
    formControl.classList.remove("success");

}

const setSuccess = (elem, mess) => {
    const formControl = elem.parentElement;
    const errorDisplay = formControl.querySelector("small");

    errorDisplay.innerText = mess;
    formControl.classList.add("success");
    formControl.classList.remove("error");

}

export { setError, setSuccess}