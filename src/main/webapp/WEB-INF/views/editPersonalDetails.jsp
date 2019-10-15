<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Edit Personal Details</title>
    <%@ include file="dependencies.jsp" %>
</head>
<body>
<sec:authorize access="isAnonymous()">
    <%@include file="header.jsp" %>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <%@include file="loggedHeader.jsp" %>
</sec:authorize>

<section id="edit-personal-details-section" class="p-5 my-5">
    <div class="container">
        <div class="row text-center">
            <div class="col-md-4"></div>
            <div class="col-md-8">
                <h1 class="display-5">Provide New Personal Details</h1>
                <form:form method="post" modelAttribute="user" action="/profile/edit-personal-details" cssClass="form-edit-personal-details">
                    <div class="row justify-content-center mt-5">
                        <div class="col-md-10">
                            <div class="edit-personal-details-item">
                                <form:input path="firstName" type="text" name="firstName"/>
                                <span data-placeholder="First Name"></span>
                                <form:errors path="firstName" cssClass="error" element="div"/>
                            </div>
                        </div>
                        <div class="col-md-10">
                            <div class="edit-personal-details-item">
                                <form:input path="lastName" type="text" name="lastName"/>
                                <span data-placeholder="Last Name"></span>
                                <form:errors path="lastName" cssClass="error" element="div"/>
                            </div>
                        </div>
                        <div class="col-md-10">
                            <div>
                                <button class="submit btn btn-warning btn-block" type="submit">Save Changes</button>
                            </div>
                        </div>
                    </div>
                </form:form>

            </div>
        </div>
    </div>
</section>


<%@ include file="footer.jsp" %>
<%@ include file="scripts.jsp" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/additional-methods.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js" type="text/javascript"></script>
<script src="../../js/validation.js" type="text/javascript"></script>

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
</body>
</html>