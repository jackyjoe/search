<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="zh_CN">
    <meta charset="UTF-8">
    <title>结果->火星医疗搜索</title>
    <meta name="keywords" content="火星搜索 医疗搜索 医疗搜索引擎 搜索引擎 良心医疗 良医搜索 良医 明医 明医搜索  医疗垂直搜索 疾病搜索 疾病" />
    <meta name="description" content="火星医疗搜索是一个专注于医疗搜索的搜索引擎" />
    <link rel="shortcut icon" href="static/img/favicon.ico"/>
    <link rel="stylesheet" href="static/lib/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/base.css">
    <style>
        .s_result{
            margin-bottom: 1em;
        }
        .s_result .s_title {
            text-decoration: underline;
            color: #0000CC;
            font-size: 1.0em;
        }

        .s_result b {
            color: red;
            font-weight: normal;
        }

        .s_result .s_url {
            color: #008000;
            font-size: 0.70em;
        }

        .s_result .s_content {
            color: black;
            font-size: 0.65em;
        }

        .s_result .s_content p {
            float: left;
            display: inline-block;
        }

        .s_result img {
            float: left;
            max-width: 50px;
            max-height: 120px;
            margin-right: 0.5em;
        }

        .search_form {
            margin-top: 3em;
        }

        .search_form .title {
            font-size: 2.0em;
        }

        .search_form .input .input-group {
            margin-left: 3em;
        }
        .s_body{
            margin-top: 2em;
            margin-left: 3em;
        }

        #input{
            padding-bottom: 0;
            padding-top: 0;
        }
        .sug_menu {
            list-style: none;
            font-size: 14px;
            line-height: 27px;
            padding: 0px 0;
            position: absolute;
            display: none;
            z-index: 3;
            background-color: white;
        }

        .sug_menu li {
            cursor: pointer;
            zoom: 1;
            position: relative;
            height: auto;
            text-align: left;
            padding: 5px 12px;
            margin: 0px 0;
        }

        .sug_menu li:hover, .sug_menu .active{
            background: #f3f3f3;
        }
    </style>
</head>
<body>
<div class="container-fluid">

    <div class="header">
        <div class="left col-xs-3 col-sm-3">
            <a href="/"><i class="fa fa-home" aria-hidden="true"></i>火星医疗搜索</a>
        </div>
    </div>

    <div class="text-center span5 search_form">
        <div class="input">
            <form name="search" action="s" method=get id="search">
                <div class="input-group col-xs-7 col-sm-5 col-md-3">
                    <input type="text" autocomplete="off" id="input" class="form-control" name="k" value="${k}" aria-label="..." placeholder="请输入搜索词">

                    <div class="input-group-btn">
                        <button class="btn btn-success" id="btn">搜索</button>
                    </div>
                    <ul class="sug_menu" id="sug_menu">

                    </ul>
                </div>

            </form>

        </div>
    </div>

    <div class="s_body">
        <c:choose>
            <c:when test="${pagination.pageList !=null &&  pagination.pageList.size()>0}">
                <c:forEach items="${pagination.pageList}" var="result">
                    <div class="s_result">
                        <div class="s_title"><a href="${result.url}" target="_blank">${result.title}</a></div>
                        <div class="s_url">${result.formattedUrl}</div>
                        <div class="s_content">
                            <c:if test="${result.richSnippet.cseImage != null}">
                                <img src="${result.richSnippet.cseImage.src}">
                            </c:if>
                            <p>${result.content}</p>
                            <div style=" clear:both; "></div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:when test="${pagination.pageList.size()==0}">
                <div class="s_result">
                    请输入关键词
                </div>
            </c:when>
            <c:otherwise>
                <div class="s_result">
                   抱歉！没有找到关于"${k}"的相关网页
                </div>
            </c:otherwise>
        </c:choose>


            <nav>
            <ul class="pagination col-xs-12 col-sm-9">
                <li class="${pagination.hasPrePage==true? "":"disabled"}">
                    <a href="s?k=${k}&p=${pagination.currentPage-1}" aria-label="Previous">
                        <span aria-hidden="true">上一页</span>
                    </a>
                </li>
                <c:forEach var="i" begin="1" end="10" >
                    <li class='${pagination.currentPage== i ?"active":""}'><a href="s?k=${k}&p=${i}">${i}</a></li>
                </c:forEach>
                <li class="${pagination.hasNextPage==true? "":"disabled"}">
                    <a href="s?k=${k}&p=${pagination.currentPage+1}" aria-label="Next">
                        <span aria-hidden="true">下一页</span>
                    </a>
                </li>
            </ul>
            </nav>

           
    </div>
    <div class="footer">
        <p class="text-center">声明：本站搜索结果来自Google自定义搜索，不存储任何网站内容，只提供信息检索服务。如果有侵犯的地方，联系我们及时整改。</p>
        <p class="text-center">Copyright © 2016 维护@XM All Rights Reserved</p></span>
    </div>
</div>
<script src="static/lib/js/jquery-2.2.4.min.js"></script>
<script src="static/lib/js/jquery.watch.js"></script>
<script src="static/js/base.js?v=2"></script>
</body>
</html>