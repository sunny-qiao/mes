<%@ page language="C#" autoeventwireup="true" enablesessionstate="True" inherits="App_Entry_Index, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" style="overflow-x: hidden; overflow-y: hidden;">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Index/css/style.css" rel="stylesheet" type="text/css" />
    <script src="Index/js/jquery.js" type="text/javascript"></script>

    <script type="text/javascript">
        

        $(function () {

            $(window).resize(function () {
                winresize();
            });

            winresize();

        });

        function winresize() {
            if ($(window).height() < 500) {
                $(".loginbm").hide();
            }
            else {
                $(".loginbm").show();
            }
        }



    </script>

    <style type="text/css">
        .logotxt {
            border: 0px solid red;
            text-align: center;
            margin-top: 20px;
            font-family: "微软雅黑", "宋体", "Arial Unicode MS";
            font-size: 20px;
            font-weight: bold;
            color: #FFFFFF;
            line-height: 70px;
        }
    </style>

</head>
<body style="background-color: #1c77ac; background-image: url(Index/images/light.png); background-repeat: no-repeat; background-position: center top; overflow: hidden;">
    <form runat="server" id="form1">



        <div class="loginbody"  style="border:0px solid red;margin-top:200px;">

          
    

            <h1 style='text-align: center; font-size: 46px; color: white;'>请通过正确的地址访问系统</h1>





        </div>
        <div class="loginbm">
            <asp:Label runat="server" ID="lblCopyRight">技术支持：华东信息科技有限公司</asp:Label>
        </div>
    </form>
</body>
</html>
