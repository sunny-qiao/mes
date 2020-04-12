<%@ page language="C#" autoeventwireup="true" inherits="AppRPT_Manage_ReportEdit, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>报表设计</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <link href="../../EasyUI/themes/default/easyui.css" rel="stylesheet" />

    <script type="text/javascript">
        function pageClose() {
            eci.close();
        }

        function addAction() {
            window.location.href = "ReportEdit.aspx";
        }

        function copy() {
            if (!eci.hasSave()) { return false;}
            $("#hidKey").val("");
            msg.tip("复制成功!");

            var code = $("#txtCODE").val();

            $("#txtCODE").val(code + "-复制");
            $("#txtCODE").focus();
        }

        $(function () {

            if ($("#chkDetail")[0].checked) {
                $(".trDetail").show();
            }
            else {
                $(".trDetail").hide();
            }

            $("#chkDetail").click(function () {
                if (this.checked) {
                    $(".trDetail").show();
                }
                else {
                    $(".trDetail").hide();
                }

            });
        });


        function priview() {

            if (eci.hasSave({ message: "请先保存报表信息！" })) {

                var reportCode = $("#txtCODE").val();
                var param = $("#txtPREVIEW_PARAM").val();

                eci.report(reportCode, param);
            }
        }

        function uploadAction() {
            var file = $("#fileUpload").val();

            if (fileGuid == "" && file == "") {

                msg.alert("请选择报表文件");
                return false;
            }
            else {
                return true;
            }
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />

        <div id="toolbar" class="toolbar">



            <asp:EButton runat="server" ID="btnSave" Text="保存"
                NeedCheck="true" OnClick="btnSave_Click" Icon="Save" />

            <asp:EButton runat="server" ID="btnAdd" Text="新增" OnClientClick="return addAction();"
                IsClient="true" Icon="Add" />

            <asp:EButton runat="server" ID="btnCopy" Text="复制" OnClientClick="return copy();"
                IsClient="true" Icon="copy" />

            <asp:EButton runat="server" ID="EButton1" Text="报表预览(P)" AccessKey="p" OnClientClick="return priview();"
                IsClient="true" Icon="eye" />

            预览参数：<asp:ETextBox runat="server" ID="txtPREVIEW_PARAM" DataField="PREVIEW_PARAM" Width="300"> </asp:ETextBox>

            <asp:EButton runat="server" ID="btnClose" Text="关闭" OnClientClick="pageClose();"
                IsClient="true" Icon="close" />

        </div>

        <div class="fitH" layout="toolbar">

            <asp:ETab runat="server" ID="tabMain">
                <asp:ETabItem runat="server" ID="tabHead" Title="报表信息">
                    
                        <table class="grid" cellpadding="0" cellspacing="0">
                            <tr>
                                <th style="width: 80px; min-width: 80px;"></th>
                                <th style="width: 50%"></th>
                                <th style="width: 100px; min-width: 100px;"></th>
                                <th style="width: 50%"></th>

                            </tr>
                            <tr>
                                <td class="lbl">报表编码
                                </td>
                                <td>
                                    <asp:ETextBox runat="server" ID="txtCODE" DataField="CODE" NotNull="true" Width="85%" AutoUpper="true"> </asp:ETextBox>
                                </td>
                                <td class="lbl">报表名称
                                </td>
                                <td>
                                    <asp:ETextBox runat="server" ID="txtNAME" DataField="NAME" NotNull="true" Width="85%"></asp:ETextBox>
                                </td>

                            </tr>

                            <tr>
                                <td class="lbl">程序扩展</td>
                                <td colspan="3">
                                    <asp:ETextBox runat="server" ID="txtASSEMBLY_EXTEND" DataField="ASSEMBLY_EXTEND" Width="93%"> </asp:ETextBox>
                                </td>

                            </tr>

                            <tr>
                                <td class="lbl">报表文件</td>
                                <td colspan="3">
                                    <asp:ETextBox runat="server" ID="txtTEMPLATE_FILE" DataField="TEMPLATE_FILE" NotNull="true" Width="93%"> </asp:ETextBox>
                                </td>

                            </tr>

                            <tr>
                                <td class="lbl">上传文件</td>
                                <td colspan="3">
                                    <asp:FileUpload ID="fileUpload" runat="server" />

                                    <asp:EButton runat="server" ID="btnOK" Text="确定" OnClientClick="return uploadAction();"
                                        NeedCheck="true" Icon="Tick" OnClick="btnOK_Click" />

                                </td>

                            </tr>

                            <tr>
                                <td class="lbl">报表类型</td>
                                <td>
                                    <asp:EDropDownList runat="server" ID="ddlStatus0" DataField="TYPE" Width="85%">
                                        <asp:ListItem Value="EXCEL">Excel报表</asp:ListItem>
                                        <asp:ListItem Value="RDLC">RDLC报表</asp:ListItem>

                                    </asp:EDropDownList>
                                </td>
                                <td class="lbl">状态
                                </td>
                                <td>
                                    <asp:EDropDownList runat="server" ID="ddlStatus" DataField="STATUS" Width="85%">
                                        <asp:ListItem Value="1">启用</asp:ListItem>
                                        <asp:ListItem Value="0">停用</asp:ListItem>

                                    </asp:EDropDownList>
                                </td>

                            </tr>

                       

                           

                            <tr>
                                <td class="lbl" style="vertical-align: top;">备注</td>
                                <td colspan="3">
                                    <asp:ETextBox runat="server" ID="txtMEMO" TextMode="MultiLine" Rows="5" DataField="MEMO" Width="93%"> </asp:ETextBox>
                                </td>

                            </tr>

                            <tr>
                                <td class="lbl" style="vertical-align: top;"></td>
                                <td colspan="3"></td>

                            </tr>

                        </table>
                     
                </asp:ETabItem>
                <asp:ETabItem runat="server" ID="tabData" Title="数据源">

                    <table class="grid" cellpadding="0" cellspacing="0">
                            <tr>
                                <th style="width: 80px; min-width: 80px;"></th>
                                <th style="width: 50%"></th>
                                <th style="width: 100px; min-width: 100px;"></th>
                                <th style="width: 50%"></th>

                            </tr>

                             <tr>
                                <td class="lbl">主数据源</td>
                                <td>
                                    <asp:ETextBox runat="server" ID="txtMAIN" DataField="MAIN" Text="HEAD" Width="85%"> </asp:ETextBox>
                                </td>
                                <td class="lbl">
                                    <label for="chkDetail">明细数据源</label>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="chkDetail" /></td>
                            </tr>
                            <tr>
                                <td class="lbl" style="vertical-align: top;">&nbsp;</td>
                                <td colspan="3">
                                    <asp:ETextBox runat="server" ID="txtMAIN_SQL" TextMode="MultiLine" Rows="20" DataField="MAIN_SQL" Width="94.5%"> </asp:ETextBox>
                                </td>

                            </tr>
                           <tr class="trDetail">
                                <td class="lbl" style="vertical-align: top;">&nbsp;</td>
                                <td colspan="3">
                                    <asp:ETextBox runat="server" ID="txtDTL1" DataField="DTL1" Width="300px"></asp:ETextBox>
                                    &nbsp;<span style="color: green">格式：名称|明细数据开始行 <span style="color: red">注意：EXCEL中，第一行是1不是0</span></span></td>

                            </tr>

                            <tr class="trDetail">
                                <td class="lbl" style="vertical-align: top;"></td>
                                <td colspan="3" style="border: 2px solid blue;">
                                    <asp:ETextBox runat="server" ID="txtSQL1" TextMode="MultiLine" Rows="12" DataField="SQL1" Width="94.5%"> </asp:ETextBox>
                                </td>

                            </tr>

                            <tr class="trDetail">
                                <td class="lbl" style="vertical-align: top;">&nbsp;</td>
                                <td colspan="3">

                                    <asp:ETextBox runat="server" ID="txtDTL2" DataField="DTL2" Width="300px"></asp:ETextBox>
                                </td>

                            </tr>

                            <tr class="trDetail">
                                <td class="lbl" style="vertical-align: top;"></td>
                                <td colspan="3" style="border: 2px solid brown;">

                                    <asp:ETextBox runat="server" ID="txtSQL2" TextMode="MultiLine" Rows="12" DataField="SQL2" Width="94.5%"> </asp:ETextBox>
                                </td>

                            </tr>

                            <tr class="trDetail">
                                <td class="lbl" style="vertical-align: top;">&nbsp;</td>
                                <td colspan="3">
                                    <asp:ETextBox runat="server" ID="txtDTL3" DataField="DTL3" Width="300px"></asp:ETextBox>
                                </td>

                            </tr>

                            <tr class="trDetail">
                                <td class="lbl" style="vertical-align: top;"></td>
                                <td colspan="3" style="border: 2px solid pink;">
                                    <asp:ETextBox runat="server" ID="txtSQL3" TextMode="MultiLine" Rows="12" DataField="SQL3" Width="94.5%"> </asp:ETextBox>
                                </td>

                            </tr>
                        </table>

                </asp:ETabItem>
            </asp:ETab>


        </div>
    </form>
</body>
</html>
