<%@ page language="C#" autoeventwireup="true" inherits="App_System_frmEciErrorList, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>异常编码</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function addAction() {
            var url = "frmEciErrorEdit.aspx";
            eci.open(url);
        }

        function editAction(obj) {
            var key = $(obj).getKey();
            var url = "frmEciErrorEdit.aspx?key=" + key;
            eci.open(url);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">
            <div class="pagetitle" id="pagetitle" runat="server">异常编码</div>

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
                            <asp:ETextBox runat="server" ID="txtCode" DataField="CODE" Query="A.CODE|string|like" Width="85%" AutoUpper="true"></asp:ETextBox></td>
                        <td class="lbl">信息</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtName" DataField="NAME" Query="A.NAME|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">语言</td>
                        <td>
                            <asp:EDropDownList runat="server" ID="txtLang" DataField="LANG" Query="A.LANG|string|=" Width="85%">
                                <asp:ListItem Value=""></asp:ListItem>
                                <asp:ListItem Value="ZH-CN">中文</asp:ListItem>
                                <asp:ListItem Value="EN">英文</asp:ListItem>
                            </asp:EDropDownList></td>

                    </tr>
                    <tr>
                        <td class="lbl">业务域</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtDomain" DataField="DOMAIN" Query="A.DOMAIN|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="lbl">&nbsp;</td>
                        <td>&nbsp;</td>

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
                    Width="1000px" KeyField="GUID">
                    <Columns>

                        <asp:TemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:EButton runat="server" ID="btnEdit" Text="编辑" IsClient="true" Icon="edit" OnClientClick="editAction(this);" />
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:EButton runat="server" Icon="Delete" ID="btnDelete" Text="删除" IsClient="true" OnClientClick="return deleteAction(this);" CommandArgument='<%#Eval("GUID")%>' OnClick="btnDelete_Click" />

                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="DOMAIN" HeaderText="业务域" SortExpression="DOMAIN" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="CODE" HeaderText="代码" SortExpression="CODE" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="NAME" HeaderText="信息" SortExpression="NAME" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="LANG" HeaderText="语言" SortExpression="LANG" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="MEMO" HeaderText="备注" SortExpression="MEMO" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="HELP_CODE" HeaderText="帮助编码" SortExpression="HELP_CODE" ItemStyle-Width="150"></asp:BoundField>

                    </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
