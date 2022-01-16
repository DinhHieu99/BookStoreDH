<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- Tich hop jstl vao jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="${pageContext.request.contextPath}/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/css/style.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">
    <title>Email</title>
</head>

<body>
<!-- ============================================================== -->
<!-- main wrapper -->
<!-- ============================================================== -->
<div class="dashboard-main-wrapper">
    <!-- ============================================================== -->
    <!-- navbar -->
    <!-- ============================================================== -->
    <%@ include file="/WEB-INF/views/admin/layout/header.jsp" %>
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
        <div class="container-fluid">
            <%@ include file="/WEB-INF/views/admin/ContactManagement/SendMail/menuEmail.jsp" %>
            <div class="main-content container-fluid p-0">
                <div class="email-inbox-header">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="email-title"><span class="icon"><i class="fas fa-inbox"></i></span> Hộp thư đến
                                <span class="new-messages">(${mail} tin mới)</span></div>
                        </div>
                        <div class="col-lg-6">
                            <div class="email-search">
                                <div class="input-group input-search">
                                    <input class="form-control" type="text" placeholder="Search mail..."><span
                                        class="input-group-btn">
                                       <button class="btn btn-secondary" type="button"><i
                                               class="fas fa-search"></i></button></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="email-filters">
                    <div class="email-filters-left">
                        <label class="custom-control custom-checkbox be-select-all">
                            <input class="custom-control-input chk_all" type="checkbox" name="chk_all"><span
                                class="custom-control-label"></span>
                        </label>
                        <div class="btn-group">
                            <button class="btn btn-light dropdown-toggle" data-toggle="dropdown" type="button">
                                Tìm kiếm với <span class="caret"></span></button>
                            <div class="dropdown-menu" role="menu">
                                <a class="dropdown-item" href="/admin/sent-mail">Đánh dấu đã đọc</a>
                                <a class="dropdown-item" href="/admin/contacts">Đánh dấu chưa đọc</a>
                                <a class="dropdown-item" href="/admin/trash-mail">Thư rác</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Xóa</a>
                            </div>
                        </div>
                        <div class="btn-group">
                            <button class="btn btn-light" type="button">Lưu trữ</button>
                            <button class="btn btn-light" type="button" id="trash">Thư rác</button>
                            <button class="btn btn-light" type="button" id="delete">Xoá</button>
                        </div>

                    </div>
                    <%--<div class="email-filters-right"><span class="email-pagination-indicator">1-50 of 253</span>
                        <div class="btn-group email-pagination-nav">
                            <button class="btn btn-light" type="button"><i class="fas fa-angle-left"></i></button>
                            <button class="btn btn-light" type="button"><i class="fas fa-angle-right"></i></button>
                        </div>
                    </div>--%>
                </div>
                <div class="email-list">
                    <c:forEach var="contact" items="${contact}">
                        <div class="email-list-item email-list-item--unread">
                            <div class="email-list-actions">
                                <label class="custom-control custom-checkbox">
                                    <input class="custom-control-input checkboxes" type="checkbox"
                                           value="${contact.id}">
                                    <span class="custom-control-label"></span>
                                </label>
                            </div>
                            <div class="email-list-detail">
                                <a href="/admin/sendMail/id=${contact.id}"> <span
                                        class="date float-right"><span class="icon"> </span> <fmt:formatDate
                                        value="${contact.createdDate}" pattern="dd/MM/yyyy"/></span><span
                                        class="from">${contact.fullName}</span>
                                    <p class="msg">${contact.subject}</p></a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- ============================================================== -->
<!-- end main wrapper -->
<!-- ============================================================== -->
<!-- Optional JavaScript -->
<script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/js/main-js.js"></script>

<script>
    $(document).ready(function () {

        // binding the check all box to onClick event
        $(".chk_all").click(function () {

            var checkAll = $(".chk_all").prop('checked');
            if (checkAll) {
                $(".checkboxes").prop("checked", true);
            } else {
                $(".checkboxes").prop("checked", false);
            }

        });
        var idEmail = "";
        $(".checkboxes").click(function () {
            var checkbox = document.getElementsByClassName('checkboxes');
            var result = "";

            // Lặp qua từng checkbox để lấy giá trị
            for (var i = 0; i < checkbox.length; i++) {
                if (checkbox[i].checked === true) {
                    result += checkbox[i].value + ',';
                }
            }
            idEmail = result.substring(0, result.length - 1);
            //alert(result);
        });

        // if all checkboxes are selected, then checked the main checkbox class and vise versa
        $(".checkboxes").click(function () {

            if ($(".checkboxes").length == $(".subscheked:checked").length) {
                $(".chk_all").attr("checked", "checked");
            } else {
                $(".chk_all").removeAttr("checked");
            }

        });

        $("#trash").click(function () {
            //var r = confirm("Bạn có muốn chuyển sang thùng sang không");
            var data = {
                "id": idEmail,
            };
            alert(idEmail);
            $.ajax({
                url: "/admin/remove-mail",
                type: "put",
                contentType: "application/json",
                data: JSON.stringify(data),
                dataType: "json",
                success: function (response) {
                    location.reload();
                    /*window.location.href = "/admin/sent-mail";*/
                },
                error: function (xhr) {
                    //e.preventDefault();
                    alert('Error spam mail');
                }
            });
        });

        $("#delete").click(function () {
            var r = confirm("Bạn có muốn xóa hoàn toàn không");
            if(r == true){
                var data = {
                    "id": idEmail,
                };
                alert(idEmail);
                $.ajax({
                    url: "/admin/delete-mail",
                    type: "delete",
                    contentType: "application/json",
                    data: JSON.stringify(data),
                    dataType: "json",
                    success: function (response) {
                        location.reload();
                        /*window.location.href = "/admin/sent-mail";*/
                    },
                    error: function (xhr) {
                        //e.preventDefault();
                        alert('Error delete mail');
                    }
                });
            }

        });
    });

</script>
</body>

</html>