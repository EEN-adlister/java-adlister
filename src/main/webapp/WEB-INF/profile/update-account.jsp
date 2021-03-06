<%--
  Created by IntelliJ IDEA.
  User: nayoungkim
  Date: 6/18/20
  Time: 1:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update your Profile"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <h1>Update your profile</h1>
    <h2>${error}</h2>
    <form action="/profile/update-account" method="POST">
        <div class="form-group col3">
            <label for="username"> Update username:</label>
            <input id="username" name="username" class="form-control" type="text" value ="${user.username}">
        </div>
        <div class="form-group col3">
            <label for="email"> Update email:</label>
            <input id="email" name="email" class="form-control" type="text" value ="${user.email}">
        </div>
        <input id="id" name="id" class="form-control" type="hidden" value="${user.id}">
        <input id="submit" type="submit" class="btn btn-primary col3" value="Update">
    </form>
</div>

</body>
</html>
