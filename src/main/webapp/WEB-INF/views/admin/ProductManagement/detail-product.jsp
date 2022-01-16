<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- Tich hop jstl vao jsp -->
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
  <title>Chi tiết sản phẩm</title>
  <style>
    .product-rating i,.rating-star i {
      color: #ddd;
      cursor: pointer;
      line-height: 1;
    }

    .product-rating .checked,.rating-star .checked {
      color: #f9c80b;
    }

  </style>
</head>

<body>
<!-- ============================================================== -->
<!-- main wrapper -->
<!-- ============================================================== -->
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
    <div class="dashboard-ecommerce">
      <div class="container-fluid dashboard-content ">
        <!-- ============================================================== -->
        <!-- pageheader  -->
        <!-- ============================================================== -->
        <div class="row">
          <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="page-header">
              <h2 class="pageheader-title">Chi tiết sản phẩm </h2>
              <%--<div class="page-breadcrumb">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#" class="breadcrumb-link"></a></li>
                    <li class="breadcrumb-item active" aria-current="page">E-Commerce Product Single</li>
                  </ol>
                </nav>
              </div>--%>
            </div>
          </div>
        </div>
        <!-- ============================================================== -->
        <!-- end pageheader  -->
        <!-- ============================================================== -->
        <div class="row">
          <div class="offset-xl-2 col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="row">
              <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 pr-xl-0 pr-lg-0 pr-md-0  m-b-30">
                <img class="card-img" src="${pageContext.request.contextPath}/img/${product.imgProduct}" alt="Error Img">
              </div>
              <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 pl-xl-0 pl-lg-0 pl-md-0 border-left m-b-30">
                <div class="product-details">
                  <div class="border-bottom pb-3 mb-3">
                    <h2 class="mb-3">${product.name}</h2>
                    <div class="product-rating d-inline-block float-right">
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
                    <h3 class="mb-0 text-primary"><fmt:formatNumber value="${product.discount}"/> đ</h3>
                  </div>

                  <div class="product-size border-bottom">
                      <h4>Nhà cung cấp: ${product.supplierName}</h4>
                      <h4>Thể loại: ${product.categoryName}</h4>
                      <h4>Tác giả: ${product.author}</h4>
                      <h4>Số lượng tồn kho: ${product.quantity} &nbsp;&nbsp;&nbsp;
                        <a href="/admin/addProduct" class="btn btn-outline-success">Nhập thêm</a></h4>
                  </div>
                  <div class="product-description">
                    <%--<h4 class="mb-1">Mô tả</h4>--%>
                   <%-- <p>${product.describe}</p>--%>
                    <a href="/admin/edit-product/${product.id}" class="btn btn-outline-primary btn-block btn-lg">Sửa thông tin sản phẩm</a>
                  </div>
                </div>
              </div>
              <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 m-b-60">
                <div class="simple-card">
                  <ul class="nav nav-tabs" id="myTab5" role="tablist">
                    <li class="nav-item">
                      <a class="nav-link active border-left-0" id="product-tab-1" data-toggle="tab" href="#tab-1" role="tab" aria-controls="product-tab-1" aria-selected="true">Mô tả</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" id="product-tab-2" data-toggle="tab" href="#tab-2" role="tab" aria-controls="product-tab-2" aria-selected="false">Đánh giá</a>
                    </li>
                  </ul>
                  <div class="tab-content" id="myTabContent5">
                    <div class="tab-pane fade show active" id="tab-1" role="tabpanel" aria-labelledby="product-tab-1">
                      ${product.describe}
                    </div>
                    <div class="tab-pane fade" id="tab-2" role="tabpanel" aria-labelledby="product-tab-2">
                      <c:forEach var="rating" items="${rating}">
                      <div class="review-block border-top mt-3 pt-3">
                        <p class="review-text font-italic m-0">${rating.comment}</p>
                        <div class="rating-star mb-4">
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
                        <span class="text-dark font-weight-bold">${rating.fullName}</span>
                      </div>
                      </c:forEach>
                    </div>
                  </div>
                </div>
              </div>
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
  jQuery('<div class="quantity-nav"><div class="quantity-button quantity-up">+</div><div class="quantity-button quantity-down">-</div></div>').insertAfter('.quantity input');
  jQuery('.quantity').each(function() {
    var spinner = jQuery(this),
            input = spinner.find('input[type="number"]'),
            btnUp = spinner.find('.quantity-up'),
            btnDown = spinner.find('.quantity-down'),
            min = input.attr('min'),
            max = input.attr('max');

    btnUp.click(function() {
      var oldValue = parseFloat(input.val());
      if (oldValue >= max) {
        var newVal = oldValue;
      } else {
        var newVal = oldValue + 1;
      }
      spinner.find("input").val(newVal);
      spinner.find("input").trigger("change");
    });

    btnDown.click(function() {
      var oldValue = parseFloat(input.val());
      if (oldValue <= min) {
        var newVal = oldValue;
      } else {
        var newVal = oldValue - 1;
      }
      spinner.find("input").val(newVal);
      spinner.find("input").trigger("change");
    });

  });
</script>
</body>


</html>