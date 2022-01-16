<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- Tich hop jstl vao jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<aside class="page-aside">
    <div class="aside-content">
        <div class="aside-header">
            <button class="navbar-toggle" data-target=".aside-nav" data-toggle="collapse" type="button"><span class="icon"><i class="fas fa-caret-down"></i></span></button><span class="title">Mail</span>
            <p class="description">Service description</p>
        </div>
        <div class="aside-compose"><a class="btn btn-lg btn-secondary btn-block" href="/admin/send-mail">Soạn email</a></div>
        <div class="aside-nav collapse">
            <ul class="nav">
                <li><a href="/admin/contacts"><span class="icon"><i class="fas fa-fw fa-inbox"></i></span>Hộp thư đến<span class="badge badge-primary float-right">${mail}</span></a></li>
                <li <%--class="active"--%>><a href="/admin/sent-mail"><span class="icon"><i class="fas fa-fw  fa-envelope"></i></span>Đã gửi mail<span class="badge badge-secondary float-right">${sendMail}</span></a></li>
                <li><a href="/admin/trash-mail"><span class="icon"><i class="fas fa-fw fa-trash"></i></span>Rác</a></li>
            </ul>
        </div>
    </div>
</aside>