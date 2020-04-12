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

public partial class AppMes_BaseData_frmMesBdZyEdit : BasePage
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
            cboStatus.InitItems();
            this.key = PageHelper.Request("key");

            if (this.key.HasValue())
            {
                LoadRecord();
            }
            else
            {
                LoadTab(null);
                this.btnAdd.Enabled = false;
            }
        }
    }
    private void LoadTab(MES_BD_ZY zy)
    {
        if (zy.IsNull())
        {
            tabZy.Visible = false;
        }
        else
        {
            tabStatus.Url = "frmMesBdZyStatusEdit.aspx?key=" + this.key + "&code=" + this.txtCode.Text.Trim();
            tabDoc.Url = "frmMesBdZyDocEdit.aspx?key=" + this.key + "&code=" + this.txtCode.Text.Trim();

        }

    }

    private void LoadRecord()
    {
            EciRequest request = new EciRequest(MESService.MesBdZyLoad);
            request.Key = this.key;

            EciResponse response = SOA.Execute(request);

            MES_BD_ZY data = response.DataTable.ToEntity<MES_BD_ZY>();

            this.Bind(data);
        LoadTab(data);

        hidPic1Path.Value = data.PIC1_PATH;
        hidPic1.Value = data.PIC1;
        hidPIC2Path.Value = data.PIC2_PATH;
        hidPIC2.Value = data.PIC2;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        EciRequest request = new EciRequest(MESService.MesBdZySave);

        request.IsAdd = this.key.NullOrEmpty();

        MES_BD_ZY saveEntity = new MES_BD_ZY();

        request.Entity = saveEntity;

        saveEntity.Data = this.GetEntityFromUI().Data;

        saveEntity.GUID = this.key;

        if (txtFileUpload.HasFile)
        {
            btnUpload_Click(sender, e);

            saveEntity.PIC1_PATH = this.hidPic1Path.Value;
            saveEntity.PIC1 = this.hidPic1.Value;
        }
        if (txtFileUpload2.HasFile)
        {
            btnUpload2_Click(sender, e);

            saveEntity.PIC2_PATH = this.hidPIC2Path.Value;
            saveEntity.PIC2 = this.hidPIC2.Value;
        }
        EciResponse response = SOA.Execute(request);

        MES_BD_ZY data = response.Entity.Upgrade<MES_BD_ZY>();

        if (request.IsAdd)
        {
            this.key = data.GUID;
 
            this.btnAdd.Enabled = true;
            HtmlWindow.Onload("eci.open('frmMesBdZyEditTab.aspx?key=" + this.key + "')");

        }
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

        string filePath = "~/Upload/Pic1/";
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
        this.hidPic1Path.Value = fileFullName;
        this.hidPic1.Value = fileName;
    }

    protected void btnUpload2_Click(object sender, EventArgs e)
    {
        string ext = System.IO.Path.GetExtension(txtFileUpload2.PostedFile.FileName).ToLower();
        //if (ext != ".pdf")
        //{
        //    throw new AppException("文件需为PDF格式");
        //}

        if (txtFileUpload2.FileContent.Length > 1024 * 200)
        {
            throw new AppException("请选择小于200K的文件上传");
        }

        string filePath = "~/Upload/PIC2/";
        string directoryPath = Server.MapPath(filePath);//转换为服务器路径

        if (!Directory.Exists(directoryPath))//不存在这个文件夹就创建这个文件夹 
        {
            Directory.CreateDirectory(directoryPath);
        }
        //string fileName = txtFileUpload2.FileName.Remove(txtFileUpload2.FileName.Length - 4) + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".pdf";
        string fileName = txtFileUpload2.FileName;
        string fileFullName = filePath + fileName;
        directoryPath += fileName;
        txtFileUpload2.PostedFile.SaveAs(directoryPath);
        this.hidPIC2Path.Value = fileFullName;
        this.hidPIC2.Value = fileName;
    }
}