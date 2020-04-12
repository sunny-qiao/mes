<%@ control language="C#" autoeventwireup="true" inherits="App_Control_EciQuery, ECI.Web" %>
<%@ Register Src="~/App/Control/EciQueryGroup.ascx" TagPrefix="uc1" TagName="EciQueryGroup" %>

<div style="display: none" class="Wdate"></div>

<table class="grid" cellpadding="0" cellspacing="0" runat="server" id="tbQuery" border="1">
    <tr>
        <th style="width: 35%"></th>
        <th style="width: 80px"></th>
        <th style="width: 35%"></th>
        <th style="width: 140px"></th>



    </tr>
    <tr>
        <td>
            <uc1:EciQueryGroup runat="server" ID="group1" />
        </td>
        <td class="left">
            <asp:ECombox runat="server" ID="cboGroupJoinType">
                <asp:ListItem Value="and">并且</asp:ListItem>
                <asp:ListItem Value="or">或者</asp:ListItem>
            </asp:ECombox>
        </td>
        <td>
            <uc1:EciQueryGroup runat="server" ID="group2" />
        </td>
        <td class="txt">
            <asp:EButton runat="server" ID="btnSearch" Text="查询" CancelLoading="true" Icon="find" OnClick="btnSearch_Click" />
            <asp:EButton runat="server" ID="btnReset" IsClient="true" Text="重置" Icon="reset" OnClientClick="queryReset()" />
        </td>

    </tr>


</table>



<script type="text/javascript">

    function test() {
        var data = define.OP_NO;
        data = strToJson(data);

        alert(data);

        alert(data.NAME);
    }

    function queryReset() {
        $(".conn").val("");
    }


    $(function () {

        $(".dataField").change(function () {
            initByField(this, true);
        });

        $(".dataField").each(function () {
            initByField(this, false);
        });

    })

    function initByField(obj, change) {
        var script = "";
        var $conn = $(obj).parent().parent().find(".conn");
        var $queryType = $(obj).parent().parent().find(".queryType");

        var connId = $conn.attr("id");

        var code = $(obj).val();

        var itemDefine = define[code];
        itemDefine = strToJson(itemDefine);

        var uiType = itemDefine.UI_TYPE;
        var uiTypeConfig = itemDefine.UI_TYPE_CONFIG

        $conn.removeAttr("onkeypress");
        $conn.removeAttr("ondblclick");
        $conn.removeAttr("onblur");

        if (change) {
            choose.removeColor(connId);
            $conn.val("");
        }


        if (uiType == "CHOOSE") {
            choose.toChoose(connId);

            var chooseImg = $("#" + connId + "ChooseIcon");

            script = "return $.choose.open('" + uiTypeConfig + "', '" + connId + "')";

            chooseImg.attr("onclick", script);
            $conn.attr("ondblclick", script);

            script = "return $.choose.servercheck('" + uiTypeConfig + "', '" + connId + "')";
            $conn.attr("onblur", script);


        }
        else if (uiType == "DATE") {
            choose.toInput(connId);
            $conn.addClass("Wdate");
            script = 'WdatePicker({ dateFmt: "yyyy-MM-dd" })';

            $conn.attr("onclick", script);


            //如果是日期框，且是选择下拉框触发的改变
            if (change) {

            }
        }

        else {
            choose.toInput(connId);
        }
    }



</script>
