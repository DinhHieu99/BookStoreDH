<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- Tich hop jstl vao jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="dashboard-header">
    <nav class="navbar navbar-expand-lg bg-white fixed-top">
        <a class="navbar-brand" href="/admin">
            <img alt="logo" src="${pageContext.request.contextPath}/img/logo.png" height="40px">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse " id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto navbar-right-top">
                <li class="nav-item dropdown notification">
                    <a class="nav-link nav-icons" href="#" id="navbarDropdownMenuLink1" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false"><i class="fas fa-fw fa-bell"></i>
                        <span class="indicator"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right notification-dropdown">
                        <li>
                            <div class="notification-title"> Thông báo</div>
                            <div class="notification-list">
                                <div class="list-group">
                                    <c:forEach var="contactHeader" items="${contactHeader}" begin="0" end="4">
                                        <a href="/admin/sendMail/id=${contactHeader.id}"
                                           class="list-group-item list-group-item-action active">
                                            <div class="notification-info">
                                                <div class="notification-list-user-img">

                                                    <c:choose>
                                                        <c:when test="${contactHeader.avatar != null}">
                                                            <img src="${pageContext.request.contextPath}/img/${contactHeader.avatar}"
                                                                 alt="" class="user-avatar-md rounded-circle">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img src="${pageContext.request.contextPath}/img/avatar.png"
                                                                 alt="" class="user-avatar-md rounded-circle">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <div class="notification-list-user-block">
													<span class="notification-list-user-name">${contactHeader.fullName}
                                                    </span>${contactHeader.subject}
                                                    <div class="notification-date">${contactHeader.createdDate}</div>
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="list-footer">
                                <a href="/admin/contacts">Xem tất cả thông báo</a>
                            </div>
                        </li>
                    </ul>
                </li>
                <li class="nav-item dropdown nav-user">
                    <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <c:if test="${admin.avatar != null}">
                            <img src="${pageContext.request.contextPath}/img/${admin.avatar}" alt=""
                                 class="user-avatar-md rounded-circle">
                        </c:if>
                        <c:if test="${admin.avatar == null}">
                            <img src="${pageContext.request.contextPath}/img/avatar.png" alt=""
                                 class="user-avatar-md rounded-circle">
                        </c:if>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right nav-user-dropdown"
                         aria-labelledby="navbarDropdownMenuLink2">
                        <div class="nav-user-info">
                            <h5 class="mb-0 text-white nav-user-name">
                                <c:if test="${admin.name != null}">
                                    ${admin.name}
                                </c:if>
                                <c:if test="${admin.name == null}">
                                    Tài khoản
                                </c:if>
                            </h5>
                            <span class="status"></span><span class="ml-2">Available</span>
                        </div>
                        <a class="dropdown-item" href="/admin/account_information"><i class="fas fa-user mr-2"></i>Tài
                            khoản</a>
                        <a class="dropdown-item" href="/logout"><i class="fas fa-power-off mr-2"></i>Đăng xuất</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
</div>
