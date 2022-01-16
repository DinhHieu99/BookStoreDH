<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- Tich hop jstl vao jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8"/>
    <meta name="description" content="Demo su dung bootstrap"/>
    <meta name="keyword" content="HTML, CSS, JavaScript, Java, Spring, MySql, Maven, Bootstrap, JQuery"/>
    <meta name="author" content="HieuNguyen">
    <%--<meta name="og:image:type" content="image/png">--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/font/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/webstore.css">

    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">

    <title>Sản phẩm</title>
</head>

<body class="font">
<!-- header -->
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<!-- header -->
<div class="container">
    <div class="row">
        <div class="wrapper-tab col-md-12">
            <ul class="breadcrumb">
                <li class="home">
                    <a href="#">
                        <span><i class="fa fa-home"></i> Trang chủ</span>
                    </a>
                    <span><i class="fa">/&nbsp;</i></span>
                </li>
                <li>${category_title.name}</li>
            </ul>
        </div>
        <div class="content-left col-md-3">
            <div class="title">
                <span>LỌC TRUYỆN</span>
            </div>
            <div class="content-left-menu">
                <form name="filter_form">
                    <nav class="nav-category navbar-toggleable-md">
                        <ul class="nav navbar-pills">
                            <li class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#" data-toggle="collapse"
                                   aria-expanded="false"
                                   data-target="#supplier" aria-controls="supplier">
                                    <strong>Thương hiệu</strong>
                                </a>
                                <ul class="navbar-nav submenu" id="supplier">
                                    <c:forEach var="supplier" items="${supplier}">
                                        <c:if test="${supplier.name.equals('Khác...') == false}">
                                            <li class="nav-item">
                                                <a class="nav-link">
                                                    <input type="checkbox" name="manufacturer[]"
                                                           id="group${supplier.id}" value="${supplier.id}"/>
                                                    <label class="d-inline" style="height: 20px;" for="group${supplier.id}" title="${supplier.name}">${supplier.name}</label>
                                                </a>
                                            </li>
                                        </c:if>

                                    </c:forEach>
                                </ul>
                            </li>
                        </ul>
                    </nav>

                    <!-- <div class="panel-footer text-right hidden">
                        <button type="button" id="button-filter" class="btn btn-primary"></button>
                    </div>-->
                </form>
            </div>
        </div>
        <div class="content-right col-md-9">
            <div class="title">
                <span><strong>${category_title.name}</strong></span>
            </div>
            <div class="sort">
                <h5>Sắp xếp theo: </h5>
                <ul class="nav">
                    <li class="nav-item">
                        <a class="nav-link"
                           href="/category/${category_sort}-${category_name}?page=1&name=nameProduct&sort=DESC">
                            <i class="fa fa-dot-circle"></i>Mặc định</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"
                           href="/category/${category_sort}-${category_name}?page=1&name=nameProduct&sort=ASC">
                            <i class="fa fa-dot-circle"></i>Tên (A - Z)</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"
                           href="/category/${category_sort}-${category_name}?page=1&name=nameProduct&sort=DESC">
                            <i class="fa fa-dot-circle"></i>Tên (Z - A)</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"
                           href="/category/${category_sort}-${category_name}?page=1&name=discount&sort=ASC">
                            <i class="fa fa-dot-circle"></i>Giá (Thấp &gt; Cao)</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"
                           href="/category/${category_sort}-${category_name}?page=1&name=discount&sort=DESC">
                            <i class="fa-dot-circle"></i>Giá (Cao &gt; Thấp)</a>
                    </li>
                </ul>
            </div>

            <div class="sort-cate-right-mobile">
                <div id="sort-by">
                    <label class="left">Sắp xếp theo: </label>
                    <select class="mdb-select md-form" id="selectSort">
                        <option value="javascript:void(0)" disabled selected>Chọn kiểu sắp xếp</option>
                        <option value="/category/${category_sort}-${category_name}?page=1&name=nameProduct&sort=DESC">
                            Mặc định
                        </option>
                        <option value="/category/${category_sort}-${category_name}?page=1&name=nameProduct&sort=ASC">Tên
                            (A - Z)
                        </option>
                        <option value="/category/${category_sort}-${category_name}?page=1&name=nameProduct&sort=DESC">
                            Tên (Z - A)
                        </option>
                        <option value="/category/${category_sort}-${category_name}?page=1&name=discount&sort=ASC">Giá
                            (Thấp &gt; Cao)
                        </option>
                        <option value="/category/${category_sort}-${category_name}?page=1&name=discount&sort=DESC">Giá
                            (Cao &gt; Thấp)
                        </option>
                    </select>
                </div>
            </div>
            <div class="container">
                <div class="row" id="product_items2" style="display: none;">
                </div>
                <div class="row" id="product_items">
                    <c:forEach var="product" items="${products}">
                        <%--<div class="items col-md-3 col-sm-6 col-6">
                            <div class="card-body">
                                <div class="card-img">
                                    <span class="product-item__sale">
                                        -${product.percentDiscount}% </span>
                                    <a href="/product/${product.id}-${product.urlName}">
                                        <img class="card-img-top"
                                             src="${pageContext.request.contextPath}/img/${product.imgProduct}"
                                             alt="${product.name}" />
                                    </a>
                                </div>
                                <div class="card-title center ">
                                    <a title="Bí mật cookies " href="/product" class="text-dark card-title center ">
                                            ${product.name} </a>
                                    <div class="card-text ">
                                        <span class="discount"><fmt:formatNumber value="${product.discount}"/>đ</span>
                                        <strike class="price"><fmt:formatNumber value="${product.price}"/>đ</strike>
                                    </div>
                                </div>
                                <div class="box-hover card-title center ">
                                    &lt;%&ndash;<a href="/addCart-${product.id}">&ndash;%&gt;
                                        <button class="btn btn-buy btn-cart btn-gray " title="Mua ngay"
                                                onclick="addCart(${product.id})"><i
                                                class="fa fa-shopping-cart "></i>
                                        </button>
                                   &lt;%&ndash; </a>&ndash;%&gt;
                                    <a href="/product/${product.id}-${product.urlName}" class="quick-view " title="Xem ">
                                        <i class="fa fa-search "></i>
                                    </a>
                                </div>
                            </div>
                        </div>--%>
                        <div class="items col-md-3 col-sm-6 col-6">
                            <div class="card-body">
                                <div class="card-img">
                                    <span class="product-item__sale">
                                        -${product.percentDiscount}% </span>
                                    <a href="/product/${product.id}/${product.name}">
                                        <img class="card-img-top"
                                             src="${pageContext.request.contextPath}/img/${product.imgProduct}"
                                             alt="${product.name}"/>
                                    </a>
                                </div>
                                <div class="card-title center ">
                                    <a title="Bí mật cookies " href="/product"
                                       class="text-dark card-title center text-truncate d-block" style="height: auto">
                                            ${product.name}</a>
                                    <div class="card-text ">
                                        <span class="discount"><fmt:formatNumber value="${product.discount}"/>đ</span>
                                        <strike class="price"><fmt:formatNumber value="${product.price}"/>đ</strike>
                                    </div>
                                </div>
                                <div class="box-hover card-title center ">
                                        <%--&lt;%&ndash;<a href="/addCart-${product.id}">&ndash;%&gt;--%>
                                    <button class="btn btn-buy btn-cart btn-gray " title="Mua ngay"
                                            onclick="addCart(${product.id})"><i
                                            class="fa fa-shopping-cart "></i>
                                    </button>
                                        <%--  &lt;%&ndash; </a>&ndash;%&gt;--%>
                                    <a href="/product/${product.id}/${product.name}" class="quick-view " title="Xem ">
                                        <i class="fa fa-search "></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="row">
                <div class="page-left col-md-6 col-12">
                    <%--                    <strong>Row per page:</strong>
                                        <select id="row-page">
                                            <option value="4" selected>4</option>
                                            <option value="8">8</option>
                                            <option value="12">12</option>
                                            <option value="16">16</option>
                                            <option value="16">${totalPage}</option>
                                        </select>--%>
                </div>

                <div class="page-right col-md-6 col-12" id="page">
                    <%--<tag:paginate max="10" offset="${offset}" count="${count}" uri="/persons" next="&raquo;" previous="&laquo;"/>--%>
                    <%--<strong id="page-number">1 -
                        <script type="text/javascript">
                            document.write(document.getElementById("row-page").value);
                        </script>
                        of
                        <script type="text/javascript">
                            var length = document.getElementById("product_items").children.length;
                            document.write(length);
                        </script>
                    </strong>
                    <a class="btn " href="javascript:void(0);" style="color: #6C757D;">Previous</a>
                    <a class="btn page-number" data-page-number="1" data-is-active="true" href="javascript:void(0);"
                       style="background-color: blue; color: white;" onclick="selectPage(this)">1</a>
                    <a class="btn" href="javascript:void(0);">Next</a>--%>

                    <!-- button Previous page-->
                    <c:if test="${page <= 1 || page == null}">
                        <a class="btn " href="?page=1${url}" style="color: #6C757D;">Previous</a>
                    </c:if>
                    <c:if test="${page > 1}">
                        <a class="btn " href="?page=${page - 1}${url}" style="color: #6C757D;">Previous</a>
                        <c:forEach var="i" begin="1" end="${page - 1}">
                            <a class="btn page-number" data-page-number="1" data-is-active="true"
                               href="?page=${i}${url}"
                               style="color: black;">${i}</a>
                        </c:forEach>
                    </c:if>
                    <!-- button Previous page-->
                    <!-- button number page-->
                    <c:choose>
                        <c:when test="${page == null}">
                            <c:forEach var="i" begin="1" end="${totalPage}">
                                <a class="btn page-number" data-page-number="1" data-is-active="true"
                                   href="?page=${i}${url}"
                                   style="color: black;">${i}</a>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <a class="btn page-number" data-page-number="1" data-is-active="true"
                               href="?page=${page}${url}"
                               style="background-color: blue; color: white;">${page}</a>
                        </c:otherwise>
                    </c:choose>
                    <!-- button number page-->
                    <!-- button nexy page-->
                    <c:if test="${page == totalPage || page == null}">

                        <a class="btn " href="?page=${totalPage}${url}" style="color: #6C757D;">Next</a>
                    </c:if>
                    <c:if test="${page < totalPage}">
                        <c:forEach var="i" begin="${page + 1}" end="${totalPage}">
                            <a class="btn page-number" data-page-number="1" data-is-active="true"
                               href="?page=${i}${url}"
                               style="color: black;">${i}</a>
                        </c:forEach>
                        <a class="btn" href="?page=${page+1}${url}">Next</a>
                    </c:if>
                    <!-- button nexy page-->
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>

<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<%--<script src="${pageContext.request.contextPath}/js/page.js"></script>--%>
<script src="${pageContext.request.contextPath}/js/webstore.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
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

    $("input").on("click", function () {
        var arr = [];
        var manufacturer = [];
        $('input[name^=\'manufacturer\']:checked').each(function (element) {
            manufacturer.push(this.value);
        });
        if (manufacturer.length != 0) {
            arr.push(manufacturer.join(','));
        }
        //var url = window.location.href +"&suppiler="+ arr;
        var url = window.location.href;
        //window.location.href = url;
        if (arr.length > 0) {
            if (url.indexOf("suppiler=") >= 0) {
                window.location.href = url.split("suppiler=")[0] + "suppiler=" + arr;
            } else if (url.indexOf('?') >= 0) {
                window.location.href = url.split("suppiler=")[0] + "&suppiler=" + arr;
            } else {
                window.location.href = url + "?suppiler=" + arr;
            }

            //window.location.href = (url.indexOf('?') >= 0) ? url + '&suppiler=' + arr : url + '?suppiler=' + arr;
        }
        document.getElementById("group").checked = true;
    });

    $('#selectSort').on('change', function () {
        var value = $(this).val();
        window.location.href = value;
    });

</script>
</body>

</html>