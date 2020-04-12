<%@ page language="C#" autoeventwireup="true" enableeventvalidation="false" inherits="App_DataHelp_EciDataHelpEdit, ECI.Web" enableviewstatemac="false" %>

<%@ Register Src="uc/ucDataHelpPublish.ascx" TagName="ucDataHelpPublish" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>数据选择</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        function back() {
            window.location.href = "EciDataHelpList.aspx";
        }

        function add() {
            window.location.href = "EciDataHelpEdit.aspx";
        }

        function copy() {
            if (eci.hasSave()) {
                return true;
            }
            else {

                return false;
            }
        }

        function deleteAction() {
            if (!eci.hasSave()) return false;

            msg.confirm("确定执行删除操作吗?", function () {
                __doPostBack("btnDelete");
            });

            return false;
        }

        function deleteCompleted(message) {
            msg.alert(message, { closed: function () { eci.close(); } });
        }

        function publishAction() {
            $("#msgtip").hide();
            eci.window("publisher_divHead");
            $("#publisher_radQueryType")[0].checked = true;
            $("#publisher_txtQueryTypePublish").val($("#txtQUERY_TYPE").val()).focus();
            $("#publisher_btnPublish").focus();


        }

        function previewAction(obj) {
            var type = $("#txtQUERY_TYPE").val();
            var url = "../../App/Common/Choose.aspx?t=txtTest&p=" + type;
            var options = { height: 600, width: 800 };
            eci.open(url, options);
        }

        $(function () {
            $("#txtQUERY_TYPE").focus();
        })

        function bizLogAction() {
            var bizNo = $("#txtQUERY_TYPE").val();
            var url = "../../App/Log/EciBizLogList.aspx?bizType=ECI_DATA_HELP&bizNo=" + bizNo;
            eci.open(url);
        }

        function sqlHelp() {
            $("#divSqlHelp").toggle();
        }


    </script>


