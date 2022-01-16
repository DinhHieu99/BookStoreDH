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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/blue.css">
    <!-- icon trang thẻ web-->
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">
    <!-- icon trang thẻ web-->

    <title>Thanh toán</title>
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
                    <span>Thanh toán</span>
                </a>

            </li>

        </ul>
    </div>

    <div class="container">

        <div calss="row">
            <div class="col-md-8" style="float: left;">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h6 class="panel-title">
                            <i class="fa fa-info-circle" aria-hidden="true"></i> Địa chỉ nhận hàng
                        </h6>
                    </div>
                    <form action="/pay/addPay" method="post" modelAttribute="invoice">
                        <div class="panel-body">
                            <!-- Apply for VN -->
                            <input name="user.id" id="input-userid" type="hidden" value="${user.id}">
                            <div class="form-group required" style="margin: 10px 5px;">
                                <div class="row">
                                    <label class="control-label col-md-2">Tên đầy đủ</label>
                                    <div class="col-sm-10">
                                        <input type="text" id="input-firstname" name="fullName"
                                               value="${user.name}" placeholder="Nhập họ tên"
                                               class="form-control" required=""/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group required">
                                        <div class="row">
                                            <label class="control-label col-sm-4">Email</label>
                                            <div class="col-sm-8">
                                                <input type="email" id="input-email" name="email"
                                                       value="${user.email}" placeholder="Nhập email"
                                                       class="form-control" required=""/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group required">
                                        <div class="row">
                                            <label class="control-label col-sm-4" for="input-telephone">Điện
                                                thoại</label>
                                            <div class="col-sm-8">
                                                <input type="text" name="mobile"
                                                       id="input-telephone" value="${user.mobile}"
                                                       placeholder="Nhập số điện thoại" class="form-control"
                                                       required=""/>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <%--<div class="col-sm-6">
                                    <div class="form-group required">
                                        <div class="row">
                                            <label class="control-label col-sm-4" for="input-telephone">Địa
                                                chỉ</label>
                                            <div class="col-sm-8">
                                                <input type="text"
                                                       value="${user.address}" placeholder="Nhập địa chỉ"
                                                       class="form-control" required=""/>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group required">
                                        <div class="row">
                                            <label class="control-label col-sm-4" >Địa
                                                chỉ cần chuyển</label>
                                            <div class="col-sm-8">
                                                <input type="text" name=""
                                                       value="${user.address}" placeholder="Nhập địa chỉ"
                                                       class="form-control" required=""/>
                                            </div>
                                        </div>

                                    </div>
                                </div>--%>
                                <div class="col-sm-12">
                                    <div class="form-group required">
                                        <div class="row">
                                            <label class="control-label col-md-2">Địa chỉ cần chuyển</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="deliveryAddress" value="" id="input-address"
                                                       placeholder="Nhập chi tiết địa chỉ" class="form-control"
                                                       required=""/>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2" id="label-zone">Lời
                                    nhắn</label>
                                <div class="col-sm-10">
                                    <textarea name="message" id="input-comment" rows="3" class="form-control"
                                              placeholder="Nếu có lời nhắn thì ghi"></textarea>
                                </div>
                            </div>

                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <div class="adr-oms checkbox">
                                    <input type="checkbox" name="same_info_as_buyer_toggle" id="is-delivery-address"
                                           checked/>
                                    <label for="is-delivery-address"><strong>Địa chỉ nhận hàng và thanh toán giống
                                        nhau</strong></label>
                                </div>
                            </div>
                        </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h6 class="panel-title">
                            <i class="fa fa-credit-card" aria-hidden="true"></i> Phương thức thanh toán
                        </h6>
                    </div>
                    <div class="panel-body">
                        <div class="container group">
                            <div class="row">
                                <input type="radio" id="payment-method-bank_transfer" class="col-md-1"
                                       name="pay" value="true"/>
                                <label for="payment-method-bank_transfer" class="col-md-11">
                                    <div class="row">
                                        <div class="thumbnail col-md-2">
                                            <img alt="Chuyển khoản" src="./img/bank_transfer.png"/>
                                        </div>
                                        <div class="description col-md-10">
                                            <div class="title">Chuyển khoản</div>
                                            <div class="subtitle">Sử dụng ZaloPay để để
                                                tiến hành chuyển khoản cho chúng tôi <%--thẻ ATM hoặc dịch vụ Internet Banking để
                                                tiến hành chuyển khoản cho chúng tôi--%>
                                            </div>
                                            <div class="tkz-selection-info"></div>
                                        </div>
                                    </div>
                                </label>
                            </div>
                        </div>
                        <div class="container group">
                            <div class="row">
                                <input type="radio" id="payment-method-cod" class="col-md-1" name="pay" value="false"
                                       checked/>
                                <label for="payment-method-cod" class="col-md-11">
                                    <div class="row">
                                        <div class="thumbnail col-md-2">
                                            <img alt="Thu tiền tại nhà (COD)" src="./img/cod.png"/>
                                        </div>
                                        <div class="description col-md-10">
                                            <div class="title">Thu tiền tại nhà (COD)</div>
                                            <div class="subtitle">Khách hàng thanh toán bằng tiền mặt cho nhân viên
                                                giao hàng khi sản phẩm được chuyển tới địa chỉ nhận hàng
                                            </div>
                                            <div class="tkz-selection-info"></div>
                                        </div>
                                    </div>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4" style="float: left">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i> Đơn hàng</strong> (${SoLuongSanPham}
                            sản phẩm)
                        </h3>
                    </div>
                    <div class="panel-body" style="max-height:400px; overflow-x:hidden; overflow-y:auto;">
                        <table class="adr-oms table table_order_items">
                            <tbody>
                            <c:forEach var="cartProducts" items="${sessionScope.cart}">
                                <tr class="group-type-1 item-child-0">
                                    <td class="row">
                                        <div class="col-md-3">
                                            <div class="thumbnail">
                                                <a target="_blank" rel="noopener" href="#"
                                                   title="${cartProducts.name}"> <img
                                                        src="${pageContext.request.contextPath}/img/${cartProducts.img}"
                                                        alt="${cartProducts.name}" width="84"/>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="table_order_items-cell-title">
                                                <div class="table_order_items_product_name">
                                                    <a target="_blank" rel="noopener"
                                                       href="/product/${cartProducts.id}-${cartProducts.name}"
                                                       title="${cartProducts.name}"> <span
                                                            class="title">${cartProducts.name}</span></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 ">
                                            <div class="tt-price"><fmt:formatNumber value="${cartProducts.discount}"/>
                                                đ
                                            </div>
                                            <div class="quantity text-right">x${cartProducts.quantity}</div>
                                            <div class="tt-price"><fmt:formatNumber value="${cartProducts.money}"/> đ
                                            </div>
                                            <input type="hidden" name="money" value="${cartProducts.money}">
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <i class="fa fa-truck" aria-hidden="true"></i> Vận chuyển
                        </h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <div class="col-sm-12">
                                <span id="ajax-load-shipping-method">
                                    <div><strong>Phí giao hàng tận nơi</strong></div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="shipping_method" checked/>
                                            Phí giao hàng tận nơi - 0đ </label>
                                    </div>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default" id="ATM" style="display:none;">
                    <p class="panel-heading">Vui lòng chọn hình thức thanh toán:</p>
                    <div class="mb-1">
                        <label><input type="radio" name="iCheck" class="iradio_flat-blue" checked> Ví <img
                                src="img/logo-zalopay.svg" alt=""></label>
                    </div>
                    <div class="mb-1">
                        <label><input type="radio" name="iCheck" class="iradio_flat-blue"> Visa, Mastercard, JCB <span
                                class="txtGray">(qua cổng ZaloPay)</span></label>
                    </div>
                    <div class="mb-1">
                        <label><input type="radio" name="iCheck" class="iradio_flat-blue"> Thẻ ATM <span
                                class="txtGray">(qua cổng ZaloPay)</span></label>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-body">
                        <table class="table">
                            <tbody>
                            <tr>
                                <td class="text-left">Thành tiền</td>
                                <td class="text-right">
                                    <strong class="" style="font-size: 13px;"><fmt:formatNumber
                                            value="${ThanhTien}"/>đ</strong>
                                    <input type="hidden" name="money" value="${ThanhTien}"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-left">Phí giao hàng tận nơi</td>
                                <td class="text-right"><strong class="">0đ</strong></td>
                            </tr>
                            <tr>
                                <td class="text-left">Tổng số</td>
                                <td class="text-right"><strong class="text-danger"><fmt:formatNumber
                                        value="${ThanhTien}"/>đ</strong>
                                    <input type="hidden" name="totalMoney" id="input-total-money" value="${ThanhTien}"/>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="text-center ">
                    <a class="pull-left" href="/carts" title="Quay lại giỏ hàng">
                        <i class="fa fa-mail-reply-all" aria-hidden="true"></i> Quay lại giỏ hàng
                    </a>
                    <button class="btn btn-primary pull-right" id="payOnline" type="submit"
                            data-toggle="modal" data-target="#exampleModalCenter" style="display: none">
                        Đặt hàng <i class="fa fa-angle-right"></i>
                    </button>
                    <button class="btn btn-primary pull-right" type="submit" id="payOff">
                        Đặt hàng <i class="fa fa-angle-right"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document" style="font-family: Arial, Helvetica, sans-serif">
        <div class="modal-content">
            <div class="modal-body">
                <div class="form-group text-center px-4 pt-4">
                    <div id="qrcode"></div>
                    <p class="mb-1 status" data-bind="html: status"><b class="text-success">Đang chờ thanh toán...</b>
                    </p>
                    <p class="mb-1">Thời gian quét mã QR để thanh toán <br> còn <strong class="text-zlp font-italic"
                                                                                        id="timer">10:26</strong></p>
                </div>
                <div class="d-flex justify-content-center">
                    <div>
                        <p class="mb-4" style="font-size:20px">
                            Thanh toán với <img src="${pageContext.request.contextPath}/img/logo-zalopay.svg" width="80"
                                                alt=""> bằng mã QR
                        </p>
                        <p class="mb-0"><b>Hướng dẫn thanh toán</b></p>
                        <ul style="padding-left: 1.8rem">
                            <li><u>Bước 1</u>: <strong>Mở</strong> ứng dụng <strong>ZaloPay</strong></li>
                            <li><u>Bước 2</u>: Chọn <strong>"Thanh Toán"</strong><img
                                    src="${pageContext.request.contextPath}/img/qr-scan-zlp.png" class="ml-1"> và quét
                                mã QR
                            </li>
                            <li><u>Bước 3</u>: <strong>Xác nhận thanh toán</strong> ở ứng dụng</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>--%>
