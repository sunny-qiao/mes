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
    public class MesBdCjBLL:SuperBLL
    {
	    private MesBdCjDAL dal = new MesBdCjDAL();
        private MesBdCjVAL val = new MesBdCjVAL();

        private static MesBdCjBLL instance;

		public  static MesBdCjBLL Instance
        {
            get { return instance; }
        }

        static MesBdCjBLL()
        {
            instance = new MesBdCjBLL();
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
                        MES_BD_CJ.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_CJ mesBdCj= new MES_BD_CJ(MES_BD_CJ.Fields.GUID);
                mesBdCj.Data = saveEntity.Data;
                mesBdCj.EffectDataFields();

				val.SaveValidate(context,mesBdCj,isAdd);

                 if (isAdd)
                 {
                      mesBdCj.GUID = Guid.NewGuid().ToString("N");
                      mesBdCj.AddUserInfo(context, isAdd);
					 
					  mesBdCj.Validate();
                      mesBdCj.Insert(context.Transaction);
                 }
                else
                {
                     mesBdCj.AddUserInfo(context, isAdd);
					 mesBdCj.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdCj.Validate();
                     mesBdCj.Update(context.Transaction);
                }

               return mesBdCj;

         }
	   
    }
}
