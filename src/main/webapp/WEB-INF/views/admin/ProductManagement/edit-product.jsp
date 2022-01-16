<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="java.sql.Date" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!-- sử dụng taglibs của spring để bind-data từ end-point trả về. -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- tích hợp JSTL vào trong JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">


<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Sửa thông tin sản phẩm</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="${pageContext.request.contextPath}/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/css/style.css">
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
                    <h2 class="pageheader-title">Sửa thông tin sản phẩm</h2>

                    <div class="page-breadcrumb">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#"
                                                               class="breadcrumb-link">Bảng điều khiển</a></li>
                                <li class="breadcrumb-item"><a href="#"
                                                               class="breadcrumb-link">Giao diện</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Sửa
                                    thông tin sản phẩm
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
                    <h5 class="card-header">Sửa thông tin sản phẩm</h5>
                    <div class="card-body">
                        <form method="post" action="/admin/edit-product"
                              modelAttribute="product" enctype="multipart/form-data">
                            <input type="hidden" name="id" value="${products.id}"/>
                            <div class="form-group row">
                                <label class="col-12 col-sm-2 col-form-label text-sm-right">Tên
                                    sản phẩm:</label>
                                <div class="col-12 col-sm-8 col-lg-10">
                                    <input name="name" type="text" required="" placeholder=""
                                           class="form-control" value="${products.name}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-12 col-sm-2 col-form-label text-sm-right">Tệp/Ảnh đại diện:</label>
                                <div class="col-12 col-sm-8 col-lg-10">
                                    <img src="${pageContext.request.contextPath}/img/${products.imgProduct}"  id="avatar"
                                         width="auto" height="250px">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-12 col-sm-2 col-form-label text-sm-right">Thay tệp/Ảnh</label>
                                <div class="col-12 col-sm-8 col-lg-5">
                                    <input type="file" class="form-control" name="image" value="${products.imgProduct}" onchange="chooseFile(this);">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-12 col-sm-2 col-form-label text-sm-right">Thể
                                    loại</label>
                                <div class="col-12 col-sm-8 col-lg-10">
                                    <select class="form-control"
                                            name="categories.id">
                                        <c:forEach var="category" items="${category}">
                                            <c:if test="${products.idCategory == category.id}">
                                                <option value="${category.id}" selected>${category.name}</option>
                                            </c:if>
                                            <option value="${category.id}">${category.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-12 col-sm-2 col-form-label text-sm-right">Mô tả</label>
                                <div class="col-12 col-sm-8 col-lg-10">
                                    <textarea name="describe" required=""
                                              class="form-control summernote">${products.describe}</textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-12 col-sm-3 col-form-label text-sm-right">Tên tác giả:</label>
                                <div class="col-12 col-sm-8 col-lg-5">
                                    <input name="author" type="text" placeholder=""
                                           class="form-control" value="${products.author}"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-12 col-sm-3 col-form-label text-sm-right">Số lượng:</label>
                                <div class="col-12 col-sm-8 col-lg-5">
                                    <input name="quantity" required="" value="${products.quantity}" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-12 col-sm-3 col-form-label text-sm-right">Đơn giá:</label>
                                <div class="col-12 col-sm-8 col-lg-5">
                                    <input name="price" required="" value="${products.price}"
                                           class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-12 col-sm-3 col-form-label text-sm-right">Chiết khấu phần trăm
                                    (%):</label>
                                <div class="col-12 col-sm-8 col-lg-5">
                                    <input name="percentDiscount" required=""
                                           value="${products.percentDiscount}" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-12 col-sm-3 col-form-label text-sm-right">Giảm giá:</label>
                                <div class="col-12 col-sm-8 col-lg-5">
                                    <input name="discount" value="${products.discount}" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-12 col-sm-3 col-form-label text-sm-right">Trạng thái:</label>
                                <div class="col-12 col-sm-8 col-lg-5">
                                    <select name="status" class="form-control">
                                        <option value="true">Hiển thị</option>
                                        <option value="false">Không hiển thị</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-12 col-sm-3 col-form-label text-sm-right">Nhà
                                    cung cấp:</label>
                                <div class="col-12 col-sm-8 col-lg-5">
                                    <select name="nhaCC.id" class="form-control">
                                        <c:forEach var="ncc" items="${ncc}">
                                            <c:if test="${products.supplierName.equals(ncc.name)}">
                                                <option value="${ncc.id}"selected>${ncc.name}</option>
                                            </c:if>
                                            <option value="${ncc.id}">${ncc.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row text-right">
                                <div class="col col-sm-10 col-lg-12 offset-sm-1 offset-lg-0">
                                    <button type="submit" class="btn btn-space btn-primary">Lưu</button>
                                    <a href="/admin/dataTables">
                                        <input type="button" value="Hủy" class="btn btn-space btn-secondary"></input>
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
    $(document).ready(function () {
        $('.summernote').summernote({
            height: 400

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