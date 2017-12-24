<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="tmp/header.jsp"%>


<%--hello <h2>${currentUser.id} <a href="myWorks/${emptyWork.id}" target="_blank">Show ${currentUser.username} works</a></h2>--%>

<%--<div class="container-fluid">--%>
    <%--<div class="row">--%>
        <%--<c:forEach items="${workList}" var="work">--%>
                <%--<div class="col-md-3" >--%>
                    <%--<h3><a href="/workData/${work.id}" target="_blank">${work.workName}</a></h3>--%>
                    <%--<a href="/workData/${work.id}"><img src="${work.workImg}" alt="img01" class="img-responsive img-thumbnail"/></a>--%>
                    <%--<div class="container">--%>
                        <%--&lt;%&ndash;<h4><a href="/userWork/${work.id}" target="_blank">${work.user.username}</a></h4>&ndash;%&gt;--%>
                        <%--<h4><a href="/userWork/${work.user.id}" target="_blank">${work.user.username}</a></h4>--%>
                        <%--<p>${work.category}</p>--%>
                    <%--</div>--%>
                        <%--<a href="<c:url value='/workRemove/${work.id}'/>">Delete</a>--%>
                        <%--<a href="<c:url value='/workEdit/${work.id}'/>">Edit</a>--%>
                        <%--<a href="<c:url value='/workLikes/${work.id}'/>">Like</a>--%>
                        <%--<a href="<c:url value='/workDislikes/${work.id}'/>">Dislike</a>--%>
                        <%--<a href="workData/${work.id}" target="_blank">View more</a>--%>
                <%--</div>--%>
        <%--</c:forEach>--%>


    <%--</div>--%>
<%--</div>--%>

<%--<c:url value="/work/add" var="addWork"/>--%>
<%--<div class="container">--%>
    <%--<form:form action="${addWork}"  modelAttribute="emptyWork" enctype="multipart/form-data">--%>
        <%--<form:input path="id" readonly="true"/>--%>
        <%--<form:input path="workName"/>--%>
        <%--<form:select path="category">--%>
            <%--<option>Architecture</option>--%>
            <%--<option>Design</option>--%>
            <%--<option>3D Model</option>--%>
        <%--</form:select>--%>
        <%--<input type="file" name="workImg" formenctype="multipart/form-data">--%>
        <%--<input type="submit" class="btn btn-primary"><i class="fa fa-paper-plane"></i>--%>
        <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
    <%--</form:form>--%>
<%--</div>--%>

<div class="container">
    <%--<a href="/login"> Sign in</a>--%>
    <%--<a href="/registration">Sign up</a>--%>
    <%--<a href="/admin">Admin</a>--%>
    <%--<a href="/work">Work</a>--%>
    <%--<a href="/category">Category</a>--%>

    <%--<a href="/logout"> Logout</a>--%>
    <div class="container">
        <h3>Logo <a href="/myWorks/">Discover</a>
            <a href="/registration">Sign up</a>
            <a href="/login">Sign in</a>
            <a href="/logout">Exit</a></h3>

    </div>
    <div class="container">
        <div class="container-fluid color-rect-border">
            <div class="row">
                <c:forEach items="${workList}" var="work">
                    <div class="col-md-3" >
                        <a href="/workData/${work.id}"><img src="${work.workImg}" alt="img01" class="img-responsive img-thumbnail"/></a>
                        <h3><a href="/workData/${work.id}" target="_blank">${work.workName}</a></h3>
                        <div class="container">
                            <p>${work.category}</p>
                        </div>
                        <h4><a href="/userWork/${work.user.id}" target="_blank">${work.user.username}</a></h4>

                        <a href="<c:url value='/workLikes/${work.id}'/>">Like</a>
                        <a href="<c:url value='/workDislikes/${work.id}'/>">Dislike</a>
                        <br>
                        <br>
                        <br>
                        <br>
                    </div>
                </c:forEach>


            </div>
        </div>

        <%--<c:url value="/work/add" var="addWork"/>--%>
        <%--<div class="container">--%>
            <%--<form:form action="${addWork}"  modelAttribute="emptyWork" enctype="multipart/form-data">--%>
                <%--<form:input path="id" readonly="true"/>--%>
                <%--<form:input path="workName"/>--%>
                <%--<form:select path="category">--%>
                    <%--<option>Architecture</option>--%>
                    <%--<option>Design</option>--%>
                    <%--<option>3D Model</option>--%>
                <%--</form:select>--%>
                <%--<input type="file" name="workImg" formenctype="multipart/form-data">--%>
                <%--<input type="submit" class="btn btn-primary"><i class="fa fa-paper-plane"></i>--%>
                <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
            <%--</form:form>--%>
        <%--</div>--%>
    </div>

</div>


<%@include file="tmp/footer.jsp" %>