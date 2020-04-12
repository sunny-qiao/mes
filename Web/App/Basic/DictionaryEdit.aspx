<%@ page language="C#" autoeventwireup="true" inherits="App_Basic_DictionaryEdit, ECI.Web" validaterequest="false" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>程序设计</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">

        function tbMain_select(from, to) {
            if (from == 0) {
                var guid = GetGUID();
                if (guid == "") {
                    msg.warning("请先保存程序主信息");
                    return false;
                }
            }
        }

        function ShowEdit() {
            var divName = document.getElementById("hidShow").value;
            var title = "";
            if (divName == "divPop") title = "数据项设置";
            if (divName == "divFetch") title = "导入数据字典";

            if (divName != "") {
                document.getElementById("hidShow").value = "";
                $("#" + divName).dialog({
                    width: 800, title: title, modal: true
                    , open: function () { $("body > div").appendTo("form#form1"); }

                });

                InitLayout();
            }
        }

        function deleteTableExecute() {
            var guid = GetGUID();
            if (!guid) return false;

            var password = $("#password").val().trim();
            if (password == "") {
                msg.error("请输入密码");
                eci.focus("password");
                return false;
            }

            $.eci.post("Data/Data.ashx", "TxDeleteEciTable", { password: password, guid: guid }, deleteResponse);

            return false;
        }

        var deleteResponse = function (response) {
            msg.ajax(response);

            if (response.success) {
                window.setTimeout(function () {
                    window.location.href = "Dictionary.aspx"
                }, 500);
            }
        }

        function deleteTable() {
            var tableGUID = GetGUID();
            if (!tableGUID) return false;

            eci.window("divDeleteTable");
        }

        function Reload() {
            if (dom("txtCode").value.trim() == "") { $.msg.error("当前数据还没有保存", { focusId: "txtFMainAlias" }); return false; }
            return true;
        }

        function FieldEdit() {
            var tableGUID = GetGUID();
            if (!tableGUID) return false;
            url = "../../App/Basic/DictionaryFieldBatchEdit.aspx?TableGuid=" + tableGUID;

            eci.open(url);
        }

        function FieldSeq() {
            var tableGUID = GetGUID();
            if (!tableGUID) return false;
            url = "../../App/Basic/FieldOrderMain.aspx?TableGuid=" + tableGUID;
            eci.open(url);
        }

        function ShareConfig() {
            var tableGUID = GetGUID();
            if (!tableGUID) return false;
            url = "../../App/Basic/ShareEdit.aspx?TableGuid=" + tableGUID;
            eci.dialog("共享配置", url, { width: 800, height: 620 });
        }

        function GetGUID() {
            var tableGUID = dom("hidTableGUID").value.trim();
            if (tableGUID == "") { $.msg.error("当前数据还没有保存", { focusId: "txtFMainAlias" }); return false; }
            return tableGUID;
        }

        function TableFunction() {
            var tableGUID = GetGUID();
            if (!tableGUID) return false;
            url = "../../App/Basic/EciTableFunctionEdit.aspx?TABLE_GUID=" + tableGUID;

            eci.dialog("功能扩展", url);
        }

        function Save() {
            if (dom("txtFMainAlias").value.trim() == "") { $.msg.error("显示名不可以为空", { focusId: "txtFMainAlias" }); return false; }

            msg.loading();

            return true;
        }

        function Jump() {
            if (dom("txtJump").value.trim() == "") { $.msg.error("请输入要转入的页面代码", { focusId: "txtJump" }); return false; }
            return true;
        }

        function CopyTable() {
            var pageCode = $("#txtCode").val();
            var newPageCode = $("#txtJump").val().trim();

            if (newPageCode == "") { $.msg.error("请输入目标程序代码", { focusId: "txtJump" }); return false; }

            msg.confirm("确定执行完全复制功能吗?", function () {

                msg.loading();

                eci.post("Data/Data.ashx", "CopyTable", { pageCode: pageCode, newPageCode: newPageCode }
                   , function (response) {

                       if (response.success) {
                           var guid = response.guid;
                           var url = "DictionaryEdit.aspx?guid=" + guid;
                           window.location.href = url;
                       }
                       else {
                           msg.ajax(response);
                       }
                   });

            });
        }

        function copyField() {
            var tableGuid = GetGUID();

            if (!eci.selectOneRow()) { return false; }

            var guid = eci.selectedKey();

            msg.loading();

            eci.post("Data/data.ashx", "CopyField", { tableGuid: tableGuid, guid: guid }
                   , function (response) {

                       if (response.success) {

                           postback("btnRefresh");
                       }
                       else {
                           msg.ajax(response);
                       }
                   });

        }

        function deleteField() {
            if (!eci.selectRow()) { return false; }

            msg.loading();

            msg.confirm('确定执行删除操作吗?', function () {

                var keys = eci.selectedKey();
                eci.post("Data/data.ashx", "DeleteField", { keys: keys }
                     , function (response) {

                         if (response.success) {

                             postback("btnRefresh");
                         }
                         else {
                             msg.ajax(response);
                         }
                     });

            });
        }


        function preview() {
            var p = $("#txtCode").val();
            if (p != "") {
                var url = "../../App/Core/List.aspx?p=" + p;
                eci.open(url);
            }
        }

        function fetch() {
            var tableGUID = GetGUID();
            if (!tableGUID) return false;

            var p = $("#txtFName").val();

            var url = "../../App/Basic/DictionaryFieldFetch.aspx?guid=" + tableGUID + "&p=" + p;
            eci.open(url);
        }
    </script>
    <script type="text/javascript">
        function Open(obj) {
            var key = $(obj).attr("data");
            if (key != "") {
                var url = "../../App/Core/Edit.aspx?p=ECI_TABLE_ELEMENT&key=" + key;
                eci.open(url);
            }
            return false;
        }

        function OpenField(obj) {
            var guid = $(obj).attr("data");
            var url = "../../App/Basic/DictionaryFieldEdit.aspx?guid=" + guid;
            eci.open(url);
        }

        function AddField() {
            var tableGuid = $("#hidTableGUID").val();
            var url = "../../App/Basic/DictionaryFieldEdit.aspx?TableGuid=" + tableGuid;
            eci.open(url);
        }

        function NewTable() {
            var tableGuid = $("#hidTableGUID").val();
            if (tableGuid == "") {
                $.msg.error("当前页面就是新增状态");
            }
            else {
                var url = "DictionaryEdit.aspx";
                window.location.href = url;
            }
        }

        function tableMore() {
            var tableGUID = GetGUID();
            if (!tableGUID) return false;
            var code = $("#txtCode").val();

            var url = "../../App/Basic/EciTableEdit.aspx?key=" + tableGUID;
            eci.open(url);
        }


        $(function () {
            var windowHeight = $(window).height();
            var toolbarHeight = $("#toolbar").height();
            var tabHeadHeight = $("#tabHead").height();
            var toolbar2Height = $("#toolbar2").height();
            var toolbar3Height = $("#toolbar3").height();
            var height = windowHeight - toolbarHeight - tabHeadHeight - toolbar2Height - toolbar3Height - 40;
            $("#gvData").css("height", height + "px");
            $("div[role=egrid]").eGrid().layout();
        });

        function selectAllFunction() {
            $(".function").find("input[type=checkbox]").attr("checked", "checked");
            $(".function").find("input[type=checkbox]").each(function () { $(this)[0].checked = true; });
        }

        function unSelectAllFunction() {
            $(".function").find("input[type=checkbox]").each(function () { $(this)[0].checked = false; });
        }

        $(function () {
            $("#txtFName").click(function () {
                if ($(this).val().trim() == "") {
                    $(this).val($("#txtCode").val());
                }
            });

            var html = "<div class='icon-ok'>&nbsp;</div>";
            $("#gvDataTable .QUERY_SHOW").filter(function () { return $(this).text() == "1" }).html(html);
            $("#gvDataTable .QUERY_SHOW").filter(function () { return $(this).text() == "0" }).html("");

            $("#gvDataTable .GRID_SHOW").filter(function () { return $(this).text() == "1" }).html(html);
            $("#gvDataTable .GRID_SHOW").filter(function () { return $(this).text() == "0" }).html("");

            $("#gvDataTable .EDIT_SHOW").filter(function () { return $(this).text() == "1" }).html(html);
            $("#gvDataTable .EDIT_SHOW").filter(function () { return $(this).text() == "0" }).html("");

            html = "<div class='icon-key'>&nbsp;</div>";
            var $primaryKey = $("#gvDataTable .PRIMARY_KEY").filter(function () { return $(this).text() == "1" }).parent().find(".MAIN_ALIAS");
            var mainAlias = $primaryKey.html();
            html = "<div class='icon-key'>" + mainAlias + "</div>";
            $primaryKey.html(html);

        });

        function publish() {
            msg.loading("操作执行中……");



            eci.post("Data/data.ashx", "Publish", {}, function (response) {
                msg.close();
                msg.ajax(response);
 
            })
        }

        function design() {
            var tableGuid = $("#hidTableGUID").val();
            var url = "Design.aspx?TableGuid=" + tableGuid;
            eci.open(url);
        }

        function designList() {
            var tableGuid = $("#hidTableGUID").val();
            var url = "DesignList.aspx?TableGuid=" + tableGuid;
            eci.open(url);
        }


    </script>

    <style type="text/css">
        .icon-key {
            background: url('../../Icon/key.png') no-repeat;
            background-position: left;
            padding-left: 20px;
        }
    </style>

