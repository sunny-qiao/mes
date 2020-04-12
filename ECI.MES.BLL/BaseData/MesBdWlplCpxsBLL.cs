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
    public class MesBdWlplCpxsBLL:SuperBLL
    {
	    private MesBdWlplCpxsDAL dal = new MesBdWlplCpxsDAL();
        private MesBdWlplCpxsVAL val = new MesBdWlplCpxsVAL();

        private static MesBdWlplCpxsBLL instance;

		public  static MesBdWlplCpxsBLL Instance
        {
            get { return instance; }
        }

        static MesBdWlplCpxsBLL()
        {
            instance = new MesBdWlplCpxsBLL();
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
                        MES_BD_WLPL_CPXS.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_WLPL_CPXS mesBdWlplCpxs= new MES_BD_WLPL_CPXS(MES_BD_WLPL_CPXS.Fields.GUID);
                mesBdWlplCpxs.Data = saveEntity.Data;
                mesBdWlplCpxs.EffectDataFields();

				val.SaveValidate(context,mesBdWlplCpxs,isAdd);

                 if (isAdd)
                 {
                      mesBdWlplCpxs.GUID = Guid.NewGuid().ToString("N");
                      mesBdWlplCpxs.AddUserInfo(context, isAdd);
					 
					  mesBdWlplCpxs.Validate();
                      mesBdWlplCpxs.Insert(context.Transaction);
                 }
                else
                {
                     mesBdWlplCpxs.AddUserInfo(context, isAdd);
					 mesBdWlplCpxs.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdWlplCpxs.Validate();
                     mesBdWlplCpxs.Update(context.Transaction);
                }

               return mesBdWlplCpxs;

         }
	   
    }
}
