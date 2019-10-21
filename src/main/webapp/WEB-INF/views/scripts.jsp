<%--jQuery--%>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<%--Popper--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<%--Bootstrap--%>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<%--jQuery Validation Plugin--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"
        type="text/javascript"></script>
<%--jQuery Validation Plugin additional methods--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/additional-methods.js"
        type="text/javascript"></script>
<%--jQuery Mask--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js" type="text/javascript"></script>
<%--Script for validation--%>
<script src="${pageContext.request.contextPath}/js/validation.js" type="text/javascript"></script>
<%--Nice select--%>
<script src="${pageContext.request.contextPath}/js/jquery.nice-select.js" type="text/javascript"></script>

<script>
    $(document).ready(function () {
        $('select').niceSelect();
    });
</script>

<%--Data tables--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/profileDonation.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/profileCollection.js"></script>

<script src="${pageContext.request.contextPath}/js/donation.js" type="text/javascript"></script>


<script>
    $("body").scrollspy({target: "#main-nav", offset: 100});

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
<%--Buttons scripts--%>
<script src="${pageContext.request.contextPath}/js/editInstitution.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/collection.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/donation.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/userButtons.js"></script>

<%--Form animation scripts--%>
<%--Reset password--%>
<script type="text/javascript">
    $(".reset-password-form-item input").on("focus", function () {
        $(this).addClass("focus");
    });

    $(".reset-password-form-item input").on("blur", function () {
        if ($(this).val() == "")
            $(this).removeClass("focus");
    });
</script>
<%--Login--%>
<script type="text/javascript">
    $(".form-login-item input").on("focus", function () {
        $(this).addClass("focus");
    });

    $(".form-login-item input").on("blur", function () {
        if ($(this).val() == "")
            $(this).removeClass("focus");
    });
</script>
<%--Register--%>
<script type="text/javascript">
    $(document).ready(function () {
        let inputVar = $(".form-register-item input");
        for (let i = 0; i < inputVar.length; i++) {
            if (inputVar[i].value != "") {
                $(".form-register-item input").addClass("focus");
            }
        }
    });

    $(".form-register-item input").on("focus", function () {
        $(this).addClass("focus");
    });

    $(".form-register-item input").on("blur", function () {
        if ($(this).val() == "")
            $(this).removeClass("focus");
    });
</script>
<%--Form forgot password (email to send a link)--%>
<script type="text/javascript">
    $(".form-forgot-password-item input").on("focus", function () {
        $(this).addClass("focus");
    });

    $(".form-forgot-password-item input").on("blur", function () {
        if ($(this).val() == "")
            $(this).removeClass("focus");
    });
</script>
<%--Edit personal details form--%>
<script type="text/javascript">
    $(document).ready(function () {
        $(".edit-personal-details-item input").addClass("focus");
    });

    $(".edit-personal-details-item input").on("focus", function () {
        $(this).addClass("focus");
    });

    $(".edit-personal-details-item input").on("blur", function () {
        if ($(this).val() == "")
            $(this).removeClass("focus");
    });
</script>
<%--Add institution form--%>
<script type="text/javascript">
    $(document).ready(function () {
        $(".add-institution-form-item input").addClass("focus");
    });

    $(".add-institution-form-item input").on("focus", function () {
        $(this).addClass("focus");
    });

    $(".add-institution-form-item input").on("blur", function () {
        if ($(this).val() == "")
            $(this).removeClass("focus");
    });
</script>
<%--Donate form--%>
<script type="text/javascript">
    $(".donate-form-item input").on("focus", function () {
        $(this).addClass("focus");
    });

    $(".donate-form-item input").on("blur", function () {
        if ($(this).val() == "")
            $(this).removeClass("focus");
    });
</script>
<%--Collect form--%>
<script type="text/javascript">
    $(".collect-form-item input").on("focus", function () {
        $(this).addClass("focus");
    });

    $(".collect-form-item input").on("blur", function () {
        if ($(this).val() == "")
            $(this).removeClass("focus");
    });
</script>
<%--Edit collection form--%>
<script type="text/javascript">
    $(document).ready(function () {
        $(".edit-collection-form-item input").addClass("focus");
    });

    $(".edit-collection-form-item input").on("focus", function () {
        $(this).addClass("focus");
    });

    $(".edit-collection-form-item input").on("blur", function () {
        if ($(this).val() == "")
            $(this).removeClass("focus");
    });
</script>
<%--Edit donation form--%>
<script type="text/javascript">
    $(document).ready(function () {
        $(".edit-donation-form-item input").addClass("focus");
    });

    $(".edit-donation-form-item input").on("focus", function () {
        $(this).addClass("focus");
    });

    $(".edit-donation-form-item input").on("blur", function () {
        if ($(this).val() == "")
            $(this).removeClass("focus");
    });
</script>
<%--Change password form--%>
<script type="text/javascript">
    $(".change-password-form-item input").on("focus", function () {
        $(this).addClass("focus");
    });

    $(".change-password-form-item input").on("blur", function () {
        if ($(this).val() == "")
            $(this).removeClass("focus");
    });
</script>