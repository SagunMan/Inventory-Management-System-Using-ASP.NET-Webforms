using CRUDPractiseWithSampleDatabase.DLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUDPractiseWithSampleDatabase.BLL.Manager
{
    public class ItemManager
    {
        public static List<ItemOrProduct> GetAllItemDetails()
        {
            DataClassesSampleDatabaseDataContext db = new DataClassesSampleDatabaseDataContext();
            return db.ItemOrProducts.ToList();
        }

        public static bool AddItem(ItemOrProduct obj)
        {
            bool status = false;
            if (obj != null)
            {
                DataClassesSampleDatabaseDataContext db = new DataClassesSampleDatabaseDataContext();
                obj.CreatedOn = DateTime.Now;
                db.ItemOrProducts.InsertOnSubmit(obj);
                
                db.SubmitChanges();
                status = true;
            }
            return status;
        }
        
        public static bool EditItem(ItemOrProduct obj)
        {
            bool status = false;
            if (obj != null)
            {
                DataClassesSampleDatabaseDataContext db = new DataClassesSampleDatabaseDataContext();
                ItemOrProduct dbobj = db.ItemOrProducts.Where(x => x.ItemID == obj.ItemID).SingleOrDefault();

                if (dbobj != null)
                {
                    dbobj.Name = obj.Name;
                    dbobj.PurchasePrice = obj.PurchasePrice;
                    dbobj.SalesPrice = obj.SalesPrice;
                    dbobj.OpeningQty = obj.OpeningQty;
                    dbobj.ModifiedOn = DateTime.Now;
                }
                
                db.SubmitChanges();
                status = true;
            }
            return status;
            
        }

        public static void DeleteItemDetails(Guid itemId)
        {
            DataClassesSampleDatabaseDataContext db = new DataClassesSampleDatabaseDataContext();
            ItemOrProduct obj = db.ItemOrProducts.Where(x => x.ItemID == itemId).SingleOrDefault();
            db.ItemOrProducts.DeleteOnSubmit(obj);
            db.SubmitChanges();
        }

        public static ItemOrProduct GetItemByID(Guid itemID)
        {
            DataClassesSampleDatabaseDataContext db = new DataClassesSampleDatabaseDataContext();
            return db.ItemOrProducts.Where(x => x.ItemID == itemID).SingleOrDefault();
        }
    }
}