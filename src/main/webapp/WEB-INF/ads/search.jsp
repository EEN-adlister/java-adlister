<%--
  Created by IntelliJ IDEA.
  User: nayoungkim
  Date: 6/19/20
  Time: 2:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Search Results" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are Your Search Results!</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-4">
            <h3><a href="/ads/?id=${ad.id}">${ad.title}</a></h3>
            <input id="ad.id" name="ad.id" class="form-control" type="hidden" value="${ad.id}">
            <p>${ad.description}</p>
        </div>
    </c:forEach>
</div>


</body>
</html>
