<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- tích hợp JSTL vào trong JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<table class="table">
<thead class="bg-light">
    <tr class="border-0">
        <th class="border-0">Mã đơn hàng</th>
        <th class="border-0">Hình ảnh</th>
        <th class="border-0">Tên sản phẩm</th>
        <th class="border-0">Số lượng</th>
        <th class="border-0">Số lượng tồn</th>
        <th class="border-0">Giá bán</th>
        <th class="border-0">Thành tiền</th>
    </tr>
</thead>
<tbody >
<c:forEach var="product" items="${product}">
    <tr>
        <td>${product.id}</td>
        <td><a href="/admin/product-${product.id}" class="text-decoration-none">
            <img src="${pageContext.request.contextPath}/img/${product.imgProduct}" alt="user" class="rounded"
                 width="45"></a></td>
        <td><a href="/admin/product-${product.id}" class="text-decoration-none">${product.productName}</a></td>
        <td>${product.quantity}</td>
        <td>${product.quantityInStock}</td>
        <td><fmt:formatNumber value="${product.price}"/> đ</td>
        <td><fmt:formatNumber value="${product.money}"/> đ</td>
    </tr>
</c:forEach>
</tbody>
<tfoot class="bg-light">
<tr class="border-0">
    <th class="border-0">Mã đơn hàng</th>
    <th class="border-0">Hình ảnh</th>
    <th class="border-0">Tên sản phẩm</th>
    <th class="border-0">Số lượng</th>
    <th class="border-0">Số lượng tồn</th>
    <th class="border-0">Giá bán</th>
    <th class="border-0">Thành tiền</th>
</tr>
</tfoot>
</table>