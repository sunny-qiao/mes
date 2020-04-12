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
    public class MesBdWlplTjBLL:SuperBLL
    {
	    private MesBdWlplTjDAL dal = new MesBdWlplTjDAL();
        private MesBdWlplTjVAL val = new MesBdWlplTjVAL();

        private static MesBdWlplTjBLL instance;

		public  static MesBdWlplTjBLL Instance
        {
            get { return instance; }
        }

        static MesBdWlplTjBLL()
        {
            instance = new MesBdWlplTjBLL();
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
                        MES_BD_WLPL_TJ.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_WLPL_TJ mesBdWlplTj= new MES_BD_WLPL_TJ(MES_BD_WLPL_TJ.Fields.GUID);
                mesBdWlplTj.Data = saveEntity.Data;
                mesBdWlplTj.EffectDataFields();

				val.SaveValidate(context,mesBdWlplTj,isAdd);

                 if (isAdd)
                 {
                      mesBdWlplTj.GUID = Guid.NewGuid().ToString("N");
                      mesBdWlplTj.AddUserInfo(context, isAdd);
					 
					  mesBdWlplTj.Validate();
                      mesBdWlplTj.Insert(context.Transaction);
                 }
                else
                {
                     mesBdWlplTj.AddUserInfo(context, isAdd);
					 mesBdWlplTj.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdWlplTj.Validate();
                     mesBdWlplTj.Update(context.Transaction);
                }

               return mesBdWlplTj;

         }
	   
    }
}
