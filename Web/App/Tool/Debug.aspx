<%@ page language="C#" autoeventwireup="true" inherits="App_Tool_Debug, ECI.Web" enablesessionstate="True" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>系统设置</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        $(function () {

            $(window).keyup(function (e) {
                e = e || event;
                if (e.keyCode == 27) {
                    eci.close();
                }
            });





        })
    </script>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">

        <table class="grid" cellpadding="0" cellspacing="0">
            <tr>
                <th style="width: 100px"></th>
                <th style="width: 90%"></th>

            </tr>

            <tr>
                <td class="lbl">
                      <asp:ETip runat="server" Show="true"  ToolTip="系统需要配置成测试模式[TestMode=true]，才能修改此设定"/>

                    <label for="chkButtonEnabledForever">按钮永远生效</label></td>
                <td>
                    <asp:ECheckBox runat="server" ID="chkButtonEnabledForever" Width="85%"></asp:ECheckBox>
                </td>

            </tr>

            <tr>
                <td class="lbl">
                    <label for="chkLogCatch">执行追踪</label>
                </td>
                <td>
                    <asp:ECheckBox runat="server" ID="chkLogCatch" Width="85%"></asp:ECheckBox>
                </td>

            </tr>

            <tr>
                <td class="lbl">
                    <label for="chkDevLog">调试日志输出</label></td>
                <td>
                    <asp:ECheckBox runat="server" ID="chkDevLog" Width="85%"></asp:ECheckBox>
                </td>

            </tr>

            <tr>
                <td class="lbl">
                    <label for="chkPerformance">性能监控日志</label></td>
                <td>
                    <asp:ECheckBox runat="server" ID="chkPerformance" Width="85%"></asp:ECheckBox>
                </td>

            </tr>




            <tr>
                <td class="lbl">
                    <asp:ETip runat="server" Show="true"  ToolTip="设定的值是登录账号<br>配合开发日志、性能日志、权限日志"/>
                    指定用户日志</td>
                <td>
                    <asp:ETextBox runat="server" ID="txtLogUser" Width="85%"></asp:ETextBox></td>

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
