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
using System.IO;

public partial class AppMes_BaseData_frmMesBdSbEdit : BasePage
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
            EciRequest request = new EciRequest(MESService.MesBdSbLoad);
            request.Key = this.key;

            EciResponse response = SOA.Execute(request);

            MES_BD_SB data = response.DataTable.ToEntity<MES_BD_SB>();

            this.Bind(data);
        hidPICPath.Value = data.PIC_PATH;
        hidPIC.Value = data.PIC;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        EciRequest request = new EciRequest(MESService.MesBdSbSave);

        request.IsAdd = this.key.NullOrEmpty();

        MES_BD_SB saveEntity = new MES_BD_SB();

        request.Entity = saveEntity;

        saveEntity.Data = this.GetEntityFromUI().Data;

        saveEntity.GUID = this.key;
        if (txtFileUpload.HasFile)
        {
            btnUpload_Click(sender, e);

            saveEntity.PIC_PATH = this.hidPICPath.Value;
            saveEntity.PIC = this.hidPIC.Value;
        }
        EciResponse response = SOA.Execute(request);

        MES_BD_SB data = response.Entity.Upgrade<MES_BD_SB>();

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
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        string ext = System.IO.Path.GetExtension(txtFileUpload.PostedFile.FileName).ToLower();
        //if (ext != ".pdf")
        //{
        //    throw new AppException("文件需为PDF格式");
        //}

        if (txtFileUpload.FileContent.Length > 1024 * 200)
        {
            throw new AppException("请选择小于200K的文件上传");
        }

        string filePath = "~/Upload/sbPIC/";
        string directoryPath = Server.MapPath(filePath);//转换为服务器路径

        if (!Directory.Exists(directoryPath))//不存在这个文件夹就创建这个文件夹 
        {
            Directory.CreateDirectory(directoryPath);
        }
        //string fileName = txtFileUpload.FileName.Remove(txtFileUpload.FileName.Length - 4) + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".pdf";
        string fileName = txtFileUpload.FileName;
        string fileFullName = filePath + fileName;
        directoryPath += fileName;
        txtFileUpload.PostedFile.SaveAs(directoryPath);
        this.hidPICPath.Value = fileFullName;
        this.hidPIC.Value = fileName;
    }
}