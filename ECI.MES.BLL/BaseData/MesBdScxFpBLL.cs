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
    public class MesBdScxFpBLL:SuperBLL
    {
	    private MesBdScxFpDAL dal = new MesBdScxFpDAL();
        private MesBdScxFpVAL val = new MesBdScxFpVAL();

        private static MesBdScxFpBLL instance;

		public  static MesBdScxFpBLL Instance
        {
            get { return instance; }
        }

        static MesBdScxFpBLL()
        {
            instance = new MesBdScxFpBLL();
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
                        MES_BD_SCX_FP.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_SCX_FP mesBdScxFp= new MES_BD_SCX_FP(MES_BD_SCX_FP.Fields.GUID);
                mesBdScxFp.Data = saveEntity.Data;
                mesBdScxFp.EffectDataFields();

				val.SaveValidate(context,mesBdScxFp,isAdd);

                 if (isAdd)
                 {
                      mesBdScxFp.GUID = Guid.NewGuid().ToString("N");
                      mesBdScxFp.AddUserInfo(context, isAdd);
					 
					  mesBdScxFp.Validate();
                      mesBdScxFp.Insert(context.Transaction);
                 }
                else
                {
                     mesBdScxFp.AddUserInfo(context, isAdd);
					 mesBdScxFp.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdScxFp.Validate();
                     mesBdScxFp.Update(context.Transaction);
                }

               return mesBdScxFp;

         }
	   
    }
}
