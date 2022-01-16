<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<!-- sử dụng taglibs của spring để bind-data từ end-point trả về. -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- tích hợp JSTL vào trong JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="vi">


<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
    <title>Thông tin cá nhân</title>
</head>

<body>
<!-- ============================================================== -->
<!-- navbar -->
<!-- ============================================================== -->
<!-- header -->
<%@ include file="/WEB-INF/views/admin/layout/header.jsp" %>
<!-- header -->
<!-- ============================================================== -->
<!-- end navbar -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- left sidebar -->
<!-- ============================================================== -->
<%@ include file="/WEB-INF/views/admin/layout/menu.jsp" %>
<!-- ============================================================== -->
<!-- end left sidebar -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- wrapper  -->
<!-- ============================================================== -->
<div class="dashboard-wrapper">
    <div class="influence-profile">
        <div class="container-fluid dashboard-content ">
            <!-- ============================================================== -->
            <!-- pageheader -->
            <!-- ============================================================== -->
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="page-header">
                        <h3 class="mb-2">Thông tin cá nhân</h3>
                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/admin	"
                                                                   class="breadcrumb-link">Tài khoản</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Thông
                                        tin cá nhân
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <c:if test="${not empty message}">
                <script type="text/javascript">
                    alert('Đã sửa thành công');
                </script>
            </c:if>
            <!-- ============================================================== -->
            <!-- end pageheader -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- content -->
            <!-- ============================================================== -->
            <div class="row">
                <!-- ============================================================== -->
                <!-- profile -->
                <!-- ============================================================== -->
                <div class="col-xl-3 col-lg-3 col-md-5 col-sm-12 col-12">
                    <!-- ============================================================== -->
                    <!-- card profile -->
                    <!-- ============================================================== -->
                    <div class="card">
                        <div class="card-body">
                            <div class="user-avatar text-center d-block">
                                <c:if test="${admin.avatar != null}">
                                    <img src="${pageContext.request.contextPath}/img/${admin.avatar}"
                                         alt="User Avatar" class="rounded-circle user-avatar-xxl">
                                </c:if>
                                <c:if test="${admin.avatar == null}">
                                    <img src="${pageContext.request.contextPath}/img/avatar.png"
                                         alt="User Avatar" class="rounded-circle user-avatar-xxl">
                                </c:if>

                            </div>
                            <div class="text-center">
                                <h2 class="font-24 mb-0"></h2>
                            </div>
                        </div>
                        <div class="card-body border-top">
                            <h3 class="font-16">Thông tin liên hê</h3>
                            <div class="">
                                <ul class="list-unstyled mb-0">
                                    <li class="mb-2"><i class="fas fa-fw fa-envelope mr-2"></i>${admin.email}</li>
                                    <li class="mb-0"><i class="fas fa-fw fa-phone mr-2"></i>${admin.mobile}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end card profile -->
                    <!-- ============================================================== -->
                </div>
                <!-- ============================================================== -->
                <!-- end profile -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- campaign data -->
                <!-- ============================================================== -->
                <div class="col-xl-9 col-lg-9 col-md-7 col-sm-12 col-12">
                    <!-- ============================================================== -->
                    <!-- campaign tab one -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- end pageheader -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <!-- ============================================================== -->
                        <!-- valifation types -->
                        <!-- ============================================================== -->
                        <c:if test="${not empty message}">
                            <div class="col-sm-12 alert alert-${alert}">
                                <strong>${messageAlert}</strong>
                            </div>
                        </c:if>
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header">Thông tin cá nhân</h5>
                                <div class="card-body">
                                    <form action="/admin/edit_account_information" method="post"
                                          modelAttribute="admin" enctype="multipart/form-data">
                                        <input type="hidden" name="id" value="${admin.id}">
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Họ
                                                & Tên </label>
                                            <div class="col-12 col-sm-8 col-lg-6">

                                                <input type="text" required="" name="name"
                                                       value="${admin.name}" placeholder="" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Email
                                            </label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <input type="email" required="" placeholder=""
                                                       value="${admin.email}" name="email" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Chức
                                                vụ</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <c:if test="${admin.role == 'ADMIN'}">
                                                    <input type="text" required="" value="Quản lý" class="form-control"
                                                           readonly>
                                                </c:if>
                                                <c:if test="${admin.role == 'EMPLOYEE'}">
                                                    <input type="text" required="" value="Nhân viên"
                                                           class="form-control" disabled readonly>
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Số
                                                điện thoại</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <input type="text" value="${admin.mobile}" name="mobile"
                                                       required="" data-parsley-maxlength="6" placeholder=""
                                                       class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Địa
                                                chỉ</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <input type="text" required="" name="address"
                                                       value="${admin.address}" data-parsley-maxlength="6"
                                                       placeholder="" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Ảnh</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <img src="" alt="" width="auto" height="200px" id="avatar"
                                                     style="float: left;display: none;">
                                                <input type="file" name="image" onchange="chooseFile(this)"
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Mật
                                                khẩu cũ</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <input type="password" name="password" value=""
                                                       data-parsley-maxlength="6" minlength="6"
                                                       placeholder="Không nhập vào mục này nếu không thay đổi password"
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Mật
                                                khẩu mới</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <input type="password" name="passwordNew" value=""
                                                       id="pass" data-parsley-maxlength="6" minlength="6"
                                                       placeholder="Không nhập vào mục này nếu không thay đổi password"
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Xác
                                                nhận</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <input type="password" data-parsley-maxlength="6"
                                                       id="pass1" name="confimPassword" minlength="6"
                                                       placeholder="Xác nhận mật khẩu sau khi thay đổi"
                                                       class="form-control">
                                                <p style="color: red; font-size: 10px;"
                                                   id="CheckPasswordMatch"></p>
                                            </div>
                                        </div>
                                        <div class="form-group row text-right">
                                            <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                                <button type="submit" id="Save"
                                                        class="btn btn-space btn-primary">Lưu
                                                </button>
                                                <a href="/admin">
                                                    <button class="btn btn-space btn-secondary">Huỷ</button>
                                                </a>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end valifation types -->
                        <!-- ============================================================== -->
                    </div>

                    <!-- ============================================================== -->
                    <!-- end campaign data -->
                    <!-- ============================================================== -->
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- end content -->
        <!-- ============================================================== -->
        <div class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                        Copyright © 2018 Concept. All rights reserved. Dashboard by <a
                            href="https://colorlib.com/wp/">Colorlib</a>.
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="text-md-right footer-links d-none d-sm-block">
                            <a href="javascript: void(0);">About</a> <a
                                href="javascript: void(0);">Support</a> <a
                                href="javascript: void(0);">Contact Us</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- end footer -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- end wrapper -->
    <!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- end main wrapper -->
<!-- ============================================================== -->
<!-- Optional JavaScript -->
<!-- jquery 3.3.1  -->
<script
        src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<!-- bootstap bundle js -->
<script
        src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<!-- slimscroll js -->
<script
        src="${pageContext.request.contextPath}/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
<!-- main js -->
<script
        src="${pageContext.request.contextPath}/assets/libs/js/main-js.js"></script>
<script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
    function checkPasswordMatch() {
        var password = $("#pass").val();
        var confirmPassword = $("#pass1").val();
        var email = $("#pass1").val();

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

    function chooseFile(fileInput) {
        $('#avatar').show();
        if (fileInput.files && fileInput.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $("#avatar").attr('src', e.target.result);
            }
            reader.readAsDataURL(fileInput.files[0]);
        }
    }


</script>
</body>

</html>