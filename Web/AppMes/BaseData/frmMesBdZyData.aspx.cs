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
        item.TEL = PageHelper.Request(MES_BD_ZY.Fields.TEL);
        item.ID_CARD = PageHelper.Request(MES_BD_ZY.Fields.ID_CARD);
        item.KHYH = PageHelper.Request(MES_BD_ZY.Fields.KHYH);
        item.KHM = PageHelper.Request(MES_BD_ZY.Fields.KHM);
        item.BANK = PageHelper.Request(MES_BD_ZY.Fields.BANK);
        item.WHCD = PageHelper.Request(MES_BD_ZY.Fields.WHCD);
        item.BYXX = PageHelper.Request(MES_BD_ZY.Fields.BYXX);
        item.BYZY = PageHelper.Request(MES_BD_ZY.Fields.BYZY);
        item.BYNF = PageHelper.Request(MES_BD_ZY.Fields.BYNF);
        item.PROVINCE = PageHelper.Request(MES_BD_ZY.Fields.PROVINCE);
        item.CITY = PageHelper.Request(MES_BD_ZY.Fields.CITY);
        item.ADDRESS = PageHelper.Request(MES_BD_ZY.Fields.ADDRESS);
        item.MAIL = PageHelper.Request(MES_BD_ZY.Fields.MAIL);
        item.REMARK = PageHelper.Request(MES_BD_ZY.Fields.REMARK);
        item.JS1 = PageHelper.Request(MES_BD_ZY.Fields.JS1);
        item.JS1_RELATION = PageHelper.Request(MES_BD_ZY.Fields.JS1_RELATION);
        item.JS1_TEL = PageHelper.Request(MES_BD_ZY.Fields.JS1_TEL);
        item.JS1_ADDRESS = PageHelper.Request(MES_BD_ZY.Fields.JS1_ADDRESS);
        item.JS2 = PageHelper.Request(MES_BD_ZY.Fields.JS2);
        item.JS2_RELATION = PageHelper.Request(MES_BD_ZY.Fields.JS2_RELATION);
        item.JS2_TEL = PageHelper.Request(MES_BD_ZY.Fields.JS2_TEL);
        item.JS2_ADDRESS = PageHelper.Request(MES_BD_ZY.Fields.JS2_ADDRESS);
        item.JS3 = PageHelper.Request(MES_BD_ZY.Fields.JS3);
        item.JS3_RELATION = PageHelper.Request(MES_BD_ZY.Fields.JS3_RELATION);
        item.JS3_TEL = PageHelper.Request(MES_BD_ZY.Fields.JS3_TEL);
        item.JS3_ADDRESS = PageHelper.Request(MES_BD_ZY.Fields.JS3_ADDRESS);
        item.JS4 = PageHelper.Request(MES_BD_ZY.Fields.JS4);
        item.JS4_RELATION = PageHelper.Request(MES_BD_ZY.Fields.JS4_RELATION);
        item.JS4_TEL = PageHelper.Request(MES_BD_ZY.Fields.JS4_TEL);
        item.JS4_ADDRESS = PageHelper.Request(MES_BD_ZY.Fields.JS4_ADDRESS);
        item.CAR_NO = PageHelper.Request(MES_BD_ZY.Fields.CAR_NO);
        item.CAR_TYPE = PageHelper.Request(MES_BD_ZY.Fields.CAR_TYPE);
        item.PIC1 = PageHelper.Request(MES_BD_ZY.Fields.PIC1);
        item.PIC1_PATH = PageHelper.Request(MES_BD_ZY.Fields.PIC1_PATH);

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


