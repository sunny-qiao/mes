using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ECI.MES.Entity
{
    public partial class BaseDataEnum
    {
        /// <summary>
        /// 职员状态
        /// </summary>
        public static class ZyStatus
        {
            /// <summary>
            /// 启用
            /// </summary>
            public static string QY = "QY";

            /// <summary>
            /// 离职
            /// </summary>
            public static string LZ = "LZ";

            /// <summary>
            /// 挂起
            /// </summary>
            public static string GQ = "GQ";
        }
    }
}

