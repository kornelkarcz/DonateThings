<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Add Institution</title>
    <%@ include file="dependencies.jsp" %>
</head>

<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="header.jsp" %>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <%@ include file="loggedHeader.jsp" %>
</sec:authorize>

<section id="adding-institution-section">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-2"></div>
            <div class="col-md-7">
                <form:form action="/admin/addInstitution" method="post" modelAttribute="institution"
                           class="add-institution-form">
                <h2 class="display-4">Add Institution</h2>
                <form:hidden path="id"/>
                <div class="form-institution">
                    <form:input path="name" type="text"/>
                    <span data-placeholder="Institution name"></span>
                </div>
                <div class="form-institution">
                    <form:input path="address.street" type="text"/>
                    <span data-placeholder="Street name"></span>
                </div>
                <div class="form-institution">
                    <form:input path="address.houseNumber" type="number"/>
                    <span data-placeholder="House number"></span>
                </div>
                <div class="form-institution">
                    <form:input path="address.flatNumber" type="number"/>
                    <span data-placeholder="Flat number"></span>
                </div>
                <div class="form-institution">
                    <form:input path="address.city" type="text"/>
                    <span data-placeholder="City"></span>
                </div>
                <div class="form-institution">
                    <form:input path="address.postalCode" type="text"/>
                    <span data-placeholder="Postal code"></span>
                </div>
                <button class="submit btn btn-warning btn-block mt-5" type="submit">Add Institution</button>
            </div>
            </form:form>
        </div>
        <div class="col-md-3"></div>
    </div>
</section>

<%@ include file="footer.jsp" %>
<%@ include file="scripts.jsp" %>

<script type="text/javascript">
    $(".form-institution input").on("focus", function () {
        $(this).addClass("focus");
    });

    $(".form-institution input").on("blur", function () {
        if ($(this).val() == "")
            $(this).removeClass("focus");
    });

</script>
</body>
</html>