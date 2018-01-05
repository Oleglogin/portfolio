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
    <li><a href="/registration">Sign up</a></li>
    <li><a href="/login">Sign in</a></li>
    <li><a href="/logout">Exit</a></li>
</ul>


        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12  col-xl-3">
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <div class="container">
                        <h3>${work.user.username}</h3>
                    </div>
                    <div class="container">
                        <h3>${work.workName}</h3>
                    </div>
                    <div class="container">
                        <h3>${work.category}</h3>
                    </div>

                <c:if test="${countRating >=1}">
                    <div class="container">
                        <h4> number of ratings - ${countRating}</h4>
                    </div>
                    <div class="container">
                        <h4>arithmetic - ${arithmetic}</h4>
                    </div>
                    <div class="container">
                        <c:forEach items="${userRating}" var="UR">
                            <c:if test="${UR.value > 0}">
                                <h4>user  ${UR.user.id} like ${UR.value} ball</h4>
                            </c:if>
                        </c:forEach>
                    </div>
                </c:if>


                </div>
                <div class="col-xs-12  col-xl-9">
                    <img src="${work.workImg}" alt="img01" class="img-responsive img-thumbnail "/>
                </div>
            </div>
        </div>
</div>




<%@include file="tmp/footer.jsp"%>