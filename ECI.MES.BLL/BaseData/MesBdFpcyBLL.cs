﻿using PL.Base;
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
    public class MesBdFpcyBLL:SuperBLL
    {
	    private MesBdFpcyDAL dal = new MesBdFpcyDAL();
        private MesBdFpcyVAL val = new MesBdFpcyVAL();

        private static MesBdFpcyBLL instance;

		public  static MesBdFpcyBLL Instance
        {
            get { return instance; }
        }

        static MesBdFpcyBLL()
        {
            instance = new MesBdFpcyBLL();
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
                        MES_BD_FPCY.DAL.Delete().Where(a => a.GUID = guid).Execute(context.ts);
                   }
         }
 
        public EntityBase Save(BLLContext context,EntityBase saveEntity,bool isAdd)
        {
		       

                MES_BD_FPCY mesBdFpcy= new MES_BD_FPCY(MES_BD_FPCY.Fields.GUID);
                mesBdFpcy.Data = saveEntity.Data;
                mesBdFpcy.EffectDataFields();

				val.SaveValidate(context,mesBdFpcy,isAdd);

                 if (isAdd)
                 {
                      mesBdFpcy.GUID = Guid.NewGuid().ToString("N");
                      mesBdFpcy.AddUserInfo(context, isAdd);
					 
					  mesBdFpcy.Validate();
                      mesBdFpcy.Insert(context.Transaction);
                 }
                else
                {
                     mesBdFpcy.AddUserInfo(context, isAdd);
					 mesBdFpcy.NotSave("CREATE_DATE,CREATE_USER");

					 mesBdFpcy.Validate();
                     mesBdFpcy.Update(context.Transaction);
                }

               return mesBdFpcy;

         }
	   
    }
}
