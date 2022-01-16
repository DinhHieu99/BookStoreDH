<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- tích hợp JSTL vào trong JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:forEach var="product" items="${products}">
    <a href="/product/${product.id }/${product.urlName }">
        <div class="autocomplete-list">
            <img class="search-image"
                 src="${pageContext.request.contextPath}/img/${product.imgProduct}"
                 width="40px" height="40px">
            <div class="product-details">
                <div class="search-name">${product.name}</div>
                <span class="search-price"><fmt:formatNumber value="${product.discount}"/> đ</span>
                <del class="search-discount"><fmt:formatNumber value="${product.price}"/> đ</del>
            </div>
        </div>
    </a>
</c:forEach>
