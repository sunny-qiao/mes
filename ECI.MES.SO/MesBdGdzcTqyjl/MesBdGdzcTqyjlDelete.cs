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
    public  class MesBdGdzcTqyjlDelete : BaseSO
    {
       public override void Execute(EciContext context)
        {
            this.ServiceId = MESService.MesBdGdzcTqyjlDelete;

            List<string> listKey = context.Request.ListKey;

            MesBdGdzcTqyjlBLL.Instance.Delete(context.BLLContext,context.Request.ListKey);

            context.Response.Message = "删除成功";
        }
    }
}