<%@ page language="C#" autoeventwireup="true" inherits="App_Basic_Sql2Page, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <link href="../../EasyUI/themes/default/easyui.css" rel="stylesheet" />
    <link href="../../EasyUI/themes/icon.css" rel="stylesheet" />

    <script type="text/javascript" language="javascript">
        $(function () {
            eci.focus("txtPageCode");
        });

        function preview() {
            var p = $("#txtPageCode").val();
            if (p != "") {
                var url = "../../App/Core/List.aspx?p=" + p;
                eci.open(url);
            }

        }

        function design() {
            var p = $("#txtPageCode").val();
            if (p != "") {
                var url = "../../App/Basic/DictionaryEdit.aspx?pagecode=" + p;
                eci.open(url, { full: true });
            }

        }

        function create() {
            if (!eciform.validate()) { return false; }

            if (!eci.hasRow()) { return false; }

            postback("btnCreatePage");
        }

        function addAction() {
            window.location.href = "Sql2Page.aspx";
        }

    </script>

    <style type="text/css">
        .eci-edit-tip {
            color: Red;
            margin: 5px;
            line-height: 18px;
        }
    </style>

</head>
<body style="overflow: hidden">
    <form id="form1" runat="server">
        <div class="fitH">
            <asp:ETab ID="tbMain" runat="server">
                <asp:ETabItem runat="server" ID="head" Title="基本设置">
                    <div id="toolbar" class="toolbar">
                        <asp:EButton ID="btnExec" runat="server" Check="true" Text="执行" Icon="execute"
                            OnClick="btnExec_Click" NeedCheck="true"></asp:EButton>

                        <asp:EButton Text="新增" runat="server" Icon="add" ID="btnAdd" IsClient="true" OnClientClick="addAction();" />
                        <asp:EButton runat="server" Icon="close" IsClient="true" OnClientClick="eci.close({confirm:true});" Text="关闭" />
                    </div>

                    <table cellpadding="0" cellspacing="0" style="width: 100%; padding: 5px; border: 0px solid red">
                        <tr>
                            <td>
                                <table style="width: 100%" class="grid" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <th width="10%"></th>
                                        <th width="23%"></th>
                                        <th width="10%"></th>
                                        <th width="23%"></th>
                                        <th width="10%"></th>
                                        <th width="23%"></th>
                                    </tr>
                                    <tr>
                                        <td class="lbl">页面代码
                                        </td>
                                        <td>
                                            <asp:ETextBox runat="server" ID="txtPageCode" Width="85%" NotNull="true" AutoUpper="true"
                                                ImeDisabled="true" />
                                        </td>
                                        <td class="lbl">页面名称
                                        </td>
                                        <td>
                                            <asp:ETextBox runat="server" ID="txtPageName" Width="85%" NotNull="true" />
                                        </td>
                                        <td class="lbl">查询表格列数
                                        </td>
                                        <td>
                                            <asp:EDropDownList runat="server" ID="ddlQueryCount" Width="80%">
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem Selected="True">3</asp:ListItem>
                                                <asp:ListItem>4</asp:ListItem>
                                            </asp:EDropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="lbl" valign="top">查询语句
                                        </td>
                                        <td colspan="5">
                                            <asp:ETextBox runat="server" TextMode="MultiLine" Rows="20" ID="txtSQL" Width="94%"
                                                NotNull="true" />

                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="lbl" valign="top">标题设置
                                        </td>
                                        <td colspan="5">
                                            <div class="eci-edit-tip">
                                                分隔符: 空格或者分号
                                            </div>
                                            <asp:ETextBox runat="server" TextMode="MultiLine" Rows="3" ID="txtTitle" CssClass="text-area"
                                                Width="94%" />

                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                    </table>

                </asp:ETabItem>

                <asp:ETabItem runat="server" ID="body" Title="创建页面">
                    <div class="toolbar">
                        <asp:EButton ID="btnCreatePage" runat="server" Text="创建页面" OnClick="btnCreatePage_Click"
                            Icon="Tick" OnClientClick="create()" IsClient="true"></asp:EButton>

                        <asp:EButton ID="btnPreview" runat="server" AccessKey="p" Icon="eye" IsClient="true" OnClientClick="preview();" Text="预览(P)" Width="91px" />
                        <asp:EButton ID="btnDesign" runat="server" AccessKey="p" Icon="edit" IsClient="true" OnClientClick="design();" Text="设计" Width="91px" />
                        <asp:EButton Text="关闭" runat="server" IsClient="true" OnClientClick="eci.close({confirm:true});" Icon="close" />
                    </div>
                    <div id="datagrid">
                        <div class="eci-edit-tip">
                            选中的数据项将作为查询条件<br />
                            请输入数据项中文名称,如果不输入将以字段名称作为显示名称
                        </div>
                        <asp:EGridView ID="gvData" runat="server" BorderStyle="None" BorderWidth="0px" AllowSorting="True"
                            CssClass="grid" FitWindow="true" Layout="120" EmptyDataText="TEST" EnableSelect="true" Width="1000px" AllowClickSelectRow="false">
                            <Columns>
                                <asp:ETemplateField HeaderText="显示名称" DataField="ColumnName" TwoWay="txtColumnName" ItemStyle-Width="150">
                                    <ItemTemplate>

                                        <asp:ETextBox ID="txtColumnName" runat="server" Text='<%#Eval("ColumnName") %>'
                                            Width="90%"></asp:ETextBox>
                                    </ItemTemplate>
                                </asp:ETemplateField>
                                <asp:BoundField HeaderText="字段" DataField="ColumnCode" />
                                <asp:BoundField HeaderText="类型" DataField="DataType" />
                                <asp:BoundField HeaderText="字典类型" DataField="DictionaryType" />
                                <asp:BoundField HeaderText="长度" DataField="DataLength" />
                            </Columns>
                        </asp:EGridView>
                    </div>
                </asp:ETabItem>

            </asp:ETab>
        </div>
    </form>
</body>
</html>
