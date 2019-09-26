<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Donate</title>
    <%@ include file="dependencies.jsp" %>
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
                    <div class="slogan-title">It take only #steps</div>
                    <ul class="slogan-steps">
                        <li>
                            <div><em>1</em><span>Choose staff</span></div>
                        </li>
                        <li>
                            <div><em>2</em><span>Choose your fav insti</span></div>
                        </li>
                        <li>
                            <div><em>3</em><span>Choose staff</span></div>
                        </li>
                        <li>
                            <div><em>4</em><span>Choose staff</span></div>
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

<section id="make-donation-form-section">
    <div class="container-fluid">
        <div class="row align-items-center">
            <div class="col-md-8 justify-content-start">
                <form:form id="donate-form" class="ml-5" method="post" action="/donate" modelAttribute="donation">
                    <h1>Make donation</h1>

                    <div class="tab">
                        <p>Krok 1</p>
                        <p>Podaj liczbe workow i jakie rzeczy oddajesz</p>
                        <div class="donate-form-item">
                            <form:input path="numberOfBags" type="text"/>
                            <span data-placeholder="Number of bags"></span>
                        </div>
                        <div class="donate-form-item">
                            <form:input path="contentDescription"/>
                            <span data-placeholder="Description of donation"></span>
                        </div>
                    </div>

                    <div class="tab">
                        <p>Krok 2</p>
                        <p>Wybierz instytucje</p>

                        <div class="select-test pb-5">
                            <div class="dropdown">
                                <div class="select">
                                    <span>Select Institution</span>
                                </div>
                                <ul class="dropdown-menu">
                                    <li id="male">Male</li>
                                    <li id="female">Female</li>
                                </ul>
                            </div>

                            <span class="msg"></span>
                        </div>


                        <form:select path="institution">
                            <form:option value="0"/>
                            <form:options items="${institutions}" itemLabel="name" itemValue="id"/>
                        </form:select>


                        <div class="donate-form-item">
                            <form:input path="phoneNumber" type="text"/>
                            <span data-placeholder="Phone number"></span>
                        </div>
                    </div>

                    <div class="tab">Step 3

                        <div class="donate-form-item">
                            <form:input path="streetName"/>
                            <span data-placeholder="Street name"></span>
                        </div>
                        <div class="donate-form-item">
                            <form:input path="houseNumber"/>
                            <span data-placeholder="House number"></span>
                        </div>
                        <div class="donate-form-item">
                            <form:input path="flatNumber"/>
                            <span data-placeholder="Flat number"></span>
                        </div>
                        <div class="donate-form-item">
                            <form:input path="city"/>
                            <span data-placeholder="City"></span>
                        </div>
                        <div class="donate-form-item">
                            <form:input path="postalCode"/>
                            <span data-placeholder="Postal code"></span>
                        </div>
                        <div class="donate-form-item">
                            <form:input path="comment"/>
                            <span data-placeholder="Comment"></span>
                        </div>
                    </div>

                    <div class="row justify-content-end p-3">
                        <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
                        <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
                    </div>

                    <div style="text-align:center;margin-top:40px;">
                        <span class="step"></span>
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

<script type="text/javascript">
    $(".donate-form-item input").on("focus", function () {
        $(this).addClass("focus");
    });

    $(".donate-form-item input").on("blur", function () {
        if ($(this).val() == "")
            $(this).removeClass("focus");
    });

</script>
<script src="../../js/test.js"></script>
</body>
</html>