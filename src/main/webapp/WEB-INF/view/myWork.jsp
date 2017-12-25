<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="tmp/header.jsp"%>
<div class="container-fluid align-items-center pt-5" style="background: gainsboro">
    <h2>${currentUser.username} Discover</h2>
    <br>
    <br>
</div>

<div class="container-fluid">
    <div class="row">

        <div class="col-xs-12  col-xl-3">
            <div class="container align-items-center pt-5">
                <c:if test="${countAcc < 1}">
                    <a href="account">Tell about self</a>
                </c:if>
                <c:forEach items="${accountList}" var="account">
                    <c:if test="${currentUser.id == account.user.id}">
                        <div class="container"><img src="${account.avatar}"width="180" height="180"  alt=""></div>
                        <div class="container"><h2>${account.user.username}</h2></div>
                        <div class="container"><h2>${account.firstName} ${account.lastName}</h2></div>
                        <div class="container"><h2>${account.country} ${account.city}</h2></div>
                        <div class="container"><h2>${account.category}</h2></div>
                        <div class="container"><h2><a href="/editAccount/${account.id}" target="_blank">Edit</a></h2></div>
                    </c:if>
                </c:forEach>

                <div class="container-fluid">
                    <canvas id="myChart"></canvas>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
                    <script>
                        var ctx = document.getElementById('myChart').getContext('2d');
                        var myChart = new Chart(ctx, {
                            type: 'doughnut',
                            data: {
                                labels: ["Design", "Architecture", "3D_Model"],
                                datasets: [{
                                    data: [ ${countCategoryDesign}, ${countCategoryArchitecture}, ${countCategory3D_Model}],
                                    backgroundColor: [
                                        'rgba(54, 162, 235, 1)',
                                        'rgba(255, 206, 86, 1)',
                                        'rgba(255, 99, 132, 1)',
                                    ],
                                }]
                            },
                            options: {
                                title: {
                                    display: true,
                                    text: 'Statistic by goal'
                                },
                            }
                        });
                    </script>
                </div>
            </div>
        </div>

        <div class="col-xs-12  col-xl-9">
            <div class="container">
                <div class="row align-items-center pt-5">
                    <c:forEach items="${workList}" var="work">
                        <c:if test="${currentUser.id == work.user.id}">
                            <div class="col-xs-12 col-sm-6 col-md-4 col-xl-3" >
                                ${work.workName}
                                ${work.category}
                                <img src="${work.workImg}" alt="img01" class="img-responsive img-thumbnail "/>

                                <a href="<c:url value='/workRemove/${work.id}'/>">Delete</a>
                                <a href="<c:url value='/workEdit/${work.id}'/>">Edit</a>
                                <br>
                                <br>
                                <br>
                            </div>
                        </c:if>
                    </c:forEach>
                    <div class="col-xs-12 col-sm-6 col-md-4 col-xl-3">
                        <c:url value="/work/add" var="addWork"/>
                        <form:form action="${addWork}"  modelAttribute="emptyWork" enctype="multipart/form-data">
                            <form:input path="workName"/>
                            <form:select path="category">
                                <option>Architecture</option>
                                <option>Design</option>
                                <option>3D_Model</option>
                            </form:select>
                            <input type="file" name="workImg" formenctype="multipart/form-data">
                            <input type="submit" class="btn btn-primary"><i class="fa fa-paper-plane"></i>
                            <form:input type="hidden" path="id" readonly="true"/>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

































<%--<div class="container">--%>
    <%--<div class=" color-rect-border">--%>
        <%--<div class="row">--%>
            <%--<c:forEach items="${workList}" var="work">--%>
                <%--<c:if test="${currentUser.id == work.user.id}">--%>
                    <%--<div class="col-md-3" >--%>
                        <%--<img src="${work.workImg}" alt="img01" class="img-responsive img-thumbnail "/>--%>
                        <%--<a href="<c:url value='/workRemove/${work.id}'/>">Delete</a>--%>
                        <%--<a href="<c:url value='/workEdit/${work.id}'/>">Edit</a>--%>
                        <%--<br>--%>
                        <%--<br>--%>
                        <%--<br>--%>
                    <%--</div>--%>
                <%--</c:if>--%>
            <%--</c:forEach>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<%--<c:url value="/work/add" var="addWork"/>--%>
