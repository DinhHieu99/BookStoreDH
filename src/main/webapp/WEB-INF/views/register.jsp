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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/font/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/webstore.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">


    <!-- icon trang thẻ web-->
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">
    <!-- icon trang thẻ web-->

    <title>Đăng Ký</title>
</head>

<body class="font">

    <!-- header -->
    <%@ include file="/WEB-INF/views/layout/header.jsp" %>
    <!-- header -->

    <!--content-->
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
                    <a href="javascript:void(0)">
                        <span>Tài khoản</span>
                    </a>
                    <span><i class="fa">/&nbsp;</i></span>
                </li>
                <li>
                    <a href="#">
                        <span>Đăng ký</span>
                    </a>
                </li>
            </ul>
        </div>
        <div class="content">
            <div class="wrapper-tab row">
                <h2>Đăng ký tài khoản</h2>
                <h6>Nếu bạn đã đăng ký tài khoản với chúng tôi, vui lòng đăng
                    nhập.</h6>
                <div class="col-sm-12 required">
                    <form name="register" class="form-group" action="/user/register"
                          modelAttribute="register" method="POST">
                        <fieldset>
                            <legend>Chi tiết tài khoản</legend>
                            <div class="form-group required">
                                <label class="control-label col-sm-2 ">Họ & Tên</label>
                                <div class="col-sm-10">
                                    <input type="text" name="name" value="" placeholder="Họ & Tên"
                                           class="form-control" required=""/>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="control-label col-sm-2">Email</label>
                                <div class="col-sm-10">
                                    <input type="email" name="email" value="" placeholder="Email" id="input-email"
                                           class="form-control" required=""/>
                                    <p style="color: red; font-size: 12px; text-align: left"
                                       id="CheckEmail"></p>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="control-label col-sm-2">Điện thoại</label>
                                <div class="col-sm-10">
                                    <input type="tel" name="mobile" required=""
                                           placeholder="Điện thoại" class="form-control" />
                                </div>
                            </div>
                        </fieldset>
                        <fieldset id="address">
                            <legend>Địa chỉ</legend>

                            <div class="form-group required">
                                <label class="control-label col-sm-2">Địa chỉ</label>
                                <div class="col-sm-10">
                                    <input type="text" name="address" required="" placeholder="Địa chỉ"
                                           class="form-control" />
                                </div>
                            </div>
                        </fieldset>
                        <fieldset>
                            <legend>Mật khẩu</legend>
                            <div class="form-group required">
                                <label class="control-label col-sm-2">Mật khẩu</label>
                                <div class="col-sm-10">
                                    <input type="password" name="password" required="" id="pass"
                                           placeholder="Mật khẩu" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="control-label col-sm-2">Mật khẩu xác nhận</label>
                                <div class="col-md-10">
                                    <input type="password" value="" placeholder="Mật khẩu xác nhận" id="pass1"
                                           name="confimPassword" class="form-control" required=""/>
                                    <p style="color: red; font-size: 12px; text-align: left"
                                       id="CheckPasswordMatch"></p>
                                </div>
                            </div>
                        </fieldset>
                        <button type="submit" id="register" class="btn btn-success">Đăng ký</button>
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
    <script>
        function checkPasswordMatch() {
            var password = $("#pass").val();
            var confirmPassword = $("#pass1").val();

            if(confirmPassword == null){
                $("#CheckPasswordMatch").hide();
            }

            if (password != confirmPassword) {
                if (confirmPassword != '')
                    $("#CheckPasswordMatch").html("Passwords không đúng!");
                document.getElementById("Save").disabled = true;
            }
            else {
                $("#CheckPasswordMatch").html("Passwords phù hợp.");
                document.getElementById("CheckPasswordMatch").style.color = 'green';
                document.getElementById("Save").disabled = false;
            }
        }
        $(document).ready(function() {
            $("#pass1").keyup(checkPasswordMatch);
            $("#pass").keyup(checkPasswordMatch);
        });

        $(document).ready(function () {
            $("#searchProduct").keyup(function () {
                var nameProductSearch = document.getElementById("searchProduct").value;
                if(nameProductSearch.length > 0){
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
                }else{
                    document.getElementById("resultLivingSearch").style.display = 'none';
                }

            });
            $('#input-email').keyup(checkEmail);

        });
        function checkEmail(){
            var email = $('#input-email').val();
            if(email.indexOf('.com') <= 0){
                document.getElementById("register").disabled = true; // bật disabled
                document.getElementById("CheckEmail").style.color = 'red';
                $("#CheckEmail").html("Email không phù hợp.");
            }else {
                document.getElementById("register").disabled = false;

                $("#CheckEmail").html("Email phù hợp.");
                document.getElementById("CheckEmail").style.color = 'green';
            }
        }
    </script>
</body>

</html>