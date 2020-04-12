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
    public class MesBdMjDyyxBLL:SuperBLL
    {
	    private MesBdMjDyyxDAL dal = new MesBdMjDyyxDAL();
        private MesBdMjDyyxVAL val = new MesBdMjDyyxVAL();

        private static MesBdMjDyyxBLL instance;

		public  static MesBdMjDyyxBLL Instance
        {
            get { return instance; }
        }

        static MesBdMjDyyxBLL()
        {
            instance = new MesBdMjDyyxBLL();
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
                        MES_BD_MJ_DYYX.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_MJ_DYYX mesBdMjDyyx= new MES_BD_MJ_DYYX(MES_BD_MJ_DYYX.Fields.GUID);
                mesBdMjDyyx.Data = saveEntity.Data;
                mesBdMjDyyx.EffectDataFields();

				val.SaveValidate(context,mesBdMjDyyx,isAdd);

                 if (isAdd)
                 {
                      mesBdMjDyyx.GUID = Guid.NewGuid().ToString("N");
                      mesBdMjDyyx.AddUserInfo(context, isAdd);
					 
					  mesBdMjDyyx.Validate();
                      mesBdMjDyyx.Insert(context.Transaction);
                 }
                else
                {
                     mesBdMjDyyx.AddUserInfo(context, isAdd);
					 mesBdMjDyyx.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdMjDyyx.Validate();
                     mesBdMjDyyx.Update(context.Transaction);
                }

               return mesBdMjDyyx;

         }
	   
    }
}