<%--<div class="container">--%>
    <%--<div class="container-fluid color-rect-border">--%>
        <%--<div class="row">--%>
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
    <%--</div>--%>
<%--</div>--%>


<%--&lt;%&ndash;<c:if test="${!empty usersList}">&ndash;%&gt;--%>
    <%--&lt;%&ndash;<table class="table">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<tr>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<td>ID</td>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<td>Login</td>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<td>Password</td>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<td>Email</td>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<td>Delete</td>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<td>Edit</td>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</tr>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<c:forEach items="${usersList}" var="user">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<tr>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<td>${user.id}</td>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<td>${user.username}</td>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<td>${user.password}</td>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<td>${user.email}</td>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<td><a href="<c:url value='/userRemove/${user.id}'/>">Delete</a></td>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<td><a href="<c:url value='/userEdit/${user.id}'/>">Edit</a></td>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</tr>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</table>&ndash;%&gt;--%>
<%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>
<%--<br>--%>
<%--<br>--%>
<%--<br>--%>


<%--<table class="table">--%>
    <%--<tr>--%>
        <%--<td>ID</td>--%>
        <%--<td>First Name</td>--%>
        <%--<td>Last Name</td>--%>
        <%--<td>country</td>--%>
        <%--<td>city</td>--%>
        <%--<td>ava</td>--%>
        <%--<td>category</td>--%>
        <%--<td>user</td>--%>
        <%--<td>Edit</td>--%>
    <%--</tr>--%>
    <%--<c:forEach items="${accountList}" var="account">--%>
        <%--<c:if test="${currentUser.id == account.user.id}">--%>
            <%--<tr>--%>
                <%--<td>${account.id}</td>--%>
                <%--<td>${account.firstName}</td>--%>
                <%--<td>${account.lastName}</td>--%>
                <%--<td>${account.country}</td>--%>
                <%--<td>${account.city}</td>--%>
                <%--<td><img src="${account.avatar}"width="30" height="30" class="rounded-circle" alt=""></td>--%>
                <%--<td>${account.category}</td>--%>
                <%--<td>${account.user.username}</td>--%>
                <%--<td><a href="<c:url value='/editAccount/${account.id}'/>">Edit</a></td>--%>
            <%--</tr>--%>
        <%--</c:if>--%>

    <%--</c:forEach>--%>
<%--</table>--%>
<%--<br>--%>
<%--<br>--%>
<%--<br>--%>
<%--<c:url value="/saveAccount" var="addAcc"/>--%>

<%--<form:form modelAttribute="emptyAccount" action="${addAcc}" method="post" enctype="multipart/form-data">--%>
    <%--<form:input type="text" path="firstName" placeholder="Enter first name"/>--%>
    <%--<form:input type="text" path="lastName"  placeholder="Enter last name"/>--%>
    <%--<form:input type="text" path="country"  placeholder="Enter country"/>--%>
    <%--<form:input type="text" path="city"  placeholder="Enter city"/>--%>
    <%--<form:select path="category" >--%>
        <%--<option>Sport</option>--%>
        <%--<option>Power up my skills</option>--%>
        <%--<option>Studying</option>--%>
        <%--<option>Improving myself</option>--%>
        <%--<option>Success</option>--%>
    <%--</form:select>--%>
    <%--<input type="file" name="avatar" formenctype="multipart/form-data"/>--%>
    <%--<br>--%>
    <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
    <%--<input type="submit" value="Ok">--%>
<%--</form:form>--%>
<%@include file="tmp/footer.jsp"%>
