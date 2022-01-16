<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- tích hợp JSTL vào trong JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .comment i {
        font-size: 12px;
    }

    .comment .sec-top {
        border: 1px solid #eee;
    }
</style>
<c:forEach var="rating" items="${rating2}">
    <div class="col-md-12 row" style="margin: 15px 0;">
        <div class="comment-avatar col-md-1">
            <img src="${pageContext.request.contextPath}/img/${rating.avatar}" alt="lỗi"
                 style="width: 45px; height: 45px"/>
        </div>
        <div class="comment col-md-11 rating-top sec">
            <div class="sec-top bg-gray" style="font-size:14px; font-weight: bold">${rating.fullName}
                <span> - <fmt:formatDate value="${rating.date}" pattern="dd/MM/yyyy"/></span>
                <span style="font-weight: bold;" onclick="hienThi('return-${rating.id}','block');">
                  -  Trả lời</span>
            </div>
            <div class="sec-top bg-gray">${rating.comment}</div>
        </div>
    </div>
</c:forEach>

