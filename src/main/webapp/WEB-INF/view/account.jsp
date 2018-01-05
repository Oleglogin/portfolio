<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="tmp/header.jsp"%>
<div  style="background: gainsboro">
    <ul class="menu">
        <li><a href="/work">LoginStudio</a></li>
        <li><a href="">Company</a>
            <ul>
                <li><a href="">one</a></li>
                <li><a href="">two</a></li>
                <li><a href="">free</a></li>
                <li><a href="">four</a></li>
                <li><a href="">five</a></li>
            </ul>
        </li>
        <li><a href="">${currentUser.username} Discover</a></li>
        <li><a href="">Galery</a></li>
        <li><a href="/registration">Sign up</a></li>
        <li><a href="/login">Sign in</a></li>
        <li><a href="/logout">Exit</a></li>
    </ul>
    <br>
    <br>
    <div class="container">
        <div class="row align-items-center pt-5">
            <div class="col-xs-12 col-md-6 col-md-offset-3">
                <c:url value="/saveAccount" var="addAcc"/>
                <form:form modelAttribute="emptyAccount" action="${addAcc}" method="post" enctype="multipart/form-data">
                    <div class="form-row">
                        <%--<div class="field">--%>
                            <form:input type="hidden" path="id" placeholder="id" readonly="true"/>
                        <%--</div>--%>
                        <%--<div class="field">--%>
                            <form:input type="text" path="firstName" placeholder="Enter first name" class="form-control"/>
                        <%--</div>--%>
                        <%--<div class="field">--%>
                            <form:input type="text" path="lastName"  placeholder="Enter last name" class="form-control"/>
                        <%--</div>--%>
                        <%--<div class="field">--%>
                            <form:input type="text" path="country"  placeholder="Enter country" class="form-control"/>
                        <%--</div>--%>
                        <%--<div class="field">--%>
                            <form:input type="text" path="city"  placeholder="Enter city" class="form-control"/>
                        <%--</div>--%>
                        <%--<div class="field">--%>
                            <form:select path="category" class="form-control" >
                                <option>Architecture</option>
                                <option>Design</option>
                                <option>3D_Model</option>
                            </form:select>
                        <%--</div>--%>
                        <%--<div class="field">--%>
                            <input type="file" name="avatar" formenctype="multipart/form-data" class="form-control"/>
                        <%--</div>--%>
                        <div class="form-group col-md-8">
                            <input type="submit" class="btn btn-primary" value="Save">
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/
                    </div>
                </form:form>
            </div>
        </div>
    </div>







    <%--<section class="container" >--%>
        <%--<div class="row align-items-center" style="height:700px">--%>
            <%--<div class="col-8">--%>
                <%--<c:url value="/saveAccount" var="addAcc"/>--%>
                <%--<form:form id="sign-up-form" action="${addAcc}" method="POST" modelAttribute="emptyUser" enctype="multipart/form-data">--%>
                    <%--<form:input type="hidden" path="id" placeholder="id" readonly="true"/>--%>
                    <%--<div class="field">--%>
                        <%--<form:input type="text" path="firstName" class="form-control required-sign-up-field"  placeholder="Enter first name"/>--%>
                    <%--</div>--%>

                    <%--<div class="field">--%>

                        <%--<form:input type="text" path="lastName" class="form-control required-sign-up-field"  placeholder="Enter last name"/>--%>
                    <%--</div>--%>
                    <%--<div class="field">--%>
                        <%--<input type="file" name="avatar" class="form-control-file" formenctype="multipart/form-data" id="exampleFormControlFile1">--%>
                    <%--</div>--%>

                    <%--<div class="field">--%>
                        <%--<form:input type="text" path="country" class="form-control required-sign-up-field"  placeholder="Enter country"/>--%>
                    <%--</div>--%>
                    <%--<div class="field">--%>
                        <%--<form:input type="text" path="city" class="form-control required-sign-up-field"  placeholder="Enter city"/>--%>
                    <%--</div>--%>
                    <%--<br>--%>
                    <%--<div id="sign-up-submit" class="btn btn-primary">Sign up</div>--%>
                    <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
                <%--</form:form>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</section>--%>
</div>
<%@include file="tmp/footer.jsp"%>