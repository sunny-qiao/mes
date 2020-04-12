<%@ page language="C#" autoeventwireup="true" inherits="App_LoginHistory_frmEciLoginHistoryList, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>登录登出日志</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">



        function editAction(obj) {
            var key = $(obj).getKey();
            var url = "frmEciLoginHistoryEdit.aspx?key=" + key;
            eci.open(url);
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
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>

                    </tr>
                    <tr>
                        <td class="lbl">登录账号</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtLoginNo" DataField="LOGIN_NO" Query="A.LOGIN_NO|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">操作日期</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtOperationDateStart" DataField="OPERATION_DATE_S" Query="A.OPERATION_DATE|Date|start" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">至</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtOperationDateEnd" DataField="OPERATION_DATE_E" Query="A.OPERATION_DATE|Date|end" IsDate="true" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">是否成功</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboSuccess" DataField="SUCCESS" Query="A.SUCCESS|string|=" Width="85%">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem Value="Y">是</asp:ListItem>
                                <asp:ListItem Value="N">否</asp:ListItem>
                            </asp:ECombox></td>
                        <td class="lbl">类型</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtType" DataField="TYPE" Query="A.TYPE|string|like" Width="85%"></asp:ETextBox></td>
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
                 <asp:EButton runat="server" ID="btnExport" Text="导出EXCEL" Icon="excel" OnClick="btnExport_Click"  CancelLoading="true" />
                &nbsp;</div>
            <div id="datagrid">

                <asp:EGridView ID="gvData" Layout="divQuery,toolbar,pagetitle" runat="server"
                    FitWindow="true" EnableSorting="True" EnableSelect="true" EnablePaging="true" EnableClickSelectRow="true"
                    Width="1000px" KeyField="ID" HAlign="center"  OnClick="editAction">
                    <Columns>

                        <asp:TemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:EButton runat="server" ID="btnEdit" Text="查看" IsClient="true" Icon="book_open" OnClientClick="editAction(this);" />
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:EBoundField DataField="LOGIN_NO" GroupText="操作人" HeaderText="登录账号" SortExpression="LOGIN_NO" ItemStyle-Width="150"></asp:EBoundField>
                        <asp:EBoundField DataField="TRUE_NAME" GroupText="操作人" HeaderText="真实姓名" SortExpression="TRUE_NAME" ItemStyle-Width="150"></asp:EBoundField>
                        <asp:EBoundField DataField="COMPANY_CODE" GroupText="操作人" HeaderText="公司代码" SortExpression="COMPANY_CODE" ItemStyle-Width="150"></asp:EBoundField>
                        <asp:EBoundField DataField="COMPANY_NAME" GroupText="操作人" HeaderText="公司名称" SortExpression="COMPANY_NAME" ItemStyle-Width="150"></asp:EBoundField>
                        <asp:BoundField DataField="OPERATION_DATE" HeaderText="操作日期" SortExpression="OPERATION_DATE" ItemStyle-Width="140" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"></asp:BoundField>
                        <asp:BoundField DataField="OPERATION_TYPE" HeaderText="操作" SortExpression="OPERATION_TYPE" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="SUCCESS_NAME" HeaderText="是否成功" SortExpression="SUCCESS" ItemStyle-Width="80"></asp:BoundField>
                        <asp:BoundField DataField="MESSAGE" HeaderText="描述" SortExpression="MESSAGE" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="TYPE" HeaderText="类型" SortExpression="TYPE" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="TOKEN" HeaderText="令牌" SortExpression="TOKEN" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="URL" HeaderText="地址" SortExpression="URL" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="SESSION_ID" HeaderText="会话ID" SortExpression="SESSION_ID" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="IP" HeaderText="客户端IP地址" SortExpression="IP" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="BROWSER" HeaderText="客户端浏览器" SortExpression="BROWSER" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="OS" HeaderText="客户端操作系统" SortExpression="OS" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="MEMO" HeaderText="异常信息" SortExpression="MEMO" ItemStyle-Width="150"></asp:BoundField>
                        <asp:BoundField DataField="STACK_TRACE" HeaderText="异常详情" SortExpression="STACK_TRACE" ItemStyle-Width="150"></asp:BoundField>

                    </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
