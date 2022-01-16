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
    <title>Thêm tin tức</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="${pageContext.request.contextPath}/assets/vendor/fonts/circular-std/style.css"
            rel="stylesheet">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/libs/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/summernote/css/summernote-bs4.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">
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
                    <h2 class="pageheader-title">Thêm tin tức</h2>

                    <div class="page-breadcrumb">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#"
                                                               class="breadcrumb-link">Bảng điều khiển</a></li>
                                <li class="breadcrumb-item"><a href="#"
                                                               class="breadcrumb-link">Các bảng quản lý</a></li>
                                <li class="breadcrumb-item"><a href="#"
                                                               class="breadcrumb-link">Quản lý tin tức</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Thêm
                                    tin tức
                                </li>
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
                    <h5 class="card-header">Thêm tin tức</h5>
                    <div class="card-body">
                        <form modelAttribute="post" method="POST" action="/admin/addPost"
                              enctype="multipart/form-data">
                            <hidden name="id"/>
                            <div class="form-group row">
                                <label class="col-12 col-sm-2 col-form-label text-sm-right">Tiêu đề</label>
                                <div class="col-12 col-sm-8 col-lg-10">
                                    <input name="title" type="text" required="" placeholder="" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-12 col-sm-2 col-form-label text-sm-right">Tệp/Ảnh</label>
                                <div class="col-12 col-sm-8 col-lg-4">
                                    <img src="" alt="" width="auto" height="300px" id="avatar" style="float: left;display: none;">
                                    <input type="file" required="" placeholder="" class="form-control" name="postImage" onchange="chooseFile(this)">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-12 col-sm-2 col-form-label text-sm-right">Mô tả</label>
                                <div class="col-12 col-sm-8 col-lg-10">
                                    <textarea name="description" required="" class="summernote form-control" rows="10"></textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-12 col-sm-2 col-form-label text-sm-right">Nội dung</label>
                                <div class="col-12 col-sm-8 col-lg-10">
                                    <textarea name="details" required="" class="summernote form-control" rows="30"></textarea>
                                </div>
                            </div>
                            <%
                                if (session.getAttribute("adminName") != null) {
                            %>
                            <p>
                            <div class="form-group row">
                                <label class="col-12 col-sm-2 col-form-label text-sm-right">Người
                                    đăng</label>
                                <div class="col-12 col-sm-8 col-lg-10">
                                    <hidden name="admin.id" value='<%=session.getAttribute("id")%>'/>
                                    <input name="admin.name" type="text" required="" value="<%=session.getAttribute("adminName")%>" placeholder=""
                                           class="form-control" disabled>

                                </div>
                            </div>
                            </p>
                            <%
                                }
                            %>
                            <div class="form-group row">
                                <label class="col-12 col-sm-2 col-form-label text-sm-right">Ngày đăng</label>
                                <div class="col-12 col-sm-8 col-lg-10">
                                    <c:set var="now" value="<%=new java.util.Date()%>"/>
                                    <input type="date" required="" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${now}" />"
                                           placeholder="" class="form-control" pattern="yyyy-MM-dd"
                                           disabled>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-12 col-sm-2 col-form-label text-sm-right">Trạng
                                    thái:</label>
                                <div class="col-12 col-sm-8 col-lg-10">
                                    <select name="status" class="form-control" id="input-select">
                                        <option value="true">Hiển thị</option>
                                        <option value="false">Không hiển thị</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row text-right">
                                <div class="col col-sm-10 col-lg-12 offset-sm-1 offset-lg-0">
                                    <button type="submit" class="btn btn-space btn-primary">Lưu</button>
                                    <a href="/admin/post">
                                        <input type="button" value="Hủy" class="btn btn-space btn-secondary"></input></a>
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
    <%@ include file="/WEB-INF/views/admin/layout/footer.jsp" %>
    <!-- ============================================================== -->
    <!-- end footer -->
    <!-- ============================================================== -->
</div>
</div>
<!-- ============================================================== -->
<!-- end main wrapper -->
<!-- ============================================================== -->
<!-- Optional JavaScript -->
<script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/parsley/parsley.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/js/main-js.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/summernote/js/summernote-bs4.js"></script>
<script>
    $('#form').parsley();
    $(document).ready(function() {
        $('.summernote').summernote({
            height: 250

        });
    });
</script>
<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
        'use strict';
        window.addEventListener('load',
            function () {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document
                    .getElementsByClassName('needs-validation');
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms,
                    function (form) {
                        form.addEventListener('submit', function (
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
    function chooseFile(fileInput){
        $('#avatar').show();
        if(fileInput.files && fileInput.files[0]){
            var reader = new FileReader();

            reader.onload = function(e){
                $("#avatar").attr('src', e.target.result);
            }
            reader.readAsDataURL(fileInput.files[0]);
        }
    }
</script>
</body>

</html>