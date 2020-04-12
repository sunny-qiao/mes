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
    public class MesBdCpxsMjBLL:SuperBLL
    {
	    private MesBdCpxsMjDAL dal = new MesBdCpxsMjDAL();
        private MesBdCpxsMjVAL val = new MesBdCpxsMjVAL();

        private static MesBdCpxsMjBLL instance;

		public  static MesBdCpxsMjBLL Instance
        {
            get { return instance; }
        }

        static MesBdCpxsMjBLL()
        {
            instance = new MesBdCpxsMjBLL();
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
                        MES_BD_CPXS_MJ.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_CPXS_MJ mesBdCpxsMj= new MES_BD_CPXS_MJ(MES_BD_CPXS_MJ.Fields.GUID);
                mesBdCpxsMj.Data = saveEntity.Data;
                mesBdCpxsMj.EffectDataFields();

				val.SaveValidate(context,mesBdCpxsMj,isAdd);

                 if (isAdd)
                 {
                      mesBdCpxsMj.GUID = Guid.NewGuid().ToString("N");
                      mesBdCpxsMj.AddUserInfo(context, isAdd);
					 
					  mesBdCpxsMj.Validate();
                      mesBdCpxsMj.Insert(context.Transaction);
                 }
                else
                {
                     mesBdCpxsMj.AddUserInfo(context, isAdd);
					 mesBdCpxsMj.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdCpxsMj.Validate();
                     mesBdCpxsMj.Update(context.Transaction);
                }

               return mesBdCpxsMj;

         }
	   
    }
}
