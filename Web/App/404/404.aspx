<%@ page language="C#" autoeventwireup="true" inherits="App_System_404, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>404</title>
    <script src="../../Scripts/jQuery/jquery-1.9.1.min.js"></script>

    <script  type="text/javascript">
        $(function () {
            $('.error').css({ 'position': 'absolute', 'left': ($(window).width() - 490) / 2 });
            $(window).resize(function () {
                $('.error').css({ 'position': 'absolute', 'left': ($(window).width() - 490) / 2 });
            })
        });
    </script>

    <style type="text/css">
        * {
            font-size: 9pt;
            border: 0;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: '微软雅黑';
            margin: 0 auto;
            min-width: 980px;
        }

        ul {
            display: block;
            margin: 0;
            padding: 0;
            list-style: none;
        }

        li {
            display: block;
            margin: 0;
            padding: 0;
            list-style: none;
        }

        img {
            border: 0;
        }

        dl, dt, dd, span {
            margin: 0;
            padding: 0;
            display: block;
        }

        a, a:focus {
            text-decoration: none;
            color: #000;
            outline: none;
            blr: expression(this.onFocus=this.blur());
        }

            a:hover {
                color: #00a4ac;
                text-decoration: none;
            }

        h2 {
            font-weight: normal;
        }
        /*error 404*/
        .error {
            background: url(../../App/404/Images/404.png) no-repeat;
            width: 490px;
            margin-top: 75px;
            padding-top: 65px;
        }

            .error h2 {
                font-size: 22px;
                padding-left: 154px;
            }

            .error p {
                padding-left: 154px;
                line-height: 35px;
                color: #717678;
            }

        .reindex {
            padding-left: 154px;
        }

            .reindex a {
                width: 115px;
                height: 35px;
                font-size: 14px;
                font-weight: bold;
                color: #fff;
                background: #3c95c8;
                display: block;
                line-height: 35px;
                text-align: center;
                border-radius: 3px;
                behavior: url(js/pie.htc);
                margin-top: 20px;
            }
    </style>


</head>
<body style="background: #edf6fa;">
    <form id="form1" runat="server">

        <div class="error">

            <h2>非常遗憾，您访问的页面不存在！</h2>
            <p runat="server" id="message">看到这个提示，就自认倒霉吧!</p>
            <div class="reindex"><a href="javascript:void(0)" target="_parent" style="display:none;">上报</a></div>

        </div>
    </form>
</body>
</html>
