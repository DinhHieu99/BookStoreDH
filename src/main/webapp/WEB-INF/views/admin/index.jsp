<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!-- tích hợp JSTL vào trong JSP -->
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
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/vendor/bootstrap-select/css/bootstrap-select.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/charts/chartist-bundle/chartist.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/charts/morris-bundle/morris.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/charts/c3charts/c3.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/vendor/fonts/flag-icon-css/flag-icon.min.css">

    <!-- data table -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/vendor/datatables/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/vendor/datatables/css/buttons.bootstrap4.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/vendor/datatables/css/select.bootstrap4.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/vendor/datatables/css/fixedHeader.bootstrap4.css">
    <!-- data table -->
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">

    <title>Trang chủ quản lý</title>
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
                            <h2 class="pageheader-title">Trang chủ quản lý</h2>

                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Menu</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Trang chủ quản lý</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader  -->
                <!-- ============================================================== -->
                <div class="ecommerce-widget">
                    <div class="row">
                        <!-- ============================================================== -->
                        <!-- product  -->
                        <!-- ============================================================== -->
                        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                            <div class="card border-3 bg-primary">
                                <div class="card-header bg-primary">
                                    <h5 class="text-light">Sản phẩm</h5>
                                    <%--<h1 class="mb-1">${user_online}</h1>--%>
                                </div>
                                <div class="btn dropdown border-top border-top-light text-left">
                                    <div class="panel-heading">
                                        <h5 class="text-light">
                                            <a class="text-light dropdown-toggle" data-toggle="collapse"
                                               href="#collapse1">Xem chi tiết</a>
                                        </h5>
                                    </div>
                                    <div id="collapse1" class="panel-collapse collapse bg-light rounded">
                                        <div class="panel-body"><a class="btn text-primary"
                                                                   href="/admin/data-table-products">Danh sách sản
                                            phẩm</a></div>
                                        <div class="panel-footer"><a class="btn text-primary"
                                                                     href="/admin/add-new-product">Nhập thêm sản
                                            phẩm mới</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end product  -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- orders  -->
                        <!-- ============================================================== -->
                        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                            <div class="card border-3" style="background-color: grey">
                                <div class="card-header" style="background-color: grey">
                                    <h5 class="text-light">Đơn hàng</h5>
                                </div>
                                <div class="btn dropdown border-top border-top-light text-left">
                                    <div class="panel-heading">
                                        <h5 class="text-light">
                                            <a class="text-light dropdown-toggle" data-toggle="collapse"
                                               href="#collapse2">Xem chi tiết</a>
                                        </h5>
                                    </div>
                                    <div id="collapse2" class="panel-collapse collapse bg-light rounded">
                                        <div class="panel-body">
                                            <a class="btn text-primary" href="/admin/invoice">Danh sách đơn hàng</a>
                                        </div>
                                        <div class="panel-body">
                                            <a class="btn text-primary" href="/admin/data-table-sales-statistics">Thống
                                                kê bán hàng</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end orders  -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- employee  -->
                        <!-- ============================================================== -->
                        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                            <div class="card border-3" style="background-color: rgb(106,196,252)">
                                <div class="card-header" style="background-color: rgb(106,196,252)">
                                    <h5 class="text-light">Tài khoản</h5>
                                </div>
                                <div class="btn dropdown border-top border-top-light text-left">
                                    <div class="panel-heading">
                                        <h5 class="text-light">
                                            <a class="text-light dropdown-toggle" data-toggle="collapse"
                                               href="#collapse3">Xem chi tiết</a>
                                        </h5>
                                    </div>
                                    <div id="collapse3" class="panel-collapse collapse bg-light rounded">
                                        <div class="panel-body">
                                            <a class="btn text-primary" href="/admin/data-table-employee">Danh sách nhân
                                                viên</a></div>
                                        <div class="panel-body">
                                            <a class="btn text-primary" href="/admin/data-table-user">Danh sách người
                                                dùng</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end employee  -->
                        <!-- ============================================================== -->
                    </div>
                    <div class="row">
                        <!-- ============================================================== -->
                        <!-- product category  -->
                        <!-- ============================================================== -->
                        <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header"> Danh mục sản phẩm</h5>
                                <div class="card-body">
                                    <input type="hidden" id="quantityProductCategory" value="${mapQuantity.values()}"/>
                                    <input type="hidden" id="MapKeyProductCategory" value="${mapQuantity.keySet()}"/>
                                    <canvas class="ct-golden-section " id="ct-chart-category"></canvas>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end product category  -->
                        <!-- product sales  -->
                        <!-- ============================================================== -->
                        <div class="col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="mb-0"> Doanh thu theo tháng</h5>
                                </div>
                                <div class="card-body">
                                    <input type="hidden" id="totalMoney" value="${totalRevenue.keySet()}"/>
                                    <canvas id="sparkline-revenue"></canvas>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end product sales  -->
                        <!-- ============================================================== -->

                    </div>
                    <div class="row">
                        <!-- ============================================================== -->
                        <!-- sparkline revenue  -->
                        <!-- ============================================================== -->

                        <div class="col-xl-12 col-lg-12 col-md-6 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header">Doanh thu theo tháng</h5>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered first">
                                            <thead class="bg-light">
                                            <tr class="border-0">
                                                <th class="border-0">Tháng</th>
                                                <th class="border-0">Doanh thu</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="revenue" items="${totalRevenue}">
