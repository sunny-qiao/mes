<%@ page language="C#" autoeventwireup="true" inherits="App_Common_ImageUpload, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
    
    </script>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">

        <table class="grid" cellpadding="0" cellspacing="0">
            <tr>
        <th style="width: 10%"></th>
                <th style="width:90%"></th>

            </tr>
            <tr >
                <td class="lbl">图片类型</td>
                <td>
                    <asp:ECombox runat="server" ID="cboType" Width="85%">
                        <asp:ListItem Value="App">应用图标</asp:ListItem>
                        <asp:ListItem Value="Logo">LOGO图标</asp:ListItem>
                        <asp:ListItem Value="Flow">流程图标</asp:ListItem>
                    
                    </asp:ECombox>
                </td>

            </tr>

            <tr>
                <td class="lbl">上传图片</td>
                <td>
                    <asp:FileUpload runat="server" ID="fileImage" Width="85%"></asp:FileUpload>
                </td>

            </tr>

            <tr>
                <td class="lbl">&nbsp;图片名</td>
                <td>
                    <asp:ETextBox runat="server" ID="txtImageName" Width="85%" Autocomplete="false"></asp:ETextBox>
                </td>

            </tr>

            <tr>
                <td class="lbl">&nbsp;</td>
                <td>
                    <asp:EButton runat="server" ID="btnSave" Text="确定" CssClass="btn-green"
                        OnClick="btnSave_Click" />

                    &nbsp;<asp:EButton runat="server" ID="btnClose" Text="关闭"
                        IsClient="true" OnClientClick="parent.eci.close();" CssClass="btn-blue" />
                </td>

            </tr>

        </table>

    </form>
</body>
</html>
