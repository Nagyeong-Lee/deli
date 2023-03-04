<%--
  Created by IntelliJ IDEA.
  User: 이나경
  Date: 2023-03-04
  Time: 오후 2:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>딜리 - 게시판 메인 페이지</title>
    <%@ include file="/WEB-INF/views/global/pc-commonLib.jsp" %>
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css"/>
    <script>
        $(function () {
            $("#myTable").DataTable();
        });
    </script>

    <style>
        #myTable *{
            cursor: pointer;
        }
        .container {
            text-align: center;
        }

        .modal {
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            display: none;
            cursor: pointer;
        }

        .modal_content {
            width: 400px;
            height: auto;
            background: #fff;
            border-radius: 10px;
            position: relative;
            top: 30%;
            left: 50%;
            margin-top: -150px;
            margin-left: -200px;
            text-align: center;
            box-sizing: border-box;
            padding: 74px 0 44px 0;
            cursor: pointer;
        }

        .closeBtn {
            position: relative;
            bottom: 40px;
            left: 155px
        }

        .modalInfo {
            margin: 5px 50px 5px 50px;
            text-align: left;
        }

        .modalInfo > input {
            width: 185px;
            border: none;
            background: none;
        }

        .modalTitle {
            display: inline-block;
            padding-left: 15px;
            width: 110px;
            font-weight: bold;
        }

        .btns {
            margin-top: 20px;
        }

        /*제목 길이 넘치는거 자름*/
        .title {
            overflow: hidden;
            white-space: nowrap;
            word-break: break-word;
            text-overflow: ellipsis;
            max-width: 270px;
        }
    </style>
</head>

<body>
<%@include file="/WEB-INF/views/customHeader/owner_nav.jsp" %>
<div class="container">
    <table id="myTable" class="display">

        <thead>
        <tr>
            <th>작성자</th>
            <th>게시글 제목</th>
            <th>작성일자</th>
            <th>수정일자</th>
            <th>조회수</th>
        </tr>
        </thead>

        <tbody>
        <c:if test="${not empty board_list}">
            <c:forEach var="i" items="${board_list}">
                <tr>
                    <td class="writer" id="b_writer">${i.b_writer}</td>
                    <td class="title" id="b_title">${i.b_title}</td>
                    <td class="write_time" id="b_write_time"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                                                                           value="${i.b_write_time}"/></td>
                    <td class="upd_time" id="b_upd_time"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                                                                       value="${i.b_upd_time}"/></td>
                    <td class="count" id="b_count">${i.b_count}</td>
                    <input type="hidden" id="b_seq" value="${i.b_seq}">
                    <input type="hidden" id="b_content" value="${i.b_contents}">
                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
    <br>
    <a href="/owner/community/writeForm">
        <button type="button" id="write_btn">글작성</button>
    </a>
</div>


<%--모달--%>
<form action="/owner/community/delete" id="frm">
    <div class="modal">
        <div class="modal_content">
            <div class="closeBtn"><i class="fa-solid fa-xmark fa-2xl"></i></div>
            <div class="modalInfo">
                <span class="modalTitle">작성자</span>
                <input type="text" placeholder="작성자" id="writer" class="writer" disabled>
            </div>
            <div class="modalInfo">
                <span class="modalTitle">게시글 제목</span>
                <input type="text" placeholder="게시글 제목" disabled id="title" class="title" disabled>
            </div>
            <div class="modalInfo">
                <span class="modalTitle">게시글 내용</span>
                <div id="content" class="content" disabled></div>
            </div>
            <div class="modalInfo">
                <span class="modalTitle">작성일자</span>
                <input type="text" placeholder="작성일자" disabled id="write_date" class="write_date">
            </div>
            <div class="modalInfo">
                <span class="modalTitle">수정일자</span>
                <input type="text" disabled id="modified_date" class="modified_date">
            </div>

            <div class="btns">
                <button type="button" id="deleteReview" class="deli_btn">삭제</button>
                <button type="button" id="privateReview" class="deli_btn">수정</button>
            </div>
        </div>
    </div>
</form>


<script>

    $(".closeBtn").click(function () {
        $(".modal").fadeOut();
    });
    trClickEvent();
    //페이지 버튼을 눌렀을때 다시 script 돌아가게
    $("#myTable_paginate").click(function () {
        trClickEvent();
    });

    function trClickEvent() {
        $("tr").click(function () { //클릭했을때 모달띄우기
            $("#writer").val($(this).find("#b_writer").html()); //작성자
            $("#title").val($(this).find("#b_title").html()); //제목
            $("#content").html($(this).find("#b_content").val()); //내용
            $("#write_date").val($(this).find("#b_write_time").html());//작성일자
            $("#modified_date").val($(this).find("#b_upd_time").html());//수정일자

            $(".modal").fadeIn();
        });
    };
</script>
</body>
</html>
