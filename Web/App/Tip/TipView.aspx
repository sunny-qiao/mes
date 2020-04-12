<%@ page language="C#" autoeventwireup="true" inherits="App_System_frmEciTipView, ECI.Web" enableviewstatemac="false" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" style="overflow-x: hidden; overflow-y: hidden;">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>系统提示</title>

    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <link rel="stylesheet" href="Theme/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="Theme/css/style.css" />
    <script src="Theme/js/jquery.backstretch.min.js"></script>


    <script type="text/javascript">

        $(function () {
            try {
                $.backstretch([
                  "Theme/img/backgrounds/1.jpg"
                , "Theme/img/backgrounds/2.jpg"
                ], { duration: 5000, fade: 750 });
            }
            catch (e) { }


        });

        $(function () {

            $("#btnClose").focus();

            $(window).keyup(function (e) {
                e = e || event;
                if (e.keyCode == 27) {
                    eci.close();
                }
            });


            var data = window.parent.eci.getTipData();

            if (data.headerText) {
                $("#headerText").html(data.headerText);
            }

            $("#content").html(data.content);

        })



    </script>

    <style>
        #content:hover {
            overflow-y: scroll;
        }
    </style>
</head>
<body>

    <form runat="server" id="form1">

        <div>

            <div style="width: 1084px; margin-left: auto; margin-right: auto; background: white; font-size: 16px; border-radius: 10px;">

                <div id="headerText" style="font-size: 26px; height: 50px; line-height: 50px; color: brown; text-align: center; margin-top: 10px; margin-bottom: 5px;">
                    系统帮助
                </div>

                <div style="border-bottom: dotted 1px #808080; margin-left: 20px; margin-right: 20px;"></div>


                <div style="margin: 10px; text-align: center;">
                </div>


                <div style="min-height: 150px; padding-left: 20px; padding-right: 20px; font-size: 16px;">

                    <div id="content" class="fitH" layout="150" style="border: 0px solid red; overflow-y: auto;">
                    </div>

                </div>


                <div style="border-bottom: dotted 1px #808080; margin-left: 20px; margin-right: 20px;"></div>

                <div style="margin: 10px; text-align: center;">

                    <a id="btnClose" href="javascript:void(0)" onclick="eci.close();">[关闭]</a>
                </div>

                <div style="height: 20px;"></div>

            </div>
        </div>


        

    </form>
</body>
</html>
