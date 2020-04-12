#pragma warning disable  1591
using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using PL.Server.Entity;
using PL.Server.Entity.Entity;
 
namespace ECI.MES.Entity
{
    public partial class MES_BD_GDZC_ZJFFT : EntityBase
	{
	     public MES_BD_GDZC_ZJFFT()
		 {
		    base.Table = new TableInfo { Name = "MES_BD_GDZC_ZJFFT" };
		    base.Columns = MES_BD_GDZC_ZJFFT_COLUMN.Instance;
			this.Init();
		 }
		
		public MES_BD_GDZC_ZJFFT(string keyField):this()
        {
            base.KeyField =  keyField;
        }

	public MES_BD_GDZC_ZJFFT(string keyField,string keyValue):this()
        {
            base.KeyField =  keyField;
            this[keyField]= keyValue;
        }
		
		
        public MES_BD_GDZC_ZJFFT(EntityBase entityBase)
            : this()
        {
            this.Data = entityBase.Data;
        }
 
		#region DataMember
		
                                                     /// <summary>
                    ///  
                    /// </summary>
                    public string GUID
                    {
                        get
                        {
                            return this.TextAccess["GUID"];
                        }
                        set
                        {
                            this.TextAccess["GUID"] = value;
                        }
                    }
                    /// <summary>
                    ///  MES_BD_GDZC
                    /// </summary>
                    public string FGUID
                    {
                        get
                        {
                            return this.TextAccess["FGUID"];
                        }
                        set
                        {
                            this.TextAccess["FGUID"] = value;
                        }
                    }
                    /// <summary>
                    ///  编码(折旧年号)
                    /// </summary>
                    public string BH
                    {
                        get
                        {
                            return this.TextAccess["BH"];
                        }
                        set
                        {
                            this.TextAccess["BH"] = value;
                        }
                    }
                    /// <summary>
                    ///  起始日期
                    /// </summary>
                    public System.Nullable<DateTime> QSRQ
                    {
                        get
                        {
                            return this.DateAccess["QSRQ"];
                        }
                        set
                        {
                            this.DateAccess["QSRQ"] = value;
                        }
                    }
                    /// <summary>
                    ///  终止日期
                    /// </summary>
                    public System.Nullable<DateTime> ZZRQ
                    {
                        get
                        {
                            return this.DateAccess["ZZRQ"];
                        }
                        set
                        {
                            this.DateAccess["ZZRQ"] = value;
                        }
                    }
                    /// <summary>
                    ///  折旧天数
                    /// </summary>
                    public string ZJTS
                    {
                        get
                        {
                            return this.TextAccess["ZJTS"];
                        }
                        set
                        {
                            this.TextAccess["ZJTS"] = value;
                        }
                    }
                    /// <summary>
                    ///  尚可使用寿命/年
                    /// </summary>
                    public string SKSYSM
                    {
                        get
                        {
                            return this.TextAccess["SKSYSM"];
                        }
                        set
                        {
                            this.TextAccess["SKSYSM"] = value;
                        }
                    }
                    /// <summary>
                    ///  年数总和法-年折旧率
                    /// </summary>
                    public string ZH_NZJL
                    {
                        get
                        {
                            return this.TextAccess["ZH_NZJL"];
                        }
                        set
                        {
                            this.TextAccess["ZH_NZJL"] = value;
                        }
                    }
                    /// <summary>
                    ///  年数总和法-年初固定资产账面价值
                    /// </summary>
                    public string ZH_NCZMJZ
                    {
                        get
                        {
                            return this.TextAccess["ZH_NCZMJZ"];
                        }
                        set
                        {
                            this.TextAccess["ZH_NCZMJZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  年数总和法-年初理论剩余折旧率
                    /// </summary>
                    public string ZH_LLSYZJL
                    {
                        get
                        {
                            return this.TextAccess["ZH_LLSYZJL"];
                        }
                        set
                        {
                            this.TextAccess["ZH_LLSYZJL"] = value;
                        }
                    }
                    /// <summary>
                    ///  年数总和法-年折旧率取值
                    /// </summary>
                    public string ZH_NZJLQZ
                    {
                        get
                        {
                            return this.TextAccess["ZH_NZJLQZ"];
                        }
                        set
                        {
                            this.TextAccess["ZH_NZJLQZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  年数总和法-年初剩余折旧率
                    /// </summary>
                    public string ZH_NCSYZJL
                    {
                        get
                        {
                            return this.TextAccess["ZH_NCSYZJL"];
                        }
                        set
                        {
                            this.TextAccess["ZH_NCSYZJL"] = value;
                        }
                    }
                    /// <summary>
                    ///  年数总额合法-年折旧额
                    /// </summary>
                    public string ZH_NZJE
                    {
                        get
                        {
                            return this.TextAccess["ZH_NZJE"];
                        }
                        set
                        {
                            this.TextAccess["ZH_NZJE"] = value;
                        }
                    }
                    /// <summary>
                    ///  年限平均法-年折旧率
                    /// </summary>
                    public string PJ_NZJL
                    {
                        get
                        {
                            return this.TextAccess["PJ_NZJL"];
                        }
                        set
                        {
                            this.TextAccess["PJ_NZJL"] = value;
                        }
                    }
                    /// <summary>
                    ///  年限平均法-年初固定资产账面价值
                    /// </summary>
                    public string PJ_NCZMJZ
                    {
                        get
                        {
                            return this.TextAccess["PJ_NCZMJZ"];
                        }
                        set
                        {
                            this.TextAccess["PJ_NCZMJZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  年限平均法-年初理论剩余折旧率
                    /// </summary>
                    public string PJ_LLSYZJL
                    {
                        get
                        {
                            return this.TextAccess["PJ_LLSYZJL"];
                        }
                        set
                        {
                            this.TextAccess["PJ_LLSYZJL"] = value;
                        }
                    }
                    /// <summary>
                    ///  年限平均法-年折旧率取值
                    /// </summary>
                    public string PJ_NZJLQZ
                    {
                        get
                        {
                            return this.TextAccess["PJ_NZJLQZ"];
                        }
                        set
                        {
                            this.TextAccess["PJ_NZJLQZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  年限平均法-年初剩余折旧率
                    /// </summary>
                    public string PJ_NCSYZJL
                    {
                        get
                        {
                            return this.TextAccess["PJ_NCSYZJL"];
                        }
                        set
                        {
                            this.TextAccess["PJ_NCSYZJL"] = value;
                        }
                    }
                    /// <summary>
                    ///  年限平均法-年折旧额
                    /// </summary>
                    public string PJ_NZJE
                    {
                        get
                        {
                            return this.TextAccess["PJ_NZJE"];
                        }
                        set
                        {
                            this.TextAccess["PJ_NZJE"] = value;
                        }
                    }
                    /// <summary>
                    ///  双倍余额递减法-年折旧率
                    /// </summary>
                    public string SB_NZJL
                    {
                        get
                        {
                            return this.TextAccess["SB_NZJL"];
                        }
                        set
                        {
                            this.TextAccess["SB_NZJL"] = value;
                        }
                    }
                    /// <summary>
                    ///  双倍余额递减法-年初固定资产账面价值
                    /// </summary>
                    public string SB_NCZMJZ
                    {
                        get
                        {
                            return this.TextAccess["SB_NCZMJZ"];
                        }
                        set
                        {
                            this.TextAccess["SB_NCZMJZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  双倍余额递减法-年初理论剩余折旧率
                    /// </summary>
                    public string SB_LLSYZJL
                    {
                        get
                        {
                            return this.TextAccess["SB_LLSYZJL"];
                        }
                        set
                        {
                            this.TextAccess["SB_LLSYZJL"] = value;
                        }
                    }
                    /// <summary>
                    ///  双倍余额递减法-年折旧率取值
                    /// </summary>
                    public string SB_NZJLQZ
                    {
                        get
                        {
                            return this.TextAccess["SB_NZJLQZ"];
                        }
                        set
                        {
                            this.TextAccess["SB_NZJLQZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  双倍余额递减法-年初剩余折旧率
                    /// </summary>
                    public string SB_NCSYZJL
                    {
                        get
                        {
                            return this.TextAccess["SB_NCSYZJL"];
                        }
                        set
                        {
                            this.TextAccess["SB_NCSYZJL"] = value;
                        }
                    }
                    /// <summary>
                    ///  年数总额法-年折旧额
                    /// </summary>
                    public string SB_NZJE
                    {
                        get
                        {
                            return this.TextAccess["SB_NZJE"];
                        }
                        set
                        {
                            this.TextAccess["SB_NZJE"] = value;
                        }
                    }
                    /// <summary>
                    ///  年初账面价值
                    /// </summary>
                    public string NCZMJZ
                    {
                        get
                        {
                            return this.TextAccess["NCZMJZ"];
                        }
                        set
                        {
                            this.TextAccess["NCZMJZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  年初折旧率
                    /// </summary>
                    public string NCZJL
                    {
                        get
                        {
                            return this.TextAccess["NCZJL"];
                        }
                        set
                        {
                            this.TextAccess["NCZJL"] = value;
                        }
                    }
                    /// <summary>
                    ///  年折旧额
                    /// </summary>
                    public string NZJE
                    {
                        get
                        {
                            return this.TextAccess["NZJE"];
                        }
                        set
                        {
                            this.TextAccess["NZJE"] = value;
                        }
                    }
                    /// <summary>
                    ///  年折旧率
                    /// </summary>
                    public string NZJL
                    {
                        get
                        {
                            return this.TextAccess["NZJL"];
                        }
                        set
                        {
                            this.TextAccess["NZJL"] = value;
                        }
                    }
                    /// <summary>
                    ///  月均折旧额
                    /// </summary>
                    public string YJZJE
                    {
                        get
                        {
                            return this.TextAccess["YJZJE"];
                        }
                        set
                        {
                            this.TextAccess["YJZJE"] = value;
                        }
                    }
                    /// <summary>
                    ///  备注
                    /// </summary>
                    public string REMARK
                    {
                        get
                        {
                            return this.TextAccess["REMARK"];
                        }
                        set
                        {
                            this.TextAccess["REMARK"] = value;
                        }
                    }
                    /// <summary>
                    ///  
                    /// </summary>
                    public string CREATE_USER
                    {
                        get
                        {
                            return this.TextAccess["CREATE_USER"];
                        }
                        set
                        {
                            this.TextAccess["CREATE_USER"] = value;
                        }
                    }
                    /// <summary>
                    ///  
                    /// </summary>
                    public string CREATE_USER_NAME
                    {
                        get
                        {
                            return this.TextAccess["CREATE_USER_NAME"];
                        }
                        set
                        {
                            this.TextAccess["CREATE_USER_NAME"] = value;
                        }
                    }
                    /// <summary>
                    ///  
                    /// </summary>
                    public System.Nullable<DateTime> CREATE_DATE
                    {
                        get
                        {
                            return this.DateAccess["CREATE_DATE"];
                        }
                        set
                        {
                            this.DateAccess["CREATE_DATE"] = value;
                        }
                    }
                    /// <summary>
                    ///  
                    /// </summary>
                    public string UPDATE_USER
                    {
                        get
                        {
                            return this.TextAccess["UPDATE_USER"];
                        }
                        set
                        {
                            this.TextAccess["UPDATE_USER"] = value;
                        }
                    }
                    /// <summary>
                    ///  
                    /// </summary>
                    public string UPDATE_USER_NAME
                    {
                        get
                        {
                            return this.TextAccess["UPDATE_USER_NAME"];
                        }
                        set
                        {
                            this.TextAccess["UPDATE_USER_NAME"] = value;
                        }
                    }
                    /// <summary>
                    ///  
                    /// </summary>
                    public System.Nullable<DateTime> UPDATE_DATE
                    {
                        get
                        {
                            return this.DateAccess["UPDATE_DATE"];
                        }
                        set
                        {
                            this.DateAccess["UPDATE_DATE"] = value;
                        }
                    }
                    /// <summary>
                    ///  
                    /// </summary>
                    public string COMPANY_CODE
                    {
                        get
                        {
                            return this.TextAccess["COMPANY_CODE"];
                        }
                        set
                        {
                            this.TextAccess["COMPANY_CODE"] = value;
                        }
                    }
                    /// <summary>
                    ///  
                    /// </summary>
                    public string COMPANY_NAME
                    {
                        get
                        {
                            return this.TextAccess["COMPANY_NAME"];
                        }
                        set
                        {
                            this.TextAccess["COMPANY_NAME"] = value;
                        }
                    }


		#endregion
	 
	    #region Query Method
        public MES_BD_GDZC_ZJFFT SingleOrDefault()
        {
           return new EntityBuilder<MES_BD_GDZC_ZJFFT>().ToEntityBySql(this.SQLSelect);
        }

        public MES_BD_GDZC_ZJFFT SingleOrDefault(object ts)
        {
            return new EntityBuilder<MES_BD_GDZC_ZJFFT>().ToEntityBySql(this.SQLSelect, ts);
        }

        public List<MES_BD_GDZC_ZJFFT> ToList()
        {
             return new EntityBuilder<MES_BD_GDZC_ZJFFT>().ToListBySql(this.SQLSelect);
        }
		 
        public List<MES_BD_GDZC_ZJFFT> ToList(object ts)
        {
            return new EntityBuilder<MES_BD_GDZC_ZJFFT>().ToListBySql(this.SQLSelect, ts);
        }
		
		public static MES_BD_GDZC_ZJFFT SingleOrDefault(string sql)
        {
            return SingleOrDefault(sql, null);
        }

        public static MES_BD_GDZC_ZJFFT SingleOrDefault(string sql,object ts)
        {
            List<MES_BD_GDZC_ZJFFT> list = ToListBySql(sql, ts);

            if (list.Count == 0) return null;
            else
            {
                return list[0];
            }
        }
		
		public static  List<MES_BD_GDZC_ZJFFT> ToListBySql(string sql)
        {
            return ToListBySql(sql, null);
        }

        public static List<MES_BD_GDZC_ZJFFT> ToListBySql(string sql, object ts)
        {
            return new EntityBuilder<MES_BD_GDZC_ZJFFT>().ToListBySql(sql, ts);
        }
		
		public static List<MES_BD_GDZC_ZJFFT> ToList(DataTable data)
        {
            return new EntityBuilder<MES_BD_GDZC_ZJFFT>().ToList(data);
        }
		
		
		#endregion
		
	    public static TDAL<MES_BD_GDZC_ZJFFT, MES_BD_GDZC_ZJFFT_FIELD> DAL
        {
            get
            {
                return new TDAL<MES_BD_GDZC_ZJFFT, MES_BD_GDZC_ZJFFT_FIELD>();
            }
        }
		
	    public static MES_BD_GDZC_ZJFFT_FIELD Fields
        {
            get { return MES_BD_GDZC_ZJFFT_FIELD.Instance; }
        }
		
	
		public static EntityBuilder<MES_BD_GDZC_ZJFFT> EntityBuilder = new EntityBuilder<MES_BD_GDZC_ZJFFT>();
    }

	internal class MES_BD_GDZC_ZJFFT_COLUMN : BaseColumn
    {
        public static MES_BD_GDZC_ZJFFT_COLUMN Instance;

        static MES_BD_GDZC_ZJFFT_COLUMN()
        {
            Instance = new MES_BD_GDZC_ZJFFT_COLUMN();
        }

        private MES_BD_GDZC_ZJFFT_COLUMN()
        {
               base.ListColumn.Add(new ColumnInfo() { Name = "GUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FGUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "QSRQ", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZZRQ", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZJTS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SKSYSM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZH_NZJL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZH_NCZMJZ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZH_LLSYZJL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZH_NZJLQZ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZH_NCSYZJL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZH_NZJE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PJ_NZJL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PJ_NCZMJZ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PJ_LLSYZJL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PJ_NZJLQZ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PJ_NCSYZJL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PJ_NZJE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SB_NZJL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SB_NCZMJZ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SB_LLSYZJL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SB_NZJLQZ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SB_NCSYZJL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SB_NZJE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "NCZMJZ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "NCZJL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "NZJE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "NZJL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YJZJE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "REMARK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CREATE_USER", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CREATE_USER_NAME", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CREATE_DATE", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "UPDATE_USER", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "UPDATE_USER_NAME", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "UPDATE_DATE", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "COMPANY_CODE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "COMPANY_NAME", Type = "TEXT"  });

        }
    }
	
  public class  MES_BD_GDZC_ZJFFT_FIELD
  {
       private static MES_BD_GDZC_ZJFFT_FIELD instance;

        public static MES_BD_GDZC_ZJFFT_FIELD Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new MES_BD_GDZC_ZJFFT_FIELD();
                }

                return instance;
            }
        }
		
                    public readonly string GUID = "GUID";
        public readonly string FGUID = "FGUID";
        public readonly string BH = "BH";
        public readonly string QSRQ = "QSRQ";
        public readonly string ZZRQ = "ZZRQ";
        public readonly string ZJTS = "ZJTS";
        public readonly string SKSYSM = "SKSYSM";
        public readonly string ZH_NZJL = "ZH_NZJL";
        public readonly string ZH_NCZMJZ = "ZH_NCZMJZ";
        public readonly string ZH_LLSYZJL = "ZH_LLSYZJL";
        public readonly string ZH_NZJLQZ = "ZH_NZJLQZ";
        public readonly string ZH_NCSYZJL = "ZH_NCSYZJL";
        public readonly string ZH_NZJE = "ZH_NZJE";
        public readonly string PJ_NZJL = "PJ_NZJL";
        public readonly string PJ_NCZMJZ = "PJ_NCZMJZ";
        public readonly string PJ_LLSYZJL = "PJ_LLSYZJL";
        public readonly string PJ_NZJLQZ = "PJ_NZJLQZ";
        public readonly string PJ_NCSYZJL = "PJ_NCSYZJL";
        public readonly string PJ_NZJE = "PJ_NZJE";
        public readonly string SB_NZJL = "SB_NZJL";
        public readonly string SB_NCZMJZ = "SB_NCZMJZ";
        public readonly string SB_LLSYZJL = "SB_LLSYZJL";
        public readonly string SB_NZJLQZ = "SB_NZJLQZ";
        public readonly string SB_NCSYZJL = "SB_NCSYZJL";
        public readonly string SB_NZJE = "SB_NZJE";
        public readonly string NCZMJZ = "NCZMJZ";
        public readonly string NCZJL = "NCZJL";
        public readonly string NZJE = "NZJE";
        public readonly string NZJL = "NZJL";
        public readonly string YJZJE = "YJZJE";
        public readonly string REMARK = "REMARK";
        public readonly string CREATE_USER = "CREATE_USER";
        public readonly string CREATE_USER_NAME = "CREATE_USER_NAME";
        public readonly string CREATE_DATE = "CREATE_DATE";
        public readonly string UPDATE_USER = "UPDATE_USER";
        public readonly string UPDATE_USER_NAME = "UPDATE_USER_NAME";
        public readonly string UPDATE_DATE = "UPDATE_DATE";
        public readonly string COMPANY_CODE = "COMPANY_CODE";
        public readonly string COMPANY_NAME = "COMPANY_NAME";

   }
}