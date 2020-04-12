<%@ page language="C#" autoeventwireup="true" inherits="App_BasicEdit_DictionaryEdit, ECI.Web" validaterequest="false" enableviewstatemac="false" %>

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

        function TableTabItem() {
            var tableGUID = GetGUID();
            if (!tableGUID) return false;
            url = "../../App/Basic/EciTableTabItemEdit.aspx?TABLE_GUID=" + tableGUID;
            eci.dialog("控件扩展", url);
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
                var url = "../../App/Core/Edit.aspx?p=" + p;
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
            var guid = $(obj).getKey();
            var url = "../../App/BasicEdit/DictionaryFieldEdit.aspx?guid=" + guid;
            eci.dialog("数据项", url, { width: 600 });
        }

        function AddField() {
            var tableGuid = $("#hidTableGUID").val();
            var url = "../../App/BasicEdit/DictionaryFieldEdit.aspx?TableGuid=" + tableGuid;
            eci.dialog("数据项", url, { width: 600 });
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
            eci.post("../Basic/Data/data.ashx", "Publish", {}, function (response) {
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




        <div id="toolbar" class="toolbar">


            <asp:EButton ID="btnSave" runat="server" Text="保存(S)" AccessKey="s"
                OnClick="btnSave_Click" OnClientClick="return Save();" NeedCheck="true" Icon="save" />
            <asp:EButton ID="btnNew" runat="server" Text="新增" IsClient="true"
                OnClientClick="NewTable();" Icon="Add" />
            <asp:EButton ID="btnPreview" IsClient="true" runat="server" Width="91px" Text="预览(P)"
                AccessKey="p" OnClientClick="preview();" Icon="eye" />
            <asp:EButton ID="btnDeleteTop" runat="server" Text="删除" IsClient="true" Icon="delete"
                OnClientClick="deleteTable();" />
            <asp:EButton ID="btnPublish" runat="server" Text="发布" OnClientClick="publish();" Icon="world" IsClient="true" />

            <asp:EButton ID="btnCreateSQL" runat="server" Text="生成脚本" ToolTip="导出文件在App_Data/UI_SQL目录中" Icon="world" OnClick="btnCreateSQL_Click" />

            <asp:EButton ID="btnClose" runat="server" Icon="close" IsClient="true" OnClientClick="eci.close({confirm:false})" Text="关闭" />
        </div>


        <div>

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
                    <td class="lbl">数据表名</td>
                    <td class="txt">
                        <asp:ETextBox ID="txtFName" runat="server" AutoUpper="true" DataField="TABLE_NAME" ImeDisabled="true" NotNull="true" Width="90%"></asp:ETextBox>
                    </td>
                </tr>

                <tr>
                    <td class="lbl">显示列数
                    </td>
                    <td class="txt">
                        <asp:EDropDownList ID="cboColumnCount" runat="server" DataField="COLUMN_COUNT" NotNull="true" Width="90%">
                            <asp:ListItem Text="1"></asp:ListItem>
                            <asp:ListItem Text="2"></asp:ListItem>
                            <asp:ListItem Selected="True" Text="3"></asp:ListItem>
                            <asp:ListItem Text="4"></asp:ListItem>
                        </asp:EDropDownList>
                    </td>
                    <td class="lbl">名称</td>
                    <td class="txt">
                        <asp:ETextBox ID="txtFMainAlias" runat="server" DataField="MAIN_ALIAS" NotNull="true" Width="90%"></asp:ETextBox>
                    </td>
                </tr>

                <tr>
                    <td class="lbl">公司代码</td>
                    <td class="txt">
                            <asp:ETextBox ID="txtCompanyCode" runat="server" AutoUpper="true" DataField="COMPANY_CODE" ImeDisabled="true"   Width="90%"></asp:ETextBox>
                        </td>
                    <td class="lbl">配置类型</td>
                    <td class="txt">
                        <asp:EDropDownList ID="ddlTYPE" runat="server" DataField="TYPE" ReadOnly="true" Width="85%">
                            <asp:ListItem Value=""></asp:ListItem>
                            <asp:ListItem>正式配置</asp:ListItem>
                            <asp:ListItem Selected="True">企业配置</asp:ListItem>
                        </asp:EDropDownList>
                    </td>
                </tr>

            </table>

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

                    <asp:EButton runat="server" ID="btnRefresh" Text="刷新" Icon="refresh" OnClick="btnRefresh_Click" Visible="true" />

                </div>
                <div id="datagrid">
                    <asp:EGridView ID="gvData" runat="server" CssClass="grid" EnableSelect="true"
                        KeyField="GUID" CellPadding="0" CellSpacing="0" AllowSorting="false" EnableClickSelectRow="true"
                        Width="100%" Height="400px" FitWindow="true" Layout="190" OnClick="OpenField">
                        <Columns>
                            <asp:TemplateField HeaderText="元素代码" SortExpression="CODE">
                                <ItemTemplate>
                                    <a id="link" runat="server" data='<%#Eval("GUID") %>' onclick="OpenField(this)"><%#Eval("CODE") %></a>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="MAIN_ALIAS" HeaderText="显示名称" SortExpression="MAIN_ALIAS"
                                ItemStyle-Width="150px"></asp:BoundField>


                            <asp:BoundField DataField="EDIT_SEQ" HeaderText="编辑顺序" SortExpression="EDIT_SEQ"
                                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px"></asp:BoundField>


                            <asp:BoundField DataField="EDIT_SHOW" HeaderText="编辑" SortExpression="EDIT_SHOW"
                                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px"></asp:BoundField>

                            <asp:BoundField DataField="WIDTH" HeaderText="宽度" SortExpression="WIDTH" ItemStyle-Width="50px"
                                ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                            <asp:BoundField DataField="PHYSICAL_TYPE" ItemStyle-HorizontalAlign="Center" HeaderText="数据库类型" SortExpression="PHYSICAL_TYPE"
                                HeaderStyle-Width="100"></asp:BoundField>
                            <asp:BoundField DataField="DICTIONARY_TYPE" ItemStyle-HorizontalAlign="Center" HeaderText="字典类型" SortExpression="DICTIONARY_TYPE"
                                HeaderStyle-Width="120px"></asp:BoundField>


                        </Columns>
                    </asp:EGridView>
                </div>
            </asp:EPanel>

        </div>

        <asp:EWindow runat="server" Icon="wrench" ID="divDeleteTable" Title="程序删除" Width="500px" Height="100px" EnableBackgroundColor="true">
            <div style='padding: 10px;'>
                输入密码：<input type='password' id='password' name='password' class="text-input" />
                <asp:EButton runat="server" Text="确认删除" IsClient="true" OnClientClick="return  deleteTableExecute();" Icon="delete" />
            </div>
        </asp:EWindow>

    </form>
</body>
</html>
