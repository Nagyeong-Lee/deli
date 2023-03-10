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

    <!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    <style>
        .container {
            margin: auto;
        }

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
        #b_contents {
            border: 1px solid black;
            height: 500px;
            width: 100%;
        }
    </style>

</head>
<body>
<%@include file="/WEB-INF/views/customHeader/owner_nav.jsp" %>

<%--작성자==로그인 아이디 일때 삭제.수정 보여주기--%>
<form action="/owner/community/update" id="frm" method="post">
    <div class="container">
        <input type="hidden" name="b_seq" id="b_seq" value="${detailBoard.b_seq}">
        <div class="title">제목 :
            <input type="text" id="b_title" name="b_title" value="${detailBoard.b_title}" readonly="readonly"></div>
        <div class="info">
            작성자 : ${detailBoard.b_writer}<br>
            조회수 : ${detailBoard.b_count}<br>
            작성 시간 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                                    value="${detailBoard.b_write_time}"/><br>
            <c:if test="${detailBoard.b_upd_time != null}">
                수정 시간 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                                        value="${detailBoard.b_upd_time}"/>
            </c:if>
        </div>
        <input id="b_contents" name="b_contents" value="${detailBoard.b_contents}"
               readonly="readonly">
        <div id="b_comments" name="b_comments">댓글영역</div>
        <div class="btns">
            <c:if test="${detailBoard.b_writer ne nickname}">
                <button type="button"><a href="/owner/community">목록으로</a></button>
            </c:if>
            <button type="button"><a href="/owner/community">목록으로</a></button>
            <button type="button"><a
                    href="/owner/community/delete?b_seq=${detailBoard.b_seq}">삭제하기</a></button>
            <button id="updBtn" type="button">수정하기</button>
        </div>
    </div>
</form>

<script>
    $("#updBtn").on("click", function () {
        $("#b_title").attr("readonly", false);
        $("#b_contents").attr("readonly", false);

        let completeUpdBtn = $("<button>수정완료</button>");
        $(".btns").append(completeUpdBtn);
        completeUpdBtn.attr("id", "completeUpd");
    });

    $("#completeUpd").on("click", function () {
        $("#frm").submit();
    });
</script>
</body>
</html>

