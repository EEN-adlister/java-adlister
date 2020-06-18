<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update Ad"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/login-navbar.jsp"/>

<div class="container">
    <h1>Edit Your Ad</h1>
    <form action="/ads/update-ad" method="post">
        <div class="form-group">
            <label for="title">Current Title:</label>
            <input id="title" name="title" class="form-control" type="text" placeholder="New Title">
        </div>

        <input type="hidden" name="id" value="${ad.id}">
        <div class="form-group">
            <label for="exampleFormControlSelect1">Category</label>
            <select class="form-control" name="category" value="${ad.id}" id="exampleFormControlSelect1"
                    type="text">${ad.category}
                <option>Events</option>
                <option>Business Operations</option>
            </select>
        </div>
        <div class="form-group">
            <label for="update-description">Description</label>
            <textarea id="update-description" name="description" class="form-control"
                      type="text">${ad.description}</textarea>
        </div>

        <input type="submit" class="btn btn-block btn-primary">
    </form>

</div>
</body>
</html>
