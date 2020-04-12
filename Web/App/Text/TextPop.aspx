<%@ page language="C#" autoeventwireup="true" inherits="App_Text_TextPop, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <style type="text/css">
        .box {
            background: white;
            padding: 2px 10px 2px 10px;
            border: 1px solid #DDDDDD;
        }
    </style>
    <script type="text/javascript">
 
        function calc(value) {
            value = value.replace(/(\r\n)|(\n)/g, ',');
            value = value.replace(/( )|(\n)/g, ',');
            var array = value.split(",");

            var count = 0;

            $(array).each(function () {
                if (this.length > 0) {
                    count++;
                }
            })
 
            $("#lblSum").html("总共" + count + "行");
        }

        function replaceBlank(value) {
            var newValue = value.replace(/(  )|(\n)/g, ' ');
            if (newValue == value) {
                return value;
            }
            else {
                return replaceBlank(newValue);
            }
        }

        $(function () {

            var value = parent.eci.textpopValue;
            calc(value);

            value = replaceBlank(value);
            value = value.replace(/( )|(\n)/g, ',');
            value = value.replace(/(,)|(\n)/g, '\r\n');
 
            $("#txtContent").val(value);

            $("#btnClose").focus();

            $(window).keyup(function (e) {
                e = e || event;
                if (e.keyCode == 27) {
                    eci.close();
                }

                var value = $("#txtContent").val();

                value = replaceBlank(value);

                value = value.replace(/(\r\n)|(\n)/g, ',');
                value = value.replace(/( )|(\n)/g, ',');
                calc(value);
                parent.eci.textpopCallback(value);

            });


        })

    </script>


</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="padding: 0px;">

                <div style="margin: 4px;">
                    <asp:ESum runat="server" ID="lblSum"></asp:ESum>

                </div>

                <div style="margin: 4px;">
                    <asp:ETextBox runat="server" ID="txtContent" TextMode="MultiLine" Rows="15" Width="100%">


                    </asp:ETextBox>

                </div>

                <div style="margin: 4px; text-align: center;">
                    <asp:EButton ID="btnClose" runat="server" CssClass="btn-green" Width="100" Text="关闭" IsClient="true" OnClientClick="eci.close();" />

                </div>


            </div>
        </div>
    </form>
</body>
</html>
