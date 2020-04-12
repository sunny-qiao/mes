<%@ page language="c#" inherits="App_Error_Error, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>信息提示</title>
    <!-- #include File="../../App/Common/PageLoad.aspx" -->


    <style type="text/css">
        .linkCss {
            font-family: 微软雅黑;
            font-weight: bold;
            font-size: small;
        }

        .lblError {
            font-family: 微软雅黑;
            font-weight: bold;
            font-size: larger;
            color: Red;
        }

        body {
            TEXT-ALIGN: center;
        }

        #center {
            MARGIN-RIGHT: auto;
            MARGIN-LEFT: auto;
        }

        .div-detail {
            text-align: left;
            font-size: 14px;
            width: 580px;
            margin-left: auto;
            margin-right: auto;
            display: none;
            background-color: lightyellow;
            margin-top: 20px;
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #EEEEEE;
        }
    </style>

    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            font-family: "微软雅黑","宋体";
            font-size: 12px;
        }

        .login {
            background-image: url(../../AppStart/Layout/css/images/bg_1.jpg);
            background-repeat: repeat-x;
            background-position: 40px 0px;
            background-color: #3EB4D2;
            height: 100%;
            width: 100%;
        }

        .father {
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
        }

        .son {
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            width: 50%;
            height: 50%;
            margin: auto;
        }
    </style>

    <script type="text/javascript">

        $(function () {

            $("#divMessage").dblclick(function () {

                $(".div-detail").toggle();

            })

        })

    </script>


</head>
<body style="text-align: center;" class="login">
    <form id="Form1" method="post" runat="server" style="margin-top: 10px">
        <div class="father">
            <div class="son">
                <div id="center" class="centered" style="border: 0px solid blue; width: 100%; margin-top: auto; margin-bottom: auto;">

                    <table id="TbAll" style="margin-left: auto; margin-right: auto; display: inline-block; width: 600px; text-align: center; background-image: url('images/Error.png'); height: 240px; padding: 0px; margin: 0px; background-repeat: no-repeat; border: 0px solid red;">
                        <tr>
                            <td style="width: 20px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                            <td style="text-align: center">
                                <table style="border: 0px solid blue;">
                                    <tr>
                                        <td style="height: 280px; width: 520px; vertical-align: top;">
                                            <div id="divMessage" style="overflow: hidden; border: 0px solid blue; margin-right: 20px; margin-top: 85px;">
                                                <asp:Label ID="lblErrorMsg" runat="server" Font-Size="Large"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>

                                </table>
                            </td>
                        </tr>

                    </table>

                    <div style="text-align: left; font-size: 14px; width: 600px; margin-left: auto; margin-right: auto; margin-top: 10px; margin-bottom: 10px;">
                        <div style="margin-left: 0px; border-bottom: 1px dashed #808080; color: #808080; overflow-wrap: break-word;">
                            <asp:Label ID="lblSourceUrl" runat="server"></asp:Label>
                        </div>
                    </div>


                    <div class="div-detail">
                        <asp:Label ID="lblDetail" runat="server"></asp:Label>
                    </div>



                </div>
            </div>
        </div>
    </form>
</body>
</html>
