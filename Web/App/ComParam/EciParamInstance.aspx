<%@ page language="C#" autoeventwireup="true" inherits="App_COMParam_frmEciParamInstance, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>系统配置</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <style type="text/css">
        .e-panel-wrapper {
            margin-top: 4px;
        }

        .td-switch {
            text-align: center;
            border: 1px dashed #EEE;
        }

        .div-checkbox {
            width: auto !important;
        }

        .div-input, .div-input-define, .div-tip, .div-lbl {
            float: left;
        }

        .div-input, .div-input-define {
            width: 100%;
        }

        .div-input-define {
            display: none;
        }

        .div-tip {
            margin-left: 10px;
        }

        .notset {
            background: pink !important;
        }

        .keep {
            background: lightblue !important;
        }

        .change {
            background: lightyellow !important;
        }

        tr {
            border-bottom: 1px dashed #EEE;
        }

        .row-param td {
            padding: 5px;
        }
    </style>

    <script type="text/javascript">

        function addAction() {

            if (eci.hasSave()) {
                var groupCode = $("#txtGroupCode").val();
                var url = "EciParamEdit.aspx?groupCode=" + groupCode;

                window.location.href = url;
            }
        }

        function saved() {
            window.parent.saved();
        }

        function pageClose() {
            window.parent.search();
            eci.close();
        }

        function manage() {
            var SysCode = $("#hidSysCode").val();
            var url = "EciParamGroupTree.aspx";
            if (SysCode) {
                url += "?SysCode=" + SysCode;
            }
            eci.open(url, { full: true });
        }

        function debugAction() {
            var url = "../../App/API/API.aspx";
            parent.eci.dialog("接口调试", url);
        }

        $(function () {
            $(window).keyup(function (e) {
                e = e || event;
                if (e.keyCode == 27) {
                    eci.close();
                }
            });


            $("#btnClose").hide();
            if (window.opener) {
                $("#btnClose").show();
            }


            $(".chk-switch").click(function () {

                initRow(this);

            })

            $(".chk-switch").each(function () {
                initRow(this);
            })

            $(".row-param").each(function () {

                var $this = $(this);
                var key = $this.attr("key");

                var a = $("#" + key).val();
                var b = $("#define" + key).val();



                var checked = $this.find(".chk-switch")[0].checked;

                if (checked) {

                    var type = $("#" + key).attr("type");

                    if (type == "checkbox") {
                        a = $("#" + key)[0].checked;
                        b = $("#define" + key)[0].checked;
                    }

                    if (a == b) {
                        $this.removeClass("change").addClass("keep");
                    }
                    else {
                        $this.removeClass("keep").addClass("change");
                    }
                }
            })
        })

        function initRow(obj) {
            var checked = obj.checked;

            if (checked) {

                $(obj).parents("tr").find(".div-input-define").hide();
                $(obj).parents("tr").find(".div-input").show();
            }
            else {
                $(obj).parents("tr").find(".div-input-define").show();
                $(obj).parents("tr").find(".div-input").hide();
            }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidSysCode" runat="server" />
        <input type="hidden" id="hidGroupId" runat="server" />
        <input type="hidden" id="hidInstanceId" runat="server" />

        <div id="root">

            <div id="toolbar" class="toolbar" style="padding-top: 2px;">
                <asp:EButton runat="server" ID="btnSave" Text="保存" Icon="save" OnClick="btnSave_Click" />
                <asp:EButton runat="server" ID="btnClear" Text="清空缓存" Icon="refresh" OnClick="btnClear_Click" />

                <asp:EButton runat="server" ID="btnClose" Text="关闭" Icon="close" IsClient="true" OnClientClick="eci.close()" />

                <asp:Label runat="server" Text="代码:" ID="lblVersion"></asp:Label>


                <div style="float: right; margin-right: 5px;">
                </div>


                <div style="float: right; height: 32px; width: 50px; text-align: center; border: 1px solid lightblue" class="change">自定义</div>
                <div style="float: right; height: 32px; width: 50px; text-align: center; border: 1px solid lightblue" class="keep">不变</div>
                <div style="float: right; height: 32px; width: 50px; text-align: center; border: 1px solid lightblue; background: white;">未设置</div>

            </div>
            <div class="workarea" layout="toolbar,pagetitle" runat="server" id="workarea">
            </div>
        </div>

    </form>
</body>
</html>
