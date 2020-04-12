<%@ page language="C#" autoeventwireup="true" inherits="App_Basic_EciDataGroupList, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>基础数据</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function addAction() {
            var prefix = $("#hidPrefix").val();
            var url = "EciDataGroupEdit.aspx";
            if (prefix) {
                url = urlAppend(url, "prefix=" + prefix)
            }
            eci.open(url);
        }

        function editAction(obj) {
            var prefix = $("#hidPrefix").val();
            var key = $(obj).getKey();
            var url = "EciDataGroupEdit.aspx?key=" + key;
            if (prefix) {
                url = urlAppend(url, "prefix=" + prefix)
            }
            eci.open(url);
        }

        function rowEdit(key, tr) {
            var prefix = $("#hidPrefix").val();
            var url = "EciDataGroupEdit.aspx?key=" + key;
            if (prefix) {
                url = urlAppend(url, "prefix=" + prefix)
            }
            eci.open(url);
        }

        function detailAction(obj) {
            var prefix = $("#hidPrefix").val();
            var groupCode = $(obj).getField("GROUP_CODE");
            var url = "EciDataCodeList.aspx?groupCode=" + groupCode;
            if (prefix) {
                url = urlAppend(url, "prefix=" + prefix)
            }
            eci.open(url);
        }

        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function editSaved() {
            postback("btnSearch");
        }

        function createAction() {
            eci.window("winMain");
            $("#txtPrefix").focus();
        }

        function executeAction() {
            var prefix = $("#txtPrefix").val();
            if (prefix == "") {

                msg.warning("请输入前缀", { focusId: "txtPrefix" });

                return false;
            }
        }

        $(function () {
            $("#toolbar").click(function () {

                layout();

            });

        })

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" runat="server" id="hidPrefix" />

        <div id="root">

            <asp:ETitle runat="server" ID="pagetitle" Title="基础数据"></asp:ETitle>

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
                        <td class="lbl">分组代码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtGroupCode" DataField="GROUP_CODE" Query="A.GROUP_CODE|s|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">分组名称</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtGroupName" DataField="GROUP_NAME" Query="A.GROUP_NAME|s|like" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">是否启用</td>
                        <td>
                            <asp:EDropDownList runat="server" ID="ddlStatus" DataField="STATUS" Query="A.STATUS|S|=" Width="85%">
                                <asp:ListItem Value=""></asp:ListItem>
                                <asp:ListItem Value="Y">是</asp:ListItem>
                                <asp:ListItem Value="N">否</asp:ListItem>
                            </asp:EDropDownList></td>

                    </tr>

                    <tr>
                        <td class="lbl">自定义目录</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCatelog" DataField="CATELOG" Query="A.CATELOG|s|like" Width="85%"></asp:ETextBox></td>
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


                <asp:EButton runat="server" ID="btnCreate" Text="创建公共参数表" Icon="execute" OnClientClick="createAction();" IsClient="true" />



            </div>
            <div id="datagrid">

                <asp:EGridView ID="gvData" Layout="divQuery,toolbar,pagetitle" runat="server" BorderStyle="None"
                    FitWindow="true" EnableSorting="True" EnablePaging="true" EnableClickSelectRow="true" EnableDblClick="true" DblClickEventName="rowEdit" BorderWidth="0px" CssClass="grid"
                    Width="1000px" KeyField="ID">
                    <Columns>

                        <asp:TemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:EButton runat="server" ID="btnEdit" Text="编辑" IsClient="true" Icon="edit" OnClientClick="editAction(this);" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="明细" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:EButton runat="server" ID="btnDetail" Text="明细" IsClient="true" Icon="book_open" OnClientClick="detailAction(this);" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="GROUP_CODE" HeaderText="分组代码" SortExpression="GROUP_CODE" ItemStyle-Width="200" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                        <asp:BoundField DataField="GROUP_NAME" HeaderText="分组名称" SortExpression="GROUP_NAME" ItemStyle-Width="350"></asp:BoundField>
                        <asp:BoundField DataField="CATELOG" HeaderText="自定义目录" SortExpression="CATELOG" ItemStyle-Width="150"></asp:BoundField>

                        <asp:BoundField DataField="CNT" HeaderText="明细数量" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Center"></asp:BoundField>

                        <asp:BoundField DataField="STATUS_NAME" HeaderText="是否启用" SortExpression="STATUS" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Center"></asp:BoundField>

                        <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90">
                            <ItemTemplate>
                                <asp:EButton runat="server" Icon="delete" ID="btnDelete" Text="删除" IsClient="true" OnClientClick="return deleteAction(this);" CommandArgument='<%#Eval("ID")%>' OnClick="btnDelete_Click" />

                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:EGridView>
            </div>
        </div>


        <asp:EWindow runat="server" ID="winMain" Title="创建基础资料" Width="600" Height="250" BackColor="White" Icon="book_open">

            <table class="grid">
                <tr>
                    <th style="width: 100px;"></th>
                    <th></th>
                </tr>

                <tr>
                    <td class="lbl lbl-top">


                        <span class="notnull">*</span> 前缀:</td>
                    <td>
                        <asp:ETextBox runat="server" ID="txtPrefix" Width="95%" MaxLength="8"></asp:ETextBox>


                    </td>
                </tr>

                <tr>
                    <td class="lbl">功能菜单</td>

                    <td>
                        <asp:ETextBox runat="server" ID="txtUrl" Width="95%" Rows="3" TextMode="MultiLine"></asp:ETextBox>
                    </td>

                </tr>


                <tr>
                    <td class="center" colspan="2">

                        <asp:EButton ID="btnExecute" runat="server" Icon="ok" Text="确定" OnClientClick="return executeAction();" OnClick="btnExecute_Click" />
                        <asp:EButton ID="btnMainClose" runat="server" Icon="close" IsClient="true" OnClientClick="eci.closewindow(this)" Text="关闭" />
                    </td>
                </tr>
            </table>




        </asp:EWindow>


    </form>
</body>
</html>
