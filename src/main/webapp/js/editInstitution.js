document.addEventListener("DOMContentLoaded", function () {

    let buttons = document.querySelectorAll(".row .button-edit");

    for (let i = 0; i < buttons.length; i++) {
        let button = buttons[i];
        button.addEventListener("click", function (event) {
            let id = this.parentNode.parentNode.children[0].innerHTML;
            window.location = "http://localhost:8080/admin/institution/edit/" + id;
        })
    }
});