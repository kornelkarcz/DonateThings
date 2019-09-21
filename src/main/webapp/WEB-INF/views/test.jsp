<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Test</title>
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
                <h3 class="display-2">Oddaj rzeczy potrzebujacym</h3>
                <h3 class="display-4">Wystarcza tylko 4 kroki</h3>
                <div class="row align-items-center p-4">
                    <div class="col-3">Step 1</div>
                    <div class="col-3">Step 2</div>
                    <div class="col-3">Step 3</div>
                    <div class="col-3">Step 4</div>
                </div>

            </div>
        </div>
    </div>
</section>

<section id="make-donation-message-section">
    <h3 class="display-5">Tu bedzie wiadomosc</h3>
</section>

<section id="make-donation-form-section">
    <div class="container-fluid">
        <div class="row align-items-center">
            <div class="col-md-8 justify-content-start">
            <form:form id="regForm" class="ml-5" method="post" action="/test" modelAttribute="donation">
                <h1>Make donation</h1>

                <div class="tab">
                    <p>Krok 1</p>
                    <p>Podaj liczbe workow i jakie rzeczy oddajesz</p>
                    <form:input placeholder="Liczba worków..." path="numberOfBags" oninput="this.className = ''"/>
                    <form:input placeholder="Opis rzeczy..." path="contentDescription" oninput="this.className = ''"/>
                </div>

                <div class="tab">
                    <p>Krok 2</p>
                    <p>Wybierz instytucje</p>
                    <form:select path="institution" placeholder="E-mail..." oninput="this.className = ''">
                        <form:option value="0" label="Wybierz instytucje"/>
                        <form:options items="${institutions}" itemLabel="name" itemValue="id"/>
                    </form:select>
                    <form:input path="phoneNumber" placeholder="Phone..." oninput="this.className = ''"/>
                </div>

                <div class="tab">Step 3
                    <form:input path="streetName" placeholder="street" oninput="this.className = ''"/>
                    <form:input path="houseNumber" placeholder="house number" oninput="this.className = ''"/>
                    <form:input path="flatNumber" placeholder="flat number" oninput="this.className = ''"/>
                    <form:input path="city" placeholder="city" oninput="this.className = ''"/>
                    <form:input path="postalCode" placeholder="postal code" oninput="this.className = ''"/>
                    <form:input path="comment" placeholder="postal code" oninput="this.className = ''"/>
                </div>

                <div style="overflow:auto;">
                    <div style="float:right;">
                        <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
                        <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
                    </div>
                </div>

                <div style="text-align:center;margin-top:40px;">
                    <span class="step"></span>
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

<a href="/">Back to homepage</a><br>

<%@ include file="footer.jsp" %>

<script src="../../js/test.js"></script>
</body>
</html>