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
    public class MesBdWlsxBLL:SuperBLL
    {
	    private MesBdWlsxDAL dal = new MesBdWlsxDAL();
        private MesBdWlsxVAL val = new MesBdWlsxVAL();

        private static MesBdWlsxBLL instance;

		public  static MesBdWlsxBLL Instance
        {
            get { return instance; }
        }

        static MesBdWlsxBLL()
        {
            instance = new MesBdWlsxBLL();
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
                        MES_BD_WLSX.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_WLSX mesBdWlsx= new MES_BD_WLSX(MES_BD_WLSX.Fields.GUID);
                mesBdWlsx.Data = saveEntity.Data;
                mesBdWlsx.EffectDataFields();

				val.SaveValidate(context,mesBdWlsx,isAdd);

                 if (isAdd)
                 {
                      mesBdWlsx.GUID = Guid.NewGuid().ToString("N");
                      mesBdWlsx.AddUserInfo(context, isAdd);
					 
					  mesBdWlsx.Validate();
                      mesBdWlsx.Insert(context.Transaction);
                 }
                else
                {
                     mesBdWlsx.AddUserInfo(context, isAdd);
					 mesBdWlsx.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdWlsx.Validate();
                     mesBdWlsx.Update(context.Transaction);
                }

               return mesBdWlsx;

         }
	   
    }
}
