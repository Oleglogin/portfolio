<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="tmp/header.jsp"%>
<%--hello${currentUser.username}--%>
<%--hello${currentUser.id}--%>
${work.id} picture
<%--${work.workTitle}--%>
${work.user.id} user

<% int id_user = 0; %>
<%= id_user%>


        <c:forEach items="${workList}" var="work">
            <div class="container-fluid col-md-3">
                <div class="row">
                    <img src="${work.workImg}" alt="img01" class="img-responsive img-thumbnail "/>
                </div>
            </div>
        </c:forEach>



<%@include file="tmp/footer.jsp"%>
