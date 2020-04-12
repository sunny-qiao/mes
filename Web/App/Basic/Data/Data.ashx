<%@ WebHandler Language="C#" Class="Basic_Data_Data" %>

using System;
using System.Web;
using PL.Base;
using ECI.Speed.Client;
using ECI.Speed.Web;

public class Basic_Data_Data : BaseHandler
{
    public void Publish(EciResponse ajax)
    {
        EciDevClient T = new EciDevClient();
        EciResponse response = T.TxDownloadEciTable();
        int count = response["count"].ToInt();

        MetaData.Clear();

        if (count == 0)
        {
            ajax.Message = "当前已经是最新版本";
        }
        else
        {
            ajax.Message = count + "个程序发布成功";
        }
    }

    public void PublishAll(EciResponse ajax)
    {
        EciDevClient T = new EciDevClient();
        EciResponse response = T.TxDownloadEciTableAll();

        int count = response["count"].ToInt();

        ajax.Message = count + "个程序发布成功";
    }

    public void TxDeleteEciTable(EciResponse ajax)
    {
        EciRequest request = new EciRequest("PT.TxDeleteEciTable");
        request.Data = SOA.FormKeyToEntity().Data;
        ajax = request.Execute();
    }


    //复制程序
    public void CopyTable(EciResponse ajax)
    {
        string pageCode = PageHelper.Request("pageCode").ToUpper();
        string newPageCode = PageHelper.Request("newPageCode").ToUpper();


        EciRequest request = new EciRequest(SpeedServiceList.EciTableCopy);
        request["PAGE_CODE"] = pageCode;
        request["NEW_PAGE_CODE"] = newPageCode;

        EciResponse response = SOA.Execute(request);

        string guid = response["GUID"];

        ajax.Data["guid"] = guid;
    }



    public void CopyField(EciResponse ajax)
    {
        string tableGuid = PageHelper.Request("tableGuid");
        string guid = PageHelper.Request("guid");


        EciRequest request = new EciRequest(SpeedServiceList.EciElementCopy);
        request["key"] = guid;
        request["tableGuid"] = tableGuid;

        Msg.Alert("复制成功", true);
    }

    public void DeleteField(EciResponse ajax)
    {
        string keys = PageHelper.Request("keys");

        EciRequest request = new EciRequest(SpeedServiceList.EciTableElement, CurdType.Delete);
        request.ListKey = keys.ToList();

        SOA.Execute(request);

        //DictionaryEditPage.Reload(this.txtCode.Text);
    }
}