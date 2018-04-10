using CRUDPractiseWithSampleDatabase.DLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUDPractiseWithSampleDatabase.BLL.Manager
{
    public class UserManager
    {
        public static List<GetUserDetailsResult> GetAllUserDetails()
        {
            DataClassesSampleDatabaseDataContext db = new DataClassesSampleDatabaseDataContext();
            return db.GetUserDetails().ToList();
        }

        public static List<UserType> GetAllUserTypeDetails()
        {
            DataClassesSampleDatabaseDataContext db = new DataClassesSampleDatabaseDataContext();
            return db.UserTypes.ToList();
        }

        public static bool IsAlreadyExistUsername(string username, bool toInsert)
        {
            bool status = false;

            return status;
        }

        public static bool InsertUserDetails(UserDetail obj, bool IsInsert)
        {
            bool status = false;
            if (obj != null)
            {
                DataClassesSampleDatabaseDataContext db = new DataClassesSampleDatabaseDataContext();
                if (IsInsert)
                {
                    obj.CreatedOn = DateTime.Now;
                    db.UserDetails.InsertOnSubmit(obj);
                }
                else
                {
                    UserDetail dbobj = db.UserDetails.Where(x => x.UserID == obj.UserID).SingleOrDefault();
                    if (dbobj != null)
                    {
                        dbobj.FullName = obj.FullName;
                        dbobj.UserName = obj.UserName;
                        dbobj.UserType = obj.UserType;
                        dbobj.PasswordAsHash = obj.PasswordAsHash;
                    }

                }
                db.SubmitChanges();
                status = true;
            }
            return status;
        }

        public static bool InsertUserTypeDetails(UserType obj, bool IsInsert)
        {
            bool status = false;
            if (obj != null)
            {
                DataClassesSampleDatabaseDataContext db = new DataClassesSampleDatabaseDataContext();
                if (IsInsert)
                {
                    db.UserTypes.InsertOnSubmit(obj);
                }
                else
                {
                    UserType dbobj = db.UserTypes.Where(x => x.UserTypeID == obj.UserTypeID).SingleOrDefault();
                    if (dbobj != null)
                    {
                        dbobj.UserType1 = obj.UserType1;
                    }

                }
                db.SubmitChanges();
                status = true;
            }
            return status;
        }

        public static void DeleteUserDetail(Guid userId)
        {
            DataClassesSampleDatabaseDataContext db = new DataClassesSampleDatabaseDataContext();
            UserDetail obj = db.UserDetails.Where(x => x.UserID == userId).SingleOrDefault();
            db.UserDetails.DeleteOnSubmit(obj);
            db.SubmitChanges();
        }

        public static void DeleteUserTypeDetail(int usertypeId)
        {
            DataClassesSampleDatabaseDataContext db = new DataClassesSampleDatabaseDataContext();
            UserType obj = db.UserTypes.Where(x => x.UserTypeID == usertypeId).SingleOrDefault();
            db.UserTypes.DeleteOnSubmit(obj);
            db.SubmitChanges();
        }

        public static UserDetail GetUserByID(Guid userID)
        {
            DataClassesSampleDatabaseDataContext db = new DataClassesSampleDatabaseDataContext();
            return db.UserDetails.Where(x => x.UserID == userID).SingleOrDefault();
        }

        public static UserType GetUserTypeByID(int usertypeID)
        {
            DataClassesSampleDatabaseDataContext db = new DataClassesSampleDatabaseDataContext();
            return db.UserTypes.Where(x => x.UserTypeID == usertypeID).SingleOrDefault();
        }
    }
}