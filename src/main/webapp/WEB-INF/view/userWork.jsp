<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="tmp/header.jsp"%>

<%--<% int id_user = 0; %>--%>
<%--<%= id_user%>--%>
<div class="container-fluid" style="background: #31424f">
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


    <div class="container-fluid">
        <div class="row">
            <c:forEach items="${work}" var="work">
                <div class="col-md-4">
                    <div class="container align-items-center pt-5">
                        <a href="/workData/${work.id}"><img src="${work.workImg}" alt="img01" class="img-responsive img-thumbnail"/></a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <br>
    <br>
    <br>
    <br>

</div>
<div id="footer" style="background: #31424f">
    <div class="pull-right">
        Developed by Login
    </div>
    <div style="clear: both"></div>
</div>


<%@include file="tmp/footer.jsp"%>
