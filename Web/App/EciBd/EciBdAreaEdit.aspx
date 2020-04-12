<%@ page language="C#" autoeventwireup="true" inherits="App_EciBd_frmEciBdAreaEdit, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>行政区域维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">


        function addChildAction(obj) {
            var id = eci.key();
            var nextType = $(obj).attr("tag");
            var url = "EciBdAreaList.aspx?type=" + nextType + "&ParentId=" + id;
            eci.open(url);

        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />
        <input type="hidden" id="hidType" runat="server" />
        <input type="hidden" id="hidParentId" runat="server" />

        <div id="root">



            <div id="toolbar" class="toolbar">
                <asp:EButton runat="server" ID="btnSave" Text="保存" NeedCheck="true" ValidateId="tbEdit" OnClick="btnSave_Click" Icon="save" />
                <asp:EButton runat="server" ID="btnAdd" Text="新增" Icon="Add" OnClick="btnAdd_Click" />
                <asp:EButton runat="server" ID="btnChild" Text="维护下级行政区域" Icon="function" OnClientClick="addChildAction(this);" IsClient="true" />

                <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" />

            </div>
            <div>
                <table id="tbEdit" class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="width: 20%"></th>
                        <th style="width: 30%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 30%"></th>

                    </tr>
                    <tr>
                        <td class="lbl">代码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCode" AutoUpper="true" DataField="CODE" Width="85%" NotNull="true"></asp:ETextBox></td>
                        <td class="lbl">名称</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtName" DataField="NAME" Width="85%" NotNull="true"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">拼音</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtPY"   DataField="PY" Width="85%"  ></asp:ETextBox></td>
                        <td class="lbl">拼音简称</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtShortPY"   DataField="SHORT_PY" Width="85%"  ></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">备注</td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtMemo" DataField="MEMO" Width="94%" TextMode="MultiLine" Rows="3"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">类别</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboType" DataField="TYPE" Width="85%" ReadOnly="true" NotNull="true">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem Value="P">省</asp:ListItem>
                                <asp:ListItem Value="C">市</asp:ListItem>
                                <asp:ListItem Value="X">县</asp:ListItem>
                            </asp:ECombox></td>
                        <td class="lbl">是否启用</td>
                        <td>
                            <asp:ECombox runat="server" ID="txtStatus" DataField="STATUS" Width="85%">
                                <asp:ListItem Value="Y">是</asp:ListItem>
                                <asp:ListItem Value="N">否</asp:ListItem>
                            </asp:ECombox></td>

                    </tr>
                    <tr>
                        <td class="lbl">创建日期</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCreateDate" DataField="CREATE_DATE" Format="yyyy-MM-dd HH:mm:ss" ReadOnly="true" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">创建人</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCreateUser" DataField="CREATE_USER" ReadOnly="true" Width="85%"></asp:ETextBox></td>

                    </tr>
                    <tr>
                        <td class="lbl">修改日期</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtUpdateDate" DataField="UPDATE_DATE" Format="yyyy-MM-dd HH:mm:ss" ReadOnly="true" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">修改人</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtUpdateUser" DataField="UPDATE_USER" ReadOnly="true" Width="85%"></asp:ETextBox></td>

                    </tr>

                    <tr runat="server" id="trParent">
                        <td class="center" colspan="4">
                            <div style="margin: 20px; border: 1px solid green; padding: 10px; font-size: 16px; background-color: lemonchiffon;">
                                上级行政区域:<asp:Label runat="server" ID="lblParentName"></asp:Label>
                            </div>
                        </td>

                    </tr>

                </table>
            </div>
        </div>
    </form>
</body>
</html>
