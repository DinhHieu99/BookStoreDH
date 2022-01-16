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
        </ul>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-12" data-bind="visible: showQRForm" style="font-family: Arial, Helvetica, sans-serif">
                <div class="form-group text-center px-4 pt-4">
                    <p id="qrcode"></p>
                    <p class="mb-1 status" data-bind="html: status"><b class="text-success">Đang chờ thanh toán...</b></p>
                    <p class="mb-1">Thời gian quét mã QR để thanh toán <br> còn <strong class="text-zlp font-italic" id="timer">900000</strong></p>
                </div>
                <div class="d-flex justify-content-center">
                    <div>
                        <p class="mb-4" style="font-size:22px">
                            Thanh toán với <img src="${pageContext.request.contextPath}/img/logo-zalopay.svg" width="100" class="ml-1 mb-1">bằng mã QR
                        </p>
                        <p class="mb-0"><b>Hướng dẫn thanh toán</b></p>
                        <ul style="padding-left: 1.8rem">
                            <li><u>Bước 1</u>: <strong>Mở</strong> ứng dụng <strong>ZaloPay</strong></li>
                            <li><u>Bước 2</u>: Chọn <strong>"Thanh Toán"</strong><img src="${pageContext.request.contextPath}/img/qr-scan-zlp.png" class="ml-1"> và quét mã QR</li>
                            <li><u>Bước 3</u>: <strong>Xác nhận thanh toán</strong> ở ứng dụng</li>
                        </ul>
                    </div>
                </div>
            </div>
            <input type="text" value="${apptransid}" id ="apptransid">
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/lrsjng.jquery-qrcode/0.14.0/jquery-qrcode.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lrsjng.jquery-qrcode/0.14.0/jquery-qrcode.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/countdown/2.6.0/countdown.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/countdown/2.6.0/countdown.js"></script>
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
       /* var settimmer = 0;
        $(function() {
            window.setInterval(function() {
                var timeCounter = $("#timer").html();
                var updateTime = eval(timeCounter) - eval(100);
                var minutes = Math.floor((updateTime % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((updateTime % (1000 * 60)) / 1000);
                //document.getElementById("timer").innerHTML = minutes + ":" + seconds ;
                $("#timer").html(minutes + ":" + seconds);
                callback();
                if (updateTime == 0) {
                    window.location.href = "/";
                }
            }, 1000);
        });*/
    });
    // đếm thời gian
    function startTimer(duration, display) {
        var timer = duration, minutes, seconds;
        setInterval(function () {
            minutes = parseInt(timer / 60, 10);
            seconds = parseInt(timer % 60, 10);

            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;

            display.textContent = minutes + ":" + seconds;

            if (--timer < 0) {
                timer = duration;
            }
        }, 1000);
    }

    window.onload = function () {
        var fiveMinutes = 60 * 15 -1,
            display = document.querySelector('#timer');
        startTimer(fiveMinutes, display);
    };
    // end countdown time
    function callback(){
        var data = {
            "apptransid": $('#apptransid').val()
        };
        $.ajax({
            url: "/callback",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function (response) {
                //alert("Thanh toán thành công")

            }
        });
    }
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

</script>
</body>

</html>