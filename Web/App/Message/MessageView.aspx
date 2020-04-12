<%@ page language="C#" autoeventwireup="true" inherits="App_System_MessageView, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>我的消息</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function messageIKnow() {

            var id = $("#msgId").val();

            eci.post("../../Data.ashx", "MessageIKnow", { id: id }, function (data) {
                if (!data.success) {
                    msg.ajax(data)
                }
                else {

                    eci.close();
                    window.parent.getMessage(true);

                }
            })
        }

        $(function () {

            $("#cboMessageDelay").change(function () {

                var now = new Date(); //读取当前日期
                year = now.getYear();
                month = now.getMonth() + 1;
                day = now.getDate();

                var value = this.value;

                if (value != "") {

                    var delay = parseFloat(this.value);

                    var time = now.getTime() + delay * 60 * 1000;

                    window.parent.setMessageTime(time);
                }
                else {
                    window.parent.setMessageTime(0);
                }

                eci.close();
            });

            var messageData = window.parent.messageData;
            $("#msgType").html(messageData.msgtype);
            $("#msgContent").html(messageData.msgcontent);


        })


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField runat="server" ID="msgId" />

        <table class="grid">
            <tr>
                <th style="width: 80px"></th>
                <th style="width: 90%"></th>
            </tr>
            <tr>
                <td class="lbl">
                    <asp:ELabel runat="server" ID="lblMsgType" LangCode="MESSAGE_002">消息类型</asp:ELabel>:</td>
                <td>


                    <div id="msgType">
                    </div>

                </td>
            </tr>
            <tr>
                <td class="lbl lbl-top">
                    <asp:ELabel runat="server" ID="ELabel1" LangCode="MESSAGE_005">消息内容</asp:ELabel>:</td>
                <td>
                    <div id="msgContent" style="white-space: normal; word-break: break-all; max-height: 220px; overflow-y: auto; height: 220px; margin-right: 5px; border: 1px solid #EEEEEE;">
                    </div>
                </td>
            </tr>

        </table>

        <div style="margin-top: 10px; text-align: center;">


            <span style="font-size: 14px;">
                <asp:ELabel runat="server" ID="ELabel2" LangCode="MESSAGE_013">提醒设置</asp:ELabel>:</span>
            <asp:ECombox runat="server" Height="32" ID="cboMessageDelay">
                <asp:ListItem Value=""></asp:ListItem>
                <asp:ListItem Value="1">1分钟后提醒</asp:ListItem>
                <asp:ListItem Value="5">5分钟后提醒</asp:ListItem>
                <asp:ListItem Value="10">10分钟后提醒</asp:ListItem>
                <asp:ListItem Value="30">30分钟后提醒</asp:ListItem>
            </asp:ECombox>

            <asp:EButton ID="btnMsgIKnow" runat="server" CssClass="btn-green" LangCode="MESSAGE_012" Text="我知道了" OnClientClick="messageIKnow();" Width="100" IsClient="true" />
            <asp:EButton ID="btnMsgClose" runat="server" CssClass="btn-blue" LangCode="CMD_CLOSE" Text="关闭" OnClientClick="eci.close();" Width="100" IsClient="true" />
        </div>




    </form>
</body>
</html>
