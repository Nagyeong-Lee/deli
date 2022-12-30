<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>딜리 - 장바구니</title>
    <%@ include file="/WEB-INF/views/global/m-commonLib.jsp" %>

    <link rel="stylesheet" href=" /resources/css/member/order/basket.css" type="text/css">

</head>
<body>
    <%@ include file="/WEB-INF/views/customHeader/m_back.jsp" %>
    <%@ include file="/WEB-INF/views/customHeader/m_home.jsp" %>
<main id="basket">
    <div class="container">

        <div class="titleBox">
            장바구니
        </div>
        <c:choose>
            <c:when test="${not empty basket}">
                <input type="hidden" id="storeSeq" value="${store.store_seq}">
                <input type="hidden" id="minPrice" value="${store.store_min_price}">
                상호명 : ${store.store_name}<br>
                <img src="/resources/img/store/${store.store_logo}">
                <hr>
                <hr>
                <c:forEach var="menuList" items="${basket}">
                    <div class="menuBox">
                        <button class="deleteBtn">X</button><br>
                        메뉴 SEQ : ${menuList.menuDTO.menu_seq}<br>
                        <input type="hidden" class="inputMenuSeq" value="${menuList.menuDTO.menu_seq}">
                        메뉴명 : ${menuList.menuDTO.menu_name}<br>
                        메뉴 가격 : <span class="menuPrice">${menuList.menuDTO.menu_price}</span><br>
                        메뉴 이미지 : ${menuList.menuDTO.menu_img}<br>
                        <br>
                        <c:forEach var="optionMap" items="${menuList.menuOptionDTO}" varStatus="i">
                            - 옵션 메뉴 SEQ : ${optionMap.menu_seq}<br>
                            - 옵션 SEQ : ${optionMap.option_seq}<br>
                            <input type="hidden" class="inputOptionSeq" value="${optionMap.option_seq}">
                            - 옵션 그룹 : ${optionMap.option_group}<br>
                            - 옵션명 : ${optionMap.option_name}<br>
                            - 옵션 가격 : <span class="optionPrice op${i.count}">${optionMap.option_price}</span><br>
                            <br>
                        </c:forEach>
                        <br>
                        <div class="priceBox">
                            <span class="priceSpan">${menuList.price}</span>원
                        </div>
                        <div class="countBox">
                            <button class="minus">-</button>
                            수량 : <span class="countSpan">${menuList.count}</span>개
                            <button class="plus">+</button>
                        </div>
                        <hr>
                    </div>
                </c:forEach>
                <hr>
                총 주문금액 : <span id="totalPriceSpan">${totalPrice}</span>원<br>
                배달팁 : <span id="deliTipSpan">${store.store_deli_tip}</span>원
                <hr>
                결제예정금액 : <span id="payAmountSpan">${payAmount}</span>원

                <div class="buttonBox">
                    <form id="payment">
                        <input type="hidden" id="payAmount" name="payAmount" value="">

                        <a href="/order/orders/">
                            <button type="button" id="pay">
                                <span id="countPB">${totalCount}</span>
                                배달 주문하기
                                <span id="totalPB">${payAmount}</span>원
                            </button>
                        </a>
                    </form>
                </div>
            </c:when>
            <c:otherwise>
                너가 담은게 없어요
            </c:otherwise>
        </c:choose>

    </div>









    <script src="/resources/js/member/order/basket.js"></script>
</main>
</body>
</html>
