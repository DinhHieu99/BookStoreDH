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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pay.css">

    <!-- icon trang thẻ web-->
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">

    <title>Nhà sách Online giá tốt nhất</title>
    <style>
        .price {
            color: red;
            font-weight: bold;
        }

        table tr td .product-title {
            text-decoration: none;
            color: #777;
        }

        table tr td .product-title:hover {
            color: #2edc7c;
        }
    </style>
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
                <a href="#">
                    <span>Giỏ hàng</span>
                </a>
                <span><i class="fa">/&nbsp;</i></span>
            </li>
            <li>
                <a href="#">
                    <span>Thanh toán</span>
                </a>
                <span><i class="fa">/&nbsp;</i></span>
            </li>
            <li>
                <a href="#">
                    <span>Thành công</span>
                </a>

            </li>
        </ul>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h4>Chi tiết đơn hàng</h4>
                <table>
                    <tr class="row">
                        <th class="col-md-6 col-6">Sản phẩm</th>
                        <th class="right col-md-6 col-6">Tổng</th>
                    </tr>
                    <c:forEach var="cart" items="${order}">
                        <tr class="row">
                            <td class="col-md-6 col-6">
                                <a href="#" class="product-title">${cart.productName}</a> x${cart.quantity}
                            </td>
                            <td class="right price col-md-6 col-6"><fmt:formatNumber value="${cart.money}"/> đ</td>
                        </tr>
                    </c:forEach>

                    <tr class="row">
                        <td class="col-md-6 col-6">Phương thức thanh toán:</td>
                        <td class="right col-md-6 col-6">
                            <c:if test="${invoice.pay == false}">
                                Trả tiền khi nhận hàng
                            </c:if>
                            <c:if test="${invoice.pay == true}">
                                Thanh toán trước
                            </c:if>

                        </td>
                    </tr>
                    <tr class="row">
                        <td class="col-md-6 col-6">Tổng cộng:</td>
                        <td class="right price col-md-6 col-6"><fmt:formatNumber value="${invoice.totalMoney}"/> đ</td>
                    </tr>
                </table>
            </div>
            <div class="col-md-6 thank">
                <p>Cảm ơn bạn đã đặt hàng. Đơn hàng của bạn đã được nhận</p>
                <ul class="details">
                    <li>Mã đơn hàng: ${invoice.id}
                    </li>
                    <li>Tên người đặt: ${invoice.fullName}
                    </li>
                    <li>Số điện thoại: ${invoice.mobile}
                    </li>
                    <li>Địa chỉ chuyển hàng: ${invoice.deliveryAddress}
                    </li>
                    <li>Ngày đặt hàng: ${invoice.created}
                    </li>
                    <li>Tổng cộng: <span class="price"><fmt:formatNumber value="${invoice.totalMoney}"/> đ</span></li>
                    <li>Phương thức thanh toán:
                        <c:if test="${invoice.pay == false}">
                            Trả tiền khi nhận hàng
                        </c:if>
                        <c:if test="${invoice.pay == true}">
                            Thanh toán trước
                        </c:if>
                    </li>
                </ul>
            </div>
            <div class="col-md-12" id="continue" style="margin-top:10px;">
                <a href="/" class="btn btn-primary">Tiếp tục</a>
            </div>
        </div>

    </div>
</div>
<!--footer-->
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>

<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/webstore.js"></script>
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
</script>
</body>

</html>