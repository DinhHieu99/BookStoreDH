<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- Tich hop jstl vao jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Danh sách nhà cung cấp</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="${pageContext.request.contextPath}/assets/vendor/fonts/circular-std/style.css"
            rel="stylesheet">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/libs/css/style.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/vendor/datatables/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/vendor/datatables/css/buttons.bootstrap4.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/vendor/datatables/css/select.bootstrap4.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/vendor/datatables/css/fixedHeader.bootstrap4.css">
    <link rel="shortcut icon" type="image/png"
          href="${pageContext.request.contextPath}/img/logo.png">
    <style type="text/css">
        .table-responsive table tr th {
            vertical-align: middle;
        }
    </style>
</head>

<body>
<div class="dashboard-main-wrapper">
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
                        <h2 class="pageheader-title">Bảng dữ liệu</h2>

                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"
                                                                   class="breadcrumb-link">Bảng điều khiển</a></li>
                                    <li class="breadcrumb-item"><a href="#"
                                                                   class="breadcrumb-link">Các bảng dữ liệu</a></li>
                                    <li class="breadcrumb-item"><a href="#"
                                                                   class="breadcrumb-link">Bảng dữ liệu</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Nhà
                                        cung cấp
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ============================================================== -->
            <!-- end pageheader -->
            <div class="row">
                <!-- ============================================================== -->
                <!-- basic table  -->
                <!-- ============================================================== -->
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="card">
                        <h5 class="card-header">Bảng dữ liệu nhà cung cấp</h5>
                        <a href="/admin/add-supplier">
                            <button class="btn btn-sl btn-outline-light "
                                    style="width: 200px; margin-bottom: 1rem">Thêm nhà cung cấp
                            </button>
                        </a>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered first">
                                    <thead>
                                    <tr>
                                        <th>Mã nhà cung cấp</th>
                                        <th>Tên nhà cung cấp</th>
                                        <th>Địa chỉ</th>
                                        <th>Điện thoại</th>
                                        <th>Email</th>
                                        <td>Trạng thái</td>
                                        <th>Hành động</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="nhacc" items="${nhacc}">
                                        <tr>
                                            <td>${nhacc.id}</td>
                                            <td>${nhacc.name}</td>
                                            <td>${nhacc.address}</td>
                                            <td>${nhacc.mobile}</td>
                                            <td>${nhacc.email}</td>
                                            <td><c:if test="${nhacc.status == true}">
                                                <b class="text-success">Hiển thị</b>
                                            </c:if> <c:if test="${nhacc.status == false}">
                                                <b class="text-danger">Không
                                                    hiển thị</b>
                                            </c:if></td>
                                            <td>
                                                <div class="btn-group ml-auto">
                                                    <a href="/admin/edit-supplier/${nhacc.id}">
                                                        <button class="btn btn-sm btn-outline-success">
                                                            <i class="fas fa-edit"></i> Sửa
                                                        </button>
                                                    </a>
                                                    <a href="/admin/remove-supplier/${nhacc.id}" style="margin-left: 5px;">
                                                    <button class="btn btn-sm btn-outline-danger"
                                                            onclick="return window.confirm('Bạn có chắc chắn muốn xoá nhà cung cấp ${nhacc.name} này không?');">
                                                        <i class="far fa-trash-alt"></i> Xóa
                                                    </button>
                                                </a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end basic table  -->
                <!-- ============================================================== -->
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/admin/layout/footer.jsp" %>
</div>
<script
        src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<script
        src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script
        src="${pageContext.request.contextPath}/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
<script
        src="${pageContext.request.contextPath}/assets/vendor/multi-select/js/jquery.multi-select.js"></script>
<script
        src="${pageContext.request.contextPath}/assets/libs/js/main-js.js"></script>
<script
        src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script
        src="${pageContext.request.contextPath}/assets/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
<script
        src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
<script
        src="${pageContext.request.contextPath}/assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
<script
        src="${pageContext.request.contextPath}/assets/vendor/datatables/js/data-table.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script
        src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
<script
        src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
<script
        src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
<script
        src="https://cdn.datatables.net/rowgroup/1.0.4/js/dataTables.rowGroup.min.js"></script>
<script
        src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
<script
        src="https://cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>
</body>
</html>