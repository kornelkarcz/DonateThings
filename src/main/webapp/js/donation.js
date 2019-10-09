document.addEventListener("DOMContentLoaded", function () {

    let editButtons = document.querySelectorAll(".row .donation-button-edit");

    for (let i = 0; i < editButtons.length; i++) {
        let button = editButtons[i];
        button.addEventListener("click", function (event) {
            let id = this.parentNode.parentNode.children[0].innerHTML;
            window.location = "http://localhost:8080/admin/donation/edit/" + id;
        })
    }

    let deleteButtons = document.querySelectorAll(".row .donation-button-delete");

    for (let i = 0; i < deleteButtons.length; i++) {
        let button = deleteButtons[i];
        button.addEventListener("click", function (event) {
            let id = this.parentNode.parentNode.children[0].innerHTML;
            window.location = "http://localhost:8080/admin/donation/delete/" + id;

        })
    }

    let detailsButtons = document.querySelectorAll(".row .donation-button-details");

    for (let i = 0; i < deleteButtons.length; i++) {
        let button = detailsButtons[i];
        button.addEventListener("click", function (event) {
            let id = this.parentNode.parentNode.children[0].innerHTML;
            window.location = "http://localhost:8080/admin/donation/details/" + id;
        })
    }
});