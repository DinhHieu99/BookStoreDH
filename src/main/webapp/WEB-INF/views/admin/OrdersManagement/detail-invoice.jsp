<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!-- tích hợp JSTL vào trong JSP -->
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">

    <title>Chi tiết hóa đơn</title>
</head>

<body>
<!-- ============================================================== -->
<!-- main wrapper -->
<!-- ============================================================== -->
<div class="dashboard-main-wrapper">
    <!-- ============================================================== -->
    <!-- navbar -->
    <!-- ============================================================== -->
    <%@ include file="/WEB-INF/views/admin/layout/header.jsp" %>
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
        <div class="dashboard-ecommerce">
            <div class="container-fluid dashboard-content ">
                <!-- ============================================================== -->
                <!-- pageheader  -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <h2 class="pageheader-title">Chi tiết hóa đơn</h2>

                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="javascript:void(0)" class="breadcrumb-link">Quản lý</a></li>
                                        <li class="breadcrumb-item"><a href="javascript:void(0)" class="breadcrumb-link">Bảng dữ liệu</a></li>
                                        <li class="breadcrumb-item"><a href="/admin/invoice" class="breadcrumb-link">Danh sách đơn hàng</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Chi tiết đơn hàng</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader  -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="offset-xl-2 col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <div class="card-header p-4">
                                <a class="pt-2 d-inline-block" href="/admin">
                                    <img alt="logo" src="${pageContext.request.contextPath}/img/logo.png" height="40px">
                                </a>

                                <div class="float-right"> <h3 class="mb-0">Hóa đơn #${invoice.id}</h3>
                                    Date: <fmt:formatDate value="${invoice.created}" pattern="dd/MM/yyyy"/></div>
                            </div>
                            <div class="card-body">
                                <div class="row mb-4">
                                    <div class="col-sm-6">
                                        <h5 class="mb-3">Tình trạng đơn hàng:</h5>
                                        <c:if test="${invoice.status == 0}">
                                            <button class="btn btn-outline-light dropdown-toggle text-danger" data-toggle="dropdown"
                                                    aria-haspopup="true" aria-expanded="false">
                                                Đang chờ xác nhận
                                            </button>
                                        </c:if>
                                        <c:if test="${invoice.status == 1}">
                                            <b class="btn btn-outline-light dropdown-toggle text-warning" data-toggle="dropdown"
                                               aria-haspopup="true" aria-expanded="false">
                                                Xác nhận đơn hàng
                                            </b>
                                        </c:if>
                                        <c:if test="${invoice.status == 2}">
                                            <b class="btn btn-outline-light dropdown-toggle text-primary" data-toggle="dropdown"
                                               aria-haspopup="true" aria-expanded="false">
                                                Đang chuyển hàng
                                            </b>
                                        </c:if>
                                        <c:if test="${invoice.status == 3}">
                                            <b class="btn btn-outline-light dropdown-toggle text-success" data-toggle="dropdown"
                                               aria-haspopup="true" aria-expanded="false">
                                                Đã chuyển hàng
                                            </b>
                                        </c:if>
                                        <c:if test="${invoice.status == 4}">
                                            <b class="btn btn-outline-light dropdown-toggle text-danger" data-toggle="dropdown"
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
                                    </div>
                                    <div class="col-sm-6">
                                        <h5 class="mb-3">Đến:</h5>
                                        <h3 class="text-dark mb-1">${invoice.fullName}</h3>
                                        <div>${invoice.message}</div>
                                        <div>${invoice.deliveryAddress}</div>
                                        <div>Email: ${invoice.email}</div>
                                        <div>Phone: ${invoice.mobile}</div>
                                    </div>
                                </div>
                                <div class="table-responsive-sm">
                                    <table class="table table-striped">
                                        <thead>
                                        <tr style="white-space: nowrap" class="text-center">
                                            <%--<th class="center">#</th>--%>
                                            <th class="center">Mã sản phẩm</th>
                                            <th>Hình ảnh</th>
                                            <th>Tên sản phẩm</th>
                                            <th class="right">Đơn giá</th>
                                            <th class="center">Số lượng</th>
                                                <th class="center">Số lượng tồn kho</th>
                                            <th class="right">Tổng</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="order" items="${order}">
                                        <tr>
                                            <%--<td class="text-center">1</td>--%>
                                            <td class="text-center">${order.products.id}</td>
                                            <td class="text-center">
                                                <img alt="image product" src="${pageContext.request.contextPath}/img/${order.products.imgProduct}"
                                                     height="70px">
                                            </td>
                                            <td class="text-left strong">${order.products.name}</td>

                                            <td class="text-right"><fmt:formatNumber value="${order.discount}"/>đ</td>
                                            <td class="text-center">${order.quantity}</td>
                                                <td class="text-center">${order.products.quantity}</td>
                                            <td class="text-right"><fmt:formatNumber value="${order.money}"/>đ</td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-sm-5">
                                    </div>
                                    <div class="col-lg-4 col-sm-5 ml-auto">
                                        <table class="table table-clear">
                                            <tbody>
                                            <tr>
                                                <td class="left">
                                                    <strong class="text-dark">Thanh toán:</strong>
                                                </td>
                                                <c:if test="${invoice.pay == false}">
                                                <td class="right text-danger">Chưa thanh toán</td>
                                                </c:if>
                                                <c:if test="${invoice.pay == true}">
                                                    <td class="right text-success">Đã thanh toán</td>
                                                </c:if>
                                            </tr>
                                            <tr>
                                                <td class="left">
                                                    <strong class="text-dark">Toàn bộ</strong>
                                                </td>
                                                <td class="right"><fmt:formatNumber value="${invoice.totalMoney}"/> đ</td>
                                            </tr>
                                            <%--<tr>
                                                <td class="left">
                                                    <strong class="text-dark">Discount (20%)</strong>
                                                </td>
                                                <td class="right">$5,761,00</td>
                                            </tr>
                                            <tr>
                                                <td class="left">
                                                    <strong class="text-dark">VAT (10%)</strong>
                                                </td>
                                                <td class="right">$2,304,00</td>
                                            </tr>
                                            <tr>
                                                <td class="left">
                                                    <strong class="text-dark">Total</strong>
                                                </td>
                                                <td class="right">
                                                    <strong class="text-dark">$20,744,00</strong>
                                                </td>
                                            </tr>--%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <%--<div class="card-footer bg-white">
                                <p class="mb-0">2983 Glenview Drive Corpus Christi, TX 78476</p>
                            </div>--%>
                        </div>
                    </div>
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
        <!-- ============================================================== -->
        <!-- end wrapper  -->
        <!-- ============================================================== -->
    </div>
</div>
<!-- ============================================================== -->
<!-- end main wrapper  -->
<!-- ============================================================== -->
<!-- Optional JavaScript -->
<!-- jquery 3.3.1 -->
<script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<!-- bootstap bundle js -->
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<!-- slimscroll js -->
<script src="${pageContext.request.contextPath}/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
<!-- main js -->
<script src="${pageContext.request.contextPath}/assets/libs/js/main-js.js"></script>
<script>
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
</script>
</body>

</html>