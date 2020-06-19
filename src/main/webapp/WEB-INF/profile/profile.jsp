<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>

</head>
<body id="bc">
<jsp:include page="/WEB-INF/partials/login-navbar.jsp"/>

<div class="container">
    <div id="profile-info">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
        <h5>Username: ${sessionScope.user.username}</h5>
        <h5>Email: ${sessionScope.user.email}</h5>
    </div>
    <div class="dropdown">
        <form action="list" method="post">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Edit
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="/update">Update Account Information</a>
            </div>
        </form>
    </div>
</div>

<div class="container mt-4">
    <h1>Here are ads you have posted!</h1>


    <c:forEach var="ad" items="${ads}">
    <div class="card-deck mb-4">
        <div class="card text-white bg-dark" style="width: 18rem;">
            <div class="card-header">
                <h2>${ad.title}</h2>
            </div>

            <ul class="list-group list-group-flush">
            <li class="list-group-item bg-secondary"><strong>Category: </strong>${ad.category}</li>
            <li class="list-group-item bg-secondary"><strong>Description: </strong>${ad.description}</li>
            <li class="list-group-item bg-secondary"><strong>Posted by: </strong>${ad.displayUser()}</li>
            <li class="list-group-item bg-secondary"><strong>ID: </strong>${ad.id}</li>
            </ul>

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
    </div>
    </c:forEach>
</div>
</body>
</html>
