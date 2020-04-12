<%@ page language="C#" autoeventwireup="true" inherits="App_Basic_ShareEdit, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>共享配置</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        function mydelete(btn) {

            msg.confirm("确定要执行删除操作吗?", function () {

                $(btn).parents(".eci-grid-row").find("input").val("");
                $(btn).parents(".eci-grid-row").hide();

            });
        }

        $(function () {
            $("#gvDataTable .eci-grid-row").filter(function () { return $(this).find(".CODE input").val() == "" }).find(".COMMAND").html("");// .css("background", "pink");
        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root">
            <div class="toolbar" id="toolbar">
                <asp:EButton runat="server" ID="btnSave" Text="保存" OnClick="btnSave_Click" Icon="save" />
                <asp:EButton runat="server" ID="btnClose" IsClient="true" Text="关闭" OnClientClick="eci.close();" Icon="close" />

                <span class="notnull">点击删除后需要点击保存生效</span>

            </div>
            <div>
                <asp:EGridView runat="server" ID="gvData" FitWindow="true" Layout="toolbar">
                    <Columns>
                        <asp:ETemplateField HeaderText="代码" ItemStyle-Width="200px" DataField="CODE" TwoWay="txtCode" ItemStyle-CssClass="CODE">
                            <ItemTemplate>
                                <asp:ETextBox runat="server" AutoUpper="true" ID="txtCode" Text='<%#Eval("CODE") %>' Width="95%"></asp:ETextBox>
                            </ItemTemplate>
                        </asp:ETemplateField>

                        <asp:ETemplateField HeaderText="名称" ItemStyle-Width="250px" DataField="NAME" TwoWay="txtName">
                            <ItemTemplate>
                                <asp:ETextBox runat="server" ID="txtName" Text='<%#Eval("NAME") %>' Width="95%"></asp:ETextBox>
                            </ItemTemplate>
                        </asp:ETemplateField>

                        <asp:ETemplateField HeaderText="" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="COMMAND">
                            <ItemTemplate>
                                <asp:EButton IsClient="true" runat="server" Height="25" ID="btnDelete" Text="删除" OnClientClick="return mydelete(this);" Icon="delete" />
                            </ItemTemplate>
                        </asp:ETemplateField>
                    </Columns>
                </asp:EGridView>
            </div>
        </div>

    </form>
</body>
</html>
