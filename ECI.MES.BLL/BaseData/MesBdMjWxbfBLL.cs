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
    public class MesBdMjWxbfBLL:SuperBLL
    {
	    private MesBdMjWxbfDAL dal = new MesBdMjWxbfDAL();
        private MesBdMjWxbfVAL val = new MesBdMjWxbfVAL();

        private static MesBdMjWxbfBLL instance;

		public  static MesBdMjWxbfBLL Instance
        {
            get { return instance; }
        }

        static MesBdMjWxbfBLL()
        {
            instance = new MesBdMjWxbfBLL();
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
                        MES_BD_MJ_WXBF.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_MJ_WXBF mesBdMjWxbf= new MES_BD_MJ_WXBF(MES_BD_MJ_WXBF.Fields.GUID);
                mesBdMjWxbf.Data = saveEntity.Data;
                mesBdMjWxbf.EffectDataFields();

				val.SaveValidate(context,mesBdMjWxbf,isAdd);

                 if (isAdd)
                 {
                      mesBdMjWxbf.GUID = Guid.NewGuid().ToString("N");
                      mesBdMjWxbf.AddUserInfo(context, isAdd);
					 
					  mesBdMjWxbf.Validate();
                      mesBdMjWxbf.Insert(context.Transaction);
                 }
                else
                {
                     mesBdMjWxbf.AddUserInfo(context, isAdd);
					 mesBdMjWxbf.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdMjWxbf.Validate();
                     mesBdMjWxbf.Update(context.Transaction);
                }

               return mesBdMjWxbf;

         }
	   
    }
}
