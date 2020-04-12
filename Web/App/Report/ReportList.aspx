<%@ page language="C#" autoeventwireup="true" inherits="AppRPT_Manage_ReportList, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        function deleteAction() {
            if (!eci.selectRow()) return false;

            msg.confirm("确定要执行删除操作吗?", function () {

                __doPostBack("btnDelete");
            });

            return false;
        }

        function add() {
            var url = "ReportEdit.aspx";
            eci.open(url);
        }

        function editAction(obj) {
            var key = $(obj).getKey();
            var url = "ReportEdit.aspx?key=" + key;
            eci.open(url);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">
            <asp:ETitle runat="server" ID="pagetitle" Title="报表开发"></asp:ETitle>

            <div id="divQuery" style="width: 100%;">
                <table class="grid" cellpadding="0" cellspacing="0" runat="server" id="tbQuery">
                    <tr>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                    </tr>
                    <tr>
                        <td class="lbl">报表编码
                        </td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCODE" DataField="CODE" Width="85%"></asp:ETextBox>
                        </td>
                        <td class="lbl">报表名称</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtNAME" DataField="NAME" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">状态</td>
                        <td>
                            <asp:EDropDownList runat="server" ID="ddlStatus" R="1" DataField="STATUS" Width="85%">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                                <asp:ListItem Value="0">停用</asp:ListItem>

                            </asp:EDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" class="center">

                            <asp:EButton runat="server" ID="btnSearch" Text="查询" Icon="Find" />
                            <asp:EButton runat="server" ID="btnReset" IsClient="true" Text="重置" Icon="Erase" />


                        </td>
                    </tr>
                </table>
            </div>


            <div id="toolbar">


                <asp:EButton runat="server" ID="btnAdd" Text="新增" OnClientClick="add();" IsClient="true" Icon="Add" />

                <asp:EButton runat="server" ID="btnDelete" Icon="Delete" Text="删除" OnClientClick="return  deleteAction();" OnClick="btnDelete_Click" />

                <asp:EButton runat="server" ID="btnExport" Text="导出" Icon="excel" OnClick="btnExport_Click" CancelLoading="true" />

            </div>
            <div id="datagrid">
                <asp:EGridView ID="gvData" Layout="divQuery,toolbar,pagetitle" runat="server" BorderStyle="None"
                    FitWindow="true" EnableSorting="True" EnableSelect="true" EnablePaging="true" EnableClickSelectRow="true" BorderWidth="0px" CssClass="grid"
                    Width="1000px" OnClick="editAction(this)" KeyField="GUID">
                    <Columns>
                        <asp:BoundField DataField="CODE" HeaderText="报表编码" SortExpression="CODE"
                            ItemStyle-Width="170px"></asp:BoundField>
                        <asp:BoundField DataField="NAME" HeaderText="报表名称" SortExpression="NAME"
                            ItemStyle-Width="300px"></asp:BoundField>
                        <asp:BoundField DataField="TYPE" HeaderText="报表类型" SortExpression="TYPE"
                            ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Center"></asp:BoundField>

                        <asp:BoundField DataField="TEMPLATE_FILE" HeaderText="模板文件" SortExpression="TEMPLATE_FILE"
                            ItemStyle-Width="350px" ItemStyle-HorizontalAlign="Left"></asp:BoundField>

                        <asp:BoundField DataField="CREATE_DATE" HeaderText="创建日期" SortExpression="CREATE_DATE" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"
                            ItemStyle-Width="130px" ItemStyle-HorizontalAlign="Center"></asp:BoundField>

                        <asp:BoundField DataField="UPDATE_DATE" HeaderText="修改日期" SortExpression="UPDATE_DATE" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"
                            ItemStyle-Width="130px" ItemStyle-HorizontalAlign="Center"></asp:BoundField>

                    </Columns>
                </asp:EGridView>
            </div>

        </div>




    </form>
</body>
</html>
