<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@include file="tmp/header.jsp"%>
<div class="container">
    <c:if test="${ !empty listCategory}">
        <table class="table">
            <tr>
                <td>Id</td>
                <td>Name</td>
                <td>Delete</td>
                <td>Edit</td>
            </tr>
            <c:forEach items="${listCategory}" var="cat">
                <tr>
                    <td>${cat.id}</td>
                    <td>${cat.categoryName}</td>
                    <td><a href="<c:url value='/removeCategory/${cat.id}'/>">delete</a></td>
                    <td><a href="<c:url value='/editCategory/${cat.id}'/>">edit</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <c:url var="addAction" value="/category/add"/>

    <form:form action="${addAction}" modelAttribute="emptyCategory">
        <form:input path="id" readonly="true"/>
        <form:input path="categoryName"/>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" class="btn btn-primary"><i class="fa fa-paper-plane"></i>
    </form:form>
</div>

<%@include file="tmp/footer.jsp"%>