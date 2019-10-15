<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Collect</title>
    <%@ include file="dependencies.jsp" %>
    <link rel="stylesheet" href="../../css/nice-select.css">
</head>
<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="header.jsp" %>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <%@ include file="loggedHeader.jsp" %>
</sec:authorize>

<section id="make-donation-instruction-section" class="py-5">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-3"></div>
            <div class="col-md-9 text-center">
                <div id="slogan-container">
                    <div class="slogan-item">
                        <h1>Donate things to those in</h1>
                        <span class="uppercase">in dire need</span>
                    </div>
                    <div class="slogan-title">It takes only 3 steps</div>
                    <ul class="slogan-steps" style="margin-left: 100px">
                        <li>
                            <div><em>1</em><span>Choose type of collection</span></div>
                        </li>
                        <li>
                            <div><em>2</em><span>Choose address of collection</span></div>
                        </li>
                        <li>
                            <div><em>3</em><span>Submit!</span></div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>

<section id="make-donation-message-section" class="p-4">
    <div class="container-fluid">
        <h3>Important!</h3>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab dolorem ea eveniet illo laudantium minima
            molestias perferendis ullam ut voluptates.</p>
    </div>
</section>

<section id="organize-collection-form-section">
    <div class="container-fluid">
        <div class="row align-items-center">
            <div class="col-md-8 justify-content-start">
                <form:form id="organize-collection-form" class="ml-5" method="post" action="/organize-collection"
                           modelAttribute="collection">
                <h1 class="display-5">Organize collection</h1>
                <div class="tab pb-3">
                    <p>Step 1</p>
                    <div class="collect-form-item">
                        <form:input path="contentDescription" type="text"/>
                        <span data-placeholder="Description of collection"></span>
                    </div>
                    <div class="collect-form-item">
                        <form:input path="phoneNumber" type="text"/>
                        <span data-placeholder="Phone number"></span>
                    </div>
                    <div class="collect-form-item">
                        <form:input path="comment" type="text"/>
                        <span data-placeholder="Comment"></span>
                    </div>
                    <form:select path="institution" cssClass="wide">
                        <form:option value="Choose an institution"/>
                        <form:options cssClass="my-option" items="${institutions}" itemLabel="name" itemValue="id"/>
                    </form:select>

                    <div class="tab pb-3">
                        <p>Step 2</p>
                        <div class="collect-form-item">
                            <form:input path="streetName" type="text"/>
                            <span data-placeholder="Street name"></span>
                        </div>
                        <div class="collect-form-item">
                            <form:input path="houseNumber" type="text"/>
                            <span data-placeholder="House number"></span>
                        </div>
                        <div class="collect-form-item">
                            <form:input path="flatNumber" type="text"/>
                            <span data-placeholder="Flat number"></span>
                        </div>
                        <div class="collect-form-item">
                            <form:input path="city" type="text"/>
                            <span data-placeholder="City"></span>
                        </div>
                        <div class="collect-form-item">
                            <form:input path="postalCode" type="text"/>
                            <span data-placeholder="Postal code"></span>
                        </div>
                    </div>

                    <div class="row justify-content-end p-3">
                        <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
                        <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
                    </div>

                    <div style="text-align:center;margin-top:40px;">
                        <span class="step"></span>
                        <span class="step"></span>
                    </div>


                    </form:form>
                </div>
                <div class="col-md-4"></div>
            </div>
        </div>
</section>

<%@ include file="footer.jsp" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/additional-methods.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js" type="text/javascript"></script>
<script src="../../js/validation.js" type="text/javascript"></script>

<script type="text/javascript">
    $(".collect-form-item input").on("focus", function () {
        $(this).addClass("focus");
    });

    $(".collect-form-item input").on("blur", function () {
        if ($(this).val() == "")
            $(this).removeClass("focus");
    });

</script>
<script src="../../js/collect.js" type="text/javascript"></script>
<script src="../../js/jquery.nice-select.js" type="text/javascript"></script>

<script>
    $(document).ready(function () {
        $('select').niceSelect();
    });
</script>
</body>
</html>