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
    <title>Đơn hàng</title>
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
                        <h2 class="pageheader-title">Bảng đơn hàng</h2>

                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="javascript:void(0)" class="breadcrumb-link">Quản lý</a>
                                    </li>
                                    <li class="breadcrumb-item">
                                        <a href="javascript:void(0)" class="breadcrumb-link">Bảng dữ liệu</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Bảng đơn hàng
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <style>
                table tr th, td {
                    text-align: center;
                }
            </style>
            <c:if test="${not empty message }">
                <%--<script>
                    alert('${messageAlert}')
                </script>--%>
                <div class="col-sm-12 alert alert-${alert}">
                    <strong>${messageAlert}</strong>
                </div>
            </c:if>
            <!-- ============================================================== -->
            <!-- end pageheader -->
            <div class="row influence-profile-content pills-regular">
                <ul class="nav nav-pills mb-3 nav-justified col-sm-12" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="pill" href="#pills-campaign"
                           role="tab" aria-selected="true">Bảng đơn hàng đang chờ xác nhận</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " data-toggle="pill" href="#pills-packages"
                           role="tab" aria-selected="false">Bảng dữ liệu đơn hàng</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " data-toggle="pill" href="#pills-packages2"
                           role="tab" aria-selected="false">Bảng đơn hàng đang tạm hết hàng</a>
                    </li>
                </ul>
                <!-- ============================================================== -->
                <!-- basic table  -->
                <!-- ============================================================== -->
                <div class="tab-content" id="pills-tabContent">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 tab-pane show active" role="tabpanel"
                         id="pills-campaign">
                        <div class="card">
                            <h5 class="card-header">Bảng đơn hàng đang chờ xác nhận</h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered first">
                                        <thead>
                                        <tr>
                                            <th>Mã hóa đơn</th>
                                            <th>Tổng tiền</th>
                                            <th>Người đặt hàng</th>
                                            <th>Số điện thoại</th>
                                            <%--                                        <th>Email</th>--%>
                                            <th>Địa chỉ giao hàng</th>
                                            <th>Xác nhận đơn hàng</th>
                                            <th>Ngày đặt hàng</th>
                                            <th>Lời nhắn</th>
                                            <th>Hành động</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="invoice" items="${invoice}">
                                            <tr>
                                                <td>${invoice.id}</td>
                                                <td><fmt:formatNumber value="${invoice.totalMoney}"/>đ</td>
                                                <td>${invoice.customerName}</td>
                                                <td>${invoice.mobile}</td>
                                                    <%--<td>${invoice.email}</td>--%>
                                                <td style="white-space: nowrap;">${invoice.address}</td>
                                                <td style="white-space: nowrap;">
                                                    <b class="text-danger">
                                                        Đang chờ xác nhận
                                                    </b>
                                                </td>
                                                <td>
                                                    <fmt:formatDate value="${invoice.date}"
                                                                    pattern="hh:mm:ss dd/MM/yyyy"/>
                                                </td>
                                                <td>${invoice.message}</td>
                                                <td>
                                                    <div class="btn-group ml-auto" style="display: inline-block;">
                                                        <a href="/admin/detail-invoice/${invoice.id}">
                                                            <button class="btn btn-sm btn-outline-success"
                                                                    title="Xem đơn hàng"
                                                                    style="margin-top: 5px">
                                                                Xem chi tiết đơn hàng
                                                            </button>
                                                        </a>
                                                        <a href="/admin/remove-invoice/${invoice.id}">
                                                            <button class="btn btn-sm btn-outline-danger"
                                                                    title="Xóa đơn hàng"
                                                                    style="margin-top: 5px"
                                                                    onclick="return window.confirm('Bạn có chắc chắn muốn hủy đơn đặt hàng này không?');">
                                                                <i class="far fa-trash-alt"></i> Hủy đơn hàng
                                                            </button>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                            <%--<tr>
                                                <td id="resultOrderProduct${invoice.id}" colspan="9"
                                                    style="padding: 0">

                                                </td>
                                            </tr>--%>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>Mã hóa đơn</th>
                                            <th>Tổng tiền</th>
                                            <th>Người đặt hàng</th>
                                            <th>Số điện thoại</th>
                                            <%--                                        <th>Email</th>--%>
                                            <th>Địa chỉ giao hàng</th>
                                            <th>Xác nhận đơn hàng</th>
                                            <th>Ngày đặt hàng</th>
                                            <th>Lời nhắn</th>
                                            <th>Hành động</th>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 tab-pane" role="tabpanel"
                         id="pills-packages">
                        <div class="card">
                            <h5 class="card-header">Bảng đơn hàng </h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered first">
                                        <thead>
                                        <tr>
                                            <th>Mã hóa đơn</th>
                                            <th>Tổng tiền</th>
                                            <th>Người đặt hàng</th>
                                            <th>Số điện thoại</th>
                                            <%--                                        <th>Email</th>--%>
                                            <th>Địa chỉ giao hàng</th>
                                            <th>Xác nhận đơn hàng</th>
                                            <th>Ngày đặt hàng</th>
                                            <th>Lời nhắn</th>
                                            <th>Hành động</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="invoice" items="${invoice2}">
                                            <tr>
                                                <td>${invoice.id}</td>
                                                <td><fmt:formatNumber value="${invoice.totalMoney}"/>đ</td>
                                                <td>${invoice.customerName}</td>
                                                <td>${invoice.mobile}</td>
                                                    <%--                                            <td>${invoice.email}</td>--%>
                                                <td style="white-space: nowrap;">${invoice.address}</td>
                                                <td style="white-space: nowrap;">
                                                    <c:if test="${invoice.status == 0}">
                                                        <button class="btn btn-outline-light dropdown-toggle text-danger"
                                                                data-toggle="dropdown"
                                                                aria-haspopup="true" aria-expanded="false">
                                                            Đang chờ xác nhận
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${invoice.status == 1}">
                                                        <b class="btn btn-outline-light dropdown-toggle text-warning"
                                                           data-toggle="dropdown"
                                                           aria-haspopup="true" aria-expanded="false">
                                                            Xác nhận đơn hàng
                                                        </b>
                                                    </c:if>
                                                    <c:if test="${invoice.status == 2}">
                                                        <b class="btn btn-outline-light dropdown-toggle text-primary"
                                                           data-toggle="dropdown"
                                                           aria-haspopup="true" aria-expanded="false">
                                                            Đang chuyển hàng
                                                        </b>
                                                    </c:if>
                                                    <c:if test="${invoice.status == 3}">
                                                        <b class="btn btn-outline-light dropdown-toggle text-success"
                                                           data-toggle="dropdown"
                                                           aria-haspopup="true" aria-expanded="false">
                                                            Đã chuyển hàng
                                                        </b>
                                                    </c:if>
                                                    <c:if test="${invoice.status == 4}">
                                                        <b class="btn btn-outline-light dropdown-toggle text-danger"
                                                           data-toggle="dropdown"
                                                           aria-haspopup="true" aria-expanded="false">
                                                            Đang tạm hết hàng
                                                        </b>
                                                    </c:if>
                                                    <c:if test="${invoice.status == 5}">
                                                        <b class="btn btn-outline-light dropdown-toggle text-danger"
                                                           data-toggle="dropdown"
                                                           aria-haspopup="true" aria-expanded="false">
                                                            Hủy đơn hàng
                                                        </b>
                                                    </c:if>
                                                    <div class="dropdown-menu btn-light">
                                                        <b class="dropdown-item btn-outline-primary" onclick="updateStatus(0, ${invoice.id})">
                                                            Đang chờ xác nhận</b>
                                                        <b class="dropdown-item btn-outline-primary" onclick="updateStatus(1, ${invoice.id})">
                                                            Xác nhận đơn hàng</b>
                                                        <b class="dropdown-item btn-outline-primary" onclick="updateStatus(2, ${invoice.id})">
                                                            Đang chuyển hàng</b>
                                                        <b class="dropdown-item btn-outline-primary" onclick="updateStatus(3, ${invoice.id})">
                                                            Xác nhận đã chuyển hàng</b>
                                                        <b class="dropdown-item btn-outline-primary" onclick="updateStatus(4, ${invoice.id})">
                                                            Đang tạm hết hàng</b>
                                                        <b class="dropdown-item btn-outline-primary" onclick="updateStatus(5, ${invoice.id})">
                                                            Hủy đơn hàng</b>
                                                    </div>
                                                </td>
                                                <td>
                                                    <fmt:formatDate value="${invoice.date}"
                                                                    pattern="hh:mm:ss dd/MM/yyyy"/>
                                                </td>
                                                <td>${invoice.message}</td>
                                                <td>
                                                    <div class="btn-group ml-auto" style="display: inline-block;">
                                                            <%--<c:if test="${invoice.status == 0 }">
                                                                <a href="/admin/invoice/${invoice.id}-1">
                                                                    <button class="btn btn-sm btn-success"
                                                                            title="Xác nhận đơn hàng"
                                                                            onclick="return window.confirm('Xác nhận đơn hàng #${invoice.id} ');"
                                                                    >Xác nhận đơn hàng
                                                                    </button>
                                                                </a>

                                                            </c:if>
                                                            <c:if test="${invoice.status == 1 }">
                                                                <a href="/admin/invoice/${invoice.id}-2">
                                                                    <button class="btn btn-sm btn-warning"
                                                                            title="Xác nhận đang chuyển đơn hàng #${invoice.id}"
                                                                            onclick="return window.confirm('Xác nhận đang chuyển đơn hàng #${invoice.id} ');"
                                                                    >Xác nhận<br> đang chuyển...
                                                                    </button>
                                                                </a>
                                                            </c:if>
                                                            <c:if test="${invoice.status == 2 }">
                                                                <a href="/admin/invoice/${invoice.id}-3">
                                                                    <button class="btn btn-sm btn-success"
                                                                            title="Xác nhận đơn hàng đã chuyển đến #${invoice.id}"
                                                                            onclick="return window.confirm('Xác nhận đơn hàng đã chuyển đến #${invoice.id} ');"
                                                                    >Xác nhận đã<br> chuyển đển
                                                                    </button>
                                                                </a>
                                                            </c:if>--%>

                                                        <a href="/admin/detail-invoice/${invoice.id}">
                                                            <button class="btn btn-sm btn-light" title="Xem đơn hàng"
                                                                    style="margin-top: 5px">
                                                                Xem chi tiết đơn hàng
                                                            </button>
                                                        </a>
                                                        <%--<a href="/admin/remove-invoice/${invoice.id}">
                                                            <button class="btn btn-sm btn-outline-danger"
                                                                    title="Xóa đơn hàng"
                                                                    style="margin-top: 5px"
                                                                    onclick="return window.confirm('Bạn có chắc chắn muốn xoá đơn đặt hàng này không?');">
                                                                <i class="far fa-trash-alt"></i> Xóa
                                                            </button>
                                                        </a>--%>
                                                        <button class="btn btn-sm btn-outline-light button-show-${invoice.id}"
                                                                style="margin-top: 5px"
                                                                onclick="showOrder('${invoice.id}')">
                                                            <i class="fas fa-eye">Xem đơn hàng</i>
                                                        </button>
                                                        <button class="btn btn-sm btn-outline-light button-hidden-${invoice.id}"
                                                                style="margin-top: 5px;display: none"
                                                                onclick="hiddenOrderProduct('${invoice.id}')">
                                                            <i class="fas fa-eye-slash"> Ẩn đơn hàng</i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td id="resultOrderProduct${invoice.id}" colspan="9"
                                                    style="padding: 0">

                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>Mã hóa đơn</th>
                                            <th>Tổng tiền</th>
                                            <th>Người đặt hàng</th>
                                            <th>Số điện thoại</th>
                                            <%--<th>Email</th>--%>
                                            <th>Địa chỉ giao hàng</th>
                                            <th>Xác nhận đơn hàng</th>
                                            <th>Ngày đặt hàng</th>
                                            <th>Lời nhắn</th>
                                            <th>Hành động</th>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- =================================================================== -->
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 tab-pane" role="tabpanel"
                         id="pills-packages2">
                        <div class="card">
                            <h5 class="card-header">Bảng đơn hàng </h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered first">
                                        <thead>
                                        <tr>
                                            <th>Mã hóa đơn</th>
                                            <th>Tổng tiền</th>
                                            <th>Người đặt hàng</th>
                                            <th>Số điện thoại</th>
                                            <%--                                        <th>Email</th>--%>
                                            <th>Địa chỉ giao hàng</th>
                                            <th>Xác nhận đơn hàng</th>
                                            <th>Ngày đặt hàng</th>
                                            <th>Lời nhắn</th>
                                            <th>Hành động</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="invoice" items="${invoice4}">
                                            <tr>
                                                <td>${invoice.id}</td>
                                                <td><fmt:formatNumber value="${invoice.totalMoney}"/>đ</td>
                                                <td>${invoice.customerName}</td>
                                                <td>${invoice.mobile}</td>
                                                    <%--                                            <td>${invoice.email}</td>--%>
                                                <td style="white-space: nowrap;">${invoice.address}</td>
                                                <td style="white-space: nowrap;">
                                                    <c:if test="${invoice.status == 0}">
                                                        <button class="btn btn-outline-light dropdown-toggle text-danger"
                                                                data-toggle="dropdown"
                                                                aria-haspopup="true" aria-expanded="false">
                                                            Đang chờ xác nhận
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${invoice.status == 1}">
                                                        <b class="btn btn-outline-light dropdown-toggle text-warning"
                                                           data-toggle="dropdown"
                                                           aria-haspopup="true" aria-expanded="false">
                                                            Xác nhận đơn hàng
                                                        </b>
                                                    </c:if>
                                                    <c:if test="${invoice.status == 2}">
                                                        <b class="btn btn-outline-light dropdown-toggle text-primary"
                                                           data-toggle="dropdown"
                                                           aria-haspopup="true" aria-expanded="false">
                                                            Đang chuyển hàng
                                                        </b>
                                                    </c:if>
                                                    <c:if test="${invoice.status == 3}">
                                                        <b class="btn btn-outline-light dropdown-toggle text-success"
                                                           data-toggle="dropdown"
                                                           aria-haspopup="true" aria-expanded="false">
                                                            Đã chuyển hàng
                                                        </b>
                                                    </c:if>
                                                    <c:if test="${invoice.status == 4}">
                                                        <b class="btn btn-outline-light dropdown-toggle text-danger"
                                                           data-toggle="dropdown"
                                                           aria-haspopup="true" aria-expanded="false">
                                                            Đang tạm hết hàng
                                                        </b>
                                                    </c:if>
                                                    <div class="dropdown-menu btn-light">
                                                        <b class="dropdown-item btn-outline-primary" onclick="updateStatus(0, ${invoice.id})">
                                                            Đang chờ xác nhận</b>
                                                        <b class="dropdown-item btn-outline-primary" onclick="updateStatus(1, ${invoice.id})">
                                                            Xác nhận đơn hàng</b>
                                                        <b class="dropdown-item btn-outline-primary" onclick="updateStatus(2, ${invoice.id})">
                                                            Đang chuyển hàng</b>
                                                        <b class="dropdown-item btn-outline-primary" onclick="updateStatus(3, ${invoice.id})">
                                                            Xác nhận đã chuyển hàng</b>
                                                        <b class="dropdown-item btn-outline-primary" onclick="updateStatus(4, ${invoice.id})">
                                                            Đang tạm hết hàng</b>
                                                    </div>
                                                </td>
                                                <td>
                                                    <fmt:formatDate value="${invoice.date}"
                                                                    pattern="hh:mm:ss dd/MM/yyyy"/>
                                                </td>
                                                <td>${invoice.message}</td>
                                                <td>
                                                    <div class="btn-group ml-auto" style="display: inline-block;">
                                                            <%--<c:if test="${invoice.status == 0 }">
                                                                <a href="/admin/invoice/${invoice.id}-1">
                                                                    <button class="btn btn-sm btn-success"
                                                                            title="Xác nhận đơn hàng"
                                                                            onclick="return window.confirm('Xác nhận đơn hàng #${invoice.id} ');"
                                                                    >Xác nhận đơn hàng
                                                                    </button>
                                                                </a>

                                                            </c:if>
                                                            <c:if test="${invoice.status == 1 }">
                                                                <a href="/admin/invoice/${invoice.id}-2">
                                                                    <button class="btn btn-sm btn-warning"
                                                                            title="Xác nhận đang chuyển đơn hàng #${invoice.id}"
                                                                            onclick="return window.confirm('Xác nhận đang chuyển đơn hàng #${invoice.id} ');"
                                                                    >Xác nhận<br> đang chuyển...
                                                                    </button>
                                                                </a>
                                                            </c:if>
                                                            <c:if test="${invoice.status == 2 }">
                                                                <a href="/admin/invoice/${invoice.id}-3">
                                                                    <button class="btn btn-sm btn-success"
                                                                            title="Xác nhận đơn hàng đã chuyển đến #${invoice.id}"
                                                                            onclick="return window.confirm('Xác nhận đơn hàng đã chuyển đến #${invoice.id} ');"
                                                                    >Xác nhận đã<br> chuyển đển
                                                                    </button>
                                                                </a>
                                                            </c:if>--%>

                                                        <a href="/admin/detail-invoice/${invoice.id}">
                                                            <button class="btn btn-sm btn-light" title="Xem đơn hàng"
                                                                    style="margin-top: 5px">
                                                                Xem chi tiết đơn hàng
                                                            </button>
                                                        </a>

                                                        <a href="/admin/remove-invoice/${invoice.id}">

                                                            <button class="btn btn-sm btn-outline-danger"
                                                                    title="Xóa đơn hàng"
                                                                    style="margin-top: 5px"
                                                                    onclick="return window.confirm('Bạn có chắc chắn muốn xóa đơn đặt hàng này không?');">
                                                                <i class="far fa-trash-alt"></i> Xóa
                                                            </button>
                                                        </a>

                                                        <button class="btn btn-sm btn-outline-light button-show-${invoice.id}"
                                                                style="margin-top: 5px"
                                                                onclick="showOrder('${invoice.id}')">
                                                            <i class="fas fa-eye">Xem đơn hàng</i>
                                                        </button>
                                                        <button class="btn btn-sm btn-outline-light button-hidden-${invoice.id}"
                                                                style="margin-top: 5px;display: none"
                                                                onclick="hiddenOrderProduct('${invoice.id}')">
                                                            <i class="fas fa-eye-slash"> Ẩn đơn hàng</i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td id="resultOrderProduct${invoice.id}" colspan="9"
                                                    style="padding: 0">

                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>Mã hóa đơn</th>
                                            <th>Tổng tiền</th>
                                            <th>Người đặt hàng</th>
                                            <th>Số điện thoại</th>
                                            <%--<th>Email</th>--%>
                                            <th>Địa chỉ giao hàng</th>
                                            <th>Xác nhận đơn hàng</th>
                                            <th>Ngày đặt hàng</th>
                                            <th>Lời nhắn</th>
                                            <th>Hành động</th>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
    function showOrder(idInvoice) {
        $(document).ready(function () {
            var idOrder = idInvoice;

            $.ajax({
                url: "${pageContext.request.contextPath}/admin/order_product",
                type: "get",
                data: {
                    idInvoice: idOrder
                },
                success: function (response) {
                    $("#resultOrderProduct" + idInvoice).html(response);
                    $(".button-show-" + idInvoice).hide();
                    $(".button-hidden-" + idInvoice).show();
                    $("#resultOrderProduct" + idInvoice).show();
                },
                error: function (xhr) {
                    alert('Error')
                }
            });
        });
    }
    function updateStatus(status, id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/invoice/" +id +"-" +status,
            type: "POST",
            success: function (response) {
                location.reload();
            },
            error: function (xhr) {
                alert('Error')
            }
        });
    }
    function hiddenOrderProduct(idInvoice) {
        $(".button-show-" + idInvoice).show();
        $(".button-hidden-" + idInvoice).hide();
        $("#resultOrderProduct" + idInvoice).hide();
    }
</script>
</body>
</html>