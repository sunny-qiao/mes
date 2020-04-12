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
    public class MesBdDbZdbBLL:SuperBLL
    {
	    private MesBdDbZdbDAL dal = new MesBdDbZdbDAL();
        private MesBdDbZdbVAL val = new MesBdDbZdbVAL();

        private static MesBdDbZdbBLL instance;

		public  static MesBdDbZdbBLL Instance
        {
            get { return instance; }
        }

        static MesBdDbZdbBLL()
        {
            instance = new MesBdDbZdbBLL();
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
                        MES_BD_DB_ZDB.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_DB_ZDB mesBdDbZdb= new MES_BD_DB_ZDB(MES_BD_DB_ZDB.Fields.GUID);
                mesBdDbZdb.Data = saveEntity.Data;
                mesBdDbZdb.EffectDataFields();

				val.SaveValidate(context,mesBdDbZdb,isAdd);

                 if (isAdd)
                 {
                      mesBdDbZdb.GUID = Guid.NewGuid().ToString("N");
                      mesBdDbZdb.AddUserInfo(context, isAdd);
					 
					  mesBdDbZdb.Validate();
                      mesBdDbZdb.Insert(context.Transaction);
                 }
                else
                {
                     mesBdDbZdb.AddUserInfo(context, isAdd);
					 mesBdDbZdb.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdDbZdb.Validate();
                     mesBdDbZdb.Update(context.Transaction);
                }

               return mesBdDbZdb;

         }
	   
    }
}
