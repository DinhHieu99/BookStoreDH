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
<c:forEach var="rating" items="${rating}">
    <div class="col-md-12 row" style="margin: 15px 0;">
        <div class="comment-avatar col-md-1">
            <img src="${pageContext.request.contextPath}/img/${rating.avatar}" alt="lỗi" style="width: 45px; height: 45px"/>
        </div>
        <div class="comment col-md-11 rating-top sec">
            <div class="sec-top bg-gray" style="font-size:14px; font-weight: bold">${rating.fullName}
                <span> - <fmt:formatDate value="${rating.date}" pattern="dd/MM/yyyy"/></span>

                <span style="font-weight: bold;" onclick="hienThi('return-${rating.id}','block');">
                  -  Trả lời</span>

                <c:if test="${rating.idUser == idUser}">
                    <span style="font-weight: bold;" onclick="deleteComment(${rating.id})"> - Xóa
                    </span>
                </c:if>
                <br>
                <c:if test="${(rating.rating - 0)>0 }">
                    <i class="fa fa-star checked"></i>
                </c:if>
                <c:if test="${(rating.rating -1)>0 }">
                    <i class="fa fa-star checked"></i>
                </c:if>
                <c:if test="${(rating.rating -2)>0 }">
                    <i class="fa fa-star checked"></i>
                </c:if>
                <c:if test="${(rating.rating - 3)>0 }">
                    <i class="fa fa-star checked"></i>
                </c:if>
                <c:if test="${(rating.rating - 4)>0 }">
                    <i class="fa fa-star checked"></i>
                </c:if>
                <c:if test="${(rating.rating - 5)>0 }">
                    <i class="fa fa-star checked"></i>
                </c:if>
            </div>
            <div class="sec-top bg-gray">${rating.comment}</div>
        </div>
        <div class="commen-user container" id="return-${rating.id}" style="display: none;">
            <div class="row">
                <input type="hidden" id="comment_lv2_${rating.id}" value="${rating.id}">
                <input type="hidden" id="userId_lv2_${rating.id}" value="${idUser}">
                <div class="input-group w-100 col-md-9 col-9" style="padding:15px 0;">
                      <textarea type="text" id="comment_user_lv2_${rating.id}" class="form-control"
                                placeholder="bình luận" style="font-size:16px;max-height:80px;">${rating.fullName}</textarea>
                </div>
                <div class="input-group-append col-md-2 col-2"
                     style="padding-top:15px; padding-left: 0">
                    <input type="submit" id="commentlv2_${rating.id}" class="btn btn-info" value="Gửi"
                           style="max-height:80px;font-size:16px;padding: 15px 15px 18px; margin-left: 15px; "/>
                    <input type="button" id="deletelv2_${rating.id}" class="btn btn-info" value="Hủy"
                           style="max-height:80px;font-size:16px;padding: 15px 15px 18px; margin-left: 15px;" onclick="hienThi('return-${rating.id}','none')" />
                </div>
            </div>
        </div>

        <div id="comment2_show_${rating.id}" class="col-md-12"></div>
        <script>
            $.ajax({
                url: "${pageContext.request.contextPath}/comment/${rating.id}",
                type: "get",
                success: function (response) {
                    $("#comment2_show_${rating.id}").html(response);
                }
            });

            $("#commentlv2_${rating.id}").click(function (e) {
                e.preventDefault();

                var data = {
                    "comment": $("#comment_user_lv2_${rating.id}").val(),
                    "idUser": $('#userId_lv2_${rating.id}').val(),
                    "idProduct": ${rating.idProduct},
                    "idComment": $('#comment_lv2_${rating.id}').val()
                };

                $.ajax({
                    url: "/commentLv2",
                    type: "post",
                    contentType: "application/json", //dữ liệu được gửi lên web-service có dạng là json.
                    data: JSON.stringify(data), // object json -> string json

                    dataType: "json", // dữ liệu từ web-service trả về là json.
                    success: function (jsonResult) { // được gửi khi web-service trả về dữ liệu.
                        // load lại comment

                        document.getElementById("return-${rating.id}").style.display = 'none';
                        $.ajax({
                            url: "${pageContext.request.contextPath}/comment/${rating.id}",
                            type: "get",
                            success: function (response) {
                                $("#comment2_show_" +${rating.id}).html(response);
                            },
                            error: function (xhr) {
                                alert('Error comment lv 2')
                            }
                        });
                    }
                });
            });
        </script>
    </div>
</c:forEach>

