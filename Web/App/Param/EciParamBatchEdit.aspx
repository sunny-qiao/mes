<%@ page language="C#" autoeventwireup="true" inherits="App_System_frmEciParamBatchEdit, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>系统参数</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function deleteAction(obj) {
            msg.confirm("确定要执行删除操作吗?", obj);
        }

        function addAction() {
            var groupId = $("#hidGroupId").val();
            var url = "EciParamEdit.aspx?groupId=" + groupId;
            parent.eci.dialog("系统配置", url);

            parent.hasSaved = false;


        }

        function editAction(obj) {
            var key = $(obj).getKey();
            var url = "EciParamEdit.aspx?key=" + key;
            parent.eci.dialog("系统配置", url);
            parent.hasSaved = false;
        }

        function rowEdit(key, tr) {
            var url = "EciParamEdit.aspx?key=" + key;
            parent.eci.dialog("系统配置", url);
            parent.hasSaved = false;
        }

        var hasSaved = false;

        function saved() {
            hasSaved = true;
        }

        function search() {
            if (hasSaved) {
                postback("btnSearch");
            }
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">

        <input type="hidden" id="hidGroupId" runat="server" />
        <input type="hidden" id="hidOperationId" runat="server" />

        <div id="root">

            <div id="toolbar">
                <asp:EButton runat="server" ID="btnSave" Text="保存" OnClick="btnSave_Click" Icon="save" />

                <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" />
            </div>
            <div id="datagrid">

                <asp:EGridView ID="gvData" Layout="divQuery,toolbar,pagetitle" runat="server"
                    FitWindow="true" EnableSorting="True" EnableSelect="false" EnablePaging="false" EnableClickSelectRow="true"
                    Width="1000px" KeyField="ID" EnableFooter="false">
                    <Columns>
                        <asp:ETemplateField DataField="PARAM_NAME" TwoWay="txtParamName" HeaderText="参数名称" ItemStyle-Width="300">
                            <ItemTemplate>
                                <asp:ETextBox ID="txtParamName" runat="server" Text='<%#Eval("PARAM_NAME") %>' Width="100%"></asp:ETextBox>
                            </ItemTemplate>
                        </asp:ETemplateField>

                        <asp:ETemplateField DataField="PARAM_KEY" TwoWay="txtParamKey" HeaderText="参数编码" ItemStyle-Width="300">
                            <ItemTemplate>
                                <asp:ETextBox ID="txtParamKey" runat="server" Text='<%#Eval("PARAM_KEY") %>' Width="100%"></asp:ETextBox>
                            </ItemTemplate>
                        </asp:ETemplateField>

                        <asp:ETemplateField DataField="PARAM_VALUE" TwoWay="txtParamValue" HeaderText="参数值默认值" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:ETextBox ID="txtParamValue" runat="server" Text='<%#Eval("PARAM_VALUE") %>' Width="100%"></asp:ETextBox>
                            </ItemTemplate>
                        </asp:ETemplateField>

                        <asp:ETemplateField DataField="UI_TYPE" TwoWay="cboUIType" HeaderText="控件类型" ItemStyle-Width="100">
                            <ItemTemplate>
                                <asp:EDropDownList ID="cboUIType" runat="server" Width="100%">
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="CHECKBOX">复选框</asp:ListItem>
                                    <asp:ListItem Value="TEXTBOX">文本框</asp:ListItem>
                                    <asp:ListItem Value="MEMO">多行文本框</asp:ListItem>
                                    <asp:ListItem Value="COMBOX">下拉框</asp:ListItem>
                                </asp:EDropDownList>
                            </ItemTemplate>
                        </asp:ETemplateField>


                        <asp:ETemplateField DataField="UI_TYPE_CONFIG" TwoWay="txtUITypeConfig" HeaderText="控件基本配置" ItemStyle-Width="300">
                            <ItemTemplate>
                                <asp:ETextBox ID="txtUITypeConfig" runat="server" Text='<%#Eval("UI_TYPE_CONFIG") %>' Width="100%"></asp:ETextBox>
                            </ItemTemplate>
                        </asp:ETemplateField>



                    </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