<%--                                                <c:if test="${revenue.value!=0}">--%>
                                                <tr>
                                                    <td>${revenue.key}</td>
                                                    <td><fmt:formatNumber value="${revenue.value *1000}"/> đ</td>
                                                </tr>
<%--                                                </c:if>--%>
                                            </c:forEach>
                                            </tbody>
                                            <tfoot class="bg-light">
                                            <tr class="border-0">
                                                <th class="border-0">Tháng</th>
                                                <th class="border-0">Doanh thu</th>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end recent orders  -->


                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- customer acquistion  -->
                        <!-- ============================================================== -->

                        <!-- ============================================================== -->
                        <!-- end customer acquistion  -->
                        <!-- ============================================================== -->
                    </div>
                    <div class="row">
                        <!-- ============================================================== -->
                        <!-- recent orders  -->
                        <!-- ============================================================== -->
                        <style>
                            .table-responsive table tr th, td {
                                vertical-align: middle;
                                text-align: center;
                            }

                            .table-responsive table tr th, td {
                                line-height: 30px;
                            }

                            .table-responsive table tr .text {
                                text-align: justify;
                                width: 150px;
                            }

                            .table-responsive table tr th, td button {
                                margin-top: 10px;
                            }
                        </style>
                        <div class="col-xl-12 col-lg-12 col-md-6 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header">Những đơn hàng gần đây</h5>
                                <div class="card-body p-0">
                                    <div class="table-responsive">
                                        <table class="table ">
                                            <thead class="bg-light">
                                            <tr class="border-0">
                                                <th class="border-0">Mã đơn hàng</th>
                                                <th class="border-0">Khách hàng</th>
                                                <th class="border-0">Điện thoại</th>
                                                <th class="border-0">Email</th>
                                                <th class="border-0">Ghi chú</th>
                                                <th class="border-0">Tổng tiền thanh toán</th>
                                                <th class="border-0">Thanh toán</th>
                                                <th class="border-0">Thời gian phục vụ</th>
                                                <th class="border-0">Tình trạng</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="invoice" items="${invoice}">
                                                <tr>
                                                    <td>${invoice.id}
                                                    </td>
                                                    <td class="text">${invoice.customerName}</td>
                                                    <td><fmt:formatNumber value="${invoice.mobile}"/></td>
                                                    <td>${invoice.email}</td>
                                                    <td class="text">${invoice.message}</td>
                                                    <td><fmt:formatNumber value="${invoice.totalMoney}"/>đ</td>
                                                    <td>
                                                        <c:if test="${invoice.pay == false }">
                                                            <p style="font-weight: bold; color: red; white-space:nowrap">
                                                                Chưa thanh toán
                                                            </p>
                                                        </c:if>
                                                        <c:if test="${invoice.pay == true }">
                                                            <p style="font-weight: bold; color: green; white-space:nowrap">
                                                                <span class="badge-dot badge-danger mr-1"></span> Đã
                                                                thanh toán
                                                            </p>
                                                        </c:if>
                                                    </td>
                                                    <td>${invoice.date}</td>
                                                    <td>
                                                        <c:if test="${invoice.status == 0 }">
                                                            <a href="/admin/admin-invoice/${invoice.id}-1">
                                                                <button class="btn btn-sm btn-outline-light"
                                                                        onclick="return window.confirm('Xác nhận đơn hàng #${invoice.id} ');">
                                                                    <span class="badge-dot badge-danger mr-1"></span>Đang
                                                                    chờ xác nhận
                                                                </button>
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${invoice.status == 1 }">
                                                            <a href="/admin/admin-invoice/${invoice.id}-2">
                                                                <button class="btn btn-sm btn-outline-light"
                                                                        onclick="return window.confirm('Đơn hàng #${invoice.id} đang được chuyển');">
                                                                    <span class="badge-dot badge-brand mr-1"></span>Xác
                                                                    nhận
                                                                </button>
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${invoice.status == 2}">
                                                            <a href="/admin/admin-invoice/${invoice.id}-3">
                                                                <button class="btn btn-sm btn-outline-light"
                                                                        onclick="return window.confirm('Xác nhận đơn hàng đã chuyển đến #${invoice.id} ');">
                                                                    <span class="badge-dot badge-success mr-1"></span>Đang
                                                                    chuyển hàng
                                                                </button>
                                                            </a>
                                                        </c:if>
                                                        <button class="btn btn-sm btn-outline-light button-show-${invoice.id}"
                                                                onclick="showOrder('${invoice.id}')">
                                                            <i class="fas fa-eye">Xem đơn hàng</i>
                                                        </button>
                                                        <button class="btn btn-sm btn-outline-light button-hidden-${invoice.id}"
                                                                style="display: none"
                                                                onclick="hiddenOrderProduct('${invoice.id}')">
                                                            <i class="fas fa-eye-slash"> Ẩn đơn hàng</i>
                                                        </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="resultOrderProduct${invoice.id}" colspan="9"
                                                        style="padding: 0">

                                                    </td>
                                                </tr>

                                            </c:forEach>
                                            <tr>
                                                <td colspan="9"><a href="/admin/invoice"
                                                                   class="btn btn-outline-light float-right">Xem chi
                                                    tiết</a></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end recent orders  -->


                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- customer acquistion  -->
                        <!-- ============================================================== -->

                        <!-- ============================================================== -->
                        <!-- end customer acquistion  -->
                        <!-- ============================================================== -->
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
<!-- chart chartist js -->
<script src="${pageContext.request.contextPath}/assets/vendor/charts/chartist-bundle/chartist.min.js"></script>
<!-- sparkline js -->
<script src="${pageContext.request.contextPath}/assets/vendor/charts/sparkline/jquery.sparkline.js"></script>
<!-- morris js -->
<script src="${pageContext.request.contextPath}/assets/vendor/charts/morris-bundle/raphael.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/charts/morris-bundle/morris.js"></script>
<!-- chart c3 js -->
<script src="${pageContext.request.contextPath}/assets/vendor/charts/c3charts/c3.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/charts/c3charts/d3-5.4.0.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/charts/c3charts/C3chartjs.js"></script>
<!--<script src="${pageContext.request.contextPath}/assets/libs/js/dashboard-ecommerce.js"></script>-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/charts/chartjs-plugin-colorschemes/chartjs-plugin-colorschemes.js"></script>

