<%@ page language="C#" autoeventwireup="true" inherits="App_System_EciFeedBackListMe, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>我的反馈</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        function addAction(obj) {
          
            var url = "EciFeedBack.aspx";
            window.location.href = url;

        }

        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function editAction(obj) {
            var key = $(obj).getKey();
            var url = "EciFeedBackView.aspx?key=" + key;
            window.location.href = url;

        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">


            <div id="divQuery" style="width: 100%;">
                <table id="tbQuery" class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="width: 20%"></th>
                        <th style="width: 30%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 30%"></th>

                    </tr>
                    <tr>
                        <td class="lbl">系统代码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtSysCode" DataField="SYS_CODE" Query="A.SYS_CODE|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">系统名称</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtSysName" DataField="SYS_NAME" Query="A.SYS_NAME|string|like" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">反馈日期</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCreateDateStart" DataField="CREATE_DATE_S" Format="yyyy-MM-dd HH:mm:ss" Query="A.CREATE_DATE|Date|start" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">至</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCreateDateEnd" DataField="CREATE_DATE_E" Format="yyyy-MM-dd HH:mm:ss" Query="A.CREATE_DATE|Date|end" IsDate="true" Width="85%"></asp:ETextBox></td>

                    </tr>

                    <tr>
                        <td class="lbl">反馈状态</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboStatus" DataField="STATUS" Query="A.STATUS|string|=" Width="85%">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem Value="TB">提报</asp:ListItem>
                                <asp:ListItem Value="SL">已受理</asp:ListItem>
                            </asp:ECombox></td>
                        <td class="lbl">反馈人</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtLoginNo" ReadOnly="true" DataField="LOGIN_NO" Query="A.LOGIN_NO|string|=" Width="85%"></asp:ETextBox></td>

                    </tr>

                    <tr>
                        <td class="center" colspan="4">
                            <asp:EButton runat="server" ID="btnSearch" Text="查询" Icon="find" />
                            <asp:EButton runat="server" ID="btnReset" IsClient="true" Text="重置" Icon="reset" OnClientClick="eci.reset('tbQuery');" />&nbsp;
                        <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" />

                        </td>
                    </tr>
                </table>
            </div>
            <div id="toolbar">
                 <asp:EButton runat="server" ID="btnAdd" Text="新增" Icon="Add" OnClientClick="addAction();" IsClient="true" />
                <asp:EButton runat="server" ID="btnExport" Text="导出EXCEL" Icon="excel" OnClick="btnExport_Click" CancelLoading="true" />

            </div>
            <div id="datagrid">

                <asp:EGridView ID="gvData" Layout="divQuery,toolbar,pagetitle" runat="server"
                    FitWindow="true" EnableSorting="True" EnableSelect="false" EnablePaging="true" EnableClickSelectRow="true"
                    Width="1000px" KeyField="ID" HAlign="center" OnClick="editAction">
                    <Columns>

                        <asp:TemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:EButton runat="server" ID="btnEdit" Text="查看" IsClient="true" Icon="edit" OnClientClick="editAction(this);" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:EButton runat="server" Icon="Delete" ID="btnDelete" Text="删除" IsClient="true" OnClientClick="return deleteAction(this);" CommandArgument='<%#Eval("ID")%>' OnClick="btnDelete_Click" />

                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:BoundField DataField="STATUS_NAME" HeaderText="状态" SortExpression="STATUS" ItemStyle-Width="80"></asp:BoundField>

                        <asp:BoundField DataField="SYS_CODE" HeaderText="系统代码" SortExpression="SYS_CODE" ItemStyle-Width="0"></asp:BoundField>
                        <asp:BoundField DataField="SYS_NAME" HeaderText="系统名称" SortExpression="SYS_NAME" ItemStyle-Width="0"></asp:BoundField>
                        <asp:BoundField DataField="LOGIN_NO" HeaderText="登录账号" SortExpression="LOGIN_NO" ItemStyle-Width="100"></asp:BoundField>
                        <asp:BoundField DataField="CREATE_USER" HeaderText="反馈人" SortExpression="CREATE_USER" ItemStyle-Width="100"></asp:BoundField>
                        <asp:BoundField DataField="CREATE_DATE" HeaderText="反馈日期" SortExpression="CREATE_DATE" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="ACCEPT_USER" HeaderText="回复人" SortExpression="ACCEPT_USER" ItemStyle-Width="100"></asp:BoundField>
                        <asp:BoundField DataField="ACCEPT_DATE" HeaderText="回复日期" SortExpression="ACCEPT_DATE" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" ItemStyle-Width="150"></asp:BoundField>


                        <asp:BoundField DataField="COMPANY_CODE" HeaderText="公司代码" SortExpression="COMPANY_CODE" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="COMPANY_NAME" HeaderText="公司名称" SortExpression="COMPANY_NAME" ItemStyle-Width="150"></asp:BoundField>

                    </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
