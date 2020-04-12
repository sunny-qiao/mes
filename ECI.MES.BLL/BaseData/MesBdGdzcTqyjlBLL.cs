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
    public class MesBdGdzcTqyjlBLL:SuperBLL
    {
	    private MesBdGdzcTqyjlDAL dal = new MesBdGdzcTqyjlDAL();
        private MesBdGdzcTqyjlVAL val = new MesBdGdzcTqyjlVAL();

        private static MesBdGdzcTqyjlBLL instance;

		public  static MesBdGdzcTqyjlBLL Instance
        {
            get { return instance; }
        }

        static MesBdGdzcTqyjlBLL()
        {
            instance = new MesBdGdzcTqyjlBLL();
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
                        MES_BD_GDZC_TQYJL.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_GDZC_TQYJL mesBdGdzcTqyjl= new MES_BD_GDZC_TQYJL(MES_BD_GDZC_TQYJL.Fields.GUID);
                mesBdGdzcTqyjl.Data = saveEntity.Data;
                mesBdGdzcTqyjl.EffectDataFields();

				val.SaveValidate(context,mesBdGdzcTqyjl,isAdd);

                 if (isAdd)
                 {
                      mesBdGdzcTqyjl.GUID = Guid.NewGuid().ToString("N");
                      mesBdGdzcTqyjl.AddUserInfo(context, isAdd);
					 
					  mesBdGdzcTqyjl.Validate();
                      mesBdGdzcTqyjl.Insert(context.Transaction);
                 }
                else
                {
                     mesBdGdzcTqyjl.AddUserInfo(context, isAdd);
					 mesBdGdzcTqyjl.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdGdzcTqyjl.Validate();
                     mesBdGdzcTqyjl.Update(context.Transaction);
                }

               return mesBdGdzcTqyjl;

         }
	   
    }
}
