using PL.Base;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using ECI.MES.Entity;
using ECI.MES.DAL;
using ECI.MES.VAL;

namespace ECI.MES.BLL
{
    public class MesBdGdzcDeptBLL:SuperBLL
    {
	    private MesBdGdzcDeptDAL dal = new MesBdGdzcDeptDAL();
        private MesBdGdzcDeptVAL val = new MesBdGdzcDeptVAL();

        private static MesBdGdzcDeptBLL instance;

		public  static MesBdGdzcDeptBLL Instance
        {
            get { return instance; }
        }

        static MesBdGdzcDeptBLL()
        {
            instance = new MesBdGdzcDeptBLL();
        }

        public DataTable Load(BLLContext context,string guid)
        {
             return dal.Load(context, guid);
        }

        public SearchResult Search(BLLContext context,Paging paging, EntityBase queryEntity)
        {
            return dal.Search(context, paging, queryEntity);
        }
  
         public void Delete(BLLContext context,List<string> listGuid)
         {
		          

                   foreach (string guid in listGuid)
                    {
					    val.DeleteValidate(context,guid);
                        MES_BD_GDZC_DEPT.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_GDZC_DEPT mesBdGdzcDept= new MES_BD_GDZC_DEPT(MES_BD_GDZC_DEPT.Fields.GUID);
                mesBdGdzcDept.Data = saveEntity.Data;
                mesBdGdzcDept.EffectDataFields();

				val.SaveValidate(context,mesBdGdzcDept,isAdd);

                 if (isAdd)
                 {
                      mesBdGdzcDept.GUID = Guid.NewGuid().ToString("N");
                      mesBdGdzcDept.AddUserInfo(context, isAdd);
					 
					  mesBdGdzcDept.Validate();
                      mesBdGdzcDept.Insert(context.Transaction);
                 }
                else
                {
                     mesBdGdzcDept.AddUserInfo(context, isAdd);
					 mesBdGdzcDept.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdGdzcDept.Validate();
                     mesBdGdzcDept.Update(context.Transaction);
                }

               return mesBdGdzcDept;

         }
	   
    }
}
