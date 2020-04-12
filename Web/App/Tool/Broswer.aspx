<%@ page language="C#" autoeventwireup="true" inherits="App_Tool_Broswer, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>浏览器支持</title>

    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
        

    </script>


    <style type="text/css">
        .body {
            background-image: url(../../AppStart/Layout/css/images/bg_1.jpg);
            background-repeat: repeat-x;
            background-position: 40px 0px;
            background-color: #3EB4D2;
            height: 100%;
            width: 100%;
        }



        a {
            text-decoration: none;
            color: #808080;
        }

            a:hover {
                color: red;
            }


        li {
            background: url('../../Icon/cog.png') no-repeat;
            line-height: 28px;
            height: 25px;
            padding-left: 20px;
            background-position: center left;
        }

        ul {
            width: 200px;
        }

        li:hover {
            background: url('../../Icon/cog_start.png') no-repeat;
            line-height: 28px;
            height: 25px;
            padding-left: 20px;
            background-position: center left;
        }
    </style>



    <script type="text/javascript">
        $(function () {

            $(window).keyup(function (e) {
                e = e || event;
                if (e.keyCode == 27) {
                    eci.close();
                }
            });

            $("#btnClose").focus();



        })


    </script>

</head>
<body class="body">
    <form id="form1" runat="server">
        <input type="hidden" id="hidFrom" runat="server" />
        <div id="root">
            <div>
                <div id="datagrid" style="margin: 20px;">
                    <div id="divTitle" style="margin-top: 10px; margin-bottom: 10px; font-size: 14px;">

                        <asp:EButton runat="server" ID="btnClose" IsClient="true" OnClientClick="eci.close()" Icon="close" Text="关闭" />
                        系统支持以下浏览器
                    </div>

                    <ul class="function" runat="server" style="margin-left: 20px; font-size: 16px;">

                        <li>
                            <a href="javascript:void(0);">Chorme (推荐使用)</a></li>
                        <li>
                            <a href="javascript:void(0);">IE8+</a></li>


                        <li>
                            <a href="javascript:void(0);">Firefox</a></li>



                    </ul>

                    <div style="margin: 20px;" class="description">
                        <h3 style="font-size: 14px;">以上浏览器，如果您在使用过程中遇到兼容性问题，请反馈！</h3>
                    </div>

                </div>
            </div>
        </div>

    </form>
</body>
</html>
