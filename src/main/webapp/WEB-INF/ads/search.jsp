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
        <jsp:param name="title" value="Search Results"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/login-navbar.jsp"/>

<div class="container">
    <h1>Here Are Your Search Results!</h1>


    <c:forEach var="ad" items="${ads}">
        <div class="col-md-4 mt-5 mb-5">
            <ul class="list-group list-group-flush">
                <li class="list-group-item"><h1><c:out value="${ad.title}"/></h1></li>
                <li class="list-group-item"><strong>Category: </strong><c:out value="${ad.category}"/></li>
                <li class="list-group-item"><strong>Description: </strong><c:out value="${ad.description}"/></li>
                <li class="list-group-item"><strong>Posted by: </strong><c:out value="${ad.displayUser()}"/></li>
                    <%--            <input id="ad.id" name="ad.id" class="form-control" type="hidden" value="${ad.id}">--%>
            </ul>
        </div>
    </c:forEach>

    <form action="/ads" method="get">
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/ads" type="submit">View All Posts</a>
    </form>

</div>


</body>
</html>
