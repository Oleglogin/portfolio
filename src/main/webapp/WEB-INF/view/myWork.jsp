<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="tmp/header.jsp"%>
hello${currentUser.username}
hello${currentUser.id}
<c:forEach items="${workList}" var="work">
    <c:if test="${currentUser.id == work.user.id}">
        <div class="container-fluid col-md-3">
            <div class="row">
                <img src="${work.workImg}" alt="img01" class="img-responsive img-thumbnail "/>
            </div>
        </div>
    </c:if>

</c:forEach>
<%@include file="tmp/footer.jsp"%>
