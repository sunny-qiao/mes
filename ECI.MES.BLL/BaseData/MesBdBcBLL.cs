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
    public class MesBdBcBLL:SuperBLL
    {
	    private MesBdBcDAL dal = new MesBdBcDAL();
        private MesBdBcVAL val = new MesBdBcVAL();

        private static MesBdBcBLL instance;

		public  static MesBdBcBLL Instance
        {
            get { return instance; }
        }

        static MesBdBcBLL()
        {
            instance = new MesBdBcBLL();
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
                        MES_BD_BC.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_BC mesBdBc= new MES_BD_BC(MES_BD_BC.Fields.GUID);
                mesBdBc.Data = saveEntity.Data;
                mesBdBc.EffectDataFields();

				val.SaveValidate(context,mesBdBc,isAdd);

                 if (isAdd)
                 {
                      mesBdBc.GUID = Guid.NewGuid().ToString("N");
                      mesBdBc.AddUserInfo(context, isAdd);
					 
					  mesBdBc.Validate();
                      mesBdBc.Insert(context.Transaction);
                 }
                else
                {
                     mesBdBc.AddUserInfo(context, isAdd);
					 mesBdBc.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdBc.Validate();
                     mesBdBc.Update(context.Transaction);
                }

               return mesBdBc;

         }
	   
    }
}
