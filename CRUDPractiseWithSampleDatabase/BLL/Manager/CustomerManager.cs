using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CRUDPractiseWithSampleDatabase.DLL;

namespace CRUDPractiseWithSampleDatabase.BLL.Manager
{
    public class CustomerManager
    {
        public static List<Customer> GetAllCustomerDetails()
        {
            DataClassesSampleDatabaseDataContext db = new DataClassesSampleDatabaseDataContext();
            return db.Customers.ToList();
        }

        public static bool AddCustomer(Customer obj, bool isInsert)
        {
            bool status = false;
            if (obj != null)
            {
                DataClassesSampleDatabaseDataContext db = new DataClassesSampleDatabaseDataContext();
                if (isInsert)
                {
                    obj.CreatedOn = DateTime.Now;
                    db.Customers.InsertOnSubmit(obj);

                    status = true;
                }
                else
                {
                    Customer dbobj = db.Customers.Where(x => x.CustomerID == obj.CustomerID).SingleOrDefault();
                    if (dbobj != null)
                    {
                        dbobj.Name = obj.Name;
                        dbobj.Address = obj.Address;
                        dbobj.Gender = obj.Gender;
                        dbobj.ModifiedOn = DateTime.Now;

                        status = true;
                    }
                }
                db.SubmitChanges();
            }
            return status;
        }

        public static void DeleteCustomerDetail(int customerId)
        {
            DataClassesSampleDatabaseDataContext db = new DataClassesSampleDatabaseDataContext();
            Customer obj = db.Customers.Where(x => x.CustomerID == customerId).SingleOrDefault();
            db.Customers.DeleteOnSubmit(obj);
            db.SubmitChanges();
        }

        public static Customer GetCustomerByID(int customerID)
        {
            DataClassesSampleDatabaseDataContext db = new DataClassesSampleDatabaseDataContext();
            return db.Customers.Where(x => x.CustomerID == customerID).SingleOrDefault();
        }
    }
}