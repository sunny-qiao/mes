<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdZyList.aspx.cs" Inherits="AppMes_BaseData_frmMesBdZyList" %>

<%@ Register Src="ascxEditZy.ascx" TagPrefix="uc1" TagName="ascxEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>职员</title>
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

    <script type="text/javascript">
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

        $(function () {
            $(".function-edit").hide();

            $('#tt').tree({
                url: 'frmMesBdZyData.aspx?type=load&dps=' + eci.guid(), method: 'get', loadFilter: myLoadFilter, lines: true, dnd: true, onContextMenu: function (e, node) {
                    e.preventDefault();

                    var id = node.id;
                    editNode = node;
                    load(id);

                    $(this).tree('select', node.target);
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

        function collapseAll() {
            $('#tt').tree('collapseAll');
        }

        function expandAll() {
            $('#tt').tree('expandAll');
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

            //if (parentNode.children) {
            //    var seq = parentNode.children.length * 10;
            //    seq += 10;
            //    $("#ascxEdit_txtSEQ").val(seq);
            //}
            //else {
            //    $("#ascxEdit_txtSEQ").val(10);
            //}

        }
        function add(parentId) {
            //$("#divEdit").show();
            var guid = eci.guid();

            $("#ascxEdit_txtGUID").val(guid);
            $("#ascxEdit_txtFLAG").val("Add");
            $("#ascxEdit_txtPARENTID").val(parentId);

            $("#ascxEdit_txtGh").val("");
            $("#ascxEdit_txtName").val("");
            $("#ascxEdit_txtCode").val("");
            $("#ascxEdit_cboStatus option:first").attr("selected", true);
            $("#ascxEdit_txtTel").val("");
            $("#ascxEdit_txtIdCard").val("");
            $("#ascxEdit_txtKhyh").val("");
            $("#ascxEdit_txtKhm").val("");
            $("#ascxEdit_txtBank").val("");
            $("#ascxEdit_txtWhcd").val("");
            $("#ascxEdit_txtByxx").val("");
            $("#ascxEdit_txtByzy").val("");
            $("#ascxEdit_txtBynf").val("");
            $("#ascxEdit_txtProvince").val("");
            $("#ascxEdit_txtCity").val("");
            $("#ascxEdit_txtAddress").val("");
            $("#ascxEdit_txtMail").val("");
            $("#ascxEdit_txtRemark").val("");
            $("#ascxEdit_txtJs1").val("");
            $("#ascxEdit_txtJs1Relation").val("");
            $("#ascxEdit_txtJs1Tel").val("");
            $("#ascxEdit_txtJs1Address").val("");
            $("#ascxEdit_txtJs2").val("");
            $("#ascxEdit_txtJs2Relation").val("");
            $("#ascxEdit_txtJs2Tel").val("");
            $("#ascxEdit_txtJs2Address").val("");
            $("#ascxEdit_txtJs3").val("");
            $("#ascxEdit_txtJs3Relation").val("");
            $("#ascxEdit_txtJs3Tel").val("");
            $("#ascxEdit_txtJs3Address").val("");
            $("#ascxEdit_txtJs4").val("");
            $("#ascxEdit_txtJs4Relation").val("");
            $("#ascxEdit_txtJs4Tel").val("");
            $("#ascxEdit_txtJs4Address").val("");
            $("#ascxEdit_txtCarNo").val("");
            $("#ascxEdit_txtCarType").val("");

            $("#ascxEdit_txtGh").focus();

            $("#btnDeleteIt").hide();
            $("#btnAdd").hide();
            $("#btnImp").hide();
            $("#btnSave").show();

            $("#ascxEdit_txtGh").removeAttr("readonly");
            $("#ascxEdit_txtGh").removeClass("text-disabled");
        }

        function load(id) {
            if (id == "0") {
                $(".function-edit").hide();
            }
            else {
                $(".function-edit").show();

                $("#ascxEdit_txtFLAG").val("Edit");

                eci.post("frmMesBdZyData.aspx", "LoadRecord", { id: id }, function (res) {
                    if (res.success) {
                        $("#ascxEdit_txtGUID").val(res.guid);
                        $("#ascxEdit_txtGh").val(res.gh);
                        $("#ascxEdit_txtCode").val(res.code);
                        $("#ascxEdit_txtName").val(res.name);
                        $("#ascxEdit_txtTel").val(res.tel);
                        $("#ascxEdit_txtIdCard").val(res.idcard);
                        $("#ascxEdit_txtKhyh").val(res.Khyh);
                        $("#ascxEdit_txtKhm").val(res.Khm);
                        $("#ascxEdit_txtBank").val(res.Bank);
                        $("#ascxEdit_txtWhcd").val(res.Whcd);
                        $("#ascxEdit_txtByxx").val(res.Byxx);
                        $("#ascxEdit_txtByzy").val(res.Byzy);
                        $("#ascxEdit_txtBynf").val(res.Bynf);
                        $("#ascxEdit_txtProvince").val(res.Province);
                        $("#ascxEdit_txtCity").val(res.City);
                        $("#ascxEdit_txtAddress").val(res.Address);
                        $("#ascxEdit_txtMail").val(res.Mail);
                        $("#ascxEdit_txtRemark").val(res.Remark);
                        $("#ascxEdit_txtJs1").val(res.Js1);
                        $("#ascxEdit_txtJs1Relation").val(res.Js1Relation);
                        $("#ascxEdit_txtJs1Tel").val(res.Js1Tel);
                        $("#ascxEdit_txtJs1Address").val(res.Js1Address);
                        $("#ascxEdit_txtJs2").val(res.Js2);
                        $("#ascxEdit_txtJs2Relation").val(res.Js2Relation);
                        $("#ascxEdit_txtJs2Tel").val(res.Js2Tel);
                        $("#ascxEdit_txtJs2Address").val(res.Js2Address);
                        $("#ascxEdit_txtJs3").val(res.Js3);
                        $("#ascxEdit_txtJs3Relation").val(res.Js3Relation);
                        $("#ascxEdit_txtJs3Tel").val(res.Js3Tel);
                        $("#ascxEdit_txtJs3Address").val(res.Js3Address);
                        $("#ascxEdit_txtJs4").val(res.Js4);
                        $("#ascxEdit_txtJs4Relation").val(res.Js4Relation);
                        $("#ascxEdit_txtJs4Tel").val(res.Js4Tel);
                        $("#ascxEdit_txtJs4Address").val(res.Js4Address);
                        $("#ascxEdit_txtCarNo").val(res.CarNo);
                        $("#ascxEdit_txtCarType").val(res.CarType);

                        $("#btnDeleteIt").show();
                        $("#btnAdd").show();

                        if (res.status == "Y") {
                            $("#ascxEdit_txtGh").attr("readonly", "true");
                            $("#ascxEdit_txtGh").addClass("text-disabled");
                        }
                        else {
                            $("#ascxEdit_txtGh").removeAttr("readonly");
                            $("#ascxEdit_txtGh").removeClass("text-disabled");
                        }

                        if (id == "0") {
                            $("#btnDeleteIt").hide();
                            $("#btnSave").hide();
                        }
                        else {
                            $("#btnDeleteIt").show();
                            $("#btnSave").show();
                        }
                    }
                    else {
                        msg.ajax(res);
                    }
                })
            }
        }
        function deleteIt() {
            var editId = $("#ascxEdit_txtGUID").val();

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
        function deleteAction() {
            eci.post("frmMesBdZyData.aspx", "Delete", { id: deleteNode.id, validate: true }, function (res) {
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
        function save() {
            var data = {};
            data.GUID = $("#ascxEdit_txtGUID").val();
            data.GH = $("#ascxEdit_txtGh").val();
            data.NAME = $("#ascxEdit_txtName").val();
            data.CODE = $("#ascxEdit_txtCode").val();
            data.STATUS = $("#ascxEdit_cboStatus").val();
            data.TEL = $("#ascxEdit_txtTel").val();
            data.IdCard = $("#ascxEdit_txtIdCard").val();
            data.Khyh = $("#ascxEdit_txtKhyh").val();
            data.Khm = $("#ascxEdit_txtKhm").val();
            data.Bank = $("#ascxEdit_txtBank").val();
            data.Whcd = $("#ascxEdit_txtWhcd").val();
            data.Byxx = $("#ascxEdit_txtByxx").val();
            data.Byzy = $("#ascxEdit_txtByzy").val();
            data.Bynf = $("#ascxEdit_txtBynf").val();
            data.Province = $("#ascxEdit_txtProvince").val();
            data.City = $("#ascxEdit_txtCity").val();
            data.Address = $("#ascxEdit_txtAddress").val();
            data.Mail = $("#ascxEdit_txtMail").val();
            data.Remark = $("#ascxEdit_txtRemark").val();
            data.Js1 = $("#ascxEdit_txtJs1").val();
            data.Js1Relation = $("#ascxEdit_txtJs1Relation").val();
            data.Js1Tel = $("#ascxEdit_txtJs1Tel").val();
            data.Js1Address = $("#ascxEdit_txtJs1Address").val();
            data.Js2 = $("#ascxEdit_txtJs2").val();
            data.Js2Relation = $("#ascxEdit_txtJs2Relation").val();
            data.Js2Tel = $("#ascxEdit_txtJs2Tel").val();
            data.Js2Address = $("#ascxEdit_txtJs2Address").val();
            data.Js3 = $("#ascxEdit_txtJs3").val();
            data.Js3Relation = $("#ascxEdit_txtJs3Relation").val();
            data.Js3Tel = $("#ascxEdit_txtJs3Tel").val();
            data.Js3Address = $("#ascxEdit_txtJs3Address").val();
            data.Js4 = $("#ascxEdit_txtJs4").val();
            data.Js4Relation = $("#ascxEdit_txtJs4Relation").val();
            data.Js4Tel = $("#ascxEdit_txtJs4Tel").val();
            data.Js4Address = $("#ascxEdit_txtJs4Address").val();
            data.CarNo = $("#ascxEdit_txtCarNo").val();
            data.CarType = $("#ascxEdit_txtCarType").val();

            data.PARENTID = $("#ascxEdit_txtPARENTID").val();
            data.FLAG = $("#ascxEdit_txtFLAG").val();
            if ($("#ascxEdit_txtProvince").val().indexOf('|') > 0) {
                data.PROVINCE = $("#ascxEdit_txtProvince").val().split("|")[0];
            }
            if ($("#ascxEdit_txtCity").val().indexOf('|') > 0) {
                data.CITY = $("#ascxEdit_txtCity").val().split("|")[0];
            }
            if (data.ID == "" && !data.PARENTID) {
                msg.warning("保存异常,没有选择上级节点");
                return;
            }

            var check = $.eciform.validate();

            if (!check) return false;

            eci.post("frmMesBdZyData.aspx", "Save", data, function (res) {
                if (res.success) {

                    if (data.FLAG == "Add") {
                        var t = $('#tt');

                        var id = data.GUID;
                        var text = data.NAME;

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

                        //showOpType(id);
                    }
                    else {
                        editNode.text = data.NAME;
                        $("#tt").tree("update", editNode);
                    }

                    $("#btnDeleteIt").show();
                    $("#btnAdd").show();

                    //if (data.STATUS == "Y") {
                    //    $("#ascxEdit_txtCODE").attr("readonly", "true");
                    //    $("#ascxEdit_txtCODE").addClass("text-disabled");
                    //}
                    //else {
                    //    $("#ascxEdit_txtCODE").removeAttr("readonly");
                    //    $("#ascxEdit_txtCODE").removeClass("text-disabled");
                    //}

                    msg.alert("保存成功");
                }
                else {
                    msg.ajax(res);
                }
            })
        }

    </script>
</head>
<body>
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

                                <asp:EButton runat="server" Text="新增" ID="btnAdd" Icon="add" IsClient="true" OnClientClick="append()" />
                                <asp:EButton runat="server" Text="保存" ID="btnSave" Icon="save" IsClient="true" OnClientClick="save()" />
                                <asp:EButton runat="server" Text="删除" ID="btnDeleteIt" Icon="delete" IsClient="true" OnClientClick="deleteIt()" />
                                <asp:EButton runat="server" Text="导入" ID="btnImp" Icon="excel" IsClient="true" OnClientClick="import()" />
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
                                <div class="pagetitle">职员</div>
                                <uc1:ascxEdit runat="server" ID="ascxEdit" />
                                <div style="margin: 2px;"></div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
