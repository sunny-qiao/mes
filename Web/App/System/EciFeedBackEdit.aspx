<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="App_System_EciFeedBackEdit, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户反馈受理</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <script type="text/javascript" charset="utf-8" src="../../ueditor/ueditor.config.js?v=001"></script>
    <script type="text/javascript" charset="utf-8" src="../../ueditor/ueditor.all.js"></script>

    <script type="text/javascript">

        function acceptAction(obj) {

            msg.confirm("确定执行受理吗?", obj);
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />

        <div>
            <div id="toolbar" class="toolbar">
                <asp:EButton runat="server" ID="btnAccept" Text="受理" Icon="ok" IsClient="true" OnClientClick="acceptAction(this)" OnClick="btnAccept_Click" />
                <asp:EButton runat="server" ID="btnSave" Text="保存回复内容" NeedCheck="true" ValidateId="tbEdit" OnClick="btnSave_Click" Icon="save" />
                <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" />

            </div>
            <div class="fitH" layout="toolbar,50">


                <div style="width: 1000px; margin-left: auto; margin-right: auto; border: 1px dotted #ccc; padding: 0px;">

                    <table id="tbEdit" class="grid" cellpadding="0" cellspacing="0">
                        <tr>
                            <th style="width: 20%"></th>
                            <th style="width: 30%"></th>
                            <th style="width: 20%"></th>
                            <th style="width: 30%"></th>

                        </tr>
                        <tr>
                            <td class="lbl">系统代码</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtSysCode" DataField="SYS_CODE" Width="85%"></asp:ETextBox></td>
                            <td class="lbl">系统名称</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtSysName" DataField="SYS_NAME" Width="85%"></asp:ETextBox></td>

                        </tr>
                        <tr>
                            <td class="lbl">登录账号</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtLoginNo" DataField="LOGIN_NO" Width="85%"></asp:ETextBox></td>
                            <td class="lbl">客户端IP地址</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtIp" DataField="IP" Width="85%"></asp:ETextBox></td>

                        </tr>
                        <tr>
                            <td class="lbl">客户端浏览器</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtBrowser" DataField="BROWSER" Width="85%"></asp:ETextBox></td>
                            <td class="lbl">客户端操作系统</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtOs" DataField="OS" Width="85%"></asp:ETextBox></td>

                        </tr>
                        <tr>
                            <td class="lbl">服务端IP地址</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtServerIp" DataField="SERVER_IP" Width="85%"></asp:ETextBox></td>
                            <td class="lbl">反馈状态</td>
                            <td>
                                <asp:ECombox runat="server" ID="cboStatus" DataField="STATUS" Width="85%">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem Value="TB">提报</asp:ListItem>
                                    <asp:ListItem Value="SL">已受理</asp:ListItem>
                                </asp:ECombox></td>

                        </tr>

                        <tr>
                            <td class="lbl">联系人</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtLinkerMan" DataField="LINKER_MAN" Width="85%"></asp:ETextBox></td>
                            <td class="lbl">电话</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtMobile" DataField="MOBILE" Width="85%"></asp:ETextBox></td>

                        </tr>
                        <tr>
                            <td class="lbl">邮箱</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtEmail" DataField="EMAIL" Width="85%"></asp:ETextBox></td>
                            <td class="lbl">&nbsp;</td>
                            <td>&nbsp;</td>

                        </tr>

                        <tr>
                            <td class="lbl">反馈人</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtCreateUser" DataField="CREATE_USER" ReadOnly="true" Width="85%"></asp:ETextBox></td>
                            <td class="lbl">反馈日期</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtCreateDate" DataField="CREATE_DATE" Format="yyyy-MM-dd HH:mm:ss" ReadOnly="true" IsDate="true" Width="85%"></asp:ETextBox></td>

                        </tr>
                        <tr>
                            <td class="lbl">公司代码</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtCompanyCode" DataField="COMPANY_CODE" Width="85%"></asp:ETextBox></td>
                            <td class="lbl">公司名称</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtCompanyName" DataField="COMPANY_NAME" Width="85%"></asp:ETextBox></td>

                        </tr>

                    </table>


                </div>

                <div style="min-height: 50px; width: 1000px; margin-left: auto; margin-right: auto; font-size: 16px; border: 1px dotted #ccc; padding: 0px;">

                    <div style="margin: 10px;">
                        <asp:Literal ID="lblBody" runat="server"></asp:Literal>
                    </div>



                </div>

                <div style="min-height: 50px; width: 1000px; margin-left: auto; margin-right: auto; font-size: 16px; border: 1px dotted #ccc; padding: 0px;">
                    <div style="margin: 10px;">
                        <textarea id="txtAcceptMemo" name="txtAcceptMemo" cols="40" rows="5" runat="server" style="height: 300px;">
                    </textarea>

                        <script type="text/javascript" charset="utf-8">
                            var editor_textarea = new UE.ui.Editor();
                            editor_textarea.render("txtAcceptMemo");
                        </script>

                    </div>

                </div>



            </div>
        </div>
    </form>
</body>
</html>
