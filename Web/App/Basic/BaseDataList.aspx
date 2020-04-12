<%@ page language="C#" autoeventwireup="true" inherits="App_BasicData_BaseDataList, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>基础数据</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function addAction() {
            var type = $("#hidType").val();

            var url = "BaseDataEdit.aspx?type=" + type;

            var title = window.document.title;
            eci.dialog(title + "维护", url, { width: 800, height: 400 });
        }

        function editAction(obj) {
            var key = $(obj).getKey();
            var type = $("#hidType").val();
            var url = "BaseDataEdit.aspx?key=" + key + "&type=" + type;
            var title = window.document.title;
            eci.dialog(title, url, { width: 800, height: 400 });
        }

        function edit(key) {
            var type = $("#hidType").val();
            var url = "BaseDataEdit.aspx?key=" + key + "&type=" + type;
            var title = window.document.title;
            eci.dialog(title, url, { width: 800, height: 400 });
        }

        function search() {
            postback("btnSearch");
        }

        function createAction() {
            eci.window("winMain");
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" runat="server" id="hidType" />
        <input type="hidden" runat="server" id="hidTitle" />

        <div id="root">

            <asp:ETitle runat="server" ID="pagetitle" Title="基础数据"></asp:ETitle>

            <div id="divQuery" style="width: 100%;">
                <table id="tbQuery" class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                    </tr>
                    <tr>
                        <td class="lbl">代码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCode" DataField="CODE" Query="A.CODE|s|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">名称</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtName" DataField="NAME" Query="A.NAME|s|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">是否启用</td>
                        <td>
                            <asp:EDropDownList runat="server" ID="ddlStatus" DataField="STATUS" Query="A.STATUS|S|=" Width="85%">
                                <asp:ListItem Value=""></asp:ListItem>
                                <asp:ListItem Value="Y">是</asp:ListItem>
                                <asp:ListItem Value="N">否</asp:ListItem>
                            </asp:EDropDownList></td>

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
                <asp:EButton runat="server" ID="btnCreate" Text="创建基础资料" Icon="execute" OnClientClick="createAction();" IsClient="true" />
            </div>
            <div id="datagrid">

                <asp:EGridView ID="gvData" Layout="divQuery,toolbar,pagetitle" runat="server" BorderStyle="None"
                    FitWindow="true" EnableSorting="True" EnablePaging="true" EnableClickSelectRow="true" BorderWidth="0px" CssClass="grid"
                    Width="1000px" KeyField="GUID" EnableDblClick="true" DblClickEventName="edit" HAlign="center">
                    <Columns>

                        <asp:TemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:EButton runat="server" ID="btnEdit" Text="编辑" IsClient="true" Icon="edit" OnClientClick="editAction(this);" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90">
                            <ItemTemplate>
                                <asp:EButton runat="server" Icon="delete" ID="btnDelete" Text="删除" IsClient="true" OnClientClick="return deleteAction(this);" CommandArgument='<%#Eval("GUID")%>' OnClick="btnDelete_Click" />

                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="CODE" HeaderText="代码" SortExpression="CODE" ItemStyle-Width="150" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="NAME" HeaderText="名称" SortExpression="NAME" ItemStyle-Width="300" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="MEMO" HeaderText="备注" SortExpression="MEMO" ItemStyle-Width="250" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="SEQ" HeaderText="顺序" SortExpression="SEQ" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="STATUS_NAME" HeaderText="是否启用" SortExpression="STATUS" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Center"></asp:BoundField>

                    </Columns>
                </asp:EGridView>
            </div>
        </div>



        <asp:EWindow runat="server" ID="winMain" Title="创建基础资料" Width="800" Height="400" BackColor="White" Icon="book_open">

            <table class="grid">
                <tr>
                    <th style="width: 100px;"></th>
                    <th></th>
                </tr>

                <tr>
                    <td class="lbl lbl-top">数据表名</td>
                    <td>
                        <asp:ETextBox runat="server" ID="txtTableName" Width="99%" Rows="6" TextMode="MultiLine"></asp:ETextBox>


                    </td>
                </tr>

                <tr>
                    <td class="lbl">功能菜单</td>

                    <td>
                        <asp:ETextBox runat="server" ID="txtUrl" Width="99%" Rows="6" TextMode="MultiLine"></asp:ETextBox>
                    </td>

                </tr>
                <tr>
                    <td class="center" colspan="2">

                        <asp:EButton ID="btnExecute" runat="server" Icon="ok" Text="确定" OnClick="btnExecute_Click" />
                        <asp:EButton ID="btnMainClose" runat="server" Icon="close" IsClient="true" OnClientClick="eci.closewindow(this)" Text="关闭" />
                    </td>
                </tr>
            </table>




        </asp:EWindow>


    </form>
</body>
</html>
