<%@ page language="C#" autoeventwireup="true" inherits="App_File_FileTypeList, ECI.Web" enableviewstatemac="false" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>业务类型</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function addAction() {
            var url = "FileTypeEdit.aspx";
            eci.dialog("附件上传类型", url);
        }

        function editAction(obj) {
            var key = $(obj).getKey();
            var url = "FileTypeEdit.aspx?key=" + key;
            eci.dialog("附件上传类型", url);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">


            <div id="divQuery" style="width: 100%;">
                <table id="tbQuery" class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="width: 10%"></th>
                        <th style="width: 23%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 23%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 23%"></th>
                    </tr>
                    <tr>
                        <td class="lbl">编码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCode" DataField="CODE" Query="A.CODE|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">名称</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtName" DataField="NAME" Query="A.NAME|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">状态</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboStatus" DataField="STATUS" Query="A.STATUS|string|=" Width="85%">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem Text="启用" Value="Y"></asp:ListItem>
                                <asp:ListItem Text="禁用" Value="N"></asp:ListItem>
                            </asp:ECombox></td>
                    </tr>
                    <tr>
                        <td class="lbl">保存到数据库</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboSaveDB" DataField="SAVE_DB" Query="A.SAVE_DB|string|=" Width="85%">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem Text="是" Value="Y"></asp:ListItem>
                                <asp:ListItem Text="否" Value="N"></asp:ListItem>
                            </asp:ECombox></td>
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
                    Width="1000px" KeyField="GUID" HAlign="center" OnClick="editAction">
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

                        <asp:BoundField DataField="CODE" HeaderText="编码" SortExpression="CODE" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="NAME" HeaderText="名称" SortExpression="NAME" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="SAVE_DB" HeaderText="保存到数据库" SortExpression="SAVE_DB" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="STATUS" HeaderText="状态" SortExpression="STATUS" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="CREATE_USER" HeaderText="创建人" SortExpression="CREATE_USER" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="CREATE_DATE" HeaderText="创建时间" SortExpression="CREATE_DATE" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                    </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
