<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="tmp/header.jsp" %>

<div class="container-fluid col-md-3">
    <div class="row">
        <form:form action="saveUserSpringForm" method="POST" modelAttribute="emptyUser" >
            <div class="container">
                <div class="field">
                    <form:input type="email" path="email" placeholder="Enter email"/>
                </div>

                <div class="field">
                    <div class="${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="username"  placeholder="Enter login"/>
                        <form:errors path="username" class="cs"/>
                    </div>
                </div>

                <div class="field">
                    <div class="${status.error ? 'has-error' : ''}">
                        <form:input type="password" path="password"  placeholder="Create password"/>
                        <form:errors path="password" class="cs"/>
                    </div>
                </div>
                <div class="field">
                    <div class="${status.error ? 'has-error' : ''}">
                        <form:input type="password" path="confirmPassword" placeholder="Confirm your password"/>
                        <form:errors path="confirmPassword" class="cs"/>
                    </div>
                </div>
            </div>
            <br>
            <input type="submit" value="Ok">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form:form>
    </div>
</div>
<%@include file="tmp/footer.jsp" %>


