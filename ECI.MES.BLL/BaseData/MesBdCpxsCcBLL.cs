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
    public class MesBdCpxsCcBLL:SuperBLL
    {
	    private MesBdCpxsCcDAL dal = new MesBdCpxsCcDAL();
        private MesBdCpxsCcVAL val = new MesBdCpxsCcVAL();

        private static MesBdCpxsCcBLL instance;

		public  static MesBdCpxsCcBLL Instance
        {
            get { return instance; }
        }

        static MesBdCpxsCcBLL()
        {
            instance = new MesBdCpxsCcBLL();
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
                        MES_BD_CPXS_CC.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_CPXS_CC mesBdCpxsCc= new MES_BD_CPXS_CC(MES_BD_CPXS_CC.Fields.GUID);
                mesBdCpxsCc.Data = saveEntity.Data;
                mesBdCpxsCc.EffectDataFields();

				val.SaveValidate(context,mesBdCpxsCc,isAdd);

                 if (isAdd)
                 {
                      mesBdCpxsCc.GUID = Guid.NewGuid().ToString("N");
                      mesBdCpxsCc.AddUserInfo(context, isAdd);
					 
					  mesBdCpxsCc.Validate();
                      mesBdCpxsCc.Insert(context.Transaction);
                 }
                else
                {
                     mesBdCpxsCc.AddUserInfo(context, isAdd);
					 mesBdCpxsCc.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdCpxsCc.Validate();
                     mesBdCpxsCc.Update(context.Transaction);
                }

               return mesBdCpxsCc;

         }
	   
    }
}
