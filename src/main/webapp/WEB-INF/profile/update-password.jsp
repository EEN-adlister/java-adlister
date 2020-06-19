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
        <jsp:param name="title" value="Update your Password"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <h1>Update your profile</h1>
    <h2>${error}</h2>
    <form action="/profile/update-password" method="POST">
        <div class="form-group col3">
            <label for="password"> Update password:</label>
            <input id="password" name="password" class="form-control" type="password" value ="${user.password}">
        </div>

        <div class="form-group col3">
            <label for="confirm_password"> Confirm password:</label>
            <input id="confirm_password" name="confirm_password" class="form-control" type="password">
        </div>

        <input id="id" name="id" class="form-control" type="hidden" value="${user.id}">
        <input id="submit" type="submit" class="btn btn-primary col3" value="Update">
    </form>
</div>

</body>
</html>
