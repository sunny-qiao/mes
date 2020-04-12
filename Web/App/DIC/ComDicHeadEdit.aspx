<%@ page language="C#" autoeventwireup="true" inherits="App_DIC_ComDicHeadEdit, ECI.Web" validaterequest="false" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>企业字典配置</title>

    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <script type="text/javascript">
        function editAction(obj) {
            var bodyId = $(obj).getKey();
            var url = "ComDicBodyEdit.aspx?bodyId=" + bodyId;
            eci.dialog("数据项维护", url, { width: 600, height: 400 });
        }

        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function manageAction(obj)
        {
            var code = $("#txtCode").val();
            var url = "DicHeadEdit.aspx?code=" + code;
            window.location.href = url;
        }



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
                    OnClick="btnSave_Click" Icon="save" />

                <asp:EButton ID="btnDelete" runat="server" Text="删除企业自定义配置" IsClient="true" Icon="delete"
                    OnClientClick="deleteAction(this);" OnClick="btnDelete_Click" />

                <asp:EButton ID="btnClose" runat="server" IsClient="true" Text="关闭"
                    OnClientClick="eci.close({confirm:false})" Icon="close" />

                <div style="float: right;margin-right:4px;">
                    <asp:EButton ID="btnManage" runat="server" Visible="false" Text="管理配置" IsClient="true" Icon="function"
                        OnClientClick="manageAction(this);"  />
                </div>

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
                        <asp:ETextBox ID="txtCode" runat="server" Width="90%" NotNull="true" DataField="CODE" ReadOnly="true" ImeDisabled="true" AutoUpper="true"></asp:ETextBox>
                    </td>
                    <td class="lbl">归属公司</td>
                    <td class="txt">
                        <asp:ETextBox ID="txtCompanyCode" runat="server" Width="90%" NotNull="true" DataField="COMPANY_CODE" ReadOnly="true" ImeDisabled="true" AutoUpper="true"></asp:ETextBox>
                    </td>
                </tr>
            </table>

            <asp:EPanel ID="divBody" runat="server" Title="字段" Icon="table">
                <div id="toolbar2" class="toolbar" style="border-top-width: 1px; margin-top: 2px;">

                    <asp:EButton ID="btnRefresh" runat="server" Text="刷新" Visible="true"
                        OnClick="btnRefresh_Click" Icon="refresh" />

                </div>
                <div id="datagrid">
                    <asp:EGridView ID="gvData" runat="server" CssClass="grid" EnableSelect="false"
                        KeyField="BODY_ID" CellPadding="0" CellSpacing="0" AllowSorting="false" EnableClickSelectRow="true"
                        Width="100%" Height="400px" FitWindow="true" Layout="160">
                        <Columns>

                            <asp:ETemplateField HeaderText="编辑" HeaderStyle-Width="90" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:EButton runat="server" ID="btnEdit" Icon="edit" Text="编辑" IsClient="true" OnClientClick="editAction(this)" />
                                </ItemTemplate>
                            </asp:ETemplateField>

                            <asp:BoundField DataField="USE_TO" HeaderText="用途" ItemStyle-Width="0"></asp:BoundField>

                            <asp:BoundField DataField="CODE" HeaderText="代码" ItemStyle-Width="220px"></asp:BoundField>

                            <asp:BoundField DataField="NAME" HeaderText="中文描述" ItemStyle-Width="220px"></asp:BoundField>

                            <asp:ETemplateField DataField="NOTNULL" TwoWay="chkNOTNULL" TrueValue="Y" FalseValue="N" HeaderText="是否必填" HeaderStyle-Width="80" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:ECheckBox runat="server" ID="chkNOTNULL" Checked='<%#Change(Eval("NOTNULL"))%>' />
                                </ItemTemplate>
                            </asp:ETemplateField>


                            <asp:ETemplateField DataField="DEFAULT_VALUE" TwoWay="txtDEFAULT_VALUE" TrueValue="Y" FalseValue="N" HeaderText="默认值" HeaderStyle-Width="200" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:ETextBox runat="server" ID="txtDEFAULT_VALUE" Text='<%#Eval("DEFAULT_VALUE")%>' Width="95%" />
                                </ItemTemplate>
                            </asp:ETemplateField>


                            <asp:ETemplateField   HeaderText="填写说明" HeaderStyle-Width="80" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:ETip runat="server" ID="tip" Show="true" />
                                    
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
