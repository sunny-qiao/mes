<%@ page language="C#" autoeventwireup="true" inherits="App_System_frmEciParam, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>系统配置</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <style>
        .e-panel-wrapper {
            margin-top: 4px;
        }
    </style>

    <script type="text/javascript">

        function addAction() {

            if (eci.hasSave()) {
                var groupCode = $("#txtGroupCode").val();
                var url = "EciParamEdit.aspx?groupCode=" + groupCode;

                window.location.href = url;
            }
        }

        function saved() {
            window.parent.saved();
        }

        function pageClose() {
            window.parent.search();
            eci.close();
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">

        <input type="hidden" id="hidGroupId" runat="server" />

        <div id="root">

            <div id="toolbar" class="toolbar" style="padding-top: 2px;">
                <asp:EButton runat="server" ID="btnSave" Text="保存" OnClick="btnSave_Click" Icon="save" />
                <asp:EButton runat="server" ID="btnClear" Text="清空缓存" OnClick="btnClear_Click" Icon="reset" />

            </div>
            <div class="workarea" layout="toolbar,pagetitle" runat="server" id="workarea">
            </div>
        </div>

    </form>
</body>
</html>
