<%@ page language="C#" autoeventwireup="true" inherits="App_System_frmEciNoticeList, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>系统通知</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", function () {
                postback(obj);
            });
        }

        function addAction() {
            var type = $("#hidType").val();
            var url = "EciNoticeEdit.aspx?type=" + type;;
            eci.open(url);
        }

        function editAction(obj) {
            var key = $(obj).getKey(); 
            var url = "EciNoticeEdit.aspx?key=" + key;
            eci.open(url);
        }

        function priviewAction(obj) {
            var key = $(obj).getKey();
            var url = "EciNoticeView.aspx?key=" + key;
            eci.open(url);
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">

        <!--系统通知类型-->
        <input type="hidden" id="hidType" runat="server" />


        <div id="root">
            <div class="pagetitle" id="pagetitle" runat="server">系统通知</div>

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
                        <td class="lbl">类型</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtType" DataField="TYPE" Query="A.TYPE|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">标题</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtTitle" DataField="TITLE" Query="A.TITLE|string|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">状态</td>
                        <td>

                            <asp:EDropDownList runat="server" ID="ddlStatus" DataField="STATUS" Query="A.STATUS|string|=" Width="85%">
                                <asp:ListItem Value=""></asp:ListItem>
                                <asp:ListItem Value="NEW">新建</asp:ListItem>
                                <asp:ListItem Value="PUBLISH">发布</asp:ListItem>
                                <asp:ListItem Value="STOP">停用</asp:ListItem>
                            </asp:EDropDownList>

                        </td>


                    </tr>

                    <tr>
                        <td class="center" colspan="6">
                            <asp:EButton runat="server" ID="btnSearch" Text="查询" LangCode="CMD_QUERY" Icon="find" />
                            <asp:EButton runat="server" ID="btnReset" IsClient="true" Text="重置" LangCode="CMD_RESET" Icon="reset" OnClientClick="eci.reset('tbQuery');" /></td>
                    </tr>
                </table>
            </div>
            <div id="toolbar">
                <asp:EButton runat="server" ID="btnAdd" Text="添加新通知" Icon="Add" OnClientClick="addAction();" IsClient="true" />
                <asp:Label runat="server" ID="lblSum" FontSize="11" />

            </div>
            <div id="datagrid">

                <asp:EGridView ID="gvData" Layout="divQuery,toolbar,pagetitle" runat="server" BorderStyle="None"
                    FitWindow="true" EnableSorting="True" EnableSelect="false" EnablePaging="true" EnableClickSelectRow="true" BorderWidth="0px" CssClass="grid"
                    Width="1000px" KeyField="GUID" HAlign="center" OnClick="editAction(this)">
                    <Columns>

                        <asp:TemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:EButton runat="server" ID="btnEdit" Text="编辑"  IsClient="true" Icon="edit" OnClientClick="editAction(this);" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="预览" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:EButton runat="server" ID="btnPriview" Text="预览" IsClient="true" Icon="world" OnClientClick="priviewAction(this);" />
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:EButton runat="server" Icon="Delete" ID="btnDelete" Text="删除" IsClient="true" OnClientClick="return deleteAction(this);" CommandArgument='<%#Eval("GUID")%>' OnClick="btnDelete_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:BoundField DataField="TITLE" HeaderText="标题" SortExpression="TITLE" ItemStyle-Width="400"></asp:BoundField>
                        <asp:BoundField DataField="TYPE" HeaderText="类型" SortExpression="TYPE" ItemStyle-Width=""></asp:BoundField>
                        <asp:BoundField DataField="STATUS" HeaderText="状态" SortExpression="STATUS" ItemStyle-Width=""></asp:BoundField>
                        <asp:BoundField DataField="CREATE_DATE" HeaderText="创建日期" SortExpression="CREATE_DATE" ItemStyle-Width="130" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"></asp:BoundField>
                        <asp:BoundField DataField="CREATE_USER" HeaderText="创建人" SortExpression="CREATE_USER" ItemStyle-Width="80"></asp:BoundField>

                    </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
