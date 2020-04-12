<%@ WebHandler Language="C#" Class="handlerZyData" %>

using System;
using System.Web;
using PL.Base;
using System.Collections.Generic;
using ECI.MES.ServiceList;
using ECI.MES.Entity;
using ServiceStack.Common.Extensions;
using PL.Base.Common;

public class handlerZyData : BaseHandler
{
    /// <summary>
    /// 获取服务项目树
    /// </summary>
    /// <param name="ajax"></param>
    public void GetZyTree(EciResponse ajax)
    {
        ajax.OnlyJson = true;

        List<EntityBase> treeData = new List<EntityBase>();
        EciRequest request = new EciRequest(MESService.MesBdZySearch);
        request.Paging = new Paging()
        {
            Index = 1,
            Size = int.MaxValue,
            SortExpression = "A.GH"
        };
        request.Entity = new EntityBase();
        request.Entity.AddCommonQuerySetting("PARENT_GUID", "A.PARENT_GUID|string|=", "0");
        List<MES_BD_ZY> parent = SOA.Execute(request).DataTable.ToListEntity<MES_BD_ZY>();

        List<MES_BD_ZY> sun = GetAllZyItem();
        EntityBase treeNode;
        foreach (var item in parent)
        {
            treeNode = new EntityBase();
            treeNode["id"] = item.GUID;
            treeNode["text"] = item.NAME;
            treeNode.Children = AddTreeNode(item.GUID, sun);
            treeData.Add(treeNode);
        }

        ajax.Json = treeData.ToJson(true).ReplaceAll("\"true\"", "true").ReplaceAll("\"false\"", "false");
    }

    /// <summary>
    /// 服务树节点加载
    /// </summary>
    /// <param name="parentGuid">父节点Id</param>
    /// <param name="zy">所有职员</param>
    /// <returns></returns>
    public List<EntityBase> AddTreeNode(string parentGuid, List<MES_BD_ZY> zy)
    {
        List<EntityBase> treeNode = new List<EntityBase>();

        List<MES_BD_ZY> findItem = zy.FindAll(x => x.GUID == parentGuid);//PARENTID
        if (findItem.Count > 0)
        {
            EntityBase node;
            foreach (var item in findItem)
            {
                node = new EntityBase();
                node["id"] = item.GUID;
                node["text"] = item.NAME;
                //node["checked"] = zy.Exists(x => x.CODE == item.CODE).ToString().ToLower();
                node.Children = AddTreeNode(item.GUID, zy);
                treeNode.Add(node);
            }
        }

        return treeNode;
    }

    /// <summary>
    /// 获取所有职员
    /// </summary>
    /// <returns></returns>
    private List<MES_BD_ZY> GetAllZyItem()
    {
        EciRequest request = new EciRequest(MESService.MesBdZySearch);
        request.Paging = new Paging { Index = 1, Size = int.MaxValue, SortExpression = "A.GH" };
        request.Entity = new EntityBase();
        //request.Entity.AddCommonQuerySetting("STATUS", "A.STATUS|string|=", CommonData.YNStatus.Y);
        return request.Execute().DataTable.ToListEntity<MES_BD_ZY>();
    }

    public void SaveServiceItem(EciResponse ajax)
    {
        ajax.Success = true;
        try
        {
            var dataStr = PageHelper.Request("saveData");

            EciRequest request = new EciRequest(MESService.MesBdZySearch);//MesBdZySelect
            request.ListKey = new List<string>();
            if (!dataStr.NullOrEmpty())
            {
                request.ListKey = dataStr.Trim().Split(',').ToList<string>();
            }
            SOA.Execute(request);
            //ajax["IsSuccess"] = CommonData.YNStatus.Y;
        }
        catch (Exception ex)
        {
            //ajax["IsSuccess"] = CommonData.YNStatus.N;
            ajax.Message = ex.Message;
        }
    }

    public void ServiceItemTreeLoad(EciResponse ajax)
    {
        ajax.Success = true;

        string id = PageHelper.Request("id");

        List<EntityBase> data = new List<EntityBase>();

        if (id.NullOrEmpty())
        {
            //List<FZGJ_BD_SERVICE_TYPE> serviceType = GetServiceType();
            //foreach (var item in serviceType)
            //{
            //    EntityBase itemData = new EntityBase();
            //    itemData["id"] = item.GUID;
            //    itemData["text"] = item.NAME;
            //    itemData["state"] = "closed";
            //    itemData["code"] = item.CODE;
            //    data.Add(itemData);
            //}
        }
        else
        {
            List<MES_BD_ZY> serviceType = GetServiceItemByParentId(id);
            foreach (var item in serviceType)
            {
                EntityBase itemData = new EntityBase();
                itemData["id"] = item.GUID;
                itemData["text"] = item.NAME;
                itemData["code"] = item.CODE;
                itemData["state"] = "closed";
                data.Add(itemData);
            }
        }

        ajax.Json = data.ToJson(true);
        ajax.OnlyJson = true;
    }


    public List<MES_BD_ZY> GetServiceItemByParentId(string id)
    {
        EciRequest request = new EciRequest();
        request.Paging = new Paging() { Index = 1, Size = int.MaxValue, SortExpression = "A.GH" };
        request.Entity = new EntityBase();
        request.ServiceId = MESService.MesBdZySearch;
        //request.Entity.AddCommonQuerySetting("STATUS", "A.STATUS|string|=", CommonData.YNStatus.Y);
        request.Entity.AddCommonQuerySetting("PARENTID", "A.PARENTID|string|=", id);
        return SOA.Execute(request).DataTable.ToListEntity<MES_BD_ZY>();
    }


}