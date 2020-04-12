<%@ page language="C#" autoeventwireup="true" inherits="App_System_frmEciNoticeEdit, ECI.Web" validaterequest="false" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>系统通知维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <script type="text/javascript" charset="utf-8" src="../../ueditor/ueditor.config.js?v=001"></script>
    <script type="text/javascript" charset="utf-8" src="../../ueditor/ueditor.all.js"></script>

    <!-- #include File="../../App/Common/PageLoad.aspx" -->


    <script type="text/javascript">
        function priviewAction(obj) {
            var key = eci.key();

            if (eci.hasSave()) {
                var url = "EciNoticeView.aspx?key=" + key;
                eci.open(url);
            }
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />
        <!--系统通知类型-->
        <input type="hidden" id="hidType" runat="server" />


        <div style="width: 1110px; margin-left: auto; margin-right: auto; border: 1px solid #EEE; padding-bottom: 10px;">
            <div id="toolbar" class="toolbar">
                <asp:EButton runat="server" ID="btnSave" Text="保存" NeedCheck="true" ValidateId="tbEdit" OnClick="btnSave_Click" Icon="save" />

                <asp:EButton runat="server" ID="btnPublish" Text="发布" Icon="ok" OnClick="btnPublish_Click" />
                <asp:EButton runat="server" ID="btnStop" Text="取消" Icon="disconnect" OnClick="btnStop_Click" />

                <asp:EButton runat="server" ID="btnPriview" Text="预览" IsClient="true" Icon="world" OnClientClick="priviewAction(this);" />
                <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" />
            </div>
            <div style="width: 1110px; margin-left: auto; margin-right: auto;">
                <table id="tbEdit" class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="width: 60px; min-width: 60px;"></th>
                        <th></th>
                    </tr>
                    <tr>
                        <td>标题</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtTitle" DataField="TITLE" NotNull="true" Width="100%"></asp:ETextBox></td>


                    </tr>
                    <tr>
                        <td>有效期</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtEffectStartDate" DataField="EFFECT_START_DATE" IsDate="true" Width="200"></asp:ETextBox>&nbsp;-&nbsp;<asp:ETextBox runat="server" ID="txtEffectEndDate" DataField="EFFECT_END_DATE" IsDate="true" Width="200"></asp:ETextBox>&nbsp;状态
                            <asp:EDropDownList runat="server" ID="cboStatus" DataField="STATUS" Width="80" Enabled="false">
                                <asp:ListItem Value="NEW">新建</asp:ListItem>
                                <asp:ListItem Value="PUBLISH">发布</asp:ListItem>
                                <asp:ListItem Value="STOP">取消</asp:ListItem>
                            </asp:EDropDownList></td>


                    </tr>

                    <tr>
                        <td colspan="2" style="white-space: normal; padding-top: 10px;">
                            <textarea id="txtBody" name="txtBody" cols="40" rows="10" runat="server" style="height: 300px;">  
                         
                        </textarea>

                            <script type="text/javascript" charset="utf-8">
                                var editor_textarea = new UE.ui.Editor();
                                editor_textarea.render("txtBody");
                            </script>

                        </td>
                    </tr>
                </table>
            </div>
        </div>

    </form>
</body>
</html>
