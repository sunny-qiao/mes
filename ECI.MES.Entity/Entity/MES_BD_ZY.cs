#pragma warning disable  1591
using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using PL.Server.Entity;
using PL.Server.Entity.Entity;
 
namespace ECI.MES.Entity
{
    public partial class MES_BD_ZY : EntityBase
	{
	     public MES_BD_ZY()
		 {
		    base.Table = new TableInfo { Name = "MES_BD_ZY" };
		    base.Columns = MES_BD_ZY_COLUMN.Instance;
			this.Init();
		 }
		
		public MES_BD_ZY(string keyField):this()
        {
            base.KeyField =  keyField;
        }

	public MES_BD_ZY(string keyField,string keyValue):this()
        {
            base.KeyField =  keyField;
            this[keyField]= keyValue;
        }
		
		
        public MES_BD_ZY(EntityBase entityBase)
            : this()
        {
            this.Data = entityBase.Data;
        }

        #region DataMember

        public string PARENTID
        {
            get
            {
                return this.TextAccess["PARENTID"];
            }
            set
            {
                this.TextAccess["PARENTID"] = value;
            }
        }                             /// <summary>
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
                    ///  工号
                    /// </summary>
                    public string GH
                    {
                        get
                        {
                            return this.TextAccess["GH"];
                        }
                        set
                        {
                            this.TextAccess["GH"] = value;
                        }
                    }
                    /// <summary>
                    ///  职员代码
                    /// </summary>
                    public string CODE
                    {
                        get
                        {
                            return this.TextAccess["CODE"];
                        }
                        set
                        {
                            this.TextAccess["CODE"] = value;
                        }
                    }
                    /// <summary>
                    ///  职员名
                    /// </summary>
                    public string NAME
                    {
                        get
                        {
                            return this.TextAccess["NAME"];
                        }
                        set
                        {
                            this.TextAccess["NAME"] = value;
                        }
                    }
                    /// <summary>
                    ///  职员状态
                    /// </summary>
                    public string STATUS
                    {
                        get
                        {
                            return this.TextAccess["STATUS"];
                        }
                        set
                        {
                            this.TextAccess["STATUS"] = value;
                        }
                    }
                    /// <summary>
                    ///  入职日期
                    /// </summary>
                    public System.Nullable<DateTime> RZ_DATE
                    {
                        get
                        {
                            return this.DateAccess["RZ_DATE"];
                        }
                        set
                        {
                            this.DateAccess["RZ_DATE"] = value;
                        }
                    }
                    /// <summary>
                    ///  离职日期
                    /// </summary>
                    public System.Nullable<DateTime> LZ_DATE
                    {
                        get
                        {
                            return this.DateAccess["LZ_DATE"];
                        }
                        set
                        {
                            this.DateAccess["LZ_DATE"] = value;
                        }
                    }
                    /// <summary>
                    ///  所属车间
                    /// </summary>
                    public string SSCJ
                    {
                        get
                        {
                            return this.TextAccess["SSCJ"];
                        }
                        set
                        {
                            this.TextAccess["SSCJ"] = value;
                        }
                    }
                    /// <summary>
                    ///  所属生产线*
                    /// </summary>
                    public string SSCSCX
                    {
                        get
                        {
                            return this.TextAccess["SSCSCX"];
                        }
                        set
                        {
                            this.TextAccess["SSCSCX"] = value;
                        }
                    }
                    /// <summary>
                    ///  职务
                    /// </summary>
                    public string ZW
                    {
                        get
                        {
                            return this.TextAccess["ZW"];
                        }
                        set
                        {
                            this.TextAccess["ZW"] = value;
                        }
                    }
                    /// <summary>
                    ///  工种
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
                    ///  所属班组
                    /// </summary>
                    public string SSBZ
                    {
                        get
                        {
                            return this.TextAccess["SSBZ"];
                        }
                        set
                        {
                            this.TextAccess["SSBZ"] = value;
                        }
                    }
                    /// <summary>
                    ///  移动电话
                    /// </summary>
                    public string TEL
                    {
                        get
                        {
                            return this.TextAccess["TEL"];
                        }
                        set
                        {
                            this.TextAccess["TEL"] = value;
                        }
                    }
                    /// <summary>
                    ///  身份证号码
                    /// </summary>
                    public string ID_CARD
                    {
                        get
                        {
                            return this.TextAccess["ID_CARD"];
                        }
                        set
                        {
                            this.TextAccess["ID_CARD"] = value;
                        }
                    }
                    /// <summary>
                    ///  开户银行
                    /// </summary>
                    public string KHYH
                    {
                        get
                        {
                            return this.TextAccess["KHYH"];
                        }
                        set
                        {
                            this.TextAccess["KHYH"] = value;
                        }
                    }
                    /// <summary>
                    ///  开户名
                    /// </summary>
                    public string KHM
                    {
                        get
                        {
                            return this.TextAccess["KHM"];
                        }
                        set
                        {
                            this.TextAccess["KHM"] = value;
                        }
                    }
                    /// <summary>
                    ///  银行账号
                    /// </summary>
                    public string BANK
                    {
                        get
                        {
                            return this.TextAccess["BANK"];
                        }
                        set
                        {
                            this.TextAccess["BANK"] = value;
                        }
                    }
                    /// <summary>
                    ///  文化程度
                    /// </summary>
                    public string WHCD
                    {
                        get
                        {
                            return this.TextAccess["WHCD"];
                        }
                        set
                        {
                            this.TextAccess["WHCD"] = value;
                        }
                    }
                    /// <summary>
                    ///  毕业学校
                    /// </summary>
                    public string BYXX
                    {
                        get
                        {
                            return this.TextAccess["BYXX"];
                        }
                        set
                        {
                            this.TextAccess["BYXX"] = value;
                        }
                    }
                    /// <summary>
                    ///  毕业专业
                    /// </summary>
                    public string BYZY
                    {
                        get
                        {
                            return this.TextAccess["BYZY"];
                        }
                        set
                        {
                            this.TextAccess["BYZY"] = value;
                        }
                    }
                    /// <summary>
                    ///  毕业年份
                    /// </summary>
                    public string BYNF
                    {
                        get
                        {
                            return this.TextAccess["BYNF"];
                        }
                        set
                        {
                            this.TextAccess["BYNF"] = value;
                        }
                    }
                    /// <summary>
                    ///  省份
                    /// </summary>
                    public string PROVINCE
                    {
                        get
                        {
                            return this.TextAccess["PROVINCE"];
                        }
                        set
                        {
                            this.TextAccess["PROVINCE"] = value;
                        }
                    }
                    /// <summary>
                    ///  城市
                    /// </summary>
                    public string CITY
                    {
                        get
                        {
                            return this.TextAccess["CITY"];
                        }
                        set
                        {
                            this.TextAccess["CITY"] = value;
                        }
                    }
                    /// <summary>
                    ///  住址
                    /// </summary>
                    public string ADDRESS
                    {
                        get
                        {
                            return this.TextAccess["ADDRESS"];
                        }
                        set
                        {
                            this.TextAccess["ADDRESS"] = value;
                        }
                    }
                    /// <summary>
                    ///  电子邮件
                    /// </summary>
                    public string MAIL
                    {
                        get
                        {
                            return this.TextAccess["MAIL"];
                        }
                        set
                        {
                            this.TextAccess["MAIL"] = value;
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
                    ///  家属1
                    /// </summary>
                    public string JS1
                    {
                        get
                        {
                            return this.TextAccess["JS1"];
                        }
                        set
                        {
                            this.TextAccess["JS1"] = value;
                        }
                    }
                    /// <summary>
                    ///  家属1关系
                    /// </summary>
                    public string JS1_RELATION
                    {
                        get
                        {
                            return this.TextAccess["JS1_RELATION"];
                        }
                        set
                        {
                            this.TextAccess["JS1_RELATION"] = value;
                        }
                    }
                    /// <summary>
                    ///  家属1电话
                    /// </summary>
                    public string JS1_TEL
                    {
                        get
                        {
                            return this.TextAccess["JS1_TEL"];
                        }
                        set
                        {
                            this.TextAccess["JS1_TEL"] = value;
                        }
                    }
                    /// <summary>
                    ///  家属1住址
                    /// </summary>
                    public string JS1_ADDRESS
                    {
                        get
                        {
                            return this.TextAccess["JS1_ADDRESS"];
                        }
                        set
                        {
                            this.TextAccess["JS1_ADDRESS"] = value;
                        }
                    }
                    /// <summary>
                    ///  家属2
                    /// </summary>
                    public string JS2
                    {
                        get
                        {
                            return this.TextAccess["JS2"];
                        }
                        set
                        {
                            this.TextAccess["JS2"] = value;
                        }
                    }
                    /// <summary>
                    ///  家属2关系
                    /// </summary>
                    public string JS2_RELATION
                    {
                        get
                        {
                            return this.TextAccess["JS2_RELATION"];
                        }
                        set
                        {
                            this.TextAccess["JS2_RELATION"] = value;
                        }
                    }
                    /// <summary>
                    ///  家属2电话
                    /// </summary>
                    public string JS2_TEL
                    {
                        get
                        {
                            return this.TextAccess["JS2_TEL"];
                        }
                        set
                        {
                            this.TextAccess["JS2_TEL"] = value;
                        }
                    }
                    /// <summary>
                    ///  家属2住址
                    /// </summary>
                    public string JS2_ADDRESS
                    {
                        get
                        {
                            return this.TextAccess["JS2_ADDRESS"];
                        }
                        set
                        {
                            this.TextAccess["JS2_ADDRESS"] = value;
                        }
                    }
                    /// <summary>
                    ///  家属3
                    /// </summary>
                    public string JS3
                    {
                        get
                        {
                            return this.TextAccess["JS3"];
                        }
                        set
                        {
                            this.TextAccess["JS3"] = value;
                        }
                    }
                    /// <summary>
                    ///  家属3关系
                    /// </summary>
                    public string JS3_RELATION
                    {
                        get
                        {
                            return this.TextAccess["JS3_RELATION"];
                        }
                        set
                        {
                            this.TextAccess["JS3_RELATION"] = value;
                        }
                    }
                    /// <summary>
                    ///  家属3电话
                    /// </summary>
                    public string JS3_TEL
                    {
                        get
                        {
                            return this.TextAccess["JS3_TEL"];
                        }
                        set
                        {
                            this.TextAccess["JS3_TEL"] = value;
                        }
                    }
                    /// <summary>
                    ///  家属3住址
                    /// </summary>
                    public string JS3_ADDRESS
                    {
                        get
                        {
                            return this.TextAccess["JS3_ADDRESS"];
                        }
                        set
                        {
                            this.TextAccess["JS3_ADDRESS"] = value;
                        }
                    }
                    /// <summary>
                    ///  家属4
                    /// </summary>
                    public string JS4
                    {
                        get
                        {
                            return this.TextAccess["JS4"];
                        }
                        set
                        {
                            this.TextAccess["JS4"] = value;
                        }
                    }
                    /// <summary>
                    ///  家属4关系
                    /// </summary>
                    public string JS4_RELATION
                    {
                        get
                        {
                            return this.TextAccess["JS4_RELATION"];
                        }
                        set
                        {
                            this.TextAccess["JS4_RELATION"] = value;
                        }
                    }
                    /// <summary>
                    ///  家属4电话
                    /// </summary>
                    public string JS4_TEL
                    {
                        get
                        {
                            return this.TextAccess["JS4_TEL"];
                        }
                        set
                        {
                            this.TextAccess["JS4_TEL"] = value;
                        }
                    }
                    /// <summary>
                    ///  家属4住址
                    /// </summary>
                    public string JS4_ADDRESS
                    {
                        get
                        {
                            return this.TextAccess["JS4_ADDRESS"];
                        }
                        set
                        {
                            this.TextAccess["JS4_ADDRESS"] = value;
                        }
                    }
                    /// <summary>
                    ///  车牌号
                    /// </summary>
                    public string CAR_NO
                    {
                        get
                        {
                            return this.TextAccess["CAR_NO"];
                        }
                        set
                        {
                            this.TextAccess["CAR_NO"] = value;
                        }
                    }
                    /// <summary>
                    ///  车辆类型
                    /// </summary>
                    public string CAR_TYPE
                    {
                        get
                        {
                            return this.TextAccess["CAR_TYPE"];
                        }
                        set
                        {
                            this.TextAccess["CAR_TYPE"] = value;
                        }
                    }
                    /// <summary>
                    ///  照片1
                    /// </summary>
                    public string PIC1
                    {
                        get
                        {
                            return this.TextAccess["PIC1"];
                        }
                        set
                        {
                            this.TextAccess["PIC1"] = value;
                        }
                    }
                    /// <summary>
                    ///  照片1路径
                    /// </summary>
                    public string PIC1_PATH
                    {
                        get
                        {
                            return this.TextAccess["PIC1_PATH"];
                        }
                        set
                        {
                            this.TextAccess["PIC1_PATH"] = value;
                        }
                    }
                    /// <summary>
                    ///  照片2
                    /// </summary>
                    public string PIC2
                    {
                        get
                        {
                            return this.TextAccess["PIC2"];
                        }
                        set
                        {
                            this.TextAccess["PIC2"] = value;
                        }
                    }
                    /// <summary>
                    ///  照片2路径
                    /// </summary>
                    public string PIC2_PATH
                    {
                        get
                        {
                            return this.TextAccess["PIC2_PATH"];
                        }
                        set
                        {
                            this.TextAccess["PIC2_PATH"] = value;
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
        public MES_BD_ZY SingleOrDefault()
        {
           return new EntityBuilder<MES_BD_ZY>().ToEntityBySql(this.SQLSelect);
        }

        public MES_BD_ZY SingleOrDefault(object ts)
        {
            return new EntityBuilder<MES_BD_ZY>().ToEntityBySql(this.SQLSelect, ts);
        }

        public List<MES_BD_ZY> ToList()
        {
             return new EntityBuilder<MES_BD_ZY>().ToListBySql(this.SQLSelect);
        }
		 
        public List<MES_BD_ZY> ToList(object ts)
        {
            return new EntityBuilder<MES_BD_ZY>().ToListBySql(this.SQLSelect, ts);
        }
		
		public static MES_BD_ZY SingleOrDefault(string sql)
        {
            return SingleOrDefault(sql, null);
        }

        public static MES_BD_ZY SingleOrDefault(string sql,object ts)
        {
            List<MES_BD_ZY> list = ToListBySql(sql, ts);

            if (list.Count == 0) return null;
            else
            {
                return list[0];
            }
        }
		
		public static  List<MES_BD_ZY> ToListBySql(string sql)
        {
            return ToListBySql(sql, null);
        }

        public static List<MES_BD_ZY> ToListBySql(string sql, object ts)
        {
            return new EntityBuilder<MES_BD_ZY>().ToListBySql(sql, ts);
        }
		
		public static List<MES_BD_ZY> ToList(DataTable data)
        {
            return new EntityBuilder<MES_BD_ZY>().ToList(data);
        }
		
		
		#endregion
		
	    public static TDAL<MES_BD_ZY, MES_BD_ZY_FIELD> DAL
        {
            get
            {
                return new TDAL<MES_BD_ZY, MES_BD_ZY_FIELD>();
            }
        }
		
	    public static MES_BD_ZY_FIELD Fields
        {
            get { return MES_BD_ZY_FIELD.Instance; }
        }
		
	
		public static EntityBuilder<MES_BD_ZY> EntityBuilder = new EntityBuilder<MES_BD_ZY>();
    }

	internal class MES_BD_ZY_COLUMN : BaseColumn
    {
        public static MES_BD_ZY_COLUMN Instance;

        static MES_BD_ZY_COLUMN()
        {
            Instance = new MES_BD_ZY_COLUMN();
        }

        private MES_BD_ZY_COLUMN()
        {
            base.ListColumn.Add(new ColumnInfo() { Name = "PARENTID", Type = "TEXT" });
            base.ListColumn.Add(new ColumnInfo() { Name = "GUID", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "GH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CODE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "NAME", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "STATUS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "RZ_DATE", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "LZ_DATE", Type = "DATE"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SSCJ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SSCSCX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ZW", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "GZ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "SSBZ", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "TEL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ID_CARD", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "KHYH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "KHM", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BANK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "WHCD", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BYXX", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BYZY", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "BYNF", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PROVINCE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CITY", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "ADDRESS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "MAIL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "REMARK", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JS1", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JS1_RELATION", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JS1_TEL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JS1_ADDRESS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JS2", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JS2_RELATION", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JS2_TEL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JS2_ADDRESS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JS3", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JS3_RELATION", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JS3_TEL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JS3_ADDRESS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JS4", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JS4_RELATION", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JS4_TEL", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "JS4_ADDRESS", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CAR_NO", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "CAR_TYPE", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC1", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC1_PATH", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC2", Type = "TEXT"  });
               base.ListColumn.Add(new ColumnInfo() { Name = "PIC2_PATH", Type = "TEXT"  });
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
	
  public class  MES_BD_ZY_FIELD
  {
       private static MES_BD_ZY_FIELD instance;

        public static MES_BD_ZY_FIELD Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new MES_BD_ZY_FIELD();
                }

                return instance;
            }
        }

        public readonly string PARENTID = "PARENTID";
        public readonly string GUID = "GUID";
        public readonly string GH = "GH";
        public readonly string CODE = "CODE";
        public readonly string NAME = "NAME";
        public readonly string STATUS = "STATUS";
        public readonly string RZ_DATE = "RZ_DATE";
        public readonly string LZ_DATE = "LZ_DATE";
        public readonly string SSCJ = "SSCJ";
        public readonly string SSCSCX = "SSCSCX";
        public readonly string ZW = "ZW";
        public readonly string GZ = "GZ";
        public readonly string SSBZ = "SSBZ";
        public readonly string TEL = "TEL";
        public readonly string ID_CARD = "ID_CARD";
        public readonly string KHYH = "KHYH";
        public readonly string KHM = "KHM";
        public readonly string BANK = "BANK";
        public readonly string WHCD = "WHCD";
        public readonly string BYXX = "BYXX";
        public readonly string BYZY = "BYZY";
        public readonly string BYNF = "BYNF";
        public readonly string PROVINCE = "PROVINCE";
        public readonly string CITY = "CITY";
        public readonly string ADDRESS = "ADDRESS";
        public readonly string MAIL = "MAIL";
        public readonly string REMARK = "REMARK";
        public readonly string JS1 = "JS1";
        public readonly string JS1_RELATION = "JS1_RELATION";
        public readonly string JS1_TEL = "JS1_TEL";
        public readonly string JS1_ADDRESS = "JS1_ADDRESS";
        public readonly string JS2 = "JS2";
        public readonly string JS2_RELATION = "JS2_RELATION";
        public readonly string JS2_TEL = "JS2_TEL";
        public readonly string JS2_ADDRESS = "JS2_ADDRESS";
        public readonly string JS3 = "JS3";
        public readonly string JS3_RELATION = "JS3_RELATION";
        public readonly string JS3_TEL = "JS3_TEL";
        public readonly string JS3_ADDRESS = "JS3_ADDRESS";
        public readonly string JS4 = "JS4";
        public readonly string JS4_RELATION = "JS4_RELATION";
        public readonly string JS4_TEL = "JS4_TEL";
        public readonly string JS4_ADDRESS = "JS4_ADDRESS";
        public readonly string CAR_NO = "CAR_NO";
        public readonly string CAR_TYPE = "CAR_TYPE";
        public readonly string PIC1 = "PIC1";
        public readonly string PIC1_PATH = "PIC1_PATH";
        public readonly string PIC2 = "PIC2";
        public readonly string PIC2_PATH = "PIC2_PATH";
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