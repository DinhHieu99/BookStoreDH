<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- Tich hop jstl vao jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/font/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/webstore.css">

    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">
    <title>Error</title>
</head>
<body class="font">
<!-- header -->
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<!-- header -->
<div class="main">
    <c:if test="${message != null}">
        <h1 style="text-align: center;font-family: 'Times New Roman'; margin: 30px">${message}</h1>
    </c:if>
    <c:if test="${message == null}">
        <h1 style="text-align: center;font-family: 'Times New Roman';">Đường dẫn này không tồn tại</h1>
        <h1 style="text-align: center;font-family: 'Times New Roman';">The requested URL [URL] was not
            found on this server</h1>
        <br><br><br><br>
        <p style="text-align: center;font-size: 100px">403</p>
        <br><br><br><br><br><br>
    </c:if>

</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</body>
</html>