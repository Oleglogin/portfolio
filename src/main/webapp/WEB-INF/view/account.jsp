<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="tmp/header.jsp"%>
<div class="container">
    <div class="row align-items-center pt-5">
        <div class="col-xs-12 col-md-6 col-md-offset-3">
            <c:url value="/saveAccount" var="addAcc"/>
            <form:form modelAttribute="emptyAccount" action="${addAcc}" method="post" enctype="multipart/form-data">
                <div class="form-row">
                    <form:input type="hidden" path="id" placeholder="id" readonly="true"/>
                    <form:input type="text" path="firstName" placeholder="Enter first name" class="form-control"/>
                    <form:input type="text" path="lastName"  placeholder="Enter last name" class="form-control"/>
                    <form:input type="text" path="country"  placeholder="Enter country" class="form-control"/>
                    <form:input type="text" path="city"  placeholder="Enter city" class="form-control"/>
                    <form:select path="category" class="form-control" >
                        <option>Sport</option>
                        <option>Power up my skills</option>
                        <option>Studying</option>
                        <option>Improving myself</option>
                        <option>Success</option>
                    </form:select>
                    <input type="file" name="avatar" formenctype="multipart/form-data" class="form-control"/>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="submit" value="Ok">
                </div>
            </form:form>
        </div>
    </div>
</div>
<%@include file="tmp/footer.jsp"%>