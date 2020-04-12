<%@ page language="C#" autoeventwireup="true" inherits="App_BaseData_Design1, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import Namespace="PL.Server.Core.Entity" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>页面设计</title>
     <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <link href="../../Scripts/Tree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
    <link href="../../Scripts/Tree/css/demo.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/Tree/Scripts/jquery.ztree.core-3.5.js" type="text/javascript"></script>
    <script src="../../Scripts/Tree/Scripts/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
    <script src="../../Scripts/Tree/Scripts/jquery.ztree.exedit-3.5.min.js" type="text/javascript"></script>
    <link href="../../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        .btn{
            height:35px;
        }

    </style>
    
    <script type="text/javascript">
        function preview() {
            var tableName = $("#txtCode").val();
            if (tableName != "") {
                var url = "../../App/Core/List.aspx?TableName=" + tableName;
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
              enable: false
          },
          callback: {
 
              beforeDrag: beforeDrag,
              beforeDrop: beforeDrop,
              beforeDragOpen: beforeDragOpen,
              onDrag: onDrag,
              onDrop: onDrop,
              onClick: onClick

          }
      };

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

            //msg.loading( "提交保存")

            eci.postme("SAVE_ORDER","ECI_DEV",data,function(response){
                msg.ajax(response);
                msg.close();
              
                msg.tip("保存成功");

            });



            //className = (className === "dark" ? "":"dark");
            //showLog("[ "+getTime()+" onDrop ]&nbsp;&nbsp;&nbsp;&nbsp; moveType:" + moveType);
            //showLog("target: " + (targetNode ? targetNode.name : "root") + "  -- is "+ (isCopy==null? "cancel" : isCopy ? "copy" : "move"))
        }


 
        function onClick(e,treeId, treeNode) {
            var zTree = $.fn.zTree.getZTreeObj(treeId);
            zTree.expandNode(treeNode);
        }
  
     
        $(document).ready(function () {
            $.fn.zTree.init($("#queryTree"), setting, zNodesQuery);
            $.fn.zTree.init($("#gridTree"), setting, zNodesGrid);
            $.fn.zTree.init($("#editTree"), setting, zNodesEdit);
        });
       
    </script>
</head>
<body style="overflow-x: hidden;">

    <script type="text/javascript">

        var zNodesQuery =<%=queryJson%>;
        var zNodesGrid =<%=gridJson%>;
        var zNodesEdit =<%=editJson%>;

    </script>

    <form id="form1" runat="server" not="true">
        <div id="root">
            
                <asp:EButton ID="btnPreview" IsClient="true" runat="server" Width="91px" Text="预览(P)"
                    AccessKey="p" OnClientClick="preview();" CssClass="btn btn-success" />
                <asp:EButton runat='server' ID="btnClose" IsClient="true" OnClientClick="$.eci.close();"
                    Text="关闭" CssClass="btn btn-default" />
             
            <div class="workarea">
                <div id="header">
                    <table class="grid" cellpadding="0px" cellspacing="0px">
                        <tr>
                            <td class="lbl">程序代码
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="txtCode" Width="85%" CssClass="form-control input-sm"   disabled />
                            </td>
                            <td class="lbl">程序名称
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="txtMainAlias" Width="85%"  CssClass="form-control input-sm" disabled />
                            </td>
                        </tr>
                    </table>
                </div>
                <table class="grid">
                    <tr>
                        <th style="width: 33%"></th>
                        <th style="width: 33%"></th>
                        <th style="width: 33%"></th>
                    </tr>
                    <tr>
                        <td>查询</td>
                        <td>显示</td>
                        <td>编辑</td>

                    </tr>
                    <tr>
                        <td>
                            <div style="width: 33%; float: left;">
                                <ul id="queryTree" class="ztree">
                                </ul>
                            </div>
                        </td>
                        <td>
                            <div style="width: 33%; float: left;">
                                <ul id="gridTree" class="ztree">
                                </ul>
                            </div>
                        </td>
                        <td>
                            <div style="width: 33%; float: left;">
                                <ul id="editTree" class="ztree">
                                </ul>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        </div>
    </form>
</body>
</html>
