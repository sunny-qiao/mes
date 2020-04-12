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


public partial class AppMes_BaseData_frmMesBdGysGywlEdit : BasePage
{
    private string key
    {
        get { return this.hidKey.Value; }
        set { this.hidKey.Value = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

            if (!IsPostBack)
            {
                this.key = PageHelper.Request("key");

                if (this.key.HasValue())
                {
                    LoadRecord();
                }
			   else
               {
                  this.btnAdd.Enabled = false;
               }
            }
    }

    private void LoadRecord()
    {
            EciRequest request = new EciRequest(MESService.MesBdGysGywlLoad);
            request.Key = this.key;

            EciResponse response = SOA.Execute(request);

            MES_BD_GYS_GYWL data = response.DataTable.ToEntity<MES_BD_GYS_GYWL>();

            this.Bind(data);
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        EciRequest request = new EciRequest(MESService.MesBdGysGywlSave);

        request.IsAdd = this.key.NullOrEmpty();

        MES_BD_GYS_GYWL saveEntity = new MES_BD_GYS_GYWL();

        request.Entity = saveEntity;

        saveEntity.Data = this.GetEntityFromUI().Data;

        saveEntity.GUID = this.key;

        EciResponse response = SOA.Execute(request);

        MES_BD_GYS_GYWL data = response.Entity.Upgrade<MES_BD_GYS_GYWL>();

        if (request.IsAdd)
        {
            this.key = data.GUID;
 
            this.btnAdd.Enabled = true;

            //this.txtCreateDate.Text = DateTime.Now.ToFullString();
            //this.txtCreateUser.Text = this.UserInfo.UserName;

        }

        //this.txtUpdateDate.Text = DateTime.Now.ToFullString();
        //this.txtUpdateUser.Text = this.UserInfo.UserName;

        response.Message.Tip();
    }
}