</head>
<body style="padding: 0px; margin: 0px;">
    <form id="form1" runat="server" style="padding: 0px; margin: 0px">
        <input type="hidden" runat="server" id="hidTableGUID" />
        <input type="hidden" runat="server" id="txtHeadDisplay" />
        <input runat="server" id="hidShow" type="hidden" />
        <input type="hidden" runat="server" id="hidFieldKey" />

        <div class="fitH">

            <asp:EPanel ID="divTable" runat="server" Title="程序主信息" Icon="brick">
                <div id="toolbar" class="toolbar">


                    <asp:EButton ID="btnSave" runat="server" Text="保存(S)" AccessKey="s"
                        OnClick="btnSave_Click" OnClientClick="return Save();" NeedCheck="true" Icon="save" />
                    <asp:EButton ID="btnNew" runat="server" Text="新增" IsClient="true"
                        OnClientClick="NewTable();" Icon="Add" />
                    <asp:EButton ID="btnPreview" IsClient="true" runat="server" Width="91px" Text="预览(P)"
                        AccessKey="p" OnClientClick="preview();" Icon="eye" />
                    <asp:EButton ID="btnMore" runat="server" Text="详细配置" IsClient="true" OnClientClick="tableMore()" Icon="table_gear" />
                    <asp:EButton ID="btnDeleteTop" runat="server" Text="删除" IsClient="true" Icon="delete"
                        OnClientClick="deleteTable();" />
                    <asp:EButton ID="btnExtend" runat="server" Text="功能扩展" IsClient="true" Icon="button"
                        OnClientClick="TableFunction();return false;" />

                    <asp:EButton ID="btnShareConfig" runat="server" Icon="brick_link" IsClient="true" OnClientClick="ShareConfig();" Text="共享配置" />
                    <asp:EButton ID="btnPublish" runat="server" Text="发布" IsClient="true" OnClientClick="publish();" Icon="world" />
                    <asp:EButton ID="btnDownload" runat="server" CancelLoading="true" Icon="down" Text="下载" OnClick="btnDownload_Click" />
                    <asp:EButton ID="btnClose" runat="server" Icon="close" IsClient="true" OnClientClick="eci.close({confirm:false})" Text="关闭" />
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
                        <td class="lbl">程序代码
                        </td>
                        <td class="txt">
                            <asp:ETextBox ID="txtCode" runat="server" Width="90%" NotNull="true" DataField="CODE" ImeDisabled="true" AutoUpper="true"></asp:ETextBox>
                        </td>
                        <td class="lbl">数据表名
                        </td>
                        <td class="txt">
                            <asp:ETextBox ID="txtFName" runat="server" Width="90%" DataField="TABLE_NAME" NotNull="true" ImeDisabled="true" AutoUpper="true"></asp:ETextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">页面标题&nbsp;</td>
                        <td class="txt">
                            <asp:ETextBox ID="txtFMainAlias" runat="server" DataField="MAIN_ALIAS" Width="45%" NotNull="true"></asp:ETextBox>
                            <asp:ETextBox ID="txtLangCode" runat="server" DataField="LANG_CODE" Width="45%"></asp:ETextBox>
                        </td>
                        <td class="lbl">配置类型</td>
                        <td class="txt">
                            <asp:EDropDownList ID="ddlTYPE" runat="server" DataField="TYPE" Width="85%">
                                <asp:ListItem Value=""></asp:ListItem>
                                <asp:ListItem>正式配置</asp:ListItem>
                                <asp:ListItem Selected="True">企业配置</asp:ListItem>
                            </asp:EDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">显示列数
                        </td>
                        <td class="txt">
                            <asp:EDropDownList ID="cboColumnCount" runat="server" Width="90%" DataField="COLUMN_COUNT" NotNull="true">
                                <asp:ListItem Text="1"></asp:ListItem>
                                <asp:ListItem Text="2"></asp:ListItem>
                                <asp:ListItem Text="3" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="4"></asp:ListItem>
                            </asp:EDropDownList>
                        </td>
                        <td class="lbl">主从级联
                        </td>
                        <td class="txt">
                            <asp:ETextBox ID="txtCondition" runat="server" Width="90%" DataField="CONDITION" DefaultIME="true" AutoUpper="true"></asp:ETextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">
                            <label for="chkLoadData">
                                加载数据</label></td>
                        <td class="txt">
                            <asp:ECheckBox ID="chkLoadData" runat="server" DataField="LOAD_DATA" FalseValue="0" Text="" TrueValue="1" />
                            &nbsp;&nbsp; 默认排序<asp:ETextBox ID="txtDefaultSort" runat="server" AutoUpper="true" DataField="DEFAULT_SORT" ImeDisabled="true" Width="150"></asp:ETextBox>
                        </td>
                        <td class="lbl">企业自定义</td>
                        <td>
                            <asp:EDropDownList ID="cboCanConfig" runat="server" DataField="CAN_CONFIG" Width="90%">
                                <asp:ListItem Value=""></asp:ListItem>
                                <asp:ListItem Value="Y">是</asp:ListItem>
                                <asp:ListItem Value="N">否</asp:ListItem>
                            </asp:EDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">客户端控制类
                        </td>
                        <td class="txt" nowrap="nowrap"  >
                            <asp:ETextBox ID="txtAdvanceConfig" runat="server" Width="90%" DataField="ADVANCE_CONFIG"></asp:ETextBox>
                        </td>
                        <td class="lbl">企业代码</td>
                        <td>
                            <asp:ETextBox ID="txtCompanyCode" runat="server" AutoUpper="true" DataField="COMPANY_CODE" ImeDisabled="true"   Width="90%"></asp:ETextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">服务端控制类</td>
                        <td class="txt" nowrap="nowrap" colspan="3">
                            <asp:ETextBox ID="txtAdvanceConfigServer" runat="server" Width="96%" DataField="ADVANCE_CONFIG_SERVER"></asp:ETextBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="3">
                            <asp:EButton ID="EButton1" runat="server" Icon="add" IsClient="true" OnClientClick="selectAllFunction();" Text="选择全部功能" />
                            <asp:EButton ID="EButton3" runat="server" Icon="delete" IsClient="true" OnClientClick="unSelectAllFunction();" Text="移除全部功能" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="3" class="function">
                            <asp:ECheckBox ID="chkFunctionAdd" runat="server" DataField="FUNCTION_ADD" FalseValue="0" Text="新增" TrueValue="1" />
                            <asp:ECheckBox ID="chkFunctionEdit" runat="server" DataField="FUNCTION_EDIT" FalseValue="0" Text="编辑" TrueValue="1" />
                            <asp:ECheckBox ID="chkFunctionDelete" runat="server" DataField="FUNCTION_DELETE" FalseValue="0" Text="删除" TrueValue="1" />
                            <asp:ECheckBox ID="chkFunctionExcel" runat="server" DataField="FUNCTION_EXCEL" FalseValue="0" Text="导出" TrueValue="1" />
                            <asp:ECheckBox ID="chkFunctionBack" runat="server" DataField="FUNCTION_BACK" FalseValue="0" Text="返回" TrueValue="1" />


                            <span style="margin-left: 80px;">&nbsp;</span>


                            <asp:ECheckBox ID="chkEditFunctionAdd" runat="server" DataField="EDIT_FUNCTION_ADD" FalseValue="0" Text="新增" TrueValue="1" />
                            <asp:ECheckBox ID="chkEditFunctionSave" runat="server" DataField="EDIT_FUNCTION_SAVE" FalseValue="0" Text="保存" TrueValue="1" />
                            <asp:ECheckBox ID="chkEditFunctionCopy" runat="server" DataField="EDIT_FUNCTION_COPY" FalseValue="0" Text="复制" TrueValue="1" />
                            <asp:ECheckBox ID="chkEditFunctionClose" runat="server" DataField="EDIT_FUNCTION_CLOSE" FalseValue="0" Text="关闭" TrueValue="1" />


                        </td>
                    </tr>

                    <tr>
                        <td class="function" colspan="4">
                            <asp:EPanel runat="server" Title="辅助工具" Icon="wrench">
                                <table style="width: 100%;" cellpadding="0" runat="server" cellspacing="0" border="0"
                                    class="grid" id="Table1">
                                    <tr>
                                        <th style="width: 10%"></th>
                                        <th style="width: 23%"></th>
                                        <th style="width: 10%"></th>
                                        <th style="width: 23%"></th>
                                    </tr>
                                    <tr>
                                        <td class="lbl">
                                            <span style="padding-left: 2px;">目标程序代码</span></td>
                                        <td class="txt" colspan="3">
                                            <span style="padding-left: 2px;">
                                                <asp:ETextBox ID="txtJump" runat="server" AutoUpper="true" DefaultIME="true" ToolTip="请输入目标程序代码" Width="252"></asp:ETextBox>
                                                <asp:EButton ID="btnJump" runat="server" AccessKey="j" Icon="bullet_go" OnClick="btnJump_Click" OnClientClick="return Jump();" Text="转到(J)" Visible="true" Width="60" />
                                                <asp:EButton ID="btnCopy" runat="server" Icon="copy" IsClient="true" OnClientClick="return CopyTable();" Text="复制" />
                                                <span>
                                                    <asp:EButton ID="btnDesign" runat="server" Icon="function" IsClient="true" OnClientClick="return design();" Text="快速设计" />
                                                    <asp:EButton ID="btnDesignList" runat="server" Icon="function" IsClient="true" OnClientClick="return designList();" Text="快速设计" />
                                                </span>
                                            </span>
                                        </td>
                                    </tr>
                                </table>
                            </asp:EPanel>
                        </td>
                    </tr>
                </table>
            </asp:EPanel>

            <asp:EPanel ID="divElement" runat="server" Title="程序元素" Icon="table">
                <div id="toolbar2" class="toolbar" style="border-top-width: 1px; margin-top: 2px;">
                    <asp:EButton ID="btnAdd" runat="server" Text="新增(N)" AccessKey="n"
                        OnClientClick="AddField();" IsClient="true" Icon="add" />
                    <asp:EButton ID="btnCopyField" runat="server" Text="复制"
                        OnClientClick="copyField();" IsClient="true" Icon="copy" />
                    <asp:EButton ID="btnDelete" runat="server" Text="删除(D)" AccessKey="d" Icon="delete" IsClient="true"
                        OnClientClick="deleteField();" />
                    <asp:EButton ID="btnFetch" runat="server" Text="字典(F)" AccessKey="f"
                        IsClient="true" OnClientClick="fetch();" Icon="database_add" />
                    <asp:EButton runat="server" ID="aa" Text="快捷维护" OnClientClick="FieldEdit();"
                        IsClient="true" Icon="table" />




                    <asp:DropDownList ID="cboQuery" runat="server" CssClass="eci-select" Width="155" AutoPostBack="True" OnSelectedIndexChanged="cboQuery_SelectedIndexChanged">
                        <asp:ListItem Value="">全部</asp:ListItem>
                        <asp:ListItem Value="QUERY_SHOW">仅查询字段</asp:ListItem>
                        <asp:ListItem Value="GRID_SHOW">仅显示字段</asp:ListItem>
                        <asp:ListItem Value="EDIT_SHOW">仅编辑字段</asp:ListItem>
                        <asp:ListItem Value="QT">其它</asp:ListItem>
                    </asp:DropDownList>

                    <asp:EButton runat="server" ID="EButton2" Text="顺序调整" Icon="arrow_switch" OnClientClick="FieldSeq();"
                        IsClient="true" />

                    <asp:EButton ID="btnRefresh" runat="server" Text="刷新" Visible="true"
                        OnClick="btnRefresh_Click" Icon="refresh" />

                </div>
                <div id="datagrid">
                    <asp:EGridView ID="gvData" runat="server" CssClass="grid" EnableSelect="true"
                        KeyField="GUID" CellPadding="0" CellSpacing="0" AllowSorting="false" EnableClickSelectRow="true"
                        Width="100%" Height="400px" FitWindow="true" Layout="70">
                        <Columns>
                            <asp:TemplateField HeaderText="元素代码" SortExpression="CODE">
                                <ItemTemplate>
                                    <a id="link" runat="server" data='<%#Eval("GUID") %>' onclick="OpenField(this)"><%#Eval("CODE") %></a>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="MAIN_ALIAS" HeaderText="显示名称" SortExpression="MAIN_ALIAS"
                                ItemStyle-Width="150px"></asp:BoundField>

                            <asp:BoundField DataField="QUERY_SEQ" HeaderText="查询顺序" SortExpression="QUERY_SEQ"
                                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px"></asp:BoundField>
                            <asp:BoundField DataField="GRID_SEQ" HeaderText="显示顺序" SortExpression="GRID_SEQ"
                                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px"></asp:BoundField>
                            <asp:BoundField DataField="EDIT_SEQ" HeaderText="编辑顺序" SortExpression="EDIT_SEQ"
                                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px"></asp:BoundField>
                            <asp:BoundField DataField="QUERY_SHOW" HeaderText="查询" SortExpression="QUERY_SHOW"
                                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px"></asp:BoundField>
                            <asp:BoundField DataField="GRID_SHOW" HeaderText="显示" SortExpression="GRID_SHOW"
                                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px"></asp:BoundField>
                            <asp:BoundField DataField="EDIT_SHOW" HeaderText="编辑" SortExpression="EDIT_SHOW"
                                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px"></asp:BoundField>
                            <asp:BoundField DataField="PRIMARY_KEY" HeaderText="主键" SortExpression="PRIMARY_KEY"
                                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="0px"></asp:BoundField>
                            <asp:BoundField DataField="WIDTH" HeaderText="宽度" SortExpression="WIDTH" ItemStyle-Width="50px"
                                ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                            <asp:BoundField DataField="PHYSICAL_TYPE" ItemStyle-HorizontalAlign="Center" HeaderText="数据库类型" SortExpression="PHYSICAL_TYPE"
                                HeaderStyle-Width="100"></asp:BoundField>
                            <asp:BoundField DataField="DICTIONARY_TYPE" ItemStyle-HorizontalAlign="Center" HeaderText="字典类型" SortExpression="DICTIONARY_TYPE"
                                HeaderStyle-Width="120px"></asp:BoundField>
                            <asp:BoundField DataField="FIELD_LENGTH" HeaderText="数据库长度" SortExpression="FIELD_LENGTH"
                                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120"></asp:BoundField>
                            <asp:BoundField DataField="LANG_CODE" HeaderText="语言编码"
                                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120"></asp:BoundField>
                        </Columns>
                    </asp:EGridView>
                </div>
            </asp:EPanel>

            <asp:EWindow runat="server" Icon="wrench" ID="divDeleteTable" Title="程序删除" Width="500px" Height="100px" EnableBackgroundColor="true">
                <div style='padding: 10px;'>
                    输入密码：<input type='password' id='password' name='password' class="text-input" />
                    <asp:EButton runat="server" Text="确认删除" IsClient="true" OnClientClick="return  deleteTableExecute();" Icon="delete" />
                </div>
            </asp:EWindow>
        </div>
    </form>
</body>
</html>
