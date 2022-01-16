<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- Tich hop jstl vao jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Danh sách sản phẩm</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
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
                        <h2 class="pageheader-title">Bảng sản phẩm</h2>

                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="javascript:void(0)" class="breadcrumb-link">Quản lý</a>
                                    </li>
                                    <li class="breadcrumb-item">
                                        <a href="javascript:void(0)" class="breadcrumb-link">Bảng dữ liệu</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Bảng sản phẩm
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
                        <h5 class="card-header">Bảng sản phẩm</h5>

                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered first">
                                    <thead class="text-center">
                                    <tr>
                                        <th>Mã sản phẩm</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Ảnh</th>
                                        <th>Tên tác giả</th>
<%--                                        <th>Số lượng tồn</th>--%>
                                        <th>Đơn giá</th>
                                        <th>Chiêt khấu phần trắm</th>
                                        <th>Giảm giá</th>
                                        <th>Trang thái</th>
                                        <th>Lượt xem</th>
                                        <th>Ngày nhập</th>
                                        <th>Danh mục</th>
                                        <%--<th>Nhà cung cấp</th>--%>
                                        <th>Hành động</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="products" items="${products}">
                                        <tr>
                                            <td class="text-center">${products.id}</td>
                                            <td><a href="/admin/product-${products.id}" class="text-decoration-none">
                                                    ${products.name}</a></td>

                                            <td><a href="/admin/product-${products.id}" class="text-decoration-none">
                                                <img src="${pageContext.request.contextPath}/img/${products.imgProduct}"
                                                    alt=" lỗi ảnh" style="width: 100px; hight: 75px;"></a></td>
                                            <td>${products.author}</td>
<%--                                            <td>${products.quantity}</td>--%>
                                            <td><fmt:formatNumber value="${products.price}"/>đ</td>
                                            <td>${products.percentDiscount}%</td>
                                            <td><fmt:formatNumber value="${products.discount}"/>đ</td>
                                            <td>
                                                <c:if test="${products.status == true}">
                                                    <b class="text-success">Hiển thị</b>
                                                </c:if>
                                                <c:if test="${products.status == false}">
                                                    <b class="text-secondary">Không hiển thị</b>
                                                </c:if>
                                            </td>
                                            <td>${products.view}</td>
                                            <td><fmt:formatDate value="${products.createDate}" pattern="dd/MM/yyyy"/></td>
                                            <td>${products.categoryName}</td>
                                            <%--<td><c:out value="${products.supplierName}"></c:out></td>--%>
                                            <td>
                                                <div class="btn-group ml-auto" style="display: block">
                                                    <a href="/admin/edit-product/${products.id}">
                                                        <button class="btn btn-sm btn-outline-success">
                                                            <i class="fas fa-edit"></i>Sửa
                                                        </button>
                                                    </a>
                                                    <button class="btn btn-sm btn-outline-danger" style="margin-top: 5px"
                                                            onclick="deleteProduct(${products.id}, '${products.name}');">
                                                        <i class="far fa-trash-alt" ></i> Xóa
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot class="text-center">
                                    <tr>
                                        <th>Mã sản phẩm</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Ảnh</th>
                                        <th>Tên tác giả</th>
                                        <%--                                        <th>Số lượng tồn</th>--%>
                                        <th>Đơn giá</th>
                                        <th>Chiêt khấu phần trắm</th>
                                        <th>Giảm giá</th>
                                        <th>Trang thái</th>
                                        <th>Lượt xem</th>
                                        <th>Ngày nhập</th>
                                        <th>Danh mục</th>
                                        <%--<th>Nhà cung cấp</th>--%>
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
    <%@ include file="/WEB-INF/views/admin/layout/footer.jsp" %>
</div>
<script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/multi-select/js/jquery.multi-select.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/js/main-js.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/datatables/js/data-table.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
<script src="https://cdn.datatables.net/rowgroup/1.0.4/js/dataTables.rowGroup.min.js"></script>
<script src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
<script src="https://cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>

<script>
    function deleteProduct(id,name) {
        var result = window.confirm("Bạn có muốn xóa sản phẩm "+ name +" này không? ");
        if (result == true) {
            $.ajax({
                url: "/admin/removeProduct/" + id,
                type: "DELETE",
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