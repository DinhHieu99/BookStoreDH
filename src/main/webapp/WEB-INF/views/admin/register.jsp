<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- Tich hop jstl vao jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Register</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link
            href="${pageContext.request.contextPath}/assets/vendor/fonts/circular-std/style.css"
            rel="stylesheet">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/libs/css/style.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="shortcut icon" type="image/png"
          href="${pageContext.request.contextPath}/img/logo.png">
    <style>
        html, body {
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
<c:if test="${not empty message}">
    <div class="col-sm-12 alert alert-${alert}">
        <strong>${messageAlert}</strong>
        <c:if test="${message == false}">
        <script>
            alert('Đã có tài khoản đăng ký');
        </script>
        </c:if>
    </div>
</c:if>
<div class="splash-container" style="max-width: 600px">
    <div class="card ">
        <div class="card-header text-center">
            <a href="/">
                <img class="logo-img" src="${pageContext.request.contextPath}/img/logo.png" alt="logo" width="120px">
            </a>
            <span class="splash-description">Nhập thông tin tài khoản admin cần tạo.</span>
        </div>
        <div class="card-body">
            <form action="/register" modelAttribute="register" method="post">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>Họ & tên:</label>
                            <input
                                class="form-control form-control-lg" type="text" name="name"
                                placeholder="Nhập họ tên" autocomplete="off" required>
                        </div>
                        <div class="form-group">
                            <label>Địa chỉ:</label>
                            <input class="form-control form-control-lg" type="text" name="address"
                                placeholder="Nhập địa chỉ " autocomplete="off" required>
                        </div>
                        <div class="form-group">
                            <label>Email:</label>
                            <input class="form-control form-control-lg" type="email" name="email"
                                placeholder="Nhập email" autocomplete="off" required>
                        </div>
                    </div>
                    <div class="col-sm-6">

                        <div class="form-group">
                            <label>Username:</label>
                            <input class="form-control form-control-lg" type="text" required
                                name="username" placeholder="Nhập tài khoản" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <label>Password:</label>
                            <input class="form-control form-control-lg" type="password" id="pass" minlength="6"
                                name="password" placeholder="Nhập mật khẩu" autocomplete="off" required>
                        </div>
                        <div class="form-group">
                            <label>Confim Password:</label>
                            <input class="form-control form-control-lg" type="password" id="pass1" minlength="6"
                                name="confimPassword" placeholder="Xác nhận lại mật khẩu" required>
                            <p style="color: red; font-size: 10px;" id="CheckPasswordMatch"></p>
                        </div>
                    </div>
                </div>
                <div class="card-footer bg-white p-0  ">
                    <div class="row">
                        <div class="col-6">
                            <div class="card-footer-item card-footer-item-bordered">
                                <a href="/login" class="footer-link">Đăng nhập</a>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="card-footer-item card-footer-item-bordered" style="float: right;">
                                <a href="/forgot-password" class="footer-link ">Quên mật khẩu</a>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="submit" id="Save" class="btn btn-primary btn-lg btn-block">Tạo
                    tài khoản</button>
            </form>
        </div>

    </div>
</div>

<!-- ============================================================== -->
<!-- end login page  -->
<!-- ============================================================== -->
<!-- Optional JavaScript -->
<script
        src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<script
        src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script>
    function checkPasswordMatch() {
        var password = $("#pass").val();
        var confirmPassword = $("#pass1").val();

        if (confirmPassword == '') {
            //document.getElementById("CheckPasswordMatch").style.display = 'none';
            $("#CheckPasswordMatch").hide();
        } else if (password != confirmPassword) {
            $("#CheckPasswordMatch").show();
            $("#CheckPasswordMatch").html("Passwords không đúng!");
            document.getElementById("CheckPasswordMatch").style.color = 'red';
            document.getElementById("Save").disabled = true;
        } else {
            $("#CheckPasswordMatch").html("Passwords phù hợp.");
            document.getElementById("CheckPasswordMatch").style.color = 'green';
            document.getElementById("Save").disabled = false;
        }
    }

    $(document).ready(function () {
        $("#pass1").keyup(checkPasswordMatch);
        $("#pass").keyup(checkPasswordMatch);
    });
</script>
</body>

</html>