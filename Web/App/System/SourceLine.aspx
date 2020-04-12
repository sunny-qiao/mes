<%@ page language="C#" autoeventwireup="true" inherits="SourceLine, ECI.Web" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>代码行数统计分析</title>
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <style type="text/css">
        .span input {
            margin-left: 5px;
            margin-right: 5px;
        }
    </style>
    <script type="text/javascript">

    </script>
</head>
<body onload='eci.focus("txtPassword");'>
    <form id="form1" runat="server">
        <div id="root">
            <div class="toolbar">
                <asp:EButton ID="btnExecute" Icon="execute" runat="server" Text="代码行数统计分析" OnClick="btnExecute_Click" />
            </div>
            <div style="padding:4px;">
                限制代码行数：<asp:ETextBox ID="txtLine" runat="server" Height="25" Width="200" IsNum="true"></asp:ETextBox>

                <asp:EButton runat="server" CssClass="btn-blue" ID="btnTwo" Text="200" OnClick="btnCalc_Click" />
                <asp:EButton runat="server" CssClass="btn-green" ID="btnThree" Text="300" OnClick="btnCalc_Click" />
                <asp:EButton runat="server" CssClass="btn-blue" ID="btnFive" Text="500" OnClick="btnCalc_Click" />


                <br />
                 <br />

                <asp:EPanel Title="扫描结果" runat="server" Icon="book_open" BodyPadding="5" BackColor="White">
                    <div style="margin: 5px; font-size: 14px;">
                        <asp:Literal runat="server" ID="lblResult"></asp:Literal>

                    </div>

                </asp:EPanel>

            </div>

        </div>
    </form>
</body>
</html>
