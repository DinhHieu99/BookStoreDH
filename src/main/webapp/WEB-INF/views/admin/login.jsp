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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
    <!-- icon trang thẻ web-->
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">
    <!-- icon trang thẻ web-->
    <title>Đăng nhập tài khoản</title>
    <style>
        html,
        body {
            height: 100%;
        }

        body {
            display: -ms-flexbox;
            display: flex;
            -ms-flex-align: center;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
        }
    </style>
</head>

<body>
<!-- ============================================================== -->
<!-- login page  -->
<!-- ============================================================== -->
<c:if test="${not empty message }">
    <script>
        alert("${message}");
    </script>
</c:if>
<div class="splash-container">
    <div class="card">
        <div class="card-header text-center"><a href="/">
            <img class="logo-img"  src="${pageContext.request.contextPath}/img/logo.png"
                 alt="logo" width="120px"></a>
            <span class="splash-description">Nhập thông tin tài khoản</span></div>
        <div class="card-body">
            <form th:action=@{"/Admin/login"} method="POST">
                <div class="form-group">
                    <input class="form-control form-control-lg" name="username" type="text" placeholder="Username"
                           autocomplete="off" value="hieu@gmail.com">
                </div>
                <div class="form-group">
                    <input class="form-control form-control-lg" name="password" type="password" placeholder="Password"  value="hieu1234">
                    <p style="color: red; font-size: 15px; display: none;" id="Check"></p>
                </div>
                <div class="form-group">
                    <label class="custom-control custom-checkbox">
                        <input class="custom-control-input" type="checkbox"
                               name="remember-me"><span class="custom-control-label" for="remember">Nhớ mật khẩu</span>
                    </label>
                </div>
                <button type="submit" class="btn btn-primary btn-lg btn-block">Đăng nhập</button>
            </form>
        </div>
        <div class="card-footer bg-white p-0  ">
            <div class="card-footer-item card-footer-item-bordered">
                <a href="/register" class="footer-link">Tạo tài khoản</a></div>
            <div class="card-footer-item card-footer-item-bordered" style="float: right;">
                <a href="/forgot-password" class="footer-link">Quên mật khẩu</a>
            </div>
        </div>
    </div>
</div>

<!-- ============================================================== -->
<!-- end login page  -->
<!-- ============================================================== -->
<!-- Optional JavaScript -->
<script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script>
    $(document).ready(function (){
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
    });
</script>
</body>

</html>