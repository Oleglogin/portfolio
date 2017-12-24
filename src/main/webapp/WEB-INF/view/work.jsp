<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="tmp/header.jsp"%>


hello <h2>${currentUser.id} <a href="myWorks/${emptyWork.id}" target="_blank">Show ${currentUser.username} works</a></h2>

<div class="container-fluid">
    <div class="row">
        <c:forEach items="${workList}" var="work">
                <div class="col-md-3" >
                    <h3><a href="/workData/${work.id}" target="_blank">${work.workName}</a></h3>
                    <a href="/workData/${work.id}"><img src="${work.workImg}" alt="img01" class="img-responsive img-thumbnail"/></a>
                    <div class="container">
                        <%--<h4><a href="/userWork/${work.id}" target="_blank">${work.user.username}</a></h4>--%>
                        <h4><a href="/userWork/${work.user.id}" target="_blank">${work.user.username}</a></h4>
                        <p>${work.category}</p>
                    </div>
                        <a href="<c:url value='/workRemove/${work.id}'/>">Delete</a>
                        <a href="<c:url value='/workEdit/${work.id}'/>">Edit</a>
                        <a href="<c:url value='/workLikes/${work.id}'/>">Like</a>
                        <a href="<c:url value='/workDislikes/${work.id}'/>">Dislike</a>
                        <a href="workData/${work.id}" target="_blank">View more</a>
                </div>
        </c:forEach>
            <%--<table class="table-cell">--%>
                <%--<tr>--%>
                    <%--<td>id</td>--%>
                    <%--<td>name</td>--%>
                    <%--<td>img</td>--%>
                    <%--<td>category</td>--%>
                    <%--<td>edit</td>--%>
                    <%--<td>delete</td>--%>
                <%--</tr>--%>
                <%--<c:forEach items="${workList}" var="work">--%>
                    <%--<tr>--%>
                        <%--<td>${work.id}</td>--%>
                        <%--<td>${work.workName}</td>--%>
                        <%--<td><img src="${work.workImg}"width="30" height="30" class="rounded-circle" alt=""></td>--%>
                        <%--<td>${work.category}</td>--%>
                        <%--<td><a href="<c:url value='/workEdit/${work.id}'/>">Edit</a></td>--%>
                        <%--<td><a href="<c:url value='/workRemove/${work.id}'/>">Delete</a></td>--%>
                        <%--&lt;%&ndash;<td><a href='/workEdit/${work.id}'/>Edit</td>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<td><a href='/workRemove/${work.id}'/>Delete</td>&ndash;%&gt;--%>

                    <%--</tr>--%>
                <%--</c:forEach>--%>
            <%--</table>--%>

    </div>
</div>

<c:url value="/work/add" var="addWork"/>

                <form:form action="${addWork}"  modelAttribute="emptyWork" enctype="multipart/form-data">
                    <form:input path="id" readonly="true"/>
                    <form:input path="workName"/>
                    <form:input path="category"/>
                    <input type="file" name="workImg" formenctype="multipart/form-data">
                    <input type="submit" class="btn btn-primary"><i class="fa fa-paper-plane"></i>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form:form>

<%@include file="tmp/footer.jsp" %>