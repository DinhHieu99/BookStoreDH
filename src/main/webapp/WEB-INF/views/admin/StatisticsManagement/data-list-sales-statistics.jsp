<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- Tich hop jstl vao jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="${pageContext.request.contextPath}/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/css/style.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/vendor/datatables/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/vendor/datatables/css/buttons.bootstrap4.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/vendor/datatables/css/select.bootstrap4.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/vendor/datatables/css/fixedHeader.bootstrap4.css">
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">
    <style type="text/css">
        .table-responsive table tr th {
            vertical-align: middle;
        }
    </style>
    <title>Thống kê bán hàng</title>
</head>

<body>
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
        <div class="container-fluid  dashboard-content">
            <!-- ============================================================== -->
            <!-- pageheader -->
            <!-- ============================================================== -->
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="page-header">
                        <h2 class="pageheader-title">Thống kê bán hàng</h2>

                        <div class="page-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="javascript:void(0)" class="breadcrumb-link">Thống kê & Kho hàng</a>
                                    </li>
                                    <li class="breadcrumb-item">
                                        <a href="javascript:void(0)" class="breadcrumb-link">Bán hàng</a>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ============================================================== -->
            <div class="row">
                <div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="card">
                        <div class="card-header">
                            <!-- <div class="float-right">
                                    <select class="custom-select">
                                        <option selected>Today</option>
                                        <option value="1">Weekly</option>
                                        <option value="2">Monthly</option>
                                        <option value="3">Yearly</option>
                                    </select>
                                </div> -->
                            <h5 class="mb-0"> Doanh thu theo tháng</h5>
                        </div>
                        <div class="card-body">
                            <input type="hidden" id="totalMoney" value="${totalRevenue.keySet()}"/>
                            <canvas id="sparkline-revenue"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="card">
                        <div class="card-header">
                            <!-- <div class="float-right">
                                    <select class="custom-select">
                                        <option selected>Today</option>
                                        <option value="1">Weekly</option>
                                        <option value="2">Monthly</option>
                                        <option value="3">Yearly</option>
                                    </select>
                                </div> -->
                            <h5 class="mb-0"> Số lượng sản phẩm đã bán theo tháng</h5>
                        </div>
                        <div class="card-body">
                                <input type="hidden" id="Month" value="${sellQuantity.keySet()}"/>
                            <canvas id="sparkline-quantity"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end pageheader -->
            <div class="row">
                <!-- ============================================================== -->
                <!-- basic table  -->
                <!-- ============================================================== -->
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="card">
                        <h5 class="card-header">Bản dữ liệu sản phẩm đã bán</h5>

                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered first">
                                    <thead>
                                    <tr>
                                        <th>Ngày hoàn thành đơn hàng</th>
                                        <th>Mã sản phẩm</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Số lượng bán</th>
                                        <th>Đơn giá</th>
                                        <%--<th>Ảnh</th>--%>
                                        <%--<th>Tên tác giả</th>--%>
                                        <th>Số lượng tồn kho</th>

                                        <%--<th>Chiêt khấu phần trắm</th>
                                        <th>Giảm giá</th>--%>
                                        <%--<th>Trang thái</th>--%>
                                        <%--<th>Lượt xem</th>--%>

                                        <%--  <th>Danh mục</th>--%>
                                        <%--<th>Nhà cung cấp</th>--%>
                                        <%--<th>Hành động</th>--%>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="products" items="${statistics}">
                                        <tr>
                                            <td><fmt:formatDate value="${products.date}" pattern="dd/MM/yyyy"/></td>

                                            <td>${products.id}</td>
                                            <td>${products.nameProduct}</td>
                                            <td>${products.quantity}</td>
                                            <%--<td><img
                                                    src="${pageContext.request.contextPath}/img/${products.imgProduct}"
                                                    alt=" lỗi ảnh" style="width: 100px; hight: 75px;"></td>--%>
                                          <%--  <td>${products.author}</td>--%>
                                            <td><fmt:formatNumber value="${products.price}"/>đ</td>
                                            <td>${products.quantityInStock}</td>

                                                <%--<td>${products.percentDiscount}%</td>
                                                <td>${products.discount}đ</td>--%>
                                           <%-- <td>
                                                <c:if test="${products.status == true}">
                                                    <span class="badge-dot badge-success mr-1"></span>Hiển thị
                                                </c:if>
                                                <c:if test="${products.status == false}">
                                                    <span class="badge-dot badge-secondary mr-1"></span>Không hiển thị
                                                </c:if>
                                            </td>--%>
                                                <%-- <td>${products.view}</td>--%>

                                                <%-- <td>${products.categoryName}</td>--%>
                                                <%--<td><c:out value="${products.supplierName}"></c:out></td>--%>
                                            <%--<td>
                                                <div class="btn-group ml-auto">
                                                    <a href="/admin/addProduct">
                                                        <button class="btn btn-sm btn-outline-light">Nhập thêm
                                                        </button>
                                                    </a>
                                                </div>
                                            </td>--%>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th>Ngày hoàn thành đơn hàng</th>
                                        <th>Mã sản phẩm</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Số lượng bán</th>
                                        <th>Đơn giá</th>
                                        <%--<th>Ảnh</th>--%>
                                        <%--<th>Tên tác giả</th>--%>
                                        <th>Số lượng tồn kho</th>

                                        <%--<th>Chiêt khấu phần trắm</th>
                                        <th>Giảm giá</th>--%>
                                        <%--<th>Trang thái</th>--%>
                                        <%--<th>Lượt xem</th>--%>

                                        <%--  <th>Danh mục</th>--%>
                                        <%--<th>Nhà cung cấp</th>--%>
                                        <%--<th>Hành động</th>--%>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end basic table  -->
                <!-- ============================================================== -->
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/admin/layout/footer.jsp" %>
</div>
<script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/multi-select/js/jquery.multi-select.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/js/main-js.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/datatables/js/data-table.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
<script src="https://cdn.datatables.net/rowgroup/1.0.4/js/dataTables.rowGroup.min.js"></script>
<script src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
<script src="https://cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/charts/chartjs-plugin-colorschemes/chartjs-plugin-colorschemes.js"></script>

