<%@ page language="C#" autoeventwireup="true" inherits="App_Basic_EciDataGroupEdit, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>基础数据维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        function addAction() {

            var prefix = $("#hidPrefix").val();

            var url = "EciDataGroupEdit.aspx";

            if (prefix) {
                url = urlAppend(url, "prefix=" + prefix)
            }

            window.location.href = url;
        }

        function detailAction() {
            var prefix = $("#hidPrefix").val();
            var groupCode = $("#txtGroupCode").val();

            if (eci.hasSave()) {
                var url = "EciDataCodeList.aspx?groupCode=" + groupCode;
                if (prefix) {
                    url = urlAppend(url, "prefix=" + prefix)
                }
                eci.open(url);
            }
        }

        function saved() {
            window.opener.editSaved();
        }

        function copyAction(obj) {
            return msg.confirm("确定要进行复制吗?",obj);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />
        <input type="hidden" runat="server" id="hidPrefix" />

        <div id="root">
            <asp:ETitle runat="server" ID="pagetitle" Title="基础数据"></asp:ETitle>

            <div id="toolbar" class="toolbar">
                <asp:EButton runat="server" ID="btnSave" Text="保存" NeedCheck="true" ValidateId="tbEdit" OnClick="btnSave_Click" Icon="save" />

                <asp:EButton runat="server" ID="btnAdd" Text="新增" Icon="Add" OnClientClick="addAction();" IsClient="true" />

                <asp:EButton runat="server" ID="btnCopy" Text="复制" Icon="copy" OnClientClick="copyAction(this);" IsClient="true"  OnClick="btnCopy_Click"/>

                <asp:EButton runat="server" ID="btnDetail" Text="明细" IsClient="true" Icon="book_open" OnClientClick="detailAction();" />

                <asp:EButton runat="server" ID="btnCreateDataSource" Text="创建数据源" OnClick="btnCreateDataSource_Click" Icon="save" />
                <asp:EButton runat="server" ID="btnFname" Text="创建代码转换&功能菜单" OnClick="btnFname_Click" Icon="save" />

               
                
                <asp:CheckBox runat="server" ID="chkIncludeDeleteSQL" Text="包含删除语句" />
                
                <asp:EButton runat="server" ID="btnSQL" Text="导出语句" OnClick="btnSQL_Click" Icon="execute" />

                <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" />


            </div>
            <div>
                <table id="tbEdit" class="grid" cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                    </tr>
                    <tr>
                        <td class="lbl">分组代码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtGroupCode" DataField="GROUP_CODE" Width="85%" AutoUpper="true" NotNull="true"></asp:ETextBox></td>
                        <td class="lbl">分组名称</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtGroupName" DataField="GROUP_NAME" Width="85%" NotNull="true"></asp:ETextBox></td>
                    </tr>
                    <tr>
                        <td class="lbl">是否启用</td>
                        <td>
                            <asp:EDropDownList runat="server" ID="ddlStatus" DataField="STATUS" Query="A.STATUS|S|=" NotNull="true" Width="85%">
                                <asp:ListItem Value="Y">是</asp:ListItem>
                                <asp:ListItem Value="N">否</asp:ListItem>
                            </asp:EDropDownList></td>
                        <td class="lbl">自定义目录</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCatelog" DataField="CATELOG" Width="85%"  ></asp:ETextBox></td>


                    </tr>
                    <tr>
                        <td class="lbl">备注</td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtMemo" DataField="MEMO" Width="94%" Rows="8" TextMode="MultiLine"></asp:ETextBox></td>


                    </tr>

                </table>
            </div>
        </div>


        <asp:EWindow runat="server" ID="divMain" Title="代码转换&功能菜单" Width="800" Height="350" BackColor="White" Icon="book_open">

            <table class="grid">
                <tr>
                    <th style="width: 100px;"></th>
                    <th></th>
                </tr>

                <tr>
                    <td class="lbl">代码转换</td>
                    <td>
                        <asp:ETextBox runat="server" ID="txtResult" Width="99%" Rows="12" TextMode="MultiLine"></asp:ETextBox>


                    </td>
                </tr>

                <tr>
                    <td class="lbl">功能菜单</td>

                    <td>
                        <asp:ETextBox ID="txtUrl" runat="server" Width="99%"></asp:ETextBox>
                    </td>

                </tr>
                <tr>
                    <td class="center" colspan="2">
                        <asp:EButton ID="btnMainClose" runat="server" Icon="close" IsClient="true" OnClientClick="eci.closewindow(this)" Text="关闭" />
                    </td>
                </tr>
            </table>


        </asp:EWindow>



        <asp:EWindow runat="server" ID="divSQL" Title="脚本" Width="800" Height="350" BackColor="White" Icon="book_open">

            <table class="grid">
                <tr>
                    <th style="width: 100px;"></th>
                  
                </tr>

                <tr>
                    
                    <td>
                        <asp:ETextBox runat="server" ID="txtSQL" Width="99%" Rows="16" TextMode="MultiLine"></asp:ETextBox>


                    </td>
                </tr>

               
                <tr>
                    <td class="center" colspan="1">
                        <asp:EButton ID="EButton1" runat="server" Icon="close" IsClient="true" OnClientClick="eci.closewindow(this)" Text="关闭" />
                    </td>
                </tr>
            </table>


        </asp:EWindow>

    </form>
</body>
</html>
