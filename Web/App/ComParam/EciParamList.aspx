<%@ page language="C#" autoeventwireup="true" inherits="App_COMParam_frmEciParamList, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>系统参数</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function addAction() {
            var groupId = $("#hidGroupId").val();
            var url = "EciParamEdit.aspx?groupId=" + groupId;
            parent.eci.dialog("企业参数配置", url);

            parent.hasSaved = false;


        }

        function editAction(obj) {
            var key = $(obj).getKey();
            var url = "EciParamEdit.aspx?key=" + key;
            parent.eci.dialog("企业参数配置", url);
            parent.hasSaved = false;
        }

        function rowEdit(key, tr) {
            var url = "EciParamEdit.aspx?key=" + key;
            parent.eci.dialog("企业参数配置", url);
            parent.hasSaved = false;
        }

        function batchEditAction() {
            var groupId = $("#hidGroupId").val();
            var url = "EciParamBatchEdit.aspx?groupId=" + groupId;
            parent.eci.dialog("企业参数配置", url);
            parent.hasSaved = false;
        }

        var hasSaved = false;

        function saved() {
            hasSaved = true;
        }

        function search() {
            if (hasSaved) {
                postback("btnSearch");
            }
        }

        function newWindowAction(obj) {
            var url = window.location.href;
            eci.open(url, { full: true })
        }



    </script>
</head>
<body>
    <form id="form1" runat="server">

        <input type="hidden" id="hidGroupId" runat="server" />
        <div>
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
                        <td class="lbl">参数编码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtParamKey" DataField="PARAM_KEY" Query="A.PARAM_KEY|string|like" Width="85%" AutoUpper="true"></asp:ETextBox></td>
                        <td class="lbl">参数名称</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtParamName" DataField="PARAM_NAME" Query="A.PARAM_NAME|string|like" Width="85%" AutoUpper="true"></asp:ETextBox></td>
                        <td class="lbl">参数状态</td>
                        <td>
                            <asp:EDropDownList runat="server" ID="txtStatus" DataField="STATUS" Query="A.STATUS|string|like" Width="85%" R="Y">
                                <asp:ListItem Value=""></asp:ListItem>
                                <asp:ListItem Value="Y" Selected="True">在用</asp:ListItem>
                                <asp:ListItem Value="N">停用</asp:ListItem>

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

                <asp:EButton runat="server" ID="btnExport" Text="导出EXCEL" CancelLoading="true" Icon="excel" OnClick="btnExport_Click" />

                <asp:EButton runat="server" ID="btnNewWindow" Text="新窗口中打开" Icon="window" IsClient="true" OnClientClick="newWindowAction(this)" />

                <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Visible="false" Icon="close" OnClientClick="eci.close();" />


            </div>
            <div id="datagrid">

                <asp:EGridView ID="gvData" Layout="toolbar,pagetitle,tbQuery" runat="server"
                    FitWindow="true" EnableSorting="True" EnableSelect="false" EnablePaging="true" EnableClickSelectRow="true"
                    Width="1000px" KeyField="ID" EnableDblClick="true" DblClickEventName="rowEdit" PageSize="20">
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

                        <asp:BoundField DataField="GROUP_NAME" HeaderText="分组名称" ItemStyle-Width="0" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="PARAM_NAME" HeaderText="参数名称" SortExpression="PARAM_NAME" ItemStyle-Width="350"></asp:BoundField>
                        <asp:BoundField DataField="PARAM_KEY" HeaderText="参数编码" SortExpression="PARAM_KEY" ItemStyle-Width="200" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                        <asp:BoundField DataField="PARAM_VALUE" HeaderText="参数值默认值" SortExpression="PARAM_VALUE" ItemStyle-Width="150" ItemStyle-HorizontalAlign="center"></asp:BoundField>
                        <asp:BoundField DataField="MEMO" HeaderText="备注" SortExpression="MEMO" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="STATUS" HeaderText="参数状态" SortExpression="STATUS" ItemStyle-Width="60" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="CREATE_DATE" HeaderText="创建日期" SortExpression="CREATE_DATE" ItemStyle-Width="130" ItemStyle-HorizontalAlign="Center"></asp:BoundField>


                    </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
