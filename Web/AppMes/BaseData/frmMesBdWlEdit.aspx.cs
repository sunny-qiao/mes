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

public partial class AppMes_BaseData_frmMesBdWlEdit : BasePage
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
            cboWlsxCode.InitItems();
            cboIsSb.InitItems();
            cboStatus.InitItems();
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
            EciRequest request = new EciRequest(MESService.MesBdWlLoad);
            request.Key = this.key;

            EciResponse response = SOA.Execute(request);

            MES_BD_WL data = response.DataTable.ToEntity<MES_BD_WL>();

            this.Bind(data);
        hidPIC1Path.Value = data.PIC1_PATH;
        hidPIC1.Value = data.PIC1;
        hidPIC2Path.Value = data.PIC2_PATH;
        hidPIC2.Value = data.PIC2;
        hidPIC3Path.Value = data.PIC3_PATH;
        hidPIC3.Value = data.PIC3;
        hidPIC4Path.Value = data.PIC4_PATH;
        hidPIC4.Value = data.PIC4;
        hidPIC5Path.Value = data.PIC5_PATH;
        hidPIC5.Value = data.PIC5;
        hidPIC6Path.Value = data.PIC6_PATH;
        hidPIC6.Value = data.PIC6;
        hidPIC7Path.Value = data.PIC7_PATH;
        hidPIC7.Value = data.PIC7;
        hidPIC8Path.Value = data.PIC8_PATH;
        hidPIC8.Value = data.PIC8;
        hidPIC9Path.Value = data.PIC9_PATH;
        hidPIC9.Value = data.PIC9;
        hidPIC10Path.Value = data.PIC10_PATH;
        hidPIC10.Value = data.PIC10;
        hidFILE1Path.Value = data.FILE1_PATH;
        hidFILE1.Value = data.FILE1;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        EciRequest request = new EciRequest(MESService.MesBdWlSave);

        request.IsAdd = this.key.NullOrEmpty();

        MES_BD_WL saveEntity = new MES_BD_WL();

        request.Entity = saveEntity;

        saveEntity.Data = this.GetEntityFromUI().Data;

        saveEntity.GUID = this.key;
        if (txtFileUpload.HasFile)
        {
            btnUpload_Click(sender, e);

            saveEntity.PIC1_PATH = this.hidPIC1Path.Value;
            saveEntity.PIC1 = this.hidPIC1.Value;
        }
        if (txtFileUpload2.HasFile)
        {
            btnUpload2_Click(sender, e);

            saveEntity.PIC2_PATH = this.hidPIC2Path.Value;
            saveEntity.PIC2 = this.hidPIC2.Value;
        }
        if (txtFileUpload3.HasFile)
        {
            btnUpload3_Click(sender, e);

            saveEntity.PIC3_PATH = this.hidPIC3Path.Value;
            saveEntity.PIC3 = this.hidPIC3.Value;
        }
        if (txtFileUpload4.HasFile)
        {
            btnUpload4_Click(sender, e);

            saveEntity.PIC4_PATH = this.hidPIC4Path.Value;
            saveEntity.PIC4 = this.hidPIC4.Value;
        }
        if (txtFileUpload5.HasFile)
        {
            btnUpload5_Click(sender, e);

            saveEntity.PIC5_PATH = this.hidPIC5Path.Value;
            saveEntity.PIC5 = this.hidPIC5.Value;
        }
        if (txtFileUpload6.HasFile)
        {
            btnUpload6_Click(sender, e);

            saveEntity.PIC6_PATH = this.hidPIC6Path.Value;
            saveEntity.PIC6 = this.hidPIC6.Value;
        }
        if (txtFileUpload7.HasFile)
        {
            btnUpload7_Click(sender, e);

            saveEntity.PIC7_PATH = this.hidPIC7Path.Value;
            saveEntity.PIC7 = this.hidPIC7.Value;
        }
        if (txtFileUpload8.HasFile)
        {
            btnUpload8_Click(sender, e);

            saveEntity.PIC8_PATH = this.hidPIC8Path.Value;
            saveEntity.PIC8 = this.hidPIC8.Value;
        }
        if (txtFileUpload9.HasFile)
        {
            btnUpload9_Click(sender, e);

            saveEntity.PIC9_PATH = this.hidPIC9Path.Value;
            saveEntity.PIC9 = this.hidPIC9.Value;
        }
        if (txtFileUpload10.HasFile)
        {
            btnUpload10_Click(sender, e);

            saveEntity.PIC10_PATH = this.hidPIC10Path.Value;
            saveEntity.PIC10 = this.hidPIC10.Value;
        }
        if (txtFileUpload11.HasFile)
        {
            btnUpload11_Click(sender, e);

            saveEntity.FILE1_PATH = this.hidFILE1Path.Value;
            saveEntity.FILE1 = this.hidFILE1.Value;
        }
        EciResponse response = SOA.Execute(request);

        MES_BD_WL data = response.Entity.Upgrade<MES_BD_WL>();

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

        string filePath = "~/Upload/cpPIC1/";
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
        this.hidPIC1Path.Value = fileFullName;
        this.hidPIC1.Value = fileName;
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

        string filePath = "~/Upload/cpPIC2/";
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
    protected void btnUpload3_Click(object sender, EventArgs e)
    {
        string ext = System.IO.Path.GetExtension(txtFileUpload3.PostedFile.FileName).ToLower();
        //if (ext != ".pdf")
        //{
        //    throw new AppException("文件需为PDF格式");
        //}

        if (txtFileUpload3.FileContent.Length > 1024 * 200)
        {
            throw new AppException("请选择小于200K的文件上传");
        }

        string filePath = "~/Upload/cpPIC3/";
        string directoryPath = Server.MapPath(filePath);//转换为服务器路径

        if (!Directory.Exists(directoryPath))//不存在这个文件夹就创建这个文件夹 
        {
            Directory.CreateDirectory(directoryPath);
        }
        //string fileName = txtFileUpload3.FileName.Remove(txtFileUpload3.FileName.Length - 4) + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".pdf";
        string fileName = txtFileUpload3.FileName;
        string fileFullName = filePath + fileName;
        directoryPath += fileName;
        txtFileUpload3.PostedFile.SaveAs(directoryPath);
        this.hidPIC3Path.Value = fileFullName;
        this.hidPIC3.Value = fileName;
    }

    protected void btnUpload4_Click(object sender, EventArgs e)
    {
        string ext = System.IO.Path.GetExtension(txtFileUpload4.PostedFile.FileName).ToLower();
        //if (ext != ".pdf")
        //{
        //    throw new AppException("文件需为PDF格式");
        //}

        if (txtFileUpload4.FileContent.Length > 1024 * 200)
        {
            throw new AppException("请选择小于200K的文件上传");
        }

        string filePath = "~/Upload/cpPIC4/";
        string directoryPath = Server.MapPath(filePath);//转换为服务器路径

        if (!Directory.Exists(directoryPath))//不存在这个文件夹就创建这个文件夹 
        {
            Directory.CreateDirectory(directoryPath);
        }
        //string fileName = txtFileUpload4.FileName.Remove(txtFileUpload4.FileName.Length - 4) + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".pdf";
        string fileName = txtFileUpload4.FileName;
        string fileFullName = filePath + fileName;
        directoryPath += fileName;
        txtFileUpload4.PostedFile.SaveAs(directoryPath);
        this.hidPIC4Path.Value = fileFullName;
        this.hidPIC4.Value = fileName;
    }
    protected void btnUpload5_Click(object sender, EventArgs e)
    {
        string ext = System.IO.Path.GetExtension(txtFileUpload5.PostedFile.FileName).ToLower();
        //if (ext != ".pdf")
        //{
        //    throw new AppException("文件需为PDF格式");
        //}

        if (txtFileUpload5.FileContent.Length > 1024 * 200)
        {
            throw new AppException("请选择小于200K的文件上传");
        }

        string filePath = "~/Upload/cpPIC5/";
        string directoryPath = Server.MapPath(filePath);//转换为服务器路径

        if (!Directory.Exists(directoryPath))//不存在这个文件夹就创建这个文件夹 
        {
            Directory.CreateDirectory(directoryPath);
        }
        //string fileName = txtFileUpload5.FileName.Remove(txtFileUpload5.FileName.Length - 4) + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".pdf";
        string fileName = txtFileUpload5.FileName;
        string fileFullName = filePath + fileName;
        directoryPath += fileName;
        txtFileUpload5.PostedFile.SaveAs(directoryPath);
        this.hidPIC5Path.Value = fileFullName;
        this.hidPIC5.Value = fileName;
    }

    protected void btnUpload6_Click(object sender, EventArgs e)
    {
        string ext = System.IO.Path.GetExtension(txtFileUpload6.PostedFile.FileName).ToLower();
        //if (ext != ".pdf")
        //{
        //    throw new AppException("文件需为PDF格式");
        //}

        if (txtFileUpload6.FileContent.Length > 1024 * 200)
        {
            throw new AppException("请选择小于200K的文件上传");
        }

        string filePath = "~/Upload/cpPIC6/";
        string directoryPath = Server.MapPath(filePath);//转换为服务器路径

        if (!Directory.Exists(directoryPath))//不存在这个文件夹就创建这个文件夹 
        {
            Directory.CreateDirectory(directoryPath);
        }
        //string fileName = txtFileUpload6.FileName.Remove(txtFileUpload6.FileName.Length - 4) + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".pdf";
        string fileName = txtFileUpload6.FileName;
        string fileFullName = filePath + fileName;
        directoryPath += fileName;
        txtFileUpload6.PostedFile.SaveAs(directoryPath);
        this.hidPIC6Path.Value = fileFullName;
        this.hidPIC6.Value = fileName;
    }
    protected void btnUpload7_Click(object sender, EventArgs e)
    {
        string ext = System.IO.Path.GetExtension(txtFileUpload7.PostedFile.FileName).ToLower();
        //if (ext != ".pdf")
        //{
        //    throw new AppException("文件需为PDF格式");
        //}

        if (txtFileUpload7.FileContent.Length > 1024 * 200)
        {
            throw new AppException("请选择小于200K的文件上传");
        }

        string filePath = "~/Upload/cpPIC7/";
        string directoryPath = Server.MapPath(filePath);//转换为服务器路径

        if (!Directory.Exists(directoryPath))//不存在这个文件夹就创建这个文件夹 
        {
            Directory.CreateDirectory(directoryPath);
        }
        //string fileName = txtFileUpload7.FileName.Remove(txtFileUpload7.FileName.Length - 4) + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".pdf";
        string fileName = txtFileUpload7.FileName;
        string fileFullName = filePath + fileName;
        directoryPath += fileName;
        txtFileUpload7.PostedFile.SaveAs(directoryPath);
        this.hidPIC7Path.Value = fileFullName;
        this.hidPIC7.Value = fileName;
    }

    protected void btnUpload8_Click(object sender, EventArgs e)
    {
        string ext = System.IO.Path.GetExtension(txtFileUpload8.PostedFile.FileName).ToLower();
        //if (ext != ".pdf")
        //{
        //    throw new AppException("文件需为PDF格式");
        //}

        if (txtFileUpload8.FileContent.Length > 1024 * 200)
        {
            throw new AppException("请选择小于200K的文件上传");
        }

        string filePath = "~/Upload/cpPIC8/";
        string directoryPath = Server.MapPath(filePath);//转换为服务器路径

        if (!Directory.Exists(directoryPath))//不存在这个文件夹就创建这个文件夹 
        {
            Directory.CreateDirectory(directoryPath);
        }
        //string fileName = txtFileUpload8.FileName.Remove(txtFileUpload8.FileName.Length - 4) + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".pdf";
        string fileName = txtFileUpload8.FileName;
        string fileFullName = filePath + fileName;
        directoryPath += fileName;
        txtFileUpload8.PostedFile.SaveAs(directoryPath);
        this.hidPIC8Path.Value = fileFullName;
        this.hidPIC8.Value = fileName;
    }
    protected void btnUpload9_Click(object sender, EventArgs e)
    {
        string ext = System.IO.Path.GetExtension(txtFileUpload9.PostedFile.FileName).ToLower();
        //if (ext != ".pdf")
        //{
        //    throw new AppException("文件需为PDF格式");
        //}

        if (txtFileUpload9.FileContent.Length > 1024 * 200)
        {
            throw new AppException("请选择小于200K的文件上传");
        }

        string filePath = "~/Upload/cpPIC9/";
        string directoryPath = Server.MapPath(filePath);//转换为服务器路径

        if (!Directory.Exists(directoryPath))//不存在这个文件夹就创建这个文件夹 
        {
            Directory.CreateDirectory(directoryPath);
        }
        //string fileName = txtFileUpload9.FileName.Remove(txtFileUpload9.FileName.Length - 4) + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".pdf";
        string fileName = txtFileUpload9.FileName;
        string fileFullName = filePath + fileName;
        directoryPath += fileName;
        txtFileUpload9.PostedFile.SaveAs(directoryPath);
        this.hidPIC9Path.Value = fileFullName;
        this.hidPIC9.Value = fileName;
    }

    protected void btnUpload10_Click(object sender, EventArgs e)
    {
        string ext = System.IO.Path.GetExtension(txtFileUpload10.PostedFile.FileName).ToLower();
        //if (ext != ".pdf")
        //{
        //    throw new AppException("文件需为PDF格式");
        //}

        if (txtFileUpload10.FileContent.Length > 1024 * 200)
        {
            throw new AppException("请选择小于200K的文件上传");
        }

        string filePath = "~/Upload/cpPIC10/";
        string directoryPath = Server.MapPath(filePath);//转换为服务器路径

        if (!Directory.Exists(directoryPath))//不存在这个文件夹就创建这个文件夹 
        {
            Directory.CreateDirectory(directoryPath);
        }
        //string fileName = txtFileUpload10.FileName.Remove(txtFileUpload10.FileName.Length - 4) + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".pdf";
        string fileName = txtFileUpload10.FileName;
        string fileFullName = filePath + fileName;
        directoryPath += fileName;
        txtFileUpload10.PostedFile.SaveAs(directoryPath);
        this.hidPIC10Path.Value = fileFullName;
        this.hidPIC10.Value = fileName;
    }

    protected void btnUpload11_Click(object sender, EventArgs e)
    {
        string ext = System.IO.Path.GetExtension(txtFileUpload11.PostedFile.FileName).ToLower();
        //if (ext != ".pdf")
        //{
        //    throw new AppException("文件需为PDF格式");
        //}

        if (txtFileUpload11.FileContent.Length > 1024 * 200)
        {
            throw new AppException("请选择小于200K的文件上传");
        }

        string filePath = "~/Upload/CpFile1/";
        string directoryPath = Server.MapPath(filePath);//转换为服务器路径

        if (!Directory.Exists(directoryPath))//不存在这个文件夹就创建这个文件夹 
        {
            Directory.CreateDirectory(directoryPath);
        }
        //string fileName = txtFileUpload11.FileName.Remove(txtFileUpload11.FileName.Length - 4) + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".pdf";
        string fileName = txtFileUpload11.FileName;
        string fileFullName = filePath + fileName;
        directoryPath += fileName;
        txtFileUpload11.PostedFile.SaveAs(directoryPath);
        this.hidFILE1Path.Value = fileFullName;
        this.hidFILE1.Value = fileName;
    }

}