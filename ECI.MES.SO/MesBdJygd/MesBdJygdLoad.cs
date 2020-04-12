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
    public  class MesBdJygdLoad : BaseSO
    {
        public override void Execute(EciContext context)
        {
            this.ServiceId = MESService.MesBdJygdLoad;

            context.Response.DataTable = MesBdJygdBLL.Instance.Load(context.BLLContext,context.Request.Key);
        }
    }
}