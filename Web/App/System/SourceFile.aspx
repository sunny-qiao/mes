<%@ page language="C#" autoeventwireup="true" inherits="AppSample_Source_SourceFile, ECI.Web" enableviewstatemac="false" %>

<%@ Register Assembly="Wilco.SyntaxHighlighter" Namespace="Wilco.Web.SyntaxHighlighting"
    TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>源代码</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <link href="../../EasyUI/themes/default/easyui.css" rel="stylesheet" />
    <link href="../../EasyUI/themes/icon.css" rel="stylesheet" />

    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            font-size: 18px;
            background-color: White;
        }

        pre span {
            font-family: consolas,arial,tahoma,verdana,helvetica;
        }

        .shl_ln {
            border-right: 1px solid #999;
            padding-right: 2px;
            color: #999;
            margin-right: 2px;
        }
    </style>
</head>
<body class="body" style="overflow-x: hidden;">
    <form id="form1" runat="server">
        <div id="root">
            <div class="workarea">

                <asp:ETab runat="server" ID="tabMain">
                    <asp:ETabItem Title="前台代码" runat="server" ID="tabOne">

                        <cc1:SyntaxHighlighter ID="SyntaxHighlighter1" runat="server">
                        </cc1:SyntaxHighlighter>
                    </asp:ETabItem>
                    <asp:ETabItem Title="后台代码" runat="server" ID="tabTwo">
                        <cc1:SyntaxHighlighter ID="SyntaxHighlighter2" runat="server">
                        </cc1:SyntaxHighlighter>

                    </asp:ETabItem>
                </asp:ETab>
            </div>
        </div>
    </form>
</body>
</html>
