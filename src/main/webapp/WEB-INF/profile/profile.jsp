<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
</head>
<body style="background-color: lightgray">
<jsp:include page="/WEB-INF/partials/login-navbar.jsp"/>

<div class="container">
    <div id="profile-info">
        <h1>Welcome, ${user.username}!</h1>
        <h5>Username: ${user.username}</h5>
        <h5>Email: ${user.email}</h5>
        <h5>ID: ${sessionScope.user.id}</h5>
    </div>
    <div class="dropdown">
        <form action="list" method="post">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Edit
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="/profile/update?id=${user.id}">Update Account Information</a>
            </div>
        </form>
    </div>
</div>

<div class="container mt-4">
    <h1>Here are ads you have posted!</h1>


    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p><strong>Category: </strong>${ad.category}</p>
            <p><strong>Description: </strong>${ad.description}</p>
            <p><strong>Posted by: </strong>${ad.displayUser()}</p>
            <p><strong>ID: </strong>${ad.id}</p>
        </div>

        <div class="dropdown">
            <form action="list" method="post">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Edit
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="/ads/update?id=${ad.id}">Update Ad</a>
                </div>
            </form>
        </div>

    </c:forEach>
</div>
</body>
</html>
