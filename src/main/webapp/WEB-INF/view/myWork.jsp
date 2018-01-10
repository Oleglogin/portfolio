<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@include file="tmp/header.jsp"%>
<div  style="background: #31424f">
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
        <div class="col-xs-12  col-xl-1">
            <div class="container align-items-center pt-5">
                <div class="container field">
                    <c:if test="${countAcc < 1}">
                        <h2><a href="account">Tell about self</a></h2>
                    </c:if>
                    <i class="glyphicon glyphicon-eay-close" style="color:red"></i>
                </div>
                <c:forEach items="${accountList}" var="account">
                    <c:if test="${currentUser.id == account.user.id}">
                    <div class="container-fluid">
                        <c:if test="${account.avatar != null}">
                            <img src="${account.avatar}"width="120" height="120" class="rounded-circle"  alt="">
                        </c:if>
                        <c:if test="${account.avatar == null}">
                            <img src="/resources/img/avatar.png" width="120" height="120" class="rounded-circle" alt="">
                        </c:if>
                    </div>
                        <div class="container"><h2>${account.user.username}</h2></div>
                        <div class="container"><h2>${account.firstName} ${account.lastName}</h2></div>
                        <div class="container"><h2>${account.country} ${account.city}</h2></div>
                        <div class="container"><h2>${account.category}</h2></div>
                        <div class="container"><h2><a href="/editAccount/${account.id}" target="_blank">Edit</a></h2></div>
                    </c:if>
                </c:forEach>
                <br>
                <br>
                <br>
                <div class="col-4 text-center">
                    <span class="step">${daysWithUs}</span>day(s)with us
                </div>
            </div>
        </div>

        <div class="col-xs-12  col-xl-11">
            <div class="container">
                <div class="row align-items-center pt-5">
                    <c:forEach items="${workList}" var="work">
                        <c:if test="${currentUser.id == work.user.id}">
                            <div class="col-xs-12 col-sm-6 col-md-4 col-xl-3" >

                                    <div class="myimg-wrap">
                                        <img src="${work.workImg}" alt="img01" class="img-responsive img-thumbnail "/>
                                        <span>${work.workName}</span>
                                        <p>
                                            <a href="<c:url value='/workRemove/${work.id}'/>">Delete</a>
                                            <a href="<c:url value='/workEdit/${work.id}'/>">Edit</a>
                                        </p>
                                    </div>
                                            ${work.category}
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
