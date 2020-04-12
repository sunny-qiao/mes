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
    public class MesBdGdzcFssbBLL:SuperBLL
    {
	    private MesBdGdzcFssbDAL dal = new MesBdGdzcFssbDAL();
        private MesBdGdzcFssbVAL val = new MesBdGdzcFssbVAL();

        private static MesBdGdzcFssbBLL instance;

		public  static MesBdGdzcFssbBLL Instance
        {
            get { return instance; }
        }

        static MesBdGdzcFssbBLL()
        {
            instance = new MesBdGdzcFssbBLL();
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
                        MES_BD_GDZC_FSSB.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_GDZC_FSSB mesBdGdzcFssb= new MES_BD_GDZC_FSSB(MES_BD_GDZC_FSSB.Fields.GUID);
                mesBdGdzcFssb.Data = saveEntity.Data;
                mesBdGdzcFssb.EffectDataFields();

				val.SaveValidate(context,mesBdGdzcFssb,isAdd);

                 if (isAdd)
                 {
                      mesBdGdzcFssb.GUID = Guid.NewGuid().ToString("N");
                      mesBdGdzcFssb.AddUserInfo(context, isAdd);
					 
					  mesBdGdzcFssb.Validate();
                      mesBdGdzcFssb.Insert(context.Transaction);
                 }
                else
                {
                     mesBdGdzcFssb.AddUserInfo(context, isAdd);
					 mesBdGdzcFssb.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdGdzcFssb.Validate();
                     mesBdGdzcFssb.Update(context.Transaction);
                }

               return mesBdGdzcFssb;

         }
	   
    }
}
