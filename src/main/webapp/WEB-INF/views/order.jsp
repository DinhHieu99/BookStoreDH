<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- tích hợp JSTL vào trong JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8"/>
    <meta name="description" content="Demo su dung bootstrap"/>
    <meta name="keyword" content="HTML, CSS, JavaScript, Java, Spring, MySql, Maven, Bootstrap, JQuery"/>
    <meta name="author" content="HieuNguyen">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/font/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/webstore.css">

    <%--<link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">--%>
    <link href="${pageContext.request.contextPath}/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/css/style.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/vendor/datatables/css/dataTables.bootstrap4.css">

    <%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/order.css">--%>

    <!-- icon trang thẻ web-->
    <link rel="shortcut icon" type="image/png" href="./img/logo.png">

    <title>Đơn hàng</title>
</head>

<body class="font">
<!-- header -->
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<!-- header -->
<div class="container">
    <div class="wrapper-tab">
        <ul class="breadcrumb">
            <li class="home">
                <a href="#">
                    <span><i class="fa fa-home"></i> Trang chủ</span>
                </a>
                <span><i class="fa">/&nbsp;</i></span>
            </li>
            <li>
                <a href="javascript:void(0)">
                    <span>Đơn đặt hàng</span>
                </a>
            </li>
        </ul>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="card">
                    <h5 class="card-header">Bảng đơn đặt hàng</h5>

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered first">
                                <thead class="text-center">
                                <tr>
                                    <th>Mã đơn hàng</th>
                                    <th>Ngày</th>
                                    <th>Tình trạng</th>
                                    <th>Tổng tiền</th>
                                    <th>Thanh toán</th>
                                    <th>Các thao tác</th>
                                </tr>
                                </thead>
                                <tbody class="text-center">
                                <c:forEach var="order" items="${order}">
                                    <tr>
                                        <td>
                                            <a href="/view-ordered/${order.id }" class="product-title">#${order.id}</a>
                                        </td>
                                        <td><fmt:formatDate value="${order.created}" pattern="dd/MM/yyyy"/></td>
                                        <td>
                                            <c:if test="${order.status == 0 || order.status == 4 }">
                                                Đang chờ được sử lý...
                                            </c:if>
                                            <c:if test="${order.status == 1 }">
                                                Đã xác nhận đơn hàng
                                            </c:if>
                                            <c:if test="${order.status == 2 }">
                                                Đang chuyển hàng
                                            </c:if>
                                            <c:if test="${order.status == 3 }">
                                                Đã chuyển hàng
                                            </c:if>
                                        </td>
                                        <td class="text-danger font-bold"><fmt:formatNumber
                                                value="${order.totalMoney}"/>đ
                                        </td>
                                        <td >
                                            <c:if test="${order.pay == false }">
                                               <b class="text-danger font-bold">Chưa thanh toán</b>
                                            </c:if>
                                            <c:if test="${order.pay == true }">
                                                <b class="text-success font-bold">Đã thanh toán</b>
                                            </c:if>
                                        </td>
                                        <td>
                                            <a class="btn btn-outline-success font-bold"
                                               href="/view-ordered/${order.id}"
                                               style="margin-right: 0">Xem</a>
                                            <c:if test="${order.status == 5 }">
                                            <button class="btn btn-outline-danger font-bold" href="javascript:void(0)"
                                               title="Xóa"
                                               style="margin-left: 0"
                                               onclick="deleteOrder(${order.id});"><i class="far fa-trash-alt"></i> Xóa</button>
                                            </c:if>
                                            <button class="btn btn-outline-danger font-bold" href="javascript:void(0)"
                                               title="Hủy đơn hàng"
                                               style="margin-left: 0"
                                               onclick="cancelOrder(${order.id});"><i class="fa fa-trash-alt"></i> Hủy
                                                đơn hàng</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot class="text-center">
                                <tr>
                                    <th>Mã đơn hàng</th>
                                    <th>Ngày</th>
                                    <th>Tình trạng</th>
                                    <th>Tổng tiền</th>
                                    <th>Thanh toán</th>
                                    <th>Các thao tác</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>
<!-- footer -->
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
<!-- footer -->

<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/js/webstore.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/datatables/js/data-table.js"></script>

<script>
    $(document).ready(function () {
        $("#searchProduct").keyup(function () {
            var nameProductSearch = document.getElementById("searchProduct").value;
            if (nameProductSearch.length > 0) {
                document.getElementById("resultLivingSearch").style.display = 'block';
                $.ajax({

                    url: "${pageContext.request.contextPath}/living-search",
                    type: "get",
                    data: {
                        search_query: nameProductSearch
                    },
                    success: function (response) {
                        $("#resultLivingSearch").html(response);
                    },
                    error: function (xhr) {
                        alert('Error')
                    }
                });
            } else {
                document.getElementById("resultLivingSearch").style.display = 'none';
            }
        });
    });

    function deleteOrder(id) {
        var result = confirm('Bạn có muốn xóa đơn hàng #' + id + ' này không?');
        if (result == true) {
            $.ajax({
                url: "/remove-ordered/" + id,
                type: "delete",
                success: function (jsonResult) { // được gửi khi web-service trả về dữ liệu.
                    location.reload();
                }
            });
        }
    }
    function cancelOrder(id) {
        var result = confirm('Bạn có muốn xóa đơn hàng #' + id + ' này không?');
        if (result == true) {
            $.ajax({
                url: "/cancel-ordered/" + id,
                type: "delete",
                success: function (jsonResult) { // được gửi khi web-service trả về dữ liệu.
                    location.reload();
                }
            });
        }
    }
</script>
</body>

</html>