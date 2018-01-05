<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="tmp/header.jsp"%>


<div style="background: gainsboro">
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
        <li>
            <c:if test="${!empty currentUser}">
                <a href="/myWorks">${currentUser.username} Discover</a>
            </c:if>
        </li>
        <li><a href="">Galery</a></li>
        <li><a href="/registration">Sign up</a></li>
        <li><a href="/login">Sign in</a></li>
        <li><a href="/logout">Exit</a></li>
    </ul>

    <div class="container-fluid">
        <div class="row">

            <div class="col-xs-12  col-xl-10">
                <div class="row">
                    <c:forEach items="${workList}" var="work">
                        <div class="col-xs-12 col-sm-6 col-md-4  col-xl-2" >
                            <a href="/workData/${work.id}"><img src="${work.workImg}" alt="img01" class="img-responsive img-thumbnail"/></a>
                                <h5><a href="/userWork/${work.user.id}" target="_blank">${work.user.username}</a>      - ${work.workName}</h5>
                            <a href="/categoryList/${work.category}" target="_blank">${work.category}</a>

















                            <c:if test="${currentUser != null}">
                                <form:form action="ratingAdd/${work.id}/${currentUser.id}"  modelAttribute="emptyRating">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="form-group col-md-8">
                                                <form:select path="value" class="form-control input-goal">
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                    <option>5</option>
                                                    <option>10</option>
                                                </form:select>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <input type="submit" value=" ok " class="btn btn-primary">
                                            </div>

                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        </div>
                                    </div>
                                </form:form>
                            </c:if>
                            <br>
                            <br>
                            <br>
                            <br>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="col-xs-12  col-xl-2">
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
<br>
<br>
<br>
<br>
                <h5> ${allUsers}  registered users</h5>
                <h5> ${allWorks}  registered works</h5>
            </div>
        </div>
    </div>
</div>


<%@include file="tmp/footer.jsp" %>