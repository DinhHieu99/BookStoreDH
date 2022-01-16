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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/summernote/css/summernote-bs4.css">
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">

    <title>Liên hệ</title>
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
                    <li>Liên hệ</li>
                </ul>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="page-content">
                            <h5>Liên hệ với chúng tôi</h5>
                            <!-- End .widget-title -->
                            <ul class="menu" style="list-style: none;">
                                <li><i class="fa fa-map-marker" aria-hidden="true"></i>Trường đại học công nghiệp Hà Nội
                                </li>
                                <li><i class="fa fa-phone" aria-hidden="true"></i> <a href="#">0123 456
                                    789</a></li>
                                <li><i class="fa fa-envelope" aria-hidden="true"></i> <a href="#">contact@yourdomain.com</a>
                                </li>
                            </ul>
                            <!-- End .widget-menu -->
                        </div>
                        <div class="box-maps col-md-12 col-12">
                            <iframe src="https://www.google.com/maps/place/Ti%C3%AAu+S%C6%A1n,+T%C6%B0%C6%A1ng+Giang,+Tx.+T%E1%BB%AB+S%C6%A1n,+B%E1%BA%AFc+Ninh,+Vi%E1%BB%87t+Nam/@21.1352324,105.990547,18z/data=!3m1!4b1!4m5!3m4!1s0x3135088ae5e3c909:0xee6cc8dea21e2a1d!8m2!3d21.1350595!4d105.9927564?hl=vi-VN"
                                    height="600px" frameborder="0" allowfullscreen></iframe>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-content-login">
                            <h3 class="text-center">Thông tin liên hệ</h3>
                            <span class="text-center block"></span>

                            <div class="email-compose-fields">
                                <div class="to">

                                    <input id="avatar" type="hidden" value="${user.avatar}"/>
                                    <div class="form-group row pt-0">
                                        <label class="col-md-2 control-label">Địa chỉ email:</label>
                                        <div class="col-md-10">
                                            <input id="email" type="email" value="${user.email}" class="form-control" required/>
                                        </div>
                                    </div>
                                </div>
                                <div class="to cc">
                                    <div class="form-group row pt-2">
                                        <label class="col-md-2 control-label">Tên người gửi:</label>
                                        <div class="col-md-10">
                                            <input id="fullName" type="text" required="" class="form-control"
                                                   value="${user.name}"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="subject">
                                    <div class="form-group row pt-2">
                                        <label class="col-md-2 control-label">Chủ đề:</label>
                                        <div class="col-md-10">
                                            <input id="subject" type="text" class="form-control" required/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="email editor">
                                <div class="col-md-12 p-0">
                                    <div class="form-group">
                                        <label class="control-label sr-only">Nội dung: </label>
                                        <textarea class="form-control content" id="summernote" rows="6"
                                                  placeholder="Viết nội dung"></textarea>
                                    </div>
                                </div>
                                <div class="email action-send">
                                    <div class="col-md-12 ">
                                        <div class="form-group">
                                            <button class="btn btn-success" type="submit" id="mail">
                                                <i class="icon s7-mail"></i> Gửi
                                            </button>
                                            <button class="btn btn-danger" type="button"><i
                                                    class="icon s7-close"></i> Hủy bỏ
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--</form>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--footer-->
    <%@ include file="/WEB-INF/views/layout/footer.jsp" %>
    <!--footer-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/webstore.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/summernote/js/summernote-bs4.js"></script>

    <script>
        $(document).ready(function() {
            $('#summernote').summernote({
                height: 300

            });
        });
        $(document).ready(function() {
            //$('.js-example-basic-multiple').select2({ tags: true });

            $(function(){
                $('#mail').click(function(event){

                    //event.preventDefault();
                    var result = confirm("Bạn có chắc gửi phản hồi này lên hệ thống không?");
                    if(result == true){
                        $.ajax({
                            url: '/sendMail',
                            type: 'post',
                            contentType: 'application/json',
                            data: JSON.stringify({
                                'fullName': $('#fullName').val(),
                                'email': $('#email').val(),
                                'content': $('.content').summernote('code'),
                                'subject': $('#subject').val(),
                                'avatar': $('#avatar').val()
                            }),
                            dataType: 'json',
                            success: function(response){
                                location.reload();
                            },
                            error: function (xhr) {
                                alert('Error send contact');
                            }
                        });
                    }
                    else{
                        alert("Bạn đã hủy phản hồi");
                    }

                });
            });
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
        });
    </script>
</body>

</html>