</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />
          <input type="hidden" id="txtTest" />

        <div id="divSqlHelp" style="position: absolute; border: 1px solid green; background: #EEEEEE; top: 80px; display: none;">

            <div style="padding: 15px; line-height: 30px;">
                /*ECI_SELECT*/
                <br />
                /*WHERE*/<br />
            </div>

        </div>


        <div id="root">

            <div class="toolbar" id="toolbar">

                <asp:EButton runat="server" ID="btnSave" Text="保存"
                    NeedCheck="true" OnClick="btnSave_Click" Icon="save" />

                <asp:EButton runat="server" ID="btnAdd" Text="新增" Icon="Add" OnClientClick="add();" IsClient="true" />

                <asp:EButton ID="btnCopy" runat="server" Text="复制" OnClientClick="return copy();" Icon="copy" OnClick="btnCopy_Click" />
                <asp:EButton runat="server" ID="btnDelete" Icon="delete" Text="删除" OnClick="btnDelete_Click" OnClientClick="return deleteAction();" />

                &nbsp;<asp:EButton runat="server" ID="btnPublish" Icon="world" Text="发布" OnClientClick="publishAction()" IsClient="true" />


                    <asp:EButton ID="btnDownload" runat="server" CancelLoading="true" Icon="down" Text="下载" OnClick="btnDownload_Click" />


                &nbsp;<asp:EButton runat="server" ID="btnRepair" Text="异常修复"
                    Icon="function" OnClick="btnRepair_Click" />

                <asp:EButton runat="server" ID="btnPreview" Text="预览"
                    Icon="function" IsClient="true" OnClientClick="previewAction(this)" />

                <asp:EButton runat="server" ID="btnBizLog" Text="操作日志" Icon="function"
                    IsClient="true" OnClientClick="bizLogAction(this)" />

                &nbsp;<asp:EButton runat="server" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" IsClient="true" />


                <asp:ETipManager runat="server" SystemCode="KFPT" />


            </div>
            <div class="workarea" layout="toolbar,pagetitle">
                <table class="grid notop" cellpadding="0" cellspacing="0" id="tbEdit">
                    <tr>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>
                        <th style="width: 10%"></th>
                        <th style="width: 20%"></th>

                    </tr>
                    <tr>
                        <td class="lbl">

                            <asp:ETip runat="server" SystemCode="KFPT" Code="ECI_DATA_HELP.QUERY_TYPE" />查询类型 
                        </td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtQUERY_TYPE"
                                DataField="QUERY_TYPE" NotNull="true" Width="60%" AutoUpper="true"> </asp:ETextBox>
                            <asp:EButton ID="btnEdit" runat="server"
                                Text="编辑" Icon="edit" OnClick="btnEdit_Click" />
                        </td>
                        <td class="lbl">中文说明
                        </td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtMEMO" DataField="MEMO" NotNull="true" Width="85%"></asp:ETextBox>
                        </td>

                    </tr>

                    <tr>
                        <td class="lbl lbl-top">

                            <asp:ETip runat="server" SystemCode="KFPT" Code="ECI_DATA_HELP.SQL" />查询语句
                            <br />
                            <asp:EButton runat="server" ID="btnHelp" BorderWidth="0" Icon="tip" IsClient="true" OnClientClick="sqlHelp()" />
                            <br />
                            <asp:EButton ID="btnYH" runat="server"
                                Text="自动优化" Icon="function" OnClick="btnYH_Click" />

                        </td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtSQL" Alias="查询语句" DataField="SQL" Rows="6" NotNull="true" TextMode="MultiLine" Width="94%"></asp:ETextBox>




                        </td>
                    </tr>
                    <tr>
                        <td class="lbl lbl-top">

                            <asp:ETip runat="server" SystemCode="KFPT" Code="ECI_DATA_HELP.CONVERT_SQL" />
                            转换语句
                        </td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtCONVERT_SQL" Placeholder="正常情况下不用填写" DataField="CONVERT_SQL" Rows="2" TextMode="MultiLine" Width="94%"></asp:ETextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">转换代码</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtDATA_CHANGE_CODE" DataField="DATA_CHANGE_CODE" NotNull="true" Width="85%" AutoUpper="true"></asp:ETextBox></td>
                        <td class="lbl">转换名称</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtDATA_CHANGE_NAME" DataField="DATA_CHANGE_NAME" NotNull="true" Width="85%" AutoUpper="true"></asp:ETextBox></td>

                    </tr>

                    <tr>
                        <td class="lbl">代码中文</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCODE_MEMO" DataField="CODE_MEMO" Width="85%" AutoUpper="true"></asp:ETextBox></td>
                        <td class="lbl">名称中文</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtNAME_MEMO" DataField="NAME_MEMO" Width="85%" AutoUpper="true"></asp:ETextBox></td>

                    </tr>

                    <tr>
                        <td class="lbl">
                            <asp:ETip runat="server" SystemCode="KFPT" Code="ECI_DATA_HELP.QUERY_FIELD" />查询字段</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtQUERY_FIELD" DataField="QUERY_FIELD" Width="85%" AutoUpper="true"></asp:ETextBox></td>
                        <td class="lbl">查询模式</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboQueryMode" DataField="QUERY_MODE" Width="85%">
                                <asp:ListItem Value="">默认模式</asp:ListItem>
                                <asp:ListItem Value="M01">逗号分隔查询条件</asp:ListItem>
                            </asp:ECombox>
                        </td>

                    </tr>

                    <tr>
                        <td class="lbl lbl-top">
                            <asp:ETip runat="server" SystemCode="KFPT" Code="ECI_DATA_HELP.CHOOSE_SHOW" />显示列

                        </td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtCHOOSE_SHOW" DataField="CHOOSE_SHOW" Rows="2" TextMode="MultiLine" Width="94%"></asp:ETextBox>
                            <br />
                        </td>

                    </tr>

                    <tr>
                        <td class="lbl lbl-top">
                            <asp:ETip runat="server" SystemCode="KFPT" Code="ECI_DATA_HELP.CONFIG" />
                        配置
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtConfig" DataField="CONFIG" Width="94%" TextMode="MultiLine" Rows="2"></asp:ETextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="lbl lbl-top">
                            <asp:ETip runat="server" SystemCode="KFPT" Code="ECI_DATA_HELP.LAYOUT" />布局设置</td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtLAYOUT" DataField="LAYOUT" Rows="2" TextMode="MultiLine" Width="94%"></asp:ETextBox>
                        </td>

                    </tr>

                    <tr>
                        <td class="lbl">
                            <asp:ETip runat="server" SystemCode="KFPT" Code="ECI_DATA_HELP.SORT_FIELD" />排序字段</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtSORT_FIELD" DataField="SORT_FIELD" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">
                            <asp:ETip runat="server" SystemCode="KFPT" Code="ECI_DATA_HELP.FILTER" />

                            <label for="txtFILTER">
                                过滤数据</label>
                        </td>
                        <td>
                            <asp:ECheckBox runat="server" ID="txtFILTER" DataField="FILTER" TrueValue="Y" FalseValue="N"></asp:ECheckBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="lbl">



                            <asp:ETip runat="server" SystemCode="KFPT" Code="ECI_DATA_HELP.COMPARE_TYPE" />比较类型</td>
                        <td>
                            <asp:EDropDownList runat="server" ID="txtCompareType"
                                DataField="COMPARE_TYPE" NotNull="true" Width="85%">
                                <asp:ListItem Value="LIKE">模糊查询</asp:ListItem>
                                <asp:ListItem Value="=">精确查询</asp:ListItem>
                                <asp:ListItem Value="=LIKE">精确验证、模糊查询</asp:ListItem>

                            </asp:EDropDownList>
                        </td>
                        <td class="lbl">
                            <asp:ETip runat="server" SystemCode="KFPT" Code="ECI_DATA_HELP.AUTO_UPPER" />
                            <label for="chkAutoUpper">
                                区分大小写</label>
                        </td>
                        <td>
                            <asp:ECheckBox runat="server" ID="chkAutoUpper" DataField="AUTO_UPPER" TrueValue="N" FalseValue="Y"></asp:ECheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl lbl-top">

                            <asp:ETip runat="server" SystemCode="KFPT" Code="ECI_DATA_HELP.ASSEMBLY_NAME" Height="16px" />扩展定义
                        </td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtASSEMBLY_NAME" DataField="ASSEMBLY_NAME" Placeholder="请输入扩展定义类" Width="94%"></asp:ETextBox>


                        </td>
                    </tr>
                    <tr>
                        <td class="lbl lbl-top">
                            <asp:ETip runat="server" SystemCode="KFPT" Code="ECI_DATA_HELP.MEMO" />

                            备注说明</td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtMEMO_DETAIL" DataField="MEMO_DETAIL" Rows="2" TextMode="MultiLine" Width="94%"></asp:ETextBox>
                        </td>


                    </tr>



                    <tr>
                        <td class="lbl lbl-top">
                            <asp:ETip runat="server" SystemCode="KFPT" Code="ECI_DATA_HELP.USE_CACHE" />
                            <label for="chkUseCache">
                                使用缓存</label>
                        </td>
                        <td>
                            <asp:ECheckBox runat="server" ID="chkUseCache" DataField="USE_CACHE" TrueValue="Y" FalseValue="N"></asp:ECheckBox>
                        </td>
                        <td class="lbl">分类代码</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboSysCode" DataField="SYS_CODE" DataValueField="CODE" DataTextField="NAME" Width="85%">
                            </asp:ECombox>
                        </td>


                    </tr>



                    <tr>
                        <td class="lbl lbl-top">默认查询数据</td>
                        <td>
                            <asp:ECheckBox runat="server" ID="chkQueryData" DataField="QUERY_DATA" TrueValue="Y" FalseValue="N"></asp:ECheckBox>
                        </td>
                        <td class="lbl">分页大小</td>
                        <td>
                            <asp:ECombox runat="server" ID="cboPageSize" DataField="PAGE_SIZE" Width="85%">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:ECombox>
                        </td>


                    </tr>

                    <tr>
                        <td class="lbl">创建日期</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtCREATE_DATE" DataField="CREATE_DATE" Width="85%" ReadOnly="true"></asp:ETextBox>
                        </td>
                        <td class="lbl">修改日期</td>
                        <td>
                            <asp:ETextBox runat="server" ID="txtUPDATE_DATE" DataField="UPDATE_DATE" Width="85%" ReadOnly="true"></asp:ETextBox>
                        </td>
                    </tr>

                 
                </table>
            </div>
        </div>


        <uc1:ucDataHelpPublish ID="publisher" runat="server" />

    </form>
</body>
</html>
