<%--
  Created by IntelliJ IDEA.
  User: 이나경
  Date: 2022-12-13
  Time: 오전 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>딜리 - 운영자 리뷰관리</title>

    <%@ include file="/WEB-INF/views/global/pc-commonLib.jsp" %>

    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
    <link rel="stylesheet" href="/resources/css/admin/reviewMng.css">

</head>
<body>
<%@ include file="/WEB-INF/views/customHeader/admin_nav.jsp" %>
<style>
    #deli_nav {
        min-height: 1700px;
    }
</style>
<main id="review_mng">

    <div id="container">
        <table id="myTable" class="display">
            <thead>
            <tr>
                <th>작성자</th>
                <th>리뷰내용</th>
                <th>상호명</th>
                <th>작성일자</th>
                <th>수정일자</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${not empty nev_list}">
                <c:forEach var="store" items="${nev_list}">
                    <tr>
                        <td class="mem_name">${store.mem_nick}</td>
                        <td class="rev_content rev">${store.rev_content}</td>
                        <td class="store_name">${store.store_name}</td>
                        <td class="rev_writedate">
                            <fmt:parseDate value="${store.rev_writedate}" var="registered"
                                           pattern="yyyy-MM-dd HH:mm:ss"/>
                            <fmt:formatDate value="${registered}" pattern="yyyy-MM-dd"/>
                            <input id="formed_rev_writedate" class="formed_rev_writedate"
                                   type="hidden" value= <fmt:formatDate value="${registered}" pattern="yyyy-MM-dd"/>>
                        </td>

                        <input type="hidden" value="${store.rev_display}" class="rev_display">
                        <input type="hidden" value="${store.rev_seq}" class="rev_seq">
                        <input type="hidden" value="${store.rev_star}" class="rev_star">

                        <c:choose>
                            <c:when test="${store.rev_modified_date!=null}">
                                <td class="rev_modified_date">
                                    <fmt:parseDate value="${store.rev_modified_date}" var="registered"
                                                   pattern="yyyy-MM-dd HH:mm:ss"/>
                                    <fmt:formatDate value="${registered}" pattern="yyyy-MM-dd"/>

                                    <input id="formed_rev_modified_date" class="formed_rev_modified_date"
                                           type="hidden" value=<fmt:formatDate value="${registered}"
                                                                               pattern="yyyy-MM-dd"/>>
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td></td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
    </div>


    <%--모달--%>
    <form action="/admin/review/deleteReview" id="frm">
        <div class="modal">
            <div class="modal_content">
                <div class="closeBtn"><i class="fa-solid fa-xmark fa-2xl"></i></div>
                <div class="modalInfo">
                    <span class="modalTitle">작성자</span>
                    <input type="text" placeholder="작성자" id="writer" class="writer" disabled>
                </div>
                <div class="modalInfo">
                    <span class="modalTitle">별점</span>
                    <input type="text" placeholder="별점" disabled id="star" class="star" disabled>
                </div>
                <div class="modalInfo">
                    <span class="modalTitle">리뷰내용</span>
                    <div id="review_content" class="review_content" disabled></div>
                </div>
                <div class="modalInfo">
                    <span class="modalTitle">작성일자</span>
                    <input type="text" placeholder="작성일자" disabled id="write_date" class="write_date">
                </div>
                <div class="modalInfo">
                    <span class="modalTitle">수정일자</span>
                    <input type="text" placeholder="수정일자없음" disabled id="modified_date" class="modified_date">
                </div>
                <div class="modalInfo">
                    <span class="modalTitle">리뷰번호</span>
                    <input type="text" placeholder="리뷰번호" id="rseq" class="rseq" name="rev_seq">
                </div>

                <div class="btns">
                    <button type="button" id="deleteReview" class="deli_btn">삭제</button>
                    <button type="button" id="privateReview" class="deli_btn">비공개</button>
                    <button type="button" id="openReview" class="deli_btn">공개</button>
                </div>
            </div>
        </div>
    </form>

</main>
<script src="/resources/js/admin/reviewMng.js"></script>
</body>
</html>


<%--리뷰 공개 비공개 여부, 리뷰 삭제는 ajax로 처리--%>