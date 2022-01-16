<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- Tich hop jstl vao jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="vi">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="${pageContext.request.contextPath}/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/css/style.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <title>Lấy lại mật khẩu</title>
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">
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
<!-- forgot password  -->
<!-- ============================================================== -->
<div class="splash-container">
    <div class="card">
        <div class="card-header text-center"><img class="logo-img" src="${pageContext.request.contextPath}/img/logo.png"
                                                  alt="logo" width="120px">
            <span class="splash-description">Vui lòng nhập lại thông tin người dùng của bạn.</span></div>
        <div class="card-body">
            <form>
                <p>Chúng tôi sẽ gửi lại mail để cho bạn reset mật khẩu của mình.</p>
                <div class="form-group">
                    <input class="form-control form-control-lg" type="text" name="username" id="username" required=""
                           placeholder="Tài khoản" autocomplete="off">
                </div>
                <div class="form-group">
                    <input class="form-control form-control-lg" type="email" name="email" id="email" required=""
                           placeholder="Nhập email của bạn" autocomplete="off">
                </div>
                <div class="form-group pt-1">
                    <input class="btn btn-block btn-primary btn-xl" type="submit" id="forgot_password"
                           value="Đặt lại mật khẩu">
                </div>
            </form>
        </div>
        <div class="card-footer text-center">
            <span>Không có tài khoản? <a href="/register">Đăng ký</a></span>
        </div>
    </div>
</div>
<!-- ============================================================== -->
<!-- end forgot password  -->
<!-- ============================================================== -->
<!-- Optional JavaScript -->
<script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>

<script>
    $(document).ready(function () {

        $("#forgot_password").click(function (e) {
            var data = {
                "username": $('#username').val(),
                "email": $('#email').val()
            };
            $.ajax({
                url: "/send-password",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(data),
                dataType: "json",
                success: function (data) {
                   // alert("Mật khẩu đã được gửi đến email của bạn!!!");
                    location.reload();
                },
                error: function (xhr) {
                    alert('Error send mail');
                }
            });
        });

    });
</script>
</body>


</html>