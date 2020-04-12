<%@ page language="C#" autoeventwireup="true" enablesessionstate="True" inherits="App_Basic_Dictionary, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>程序设计</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        function egridClick(key, tr, gridId) {
            var url = "DictionaryEdit.aspx?guid=" + key;
            eci.open(url, { full: true });
        }
        function add() {
            var url = "DictionaryEdit.aspx";
            eci.open(url, { full: true });
        }

        function deleteAction() {
            if (!eci.selectRow()) {
                return false;
            }

            eci.window("divDeleteTable");

            $("#password").focus();
        }

        function deleteTableExecute() {
            var guid = eci.selectedKey();

            var password = $("#password").val().trim();
            if (password == "") {
                msg.error("请输入密码");
                eci.focus("password");
                return false;
            }

            $.eci.post("Data/Data.ashx", "TxDeleteEciTable", { password: password, guid: guid }, deleteResponse);

            return false;
        }

        var deleteResponse = function (response) {

            msg.ajax(response);

            if (response.success) {
                window.setTimeout(function () {
                    window.location.href = "Dictionary.aspx"
                }, 500);
            }
        }

        function publish() {
            msg.loading();
            eci.post("data/Data.ashx", "Publish", {})
        }

        function publishAll() {
            msg.loading();
            eci.post("data/Data.ashx", "PublishAll", {})
        }

        function listConfig(code) {
            var url = "../../App/UIConfig/ListConfig.aspx?code=" + code
            eci.dialog("显示配置", url, { width: 800 });
        }

    </script>
</head>
<body class="body">
    <form id="form1" runat="server">
        <div id="root">

            <div class="pagetitle" id="pagetitle">
                <div class="space">程序设计</div>
            </div>
            <div id="divQuery" style="width: 100%;">
                <table id="tbQuery" runat="server" class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr>
                        <td class="lbl">页面代码
                        </td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCODE" DataField="CODE" Query="CODE|string|like" Width="85%" ImeDisabled="false" AutoUpper="true"></asp:ETextBox>
                        </td>
                        <td class="lbl">页面名称
                        </td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtMAIN_ALIAS" DataField="MAIN_ALIAS" Query="MAIN_ALIAS|string|like" Width="85%"></asp:ETextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">数据表名
                        </td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtTABLE_NAME" DataField="TABLE_NAME" Width="85%" Query="TABLE_NAME|string|like" ImeDisabled="false" AutoUpper="true"></asp:ETextBox>
                        </td>
                        <td class="lbl">类型</td>
                        <td>
                            <asp:EDropDownList runat="server" ID="ddlTYPE" DataField="TYPE" Query="TYPE|string|=" Width="85%">
                                <asp:ListItem Value=""></asp:ListItem>
                                <asp:ListItem>正式配置</asp:ListItem>
                                <asp:ListItem>临时配置</asp:ListItem>
                            </asp:EDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" class="center">
                            <asp:EButton ID="btnSearch" Icon="Find" runat="server" Text="查询(Q)" AccessKey="q" />
                            <asp:EButton ID="btnReset" Icon="Reset" runat="server" Text="重置(R)" IsClient="true" OnClientClick="$.eci.reset('tbQuery');"
                                AccessKey="r" />
                        </td>
                    </tr>
                </table>
            </div>
            <div id="toolbar">
                <asp:EButton ID="btnAdd" runat="server" Text=" 新增(N)" AccessKey="n" Icon="Add" IsClient="true" OnClientClick="add();" />

                <asp:EButton ID="btnPublish" runat="server" Text="发布"
                    Width="80" OnClientClick="publish()" IsClient="true" Icon="World" />

                <asp:EButton ID="btnPublishAll" runat="server" Text="全部重新发布"
                    IsClient="true" OnClientClick="publishAll()" Icon="World"   />

                <asp:EButton ID="btnDelete" runat="server" Text="删除"
                    Width="80" OnClick="btnPublish_Click" Icon="delete" IsClient="true" OnClientClick="deleteAction()" />

            </div>
            <div id="datagrid">
                <asp:EGridView ID="gvData" Layout="divQuery,pagetitle,toolbar" runat="server" BorderStyle="None"
                    FitWindow="true" EnableDblClick="true" BorderWidth="0px" EnableSorting="True" CssClass="grid"
                    Width="1000px" EnableSelect="true" EnablePaging="true" KeyField="GUID" EnableClickSelectRow="true">
                    <Columns>
                        <asp:BoundField DataField="CODE" HeaderText="页面代码" SortExpression="CODE" ItemStyle-Width="220px"></asp:BoundField>
                        <asp:BoundField DataField="MAIN_ALIAS" HeaderText="页面名称" SortExpression="MAIN_ALIAS"
                            ItemStyle-Width="180px"></asp:BoundField>
                        <asp:BoundField DataField="TABLE_NAME" HeaderText="数据表名" SortExpression="TABLE_NAME"
                            ItemStyle-Width="180px"></asp:BoundField>
                        <asp:BoundField DataField="TYPE" HeaderText="配置类型" SortExpression="TYPE" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="100px"></asp:BoundField>
                        <asp:BoundField DataField="REMARKS" HeaderText="备注" SortExpression="REMARKS" ItemStyle-Width="230px"></asp:BoundField>
                        <asp:BoundField DataField="UPDATE_DATE" ItemStyle-Width="130px" HeaderText="最后修改日期"
                            SortExpression="UPDATE_DATE" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"></asp:BoundField>
                    </Columns>
                </asp:EGridView>
            </div>
        </div>
        <asp:EWindow runat="server" Icon="wrench" ID="divDeleteTable" Title="程序删除" Width="500px" Height="100px" EnableBackgroundColor="true">

            <div style='padding: 10px;'>
                输入密码：<input type='password' id='password' name='password' class="text-input" />
                <asp:EButton ID="EButton1" Icon="delete" runat="server" Text="确认删除" IsClient="true" OnClientClick="return  deleteTableExecute();" />
            </div>
        </asp:EWindow>

    </form>
</body>
</html>
