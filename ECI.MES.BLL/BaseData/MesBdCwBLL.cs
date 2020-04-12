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
    public class MesBdCwBLL:SuperBLL
    {
	    private MesBdCwDAL dal = new MesBdCwDAL();
        private MesBdCwVAL val = new MesBdCwVAL();

        private static MesBdCwBLL instance;

		public  static MesBdCwBLL Instance
        {
            get { return instance; }
        }

        static MesBdCwBLL()
        {
            instance = new MesBdCwBLL();
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
                        MES_BD_CW.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_CW mesBdCw= new MES_BD_CW(MES_BD_CW.Fields.GUID);
                mesBdCw.Data = saveEntity.Data;
                mesBdCw.EffectDataFields();

				val.SaveValidate(context,mesBdCw,isAdd);

                 if (isAdd)
                 {
                      mesBdCw.GUID = Guid.NewGuid().ToString("N");
                      mesBdCw.AddUserInfo(context, isAdd);
					 
					  mesBdCw.Validate();
                      mesBdCw.Insert(context.Transaction);
                 }
                else
                {
                     mesBdCw.AddUserInfo(context, isAdd);
					 mesBdCw.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdCw.Validate();
                     mesBdCw.Update(context.Transaction);
                }

               return mesBdCw;

         }
	   
    }
}
