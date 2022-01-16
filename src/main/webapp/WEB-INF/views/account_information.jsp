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
    <meta name="keyword" content="HTML, CSS, JavaScript, Java, Spring, MySql, Maven, Bootstrap, JQuery"/>
    <meta name="author" content="HieuNguyen">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/font/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/webstore.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">

    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">

    <title>Thông tin tài khoản</title>

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
                    <a href="/"> <span><i
                            class="fa fa-home"></i> Trang chủ</span>
                    </a> <span><i class="fa">/&nbsp;</i></span></li>
                <li>
                    <a href="#"> <span>Tài khoản</span>
                    </a> <span><i class="fa">/&nbsp;</i></span></li>
                <li>
                    <a href="#"> <span>Thông tin tài khoản</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="content">
        <div class="wrapper-tab row">
            <c:if test="${not empty message }">
                <%--<script>
                    alert(${messageAlert})
                </script>--%>
                    <div class="col-sm-12 alert alert-${alert}">
                        <strong>${messageAlert}</strong>
                    </div>
            </c:if>
            <h2 class="col-md-12">Thông tin tài khoản</h2>
            <div class="col-md-3 col-3">
                <img class="avatar" src="${pageContext.request.contextPath}/img/${account.avatar}" alt="Ảnh đại diện"/>

            </div>
            <div class="col-md-8 required">

                <form action="/edit_account_information" method="post"
                      enctype="multipart/form-data" modelAttribute="user">

                    <fieldset>
                        <legend style="width: auto;">Chi tiết tài khoản</legend>

                        <input type="hidden" name="id" value="${account.id}"/>

                        <div class="form-group required">
                            <label class="control-label col-md-2 ">Họ & Tên</label>
                            <div class="col-md-10">
                                <input type="text" name="name" value="${account.name}" placeholder="Họ & Tên"
                                       class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label col-md-2 ">Avatar</label>
                            <div class="col-md-10">
                                <img src="" alt="" width="auto" height="300px" id="avatar" style="float: left;display: none;">
                                <input type="file" placeholder="Đổi ảnh" class="form-control" name="image"
                                       class="form-control" onchange="chooseFile(this)"/>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label col-md-2">Email</label>
                            <div class="col-md-10">
                                <input type="email" name="email" value="${account.email}" placeholder="Email"
                                       class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label col-md-2">Điện thoại</label>
                            <div class="col-md-10">
                                <input type="tel" name="mobile" value="${account.mobile}" placeholder="Điện thoại"
                                       class="form-control"/>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset id="address">
                        <legend>Địa chỉ</legend>
                        <div class="form-group required">
                            <label class="control-label col-md-2">Địa chỉ</label>
                            <div class="col-md-10">
                                <input type="text" name="address" value="${account.address}" placeholder="Địa chỉ"
                                       class="form-control"/>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
                        <legend>Mật khẩu</legend>
                        <div class="form-group required">
                            <label class="control-label col-md-3">Mật khẩu</label>
                            <div class="col-md-9">
                                <input type="password" name="password" value="" placeholder="Mật khẩu"
                                       data-parsley-maxlength="6" minlength="6" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label col-md-3">Mật khẩu mới</label>
                            <div class="col-md-9">
                                <input type="password" value="" id="pass" data-parsley-maxlength="6" minlength="6"
                                       placeholder="Không nhập vào mục này nếu không thay đổi password"
                                       name="passwordNew" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label col-md-3">Mật khẩu xác nhận</label>
                            <div class="col-md-9">
                                <input type="password" value="" id="pass1" name="confimPassword" class="form-control"
                                       data-parsley-maxlength="6" minlength="6"
                                       placeholder="Không nhập vào mục này nếu không thay đổi password"/>
                            </div>
                            <p class="col-md-10" id='message'></p>
                        </div>

                    </fieldset>

                    <input type="submit" value="Cập nhật" name="register" class="btn btn-primary"/>
                </form>
            </div>
        </div>
    </div>
</div>

<!--footer-->
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
<!-- footer -->

<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/js/webstore.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<c:if test="${not empty message }">
    <script>
        alert(${messageAlert})
    </script>
<%--    <div class="col-sm-12 alert alert-${alert}">--%>
<%--        <strong>${messageAlert}</strong>--%>
<%--    </div>--%>
</c:if>
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

    function chooseFile(fileInput){
        $('#avatar').show();
        if(fileInput.files && fileInput.files[0]){
            var reader = new FileReader();

            reader.onload = function(e){
                $("#avatar").attr('src', e.target.result);
            }
            reader.readAsDataURL(fileInput.files[0]);
        }
    }

    $('#pass, #pass1').on('keyup', function () {
        if ($('#pass').val() == '' || $('#pass1').val() == '') {
            $('#message').html('');
        } else if ($('#pass').val() == $('#pass1').val()) {
            $('#message').html('Đúng mật khẩu').css('color', 'green');
        } else
            $('#message').html('Sai mật khẩu').css('color', 'red');
    });
</script>
</body>

</html>