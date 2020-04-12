<%@ page language="C#" autoeventwireup="true" inherits="App_Common_WebConfig, ECI.Web" enableviewstatemac="false" %>

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
                <td class="lbl">配置节点</td>
                <td>
                    <asp:ECombox runat="server" ID="cboType" Width="85%" AutoPostBack="true" OnSelectedIndexChanged="cboType_SelectedIndexChanged">
                        
                    
                    </asp:ECombox>
                </td>

            </tr>

            <tr>
                <td class="lbl">配置内容</td>
                <td>
                    <asp:ETextBox runat="server" ID="txtValue" Width="85%" Autocomplete="false" TextMode="MultiLine" Rows="5"></asp:ETextBox>
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
