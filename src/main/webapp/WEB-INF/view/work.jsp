<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="tmp/header.jsp"%>
    <div class="container-fluid">
        <h3>
            Logo
            <c:if test="${!empty currentUser}">
                <a href="/myWorks">Discover</a>
            </c:if>
            <a href="/registration">Sign up</a>
            <a href="/login">Sign in</a>
            <a href="/logout">Exit</a>
        </h3>
    </div>

    <div class="container">
            <div class="row">
                <c:forEach items="${workList}" var="work">
                    <div class="col-md-3" >
                        <a href="/workData/${work.id}"><img src="${work.workImg}" alt="img01" class="img-responsive img-thumbnail"/></a>
                        <div class="container">
                            ${work.workName}
                            <a href="/workCategory" target="_blank">${work.category}</a>
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


<%@include file="tmp/footer.jsp" %>