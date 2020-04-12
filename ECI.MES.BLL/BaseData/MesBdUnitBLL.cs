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
    public class MesBdUnitBLL:SuperBLL
    {
	    private MesBdUnitDAL dal = new MesBdUnitDAL();
        private MesBdUnitVAL val = new MesBdUnitVAL();

        private static MesBdUnitBLL instance;

		public  static MesBdUnitBLL Instance
        {
            get { return instance; }
        }

        static MesBdUnitBLL()
        {
            instance = new MesBdUnitBLL();
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
                        MES_BD_UNIT.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_UNIT mesBdUnit= new MES_BD_UNIT(MES_BD_UNIT.Fields.GUID);
                mesBdUnit.Data = saveEntity.Data;
                mesBdUnit.EffectDataFields();

				val.SaveValidate(context,mesBdUnit,isAdd);

                 if (isAdd)
                 {
                      mesBdUnit.GUID = Guid.NewGuid().ToString("N");
                      mesBdUnit.AddUserInfo(context, isAdd);
					 
					  mesBdUnit.Validate();
                      mesBdUnit.Insert(context.Transaction);
                 }
                else
                {
                     mesBdUnit.AddUserInfo(context, isAdd);
					 mesBdUnit.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdUnit.Validate();
                     mesBdUnit.Update(context.Transaction);
                }

               return mesBdUnit;

         }
	   
    }
}
