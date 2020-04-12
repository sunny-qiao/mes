<%@ page language="C#" autoeventwireup="true" inherits="App_Config_frmEciConfigList, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>应用参数</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function addAction() {
            var url = "EciConfigEdit.aspx";
            eci.dialog("应用参数", url);
        }

        function editAction(obj) {
            var key = $(obj).getKey();
            var url = "EciConfigEdit.aspx?key=" + key;
            eci.dialog("应用参数", url);
        }

        function gridEdit(key) {

            var url = "EciConfigEdit.aspx?key=" + key;
            eci.dialog("应用参数", url);
        }

        var saved = false;

        function trySearch() {
            if (saved) {
                postback("btnSearch");
            }
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">

            <asp:ETitle runat="server" ID="pagetitle" Title="查询页面"></asp:ETitle>

            <div id="divQuery" style="width: 100%;">
                <table id="tbQuery" class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="width: 20%"></th>
                        <th style="width: 30%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 30%"></th>

                    </tr>
                    <tr>
                        <td class="lbl">代码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCode" DataField="CODE" Query="A.CODE|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">名称</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtName" DataField="NAME" Query="A.NAME|string|like" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">值</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtValue" DataField="VALUE" Query="A.VALUE|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">是否启用</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboStatus" DataField="STATUS" Query="A.STATUS|string|like" Width="85%">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem Value="Y">是</asp:ListItem>
                                <asp:ListItem Value="N">否</asp:ListItem>
                            </asp:ECombox></td>

                    </tr>

                    <tr>
                        <td class="center" colspan="6">
                            <asp:EButton runat="server" ID="btnSearch" Text="查询" Icon="find" />
                            <asp:EButton runat="server" ID="btnReset" IsClient="true" Text="重置" Icon="reset" OnClientClick="eci.reset('tbQuery');" /></td>
                    </tr>
                </table>
            </div>
            <div id="toolbar">
                <asp:EButton runat="server" ID="btnAdd" Text="新增" Icon="Add" OnClientClick="addAction();" IsClient="true" />
            </div>
            <div id="datagrid">

                <asp:EGridView ID="gvData" Layout="divQuery,toolbar,pagetitle" runat="server"
                    FitWindow="true" EnableSorting="True" EnableSelect="false" EnablePaging="true" EnableClickSelectRow="true"
                    Width="1000px" KeyField="ID" EnableDblClick="true" DblClickEventName="gridEdit">
                    <Columns>

                        <asp:TemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:EButton runat="server" ID="btnEdit" Text="编辑" IsClient="true" Icon="edit" OnClientClick="editAction(this);" />
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:EButton runat="server" Icon="Delete" ID="btnDelete" Text="删除" IsClient="true" OnClientClick="return deleteAction(this);" CommandArgument='<%#Eval("ID")%>' OnClick="btnDelete_Click" />

                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:BoundField DataField="CODE" HeaderText="代码" SortExpression="CODE" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="NAME" HeaderText="名称" SortExpression="NAME" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="VALUE" HeaderText="设定值" SortExpression="VALUE" ItemStyle-Width="350"></asp:BoundField>
                        <asp:BoundField DataField="STATUS" HeaderText="是否启用" SortExpression="STATUS" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="MEMO" HeaderText="备注" SortExpression="MEMO" ItemStyle-Width="150"></asp:BoundField>

                    </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
