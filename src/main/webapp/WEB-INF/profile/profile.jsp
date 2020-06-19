<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>

        <style>
            <%@include file="/css/profile.css" %>
        </style>

<body id="bc">

<jsp:include page="/WEB-INF/partials/profile-login-nav.jsp"/>

<div class="loader-wrapper">
    <span class="loader"><span class="loader-inner"></span></span>
</div>

<div class="top-content top">
<div class="container">
    <div id="profile-info">
        <h1 class="typewriter ">Welcome, ${sessionScope.user.username}!</h1>
        <h5 class="typewriter ">Username: ${sessionScope.user.username}</h5>
        <h5 class="typewriter ">Email: ${sessionScope.user.email}</h5>

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
</div>


<div class="container mt-4">
    <h1 class="mb-4 flashy">Here are ads you have posted!</h1>

    <c:forEach var="ad" items="${ads}">
    <div class="card-deck mb-4">
        <div class="card text-white bg-secondary" style="width: 18rem;">
            <div class="card-header">
                <h2>${ad.title}</h2>
            </div>

            <ul class="list-group list-group-flush">
            <li class="list-group-item bg-secondary"><strong>Category: </strong>${ad.category}</li>
            <li class="list-group-item bg-secondary "><strong>Description: </strong>${ad.description}</li>
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

    <script>
        $(document).ready(function () {
            $(window).on("load", function () {
                $(".loader-wrapper").fadeOut("slow");
            });

            $(window).scroll(function () {
                $('nav').toggleClass('scrolled', $(this).scrollTop() > 50);
            });

        });
    </script>
</div>
</body>
</html>
