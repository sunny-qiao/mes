<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMesBdGysEdit.aspx.cs" Inherits="AppMes_BaseData_frmMesBdGysEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>供应商/客户维护</title>
    <link href="../../Themes/Default/eci.css" rel="stylesheet" />
    <!-- #include File="../../App/Common/PageLoad.aspx" -->
    <script type="text/javascript">
         
       function addAction() {

            if(eci.hasSave())
            {
               var url = "frmMesBdGysEdit.aspx";

                window.location.href=url;
             }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hidKey" runat="server" />


        <div id="root">
              
           <asp:ETitle runat="server" ID="pagetitle" Title="供应商/客户维护"></asp:ETitle>

            <div id="toolbar" class="toolbar">
              <asp:EButton runat="server" ID="btnSave" Text="保存" NeedCheck="true" ValidateId="tbEdit" OnClick="btnSave_Click" Icon="save" />
              <asp:EButton runat="server" ID="btnAdd" Text="新增" Icon="Add" OnClientClick="addAction();" IsClient="true" />
              <asp:EButton runat="server" IsClient="true" ID="btnClose" Text="关闭" Icon="close" OnClientClick="eci.close();" />

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
                        <td class="lbl">供应商/客户编号</td>
<td><asp:ETextBox runat="server" ID ="txtBh"  DataField="BH" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">供应商/客户名</td>
<td><asp:ETextBox runat="server" ID ="txtName"  DataField="NAME" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">供应商/客户全名</td>
<td><asp:ETextBox runat="server" ID ="txtFullName"  DataField="FULL_NAME" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">联系人1</td>
<td><asp:ETextBox runat="server" ID ="txtLxr1"  DataField="LXR1" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">联系电话1</td>
<td><asp:ETextBox runat="server" ID ="txtLxdh1"  DataField="LXDH1" IsNum="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">联系人2</td>
<td><asp:ETextBox runat="server" ID ="txtLxr2"  DataField="LXR2" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">联系电话2</td>
<td><asp:ETextBox runat="server" ID ="txtLxdh2"  DataField="LXDH2" IsNum="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">联系人3</td>
<td><asp:ETextBox runat="server" ID ="txtLxr3"  DataField="LXR3" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">联系电话3</td>
<td><asp:ETextBox runat="server" ID ="txtLxdh3"  DataField="LXDH3" IsNum="true" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">联系人4</td>
<td><asp:ETextBox runat="server" ID ="txtLxr4"  DataField="LXR4" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">联系电话4</td>
<td><asp:ETextBox runat="server" ID ="txtLxdh4"  DataField="LXDH4" IsNum="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">联系人5</td>
<td><asp:ETextBox runat="server" ID ="txtLxr5"  DataField="LXR5" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">联系电话5</td>
<td><asp:ETextBox runat="server" ID ="txtLxdh5"  DataField="LXDH5" IsNum="true" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">税率(%)</td>
<td><asp:ETextBox runat="server" ID ="txtRate"  DataField="RATE" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">所属国家</td>
<td><asp:ETextBox runat="server" ID ="txtCountry"  DataField="COUNTRY" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">所属省份</td>
<td><asp:ETextBox runat="server" ID ="txtProvince"  DataField="PROVINCE" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">所属城市</td>
<td><asp:ETextBox runat="server" ID ="txtCity"  DataField="CITY" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">地址</td>
<td><asp:ETextBox runat="server" ID ="txtAddress"  DataField="ADDRESS" Width="85%"></asp:ETextBox></td>

               </tr>
   <tr>
                        <td class="lbl">是否启用限额</td>
<td><asp:ECombox runat="server" ID ="cboIsQyxe"  DataField="IS_QYXE" AddEmpty="true" ECIType="ISUSE" Width="85%"></asp:ECombox></td>
                        <td class="lbl">限额(应收款限额为正,应付款限额为负)</td>
<td><asp:ETextBox runat="server" ID ="txtXe"  DataField="XE" Width="85%"></asp:ETextBox></td>
                        <td class="lbl">备注</td>
<td><asp:ETextBox runat="server" ID ="txtRemark"  DataField="REMARK" Width="85%"></asp:ETextBox></td>

               </tr>

                </table>
            </div>
        </div>
    </form>
</body>
</html>
