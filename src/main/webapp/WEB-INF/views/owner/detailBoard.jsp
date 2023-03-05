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

    <style>
        * {
            box-sizing: border-box;
        }

        .container {
            width: 1000px;
            margin-left: auto;
        }

        /*버튼*/
        .btns * {
            float: left;
        }

        /*댓글영역*/
        .comment {
            width: auto;
            height: 100px;
        }

        /*글 내용*/
        #content {
            height: 500px;
            width: 100%;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/views/customHeader/owner_nav.jsp" %>
<div class="container">
    <div class="title">
        제목 : <input type="text" disabled value="${detailBoard.b_title}">
    </div>
    <div class="info">
        작성자 : ${detailBoard.b_writer}<br>
        작성 시간 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                                value="${detailBoard.b_write_time}"/><br>
        조회수 : ${detailBoard.b_count}
        <c:if test="${detailBoard.b_upd_time != null}">
            수정 시간 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                                    value="${detailBoard.b_upd_time}"/>
        </c:if>
    </div>
    <div class="content">
        <input id="content" type="text" disabled value="${detailBoard.b_contents}">
    </div>
    <div class="comment">
        댓글 영역
    </div>

    <%--작성자==로그인 아이디 일때 삭제.수정 보여주기--%>
    <div class="btns">
        <c:if test="${detailBoard.b_writer eq nickname}">
            <button type="button"><a
                    href="/owner/community/delete?b_seq=${detailBoard.b_seq}">삭제하기</a></button>
            <button type="button">수정하기</button>
        </c:if>
        <button type="button"><a href="/owner/community">목록으로</a></button>
    </div>
</div>
</body>
</html>
