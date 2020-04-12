function Employee() {
    var dataGridColumns_Wrap = [[{ field: "TRUENAME", title: "姓名", width: 200, formatter: null },
                                { field: "USERNAME", title: "英文姓名", width: 200, formatter: null },
                                { field: "USERID", title: "用户ID", width: 0, formatter: null }

    ]];

    var LoadData = function (nodeId) {
        var data = {};
        data.NODEID = nodeId;
        eci.post("ChooseUserData.aspx","NodeGetUser", data, function (res) {
            if (res.success) {
                var data = res.json;
                var d = eval('(' + data + ')');
                 
                $('#dg').datagrid('loadData', d);
                $('#dg').datagrid('loadData', d);
            }
            else { msg.ajax(res); }

        });

    };
    this.QueryUser = LoadData;
    var LoadNode = function (nodeid) {

        LoadData(nodeid);
        $("#txtTrueName").focus();
    };

    var collapse = function () {
        var node = $('#tt').tree('getSelected');
        $('#tt').tree('collapse', node.target);
    };
    var expand = function () {
        var node = $('#tt').tree('getSelected');
        $('#tt').tree('expand', node.target);
    };

    var pagerFilter = function (data) {
        if (typeof data.length == 'number' && typeof data.splice == 'function') {
            data = {
                total: data.length,
                rows: data,
                originalTotal: data.length
            }
        }
        var dg = $(this);

        var opts = dg.datagrid('options');

        if (!data.originalRows) {
            data.originalRows = (data.rows);
        }


        data.currOriginalRows = data.originalRows;
        data.total = data.originalTotal;


        var pager = dg.datagrid('getPager');
        pager.pagination({
            onSelectPage: function (pageNum, pageSize) {
                opts.pageNumber = pageNum;
                opts.pageSize = pageSize;
                pager.pagination('refresh', {
                    pageNumber: pageNum,
                    pageSize: pageSize
                });
                dg.datagrid('loadData', data);
            }
        });

        var start = (opts.pageNumber - 1) * parseInt(opts.pageSize);
        var end = start + parseInt(opts.pageSize);
        data.rows = (data.currOriginalRows.slice(start, end));
        return data;
    }
    var myLoadFilter = function (data, parent) {
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
    };
 
    Employee.prototype.Init = function () {

        $('#dg').datagrid({

            columns: dataGridColumns_Wrap,
            singleSelect: false,
            loadFilter: pagerFilter,
            pagination: true,     //开启分页  
            pageSize: 50,

            loadMsg: "正在加载数据中，请稍后...",
            onLoadSuccess: function (data) {

            } 
        });

        $('#dg').datagrid('hideColumn','USERID');

        $("#btnChoose").click(function () {
            var users = $('#dg').datagrid('getSelections');
            var userId = '';
            if (users.length == 0) {
                msg.warning("请选择要添加的系统成员");
                return;
            }

            for (var i = 0; i < users.length; i++) {
                if (i > 0) {
                    userId += ',';
                }

                userId += users[i].NAME;
            }

            chooseData(users);
        });

        $("#btnExpandAll").click(function () {
            $('#tt').tree('expandAll');
        });
        $("#btnCollapseAll").click(function () {
            $('#tt').tree('collapseAll');
        });
 
        $("#btnExpand").click(function () {
            expand();
        });
        $("#btnCollapse").click(function () {
            collapse();
        });

        $('#tt').tree({
            url: 'ChooseUserData.aspx?type=load&nodeId='+$("#hidNodeId").val(), method: 'get', loadFilter: myLoadFilter, lines: true,
            onContextMenu: function (e, node) {
                e.preventDefault();
                $(this).tree('select', node.target);

                $('#mm').menu('show', {
                    left: e.pageX,
                    top: e.pageY

                });

                if (node.tag == "root") {
                    $('#mm').menu("disableItem", $('#btnRemoveit'));
                    $('#btnRemoveit').unbind("click")
                }
                else {
                    $('#mm').menu("enableItem", $('#btnRemoveit'));
                    $('#btnRemoveit').click(function () {
                        removeit();
                    });
                }

                if (node.tag == "1") {
                    //部门下隐藏添加公司
                    $('#mm').menu("disableItem", $('#btnAppendCompany'));
                    $('#btnAppendCompany').unbind("click");
                }
                else {
                    $('#mm').menu("enableItem", $('#btnAppendCompany'));
                    $("#btnAppendCompany").click(function () {
                        appendCompany();
                    });
                }
            },

            onClick: function (node) {
                $('#tt').tree('toggle', node.target);
                var id = node.id;
                editNode = node;

                LoadNode(id);
            },

            onBeforeExpand: function (node, param) {
                $('#tt').tree('options').url = "ChooseUserData.aspx?type=load&Id=" + node.id + "&dsp=" + eci.guid();
            } 
 
        });

        setTimeout(expandAll, 400);

        function expandAll() {
            $('#tt').tree('expandAll');
        }
    };
}


