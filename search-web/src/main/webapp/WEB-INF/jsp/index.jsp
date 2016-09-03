<%--
  Created by IntelliJ IDEA.
  User: XMH
  Date: 2016/5/22
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="zh_CN">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>火星医疗搜索</title>
    <meta name="keywords" content="火星搜索 医疗搜索 医疗搜索引擎 搜索引擎 良心医疗 良医搜索 良医 明医 明医搜索  医疗垂直搜索 疾病搜索 疾病" />
    <meta name="description" content="火星医疗搜索是一个专注于医疗搜索的搜索引擎" />
    <link rel="shortcut icon" href="static/img/favicon.ico"/>
    <link rel="stylesheet" href="static/lib/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/base.css?v=1">

    <style>
        .search_form {
            margin-top: 10%;
            color: rgb(51, 51, 51);
        }

        .search_form .title {
            font-size: 2.0em;
        }

        .center {
            margin-left: auto;
            margin-right: auto;
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
        <div class="left">
            <a href="/"><i class="fa fa-home" aria-hidden="true"></i>火星医疗搜索</a>
        </div>
    </div>

   <div id="body">

       <div class="text-center span5 search_form">
           <P class="title"><i class="fa fa-search" aria-hidden="true"></i>火星医疗搜索</P>

           <div class="row input">
               <form name="search" action="s" method=get id="search">
                   <div class="input-group center col-xs-10 col-sm-5 col-md-3">
                       <input type="text" autocomplete="off" class="form-control" id="input" name="k" aria-label="..." placeholder="请输入搜索词">

                       <div class="input-group-btn">
                           <button class="btn btn-success" id="btn">搜索</button>
                       </div>
                       <ul class="sug_menu" id="sug_menu">

                       </ul>
                   </div>
               </form>

           </div>
       </div>
   </div>

    <div class="footer">
        <p class="text-center">声明：本站搜索结果来自Google自定义搜索，不存储任何网站内容，只提供信息检索服务。如果有侵犯的地方，联系我们及时整改。</p>

        <p class="text-center">Copyright © 2016 维护@XM All Rights Reserved</p></span>
    </div>
</div>
</div>
<script src="static/lib/js/jquery-2.2.4.min.js"></script>
<script src="static/lib/js/jquery.watch.js"></script>
<script src="static/js/base.js"></script>
<script>

</script>
</body>

</html>