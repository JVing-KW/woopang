<%@ page import="com.standout.woopang.springex.dto.PageResponseDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Hello, world!</title>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- 기존의 <h1>Header</h1> -->
        <div class="row">
            <div class="col">

            </div>
        </div>
        <!-- header end -->
        <!-- 기존의 <h1>Header</h1>끝 -->
        <div class="row content">
            <div class="col">
                <div class="card">

                </div>

            </div>
        </div>

        <div class="row content">
            <div class="col">
                <div class="card">
                    <div class="card-header">
                        한줄평가
                    </div>
                    <div class="card-body">
<%--                        <h5 class="card-title">한줄평가</h5>--%>
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">제목</th>
                                <th scope="col">글 내용</th>
                                <th scope="col">작성자</th>
                                <th scope="col">등록일자</th>
<%--                                <th scope="col">답변여부</th>--%>
                            </tr>
                            </thead>
                            <tbody id="boardData">
                            <c:forEach items="${responseDTO.dtoList}" var="dto">
                                <tr>
                                    <th scope="row"><c:out value="${dto.tnoNumber}"/></th>
                                    <td>
                                        <a href="/todo/read?tno=${dto.tnoNumber}&${pageRequestDTO.link}"
                                           class="text-decoration-none" data-tno="${dto.tnoNumber}">
                                            <c:out value="${dto.title}"/>
                                        </a>
                                    </td>
                                    <td><c:out value="${dto.content}"/></td>
                                    <td><c:out value="${dto.writer}"/></td>
                                    <td><c:out value="${dto.dueDate}"/></td>
<%--                                    <td><c:out value="${dto.finished}"/></td>--%>
                                </tr>
                            </c:forEach>


                            </tbody>
                        </table>

                        </table>
                        <button id="register" class="btn btn-primary" name="register">등록하기</button>


                        <div class="float-end">
                            <ul class="pagination flex-wrap" id="boardDataNum">


                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="row content">
    </div>
    <div class="row footer">
        <!--<h1>Footer</h1>-->

        <div class="row fixed-bottom" style="z-index: -100">
            <footer class="py-1 my-1 ">
                <p class="text-center text-muted">Footer</p>
            </footer>
        </div>

    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>