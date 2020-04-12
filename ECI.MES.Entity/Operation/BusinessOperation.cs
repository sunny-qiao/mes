
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ECI.MES.Entity
{
    public class BusinessXXX
    {
        /// <summary>
        /// 是否可操作：包括【保存、删除、申请】
        /// </summary>
        /// <param name="status"></param>
        /// <returns></returns>
        public bool CanOperation(string status)
        {
            return status == "Y";
        }
    }
}
