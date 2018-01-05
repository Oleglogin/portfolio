<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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


<div class="container-fluid">
    <div class="row">

        <div class="col-xs-12  col-xl-3">
            <div class="container align-items-center pt-5">
                <div class="container field">
                    <c:if test="${countAcc < 1}">
                        <h2><a href="account">Tell about self</a></h2>
                    </c:if>
                </div>

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
                <br>
                <br>
                <br>
                <div class="col-4 text-center">
                    <span class="step">${daysWithUs}</span>
                    day(s) with us
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
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <form:input path="workName" class="form-control input-goal" id="workName" placeholder="Name"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <form:select path="category" class="form-control input-goal" id="category">
                                            <option>Architecture</option>
                                            <option>Design</option>
                                            <option>3D_Model</option>
                                        </form:select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <input type="file" name="workImg" class="form-control-file" formenctype="multipart/form-data" id="exampleFormControlFile1">
                            </div>


                            <div class="container-fluid">
                                <div class="row">
                                    <div class="form-group col-md-8">
                                        <input type="submit" class="btn btn-primary">
                                    </div>
                                    <%--<div class="form-group col-md-4">--%>
                                        <%--<button type="reset" class="btn btn-outline-danger">Reset</button>--%>
                                    <%--</div>--%>
                                    <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/>
                                </div>
                            </div>

                            <form:input type="hidden" path="id" readonly="true"/>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
</div>

<%@include file="tmp/footer.jsp"%>
