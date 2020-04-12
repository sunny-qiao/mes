<%@ page language="C#" autoeventwireup="true" inherits="App_Basic_EditZoneConfig, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>企业编辑区自定义配置</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        function CopyData(from, to) {
            document.getElementById(to).value = from.value;
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


            <div id="toolbar" class="toolbar nobottom">
                <asp:EButton ID="btnSave" runat="server" Text="保存(S)" AccessKey="s" Icon="save"
                    OnClick="btnSave_Click"></asp:EButton>
                <asp:EButton ID="btnClose" runat="server" Text="关闭" IsClient="true" AccessKey="r" Icon="close"
                    OnClientClick="$.eci.close();" />

            </div>
            <div id="datagrid">
                <asp:EGridView ID="gvData" runat="server" BorderStyle="None" BorderWidth="0px" AllowSorting="True" FitWindow="true"
                    CssClass="grid" Width="1000px" Layout="tbQuery,toolbar,pagetitle" PageSize="1000" KeyField="GUID">
                    <Columns>

                        <asp:EBoundField HeaderText="数据项名称" DataField="MAIN_ALIAS" ItemStyle-Width="150" HeaderStyle-Width="150" />
                        <asp:EBoundField HeaderText="数据项代码" DataField="CODE" ItemStyle-Width="150" HeaderStyle-Width="150" />
                        <asp:EBoundField HeaderText="字段名称" DataField="DB_FIELD" ItemStyle-Width="150" HeaderStyle-Width="150" />
                         

                    

                        <asp:ETemplateField DataField="EDIT_SHOW" TwoWay="chkEDIT_SHOW" TrueValue="1" FalseValue="0" HeaderText="是否显示" ItemStyle-Width="60" HeaderStyle-Width="60" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ECheckBox runat="server" ID="chkEDIT_SHOW" Checked='<%#Change(Eval("EDIT_SHOW"))%>' InputCss="chkEdit eci-check" />
                            </ItemTemplate>
                        </asp:ETemplateField>

                        <asp:ETemplateField DataField="EDIT_SEQ" TwoWay="txtEDIT_SEQ" HeaderText="显示顺序" ItemStyle-Width="100" HeaderStyle-Width="100">
                            <ItemTemplate>
                                <asp:ETextBox ID="txtEDIT_SEQ" runat="server" Text='<%#Eval("EDIT_SEQ") %>' Width="100%" IsFloat="true"></asp:ETextBox>
                            </ItemTemplate>
                        </asp:ETemplateField>








                    </Columns>
                </asp:EGridView>
            </div>
        </div>
    </form>
</body>
</html>
