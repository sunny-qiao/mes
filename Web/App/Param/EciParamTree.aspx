<%@ page language="C#" autoeventwireup="true" inherits="App_Param_EciParamTree, ECI.Web" enableviewstatemac="false" %>


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
            height: 25px;
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

        function menuRefresh() {
            var node = $('#tt').tree('getSelected');
            $('#tt').tree('reload', node.target);
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

            $("#ascxFunction_txtFLAG").val("Edit");

            eci.post("GroupData.aspx", "LoadRecord", { id: id }, function (res) {

                if (res.success) {
                    $("#ascxFunction_txtPARENTID").val(res.parentid);
                    $("#ascxFunction_txtID").val(res.id);
                    $("#ascxFunction_txtGroupName").val(res.group_name);
                    $("#ascxFunction_txtGroupCode").val(res.group_code);
                    $("#ascxFunction_txtMemo").val(res.memo);
                    $("#ascxFunction_txtSeq").val(res.seq);

                    $("#btnDeleteIt").show();
                    $("#btnAdd").show();
                    $("#btnAddBrother").show();


                    var instanceId = $("#hidInstanceId").val();

                    var url = "EciParamInstance.aspx?groupId=" + id;

                    if (instanceId) {
                        url += "&InstanceId=" + instanceId;
                    }
 
                    $("#frameParamList").attr("src", url);

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

            var sysCode = $("#hidSysCode").val();

            var url = 'GroupData.aspx?type=load&dps=' + eci.guid();
            if (sysCode) {
                url += "&SysCode=" + sysCode;
            }
  
            $('#tt').tree({
                url: url, method: 'get', loadFilter: myLoadFilter, lines: true, dnd: false, onContextMenu: function (e, node) {
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

        $(function () {
            $("#divHidden").show();

            layout();

            setTimeout(expandAll, 400);
        });

    </script>

    <form id="form1" runat="server">
        <input type="hidden" id="hidInstanceId" runat="server" />
        <input type="hidden" id="hidSysCode" runat="server" />


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
                        <td class="function-edit" style="vertical-align: top;" rowspan="2">
                            <div style="padding: 0px 0px 0px 1px; margin: 0px; border-top: 0px solid #95B8E7; border-bottom: 1px solid #95B8E7; border-right: 1px solid #95B8E7; overflow-y: auto; vertical-align: top;">


                                <asp:EPanel runat="server" Title="配置项" EnableToggle="false">

                                    <iframe id="frameParamList" class="fitH" layout="divEdit,39" frameborder="no" style="border: 0px; width: 100%"></iframe>


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
        <div class="hidden" id="divHidden">

            <div id="mm" class="easyui-menu" style="width: 120px;">
                <div onclick="menuRefresh()" data-options="iconCls:'icon-refresh'">刷新</div>

            </div>
        </div>
    </form>
</body>
</html>
