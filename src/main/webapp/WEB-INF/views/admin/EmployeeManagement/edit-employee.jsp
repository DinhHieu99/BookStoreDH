<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>

<!-- sử dụng taglibs của spring để bind-data từ end-point trả về. -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- tích hợp JSTL vào trong JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">


<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Edit admin</title>
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
    <script src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
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
    <div class="container-fluid  dashboard-content">
        <!-- ============================================================== -->
        <!-- pageheader -->
        <!-- ============================================================== -->
        <div class="row">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="page-header">
                    <h2 class="pageheader-title">Sửa thông tin tài khoản</h2>

                    <div class="page-breadcrumb">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#"
                                                               class="breadcrumb-link">Bảng điều khiển</a></li>
                                <li class="breadcrumb-item"><a href="#"
                                                               class="breadcrumb-link">Giao diện</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Sửa
                                    thông tin nhân viên</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- end pageheader -->
        <!-- ============================================================== -->
        <div class="row">
            <!-- ============================================================== -->
            <!-- valifation types -->
            <!-- ============================================================== -->
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="card">
                    <h5 class="card-header">Sửa thông tin nhân viên</h5>
                    <div class="card-body">
                        <form method="post" action="/admin/edit-admin"
                              modelAttribute="admin" enctype="multipart/form-data">
                            <input type="hidden" name="id" value="${employee.id}" />

                            <div class="form-group row">
                                <label class="col-12 col-sm-3 col-form-label text-sm-right">Họ
                                    và tên </label>
                                <div class="col-12 col-sm-8 col-lg-6">
                                    <input name="name" type="text" required="" placeholder=""
                                           class="form-control" value="${employee.name}" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-12 col-sm-3 col-form-label text-sm-right">Email
                                </label>
                                <div class="col-12 col-sm-8 col-lg-6">
                                    <input name="email" type="email" required="" placeholder=""
                                           class="form-control" value="${employee.email}" />
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-12 col-sm-3 col-form-label text-sm-right">Chức
                                    vụ</label>
                                <div class="col-12 col-sm-8 col-lg-6">
                                    <select name="role.id" class="form-control" id="input-select">
                                        <c:if test="${employee.role == 'ADMIN'}">
                                        <option value="1" selected>Quản lý</option>
                                        <option value="2">Nhân viên</option>
                                        </c:if>
                                        <c:if test="${employee.role == 'EMPLOYEE'}">
                                            <option value="1" >Quản lý</option>
                                            <option value="2" selected>Nhân viên</option>
                                        </c:if>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-12 col-sm-3 col-form-label text-sm-right">Số
                                    điện thoại: </label>
                                <div class="col-12 col-sm-8 col-lg-6">
                                    <input name="mobile" type="text" required="" placeholder=""
                                           class="form-control" value="${employee.mobile}" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-12 col-sm-3 col-form-label text-sm-right">Địa
                                    chỉ</label>
                                <div class="col-12 col-sm-8 col-lg-6">
                                    <input name="address" type="text" required="" placeholder=""
                                           value="${employee.address}" class="form-control" />
                                </div>
                            </div>
                            <!-- div class="form-group row">
                                <label class="col-12 col-sm-3 col-form-label text-sm-right">Ảnh</label>
                                <div class="col-12 col-sm-8 col-lg-6">
                                    <input type="file" value="" placeholder=""
                                        class="form-control" name="postImage">
                                </div>
                            </div> -->

                            <div class="form-group row">
                                <label class="col-12 col-sm-3 col-form-label text-sm-right">Trạng
                                    thái</label>
                                <div class="col-12 col-sm-8 col-lg-6 form-group">
                                    <c:if test="${employee.status == false }">
                                        <label
                                                class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" name="status" checked="" value="0"
                                                   class="custom-control-input"><span
                                                class="custom-control-label">Offline</span>
                                        </label>
                                        <label
                                                class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" name="status" value="1"
                                                   class="custom-control-input"><span
                                                class="custom-control-label">Online</span>
                                        </label>
                                    </c:if>
                                    <c:if test="${employee.status == true }">
                                        <label
                                                class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" name="status" value="0"
                                                   class="custom-control-input"><span
                                                class="custom-control-label">Offline</span>
                                        </label>
                                        <label
                                                class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" name="status" checked="" value="1"
                                                   class="custom-control-input"><span
                                                class="custom-control-label">Online</span>
                                        </label>
                                    </c:if>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-12 col-sm-3 col-form-label text-sm-right">Cho
                                    phép đăng nhập</label>
                                <div class="col-12 col-sm-8 col-lg-6 form-group">
                                    <c:if test="${employee.status_login == false }">
                                        <label
                                                class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" name="status_login" checked="" value="false"
                                                   class="custom-control-input"><span
                                                class="custom-control-label">No</span>
                                        </label>
                                        <label
                                                class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" name="status_login" value="true"
                                                   class="custom-control-input"><span
                                                class="custom-control-label">Yes</span>
                                        </label>
                                    </c:if>
                                    <c:if test="${employee.status_login == true }">
                                        <label
                                                class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" name="status_login" value="0"
                                                   class="custom-control-input"><span
                                                class="custom-control-label">No</span>
                                        </label>
                                        <label
                                                class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" name="status_login" checked="" value="1"
                                                   class="custom-control-input"><span
                                                class="custom-control-label">Yes</span>
                                        </label>
                                    </c:if>
                                </div>
                            </div>
                            <div class="form-group row text-right">
                                <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                    <button type="submit" class="btn btn-space btn-primary">Cập nhật</button>
                                    <a href="/admin/data-table-admin"><input type="button"
                                                                             value="Hủy" class="btn btn-space btn-secondary"></input></a>
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

    </div>
    <!-- ============================================================== -->
    <!-- footer -->
    <!-- ============================================================== -->
    <div class="footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                    Copyright © 2018 Concept. All rights reserved. Dashboard by <a
                        href="https://colorlib.com/wp/">Colorlib</a>.
                </div>
                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
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
</div>
<!-- ============================================================== -->
<!-- end main wrapper -->
<!-- ============================================================== -->
<!-- Optional JavaScript -->
<script
        src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<script
        src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script
        src="${pageContext.request.contextPath}/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
<script
        src="${pageContext.request.contextPath}/assets/vendor/parsley/parsley.js"></script>
<script
        src="${pageContext.request.contextPath}/assets/libs/js/main-js.js"></script>
<script>
    $('#form').parsley();
</script>
<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function() {
        'use strict';
        window.addEventListener('load',
            function() {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document
                    .getElementsByClassName('needs-validation');
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms,
                    function(form) {
                        form.addEventListener('submit', function(
                            event) {
                            if (form.checkValidity() === false) {
                                event.preventDefault();
                                event.stopPropagation();
                            }
                            form.classList.add('was-validated');
                        }, false);
                    });
            }, false);
    })();
</script>

</body>

</html>