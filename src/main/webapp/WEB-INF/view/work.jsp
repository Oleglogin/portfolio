<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="tmp/header.jsp"%>

<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <a href="#" class="navbar-brand">LoginStudio</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="active">
                    <c:if test="${!empty currentUser}">
                        <a href="/myWorks">Discover</a>
                    </c:if>
                </li>
                <li><a href="/registration">Sign up</a></li>
                <li><a href="/login">Sign in</a></li>
                <li><a href="/logout">Exit</a></li>
            </ul>
        </div>
    </div>
</nav>

    <div class="container-fluid">
            <div class="row">
                <c:forEach items="${workList}" var="work">
                    <div class="col-md-2" >
                        <a href="/workData/${work.id}"><img src="${work.workImg}" alt="img01" class="img-responsive img-thumbnail"/></a>
                        <div class="container">
                            ${work.workName}
                            <a href="/categoryList" target="_blank">${work.category}</a>
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

                <div class="col-md-2">
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