<script>
    var strlabel = document.getElementById("totalMoney").value;
    var arrayLabel = strlabel.substring(1, strlabel.length - 1).split(', ');
    var d = new Date();
    new Chart("sparkline-revenue", {
        type: "bar",
        data: {
            labels: arrayLabel,
            datasets: [
                {
                    fill: false,
                    lineTension: 0,
                    backgroundColor: "rgb(253,89,1)",
                    borderColor: "rgb(253,89,1)",
                    data: ${totalRevenue.values()},
                    /*borderWidth: 5, // dộ rộng đường kết nối 2 điểm
                    pointRadius: 2,*/
                    pointBackgroundColor: 'rgb(253,89,1)',
                    pointBorderColor: 'rgb(253,89,1)',
                    label: 'Tổng đoanh thu'

                }
            ],


        },
        options: {
            title: {
                display: true,
                text: 'Đồ thị doanh thu theo từng tháng năm ' + d.getUTCFullYear() + ' (nghìn đồng)'
            },
            scales: {
                yAxes: [{
                    scaleLabel: {
                        display: true,
                        labelString: 'Nghìn đồng'
                    },
                    ticks: {
                        beginAtZero: true
                    }
                },
                ],
                xAxes: [{
                    type: 'category',
                    scaleLabel: {
                        display: true,
                        labelString: 'Tháng'
                    }
                }]

            }
        }
    });

    var strlabel2 = document.getElementById("Month").value;
    var arrayLabel2 = strlabel2.substring(1, strlabel2.length - 1).split(', ');

    new Chart("sparkline-quantity", {
        type: "line",
        data: {
            labels: arrayLabel2,
            datasets: [
                {

                    backgroundColor: 'rgba(0, 128, 128, 0.3)',
                    borderColor: 'rgba(0, 128, 128, 0.7)',
                    data: ${sellQuantity.values()},
                    label: 'Số lượng hàng bán từng tháng'

                }
            ],


        },
        options: {
            title: {
                display: true,
                text: 'Số sản phẩm bán từng tháng năm ' + d.getUTCFullYear()
            },
            scales: {
                yAxes: [{
                    scaleLabel: {
                        display: true,

                    },
                    ticks: {
                        beginAtZero: true
                    }
                }],
                xAxes: [{
                    scaleLabel: {
                        display: true,
                        labelString: 'Tháng'
                    }
                }]

            }
        }
    });
</script>
</body>
</html>