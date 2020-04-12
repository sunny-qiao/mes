using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ECI.MES.ServiceList
{
    public partial class MESService
    {
        /// <summary>
        /// XXX:查询
        /// </summary>
        public const string MesBdZySearch = prex + "MesBdZySearch";

        /// <summary>
        /// XXX:加载
        /// </summary>
        public const string MesBdZyLoad = prex + "MesBdZyLoad";

        /// <summary>
        /// XXX:保存
        /// </summary>
        public const string MesBdZySave = prex + "MesBdZySave";

        /// <summary>
        /// XXX:删除
        /// </summary>
        public const string MesBdZyDelete = prex + "MesBdZyDelete";
        /// <summary>
        /// XXX:获取树
        /// </summary>
        public const string MesBdZyGetLower = prex + "MesBdZyGetLower";
    }
}
