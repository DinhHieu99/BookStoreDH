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

    <title>${post.title}</title>
</head>

<body class="font">
<!-- footer -->
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<!-- footer -->

<div class="container">
    <div class="row">
        <div class="wrapper-tab col-md-12">
            <ul class="breadcrumb">
                <li class="home">
                    <a href="#">
                        <span><i class="fa fa-home"></i> Trang chủ</span>
                    </a>
                    <span><i class="fa">/&nbsp;</i></span>
                </li>
                <li>Tin tức</li>
            </ul>
        </div>
        <div class="col-sm-12 col-xs-12 col-md-3 post" id="post-top">
            <h5 style="border: 0;">XEM NHIỀU NHẤT</h5>
            <div class="row post-most">
                <div class="col-3 col-sm-3 col-md-3">
                    <img src="${pageContext.request.contextPath}/img/${post.image}"
                         width="50px" height="50px" alt="${post.title}"
                         class="img-responsive center-block">

                </div>
                <div class="col-9 col-sm-9 col-md-9">
                    <h6><a class="post-most-title" href="/post/${post.id}-${post.title}" title="${post.title}"
                           style="font-weight: none;">${post.title}</a></h6>
                </div>
            </div>

        </div>
        <div class="col-md-9 content">
            <h1 class="title-head">${post.title}</h1>
            <div class="post-time">
                <span><fmt:formatDate value="${post.createdDate}" pattern="dd/MM/yyyy"/></span>
            </div>
            <h2 class="description_short"><strong>
                <p>${post.description}</p>
            </strong></h2>
            <div class="top-cate-head clearfix">
                ${post.details}
            </div>
        </div>

        <div class="col-sm-12 col-xs-12 post" id="post-bottom">
            <h5 style="border: 0;">XEM NHIỀU NHẤT</h5>
            <div class="row post-most">
                <div class="col-3 col-sm-3 col-md-3">
                    <img src="${pageContext.request.contextPath}/img/${post.image}"
                         width="50px" height="50px" alt="${post.title}"
                         class="img-responsive center-block">

                </div>
                <div class="col-9 col-sm-9 col-md-9">
                    <h6><a class="post-most-title" href="/post/${post.id}-${post.title}" title="${post.title}"
                           style="font-weight: none;">${post.title}</a></h6>
                </div>
            </div>

        </div>
    </div>
</div>
<!--footer-->
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
<!--footer-->


<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/webstore.js"></script>
<script src="${pageContext.request.contextPath}/js/page.js"></script>
<script>
    $(document).ready(function () {
        $("#searchProduct").keyup(function () {
            var nameProductSearch = document.getElementById("searchProduct").value;
            if(nameProductSearch.length > 0){
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
            }else{
                document.getElementById("resultLivingSearch").style.display = 'none';
            }

        });
    });
</script>
</body>

</html>