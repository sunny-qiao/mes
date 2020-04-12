<%@ page language="C#" autoeventwireup="true" inherits="App_Basic_DictionaryFieldBatchEdit, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>页面元素批量维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        function CopyData(from, to) {
            document.getElementById(to).value = from.value;
        }

        function allList(chk) {

            $(".chkList").each(function () {
                this.checked = chk.checked;
            });
        }

        function allEdit(chk) {
            $(".chkEdit").each(function () {
                this.checked = chk.checked;
            });
        }

        $(function () {

            var $lisMAIN_ALIAS = $(".txtMAIN_ALIAS");
            var $lisWIDTH = $(".txtWIDTH");

            $(".txtMAIN_ALIAS").keyup(function () {
                if (event.keyCode == 13) {
                    var nextIndex = $lisMAIN_ALIAS.index(this) + 1;

                    if (nextIndex == $lisMAIN_ALIAS.length) {
                        nextIndex = 0;
                    }

                    if (event.shiftKey == 1) {
                        nextIndex = $lisMAIN_ALIAS.index(this) - 1;

                        if (nextIndex == -1) {
                            nextIndex = $lisMAIN_ALIAS.length - 1;
                        }
                    }


                    $(".txtMAIN_ALIAS:eq(" + nextIndex + ")").focus();
                }
            });

            $(".txtWIDTH").keyup(function () {
                if (event.keyCode == 13) {
                    var nextIndex = $lisWIDTH.index(this) + 1;

                    if (nextIndex == $lisWIDTH.length) {
                        nextIndex = 0;
                    }

                    if (event.shiftKey == 1) {
                        nextIndex = $lisWIDTH.index(this) - 1;

                        if (nextIndex == -1) {
                            nextIndex = $lisWIDTH.length - 1;
                        }
                    }


                    $(".txtWIDTH:eq(" + nextIndex + ")").focus();
                }
            });

            $("#tdType").click(function () {
                postback("btnSearch");
            });

        });

    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div>
            <div class="pagetitle" id="pagetitle">
                <div class="space">页面元素批量维护</div>
            </div>

            <table cellpadding="1" cellspacing="0" style="width: 100%">
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" class="grid" id="tbQuery" sql="page" runat="server">
                            <tr>
                                <td class="lbl" style="width: 20%">代码
                                </td>
                                <td style="width: 30%">
                                    <asp:ETextBox ID="txtUserId" runat="server" Width="85%"></asp:ETextBox>
                                </td>
                                <td class="lbl" style="width: 20%">名称
                                </td>
                                <td style="width: 30%">
                                    <asp:ETextBox ID="txtUserName" runat="server" Width="85%"></asp:ETextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="lbl" style="width: 20%">&nbsp;</td>
                                <td style="width: 30%" id="tdType">
                                    <asp:ERadioButton runat="server" ID="rbAll" Text="全部字段" GroupName="G" Checked="true" />
                                    <asp:ERadioButton runat="server" ID="rbQuery" Text="仅查询字段" GroupName="G" />
                                    <asp:ERadioButton runat="server" ID="rbGrid" Text="仅显示字段" GroupName="G" />
                                    <asp:ERadioButton runat="server" ID="rbEdit" Text="仅编辑字段" GroupName="G" />
                                </td>
                                <td class="lbl" style="width: 20%">&nbsp;</td>
                                <td style="width: 30%">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="center" colspan="4">
                                    <asp:EButton ID="btnSearch" runat="server" Text="查询(Q)" AccessKey="q" Icon="find" />
                                    <asp:EButton ID="btnReset" runat="server" Text="重置(R)" IsClient="true" AccessKey="r" OnClientClick="eci.reset('tbQuery');" Icon="reset" />


                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <div id="toolbar" class="toolbar nobottom">
                <asp:EButton ID="btnSave" runat="server" Text="保存(S)" AccessKey="s" Icon="save"
                    OnClick="btnSave_Click"></asp:EButton>
                <asp:EButton ID="btnClose" runat="server" Text="关闭" IsClient="true" AccessKey="r" Icon="close"
                    OnClientClick="$.eci.close();" />

                <span style="margin-left: 370px;"></span>
                <asp:ECheckBox runat="server" ID="chkShow" Text="显示" onclick="allList(this)" />
                <asp:ECheckBox runat="server" ID="chkEdit" Text="编辑" onclick="allEdit(this)" />


            </div>
            <div id="datagrid">
                <asp:EGridView ID="gvData" runat="server" BorderStyle="None" BorderWidth="0px" AllowSorting="True" FitWindow="true"
                    CssClass="grid" Width="1000px" Layout="tbQuery,toolbar,pagetitle" PageSize="1000" KeyField="GUID">
                    <Columns>
                        <asp:ETemplateField DataField="CODE" TwoWay="txtCODE" HeaderText="元素代码" ItemStyle-Width="150" HeaderStyle-Width="150">
                            <ItemTemplate>
                                <asp:ETextBox ID="txtCODE" runat="server" Text='<%#Eval("CODE") %>' Width="100%"></asp:ETextBox>
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField DataField="MAIN_ALIAS" TwoWay="txtMAIN_ALIAS" HeaderText="元素名称" ItemStyle-Width="150" HeaderStyle-Width="150">
                            <ItemTemplate>
                                <asp:ETextBox ID="txtMAIN_ALIAS" CssClassEx="txtMAIN_ALIAS" IgnoreEnterToTab="true" runat="server" Text='<%#Eval("MAIN_ALIAS") %>' Width="100%"></asp:ETextBox>
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField DataField="DB_FIELD" TwoWay="txtDB_FIELD" HeaderText="字段名称" ItemStyle-Width="150" HeaderStyle-Width="150">
                            <ItemTemplate>
                                <asp:ETextBox ID="txtDB_FIELD" runat="server" Text='<%#Eval("DB_FIELD") %>' Width="100%"></asp:ETextBox>
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField DataField="QUERY_SHOW" TwoWay="chkQUERY_SHOW" TrueValue="1" FalseValue="0" HeaderText="查询" ItemStyle-Width="60" HeaderStyle-Width="60" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ECheckBox runat="server" ID="chkQUERY_SHOW"  Checked='<%#Change(Eval("QUERY_SHOW"))%>' />
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField DataField="GRID_SHOW" TwoWay="chkGRID_SHOW" TrueValue="1" FalseValue="0" HeaderText="显示" ItemStyle-Width="60" HeaderStyle-Width="60" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ECheckBox runat="server" ID="chkGRID_SHOW" Checked='<%#Change(Eval("GRID_SHOW"))%>' InputCss="chkList eci-check" />
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField DataField="EDIT_SHOW" TwoWay="chkEDIT_SHOW" TrueValue="1" FalseValue="0" HeaderText="编辑" ItemStyle-Width="60" HeaderStyle-Width="60" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ECheckBox runat="server" ID="chkEDIT_SHOW" Checked='<%#Change(Eval("EDIT_SHOW"))%>' InputCss="chkEdit eci-check" />
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField DataField="NULLABLE_KEY" TwoWay="chkNULLABLE_KEY" TrueValue="1" FalseValue="0" HeaderText="可空" ItemStyle-Width="60" HeaderStyle-Width="60" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ECheckBox runat="server" ID="chkNULLABLE_KEY" Checked='<%#Change(Eval("NULLABLE_KEY"))%>' />
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField DataField="UNIQUE_KEY" TwoWay="chkUNIQUE_KEY" TrueValue="1" FalseValue="0" HeaderText="唯一" ItemStyle-Width="60" HeaderStyle-Width="60" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ECheckBox runat="server" ID="chkUNIQUE_KEY" Checked='<%#Change(Eval("UNIQUE_KEY"))%>' />
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField DataField="PRIMARY_KEY" TwoWay="chkPRIMARY_KEY" TrueValue="1" FalseValue="0" HeaderText="主键" ItemStyle-Width="60" HeaderStyle-Width="60" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ECheckBox runat="server" ID="chkPRIMARY_KEY" Checked='<%#Change(Eval("PRIMARY_KEY"))%>' />
                            </ItemTemplate>
                        </asp:ETemplateField>

                        <asp:ETemplateField DataField="QUERY_SEQ" TwoWay="txtQUERY_SEQ" HeaderText="查询顺序" ItemStyle-Width="100" HeaderStyle-Width="100">
                            <ItemTemplate>
                                <asp:ETextBox ID="txtQUERY_SEQ" runat="server" Text='<%#Eval("QUERY_SEQ") %>' Width="100%" IsFloat="true"></asp:ETextBox>
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField DataField="GRID_SEQ" TwoWay="txtGRID_SEQ" HeaderText="显示顺序" ItemStyle-Width="100" HeaderStyle-Width="100">
                            <ItemTemplate>
                                <asp:ETextBox ID="txtGRID_SEQ" runat="server" Text='<%#Eval("GRID_SEQ") %>' Width="100%" IsFloat="true"></asp:ETextBox>
                            </ItemTemplate>
                        </asp:ETemplateField>

                        <asp:ETemplateField DataField="EDIT_SEQ" TwoWay="txtEDIT_SEQ" HeaderText="编辑顺序" ItemStyle-Width="100" HeaderStyle-Width="100">
                            <ItemTemplate>
                                <asp:ETextBox ID="txtEDIT_SEQ" runat="server" Text='<%#Eval("EDIT_SEQ") %>' Width="100%" IsFloat="true"></asp:ETextBox>
                            </ItemTemplate>
                        </asp:ETemplateField>



                        <asp:ETemplateField HeaderText="元素名称" ItemStyle-Width="150" HeaderStyle-Width="150">
                            <ItemTemplate>
                                <asp:ETextBox ID="txtMAIN_ALIAS1" BackColor="Gainsboro" ReadOnly="true" runat="server"
                                    Width="98%" Text='<%#Eval("MAIN_ALIAS") %>'></asp:ETextBox>
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField DataField="DICTIONARY_TYPE" TwoWay="cboDICTIONARY_TYPE" HeaderText="字典类型" ItemStyle-Width="150" HeaderStyle-Width="150">
                            <ItemTemplate>
                                <asp:EDropDownList ID="cboDICTIONARY_TYPE" runat="server" Width="100%" Value='<%#Eval("DICTIONARY_TYPE") %>'>
                                    <asp:ListItem>INPUT</asp:ListItem>
                                    <asp:ListItem>INPUT_INT</asp:ListItem>
                                    <asp:ListItem>INPUT_NUMBER</asp:ListItem>
                                    <asp:ListItem>MEMO</asp:ListItem>
                                    <asp:ListItem>DATE</asp:ListItem>
                                    <asp:ListItem>CHOOSE</asp:ListItem>
                                    <asp:ListItem>DROPDOWNLIST</asp:ListItem>
                                    <asp:ListItem>RADION</asp:ListItem>
                                    <asp:ListItem>RADIONGROUP</asp:ListItem>
                                    <asp:ListItem>CHECK</asp:ListItem>
                                    <asp:ListItem>CHECKGROUP</asp:ListItem>
                                    <asp:ListItem>EMPTY</asp:ListItem>
                                    <asp:ListItem>LABEL</asp:ListItem>
                                </asp:EDropDownList>
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField DataField="PHYSICAL_TYPE" TwoWay="cboPHYSICAL_TYPE" HeaderText="物理类型" ItemStyle-Width="120" HeaderStyle-Width="120">
                            <ItemTemplate>
                                <asp:EDropDownList ID="cboPHYSICAL_TYPE" runat="server" Width="100%" Value='<%#Eval("PHYSICAL_TYPE") %>'>
                                    <asp:ListItem>VARCHAR2</asp:ListItem>
                                    <asp:ListItem>CHAR</asp:ListItem>
                                    <asp:ListItem>NUMBER</asp:ListItem>
                                    <asp:ListItem>FLOAT</asp:ListItem>
                                    <asp:ListItem>DATE</asp:ListItem>
                                    <asp:ListItem>CLOB</asp:ListItem>
                                    <asp:ListItem>TEXT</asp:ListItem>
                                </asp:EDropDownList>
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField HeaderText="元素名称" ItemStyle-Width="150" HeaderStyle-Width="150">
                            <ItemTemplate>
                                <asp:ETextBox ID="txtMAIN_ALIAS2" BackColor="Gainsboro" ReadOnly="true" runat="server"
                                    Width="100%" Text='<%#Eval("MAIN_ALIAS") %>'></asp:ETextBox>
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField DataField="EDIT_LOCK_MODE" TwoWay="cboEDIT_LOCK_MODE" HeaderText="编辑配置" ItemStyle-Width="90" HeaderStyle-Width="90">
                            <ItemTemplate>
                                <asp:EDropDownList ID="cboEDIT_LOCK_MODE" runat="server" Width="100%" Value='<%#Eval("EDIT_LOCK_MODE") %>'>
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="LOCKFULL">完全只读</asp:ListItem>
                                    <asp:ListItem Value="LOCKADD">新增只读</asp:ListItem>
                                    <asp:ListItem Value="LOCKEDIT">编辑只读</asp:ListItem>
                                </asp:EDropDownList>
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField DataField="GRID_HEAD_ALIGN" TwoWay="cboGRID_HEAD_ALIGN" HeaderText="元素列表头对齐" ItemStyle-Width="150" HeaderStyle-Width="150">
                            <ItemTemplate>
                                <asp:EDropDownList ID="cboGRID_HEAD_ALIGN" runat="server" Width="100%" Value='<%#Eval("GRID_HEAD_ALIGN") %>'>
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="LEFT">左对齐</asp:ListItem>
                                    <asp:ListItem Value="CENTER">居中对齐</asp:ListItem>
                                    <asp:ListItem Value="RIGHT">右对齐</asp:ListItem>
                                </asp:EDropDownList>
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField DataField="GRID_ITEM_ALIGN" TwoWay="cboGRID_ITEM_ALIGN" HeaderText="元素列表项对齐" ItemStyle-Width="150" HeaderStyle-Width="150">
                            <ItemTemplate>
                                <asp:EDropDownList ID="cboGRID_ITEM_ALIGN" runat="server" Width="100%" Value='<%#Eval("GRID_ITEM_ALIGN") %>'>
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="LEFT">左对齐</asp:ListItem>
                                    <asp:ListItem Value="CENTER">居中对齐</asp:ListItem>
                                    <asp:ListItem Value="RIGHT">右对齐</asp:ListItem>
                                </asp:EDropDownList>
                            </ItemTemplate>
                        </asp:ETemplateField>
                        <asp:ETemplateField DataField="WIDTH" TwoWay="txtWIDTH" HeaderText="显示宽度" ItemStyle-Width="60" HeaderStyle-Width="60"
                            ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ETextBox ID="txtWIDTH" runat="server" CssClassEx="txtWIDTH" IgnoreEnterToTab="true" Width="100%" Value='<%#Eval("WIDTH") %>'></asp:ETextBox>
                            </ItemTemplate>
                        </asp:ETemplateField>
                    </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
