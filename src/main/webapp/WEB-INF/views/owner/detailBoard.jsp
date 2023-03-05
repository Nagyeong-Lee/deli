<%--
  Created by IntelliJ IDEA.
  User: 이나경
  Date: 2023-03-04
  Time: 오후 6:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>딜리 - 글 상세보기</title>
    <%@ include file="/WEB-INF/views/global/pc-commonLib.jsp" %>
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

</head>
<body>
<%@include file="/WEB-INF/views/customHeader/owner_nav.jsp" %>
<div class="container">
    <div class="title">
        ${detailBoard.b_seq}
        ${detailBoard.b_title}
        ${detailBoard.b_writer}
        ${detailBoard.b_contents}
        ${detailBoard.b_write_time}
        ${detailBoard.b_count}
        ${detailBoard.b_upd_time}
    </div>
    <div class="info"></div>
    <div class="content"></div>
    <div class="comment"></div>

    <div class="btns">
       <button type="button"><a href="/owner/community/delete?b_seq=${detailBoard.b_seq}">삭제하기</a></button>
        <button type="button">수정하기</button>
        <button type="button"><a href="/owner/community">목록으로</a></button>
    </div>
</div>
</body>
</html>
