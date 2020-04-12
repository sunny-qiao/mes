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
    public class MesBdGxGzszBLL:SuperBLL
    {
	    private MesBdGxGzszDAL dal = new MesBdGxGzszDAL();
        private MesBdGxGzszVAL val = new MesBdGxGzszVAL();

        private static MesBdGxGzszBLL instance;

		public  static MesBdGxGzszBLL Instance
        {
            get { return instance; }
        }

        static MesBdGxGzszBLL()
        {
            instance = new MesBdGxGzszBLL();
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
                        MES_BD_GX_GZSZ.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_GX_GZSZ mesBdGxGzsz= new MES_BD_GX_GZSZ(MES_BD_GX_GZSZ.Fields.GUID);
                mesBdGxGzsz.Data = saveEntity.Data;
                mesBdGxGzsz.EffectDataFields();

				val.SaveValidate(context,mesBdGxGzsz,isAdd);

                 if (isAdd)
                 {
                      mesBdGxGzsz.GUID = Guid.NewGuid().ToString("N");
                      mesBdGxGzsz.AddUserInfo(context, isAdd);
					 
					  mesBdGxGzsz.Validate();
                      mesBdGxGzsz.Insert(context.Transaction);
                 }
                else
                {
                     mesBdGxGzsz.AddUserInfo(context, isAdd);
					 mesBdGxGzsz.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdGxGzsz.Validate();
                     mesBdGxGzsz.Update(context.Transaction);
                }

               return mesBdGxGzsz;

         }
	   
    }
}
