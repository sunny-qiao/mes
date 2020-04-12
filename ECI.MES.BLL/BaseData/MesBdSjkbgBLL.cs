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
    public class MesBdSjkbgBLL:SuperBLL
    {
	    private MesBdSjkbgDAL dal = new MesBdSjkbgDAL();
        private MesBdSjkbgVAL val = new MesBdSjkbgVAL();

        private static MesBdSjkbgBLL instance;

		public  static MesBdSjkbgBLL Instance
        {
            get { return instance; }
        }

        static MesBdSjkbgBLL()
        {
            instance = new MesBdSjkbgBLL();
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
                        MES_BD_SJKBG.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_SJKBG mesBdSjkbg= new MES_BD_SJKBG(MES_BD_SJKBG.Fields.GUID);
                mesBdSjkbg.Data = saveEntity.Data;
                mesBdSjkbg.EffectDataFields();

				val.SaveValidate(context,mesBdSjkbg,isAdd);

                 if (isAdd)
                 {
                      mesBdSjkbg.GUID = Guid.NewGuid().ToString("N");
                      mesBdSjkbg.AddUserInfo(context, isAdd);
					 
					  mesBdSjkbg.Validate();
                      mesBdSjkbg.Insert(context.Transaction);
                 }
                else
                {
                     mesBdSjkbg.AddUserInfo(context, isAdd);
					 mesBdSjkbg.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdSjkbg.Validate();
                     mesBdSjkbg.Update(context.Transaction);
                }

               return mesBdSjkbg;

         }
	   
    }
}
