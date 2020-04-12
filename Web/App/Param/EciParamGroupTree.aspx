<%@ page language="C#" autoeventwireup="true" inherits="App_Param_EciParamGroupTree, ECI.Web" enableviewstatemac="false" %>
 
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

        .e-panel-header {
            height: 24px;
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
                $("#txtSEQUENCE").val(seq)
            }
            else {
                $("#txtSEQUENCE").val(10);
            }

            eci.window("divEdit");
            $("#txtGroupName").focus();
        }

        function edit() {
            var node = $('#tt').tree('getSelected');
            var id = node.id;

            hasSaved = false;

            $(".function-edit").show();

            $("#txtFLAG").val("Edit");

            eci.post("GroupData.aspx", "LoadRecord", { id: id }, function (res) {

                if (res.success) {
                    $("#txtPARENTID").val(res.parentid);
                    $("#txtID").val(res.id);
                    $("#txtGroupName").val(res.group_name);
                    $("#txtGroupCode").val(res.group_code);
                    $("#txtMemo").val(res.memo);
                    $("#txtSeq").val(res.seq);
                    $("#txtSysCode").val(res.sys_code);

                    $("#btnAdd").show();

                    eci.window("divEdit");
                    $("#txtGroupName").focus();
                    $("#frameParamList").attr("src", "EciParamList.aspx?groupId=" + id);
                }
                else {
                    msg.ajax(res);
                }
            })
        }

        function load(id) {

            $(".function-edit").show();
            $("#frameParamList").attr("src", "EciParamList.aspx?groupId=" + id);

        }

        function menuRefresh() {
            var node = $('#tt').tree('getSelected');
            $('#tt').tree('reload', node.target);
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

        function save(functionId) {
            var data = {};
            data.GROUP_NAME = $("#txtGroupName").val();
            data.GROUP_CODE = $("#txtGroupCode").val();
            data.MEMO = $("#txtMemo").val();
            data.SEQ = $("#txtSeq").val();
            data.SYS_CODE = $("#txtSysCode").val();

            data.ID = $("#txtID").val();
            data.PARENTID = $("#txtPARENTID").val();

            data.FLAG = $("#txtFLAG").val();

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

                        $("#txtFLAG").val("Edit");

                        $("#tt").tree("getChildren", parentNode);
                        editNode = parentNode.children[parentNode.children.length - 1];
                        $('#tt').tree('select', editNode.target);
                    }
                    else {
                        editNode.text = data.GROUP_NAME;
                        $("#tt").tree("update", editNode);

                    }

                    $("#btnAdd").show();

                    msg.tip("保存成功");
                    eci.closewindow("divEdit");
                    $("#frameParamList").attr("src", "EciParamList.aspx?groupId=" + data.ID);
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

        function appendBrother() {
            var parentId = $("#txtPARENTID").val();
            var seq = parseFloat($("#txtSeq").val());

            if (isNaN(seq)) {
                seq = 0;
            }

            seq += 10;

            add(parentId);

            $("#txtSeq").val(seq)
        }

        function add(parentId) {
            var guid = eci.guid();
            $("#txtFLAG").val("Add");
            $("#txtID").val(guid);
            $("#txtGroupName").val("");
            $("#txtGroupCode").val("");
            $("#txtMemo").val("");
            $("#txtSeq").val("");
            $("#txtSysCode").val("");

            $("#txtPARENTID").val(parentId);

            $("#txtGroupName").focus();

            $("#btnAdd").hide();
        }


        $(function () {

            $(".function-edit").hide();

            $('#tt').tree({
                url: 'GroupData.aspx?type=load&dps=' + eci.guid(), method: 'get', loadFilter: myLoadFilter, lines: true, dnd: false, onContextMenu: function (e, node) {
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
                                <%-- <input type="checkbox" id="chkDrag" /><label for="chkDrag">拖动模式</label>--%>
                            </div>

                        </td>
                        <td class="function-edit" style="vertical-align: top;" rowspan="2">
                            <div style="padding: 1px 0px 0px 1px; margin: 0px; border-bottom: 1px solid #95B8E7; border-right: 1px solid #95B8E7; overflow-y: auto; vertical-align: top;">

                                <asp:EPanel runat="server" Title="参数信息" EnableToggle="false">

                                    <iframe id="frameParamList" class="fitH" layout="40" frameborder="no" style="border: 0px; width: 100%"></iframe>


                                </asp:EPanel>
                            </div>



                        </td>
                    </tr>

                    <tr style="height: 100%">
                        <td style="width: 300px; vertical-align: top;">
                            <div class="easyui-panel fitH" layout="48" style="padding: 5px; border-top: 0px;">
                                <ul id="tt"></ul>
                            </div>
                        </td>

                    </tr>

                </table>
            </div>
        </div>

        <asp:EWindow ID="divEdit" runat="server" Title="分组信息" EnableToggle="false" Height="400" Width="600" Icon="function">

            <div class="toolbar function-edit" style="border-left: 1px;">
                <input type="hidden" id="hidRootId" runat="server" />
                <input type="hidden" id="hidKey" runat="server" />

                <asp:EButton runat="server" Text="保存" ID="btnSave" Icon="save" IsClient="true"
                    OnClientClick="save()" />

                <asp:EButton runat="server" Text="关闭" ID="btnClose" Icon="close" IsClient="true"
                    OnClientClick="eci.closewindow(this)" />
            </div>


            <table class="grid" cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <th style="width: 140px"></th>
                    <th style="width: 100%"></th>
                </tr>
                <tr>
                    <td class="lbl">ID</td>
                    <td>
                        <asp:ETextBox runat="server" ID="txtID" Width="85%" ReadOnly="true"></asp:ETextBox>
                    </td>
                </tr>

                <tr>
                    <td class="lbl">名称</td>
                    <td>
                        <asp:ETextBox runat="server" ID="txtGroupName" Width="85%" NotNull="true"></asp:ETextBox></td>
                </tr>

                <tr style="display: none;">
                    <td class="lbl lbl-top">编码</td>
                    <td>
                        <asp:ETextBox runat="server" ID="txtGroupCode" Width="85%"></asp:ETextBox>
                    </td>
                </tr>

                <tr>
                    <td class="lbl">顺序</td>
                    <td>
                        <asp:ETextBox runat="server" ID="txtSeq" Width="85%" IsNum="true"></asp:ETextBox></td>


                </tr>


                <tr>
                    <td class="lbl">系统 </td>
                    <td>
                        <asp:ETextBox runat="server" ID="txtSysCode" Width="85%"></asp:ETextBox></td>
                </tr>


                <tr>
                    <td class="lbl lbl-top">描述</td>
                    <td>
                        <asp:ETextBox runat="server" ID="txtMemo" Width="85%" Rows="1"></asp:ETextBox></td>


                </tr>

            </table>

            <div style="display: none;">
                <asp:ETextBox runat="server" ID="txtPARENTID" Width="85%" ReadOnly="true"></asp:ETextBox>
                <asp:ETextBox runat="server" ID="txtFLAG" Width="85%" ReadOnly="true"></asp:ETextBox>
            </div>

        </asp:EWindow>


        <div class="hidden" id="divHidden">

            <div id="mm" class="easyui-menu" style="width: 120px;">
                <div onclick="menuRefresh()" data-options="iconCls:'icon-refresh'">刷新</div>

                <div class="menu-sep"></div>

                <div onclick="append()" data-options="iconCls:'icon-add'">添加下级分组</div>
                <div class="menu-sep"></div>
                <div onclick="edit()" data-options="iconCls:'icon-edit'">编辑分组</div>

                <div onclick="removeit()" data-options="iconCls:'icon-remove'">删 除</div>


            </div>
        </div>
    </form>
</body>
</html>
