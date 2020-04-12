<%@ page language="C#" autoeventwireup="true" enableeventvalidation="false" inherits="App_DataCache_EciDataCacheEdit, ECI.Web" enableviewstatemac="false" %>

<%@ Register Src="uc/ucDataCachePublish.ascx" TagName="ucDataCachePublish" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>数据缓存</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
       

        function add() {
            window.location.href = "EciDataCacheEdit.aspx";
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
            var url = "../../App/Common/Choose.aspx?p=" + type;
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


    </script>


</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">

            <div class="toolbar" id="toolbar">

                <asp:EButton runat="server" ID="btnSave" Text="保存"
                    NeedCheck="true" OnClick="btnSave_Click" Icon="save" />

                <asp:EButton runat="server" ID="btnAdd" Text="新增" Icon="Add" OnClientClick="add();" IsClient="true" />

                <asp:EButton ID="btnCopy" runat="server" Text="复制" OnClientClick="return copy();" Icon="copy" OnClick="btnCopy_Click" />
                <asp:EButton runat="server" ID="btnDelete" Icon="delete" Text="删除" OnClick="btnDelete_Click" OnClientClick="return deleteAction();" />

                &nbsp;<asp:EButton runat="server" ID="btnPublish" Icon="world" Text="发布" OnClientClick="publishAction()" IsClient="true" />


                    <asp:EButton ID="btnDownload" runat="server" CancelLoading="true" Icon="down" Text="下载" OnClick="btnDownload_Click" />


                &nbsp;&nbsp;<asp:EButton runat="server" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" IsClient="true" />


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
                        <td class="lbl">类型 
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
                        <td class="lbl lbl-top">查询语句</td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtSQL" DataField="SQL" Rows="10" NotNull="true" TextMode="MultiLine" Width="94%"></asp:ETextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl lbl-top">备注说明</td>
                        <td colspan="3">
                            <asp:ETextBox runat="server" ID="txtMEMO_DETAIL" DataField="MEMO_DETAIL" Rows="5" TextMode="MultiLine" Width="94%"></asp:ETextBox>
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

         <uc1:ucDataCachePublish ID="publisher" runat="server" />

    </form>
</body>
</html>
