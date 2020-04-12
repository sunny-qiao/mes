<%@ page language="C#" autoeventwireup="true" inherits="App_Language_frmEciLanguageList, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>语言包</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function addAction() {
            var url = "EciMsgEdit.aspx";
            eci.dialog("系统提示", url, { width: 800, height: 400 });
        }

        function editAction(obj) {
            var key = $(obj).getKey();
            var url = "EciMsgEdit.aspx?key=" + key;
            eci.dialog("系统提示", url, { width: 800, height: 400 });
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">

            <asp:ETitle runat="server" ID="pagetitle" Title="系统提示"></asp:ETitle>

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
                        <td class="lbl">编码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCode" DataField="CODE" Query="A.CODE|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">名称</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtName" DataField="NAME" Query="A.NAME|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">系统代码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtSysCode" DataField="SYS_CODE" Query="A.SYS_CODE|string|like" Width="85%"></asp:ETextBox></td>
                        
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
                <asp:EButton runat="server" ID="btnPublish" Text="发布" Icon="world"   OnClick="btnPublish_Click" />
                 <asp:EButton runat="server" ID="btnExport" Text="导出EXCEL" Icon="excel" OnClick="btnExport_Click"  CancelLoading="true" />
            </div>
            <div id="datagrid">

                <asp:EGridView ID="gvData" Layout="divQuery,toolbar,pagetitle" runat="server"
                    FitWindow="true" EnableSorting="True" EnableSelect="false" EnablePaging="true" EnableClickSelectRow="true"
                    Width="1000px" KeyField="ID" PageSize="20" HAlign="center" OnClick="editAction">
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


                        <asp:BoundField DataField="SYS_CODE" HeaderText="系统代码" SortExpression="SYS_CODE" ItemStyle-Width="80"></asp:BoundField>
                        <asp:BoundField DataField="MODULE" HeaderText="系统模块" SortExpression="MODULE" ItemStyle-Width="0"></asp:BoundField>
                        <asp:BoundField DataField="CODE" HeaderText="编码" SortExpression="CODE" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="NAME" HeaderText="名称" SortExpression="NAME" ItemStyle-Width="500" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                        <asp:BoundField DataField="NOTE" HeaderText="备注" SortExpression="NOTE" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="CREATE_DATE" HeaderText="创建日期" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" SortExpression="CREATE_DATE" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="CREATE_USER" HeaderText="创建人" SortExpression="CREATE_USER" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="UPDATE_DATE" HeaderText="修改日期" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" SortExpression="UPDATE_DATE" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="UPDATE_USER" HeaderText="修改人" SortExpression="UPDATE_USER" ItemStyle-Width="150"></asp:BoundField>

                    </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
