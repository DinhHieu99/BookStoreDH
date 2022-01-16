<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- Tich hop jstl vao jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8"/>
    <meta name="description" content="Demo su dung bootstrap"/>
    <meta name="keyword" content="HTML, CSS, JavaScript, Java, Spring, MySql, Maven, Bootstrap, JQuery"/>
    <meta name="author" content="HieuNguyen">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/font/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/webstore.css">
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">

    <title>Tin tức</title>
</head>

<body class="font">
<!-- header -->
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<!-- header -->
<!--content-->
<div class="container">
    <div class="row">
        <div class="wrapper-tab col-md-12">
            <ul class="breadcrumb">
                <li class="home">
                    <a href="/">
                        <span><i class="fa fa-home"></i> Trang chủ</span>
                    </a>
                    <span><i class="fa">/&nbsp;</i></span>
                </li>
                <li>
                    <a href="/post">
                        <span>Tin tức</span>
                    </a>

                </li>

            </ul>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-9 col-12">
                <div class="box-heading">
                    <h4>TIN TỨC</h4>
                    <div class="row">
                        <c:forEach var="post" items="${post}">
                            <div class="col-md-4 col-12">
                                <a href="/post/${post.id}-${post.title}" class="post-title"
                                   title="${post.title}">
                                    <img src="${pageContext.request.contextPath}/img/${post.image}"
                                         alt="${post.title}" class="img-responsive center-block" style="width:80%; padding-top:15px;">
                                </a>
                            </div>
                            <div class="col-md-8 col-12">
                                <h6><a href="/post/${post.id}-${post.title}" class="post-title"
                                       title="${post.title}" style="font-weight: bold;">${post.title}</a></h6>
                                <div class="post-time">
                                    <fmt:formatDate value="${post.createdDate}" pattern="dd/MM/yyyy"/>
                                </div>
                                <p class="blog-item-summary margin-bottom-5">${post.description}</p>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="content-right col-md-3 col-12">
                <h5>XEM NHIỀU NHẤT</h5>
                <c:forEach var="post" items="${postmost}">
                    <div class="row post-most">
                        <div class="col-md-3 col-3">
                            <img src="${pageContext.request.contextPath}/img/${post.image}"
                                 width="60px" alt="${post.title}"
                                 class="img-responsive center-block">
                        </div>
                        <div class="col-md-9 col-9">
                            <h6><a class="post-most-title" href="/post/${post.id}-${post.title}" title="${post.title}"
                                   style="font-weight: none;">${post.title}</a>
                            </h6>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

    </div>
</div>

</div>
<!--end content-->
<!--footer-->
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
<!-- footer -->

<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/js/webstore.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!--End -->
<script>
    $(document).ready(function () {
        $("#searchProduct").keyup(function () {
            var nameProductSearch = document.getElementById("searchProduct").value;
            if (nameProductSearch.length > 0) {
                document.getElementById("resultLivingSearch").style.display = 'block';
                $.ajax({

                    url: "${pageContext.request.contextPath}/living-search",
                    type: "get",
                    data: {
                        search_query: nameProductSearch
                    },
                    success: function (response) {
                        $("#resultLivingSearch").html(response);
                    },
                    error: function (xhr) {
                        alert('Error')
                    }
                });
            } else {
                document.getElementById("resultLivingSearch").style.display = 'none';
            }

        });
    });
</script>
</body>

</html>