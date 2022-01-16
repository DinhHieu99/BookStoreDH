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
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/select2/css/select2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/summernote/css/summernote-bs4.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
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
                <form modelAttribute="contact" data-parsley-validate=""
                      novalidate="" method="POST" action="/admin/sendFeedback">
                    <div class="email-compose-fields">
                        <div class="to">
                            <input name="id" type="hidden" value="${contact.id}"/>
                            <div class="form-group row pt-0">
                                <label class="col-md-2 control-label">Đến:</label>
                                <div class="col-md-10">
                                    <input name="email" type="email" value="${contact.email}"
                                           class="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="to cc">
                            <div class="form-group row pt-2">
                                <label class="col-md-2 control-label">Tên người gửi:</label>
                                <div class="col-md-10">
                                    <input name="fullName" type="text" required="" class="form-control"
                                           value="${contact.fullName}"/>
                                </div>
                            </div>
                        </div>
                        <div class="subject">
                            <div class="form-group row pt-2">
                                <label class="col-md-2 control-label">Chủ đề</label>
                                <div class="col-md-10">
                                    <input name="subject" type="text" class="form-control" value="${contact.subject}"/>
                                </div>
                            </div>
                        </div>
                        <div class="content">
                            <div class="form-group row pt-2">
                                <label class="col-md-2 control-label">Người dùng phản hồi</label>
                                <div class="col-md-12">
                                    <textarea class="form-control summernote">${contact.content}</textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="email editor">
                        <div class="col-md-12 p-0">
                            <div class="form-group">
                                <label class="col-md-4 control-label">Nội dung phản hồi</label>
                            </div>
                        </div>
                        <div class="col-md-12 p-0">
                            <div class="form-group">
                                <label class="control-label sr-only" >Mô tả </label>
                                <textarea class="form-control summernote" name="feedback" rows="6"
                                          placeholder="Write Descriptions">${contact.feedback}</textarea>
                            </div>
                        </div>
                        <div class="email action-send">
                            <div class="col-md-12 ">
                                <div class="form-group">
                                    <button class="btn btn-primary btn-space" type="submit"><i class="icon s7-mail"></i>
                                        Gửi
                                    </button>
                                    <button class="btn btn-secondary btn-space" type="button"><i
                                            class="icon s7-close"></i> Hủy bỏ
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
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
    $(document).ready(function () {
        $('.summernote').summernote({
            height: 200
        });
    });
</script>
</body>

</html>