<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-select/js/bootstrap-select.js"></script>
<!-- data table -->
<script src="${pageContext.request.contextPath}/assets/vendor/multi-select/js/jquery.multi-select.js"></script>
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
<script>

    function showOrder(idInvoice) {
        $(document).ready(function () {
            var idOrder = idInvoice;

            $.ajax({
                url: "${pageContext.request.contextPath}/admin/order_product",
                type: "get",
                data: {
                    idInvoice: idOrder
                },
                success: function (response) {
                    $("#resultOrderProduct" + idInvoice).html(response);
                    $(".button-show-" + idInvoice).hide();
                    $(".button-hidden-" + idInvoice).show();
                    $("#resultOrderProduct" + idInvoice).show();
                },
                error: function (xhr) {
                    alert('Error')
                }
            });
        });
    }

    function hiddenOrderProduct(idInvoice) {
        $(".button-show-" + idInvoice).show();
        $(".button-hidden-" + idInvoice).hide();
        $("#resultOrderProduct" + idInvoice).hide();
    }

    var str = document.getElementById("quantityProductCategory").value;
    var array = str.substring(1, str.length - 1).split(',').map((x) => parseInt(x)); // chuyển đổi sang mảng

    var strlabel = document.getElementById("MapKeyProductCategory").value;
    var arrayLabel = strlabel.substring(1, strlabel.length - 1).split(', ');

    new Chart("ct-chart-category", {
        type: "doughnut",
        data: {
            labels: arrayLabel,
            datasets: [{
                // backgroundColor: barColors,
                data: array
            }]
        },
        options: {
            plugins: {
                colorschemes: {
                    scheme: 'tableau.Classic20'
                }
            }
        }
    });
    var d = new Date();

    var strlabel2 = document.getElementById("totalMoney").value;
    var arrayLabel2 = strlabel2.substring(1, strlabel2.length - 1).split(', ');

    new Chart("sparkline-revenue", {
        type: "line",
        data: {
            labels: arrayLabel2,
            datasets: [
                {
                  //  fill: false,
                    //lineTension: 0,
                    backgroundColor: "rgba(253,89,1,0.3)",
                    borderColor: "rgba(253,89,1,1)",
                    data: ${totalRevenue.values()},
                   /* borderWidth: 5, // dộ rộng đường kết nối 2 điểm
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
                    ticks: { // giới hạn
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
    /*const map = new Map();
    for(let i =0; i< array.length;i++){
        map.set(arrayLabel[i], array[i]);
    }

    for (let [key, value] of map) {
        console.log(`${key} has ${value}`)
    }*/
    /*
        var chart = new Chartist.Pie('.ct-chart-category', {

            series: array,
            labels: arrayLabel,

        }, {
            showLabel: false,
            donut: true,
            donutWidth: 40

        });*/


</script>
</body>

</html>