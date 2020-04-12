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
    public class MesBdProvinceBLL:SuperBLL
    {
	    private MesBdProvinceDAL dal = new MesBdProvinceDAL();
        private MesBdProvinceVAL val = new MesBdProvinceVAL();

        private static MesBdProvinceBLL instance;

		public  static MesBdProvinceBLL Instance
        {
            get { return instance; }
        }

        static MesBdProvinceBLL()
        {
            instance = new MesBdProvinceBLL();
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
                        MES_BD_PROVINCE.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_PROVINCE mesBdProvince= new MES_BD_PROVINCE(MES_BD_PROVINCE.Fields.GUID);
                mesBdProvince.Data = saveEntity.Data;
                mesBdProvince.EffectDataFields();

				val.SaveValidate(context,mesBdProvince,isAdd);

                 if (isAdd)
                 {
                      mesBdProvince.GUID = Guid.NewGuid().ToString("N");
                      mesBdProvince.AddUserInfo(context, isAdd);
					 
					  mesBdProvince.Validate();
                      mesBdProvince.Insert(context.Transaction);
                 }
                else
                {
                     mesBdProvince.AddUserInfo(context, isAdd);
					 mesBdProvince.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdProvince.Validate();
                     mesBdProvince.Update(context.Transaction);
                }

               return mesBdProvince;

         }
	   
    }
}
