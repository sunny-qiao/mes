<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdZyStatusEdit.aspx.cs" Inherits="AppMes_BaseData_frmMesBdZyStatusEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>职员子表-职员工种及状态维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
         
       function addAction() {

            if(eci.hasSave())
            {
               var url = "frmMesBdZyStatusEdit.aspx";

                window.location.href=url;
             }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">
              
           <%--<asp:ETitle runat="server" ID="pagetitle" Title="职员子表-职员工种及状态维护"></asp:ETitle>--%>

            <div id="toolbar" class="toolbar">
              <asp:EButton runat="server" ID="btnSave" Text="保存" NeedCheck="true" ValidateId="tbEdit" OnClick="btnSave_Click" Icon="save" />
              <%--<asp:EButton runat="server" ID="btnAdd" Text="新增" Icon="Add" OnClientClick="addAction();" IsClient="true" />--%>
              <%--<asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" />--%>

            </div>
            <div>
                <table  id="tbEdit" class="grid" cellpadding="0" cellspacing="0" >
                    <tr>
                        <th style="width: 10%"></th>
<th style="width: 20%"></th>
<th style="width: 10%"></th>
<th style="width: 20%"></th>
<th style="width: 10%"></th>
<th style="width: 20%"></th>

                    </tr>
                        <tr>
                        <td class="lbl">职员</td>
<td><asp:ETextBox runat="server" ID ="txtName"  DataField="NAME" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">入职日期</td>
<td><asp:ETextBox runat="server" ID ="txtRzDate"  DataField="RZ_DATE" IsDate="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">离职/转岗日期</td>
<td><asp:ETextBox runat="server" ID ="txtLzDate"  DataField="LZ_DATE" IsDate="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">所属车间</td>
<td><asp:EChoose runat="server" ID ="txtSscj"  DataField="SSCJ" ECIType="MES_BD_DEPT" Width="85%"></asp:EChoose></td>
                        <td class="lbl">所属生产线</td>
<td><asp:EChoose runat="server" ID ="txtSscscx"  DataField="SSCSCX" ECIType="MES_BD_SCX" Width="85%"></asp:EChoose></td>
                        <td class="lbl">职务</td>
<td><asp:ETextBox runat="server" ID ="txtZw"  DataField="ZW" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">工种</td>
<td><asp:EChoose runat="server" ID ="txtGz"  DataField="GZ" ECIType="MES_BD_GZ" Width="85%"></asp:EChoose></td>
                        <td class="lbl">所属班组</td>
<td><asp:EChoose runat="server" ID ="txtSsbz"  DataField="SSBZ" ECIType="BZ" Width="85%"></asp:EChoose></td>
                        <td class="lbl">工种计件工资比例</td>
<td><asp:ETextBox runat="server" ID ="txtGzjjgzbl"  DataField="GZJJGZBL" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">备注</td>
<td><asp:ETextBox runat="server" ID ="txtRemark"  DataField="REMARK" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">&nbsp;</td><td>&nbsp;</td>
                        <td class="lbl">&nbsp;</td><td>&nbsp;</td>

               </tr>

                </table>
            </div>
        </div>
    </form>
</body>
</html>
