<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Hello, world!</title>
</head>
<body>
<div class="container-fluid">
    <div class="row">

        <div class="row content">
            <div class="col">
                <div class="card">
                    <div class="card-header">
                        등록하기
                    </div>
                    <div class="card-body">
                        <form id="registForm">
                            <div class="input-group mb-3">
                                <span class="input-group-text">글 제목</span>
                                <input type="text" name="title" class="form-control" placeholder="글 제목을 입력하세요">
                            </div>

                            <div class="input-group mb-3">
                                <span class="input-group-text">글 내용</span>
                                <input type="text" name="content" class="form-control" placeholder="글 내용을 입력하세요">
                            </div>


                            <div class="my-4">
                                <div class="float-end">
xit" class="btn btn-primary" id="regist">등록하기</button>
                                    <button type="button" class="btn btn-secondary" onclick="boardNumData()">목록으로</button>
                                </div>
                            </div>
                            <%--외래키로 연결된 세션 정보를 form으로 전송--%>
                            <input type="hidden" name="goods_id_t_shopping_goods" value="${goods_id}">
                            <input type="hidden" name="writer" value="${memberInfo.member_id}">
                        </form>

                        <script>
                            window.onload = function() {
                                console.log("레지스터 실행됨");
                            }

                            const serverValidResult = {}

                            <c:forEach items="${errors}" var="error">

                            serverValidResult['${error.getField()}'] = '${error.defaultMessage}'

                            </c:forEach>



                        </script>

                    </div>

                </div>
            </div>
        </div>

    </div>
    <div class="row content">
        <h1>Content</h1>
    </div>
    <div class="row footer">
        <!--<h1>Footer</h1>-->

        <div class="row   fixed-bottom" style="z-index: -100">
            <footer class="py-1 my-1 ">
                <p class="text-center text-muted">Footer</p>
            </footer>
        </div>

    </div>
</div>


</body>
</html>
<script>



</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
