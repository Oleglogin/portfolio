<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="tmp/header.jsp"%>
hello${currentUser.username}
hello${currentUser.id}
<c:forEach items="${workList}" var="work">
    <c:if test="${currentUser.id == work.user.id}">
        <div class="container-fluid col-md-6">
            <div class="row">
                <img src="${work.workImg}" alt="img01" class="img-responsive img-thumbnail "/>
                <a href="<c:url value='/workRemove/${work.id}'/>">Delete</a>
                <a href="<c:url value='/workEdit/${work.id}'/>">Edit</a>
                <br>
                <br>
                <br>
            </div>
        </div>
    </c:if>

</c:forEach>

<c:url value="/work/add" var="addWork"/>
<div class="container">
    <form:form action="${addWork}"  modelAttribute="emptyWork" enctype="multipart/form-data">
        <form:input path="id" readonly="true"/>
        <form:input path="workName"/>
        <form:select path="category">
            <option>Architecture</option>
            <option>Design</option>
            <option>3D Model</option>
        </form:select>
        <input type="file" name="workImg" formenctype="multipart/form-data">
        <input type="submit" class="btn btn-primary"><i class="fa fa-paper-plane"></i>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form:form>
</div>
<%@include file="tmp/footer.jsp"%>
