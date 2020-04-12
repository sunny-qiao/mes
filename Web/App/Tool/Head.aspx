<%@ page language="C#" autoeventwireup="true" inherits="App_Tool_Head, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>版本查看</title>

    <!-- #include File="../../App/Common/PageLoad.aspx" -->

    <script src="../../AppStart/Layout/Js/Toolbar.js" type="text/javascript"></script>



    <style type="text/css">
        .body {
            background-image: url(../../AppStart/Layout/css/images/bg_1.jpg);
            background-repeat: repeat-x;
            background-position: 40px 0px;
            background-color: #3EB4D2;
            height: 100%;
            width: 100%;
        }

        .btn-blue, .btn-green {
            height: 65px;
            border-radius: 0px;
        }

        .item {
            float: left;
            margin: 5px;
        }
    </style>

    <script type="text/javascript">

   

    </script>

</head>
<body class="body">
    <form id="form1" runat="server">
        <input type="hidden" id="hidFrom" runat="server" />
        <div id="root">


            <div style="margin: 15px;">

                <div id="ulFunction" runat="server" style="text-align: center; padding-top: 5px; margin-left: auto;">
                </div>


            </div>
        </div>

    </form>
</body>
</html>
