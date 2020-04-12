<%@ page language="C#" autoeventwireup="true" inherits="App_Version_VersionDetail, ECI.Web" enablesessionstate="True" enableviewstatemac="false" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>组件版本详情</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <style type="text/css">
        .login {
            background-image: url(../../AppStart/Layout/css/images/bg_1.jpg);
            background-repeat: repeat-x;
            background-position: 40px 0px;
            background-color: #3EB4D2;
            height: 100%;
            width: 100%;
        }

        .box {
            background: white;
            padding: 2px 10px 2px 10px;
            border: 1px solid #DDDDDD;
        }
    </style>
    <script type="text/javascript">

        $(function () {

            //var value = parent.eci.textViewValue;

            //value = value.replace(/(\r\n)|(\n)/g, '<br>');

            //$(".content").html(value);


        })


        function selectText(element) {
            var text = document.getElementById(element);
            if (document.body.createTextRange) {
                var range = document.body.createTextRange();
                range.moveToElementText(text);
                range.select();
            } else if (window.getSelection) {
                var selection = window.getSelection();
                var range = document.createRange();
                range.selectNodeContents(text);
                selection.removeAllRanges();
                selection.addRange(range);
                /*if(selection.setBaseAndExtent){
                    selection.setBaseAndExtent(text, 0, text, 1);
                }*/
            } else {
                alert("none");
            }
        }

        function selectAction() {
            selectText("content");
        }
    </script>


</head>
<body class="login">
    <form id="form1" runat="server">
        <div>
            <div style="padding: 0px;">


                 <div style="margin-left: auto; margin-right: auto; width: 220px; margin-top: 10px;">
                        <asp:EButton runat="server" CssClass="btn-green" Width="100" Text="关闭" IsClient="true" OnClientClick="eci.close();" />
                    </div>

                <div class="description">
                    <h3>
                        <asp:Label runat="server" ID="lblDll"></asp:Label></h3>

                    <div class="workarea" layout="120">
                        <div class="box">
                            <div id="content" class="content" runat="server">
                            </div>
                        </div>
                    </div>

                   
                </div>


            </div>
        </div>
    </form>
</body>
</html>
