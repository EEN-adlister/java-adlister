<%--
  Created by IntelliJ IDEA.
  User: nayoungkim
  Date: 6/18/20
  Time: 10:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update your Ad"/>
    </jsp:include>
</head>

<body style="background-color: lightgray">
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <h1>Update your Ad</h1>
    <form action="/ads/update" method="POST">
        <div class="form-group col3">
<%--            <label for="title">Old Title: ${ad.title}</label>--%>
            <label for="title"> Update title:</label>
            <input id="title" name="title" class="form-control" type="text" value ="${ad.title}">
        </div>

        <div>
            <label for="description">Update Description: </label>
            <input id="description" name="description" class="form-control" type="text" value ="${ad.description}">
            <input id="ad.id" name="ad.id" class="form-control" type="hidden" value="${ad.id}">
        </div>

        <div class="form-group">
            <label for="exampleFormControlSelect1">Category</label>
            <select class="form-control" name="category" id="exampleFormControlSelect1" value ="${ad.category}">
                <option>Events</option>
                <option>Business Operations</option>
            </select>
        </div>

        <input id="submit" type="submit" class="btn btn-primary col3" value="Update">
    </form>

</div>
</body>
</html>
