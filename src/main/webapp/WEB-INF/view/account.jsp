<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="tmp/header.jsp"%>
<div class="container">
    hello ${currentUser.username} id ${currentUser.id}
    <c:if test="${!empty usersList}">
        <table class="table">
            <tr>
                <td>ID</td>
                <td>Login</td>
                <td>Password</td>
                <td>Email</td>
                <td>Delete</td>
                <td>Edit</td>
            </tr>
            <c:forEach items="${usersList}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td>${user.email}</td>
                    <td><a href="<c:url value='/userRemove/${user.id}'/>">Delete</a></td>
                    <td><a href="<c:url value='/userEdit/${user.id}'/>">Edit</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <br>
    <br>
    <br>


    <table class="table">
        <tr>
            <td>ID</td>
            <td>First Name</td>
            <td>Last Name</td>
            <td>country</td>
            <td>city</td>
            <td>ava</td>
            <td>category</td>
            <td>user</td>
            <td>Edit</td>
        </tr>
        <c:forEach items="${accountList}" var="account">
            <c:if test="${currentUser.id == account.id}">
                <tr>
                    <td>${account.id}</td>
                    <td>${account.firstName}</td>
                    <td>${account.lastName}</td>
                    <td>${account.country}</td>
                    <td>${account.city}</td>
                    <td><img src="${account.avatar}"width="30" height="30" class="rounded-circle" alt=""></td>
                    <td>${account.category}</td>
                    <td>${account.user.username}</td>
                    <td><a href="<c:url value='/editAccount/${account.id}'/>">Edit</a></td>
                </tr>
            </c:if>

        </c:forEach>
    </table>
    <br>
    <br>
    <br>
    <form:form modelAttribute="emptyAccount" action="saveAccount" method="post" enctype="multipart/form-data">
        <form:input type="text" path="firstName" placeholder="Enter first name"/>
        <form:input type="text" path="lastName"  placeholder="Enter last name"/>
        <form:input type="text" path="country"  placeholder="Enter country"/>
        <form:input type="text" path="city"  placeholder="Enter city"/>
        <form:select path="category" >
            <option>Sport</option>
            <option>Power up my skills</option>
            <option>Studying</option>
            <option>Improving myself</option>
            <option>Success</option>
        </form:select>
        <input type="file" name="avatar" formenctype="multipart/form-data"/>
        <br>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Ok">
    </form:form>

    <br>
    <br>
    <br>




</div>





<a><a href="/index">Main</a>
<%@include file="tmp/footer.jsp"%>