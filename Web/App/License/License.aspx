<%@ page language="C#" autoeventwireup="true" inherits="App_System_License, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>产品授权</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <style type="text/css">
        td {
            padding: 4px;
        }

        .body {
            background-image: url(../../AppStart/Layout/css/images/bg_1.jpg);
            background-repeat: repeat-x;
            background-position: 40px 0px;
            background-color: #3EB4D2;
            height: 100%;
            width: 100%;
        }
    </style>

    <script type="text/javascript">

        function home() {
            var url = "../../" + $("#hidLoginUrl").val();
            window.parent.location.href = url;
        }

        function reg() {
            var sn = $("#txtSn").val();

            if (sn == "") {
                msg.error("注册码不能为空");
                return false;
            }
        }

        $(function () {
            var url = $("#hidUrl").val();
            if (url.length > 0) {
                eci.open(url, { width: 640, height: 280 });
            }

            $("#txtSn").focus();


        })

    </script>

</head>
<body class="body">
    <form id="form1" runat="server">

        <input type="hidden" id="hidLoginUrl" runat="server" />
        <input type="hidden" id="hidUrl" runat="server" />


        <div style="width: 600px; margin-left: auto; margin-right: auto; margin-top: 100px;">

            <table style="width: 100%; border: 1px solid #808080; padding: 2px;">
                <tr>
                    <td style="text-align: right">
                        <img src="css/Images/lock.png" alt="" /></td>
                    <td style="text-align: left; font-size: 24px;">
                        <div style="margin-left: 10px; margin-right: 10px;">
                            <asp:Label runat="server" ID="lblHead">产品未授权或授权已过期</asp:Label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="font-size: 16px; color: red; padding: 5px;">请将本服务器的机器码提交给管理员，管理员根据机器码产生注册码.
                    </td>

                </tr>

                <tr>
                    <td colspan="2">机器码:
                <asp:ETextBox runat="server" ID="txtSerialization" Width="500" ReadOnly="true"></asp:ETextBox>
                        <br />
                    </td>

                </tr>



                <tr>
                    <td colspan="2">注册码:
                        <asp:ETextBox runat="server" ID="txtSn" Width="500" TextMode="MultiLine" Rows="4"></asp:ETextBox>

                    </td>

                </tr>

                 <tr>
                    <td colspan="2">部署方式:
                        <asp:ECheckbox runat="server" ID="chkIsDev"  ReadOnly="true" Text="开发模式" ></asp:ECheckbox>

                    &nbsp;&nbsp;
                        <asp:ECheckbox runat="server" ID="chkIsRun"  ReadOnly="true" Text="运行模式" ></asp:ECheckbox>

                    &nbsp;
                        <span class="notnull">注意:正式运行环境必须配置成运行模式</span>

                    </td>

                </tr>
 
                <tr>
                    <td colspan="2" style="text-align: center; padding-bottom: 10px;">
                        <asp:EButton runat="server" CssClass="btn-green" Width="100" Text="注册" ID="btnReg" OnClientClick="return reg();" OnClick="btnReg_Click" />
                        &nbsp;
                         <asp:EButton runat="server" CssClass="btn-blue" Width="100" Text="下载注册码" ID="btnDownload" OnClick="btnDownload_Click" />
                        &nbsp;

                        <asp:EButton runat="server" ID="btnReLogin" CssClass="btn-green" Width="100" Text="重新登录" IsClient="true" OnClientClick="home();" />
                        &nbsp;<asp:EButton runat="server" ID="btnClose" CssClass="btn-blue" Width="100" Visible="false" Text="关闭" IsClient="true" OnClientClick="parent.parent.window.close();" />

                    </td>

                </tr>


            </table>

        </div>
    </form>
</body>
</html>
