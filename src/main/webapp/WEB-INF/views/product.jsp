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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/product.css">
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">


    <title>${product.name}</title>
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
                    <a href="/">
                        <span><i class="fa fa-home"></i> Trang chủ</span>
                    </a>
                    <span><i class="fa">/&nbsp;</i></span>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <span>Sản phẩm</span>
                    </a>
                    <span><i class="fa">/&nbsp;</i></span>
                </li>
                <li><a href="/category/${product.id}-${product.urlName}">
                    <span>${product.categoryName}</span></a>
                </li>
            </ul>
        </div>
    </div>

    <div class="row">
        <div class="content-left-1 col-md-9 col-12">
            <div class="row">
                <div class="col-md-4">
                    <picture>
                        <img class="card-img" alt="${product.name}"
                             src="${pageContext.request.contextPath}/img/${product.imgProduct}"/>
                    </picture>
                </div>
                <div class="content-inner col-md-8">
                    <div class="title">
                        <h4>${product.name}</h4>
                    </div>
                    <div class="statusText">
                        <div class="inventory_quantity">
                                <span class="stock-brand-title"><strong><i class="fa fa-check-circle"></i>Tình trạng:
                                    </strong></span>
                            <c:if test="${product.quantity>0}">
                                <span class="status-title">Còn ${product.quantity} trong kho</span><br>
                            </c:if>
                            <c:if test="${product.quantity == 0}">
                                <span class="status-title">Chúng tôi đang nhập thêm vàokho</span><br>
                            </c:if>
                            <c:if test="${product.author != ''}">
                                <span class="stock-brand-title"><strong><i
                                        class="fa fa-user"></i>Tác giả:</strong></span>
                                <span class="status-title">${product.author}</span><br>
                            </c:if>
                            <span class="stock-brand-title"><strong>Nhà cung cấp:</strong></span>
                            <span class="status-title">${product.supplierName}</span>
                        </div>
                        <div class="price-box">
                                <span class="special-price">
                                    <span class="price"><fmt:formatNumber value="${product.discount}"/>đ</span>
                                </span>

                            <span class="discount"><del><fmt:formatNumber value="${product.price}"/>đ</del>
                                </span>
                        </div>
                        <div class="rating-top">
                            <c:if test="${avgStar == 0 ||avgStar == null}">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </c:if>
                            <c:if test="${(avgStar - 0)>0 }">
                                <i class="fa fa-star checked"></i>
                            </c:if>
                            <c:if test="${(avgStar -1)>0 }">
                                <i class="fa fa-star checked"></i>
                            </c:if>
                            <c:if test="${(avgStar -2)>0 }">
                                <i class="fa fa-star checked"></i>
                            </c:if>
                            <c:if test="${(avgStar - 3)>0 }">
                                <i class="fa fa-star checked"></i>
                            </c:if>
                            <c:if test="${(avgStar - 4)>0 }">
                                <i class="fa fa-star checked"></i>
                            </c:if>
                            <c:if test="${(avgStar - 5)>0 }">
                                <i class="fa fa-star checked"></i>
                            </c:if>
                        </div>
                    </div>
                    <form action="/addProduct" method="post" modelAttribute="product">
                        <div class="form-product">
                            <div id="product">
                                <div class="form-group row">
                                    <input type="hidden" name="id" value="${product.id}">
                                    <input type="hidden" name="discount" value="${product.discount}">

                                    <button class="btn btn_num col-md-2 col-3" type="button" onclick="minus(${product.quantity});">-
                                    </button>

                                    <input name="quantity" type="number" id="input-quantity"
                                           maxlength="10" min="1" class="form-control amount col-md-3 col-5" size="4"
                                           min="1" max="${product.quantity}" value="1" style="width: 70px">

                                    <button class="btn btn_num col-md-2 col-3" type="button"
                                            onclick="plus(${product.quantity});">+
                                    </button>
                                </div>
                                <p style="color: red; font-size: 14px;" id="checkquantity"></p>
                                <div class="button_actions">
                                    <button type="submit" id="button-cart" data-loading-text="Đang tải..."
                                            class="btn-buy">
                                        <span class="btn-content">Thêm vào giỏ</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="content-main col-md-12">
                    <div class="describe-title">
                        <span>Mô tả</span>
                    </div>
                    <div class="describe-text">
                        ${product.describe}
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-12">
                            <h3>Thêm đánh giá </h3>
                            <p>Đánh giá của bạn</p>
                            <c:choose>
                                <c:when test="${idUser != null}">
                                    <div class="rating" id="cate-rating">
                                        <a href="javascript:void(0)" class="star" id="star-1"><i class="fa fa-star"></i></a>
                                        <a href="javascript:void(0)" class="star" id="star-2"><i class="fa fa-star"></i></a>
                                        <a href="javascript:void(0)" class="star" id="star-3"><i class="fa fa-star"></i></a>
                                        <a href="javascript:void(0)" class="star" id="star-4"><i class="fa fa-star"></i></a>
                                        <a href="javascript:void(0)" class="star" id="star-5"><i class="fa fa-star"></i></a>
                                    </div>
                                    <div class="commen-user container">
                                        <div class="row">
                                            <input type="hidden" id="star" value="">
                                            <input type="hidden" id="userId" value="${idUser}">
                                            <div class="input-group w-100 col-md-11 col-10" style="padding:15px 0;">
                                        <textarea type="text" id="comment_user" class="form-control"
                                                  placeholder="bình luận" required
                                                  style="font-size:16px;max-height:80px;"></textarea>
                                            </div>
                                            <div class="input-group-append col-md-1 col-1"
                                                 style="padding-top:15px; padding-left: 0">
                                                <input type="submit" id="comment" class="btn btn-info" value="Gửi"
                                                       style="max-height:80px;font-size:16px;padding: 15px 15px 18px"/>
                                            </div>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <p>
                                        Bạn phải <a href="/user/login" style="text-decoration: none">đăng nhập</a>
                                    </p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <h4 class="col-md-12">${countComment} lượt Bình luận</h4>
                        <div id="comment_show" class="col-md-12" style=" max-height:600px;overflow-y: auto;"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="content-right col-md-3 col-12">
            <div class="title">
                <span>Sách mới ra mắt</span>
            </div>
            <c:forEach var="mostView" items="${mostView}" begin="0" end="3">
                <div class="product-news row">
                    <div class="product-img col-3">
                        <a href="/product/${mostView.id}/${mostView.urlName}">
                            <img class="card-img"
                                 src="${pageContext.request.contextPath}/img/${mostView.imgProduct}"
                                 alt="${mostView.name}">
                        </a>
                    </div>
                    <div class="product-name col-9">
                        <div class="product-title">
                            <a href="/product/${mostView.id}/${mostView.urlName}">
                                <span>${mostView.name}</span></a>
                        </div>
                        <div class="product-price">
                            <span class="price"><fmt:formatNumber value="${mostView.discount}"/> đ</span>
                            <span class="discount"><del><fmt:formatNumber value="${mostView.price}"/> đ</del></span>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<!--footer-->
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
<!-- footer -->
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/webstore.js"></script>
<script>
    $(document).ready(function () {
        loadComment();
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

        // POST comment
        $("#comment").click(function (e) {
            e.preventDefault();
            if ($("#comment_user").val() == null) {
                confirm('Bạn hãy bình luận vào đây');
            } else {
                var data = {
                    "comment": $("#comment_user").val(),
                    "rating": $("#star").val(),
                    "idUser": $('#userId').val(),
                    "idProduct": ${product.id}
                };

                $.ajax({
                    url: "/comment",
                    type: "post",
                    contentType: "application/json", //dữ liệu được gửi lên web-service có dạng là json.
                    data: JSON.stringify(data), // object json -> string json

                    dataType: "json", // dữ liệu từ web-service trả về là json.
                    success: function (jsonResult) { // được gửi khi web-service trả về dữ liệu.
                        // load lại comment
                        loadComment();
                    }
                });
            }
        });
    });

    function loadComment() {
        $.ajax({
            url: "${pageContext.request.contextPath}/comment-product/${product.id}",
            type: "get",
            success: function (response) {
                $("#comment_show").html(response);
            },
            error: function (xhr) {
                alert('Error comment lv 1')
            }
        });
    }

    function deleteComment(id) {
        var result = confirm("Bạn có xác nhận xóa bình luận này của bạn không?");
        if (result == true) {
            $.ajax({
                url: "/remove_comment/" + id,
                type: "delete",
                success: function (jsonResult) { // được gửi khi web-service trả về dữ liệu.
                    // load lại comment
                    $.ajax({
                        url: "${pageContext.request.contextPath}/comment-product/${product.id}",
                        type: "get",
                        success: function (response) {
                            loadComment();
                        },
                        error: function (xhr) {
                            alert('Error delete comment lv 1')
                        }
                    });
                }
            });
        }
    }

    function hidenComment(id) {
        $('return-' + id).hide();
    }

    function plus(max) {
        var a = document.getElementById('input-quantity');
        var quantity = a.value;
        if (!isNaN(quantity))
            a.value++;

        if (quantity >= max){
            $('#checkquantity').show();
            $('#checkquantity').html('Bạn đã đặt quá số lượng tồn kho và bạn có thể phải đợi để chúng tôi nhập thêm hàng');
        }

        if (quantity < max)
            $('#checkquantity').hide();

        return false;
    }

    function minus(max) {
        var a = document.getElementById('input-quantity');
        var quantity = a.value;
        if (!isNaN(quantity) && quantity >= 1)
            a.value--;

        if (quantity <= max)
            $('#checkquantity').hide();

        return false;
    }

    $(document).ready(function () {
        $('a.star').mouseenter(function () {
            if ($('#cate-rating').hasClass('rating-ok') == false) {
                var eID = $(this).attr('id');
                eID = eID.split('-').splice(-1);
                $('a.star').removeClass('vote-hover');
                var rating = 0;
                for (var i = 1; i <= eID; i++) {
                    $('#star-' + i).addClass('vote-hover');
                    $("#star").val(i);
                }
            }
        });
    });

    function checkQuantity() {
        var quantity = $(product.quantity).val();
        var dat = $("#input-quantity").val();
        var s = (quantity.value - dat.value);

        if (s <= 0) {
            $("#check").html("hết hàng");
        }
    }

    $(document).ready(function () {
        $("#input-quantity").keyup(checkQuantity);
    });

    $(document).ready(function () {
        $('a.star').mouseenter(function () {
            if ($('#cate-rating').hasClass('rating-ok') == false) {
                var eID = $(this).attr('id');
                eID = eID.split('-').splice(-1);
                $('a.star').removeClass('vote-hover');
                for (var i = 1; i <= eID; i++) {
                    $('#star-' + i).addClass('vote-hover');
                }
            }
        })
    });
</script>
</body>

</html>