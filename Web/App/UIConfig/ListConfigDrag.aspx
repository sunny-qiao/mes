<%@ page language="C#" autoeventwireup="true" inherits="App_DataHelp_ListConfigDrag, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>列表自定义配置</title>

    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <link href="../../EasyUI/themes/default/easyui.css" rel="stylesheet" />
    <link href="../../EasyUI/themes/icon.css" rel="stylesheet" />
    <script src="../../EasyUI/jquery.easyui.min.js" type="text/javascript"></script>


    <style type="text/css">
        .myfocus {
            background: green;
        }

        .mytr {
            border: 1px solid red;
            background: pink;
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
    
        $(document).ready(function () {
             
            if ($("#btnSaveTree").length > 0) {
                 
                $('#tt').tree({
                    data: nodeData, lines: true, dnd: true, checkbox: true,


                    onBeforeDrop: function (targetNode, source, point) {


                        if (point == "append") {
                            // msg.tip("不能拖动到下级");
                            return false;
                        }

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
            }
        });


        function saveTree(obj)
        {
            var nodes = $('#tt').tree('getChildren');
            
            var saveData ="";

            $(nodes).each(function(){
                if(saveData.length>0){saveData+=",";}
                saveData+= this.id+"|"+this.checked;
            })
 
            var configCode = $("#hidConfigCode").val();
            var configOwner = $("#hidConfigOwner").val();
            eci.postme("SaveByTree",{configOwner:configOwner,configCode:configCode,saveData:saveData},function(res){
                msg.ajax(res);
            })
        }

        function  deleteOK()
        {
            msg.alert("企业配置信息清除成功",{closed:function(){
                eci.close();
            }})
        }


        
        $(function () {
 
        });

    
    </script>

</head>
<body>

    <script type="text/javascript">
        var nodeData =<%=nodeData%>; 
    </script>

    <form id="form1" runat="server">
        <asp:HiddenField runat="server" ID="hidConfigOwner" />
        <asp:HiddenField runat="server" ID="hidConfigCode" />
        <asp:HiddenField runat="server" ID="hidId" />

        <div class="fitH">

            <div id="toolbar">
                <asp:EButton runat="server" ID="btnSaveTree" Text="保存" Icon="save" IsClient="true" OnClientClick="saveTree(this)" />
                <asp:EButton runat="server" ID="btnEditByList" Text="列表编辑" Icon="cog_start" OnClick="btnEditByList_Click" />
                <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" />

            </div>

            <div class="easyui-panel fitH" layout="42"  style="padding: 5px; border-top: 0px;">
                <ul id="tt"></ul>
            </div>

        </div>

    </form>
</body>
</html>
