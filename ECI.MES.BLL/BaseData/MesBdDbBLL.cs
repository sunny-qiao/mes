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
    public class MesBdDbBLL:SuperBLL
    {
	    private MesBdDbDAL dal = new MesBdDbDAL();
        private MesBdDbVAL val = new MesBdDbVAL();

        private static MesBdDbBLL instance;

		public  static MesBdDbBLL Instance
        {
            get { return instance; }
        }

        static MesBdDbBLL()
        {
            instance = new MesBdDbBLL();
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
                        MES_BD_DB.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_DB mesBdDb= new MES_BD_DB(MES_BD_DB.Fields.GUID);
                mesBdDb.Data = saveEntity.Data;
                mesBdDb.EffectDataFields();

				val.SaveValidate(context,mesBdDb,isAdd);

                 if (isAdd)
                 {
                      mesBdDb.GUID = Guid.NewGuid().ToString("N");
                      mesBdDb.AddUserInfo(context, isAdd);
					 
					  mesBdDb.Validate();
                      mesBdDb.Insert(context.Transaction);
                 }
                else
                {
                     mesBdDb.AddUserInfo(context, isAdd);
					 mesBdDb.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdDb.Validate();
                     mesBdDb.Update(context.Transaction);
                }

               return mesBdDb;

         }
	   
    }
}
