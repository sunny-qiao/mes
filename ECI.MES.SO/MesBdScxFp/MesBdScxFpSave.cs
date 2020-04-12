using PL.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using ECI.MES.BLL;
using ECI.MES.ServiceList;

namespace ECI.MES.SO
{
    public  class MesBdScxFpSave : BaseSO
     {
       public override void Execute(EciContext context)
        {
            this.ServiceId = MESService.MesBdScxFpSave;

            EntityBase saveEntity = context.Request.Entity;
            bool isAdd = context.Request.IsAdd;

            context.Response.Entity =MesBdScxFpBLL.Instance.Save(context.BLLContext,saveEntity,isAdd);

            context.Response.Message =isAdd? "新增成功":"修改成功";
           
        }
    }
}