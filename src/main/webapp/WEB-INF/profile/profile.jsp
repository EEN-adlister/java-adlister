<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/login-navbar.jsp"/>

<div class="container">
    <h1>Welcome, ${sessionScope.user.username}!</h1>
        <h5>Username: ${sessionScope.user.username}</h5>
        <h5>Password: <a href="#">Change Password</a></h5>
        <h5>Email: ${sessionScope.user.email}</h5>

</div>

<div class="container mt-4">
    <h1>Here are ads you have posted!</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p><strong>Category: </strong>${ad.category}</p>
            <p><strong>Description: </strong>${ad.description}</p>
            <p><strong>Posted by: </strong>${ad.displayUser()}</p>
        </div>
    </c:forEach>

</div>

</body>
</html>