</form>
<!--footer-->
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
<!-- footer -->

<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/js/webstore.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/qrcode.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lrsjng.jquery-qrcode/0.14.0/jquery-qrcode.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lrsjng.jquery-qrcode/0.14.0/jquery-qrcode.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/countdown/2.6.0/countdown.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/countdown/2.6.0/countdown.js"></script>
<script>
    $(document).ready(function () {

        $("#payOnline").click(function (e) {
            var data = {
                "fullname": $("#input-firstname").val(),
                "email": $("#input-email").val(),
                "mobile": $('#input-telephone').val(),
                "comment": $('#input-comment').val(),
                "address": $('#input-address').val(),
                "userid": $('#input-userid').val(),
                "totalMoney": $('#input-total-money').val()
            };
            $.ajax({
                url: "/createOrder",
                type: "get",
                //contentType: "application/json", //dữ liệu được gửi lên web-service có dạng là json.
                //data: JSON.stringify(data), // object json -> string json
                //dataType: "json", // dữ liệu từ web-service trả về là json.
                success: function (jsonResult) { // được gửi khi web-service trả về dữ liệu.
                    //alert(jsonResult)
                    //window.location.href = "/createOder";
                },
                error: function (xhr) {
                    alert('Error')
                }
            });

        });
        $("#payment-method-bank_transfer").click(function () {
            /!*document.getElementById('ATM').style.display = 'block';*!/
            //$('#ATM').show();
            $('#payOnline').show();
            $('#payOff').hide();
        });
        $("#payment-method-cod").click(function () {
            /!*document.getElementById('ATM').style.display = 'none';*!/
            //$('#ATM').hide();
            $('#payOnline').hide();
            $('#payOff').show();
        });

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
<script type="text/javascript">
    function createQR(){
        var options = {
            // render method: 'canvas', 'image' or 'div'
            render: 'canvas',

            // version range somewhere in 1 .. 40
            minVersion: 1,
            maxVersion: 40,

            // error correction level: 'L', 'M', 'Q' or 'H'
            ecLevel: 'L',

            // offset in pixel if drawn onto existing canvas
            left: 0,
            top: 0,

            // size in pixel
            size: 200,

            // code color or image element
            fill: '#000',

            // background color or image element, null for transparent background
            background: null,

            // content
            text: "${orderURLZalo}",

            // corner radius relative to module width: 0.0 .. 0.5
            radius: 0,

            // quiet zone in modules
            quiet: 0,

            // modes
            // 0: normal
            // 1: label strip
            // 2: label box
            // 3: image strip
            // 4: image box
            mode: 0,

            mSize: 0.1,
            mPosX: 0.5,
            mPosY: 0.5,

            label: 'no label',
            fontname: 'sans',
            fontcolor: '#000',

            image: null
        }
        $('#qrcode').qrcode(options);
    }

</script>
</body>

</html>