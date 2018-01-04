<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="tmp/header.jsp"%>



<ul class="menu">
    <li><a href="">LoginStudio</a></li>
    <li><a href="">Company</a>
        <ul>
            <li><a href="">one</a></li>
            <li><a href="">two</a></li>
            <li><a href="">free</a></li>
            <li><a href="">four</a></li>
            <li><a href="">five</a></li>
        </ul>
    </li>
    <li>
        <c:if test="${!empty currentUser}">
            <a href="/myWorks">Discover</a>
        </c:if>
    </li>
    <li><a href="">Galery</a></li>
    <li><a href="/registration">Sign up</a></li>
    <li><a href="/login">Sign in</a></li>
    <li><a href="/logout">Exit</a></li>
</ul>

    <div class="container-fluid">
            <div class="row">
                <c:forEach items="${workList}" var="work">
                    <div class="col-xs-12 col-sm-6 col-md-4  col-xl-2" >
                        <a href="/workData/${work.id}"><img src="${work.workImg}" alt="img01" class="img-responsive img-thumbnail"/></a>
                        <div class="container">
                            ${work.workName}
                            <a href="/categoryList/${work.category}" target="_blank">${work.category}</a>
                        </div>
                        <h4><a href="/userWork/${work.user.id}" target="_blank">${work.user.username}</a></h4>

                        <form:form action="ratingAdd/${work.id}"  modelAttribute="emptyRating">
                            <c:if test="${currentUser != null}">
                                <form:select path="value">
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                    <option>10</option>
                                </form:select>
                                <input type="submit">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </c:if>
                        </form:form>
                        <%--<h1>${currentWork}</h1>--%>
                        <%--<h2>${countRating}</h2>--%>
                        <br>
                        <br>
                        <br>
                        <br>
                    </div>
                </c:forEach>


                <div class="col-xs-12 col-sm-6 col-md-4  col-xl-2">
                    <canvas id="myChart"></canvas>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
                    <script>
                        var ctx = document.getElementById('myChart').getContext('2d');
                        var myChart = new Chart(ctx, {
                            type: 'doughnut',
                            data: {
                                labels: ["Design", "Architecture", "3D_Model"],
                                datasets: [{
                                    data: [ ${CategoryDesign}, ${CategoryArchitecture}, ${Category3D_Model}],
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


<%@include file="tmp/footer.jsp" %>