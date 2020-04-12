<%@ page language="C#" autoeventwireup="true" inherits="App_System_Platform, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>运行公司选择</title>

    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <style type="text/css">
        .area {
            line-height: 24px;
            font-size: 15px;
            float: left;
            border: 1px solid #EEE;
            margin: 4px;
            text-align: center;
            color: firebrick;
            cursor: pointer;
        }

            .area:hover {
                border: 1px solid #ffd800;
                background: #ffd800;
            }

        .area-in {
            margin: 4px;
        }

        .logo {
            width: 100px;
            height: 100px;
            border: 0px solid green;
        }

        .item {
        }
    </style>

    <script type="text/javascript">
       
  
        function showMsg(message)
        {
            msg.warning(message, {
                closed: function () {

                    eci.close();

                }
            })
        }

        $(function () {

            $(".area").click(function () {
                var code = $(this).attr("data-code");

                window.parent.changePlatformCallback(code);
              
            })

        })



    </script>


</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField runat="server" ID="hidPlatformFunctionId" />
       
        <div style="margin: 20px;" >

            <div>
                 
                <asp:Repeater runat="server" ID="gvData">

                    <ItemTemplate>
                        <a class="area" data-code='<%# Eval("CODE") %>'>
                            <div class="area-in">
                                <img alt="" class="logo" src="../../Samples/Area/<%# Eval("IMG") %>.png" />
                                <div class="item"><%#Eval("NAME") %></div>
                            </div>
                        </a>

                    </ItemTemplate>
                </asp:Repeater>




            </div>


        </div>
    </form>
</body>
</html>
