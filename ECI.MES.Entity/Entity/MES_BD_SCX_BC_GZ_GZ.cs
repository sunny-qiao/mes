#pragma warning disable  1591
using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using PL.Server.Entity;
using PL.Server.Entity.Entity;
 
namespace ECI.MES.Entity
{
    public partial class MES_BD_SCX_BC_GZ_GZ : EntityBase
	{
	     public MES_BD_SCX_BC_GZ_GZ()
		 {
		    base.Table = new TableInfo { Name = "MES_BD_SCX_BC_GZ_GZ" };
		    base.Columns = MES_BD_SCX_BC_GZ_GZ_COLUMN.Instance;
			this.Init();
		 }
		
		public MES_BD_SCX_BC_GZ_GZ(string keyField):this()
        {
            base.KeyField =  keyField;
        }

	public MES_BD_SCX_BC_GZ_GZ(string keyField,string keyValue):this()
        {
            base.KeyField =  keyField;
            this[keyField]= keyValue;
        }
		
		
        public MES_BD_SCX_BC_GZ_GZ(EntityBase entityBase)
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
                    ///  MES_BD_SCX_BC.GUID
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
                    ///  MES_BD_SCX.GUID
                    /// </summary>
                    public string SCX_GUID
                    {
                        get
                        {
                            return this.TextAccess["SCX_GUID"];
                        }
                        set
                        {
                            this.TextAccess["SCX_GUID"] = value;
                        }
                    }
                    /// <summary>
                    ///  对应生产线
                    /// </summary>
                    public string SCX
                    {
                        get
                        {
                            return this.TextAccess["SCX"];
                        }
                        set
                        {
                            this.TextAccess["SCX"] = value;
                        }
                    }
                    /// <summary>
                    ///  编号
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
                    ///  对应班次
                    /// </summary>
                    public string BCM
                    {
                        get
                        {
                            return this.TextAccess["BCM"];
                        }
                        set
                        {
                            this.TextAccess["BCM"] = value;
                        }
                    }
                    /// <summary>
                    ///  对应工种
                    /// </summary>
                    public string GZ
                    {
                        get
                        {
                            return this.TextAccess["GZ"];
                        }
                        set
                        {
                            this.TextAccess["GZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  对应计件类型
                    /// </summary>
                    public string JJLX
                    {
                        get
                        {
                            return this.TextAccess["JJLX"];
                        }
                        set
                        {
                            this.TextAccess["JJLX"] = value;
                        }
                    }
                    /// <summary>
                    ///  同工种工资等额计算/平均计算
                    /// </summary>
                    public string GZJSFS
                    {
                        get
                        {
                            return this.TextAccess["GZJSFS"];
                        }
                        set
                        {
                            this.TextAccess["GZJSFS"] = value;
                        }
                    }
                    /// <summary>
                    ///  依生产数据用量参数
                    /// </summary>
                    public string YSCSJYLCS
                    {
                        get
                        {
                            return this.TextAccess["YSCSJYLCS"];
                        }
                        set
                        {
                            this.TextAccess["YSCSJYLCS"] = value;
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
        public MES_BD_SCX_BC_GZ_GZ SingleOrDefault()
        {
           return new EntityBuilder<MES_BD_SCX_BC_GZ_GZ>().ToEntityBySql(this.SQLSelect);
        }

        public MES_BD_SCX_BC_GZ_GZ SingleOrDefault(object ts)
        {
            return new EntityBuilder<MES_BD_SCX_BC_GZ_GZ>().ToEntityBySql(this.SQLSelect, ts);
        }

        public List<MES_BD_SCX_BC_GZ_GZ> ToList()
        {
             return new EntityBuilder<MES_BD_SCX_BC_GZ_GZ>().ToListBySql(this.SQLSelect);
        }
		 
        public List<MES_BD_SCX_BC_GZ_GZ> ToList(object ts)
        {
            return new EntityBuilder<MES_BD_SCX_BC_GZ_GZ>().ToListBySql(this.SQLSelect, ts);
        }
		
		public static MES_BD_SCX_BC_GZ_GZ SingleOrDefault(string sql)
        {
            return SingleOrDefault(sql, null);
        }

        public static MES_BD_SCX_BC_GZ_GZ SingleOrDefault(string sql,object ts)
        {
            List<MES_BD_SCX_BC_GZ_GZ> list = ToListBySql(sql, ts);

            if (list.Count == 0) return null;
            else
            {
                return list[0];
            }
        }
		
		public static  List<MES_BD_SCX_BC_GZ_GZ> ToListBySql(string sql)
        {
            return ToListBySql(sql, null);
        }

        public static List<MES_BD_SCX_BC_GZ_GZ> ToListBySql(string sql, object ts)
        {
            return new EntityBuilder<MES_BD_SCX_BC_GZ_GZ>().ToListBySql(sql, ts);
        }
		
		public static List<MES_BD_SCX_BC_GZ_GZ> ToList(DataTable data)
        {
            return new EntityBuilder<MES_BD_SCX_BC_GZ_GZ>().ToList(data);
        }
		
		
		#endregion
		
	    public static TDAL<MES_BD_SCX_BC_GZ_GZ, MES_BD_SCX_BC_GZ_GZ_FIELD> DAL
        {
            get
            {
                return new TDAL<MES_BD_SCX_BC_GZ_GZ, MES_BD_SCX_BC_GZ_GZ_FIELD>();
            }
        }
		
	    public static MES_BD_SCX_BC_GZ_GZ_FIELD Fields
        {
            get { return MES_BD_SCX_BC_GZ_GZ_FIELD.Instance; }
        }
		
	
		public static EntityBuilder<MES_BD_SCX_BC_GZ_GZ> EntityBuilder = new EntityBuilder<MES_BD_SCX_BC_GZ_GZ>();
    }

	internal class MES_BD_SCX_BC_GZ_GZ_COLUMN : BaseColumn
    {
        public static MES_BD_SCX_BC_GZ_GZ_COLUMN Instance;

        static MES_BD_SCX_BC_GZ_GZ_COLUMN()
        {
            Instance = new MES_BD_SCX_BC_GZ_GZ_COLUMN();
        }

        private MES_BD_SCX_BC_GZ_GZ_COLUMN()
        {
               base.ListColumn.Add(new ColumnInfo() { Name = "GUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "FGUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SCX_GUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SCX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BCM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "GZ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JJLX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "GZJSFS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "YSCSJYLCS", Type = "TEXT"  });
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
	
  public class  MES_BD_SCX_BC_GZ_GZ_FIELD
  {
       private static MES_BD_SCX_BC_GZ_GZ_FIELD instance;

        public static MES_BD_SCX_BC_GZ_GZ_FIELD Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new MES_BD_SCX_BC_GZ_GZ_FIELD();
                }

                return instance;
            }
        }
		
                    public readonly string GUID = "GUID";
        public readonly string FGUID = "FGUID";
        public readonly string SCX_GUID = "SCX_GUID";
        public readonly string SCX = "SCX";
        public readonly string BH = "BH";
        public readonly string BCM = "BCM";
        public readonly string GZ = "GZ";
        public readonly string JJLX = "JJLX";
        public readonly string GZJSFS = "GZJSFS";
        public readonly string YSCSJYLCS = "YSCSJYLCS";
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