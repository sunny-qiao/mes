<%@ page language="C#" autoeventwireup="true" inherits="App_ComParam_ImportFromXml, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>功能导入</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <script type="text/javascript">

        function importAction(obj) {
            msg.confirm("确定执行导入操作吗?", obj);
        }

        function importSucces(message) {
            eci.close();
            window.parent.importOK(message);
        }

    </script>

 

</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table class="grid">
                <tr>
                    <th style="width: 100px"></th>
                    <th></th>
                </tr>
                <tr>
                    <td class="lbl"><asp:ELabel runat="server" >导入方式</asp:ELabel>:</td>
                    <td>

                        <asp:ELabel runat="server" >导入为下级目录</asp:ELabel>
                     

                    </td>
                </tr>
                <tr>
                    <td class="lbl"><asp:ELabel runat="server" >上传文件</asp:ELabel>：</td>
                    <td>
                        <asp:FileUpload runat="server" ID="fileUpload" Width="85%" />

                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="center">

                        <asp:EButton runat="server" Text="导入" ID="btnImport" Icon="save" OnClientClick="importAction(obj)" OnClick="btnImport_Click" />
                        <asp:EButton runat="server" Text="取消"  ID="btnClose" Icon="close" IsClient="true" OnClientClick="eci.close(this)" />

                    </td>
                </tr>

            </table>


        </div>
    </form>
</body>
</html>
