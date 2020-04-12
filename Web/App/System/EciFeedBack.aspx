<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="App_System_EciFeedBack, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户反馈</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <script type="text/javascript" charset="utf-8" src="../../ueditor/ueditor.config.js?v=001"></script>
    <script type="text/javascript" charset="utf-8" src="../../ueditor/ueditor.all.js"></script>


    <script type="text/javascript">

        function addAction() {

            if (eci.hasSave()) {
                var url = "EciFeedBackEdit.aspx";

                window.location.href = url;
            }
        }

        function me() {
            var url = "../../App/System/EciFeedBackListMe.aspx";
            window.location.href = url;
        }


        $(function () {
            $("#txtMobile").focus();

        })

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div>

            <div>


                <div style="width: 1000px; margin-left: auto; margin-right: auto; margin-bottom: 4px; border: 1px dotted #ccc; padding: 0px; padding-bottom: 8px;">
                    <div id="toolbar" class="toolbar">
                        <asp:EButton runat="server" ID="btnSave" Text="保存" NeedCheck="true" ValidateId="tbEdit" OnClick="btnSave_Click" Icon="save" />
                        <asp:EButton runat="server" ID="btnAdd" Text="新增" Icon="Add" OnClientClick="addAction();" IsClient="true" />
                        <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" />

                        <div style="float: right; margin-right: 4px;">
                            <asp:EButton runat="server" ID="btnMe" Text="我的反馈历史记录" Icon="user" IsClient="true" OnClientClick="me()" />
                        </div>
                    </div>

                    <table id="tbHide" style="display: none;" class="grid" cellpadding="0" cellspacing="0">
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
                            <td class="lbl">状态</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtStatus" DataField="STATUS" Width="85%"></asp:ETextBox></td>

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

                        <tr>
                            <td class="lbl">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="lbl">&nbsp;</td>
                            <td>&nbsp;</td>

                        </tr>

                    </table>

                    <table id="tbEdit" class="grid" cellpadding="0" cellspacing="0">
                        <tr>
                            <th style="width: 10%"></th>
                            <th style="width: 23%"></th>
                            <th style="width: 10%"></th>
                            <th style="width: 23%"></th>
                            <th style="width: 10%"></th>
                            <th style="width: 23%"></th>

                        </tr>
                        <tr>
                            <td class="lbl">
                                <img src="../../icon/tip.png" />
                            </td>
                            <td colspan="5">
                                <div style="font-size: 12px;" class="notnull">
                                    请留下您的联系方式，方便我们与您沟通，谢谢!
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="lbl">联系人</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtLinkerMan" DataField="LINKER_MAN" MaxLength="30" Width="85%"></asp:ETextBox></td>
                            <td class="lbl">联系电话</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtMobile" DataField="MOBILE" MaxLength="20" Width="85%"></asp:ETextBox></td>
                            <td class="lbl">邮箱</td>
                            <td>
                                <asp:ETextBox runat="server" ID="txtEmail" DataField="EMAIL" MaxLength="20" Width="85%"></asp:ETextBox></td>
                        </tr>

                    </table>

                </div>

                <div style="min-height: 300px; width: 1000px; margin-left: auto; margin-right: auto; font-size: 16px; border: 1px dotted #ccc; padding: 0px;">

                    <div style="margin: 10px;">
                        <textarea id="txtBody" name="txtBody" cols="40" rows="10" runat="server" style="height: 300px;">
                    </textarea>

                        <script type="text/javascript" charset="utf-8">
                            var editor_textarea = new UE.ui.Editor();
                            editor_textarea.render("txtBody");
                        </script>

                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
