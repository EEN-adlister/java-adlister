<%--
  Created by IntelliJ IDEA.
  User: Jedi
  Date: 6/16/20
  Time: 3:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Business Operations" />
    </jsp:include>

    <style>
        <%@include file="/css/all.css" %>
    </style>

</head>
<body>
<jsp:include page="/WEB-INF/partials/login-navbar.jsp" />

<div class="loader-wrapper">
    <span class="loader"><span class="loader-inner"></span></span>
</div>


<div class="container mt-4">

    <h1>Here is how business operations are running around town</h1>


    <c:forEach var="ad" items="${ads}">
    <div class="card-deck mb-4">
        <div class="card text-white bg-primary " style="width: 18rem;">
            <div class="card-header">
                <h2>${ad.title}</h2>
            </div>

            <ul class="list-group list-group-flush">
                <li class="list-group-item bg-primary"><strong>Category: </strong>${ad.category}</li>
                <li class="list-group-item bg-primary"><strong>Description: </strong>${ad.description}</li>
                <li class="list-group-item bg-primary"><strong>Posted by: </strong>${ad.displayUser()}</li>
            </ul>

        </div>
    </div>
    </c:forEach>
</div>
</div>

<script>
    $(document).ready(function () {
        $(window).on("load", function () {
            $(".loader-wrapper").fadeOut("slow");
        });

    });
</script>

</body>
</html>

