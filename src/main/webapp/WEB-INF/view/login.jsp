<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="tmp/header.jsp" %>
<div class="container">
    <form method="POST" action="${contextPath}/login">
        <input name="username" type="text" placeholder="Enter login"/>
        <input name="password" type="password"  placeholder="Password"/>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit"  type="checkbox"/>
    </form>
</div>

<%@include file="tmp/footer.jsp" %>