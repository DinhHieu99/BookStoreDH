<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- Tich hop jstl vao jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/select2/css/select2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/summernote/css/summernote-bs4.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">
    <title>Soạn mail</title>
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
        <div class="container-fluid">
            <%@ include file="/WEB-INF/views/admin/ContactManagement/SendMail/menuEmail.jsp" %>
            <div class="main-content container-fluid p-0">
                <div class="email-head">
                    <div class="email-head-title">Soạn tin nhắn mới <span class="icon mdi mdi-edit"></span></div>
                </div>
                <%--<form modelAttribute="contact" data-parsley-validate=""
                      novalidate="" method="POST" action="/admin/sentMail">--%>
                <div class="email-compose-fields">
                    <div class="to">
                        <div class="form-group row pt-0">
                            <label class="col-md-1 control-label">Đến:</label>
                            <div class="col-md-11">
                                <input type="email" id="email" name="email" class="form-control"/>
                            </div>
                        </div>
                    </div>
                    <div class="to cc">
                        <div class="form-group row pt-2">
                            <label class="col-md-1 control-label">Tên:</label>
                            <div class="col-md-11">
                                <input type="text" id="fullName" name="fullName" class="form-control"/>
                            </div>
                        </div>
                    </div>
                    <div class="subject">
                        <div class="form-group row pt-2">
                            <label class="col-md-1 control-label">Chủ đề:</label>
                            <div class="col-md-11">
                                <input type="text" id="subject" name="subject" class="form-control"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="email editor">
                    <div class="col-md-12 p-0">
                        <div class="form-group">
                            <label class="control-label sr-only" >Nội dung </label>
                            <input class="form-control content summernote" rows="20" placeholder="Write Descriptions"></input>
                        </div>
                    </div>
                    <div class="email action-send">
                        <div class="col-md-12 ">
                            <div class="form-group">

                                <input class="btn btn-primary btn-space" id="mail" type="submit" value="Gửi"><i class="icon s7-mail"></i></input>
                                <a href="/admin/contacts">
                                <input class="btn btn-secondary btn-space" type="button" value="Hủy bỏ"><i class="icon s7-close"></i></input>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <%--</form>--%>
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
</div>
<!-- ============================================================== -->
<!-- end main wrapper -->
<!-- ============================================================== -->
<!-- Optional JavaScript -->
<script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/select2/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/summernote/js/summernote-bs4.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/js/main-js.js"></script>
<script>
    $(document).ready(function() {
        $('.summernote').summernote({
            height: 300

        });
    });
    $(document).ready(function() {
        $(function(){
            $('#mail').click(function(event){

                event.preventDefault();
                $.ajax({
                    url: '/admin/sentMail',
                    type: 'post',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        'fullName': $('#fullName').val(),
                        'email': $('#email').val(),
                        'feedback': $('.content').summernote('code'),
                        'subject': $('#subject').val()
                    }),
                    dataType: 'json',
                    success: function(response){
                        location.reload();
                    },
                    error: function (xhr) {
                        alert('Error send mail');
                    }
                });
            });
        });
    });
</script>
</body>

</html>