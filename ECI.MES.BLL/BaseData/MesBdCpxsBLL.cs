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
    public class MesBdCpxsBLL:SuperBLL
    {
	    private MesBdCpxsDAL dal = new MesBdCpxsDAL();
        private MesBdCpxsVAL val = new MesBdCpxsVAL();

        private static MesBdCpxsBLL instance;

		public  static MesBdCpxsBLL Instance
        {
            get { return instance; }
        }

        static MesBdCpxsBLL()
        {
            instance = new MesBdCpxsBLL();
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
                        MES_BD_CPXS.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_CPXS mesBdCpxs= new MES_BD_CPXS(MES_BD_CPXS.Fields.GUID);
                mesBdCpxs.Data = saveEntity.Data;
                mesBdCpxs.EffectDataFields();

				val.SaveValidate(context,mesBdCpxs,isAdd);

                 if (isAdd)
                 {
                      mesBdCpxs.GUID = Guid.NewGuid().ToString("N");
                      mesBdCpxs.AddUserInfo(context, isAdd);
					 
					  mesBdCpxs.Validate();
                      mesBdCpxs.Insert(context.Transaction);
                 }
                else
                {
                     mesBdCpxs.AddUserInfo(context, isAdd);
					 mesBdCpxs.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdCpxs.Validate();
                     mesBdCpxs.Update(context.Transaction);
                }

               return mesBdCpxs;

         }
	   
    }
}
