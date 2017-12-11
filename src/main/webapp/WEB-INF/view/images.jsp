<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="tmp/header.jsp"%>
<c:if test="${imageList != null}">
    <div class="container-fluid">
        <div class="row">
            <C:forEach var="imag" items="${imageList}">
                <div class="col-md-3" >
                    <h3><a href="/imageData/${imag.id}" target="_blank">${imag.name}</a></h3>
                    <a href="/workData/${imag.id}"><img src="${imag.img}" alt="img01" class="img-responsive img-thumbnail"/></a>
                    <a href="<c:url value='/removeImages/${imag.id}'/>">Delete</a>
                    <a href="<c:url value='/editImages/${imag.id}'/>">Edit</a>

                </div>
            </C:forEach>
        </div>
    </div>
</c:if>

<form:form action="images/add" method="post" modelAttribute="emptyImages" enctype="multipart/form-data">
    <form:input path="id" readonly="true"/>
    <form:input path="name"/>
    <input type="file" name="img" formenctype="multipart/form-data">
    <input type="submit" class="btn btn-primary"><i class="fa fa-paper-plane"></i>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form:form>
<%@include file="tmp/footer.jsp"%>