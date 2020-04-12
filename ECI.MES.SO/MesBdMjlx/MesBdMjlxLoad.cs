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
    public  class MesBdMjlxLoad : BaseSO
    {
        public override void Execute(EciContext context)
        {
            this.ServiceId = MESService.MesBdMjlxLoad;

            context.Response.DataTable = MesBdMjlxBLL.Instance.Load(context.BLLContext,context.Request.Key);
        }
    }
}