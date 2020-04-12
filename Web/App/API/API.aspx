<%@ page language="C#" autoeventwireup="true" inherits="App_API_API, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>接口模拟测试</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <script src="../../Scripts/jQuery/jquery-1.9.1.min.js"></script>

    <style>
        fieldset {
            border: 1px solid #dddddd;
        }
    </style>

    <script type="text/javascript">

        function call() {
            $("#form1").attr("action", "API.ashx");
            $("#form1").attr("target", "_blank");

            var actionId = $("#action").val();
            var url = $("#hidUrl").val();

            url += "?Action=" + actionId;
            $(".extend").each(function () {
                url += "&" + this.id + "=" + this.value;
            })

            $("#txtAPIUrl").val(url);
        }

        function createForm() {
            $("#form1").attr("action", "API.aspx");
            $("#form1").attr("target", "");
        }


    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField runat="server" ID="hidUrl" />

        <div style="width: 800px; margin: 20px; margin-left: auto; margin-right: auto; border: 0px solid red;">
            <div style="width: 800px; text-align: center;">

                <fieldset>
                    <legend>参数</legend>

                    <div style="margin-bottom: 20px;">
                        <asp:ETextBox runat="server" ID="txtParam" Width="400" Height="30"></asp:ETextBox>

                        <br />
                        <br />
                        <asp:EButton ID="btnCreate" runat="server" CssClass="btn-green" OnClientClick="createForm()" OnClick="btnCreate_Click" Text="创建表单" />

                    </div>
                </fieldset>



            </div>
            <div style="margin-top: 40px;">
                <table class="grid" style="width: 800px" cellpadding="0" cellspacing="0" runat="server" id="tbEdit">
                    <tr>
                        <th style="width: 10%"></th>
                        <th style="width: 90%"></th>
                    </tr>
                    <tr>
                        <td class="lbl">调用方法</td>
                        <td class="txt">
                            <asp:ETextBox runat="server" ID="action" Width="70%" Height="30"></asp:ETextBox>

                            <asp:EButton ID="btnCreate0" runat="server" CssClass="btn-blue" OnClientClick="call()" Text="调用接口" />

                        </td>
                    </tr>
                </table>
            </div>


            <div style="margin-top: 40px;">
                <table class="grid" style="width: 800px" cellpadding="0" cellspacing="0" runat="server" id="Table1">
                    <tr>
                        <th style="width: 10%"></th>
                        <th style="width: 90%"></th>
                    </tr>
                    <tr>
                        <td class="lbl">调用地址</td>
                        <td class="txt">
                            <asp:ETextBox runat="server" ID="txtAPIUrl" Width="85%" TextMode="MultiLine" Rows="4"></asp:ETextBox>


                        </td>
                    </tr>
                </table>
            </div>


        </div>
    </form>
</body>
</html>
