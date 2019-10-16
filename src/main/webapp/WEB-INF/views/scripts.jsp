<%--jQuery--%>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<%--Popper--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<%--Bootstrap--%>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<%--jQuery Validation Plugin--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js" type="text/javascript"></script>
<%--jQuery Validation Plugin additional methods--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/additional-methods.js" type="text/javascript"></script>
<%--jQuery Mask--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js" type="text/javascript"></script>
<%--Script for validation--%>
<script src="../../js/validation.js" type="text/javascript"></script>
<%--Nice select--%>
<script src="../../js/jquery.nice-select.js" type="text/javascript"></script>

<script>
    $(document).ready(function () {
        $('select').niceSelect();
    });
</script>

<%--Data tables--%>
<script type="text/javascript" src="../../js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../../js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript" src="../../js/profileDonation.js"></script>
<script type="text/javascript" src="../../js/profileCollection.js"></script>


<script>
    $('#year').text(new Date().getFullYear());

    $("body").scrollspy({ target: "#main-nav", offset: 100});

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

</script>