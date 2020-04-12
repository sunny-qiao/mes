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
    public class MesBdGdzcZjfftBLL:SuperBLL
    {
	    private MesBdGdzcZjfftDAL dal = new MesBdGdzcZjfftDAL();
        private MesBdGdzcZjfftVAL val = new MesBdGdzcZjfftVAL();

        private static MesBdGdzcZjfftBLL instance;

		public  static MesBdGdzcZjfftBLL Instance
        {
            get { return instance; }
        }

        static MesBdGdzcZjfftBLL()
        {
            instance = new MesBdGdzcZjfftBLL();
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
                        MES_BD_GDZC_ZJFFT.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_GDZC_ZJFFT mesBdGdzcZjfft= new MES_BD_GDZC_ZJFFT(MES_BD_GDZC_ZJFFT.Fields.GUID);
                mesBdGdzcZjfft.Data = saveEntity.Data;
                mesBdGdzcZjfft.EffectDataFields();

				val.SaveValidate(context,mesBdGdzcZjfft,isAdd);

                 if (isAdd)
                 {
                      mesBdGdzcZjfft.GUID = Guid.NewGuid().ToString("N");
                      mesBdGdzcZjfft.AddUserInfo(context, isAdd);
					 
					  mesBdGdzcZjfft.Validate();
                      mesBdGdzcZjfft.Insert(context.Transaction);
                 }
                else
                {
                     mesBdGdzcZjfft.AddUserInfo(context, isAdd);
					 mesBdGdzcZjfft.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdGdzcZjfft.Validate();
                     mesBdGdzcZjfft.Update(context.Transaction);
                }

               return mesBdGdzcZjfft;

         }
	   
    }
}
