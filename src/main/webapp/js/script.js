document.addEventListener("DOMContentLoaded", function () {

    $('#year').text(new Date().getFullYear());

    $("body").scrollspy({target: "#main-nav", offset: 75});

    $("#main-nav a").on('click', function (event) {
        if (this.hash !== "") {
            event.preventDefault();

            const hash = this.hash;

            $('html, body').animate({
                scrollTop: $(hash).offset().top
            }, 800, function () {

                window.location.hash = hash;
            });
        }
    });
});

