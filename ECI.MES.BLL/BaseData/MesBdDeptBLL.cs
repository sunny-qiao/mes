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
    public class MesBdDeptBLL:SuperBLL
    {
	    private MesBdDeptDAL dal = new MesBdDeptDAL();
        private MesBdDeptVAL val = new MesBdDeptVAL();

        private static MesBdDeptBLL instance;

		public  static MesBdDeptBLL Instance
        {
            get { return instance; }
        }

        static MesBdDeptBLL()
        {
            instance = new MesBdDeptBLL();
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
                        MES_BD_DEPT.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_DEPT mesBdDept= new MES_BD_DEPT(MES_BD_DEPT.Fields.GUID);
                mesBdDept.Data = saveEntity.Data;
                mesBdDept.EffectDataFields();

				val.SaveValidate(context,mesBdDept,isAdd);

                 if (isAdd)
                 {
                      mesBdDept.GUID = Guid.NewGuid().ToString("N");
                      mesBdDept.AddUserInfo(context, isAdd);
					 
					  mesBdDept.Validate();
                      mesBdDept.Insert(context.Transaction);
                 }
                else
                {
                     mesBdDept.AddUserInfo(context, isAdd);
					 mesBdDept.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdDept.Validate();
                     mesBdDept.Update(context.Transaction);
                }

               return mesBdDept;

         }
	   
    }
}
