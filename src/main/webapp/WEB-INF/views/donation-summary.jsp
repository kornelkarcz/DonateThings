<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Donation Summary</title>
    <%@ include file="dependencies.jsp" %>
</head>
<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="header.jsp" %>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <%@ include file="loggedHeader.jsp" %>
</sec:authorize>
<h1>Thank you for your generous donation!</h1>
<br>
<p>Donation ID:</p>
<br>
${lastDonation.id}
<br>
<p>Institution name:</p>
<br>
${lastDonation.institution.name}
<br>
<p>Number of donated bags</p>
<br>
${lastDonation.numberOfBags}
<%@ include file="footer.jsp" %>
</body>
</html>