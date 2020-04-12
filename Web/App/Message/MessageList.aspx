<%@ page language="C#" autoeventwireup="true" inherits="App_System_MessageList, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>我的消息</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function showMsg(msgId, tr) {

            var msgType = $(tr).find(".dataMsgType").text();
            var msgContent = $(tr).find(".dataMsgContent").text();

            $("#msgId").html(msgId);
            $("#msgType").html(msgType);
            $("#msgContent").html(msgContent);

            eci.window("winMessage");
        }

        function messageIKnow() {
            eci.closewindow("winMessage");

            var id = $("#msgId").html();

            eci.post("../../Data.ashx", "MessageIKnow", { id: id }, function (data) {
                if (!data.success) {
                    msg.ajax(data)
                }
            })
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">

        <!--系统通知类型-->
        <input type="hidden" id="hidType" runat="server" />


        <div id="root">


            <div id="divQuery" style="width: 100%;">
                <table id="tbQuery" class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="width: 10%"></th>
                        <th style="width: 40%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 40%"></th>
                    </tr>
                    <tr style="font-size: 14px;">
                        <td style="padding-left: 10px;">
                            <asp:ELabel runat="server" ID="ELabel1" LangCode="MESSAGE_003">读取状态</asp:ELabel>
                        </td>
                        <td colspan="3">

                            <asp:RadioButton runat="server" ID="rbAll" AutoPostBack="true" GroupName="STATUS" Text="全部" OnCheckedChanged="rb_CheckedChanged" />
                            &nbsp;&nbsp;
                            <asp:RadioButton runat="server" ID="rbY" AutoPostBack="true" GroupName="STATUS" Text="已读" OnCheckedChanged="rb_CheckedChanged" />
                            &nbsp;&nbsp;
                            <asp:RadioButton runat="server" ID="rbN" AutoPostBack="true" Checked="true" GroupName="STATUS" Text="未读" OnCheckedChanged="rb_CheckedChanged" />

                        </td>
                    </tr>

                </table>
            </div>
            <div id="toolbar" style="margin-top:10px;">
                <asp:EButton runat="server" Text="全部设为已读" Icon="ok" ID="btnAllRead" LangCode="MESSAGE_004" OnClick="btnAllRead_Click" />

                &nbsp;<asp:EButton runat="server" ID="btnTest" LangCode="MESSAGE_001" Text="创建测试消息" Icon="tip" OnClick="btnTest_Click" />

                &nbsp;<asp:EButton runat="server" ID="btnClose" LangCode="CMD_CLOSE" Text="关闭" Icon="close" IsClient="true" OnClientClick="eci.close()" />

            </div>
            <div id="datagrid">

                <asp:EGridView ID="gvData" Layout="divQuery,toolbar,pagetitle" runat="server" BorderStyle="None"
                    FitWindow="true" EnableSorting="True" EnableSelect="false" EnablePaging="true" EnableClickSelectRow="true" BorderWidth="0px" CssClass="grid"
                    Width="1000px" KeyField="ID" HAlign="center" EnableDblClick="true" DblClickEventName="showMsg">
                    <Columns>

                        <asp:ETemplateField HeaderText="消息类型" LangCode="MESSAGE_002" ItemStyle-HorizontalAlign="center" ItemStyle-Width="180">
                            <ItemTemplate>
                                <div class="dataMsgType"><%#Eval("MSG_TYPE")%></div>
                            </ItemTemplate>
                        </asp:ETemplateField>

                        <asp:ETemplateField HeaderText="消息内容" LangCode="MESSAGE_005" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="400">
                            <ItemTemplate>
                                <div class="dataMsgContent"><%#Eval("MSG_CONTENT")%></div>
                            </ItemTemplate>
                        </asp:ETemplateField>

                        <asp:EBoundField DataField="CREATE_DATE" HeaderText="消息接收时间" LangCode="MESSAGE_006" SortExpression="CREATE_DATE" ItemStyle-Width="130" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"></asp:EBoundField>
                        <asp:EBoundField DataField="READ_FLAG" HeaderText="阅读状态" LangCode="MESSAGE_003" ItemStyle-Width="130"></asp:EBoundField>
                        <asp:EBoundField DataField="READ_DATE" HeaderText="阅读时间" LangCode="MESSAGE_007" ItemStyle-Width="130" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"></asp:EBoundField>

                    </Columns>
                </asp:EGridView>
            </div>
        </div>


        <asp:EWindow runat="server" ID="winMessage" Title="我的消息" Width="600" Height="280" BackColor="White" Icon="notice" LangCode="MESSAGE_010">

            <table class="grid">
                <tr>
                    <th style="width: 80px"></th>
                    <th style="width: 90%"></th>
                </tr>
                <tr>
                    <td class="lbl">
                        <asp:ELabel runat="server" ID="ELabel3" LangCode="MESSAGE_002">消息类型</asp:ELabel>：</td>
                    <td>
                        <div id="msgId" style="display: none">
                        </div>

                        <div id="msgType">
                        </div>

                    </td>
                </tr>
                <tr>
                    <td class="lbl lbl-top">
                        <asp:ELabel runat="server" ID="ELabel2" LangCode="MESSAGE_005">消息内容</asp:ELabel>：</td>
                    <td>
                        <div id="msgContent" style="white-space: normal; word-break: break-all; height: 150px; margin-right: 5px; border: 0px solid blue;">
                        </div>
                    </td>
                </tr>

            </table>

            <div style="margin-top: 10px; text-align: center;">

                <asp:EButton ID="btnMsgIKnow" runat="server" CssClass="btn-green" LangCode="MESSAGE_012" Text="我知道了" OnClientClick="messageIKnow();" Width="120" IsClient="true" />
                <asp:EButton ID="btnMsgClose" runat="server" CssClass="btn-blue" Text="关闭" LangCode="CMD_CLOSE" OnClientClick="eci.closewindow(this);" Width="120" IsClient="true" />
            </div>


        </asp:EWindow>


    </form>
</body>
</html>
