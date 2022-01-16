<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- tích hợp JSTL vào trong JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8"/>
    <meta name="description" content="Demo su dung bootstrap"/>
    <meta name="keyword"
          content="HTML, CSS, JavaScript, Java, Spring, MySql, Maven, Bootstrap, JQuery"/>
    <meta name="author" content="HieuNguyen">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/font/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/webstore.css">

    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">

    <title>Giới thiệu</title>
</head>

<body class="font">

<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="container">
    <div class="row">
        <div class="wrapper-tab col-md-12">
            <ul class="breadcrumb">
                <li class="home">
                    <a href="/">
                        <span><i class="fa fa-home"></i> Trang chủ</span>
                    </a>
                    <span><i class="fa">/&nbsp;</i></span>
                </li>
                <li>Giới thiệu</li>
            </ul>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-10 col-sm-12">
                    <p>Xin chào!!!Cảm ơn bạn đã đến với website Nhà sách Đình Hiếu của chúng tôi</p>
                    <p>Chúng tôi sẽ giới thiệu cho bạn những cuốn sách hay mới nhất và phù hợp với bạn</p>
                    <p>Chuyển phát nhanh qua đặt hàng online</p>
                    <p>Với qui mô vừa nhỏ nhưng chúng tôi luôn mong muốn sự ủng hô của quý khách</p>
                    <p>Với sự đóng góp của bạn nhà sách sẽ ngày càng phát triển mạnh mẽ và vững mạnh và để đáp ứng nhu
                        cầu đọc sách hiện đại hơn!</p>

                </div>

            </div>
        </div>
    </div>
</div>

<!--footer-->
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>

<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/js/webstore.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        $("#searchProduct").keyup(function () {
            var nameProductSearch = document.getElementById("searchProduct").value;
            if (nameProductSearch.length > 0) {
                //document.getElementById("resultLivingSearch").style.display = 'block';
                $('#resultLivingSearch').show();
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
                $('#resultLivingSearch').hide();
                //document.getElementById("resultLivingSearch").style.display = 'none';
            }

        });
    });
</script>
</body>

</html>