using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PL.Base;
using System.Data;
using ECI.Speed.Entity;
using System.Threading;
using ECI.MES.ServiceList;
using ECI.MES.Entity;
using ECI.MES.UI;

public partial class AppMes_BaseData_frmMesBdZyData : BasePage
{
    public override bool CheckLogin()
    {
        return false;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        string type = PageHelper.Request("type");

        if (type == "load" && PageHelper.Request("id").NullOrEmpty())
        {
            string content = GetRootJson();
            Response.Write(content);
            Response.End();
        }
        else if (type == "load")
        {
            string id = PageHelper.Request("id");

            EciRequest request = new EciRequest(MESService.MesBdZyGetLower);
            request["ID"] = id;

            EciResponse response = SOA.Execute(request);
            DataTable data = response.DataTable;

            string content = data.ToJson(true);

            Response.Write(content);

            Response.End();
        }
    }

    public string GetRootJson()
    {
        EciRequest request = new EciRequest(MESService.MesBdZyLoad);
        request.Type = "GetRoot";

        EciResponse response = SOA.Execute(request);
        DataTable dataResponse = response.DataTable;

        DataTable data = DataTableHelper.Create("ID,PARENTID,TEXT,STATE,TAG", 1).DataTable;

        data.Rows[0]["ID"] = dataResponse.Rows[0]["GUID"];
        data.Rows[0]["TEXT"] = dataResponse.Rows[0]["NAME"];
        data.Rows[0]["STATE"] = "closed";

        EntityBase entity = data.ToEntity();
        entity.JsonKeyIsLower = true;
        entity.Attributes = new EntityBase();
        entity.Attributes["root"] = "true";

        List<EntityBase> list = new List<EntityBase>();
        list.Add(entity);

        string content = list.ToJson(true);

        return content;
    }


    public void LoadRecord(EciResponse ajax)
    {
        string id = PageHelper.Request("id");

        EciRequest request = new EciRequest(MESService.MesBdZyLoad);
        request.Key = id;
        DataTable data = SOA.Execute(request).DataTable;

        ajax.Data = data.ToEntity().Data;
    }


    public void Save(EciResponse ajax)
    {
        MES_BD_ZY item = new MES_BD_ZY();

        item.GUID = PageHelper.Request(MES_BD_ZY.Fields.GUID);
        item.GH = PageHelper.Request(MES_BD_ZY.Fields.GH);
        item.NAME = PageHelper.Request(MES_BD_ZY.Fields.NAME);
        item.CODE = PageHelper.Request(MES_BD_ZY.Fields.CODE);
        item.STATUS = PageHelper.Request(MES_BD_ZY.Fields.STATUS);

        EciRequest request = new EciRequest(MESService.MesBdZySave);
        request.Entity = item;
        request.IsAdd = PageHelper.Request("FLAG") == "Add";

        if (request.IsAdd)
        {
            item.PARENTID = PageHelper.Request(MES_BD_ZY.Fields.PARENTID);
            request.Type = "tree";
        }

        EciResponse response = SOA.Execute(request);

        ajax.Data = response.Data;
    }


    public void Delete(EciResponse ajax)
    {
        string key = PageHelper.Request("id");

        EciRequest request = new EciRequest(MESService.MesBdZyDelete);
        request.ListKey = key.ToList();

        SOA.Execute(request);

        ajax.Message = "删除成功！";
    }
}


