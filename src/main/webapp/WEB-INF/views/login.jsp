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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
    <!-- icon trang thẻ web-->
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">
    <!-- icon trang thẻ web-->


    <title>Đăng nhập</title>
</head>

<body class="font">

<!-- header -->
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<!-- header -->
<!--content-->
<div class="container">
    <div class="wrapper-tab">
        <ul class="breadcrumb">
            <li class="home">
                <a href="/">
                    <span><i class="fa fa-home"></i> Trang chủ</span>
                </a>
                <span><i class="fa">/&nbsp;</i></span>
            </li>
            <li>
                <a href="javascript:void(0)">
                    <span>Tài khoản</span>
                </a>
                <span><i class="fa">/&nbsp;</i></span>
            </li>
            <li>
                <a href="/user/login">
                    <span>Đăng nhập</span>
                </a>
            </li>
        </ul>
    </div>
    <div class="content">
        <div class="wrapper-tab row">
            <div class="content-left col-sm-6">
                <h2>Khách hàng mới</h2>
                <span>Đăng ký</span>
                <p>Bằng việc tạo tài khoản bạn có thể mua sắm nhanh hơn, theo dõi trạng thái đơn hàng, và theo dõi đơn
                    hàng mà bạn đã đặt.</p>
                <a href="/account/register">Tiêp tục</a>
            </div>
            <div class="content-right col-sm-6">
                <h2>Khách hàng cũ</h2>
                <span>Tôi là khách hàng cũ</span><br>
                <div class="form-group" style="text-align: left;">
                    <form method="post" action="/user/login" modelAttribute="Login">
                        <label class="control-label">Đia chỉ email</label><br>
                        <input type="text" class="form-control" placeholder="nhập tài khoản" name="email"><br>
                        <label class="control-label">Mật khẩu</label><br>
                        <input type="password" class="form-control" placeholder="nhập mật khẩu" name="password"><br>
                        <input type="submit" name="login" class="btn btn-primary" value="Đăng nhập">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!--footer-->
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
<!-- footer -->

<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"/>
<script src="${pageContext.request.contextPath}/js/webstore.js"/>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"/>
<script>
    $(document).ready(function () {
        var n = window.location.href;

        if(n.indexOf('?') == -1){
            $('#Check').hide();
        }else{
            var str = n.split('?');
            if(str[1] == 'error'){
                $('#Check').show();
                $("#Check").html("Sai tài khoản hoặc mật khẩu.");
            }
        }

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