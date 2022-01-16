<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- tích hợp JSTL vào trong JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="description" content="Demo su dung bootstrap" />
    <meta name="keyword" content="HTML, CSS, JavaScript, Java, Spring, MySql, Maven, Bootstrap, JQuery" />
    <meta name="author" content="HieuNguyen">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/font/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/webstore.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/detail-order.css">

    <!-- icon trang thẻ web-->
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">

    <title>Chi tiết đơn hàng</title>

    <style>
        .price{
            color: red;
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
                    <a href="/ordered">
                        <span>Đơn hàng</span>
                    </a>
                    <span><i class="fa">/&nbsp;</i></span>
                </li>
                <li>
                    <a href="javasrcipt:void(0)">
                        <span>Chi tiết đơn hàng</span>
                    </a>

                </li>
            </ul>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <c:forEach var="cart" items="${cart}" begin="0" end="0">
                        <h6>
                            Đơn hàng #${cart.order.id} đã được đặt lúc
                            <fmt:formatDate value="${cart.order.created}"
                                            pattern="dd/MM/yyyy" />
                            và hiện tại là
                            <c:if test="${cart.order.status == 0 }">
                                đang chờ được sử lý
                            </c:if>
                            <c:if test="${cart.order.status == 1 }">
                                đã xác nhận đơn hàng
                            </c:if>
                            <c:if test="${cart.order.status == 2 }">
                                đang chuyển hàng
                            </c:if>
                            <c:if test="${cart.order.status == 3 }">
                                đã chuyển hàng
                            </c:if>

                        </h6>
                        <h4>Chi tiết đơn hàng</h4>
                    </c:forEach>
                    <table>
                        <tr class="row">
                            <th class="col-md-6 col-6">Sản phẩm</th>
                            <th class="right col-md-6 col-6">Tổng</th>
                        </tr>
                        <c:forEach var="cart" items="${cart}">
                            <tr class="row">
                                <td class="col-md-6 col-6">
                                    <a href="/product/${cart.products.id}-${cart.products.name}"
                                        class="product-title">
                                        ${cart.products.name}
                                    </a>
                                    x${cart.quantity}
                                </td>
                                <td class="right price col-md-6 col-6"><fmt:formatNumber value="${cart.discount}"/> đ</td>
                            </tr>
                        </c:forEach>
                        <c:forEach var="cart" items="${cart}" begin="0" end="0">
                        <tr class="row">
                            <td class="col-md-6 col-6">Phương thức thanh toán:</td>
                            <td class="right col-md-6 col-6">
                                <c:if test="${cart.order.pay == false}">
                                    Trả tiền sau khi nhận hàng
                                </c:if>
                                <c:if test="${cart.order.pay == true}">
                                    Chuyển khoản
                                </c:if>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="col-md-6 col-6">Trạng thái:</td>
                            <td class="right col-md-6 col-6">
                                <c:if test="${cart.order.status == 0 }">
                                    đang chờ được sử lý
                                </c:if>
                                <c:if test="${cart.order.status == 1 }">
                                    đã xác nhận đơn hàng
                                </c:if>
                                <c:if test="${cart.order.status == 2 }">
                                    đang chuyển hàng
                                </c:if>
                                <c:if test="${cart.order.status == 3 }">
                                    đã chuyển hàng
                                </c:if>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="col-md-6 col-6">Tổng cộng:</td>
                            <td class="right price col-md-6 col-6"><fmt:formatNumber value="${cart.order.totalMoney}"/> đ</td>
                        </tr>
                    </table>
                </div>
                <div class="col-md-5 thank">
                    <p>Địa chỉ nhận hàng</p>
                    <ul class="details">
                        <li>Tên người đặt: ${cart.order.fullName}</li>
                        <li>Số điện thoại: ${cart.order.mobile}</li>
                        <li>Địa chỉ chuyển hàng: ${cart.order.deliveryAddress}</li>
                        <li>Ngày đặt hàng: <fmt:formatDate value="${cart.order.created}" pattern="dd/MM/yyyy" /></li>
                        <li>Lời nhắn: ${order.message}</li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="col-md-12" id="continue">
                    <a class="btn btn-primary" href="/">Tiếp tục</a>
                </div>
            </div>
        </div>
    </div>
    <!--footer-->
    <%@ include file="/WEB-INF/views/layout/footer.jsp" %>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/page.js"></script>
    <script src="${pageContext.request.contextPath}/js/webstore.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#searchProduct").keyup(function () {
                var nameProductSearch = document.getElementById("searchProduct").value;
                if(nameProductSearch.length > 0){
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
                }else{
                    document.getElementById("resultLivingSearch").style.display = 'none';
                }

            });
        });
    </script>
</body>

</html>