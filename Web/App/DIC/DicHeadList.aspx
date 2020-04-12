<%@ page language="C#" autoeventwireup="true" enablesessionstate="True" inherits="App_DIC_DicHeadList, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>数据字典</title>

    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        function egridClick(id, tr, gridId) {
            var url = "DicHeadEdit.aspx?id=" + id;
            eci.open(url, { full: true });
        }
        function add() {
            var url = "DicHeadEdit.aspx";
            eci.open(url, { full: true });
        }



    </script>
</head>
<body class="body">
    <form id="form1" runat="server">
        <div id="root">


            <div id="divQuery" style="width: 100%;">
                <table id="tbQuery" runat="server" class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr>
                        <td class="lbl">代码
                        </td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCODE" DataField="CODE" Query="CODE|string|like" Width="85%" ImeDisabled="false" AutoUpper="true"></asp:ETextBox>
                        </td>
                        <td class="lbl">名称
                        </td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtMAIN_ALIAS" DataField="MAIN_ALIAS" Query="MAIN_ALIAS|string|like" Width="85%"></asp:ETextBox>
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

            </div>
            <div id="datagrid">
                <asp:EGridView ID="gvData" Layout="divQuery,pagetitle,toolbar" runat="server" BorderStyle="None"
                    FitWindow="true" EnableDblClick="true" BorderWidth="0px" EnableSorting="True" CssClass="grid"
                    Width="1000px" EnableSelect="true" EnablePaging="true" EnableConfig="true" KeyField="ID" EnableClickSelectRow="true" HAlign="center">
                    <Columns>
                         
                        <asp:BoundField DataField="CODE" HeaderText="代码" SortExpression="CODE" ItemStyle-Width="220px" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                        <asp:BoundField DataField="NAME" HeaderText="名称" SortExpression="NAME" ItemStyle-Width="180px"></asp:BoundField>
                        <asp:BoundField DataField="TABLE_NAME" HeaderText="表名" SortExpression="TABLE_NAME" ItemStyle-Width="220px" ItemStyle-HorizontalAlign="Left"></asp:BoundField>

                        <asp:BoundField DataField="MEMO" HeaderText="备注" SortExpression="MEMO" ItemStyle-Width="230px"></asp:BoundField>
                         <asp:BoundField DataField="CREATE_DATE" ItemStyle-Width="130px" HeaderText="创建时间"
                            SortExpression="CREATE_DATE" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"></asp:BoundField>
                        <asp:BoundField DataField="UPDATE_DATE" ItemStyle-Width="130px" HeaderText="修改时间"
                            SortExpression="UPDATE_DATE" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"></asp:BoundField>
                    </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
