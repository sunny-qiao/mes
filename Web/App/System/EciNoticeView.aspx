<%@ page language="C#" autoeventwireup="true" inherits="App_System_EciNoticeView, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>系统通知</title>

    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <link href="Feedback/css/style.css?v=1" rel="stylesheet" type="text/css" />

    <script type="text/javascript">

    </script>

    <style type="text/css">
        * {
            font-size: 16px;
        }

        .logo {
            background: #056DA0;
            background: url(../../AppStart/Layout/css/images/bg.png);
            height: 60px;
            line-height: 60px;
            font-family: "微软雅黑", "宋体", "Arial Unicode MS";
            font-size: 24px;
            font-weight: bold;
            color: white;
            text-align: center;
        }

        .line {
            height: 1px;
            border-top: 1px solid #ccc;
            background: #fff;
            width: 1000px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>

    <script type="text/javascript">

        $(function () {

            $(window).focus();

            $(window).keyup(function (e) {
                e = e || event;
                if (e.keyCode == 27) {
                    eci.close();
                }
            });

        })


    </script>

</head>
<body style="background: #f5f5f5">

    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />

        <div id="helpBody" style="margin-top: 0px;">

            <div style="width: 100%; margin-left: auto; margin-right: auto; background: #f5f5f5; font-size: 16px;">

                <div class="logo" id="pagetitle">
                    <asp:Literal ID="lblTitle" runat="server"></asp:Literal>
                </div>


                <div style="font-size: 14px; color: #808080; margin-top: 5px; width: 1000px; margin-left: auto; margin-right: auto;">
                    <asp:ELabel runat="server" LangCode="NOTICE_002">发布日期</asp:ELabel>:
                    <asp:Literal ID="lblPublishDate" runat="server"></asp:Literal>

                    <div style="float:right;margin-right:4px;">
                        阅读次数:<asp:Label runat="server" ID="lblNum"></asp:Label>
                    </div>
                </div>

              

                <div class="line" style="margin-top: 5px;">
                </div>


                <div style="margin: 10px; text-align: center; font-size: 12px; display:none;">

                    <asp:EButton runat="server" ID="btnIKnow" Text="我知道了" LangCode="NOTICE_004" CssClass="btn-green" OnClick="btnIKnow_Click" />
                    <asp:EButton runat="server" ID="btnClose" Text="关闭" LangCode="CMD_CLOSE" IsClient="true" CssClass="btn-blue" OnClientClick="eci.close()" />

                </div>


                <div style="min-height: 300px; width: 1000px; margin-left: auto; margin-right: auto; font-size: 16px; border: 1px dashed #ccc; padding: 0px;">
                    <div style="margin: 10px;">
                        <asp:Literal ID="lblBody" runat="server"></asp:Literal>
                    </div>
                </div>


                <div style="margin: 10px; text-align: center; font-size: 12px;">

                    <asp:EButton runat="server" ID="btnIKnowBottom" Text="我知道了" LangCode="NOTICE_004" CssClass="btn-green" OnClick="btnIKnow_Click" />
                    <asp:EButton runat="server" ID="btnCloseBottom" Text="关闭" LangCode="CMD_CLOSE" IsClient="true" CssClass="btn-blue" OnClientClick="eci.close()" />
                </div>

                <div style="height: 5px;"></div>

            </div>
        </div>

        <div class="loginbm" style="position: static;">
        </div>


    </form>
</body>
</html>

