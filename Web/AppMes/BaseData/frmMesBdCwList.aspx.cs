using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using PL.Base;
using PL.UI.Controls;
using ECI.MES.ServiceList;
using ECI.MES.Entity;
using ECI.MES.UI;

public partial class AppMes_BaseData_frmMesBdCwList : QueryPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

         if (!IsPostBack)
         {

         }

    }

    public override void QuerySetting(EciRequest request)
    {
        request.ServiceId = MESService.MesBdCwSearch;
 
        request.Entity = new EntityBase();
        request.Entity.GetBindingData();
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
           Button btn = sender as Button;
           string key = btn.CommandArgument;

            EciRequest request = new EciRequest(MESService.MesBdCwDelete);

            request.ListKey = new List<string>() { key };

            SOA.Execute(request);

            EAlert.Tip("删除执行成功");

            this.Search();
    }
}