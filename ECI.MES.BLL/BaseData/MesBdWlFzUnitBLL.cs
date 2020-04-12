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
    public class MesBdWlFzUnitBLL:SuperBLL
    {
	    private MesBdWlFzUnitDAL dal = new MesBdWlFzUnitDAL();
        private MesBdWlFzUnitVAL val = new MesBdWlFzUnitVAL();

        private static MesBdWlFzUnitBLL instance;

		public  static MesBdWlFzUnitBLL Instance
        {
            get { return instance; }
        }

        static MesBdWlFzUnitBLL()
        {
            instance = new MesBdWlFzUnitBLL();
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
                        MES_BD_WL_FZ_UNIT.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_WL_FZ_UNIT mesBdWlFzUnit= new MES_BD_WL_FZ_UNIT(MES_BD_WL_FZ_UNIT.Fields.GUID);
                mesBdWlFzUnit.Data = saveEntity.Data;
                mesBdWlFzUnit.EffectDataFields();

				val.SaveValidate(context,mesBdWlFzUnit,isAdd);

                 if (isAdd)
                 {
                      mesBdWlFzUnit.GUID = Guid.NewGuid().ToString("N");
                      mesBdWlFzUnit.AddUserInfo(context, isAdd);
					 
					  mesBdWlFzUnit.Validate();
                      mesBdWlFzUnit.Insert(context.Transaction);
                 }
                else
                {
                     mesBdWlFzUnit.AddUserInfo(context, isAdd);
					 mesBdWlFzUnit.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdWlFzUnit.Validate();
                     mesBdWlFzUnit.Update(context.Transaction);
                }

               return mesBdWlFzUnit;

         }
	   
    }
}
