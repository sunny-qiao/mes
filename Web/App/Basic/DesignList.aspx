<%@ page language="C#" autoeventwireup="true" inherits="App_BaseData_DesignList, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import Namespace="PL.Server.Core.Entity" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>企业列表配置</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <link href="../../Scripts/Tree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
    <link href="../../Scripts/Tree/css/demo.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/Tree/Scripts/jquery.ztree.core-3.5.js" type="text/javascript"></script>
    <script src="../../Scripts/Tree/Scripts/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
    <script src="../../Scripts/Tree/Scripts/jquery.ztree.exedit-3.5.min.js" type="text/javascript"></script>
    <link href="../../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        .btn {
            height: 35px;
        }

        #queryTree, #gridTree {
            width: 99%;
            border: 1px solid #5cb85c;
        }
    </style>

    <script type="text/javascript">
        function preview() {
            var p = $("#txtCode").val();
            var q = $("#txtMainAlias").val();
            if (p != "") {
                var url = "../../App/Core/List.aspx?TableName=" + p;
                eci.openTab("order-preview", "设计预览", url);
            }
        }

       
        var setting = {
            data: {
                key: {
                    title: "t"
                },
                simpleData: {
                    enable: true
                }
            },
            edit:
          {
              drag: {
                  autoExpandTrigger: true,
                  prev: dropPrev,
                  inner: dropInner,
                  next: dropNext
              },

              enable: true,
              showRenameBtn:false,
              showRemoveBtn:false

          }
            ,
            view: {
                dblClickExpand: false
            },
            check: {
                enable: true
            },
            callback: {
 
                beforeDrag: beforeDrag,
                beforeDrop: beforeDrop,
                beforeDragOpen: beforeDragOpen,
                onDrag: onDrag,
                onDrop: onDrop,
                onClick: onClick,
                onCheck:onCheck

            }
        };

        function onCheck(e,treeId,treeNode)
        {
            var status = treeNode.checked?"1":"0";
            var id = treeNode.id;

            var data={};
            data.treeId = treeId;
            data.status=status;
            data.id = id;
            data.pageCode = $("#txtCode").val();
            data.loading=false;

            eci.postme("save",data,function(response){
                msg.tip(response.message);
            });
        }

        var log, className = "dark", curDragNodes, autoExpandNode;

        function dropPrev(treeId, nodes, targetNode) {
     
            var pNode = targetNode.getParentNode();
            if (pNode && pNode.dropInner === false) {
                return false;
            } else {
                for (var i=0,l=curDragNodes.length; i<l; i++) {
                    var curPNode = curDragNodes[i].getParentNode();
                    if (curPNode && curPNode !== targetNode.getParentNode() && curPNode.childOuter === false) {
                        return false;
                    }
                }
            }
            return true;
        }
        function dropInner(treeId, nodes, targetNode) {
            if (targetNode && targetNode.dropInner === false) {
                return false;
            } else {
                for (var i=0,l=curDragNodes.length; i<l; i++) {
                    if (!targetNode && curDragNodes[i].dropRoot === false) {
                        return false;
                    } else if (curDragNodes[i].parentTId && curDragNodes[i].getParentNode() !== targetNode && curDragNodes[i].getParentNode().childOuter === false) {
                        return false;
                    }
                }
            }
            return true;
        }
        function dropNext(treeId, nodes, targetNode) {
            var pNode = targetNode.getParentNode();
            if (pNode && pNode.dropInner === false) {
                return false;
            } else {
                for (var i=0,l=curDragNodes.length; i<l; i++) {
                    var curPNode = curDragNodes[i].getParentNode();
                    if (curPNode && curPNode !== targetNode.getParentNode() && curPNode.childOuter === false) {
                        return false;
                    }
                }
            }
            return true;
        }

        function beforeDrag(treeId, treeNodes) {
            className = (className === "dark" ? "":"dark");
            //showLog("[ "+getTime()+" beforeDrag ]&nbsp;&nbsp;&nbsp;&nbsp; drag: " + treeNodes.length + " nodes." );
            for (var i=0,l=treeNodes.length; i<l; i++) {
                if (treeNodes[i].drag === false) {
                    curDragNodes = null;
                    return false;
                } else if (treeNodes[i].parentTId && treeNodes[i].getParentNode().childDrag === false) {
                    curDragNodes = null;
                    return false;
                }
            }
            curDragNodes = treeNodes;
            return true;
        }

        function beforeDragOpen(treeId, treeNode) {
            autoExpandNode = treeNode;
            return true;
        }
        function beforeDrop(treeId, treeNodes, targetNode, moveType, isCopy) {
            className = (className === "dark" ? "":"dark");
 
            return true;
        }
        function onDrag(event, treeId, treeNodes) {
            //className = (className === "dark" ? "":"dark");
            //showLog("[ "+getTime()+" onDrag ]&nbsp;&nbsp;&nbsp;&nbsp; drag: " + treeNodes.length + " nodes." );
        }

        function onDrop(event, treeId, treeNodes, targetNode, moveType, isCopy) {
            var moveId = "";

            if(targetNode==null) 
            {
                return false;
            }

            for(var i = 0 ; i<treeNodes.length;i++)
            {
                moveId+=","+ treeNodes[i].id;
            }

            var targetId = targetNode.id;
            
            var data ={};
            data.moveId =moveId;
            data.targetId= targetId;
            data.moveType= moveType;
            data.type= treeId;
            data.code=$("#txtCode").val();
            data.loading=false;

            eci.postme("move",data,function(response){
                msg.close();
                msg.tip("保存成功");
            });
        }

        function onClick(e,treeId, treeNode) {
            var zTree = $.fn.zTree.getZTreeObj(treeId);
            zTree.expandNode(treeNode);
        }
  
     
        $(document).ready(function () {
            $.fn.zTree.init($("#gridTree"), setting, zNodesGrid);
        });
       
    </script>
</head>
<body style="overflow-x: hidden;">

    <script type="text/javascript">
        var zNodesGrid =<%=gridJson%>;
    </script>

    <form id="form1" runat="server" not="true">

        <asp:EButton runat='server' ID="btnClose" IsClient="true" OnClientClick="$.eci.close();"
            Text="关闭" CssClass="btn btn-green" />



        <div id="header">
            <table class="grid" cellpadding="0px" cellspacing="0px">
                <tr>
                    <td class="lbl">配置代码
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtCode" Width="85%" CssClass="form-control input-sm" disabled />
                    </td>
                    <td class="lbl">配置名称
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtMainAlias" Width="85%" CssClass="form-control input-sm" disabled />
                    </td>
                </tr>
                <tr>
                    <td class="lbl">公司代码</td>
                    <td>
                        <asp:TextBox runat="server" ID="txtCompanyCode" Width="85%" CssClass="form-control input-sm" disabled />
                    </td>
                    <td class="lbl">公司名称</td>
                    <td>
                        <asp:TextBox runat="server" ID="txtCompanyName" Width="85%" CssClass="form-control input-sm" disabled />
                    </td>
                </tr>
            </table>
        </div>
        <table class="grid" style="margin-top: 4px;">
            <tr>
                <th style="width: 50%"></th>

            </tr>
            <tr>

                <td>显示数据项</td>
            </tr>
            <tr>

                <td>
                    <div style="width: 100%; float: left;">
                        <ul id="gridTree" class="ztree">
                        </ul>
                    </div>
                </td>

            </tr>
        </table>


    </form>
</body>
</html>
