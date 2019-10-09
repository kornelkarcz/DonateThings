<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Collection Summary</title>
    <%@ include file="dependencies.jsp" %>
</head>
<body>
<sec:authorize access="isAnonymous()">
    <%@ include file="header.jsp" %>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <%@ include file="loggedHeader.jsp" %>
</sec:authorize>
<p>Thank you for your time and effort to organize collection</p>

<p>Donation ID: ${lastCollection.id}</p><br>
<p>Institution name: ${lastCollection.institution.name}</p><br>
<p>Content desc: ${lastCollection.contentDescription}</p><br>
<p>Phone number: ${lastCollection.phoneNumber}</p><br>
<p>Street name: ${lastCollection.streetName}</p><br>
<p>House number: ${lastCollection.houseNumber}</p><br>
<p>City: ${lastCollection.city}</p><br>
<p>User first name: ${lastCollection.user.firstName}</p>

<%@ include file="footer.jsp"%>
</body>
</html>