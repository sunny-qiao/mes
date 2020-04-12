<%@ page language="C#" autoeventwireup="true" inherits="App_COMParam_EciParamGroupTree, ECI.Web" enableviewstatemac="false" %>

<%@ Register Src="~/App/ComParam/ascxEdit.ascx" TagPrefix="uc1" TagName="ascxEdit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>系统参数分组</title>
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
                $("#ascxEdit_txtSEQUENCE").val(seq)
            }
            else {
                $("#ascxEdit_txtSEQUENCE").val(10)
            }

            $("#frameParamList").attr("src", "");

        }

        function menuRefresh() {
            var node = $('#tt').tree('getSelected');
            $('#tt').tree('reload', node.target);
        }

        function resetSEQ() {
            var t = $('#tt');
            var node = t.tree('getSelected');
            var data = { functionId: node.id };
            debugger;

            eci.post("../Data/Data.ashx", "FunctionResetSEQ", data, function (res) {
                msg.ajax(res);

                if (res.success) {

                    menuRefresh();
                }
            })
        }

        function resetParentSEQ() {
            var functionId = $("#ascxEdit_txtPARENTID").val();

            var data = { functionId: functionId };

            eci.post("../Data/Data.ashx", "FunctionResetSEQ", data, function (res) {

                msg.ajax(res);

                if (res.success) {

                    menuRefresh();
                }
            })
        }

        function deleteIt() {

            var editId = $("#ascxEdit_txtID").val();

            if (editId == "") {
                msg.error("删除失败,没有选择要删除的节点");
                return;
            }

            var node = $('#tt').tree('getSelected');
            var id = node.id;
            deleteNode = node;

            if (id != editId) {
                msg.error("删除失败，请联系管理员!错误编码-E001");
                return;
            }

            msg.validate("此操作将删除分组下所有的子分组，是否确认删除？", function () {
                deleteAction();
            })
        }

        function removeit() {
            var node = $('#tt').tree('getSelected');

            if (node.attributes && node.attributes.root == "true") {
                msg.alert("不能删除根节点");
                return;
            }

            deleteNode = node;

            msg.validate("此操作将删除分组下所有的子分组，是否确认删除？", function () {
                deleteAction();
            })
        }

        function deleteAction() {
            eci.post("GroupData.aspx", "Delete", { id: deleteNode.id, validate: true }, function (res) {
                if (res.success) {

                    $('#tt').tree('remove', deleteNode.target);
                    msg.alert("删除成功");

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

        function load(id) {

            hasSaved = false;

            $(".function-edit").show();

            $("#ascxEdit_txtFLAG").val("Edit");

            eci.post("GroupData.aspx", "LoadRecord", { id: id }, function (res) {

                if (res.success) {
                    $("#ascxEdit_txtPARENTID").val(res.parentid);
                    $("#ascxEdit_txtID").val(res.id);
                    $("#ascxEdit_txtGroupName").val(res.group_name);
                    $("#ascxEdit_txtGroupCode").val(res.group_code);
                    $("#ascxEdit_txtMemo").val(res.memo);
                    $("#ascxEdit_txtSeq").val(res.seq);
                    $("#ascxEdit_txtSysCode").val(res.sys_code);
               

                    $("#btnDeleteIt").show();
                    $("#btnAdd").show();

                    $("#frameParamList").attr("src", "EciParamList.aspx?groupId=" + id);

                }
                else {
                    msg.ajax(res);
                }
            })
        }

        function save(functionId) {
            var data = {};
            data.GROUP_NAME = $("#ascxEdit_txtGroupName").val();
            data.GROUP_CODE = $("#ascxEdit_txtGroupCode").val();
            data.MEMO = $("#ascxEdit_txtMemo").val();
            data.SEQ = $("#ascxEdit_txtSeq").val();
            data.SYS_CODE = $("#ascxEdit_txtSysCode").val();

            data.ID = $("#ascxEdit_txtID").val();
            data.PARENTID = $("#ascxEdit_txtPARENTID").val();

            data.FLAG = $("#ascxEdit_txtFLAG").val();

            if (data.ID == "" && !data.PARENTID) {
                msg.warning("保存异常,没有选择上级节点");
                return;
            }

            var check = $.eciform.validate();

            if (!check) return false;

            eci.post("GroupData.aspx", "Save", data, function (res) {

                if (res.success) {

                    if (data.FLAG == "Add") {
                        var t = $('#tt');

                        var id = data.ID;
                        var text = data.GROUP_NAME;

                        t.tree('append', {
                            parent: (parentNode ? parentNode.target : null),
                            data: [{
                                id: id,
                                text: text

                            }]
                        });

                        $("#ascxEdit_txtFLAG").val("Edit");

                        $("#tt").tree("getChildren", parentNode);
                        editNode = parentNode.children[parentNode.children.length - 1];
                        $('#tt').tree('select', editNode.target);
                    }
                    else {
                        editNode.text = data.GROUP_NAME;
                        $("#tt").tree("update", editNode);
                    }

                    $("#btnDeleteIt").show();
                    $("#btnAdd").show();

                    msg.alert("保存成功");

                    if (data.FLAG == "Add") {
                        $("#frameParamList").attr("src", "EciParamList.aspx?groupId=" + data.ID);
                    }

                }
                else {
                    msg.ajax(res);
                }
            })
        }

        var hasSaved = false;

        function saved() {
            hasSaved = true;
        }

        function search() {
            if (hasSaved) {
                var url = $("#frameParamList").attr("src");

                $("#frameParamList").attr("src", url);
            }
        }


        function add(parentId) {
            var guid = eci.guid();
            $("#ascxEdit_txtFLAG").val("Add");
            $("#ascxEdit_txtID").val(guid);
            $("#ascxEdit_txtGroupName").val("");
            $("#ascxEdit_txtGroupCode").val("");
            $("#ascxEdit_txtMemo").val("");
            $("#ascxEdit_txtSeq").val("");
            $("#ascxEdit_txtSysCode").val("");

            $("#ascxEdit_txtPARENTID").val(parentId);

            $("#ascxEdit_txtGroupName").focus();

            $("#btnDeleteIt").hide();
            $("#btnAdd").hide();
        }


        $(function () {

            $(".function-edit").hide();

            $('#tt').tree({
                url: 'GroupData.aspx?manage=true&type=load&dps=' + eci.guid(), method: 'get', loadFilter: myLoadFilter, lines: true, dnd: false, onContextMenu: function (e, node) {
                    e.preventDefault();

                    var id = node.id;
                    editNode = node;
                    load(id);

                    $(this).tree('select', node.target);
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

                onContextMenu: function (e, node) {
                    e.preventDefault();
                    $('#tt').tree('select', node.target);

                    if (copyId) {
                        $("#paste").show();
                    }
                    else {

                        $("#paste").hide();
                    }
                    e.preventDefault();
                    $('#mm').menu('show', {
                        left: e.pageX,
                        top: e.pageY
                    });

                    return true;
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
            });

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

        function exportAction(obj) {
            var t = $('#tt');
            var node = t.tree('getSelected');
            parentNode = node;

            var id = node.id;

            if (id == "") {
                msg.error("导出失败,没有选择要导出的节点");
                return;
            }

            var url = "download.aspx?id=" + id;

            eci.open(url, { width: 640, height: 280 });
        }

        function importAction(obj) {
            var t = $('#tt');
            var node = t.tree('getSelected');
            parentNode = node;

            var id = node.id;

            if (id == "") {
                msg.error("导入失败,没有选择要导入的上级节点");
                return;
            }

            var url = "ImportFromXml.aspx?id=" + id;

            eci.dialog("导入", url, { width: 640, height: 400, icon: "function" });
        }

        function importOK(message) {
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

        function menuRefresh() {
            var node = $('#tt').tree('getSelected');
            $('#tt').tree('reload', node.target);
        }

    </script>

    <form id="form1" runat="server">
        <div id="root">
            <div class="workarea">
                <table style="height: 100%; width: 100%;" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <div class="toolbar">
                                <asp:EButton runat="server" Text="全部展开" Width="90" ID="btnExpandAll" Icon="application_put" IsClient="true" OnClientClick="expandAll()" />
                                <asp:EButton runat="server" Text="全部折叠" Width="90" ID="btnCollapseAll" Icon="application_osx_get" IsClient="true" OnClientClick="collapseAll()" />

                            </div>

                        </td>
                        <td>
                            <div class="toolbar function-edit" style="border-left: 1px;">
                                <input type="hidden" id="hidRootId" runat="server" />
                                <input type="hidden" id="hidKey" runat="server" />

                                <asp:EButton runat="server" Text="添加下级分组" ID="btnAdd" Icon="add" IsClient="true"
                                    OnClientClick="append()" /><asp:EButton runat="server" Text="保存" ID="btnSave" Icon="save" IsClient="true" OnClientClick="save()" /><asp:EButton runat="server" Text="删除" ID="btnDeleteIt" Icon="delete" IsClient="true"
                                        OnClientClick="deleteIt()" />
                            </div>
                        </td>
                    </tr>

                    <tr style="height: 100%">
                        <td style="width: 300px; vertical-align: top;">
                            <div class="easyui-panel fitH" layout="48" style="padding: 5px; border-top: 0px;">
                                <ul id="tt"></ul>
                            </div>
                        </td>
                        <td class="function-edit" style="vertical-align: top;">
                            <div style="padding: 1px 0px 0px 1px; margin: 0px; border-bottom: 1px solid #95B8E7; border-right: 1px solid #95B8E7; overflow-y: auto; vertical-align: top;">

                                <asp:EPanel ID="divEdit" runat="server" Title="分组信息" EnableToggle="false" Icon="function">
                                    <uc1:ascxEdit runat="server" ID="ascxEdit" />
                                </asp:EPanel>

                                <div style="margin: 2px;"></div>

                                <asp:EPanel runat="server" Title="参数信息" EnableToggle="false" Icon="function">

                                    <iframe id="frameParamList" class="fitH" layout="divEdit,160" frameborder="no" style="border: 0px; width: 100%"></iframe>

                                </asp:EPanel>
                            </div>

                        </td>
                    </tr>

                </table>
            </div>
        </div>
        <div class="hidden" id="divHidden">

            <div id="mm" class="easyui-menu" style="width: 120px;">
                <div onclick="menuRefresh()" data-options="iconCls:'icon-refresh'">刷新</div>

                <div class="menu-sep"></div>
                <div onclick="append()" data-options="iconCls:'icon-add'">添加下级分组</div>
                <div onclick="removeit()" data-options="iconCls:'icon-remove'">删 除</div>
                <div class="menu-sep"></div>
                <div onclick="exportAction()" data-options="iconCls:'icon'">导出XML</div>
                <div onclick="importAction()" data-options="iconCls:'icon'">导入XML</div>


                <div class="menu-sep"></div>
                <div onclick="resetSEQ()">重置顺序</div>

            </div>
        </div>
    </form>
</body>
</html>
