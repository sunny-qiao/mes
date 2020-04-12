<%@ page language="C#" autoeventwireup="true" inherits="Home_Home_Home3, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>首页</title>
    <!-- #include File="../../App/Common/PageLoad.aspx" -->



    <style type="text/css">
        .cell {
            background-image: url(images/map.png);
            background-repeat: no-repeat;
            width: 840px;
            height: 450px;
            border: 0px solid red;
            margin: auto;
        }
    </style>

    <script type="text/javascript">

        $(function () {
            setTop();
            $(window).resize(setTop);
        })

        function setTop() {
            var top = (eci.height() - 450) / 3;
            if (top <= 0) { top = 0;}
            $(".cell").css("margin-top", top);
        }

    </script>

</head>
<body class="login" style="overflow: hidden; background-color: white;">
    <form id="form1" runat="server">

        <div id="box">
            <div class="cell">
            </div>
        </div>
    </form>
</body>
</html>
