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
    public class MesBdCityBLL:SuperBLL
    {
	    private MesBdCityDAL dal = new MesBdCityDAL();
        private MesBdCityVAL val = new MesBdCityVAL();

        private static MesBdCityBLL instance;

		public  static MesBdCityBLL Instance
        {
            get { return instance; }
        }

        static MesBdCityBLL()
        {
            instance = new MesBdCityBLL();
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
                        MES_BD_CITY.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_CITY mesBdCity= new MES_BD_CITY(MES_BD_CITY.Fields.GUID);
                mesBdCity.Data = saveEntity.Data;
                mesBdCity.EffectDataFields();

				val.SaveValidate(context,mesBdCity,isAdd);

                 if (isAdd)
                 {
                      mesBdCity.GUID = Guid.NewGuid().ToString("N");
                      mesBdCity.AddUserInfo(context, isAdd);
					 
					  mesBdCity.Validate();
                      mesBdCity.Insert(context.Transaction);
                 }
                else
                {
                     mesBdCity.AddUserInfo(context, isAdd);
					 mesBdCity.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdCity.Validate();
                     mesBdCity.Update(context.Transaction);
                }

               return mesBdCity;

         }
	   
    }
}
