<%@ page language="C#" autoeventwireup="true" inherits="App_DIC_DicHeadEdit, ECI.Web" validaterequest="false" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>数据字典维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <script type="text/javascript">

        function OpenField(obj) {
            var bodyId = $(obj).getKey();
            var url = "DicBodyEdit.aspx?bodyId=" + bodyId;
            eci.dialog("数据项维护", url, { width: 600, height: 400 });
        }

        function AddField() {
            var headId = $("#hidId").val();
            var url = "DicBodyEdit.aspx?HeadId=" + headId;
            eci.dialog("数据项维护", url, { width: 600, height: 400 });
        }


        function fetch() {
            var id = $("#hidId").val();
            var tableName = $("#txtTableName").val();
            if (!id) return false;

            var url = "DicFetch.aspx?id=" + id + "&tableName=" + tableName;
            eci.dialog("数据项导导入", url);
        }


        function define() {
            var code = $("#txtCode").val();
            var url = "ComDicHeadEdit.aspx?code=" + code;
            eci.open(url);

        }

        function addAction() {
            var id = $("#hidId").val();
            if (id == "") {
                $.msg.error("当前页面就是新增状态");
            }
            else {
                var url = "DicHeadEdit.aspx";
                window.location.href = url;
            }
        }

        function deleteAction(obj) {
            msg.validate("确定要执行删除字典操作吗?", obj);
        }

        function deleteField(obj) {
            if (!eci.selectRow()) { return false; }
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        $(function () {

            $("#txtTableName").focus(function () {

                if (this.value == "") {
                    this.value = $("#txtCode").val();
                }

            });

        })


        var changed = false;


        function trySearch() {
            if (changed) {
                postback("btnRefresh");
            }

        }

    </script>

</head>
<body style="padding: 0px; margin: 0px;">
    <form id="form1" runat="server" style="padding: 0px; margin: 0px">
        <input type="hidden" runat="server" id="hidId" />

        <div class="fitH">

            <div id="toolbar" class="toolbar">

                <asp:EButton ID="btnSave" runat="server" Text="保存(S)" AccessKey="s"
                    OnClick="btnSave_Click" Icon="save" ValidateId="tabHead" NeedCheck="true" />

                <asp:EButton ID="btnNew" runat="server" Text="新增" IsClient="true"
                    OnClientClick="addAction();" Icon="Add" />
                <asp:EButton ID="btnDelete" runat="server" Text="删除" IsClient="true" Icon="delete"
                    OnClientClick="deleteAction(this);" OnClick="btnDelete_Click" />

                <asp:EButton ID="btnCom" runat="server" Text="企业自定义配置" IsClient="true"
                    OnClientClick="define();" Icon="arrow_switch" />

                <asp:EButton ID="btnClose" runat="server" IsClient="true" Text="关闭"
                    OnClientClick="eci.close({confirm:false})" Icon="close" />
            </div>

            <table style="width: 100%;" cellpadding="0" runat="server" cellspacing="0" border="0"
                class="grid" id="tabHead">
                <tr>
                    <th style="width: 10%"></th>
                    <th style="width: 23%"></th>
                    <th style="width: 10%"></th>
                    <th style="width: 23%"></th>
                </tr>
                <tr>
                    <td class="lbl">代码
                    </td>
                    <td class="txt">
                        <asp:ETextBox ID="txtCode" runat="server" Width="90%" NotNull="true" DataField="CODE" ImeDisabled="true" AutoUpper="true"></asp:ETextBox>
                    </td>
                    <td class="lbl">名称</td>
                    <td class="txt">
                        <asp:ETextBox ID="txtName" runat="server" Width="90%" DataField="NAME" NotNull="true" ImeDisabled="true" AutoUpper="true"></asp:ETextBox>
                    </td>
                </tr>
                <tr>
                    <td class="lbl">表名</td>
                    <td class="txt">
                        <asp:ETextBox ID="txtTableName" runat="server" Width="90%" NotNull="true" DataField="TABLE_NAME" ImeDisabled="true" AutoUpper="true"></asp:ETextBox>
                    </td>
                    <td class="lbl">备注</td>
                    <td class="txt">
                        <asp:ETextBox ID="txtMemo" runat="server" Width="90%" DataField="MEMO"></asp:ETextBox>
                    </td>
                </tr>



            </table>


            <asp:EPanel ID="divBody" runat="server" Title="字段" Icon="table">
                <div id="toolbar2" class="toolbar" style="border-top-width: 1px; margin-top: 2px;">
                    <asp:EButton ID="btnAdd" runat="server" Text="新增(N)" AccessKey="n"
                        OnClientClick="AddField();" IsClient="true" Icon="add" />

                    <asp:EButton ID="btnDeleteField" runat="server" Text="删除(D)" AccessKey="d" Icon="delete" IsClient="true"
                        OnClientClick="deleteField(this);" OnClick="btnDeleteField_Click" />
                    <asp:EButton ID="btnFetch" runat="server" Text="导入数据项(F)" AccessKey="f"
                        IsClient="true" OnClientClick="fetch();" Icon="database_add" />



                    <asp:ETextBox ID="txtConn" runat="server"     Width="150"></asp:ETextBox>
                     
                    <asp:EButton ID="btnRefresh" runat="server" Text="查询" Visible="true"
                        OnClick="btnRefresh_Click" Icon="find" />

                </div>
                <div id="datagrid">
                    <asp:EGridView ID="gvData" runat="server" CssClass="grid" EnableSelect="true"
                        KeyField="BODY_ID" CellPadding="0" CellSpacing="0" AllowSorting="false" EnableClickSelectRow="true"
                        Width="100%" Height="400px" FitWindow="true" Layout="160">
                        <Columns>
                            <asp:TemplateField HeaderText="代码" SortExpression="CODE" ItemStyle-Width="200">
                                <ItemTemplate>
                                    <a id="link" runat="server" data='<%#Eval("BODY_ID") %>' onclick="OpenField(this)"><%#Eval("CODE") %></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="NAME" HeaderText="中文描述" ItemStyle-Width="220px"></asp:BoundField>
                            <asp:ETemplateField DataField="NOTNULL" TwoWay="chkNOTNULL" TrueValue="Y" FalseValue="N" HeaderText="是否必填" HeaderStyle-Width="80" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:ECheckBox runat="server" ID="chkNOTNULL" Checked='<%#Change(Eval("NOTNULL"))%>' />
                                </ItemTemplate>
                            </asp:ETemplateField>

                            <asp:ETemplateField DataField="IS_SHOW" TwoWay="chkIS_SHOW" TrueValue="Y" FalseValue="N" HeaderText="是否显示" HeaderStyle-Width="0" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:ECheckBox runat="server" ID="chkIS_SHOW" Checked='<%#Change(Eval("IS_SHOW"))%>' />
                                </ItemTemplate>
                            </asp:ETemplateField>

                            <asp:ETemplateField DataField="CAN_CONFIG" TwoWay="chkCAN_CONFIG" TrueValue="Y" FalseValue="N" HeaderText="是否可配置" HeaderStyle-Width="0" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:ECheckBox runat="server" ID="chkCAN_CONFIG" Checked='<%#Change(Eval("CAN_CONFIG"))%>' />
                                </ItemTemplate>
                            </asp:ETemplateField>


                            


                            <asp:ETemplateField ItemStyle-Width="220px" HeaderText="默认值" DataField="DEFAULT_VALUE" TwoWay="txtDefaultValue">
                                <ItemTemplate>
                                    <asp:ETextBox CssClass="text-input " Text='<%#Eval("DEFAULT_VALUE") %>' IsNum="true" runat="server" ID="txtDefaultValue" Style="width: 95%" />
                                </ItemTemplate>
                            </asp:ETemplateField>





                            <asp:ETemplateField ItemStyle-Width="0" HeaderText="宽度" DataField="WIDTH" TwoWay="txtWidth">
                                <ItemTemplate>
                                    <asp:ETextBox CssClass="text-input " Text='<%#Eval("WIDTH") %>' IsNum="true" runat="server" ID="txtWidth" Style="width: 95%" />
                                </ItemTemplate>
                            </asp:ETemplateField>

                            <asp:ETemplateField ItemStyle-Width="120px" HeaderText="用途" DataField="USE_TO" TwoWay="cboUseTo">
                                <ItemTemplate>

                                    <asp:ECombox runat="server" ID="cboUseTo" Width="95%">
                                        <asp:ListItem Value=""></asp:ListItem>
                                        <asp:ListItem Value="ONLY_DEFAULT">仅用于默认值</asp:ListItem>
                                    </asp:ECombox>

                                </ItemTemplate>
                            </asp:ETemplateField>


                            <asp:ETemplateField ItemStyle-Width="60px" HeaderText="顺序" DataField="SEQ" TwoWay="txtSeq">
                                <ItemTemplate>
                                    <asp:ETextBox CssClassEx="seq" Text='<%#Eval("SEQ") %>' IsNum="true" runat="server" ID="txtSeq" Style="width: 95%" />
                                </ItemTemplate>
                            </asp:ETemplateField>

                        </Columns>
                    </asp:EGridView>
                </div>
            </asp:EPanel>
        </div>
    </form>
</body>
</html>
