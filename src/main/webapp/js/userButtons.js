document.addEventListener("DOMContentLoaded", function () {

    let detailsButtons = document.querySelectorAll(".user-button-details");

    for (let i = 0; i < detailsButtons.length; i++) {
        let button = detailsButtons[i];
        button.addEventListener("click", function (event) {
            let id = this.parentNode.parentNode.children[0].innerHTML;
            window.location = "http://localhost:8080/admin/user/details/" + id;
        })
    }

    let editButtons = document.querySelectorAll(".user-button-edit");

    for (let i = 0; i < editButtons.length; i++) {
        let button = editButtons[i];
        button.addEventListener("click", function (event) {
            let id = this.parentNode.parentNode.children[0].innerHTML;
            window.location = "http://localhost:8080/admin/user/edit/" + id;
        })
    }

    let deleteButtons = document.querySelectorAll(".user-button-delete");

    for (let i = 0; i < deleteButtons.length; i++) {
        let button = deleteButtons[i];
        button.addEventListener("click", function (event) {
            let id = this.parentNode.parentNode.children[0].innerHTML;
            window.location = "http://localhost:8080/admin/user/delete/" + id;
        })
    }
});