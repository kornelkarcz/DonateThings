document.addEventListener("DOMContentLoaded", function () {

    let editButtons = document.querySelectorAll(".row .button-edit");

    for (let i = 0; i < editButtons.length; i++) {
        let button = editButtons[i];
        button.addEventListener("click", function (event) {
            let id = this.parentNode.parentNode.children[0].innerHTML;
            window.location = "http://localhost:8080/admin/institution/edit/" + id;
        })
    }

    let deleteButtons = document.querySelectorAll(".row .button-delete");

    for (let i = 0; i < deleteButtons.length; i++) {
        let button = deleteButtons[i];
        button.addEventListener("click", function (event) {
            let id = this.parentNode.parentNode.children[0].innerHTML;
            console.log(id);
            window.location = "http://localhost:8080/admin/institution/delete/" + id;

        })
    }
});