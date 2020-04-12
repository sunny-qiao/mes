<%@ page language="C#" autoeventwireup="true" inherits="AppSSO_SSO_FunctionTree, ECI.SSO.Web" enableviewstatemac="false" %>

<%@ Register Src="~/ECI_SSO/System/ascxFunction.ascx" TagPrefix="uc1" TagName="ascxFunction" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>组织机构</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />

    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <link href="../../EasyUI/themes/default/easyui.css" rel="stylesheet" />
    <link href="../../EasyUI/themes/icon.css" rel="stylesheet" />
    <script src="../../EasyUI/jquery.easyui.min.js" type="text/javascript"></script>


    <style type="text/css">
        #mm div {
        }

        .tree-folder {
            background: url('../../Icon/plugin.png') no-repeat;
        }

        .tree-folder-open {
            background: url('../../Icon/plugin.png') no-repeat;
        }

        .tree-file {
            background: url('../../Icon/plugin.png') no-repeat;
        }
    </style>


</head>
<body>
    <script type="text/javascript">
        var parentNode;
        var editNode;
        var deleteNode;
        var copyId = "";

        function myLoadFilter(data, parent) {
            var state = $.data(this, 'tree');

            function setData() {
                var serno = 1;
                var todo = [];
                for (var i = 0; i < data.length; i++) {
                    todo.push(data[i]);
                }
                while (todo.length) {
                    var node = todo.shift();
                    if (node.id == undefined) {
                        node.id = '_node_' + (serno++);
                    }
                    if (node.children) {
                        node.state = 'closed';
                        node.children1 = node.children;
                        node.children = undefined;
                        todo = todo.concat(node.children1);
                    }
                }
                state.tdata = data;
            }

            function find(id) {
                var data = state.tdata;
                var cc = [data];
                while (cc.length) {
                    var c = cc.shift();
                    for (var i = 0; i < c.length; i++) {
                        var node = c[i];
                        if (node.id == id) {
                            return node;
                        } else if (node.children1) {
                            cc.push(node.children1);
                        }
                    }
                }
                return null;
            }

            setData();

            var t = $(this);
            var opts = t.tree('options');
            opts.onBeforeExpand = function (node) {
                var n = find(node.id);

                if (n == null) return;

                if (n.children && n.children.length) { return }
                if (n.children1) {
                    var filter = opts.loadFilter;
                    opts.loadFilter = function (data) { return data; };
                    t.tree('append', {
                        parent: node.target,
                        data: n.children1
                    });
                    opts.loadFilter = filter;
                    n.children = n.children1;
                }
            };
            return data;
        }
    </script>

    <script type="text/javascript">


        function exportToXml() {
            var t = $('#tt');
            var node = t.tree('getSelected');
            var id = node.id;

            var url = "ExportXml.aspx?id=" + id;

            eci.open(url, { width: 640, height: 400 })
        }

        function importFromXml() {
            var t = $('#tt');
            var node = t.tree('getSelected');
            var id = node.id;

            importNode = node;

            var url = "ImportFromXml.aspx?functionId=" + id;

            eci.dialog(ssoLang.M00016, url, { width: 640, height: 350 })
        }

        function importSucces(message) {

            msg.alert(message);

            var t = $('#tt');
            var node = $('#tt').tree('getSelected');
            t.tree('append', {
                parent: (node.target),
                data: [{
                    id: "",
                    text: "temp"
                }]
            });

            menuRefresh();
        }



        function append() {
            var t = $('#tt');
            var node = t.tree('getSelected');
            parentNode = node;

            $(".function-edit").show();

            add(node.id);

            //如果没有展开,则展开
            var domId = node.domId;
            var length = $("#" + domId).parent().find("ul").length;
            if (length == 0 && node.state == "closed") {
                $('#tt').tree('reload', node.target);
            }
            else {
                $('#tt').tree('expand', node.target);
            }

            if (parentNode.children) {
                var seq = parentNode.children.length * 10;
                seq += 10;
                $("#ascxFunction_txtSEQUENCE").val(seq)
            }
            else {
                $("#ascxFunction_txtSEQUENCE").val(10)
            }

        }

        function menuRefresh() {
            var node = $('#tt').tree('getSelected');
            $('#tt').tree('reload', node.target);
        }

        function menuCopy() {
            var t = $('#tt');
            var node = t.tree('getSelected');
            copyId = node.id;

            msg.tip(ssoLang.M00017+"【" + node.text + "】");
        }

        var pasteNode;

        function menuPaste() {
            var t = $('#tt');
            var node = t.tree('getSelected');
            pasteNode = node;

            var data = {};
            data.parentId = node.id;
            data.copyId = copyId;

            eci.post("../Data/Data.ashx", "CopyFunction", data, function (res) {
                msg.ajax(res);

                if (res.success) {

                    t.tree('append', {
                        parent: (pasteNode ? pasteNode.target : null),
                        data: [{
                            id: "",
                            text: "temp"

                        }]
                    });

                    menuRefresh();
                }
            })

            copyId = "";
        }

        function resetCODE() {
            var t = $('#tt');
            var node = t.tree('getSelected');
            var data = { functionId: node.id };
            data.validate = true;

            msg.validate("<spanclass='notnull'>" + ssoLang.M00018 + "<span>", function () {
                  eci.post("../Data/Data.ashx", "FunctionResetCODE", data, function (res) {
                    msg.ajax(res);

                })

            });

        }


        function resetSEQ() {
            var t = $('#tt');
            var node = t.tree('getSelected');
            var data = { functionId: node.id };


            eci.post("../Data/Data.ashx", "FunctionResetSEQ", data, function (res) {
                msg.ajax(res);

                if (res.success) {

                    menuRefresh();
                }
            })
        }

        function resetParentSEQ() {
            var functionId = $("#ascxFunction_txtPARENTID").val();

            var data = { functionId: functionId };

            eci.post("../Data/Data.ashx", "FunctionResetSEQ", data, function (res) {

                msg.ajax(res);

                if (res.success) {

                    menuRefresh();
                }
            })
        }

        function deleteIt() {

            var functionId = $("#ascxFunction_txtFUNCTIONID").val();

            if (functionId == "") {
                msg.error(ssoLang.M00019);
                return;
            }

            var node = $('#tt').tree('getSelected');
            var id = node.id;
            deleteNode = node;

            if (id != functionId) {
                msg.error(ssoLang.M00020);
                return;
            }

            msg.validate(ssoLang.M00021, function () {
                deleteAction();
            })
        }

        function removeit() {
            var node = $('#tt').tree('getSelected');

            if (node.attributes && node.attributes.root == "true") {
                msg.alert(ssoLang.M00022);
                return;
            }

            deleteNode = node;

            msg.validate(ssoLang.M00021, function () {
                deleteAction();
            })
        }

        function deleteAction() {
            eci.postme("Delete", { functionId: deleteNode.id, validate: true }, function (res) {
                if (res.success) {

                    $('#tt').tree('remove', deleteNode.target);
                    msg.alert(ssoLang.M00023);

                    eci.closewindow("divDelete");

                    $(".function-edit").hide();
                }
                else {

                    msg.ajax(res);

                    $("#txtValidateCode").val("").focus();
                }

            });

        }



        function collapseAll() {
            $('#tt').tree('collapseAll');
        }
        function expandAll() {
            $('#tt').tree('expandAll');
        }

        function load(functionId) {

            $(".function-edit").show();

            $("#ascxFunction_txtFLAG").val("Edit");

            eci.postme("LoadRecord", { functionId: functionId }, function (res) {

                if (res.success) {
                    $("#ascxFunction_txtPARENTID").val(res.parentid);
                    $("#ascxFunction_txtFUNCTIONID").val(res.functionid);
                    $("#ascxFunction_txtNAME").val(res.name);
                    $("#ascxFunction_txtCODE").val(res.code);
                    $("#ascxFunction_txtURL").val(res.url);
                    $("#ascxFunction_txtIMAGEFILE").val(res.imagefile);
                    $("#ascxFunction_txtDESCRIPTION").val(res.description);
                    $("#ascxFunction_txtSEQUENCE").val(res.sequence);
                    $("#ascxFunction_txtCreateTime").val(res.createtime);
                    $("#ascxFunction_chkSHOWINMENU")[0].checked = res.showinmenu == "1"
                    $("#ascxFunction_btnAssignToRole").show();
                    $("#ascxFunction_btnAppSetFunction").show();
                    $("#ascxFunction_btnResetSEQ").show();
                    $("#btnDeleteIt").show();
                    $("#btnExportToXml").show();
                    $("#btnImportFromXml").show();
                    $("#btnAdd").show();
                    $("#btnAddBrother").show();
                }
                else {
                    msg.ajax(res);
                }
            })
        }

        function appendBrother() {
            var parentId = $("#ascxFunction_txtPARENTID").val();
            var seq = parseFloat($("#ascxFunction_txtSEQUENCE").val());

            if (isNaN(seq)) {
                seq = 0;
            }

            seq += 10;

            add(parentId);

            $("#ascxFunction_txtSEQUENCE").val(seq)
        }

        function add(parentId) {
            var guid = eci.guid();
            $("#ascxFunction_txtFLAG").val("Add");
            $("#ascxFunction_txtFUNCTIONID").val(guid);
            $("#ascxFunction_txtNAME").val("");
            $("#ascxFunction_txtCODE").val(guid);
            $("#ascxFunction_txtURL").val("");
            $("#ascxFunction_txtIMAGEFILE").val("");
            $("#ascxFunction_txtDESCRIPTION").val("");
            $("#ascxFunction_txtSEQUENCE").val("0");
            $("#ascxFunction_chkSHOWINMENU")[0].checked = true;
            $("#ascxFunction_txtCreateTime").val("");

            $("#ascxFunction_txtPARENTID").val(parentId);

            $("#ascxFunction_txtNAME").focus();

            $("#ascxFunction_btnAssignToRole").hide();
            $("#ascxFunction_btnAppSetFunction").hide();
            $("#ascxFunction_btnResetSEQ").hide();
            $("#btnDeleteIt").hide();
            $("#btnExportToXml").hide();
            $("#btnImportFromXml").hide();
            $("#btnAdd").hide();
            $("#btnAddBrother").hide();

        }

        function save(functionId) {
            var data = {};
            data.NAME = $("#ascxFunction_txtNAME").val();
            data.CODE = $("#ascxFunction_txtCODE").val();
            data.URL = $("#ascxFunction_txtURL").val();
            data.SEQUENCE = $("#ascxFunction_txtSEQUENCE").val();
            data.IMAGEFILE = $("#ascxFunction_txtIMAGEFILE").val();
            data.DESCRIPTION = $("#ascxFunction_txtDESCRIPTION").val();
            data.SHOWINMENU = $("#ascxFunction_chkSHOWINMENU")[0].checked ? "1" : "0";
            data.PARENTID = $("#ascxFunction_txtPARENTID").val();
            data.FUNCTIONID = $("#ascxFunction_txtFUNCTIONID").val();
            data.FLAG = $("#ascxFunction_txtFLAG").val();

            if (data.FUNCTIONID == "" && !data.PARENTID) {
                msg.warning(ssoLang.M00024);
                return;
            }

            var check = $.eciform.validate();

            if (!check) return false;

            eci.postme("Save", data, function (res) {

                if (res.createtime) {
                    $("#ascxFunction_txtCreateTime").val(res.createtime);
                }

                if (res.success) {

                    if (data.FLAG == "Add") {
                        var t = $('#tt');

                        var id = data.FUNCTIONID;
                        var text = data.NAME;

                        t.tree('append', {
                            parent: (parentNode ? parentNode.target : null),
                            data: [{
                                id: id,
                                text: text

                            }]
                        });

                        $("#ascxFunction_txtFLAG").val("Edit");

                        $("#tt").tree("getChildren", parentNode);
                        editNode = parentNode.children[parentNode.children.length - 1];
                        $('#tt').tree('select', editNode.target);
                    }
                    else {
                        editNode.text = data.NAME;
                        $("#tt").tree("update", editNode);
                    }

                    $("#ascxFunction_btnAssignToRole").show();
                    $("#ascxFunction_btnAppSetFunction").show();
                    $("#ascxFunction_btnResetSEQ").show();
                    $("#btnDeleteIt").show();
                    $("#btnExportToXml").show();
                    $("#btnImportFromXml").show();
                    $("#btnAdd").show();
                    $("#btnAddBrother").show();
 
                    msg.alert(ssoLang.M00025);
                }
                else {
                    msg.ajax(res);
                }
            })
        }

        $(function () {

            $(".function-edit").hide();

            $("#txtValidateCode").keydown(function (e) {
                var key = e.which;
                if (key == 13) {

                    $("#btnDelete").focus();
                    $("#btnDelete")[0].click();
                }
            });

            var url = 'FunctionTreeData.aspx?type=load';
            var topId = $("#hidTopId").val();
            if (topId.length > 0) {
                url += "&topId=" + topId;
            }

            url += '&dps=' + eci.guid();

            var options = {
                url: url, method: 'get', loadFilter: myLoadFilter, lines: true, dnd: true, onContextMenu: function (e, node) {
                    e.preventDefault();

                    var id = node.id;
                    editNode = node;
                    load(id);

                    $(this).tree('select', node.target);

                    $('#tt').tree('select', node.target);

                    if (copyId) {
                        $("#paste").show();
                    }
                    else {

                        $("#paste").hide();
                    }

                    var action = $("#hidAction").val();
  
                    if (action == "view") {
                        return false;
                    }
   
                    $('#mm').menu('show', {
                        left: e.pageX,
                        top: e.pageY
                    });
                },

                onClick: function (node) {
                    var id = node.id;
                    editNode = node;
                    load(id);
                },
 
                onBeforeDrop: function (targetNode, source, point) {

                    var allowDrag = $("#chkDrag")[0].checked;

                    if (!allowDrag) { return false; }

                    var targetId = $("#tt").tree('getNode', targetNode).id;

                    var rootId = $("#hidRootId").val();

                    if (targetId == rootId) {
                        return false;
                    }
                }


                , onDrop: function (targetNode, source, point) {
                    var targetId = $("#tt").tree('getNode', targetNode).id;

                    $.ajax({
                        url: 'FunctionTreeData.aspx?type=move',
                        type: 'post',
                        dataType: 'json',
                        data: {
                            id: source.id,
                            targetId: targetId,
                            point: point
                        }
                    });
                }
            }
 
            $('#tt').tree(options);

        });


       

        function refreshImage() {

            validateImage("checkimag");

            $("#txtValidateCode").val("").focus();
        }

        $(function () {
            $("#divHidden").show();

            layout();

            setTimeout(expandAll, 400);
        });


        function assignAction(obj) {

            var mode = $("#ascxFunction_txtFLAG").val();

            if (mode == "Add") {
                return false;
            }

            var functionId = $("#ascxFunction_txtFUNCTIONID").val();

            if (functionId) {

                var url = "FunctionRole.aspx?functionId=" + functionId + "&dsp=" + eci.guid();
                eci.open(url, { width: 1000 });
            }
            else {
                msg.warning(ssoLang.M00026);
            }
        }


        function appSetFunctionAction(obj) {

            var mode = $("#ascxFunction_txtFLAG").val();

            if (mode == "Add") {
                return false;
            }

            var functionId = $("#ascxFunction_txtFUNCTIONID").val();

            var url = "../System/FunctionSelector.aspx?entitytype=T&entityid=" + functionId + "&dsp=" + eci.guid();
            eci.open(url, { width: 750 });
        }

        function rebuild() {
            msg.closetip();
            eci.postme("FunctionGenerateIndex");
        }

    </script>

    <form id="form1" runat="server">

        <asp:HiddenField runat="server" ID="hidTopId" />
         <asp:HiddenField runat="server" ID="hidAction" />


        <div id="root">
            <div class="workarea">
                <table style="height: 100%; width: 100%;" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <div class="toolbar">
                                <asp:EButton runat="server" Text="全部展开" Width="90" ID="btnExpandAll" LangCode="EXPAND_ALL" Icon="application_put" IsClient="true" OnClientClick="expandAll()" />
                                <asp:EButton runat="server" Text="全部折叠" Width="90" ID="btnCollapseAll" LangCode="COLLAPSE_ALL" Icon="application_osx_get" IsClient="true" OnClientClick="collapseAll()" />
                                <asp:EButton runat="server" Text="重建索引" Width="90" ID="btnReBuild" LangCode="REBUILD_INDEX" Icon="application_osx_get" IsClient="true" OnClientClick="rebuild()" />
                                <input type="checkbox" id="chkDrag" runat="server"  /><label for="chkDrag"><asp:ELabel runat="server" id="lblDragMode" LangCode="DRAG_MODE">拖动模式</asp:ELabel></label>
                            </div>

                        </td>
                        <td>
                            <div class="toolbar function-edit" style="border-left: 1px;">
                                <input type="hidden" id="hidRootId" runat="server" />
                                <input type="hidden" id="hidKey" runat="server" />

                                <asp:EButton runat="server" Text="添加下级功能" ID="btnAdd" LangCode="ADD_LOWER_FUNCTION" Icon="add" IsClient="true"
                                    OnClientClick="append()" /><asp:EButton runat="server" Text="添加同级功能" LangCode="ADD_SAME_LEVEL_FUNCTION" ID="btnAddBrother" Icon="add" IsClient="true"
                                        OnClientClick="appendBrother()" /><asp:EButton runat="server" Text="保存" LangCode="CMD_SAVE" ID="btnSave" Icon="save" IsClient="true" OnClientClick="save()" /><asp:EButton runat="server" Text="删除" LangCode="CMD_DELETE" ID="btnDeleteIt" Icon="delete" IsClient="true"
                                            OnClientClick="deleteIt()" /><asp:EButton runat="server" Text="导出XML" LangCode="CMD_EXPORT_XML" ID="btnExportToXml" Icon="disk" IsClient="true"
                                                OnClientClick="exportToXml()" /><asp:EButton runat="server" Text="从XML导入" LangCode="CMD_IMPORT_XML" ID="btnImportFromXml" Icon="tick" IsClient="true"
                                                    OnClientClick="importFromXml()" />
                            </div>
                        </td>
                    </tr>

                    <tr style="height: 100%">
                        <td style="width: 380px; vertical-align: top;">
                            <div class="easyui-panel fitH" layout="48" style="padding: 5px; border-top: 0px;">
                                <ul id="tt"></ul>
                            </div>
                        </td>
                        <td class="function-edit">
                            <div class="fitH" layout="50" style="padding: 5px; border-bottom: 1px solid #95B8E7; border-right: 1px solid #95B8E7; overflow-y: auto;">
                                <uc1:ascxFunction runat="server" ID="ascxFunction" />
                            </div>
                        </td>
                    </tr>

                </table>
            </div>
        </div>
        <div class="hidden" id="divHidden">

            <div id="mm" class="easyui-menu" style="width: 120px;">
                <div onclick="menuRefresh()" data-options="iconCls:'icon-refresh'"><asp:ELabel runat="server" LangCode="CMD_REFRESH">刷新</asp:ELabel></div>
                <div class="menu-sep"></div>
                <div onclick="menuCopy()" data-options="iconCls:'icon-refresh'"><asp:ELabel runat="server" LangCode="CMD_COPY">复制</asp:ELabel></div>
                <div id="paste" onclick="menuPaste()" data-options="iconCls:'icon-refresh'"><asp:ELabel runat="server" LangCode="CMD_PASTE">粘贴</asp:ELabel></div>
                <div class="menu-sep"></div>
                <div onclick="append()" data-options="iconCls:'icon-add'"><asp:ELabel runat="server" LangCode="ADD_LOWER_FUNCTION">添加下级功能</asp:ELabel></div>
                <div onclick="removeit()" data-options="iconCls:'icon-remove'"><asp:ELabel runat="server" LangCode="CMD_DELETE">删 除</asp:ELabel></div>
                <div class="menu-sep"></div>
                <div onclick="exportToXml()"><asp:ELabel runat="server" LangCode="CMD_EXPORT_XML">导出至XML</asp:ELabel></div>
                <div onclick="importFromXml()"><asp:ELabel runat="server" LangCode="CMD_IMPORT_XML">从XML导入</asp:ELabel></div>

                <div class="menu-sep"></div>
                <div onclick="resetSEQ()"><asp:ELabel runat="server" LangCode="RESET_SEQ">重置顺序</asp:ELabel></div>  
                <div class="menu-sep"></div>
                <div onclick="resetCODE()"><asp:ELabel runat="server" LangCode="RESET_CODE">重置编码</asp:ELabel></div>


            </div>
        </div>
    </form>
</body>
</html>
