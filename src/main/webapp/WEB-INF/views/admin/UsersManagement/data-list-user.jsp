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
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="${pageContext.request.contextPath}/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/css/style.css">
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
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">

    <title>Danh sách khách hàng</title>
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
                                    <li class="breadcrumb-item"><a href="javascript:void(0)"
                                                                   class="breadcrumb-link">Tài khoản</a></li>
                                    <li class="breadcrumb-item"><a href="javascript:void(0)"
                                                                   class="breadcrumb-link">Người dùng</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Bảng
                                        quản ký người dùng
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="influence-profile-content pills-regular">
                <ul class="nav nav-pills mb-3 nav-justified col-sm-8" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="pill" href="#pills-campaign"
                           role="tab" aria-selected="true">Bảng dữ liệu người dùng</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="pill" href="#pills-packages"
                           role="tab" aria-selected="false">Bảng dữ liệu người dùng đã bị
                            xóa</a>
                    </li>
                </ul>
                <!-- ============================================================== -->
                <!-- end pageheader -->
                <div class="tab-content" id="pills-tabContent">
                    <div class="row tab-pane show active" id="pills-campaign" role="tabpanel">
                        <!-- ============================================================== -->
                        <!-- basic table  -->
                        <!-- ============================================================== -->
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header">Bảng dữ liệu người dùng</h5>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered first">
                                            <thead>
                                            <tr>
                                                <th>Mã người dùng</th>
                                                <th>Tên người dùng</th>
                                                <th>Địa chỉ</th>
                                                <th>Điện thoại</th>
                                                <th>Email</th>
                                                <th>Trạng thái</th>
                                                <th>Cho phép đặt hàng</th>
                                                <th>Ngày lập tài khoản</th>
                                                <th>Hành động</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="users" items="${users}">
                                                <tr>
                                                    <td>${users.id}</td>
                                                    <td>${users.name}</td>
                                                    <td>${users.address}</td>
                                                    <td>${users.mobile}</td>
                                                    <td>${users.email}</td>
                                                    <td>
                                                        <c:if test="${users.status == 1}">
                                                            <b class="text-success">Online</b>
                                                        </c:if>
                                                        <c:if test="${users.status == 0}">
                                                            <b class="text-secondary">Offline</b>
                                                        </c:if>
                                                        <c:if test="${users.status == 3}">
                                                            <b class="text-danger">Delete</b>
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <c:if test="${users.user_status == true}">
                                                            <span class="badge-dot badge-success mr-1"></span>Cho phép đặt hàng
                                                        </c:if>
                                                        <c:if test="${users.user_status == false}">
                                                            <b class="text-danger">Không cho phép đặt hàng</b>
                                                        </c:if>
                                                    </td>
                                                    <td><fmt:formatDate value="${users.createDate}"
                                                                        pattern="hh:mm:ss dd/MM/yyyy"/></td>
                                                    <td>
                                                        <div class="btn-group ml-auto">
                                                            <a href="/admin/edit-users/${users.id}">
                                                                <button class="btn btn-sm btn-outline-success">
                                                                    <i class="fas fa-edit"></i>Sửa
                                                                </button>
                                                            </a>
                                                            <button class="btn btn-sm btn-outline-danger"
                                                                    style="margin-left: 5px"
                                                                    onclick="deleteClick(${users.id})">
                                                                <i class="far fa-trash-alt"></i> Xóa
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <th>Mã người dùng</th>
                                                <th>Tên người dùng</th>
                                                <th>Địa chỉ</th>
                                                <th>Điện thoại</th>
                                                <th>Email</th>
                                                <th>Trạng thái</th>
                                                <th>Cho phép đặt hàng</th>
                                                <th>Ngày lập tài khoản</th>
                                                <th>Hành động</th>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end basic table  -->
                        <!-- ============================================================== -->
                    </div>
                    <div class="row tab-pane" id="pills-packages" role="tabpanel">
                        <!-- ============================================================== -->
                        <!-- basic table  -->
                        <!-- ============================================================== -->
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header">Bảng dữ liệu người dùng</h5>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered first">
                                            <thead>
                                            <tr>
                                                <th>Mã người dùng</th>
                                                <th>Tên người dùng</th>
                                                <th>Địa chỉ</th>
                                                <th>Điện thoại</th>
                                                <th>Email</th>
                                                <th>Trạng thái</th>
                                                <th>Cho phép đặt hàng</th>
                                                <th>Ngày lập tài khoản</th>
                                                <th>Hành động</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="users" items="${users_delete}">
                                                <tr>
                                                    <td>${users.id}</td>
                                                    <td>${users.name}</td>
                                                    <td>${users.address}</td>
                                                    <td>${users.mobile}</td>
                                                    <td>${users.email}</td>
                                                    <td>
                                                        <c:if test="${users.status == 1}">
                                                            <b class="text-success">Online</b>
                                                        </c:if>
                                                        <c:if test="${users.status == 0}">
                                                            <b class="text-secondary">Offline</b>
                                                        </c:if>
                                                        <c:if test="${users.status == 3}">
                                                            <b class="text-danger">Delete</b>
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <c:if test="${users.user_status == true}">
                                                            <span class="badge-dot badge-success mr-1"></span>Cho phép đặt hàng
                                                        </c:if>
                                                        <c:if test="${users.user_status == false}">
                                                            <b class="text-danger">Không cho phép đặt hàng</b>
                                                        </c:if>
                                                    </td>
                                                    <td><fmt:formatDate value="${users.createDate}"
                                                                        pattern="hh:mm:ss dd/MM/yyyy"/></td>
                                                    <td>
                                                        <div class="btn-group ml-auto">

                                                            <button class="btn btn-sm btn-outline-success"
                                                                    onclick="status_recovery(${users.id})">
                                                                <i class="fas fa-edit"></i>Hồi phục
                                                            </button>


                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <th>Mã người dùng</th>
                                                <th>Tên người dùng</th>
                                                <th>Địa chỉ</th>
                                                <th>Điện thoại</th>
                                                <th>Email</th>
                                                <th>Trạng thái</th>
                                                <th>Cho phép đặt hàng</th>
                                                <th>Ngày lập tài khoản</th>
                                                <th>Hành động</th>
                                            </tr>
                                            </tfoot>
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

<script>
    function deleteClick(id) {
        var result = confirm("Bạn có chắc xóa tài khoản này không?");
        if (result == true) {
            $.ajax({
                url: "/admin/remove-users/" + id,
                type: "delete",
                success: function (response) {
                    location.reload();
                },
                error: function (xhr) {
                    alert('Không xóa được');
                }
            });
        }
    }

    function status_recovery(id) {
        var result = confirm("Bạn có chắc hồi phục lại tài khoản này không?");
        if (result == true) {
            $.ajax({
                url: "/admin/status_recovery/" + id,
                type: "put",
                success: function (response) {
                    location.reload();
                },
                error: function (xhr) {
                    alert('Không xóa được');
                }
            });
        }
    }
</script>
</body>
</html>