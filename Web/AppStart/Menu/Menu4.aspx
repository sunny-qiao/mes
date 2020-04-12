<%@ page language="C#" autoeventwireup="true" inherits="AppStartPT_Menu_Menu4, ECI.Web" enableviewstate="false" enableeventvalidation="false" enableviewstatemac="false" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>功能导航</title>
    <link href="EasyUI/css.css" rel="stylesheet" />
    <link href="css/Menu.css" rel="stylesheet" />
    <link href="css/skin1.css" rel="stylesheet" />

    <script src="../../Scripts/JQuery/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="Js/Menu4.js?v=24" type="text/javascript"></script>
    <link id="xm" rel="stylesheet" type="text/css" />

    <style type="text/css">
    

    </style>


    <script type="text/javascript">

        $(function () {
            var width = parseFloat($("#hidMenuWidth").val());
            $("#container").width(width + 40);
            $("#container").parent().width(width + 4);
 
            var skin = $("#hidSkin").val();

            if (skin) {
                $("#body").addClass(skin);
            }

        })


    </script>



</head>

<body id="body" class="skin11" style="overflow-x: hidden; overflow-y: auto; margin: 0px; padding: 0px; background-color: #D3EAFF;">

    <div class="background">

        <form id="form1" runat="server">
            <input type="hidden" id="hidMenuWidth" runat="server" />
            <input type="hidden" id="hidPageNav" runat="server" />
            <input type="hidden" id="hidException" runat="server" />

            <!-------------------------系统日志-------------------------->
            <input type="hidden" id="hidLog" runat="server" />
            <!-----------------198------------240------------------------------>
            <div style="width: 200px; overflow: hidden; border: 0px solid red;">
                <div id="container" style="width: 240px; overflow-y: scroll;">

                    <div runat="server" id="divNoData" style="border: 0px solid #D3EAFF">
                        <div runat="server" id="divMessage" style="font-size: 14px; text-align: center; padding-top: 50px; border: 0px; width: 198px;">没有获取到任何权限</div>
                    </div>

                    <asp:EMenu runat="server" ID="menu" EnableViewState="false"></asp:EMenu>


                </div>
            </div>
        </form>

    </div>
</body>
</html>
