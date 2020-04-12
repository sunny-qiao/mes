<%@ page language="C#" autoeventwireup="true" inherits="App_Basic_EciDataCodeList, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>数据分组明细</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        function deleteAction(obj) {
            msg.validate("确定要执行删除操作吗?", obj);
        }

        function batchDeleteAction(obj) {
            if (!eci.selectRow()) { return false; }
            msg.validate("确定要执行删除操作吗?", obj);
        }


        function addAction() {
            var prefix = $("#hidPrefix").val();
            var groupCode = $("#cboGroupCode").val();
            if (groupCode.indexOf(',') > 0)
            {
                msg.warning("请选择具体的分组类型,再点击新增");
                return;
            }
 
            var url = "EciDataCodeEdit.aspx?groupCode=" + groupCode;

            if (prefix) {
                url = urlAppend(url, "prefix=" + prefix)
            }

            var title = window.document.title;
            eci.dialog(title + "维护", url, { width: 800, height: 400 });
        }

        function editAction(obj) {
            var prefix = $("#hidPrefix").val();
            var key = $(obj).getKey();
            var url = "EciDataCodeEdit.aspx?key=" + key;

            if (prefix) {
                url = urlAppend(url, "prefix=" + prefix)
            }

            var title = window.document.title;
            eci.dialog(title + "维护", url, { width: 800, height: 400 });
        }

        function search() {
            postback("btnSearch");
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" runat="server" id="hidGroupCode" />
        <input type="hidden" runat="server" id="hidPrefix" />

        <div id="root">
            <asp:ETitle runat="server" ID="pagetitle" Title="基础数据"></asp:ETitle>

            <div id="divQuery" style="width: 100%;">
                <table id="tbQuery" class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="width: 10%"></th>
                        <th style="width: 40%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 40%"></th>

                    </tr>
                    <tr>
                        <td class="lbl">分组类型</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboGroupCode" DataField="GROUP_CODE" Query="A.GROUP_CODE|S|m" Width="85%">
                            </asp:ECombox></td>
                        <td class="lbl">是否启用</td>
                        <td>
                            <asp:EDropDownList runat="server" ID="ddlStatus" DataField="STATUS" Query="A.STATUS|S|=" Width="85%">
                                <asp:ListItem Value=""></asp:ListItem>
                                <asp:ListItem Value="Y">是</asp:ListItem>
                                <asp:ListItem Value="N">否</asp:ListItem>
                            </asp:EDropDownList></td>


                    </tr>

                    <tr>
                        <td class="lbl">代码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtKeyValue" DataField="KEY_VALUE" Query="A.KEY_VALUE|s|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">名称</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtKeyName" DataField="KEY_NAME" Query="A.CREATE_DATE|s|like" Width="85%"></asp:ETextBox></td>


                    </tr>

                    <tr class="more-condition">
                        <td class="lbl">扩展1</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtUDF1" DataField="UDF1" Query="A.UDF1|s|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">扩展2</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtUDF2" DataField="UDF2" Query="A.UDF2|s|like" Width="85%"></asp:ETextBox></td>

                    </tr>

                    <tr>
                        <td class="center" colspan="4">
                            <asp:EButton runat="server" ID="btnSearch" Text="查询" Icon="find" />
                            <asp:EButton runat="server" ID="btnReset" IsClient="true" Text="重置" Icon="reset" OnClientClick="eci.reset('tbQuery');" />
                            <asp:EToggle runat="server" Selector=".more-condition" />

                        </td>
                    </tr>
                </table>
            </div>
            <div id="toolbar">
                <asp:EButton runat="server" ID="btnAdd" Text="新增" Icon="Add" OnClientClick="addAction();" IsClient="true" />
                <asp:EButton runat="server" Icon="delete" ID="btnBatchDelete" Text="批量删除" IsClient="true" OnClientClick="return batchDeleteAction(this);" CommandArgument='<%#Eval("ID")%>' OnClick="btnBatchDelete_Click" />

                <asp:EButton ID="btnMainClose" runat="server" Icon="close" IsClient="true" OnClientClick="eci.close()" Text="关闭" />

            </div>
            <div id="datagrid">

                <asp:EGridView ID="gvData" Layout="divQuery,toolbar,pagetitle" runat="server" BorderStyle="None"
                    FitWindow="true" EnableSorting="True" EnablePaging="true" EnableSelect="true" EnableClickSelectRow="true" BorderWidth="0px" CssClass="grid"
                    Width="1000px" KeyField="ID" OnClick="editAction(this)">
                    <Columns>

                        <asp:TemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:EButton runat="server" ID="btnEdit" Text="编辑" IsClient="true" Icon="edit" OnClientClick="editAction(this);" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="KEY_VALUE" HeaderText="编码" SortExpression="KEY_VALUE" ItemStyle-Width="150" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="KEY_NAME" HeaderText="名称" SortExpression="KEY_NAME" ItemStyle-Width="150" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="MEMO" HeaderText="描述" SortExpression="MEMO" ItemStyle-Width="250" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="SEQ" HeaderText="显示顺序" SortExpression="SEQ" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="STATUS_NAME" HeaderText="是否启用" SortExpression="STATUS" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="UDF1" HeaderText="扩展1" SortExpression="UDF1" ItemStyle-Width="150" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="UDF2" HeaderText="扩展2" SortExpression="UDF2" ItemStyle-Width="150" ItemStyle-HorizontalAlign="Center"></asp:BoundField>

                        <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90">
                            <ItemTemplate>
                                <asp:EButton runat="server" Icon="delete" ID="btnDelete" Text="删除" IsClient="true" OnClientClick="return deleteAction(this);" CommandArgument='<%#Eval("ID")%>' OnClick="btnDelete_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
