<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="tmp/header.jsp"%>
<c:if test="${!empty usersList}">
    <table class="table">
        <tr>
            <td>Login</td>
            <td>Password</td>
            <td>Delete</td>
        </tr>
        <c:forEach items="${usersList}" var="user">
            <tr>
                <td>${user.username}</td>
                <td>${user.password}</td>
                <td><a href="<c:url value='/userRemove/${user.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<%@include file="tmp/footer.jsp"%>