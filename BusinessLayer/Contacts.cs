using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using log4net;
using System.Data;
using Newtonsoft.Json;

namespace BusinessLayer
{
    public class Contacts
    {
        private static readonly ILog _log = LogManager.GetLogger(typeof(Contacts).Name);        

        #region Create
        public static void CreateContact(DataObject.Contact UserData)
        {
            _log.Info("CreateUser Entered");
            _log.Debug("Parameter UserData :" + JsonConvert.SerializeObject(UserData,Formatting.Indented));
            try
            {
                DataAccessLayer.Contacts.Create(UserData);
            }
            catch (Exception exception)
            {
                _log.Error("Error in BusinessLayer.CreateUser :" + exception);
                throw exception;
            }
            finally
            {
                _log.Info("BusinessLayer.CreateUser Exited");
            }
        } 
        #endregion

        #region Retrieve
        public static List<DataObject.Contact> RetrieveAllContact(string AccountRelatedId)
        {
            _log.Info("BusinessLayer.RetrieveAllUser Entered");
            _log.Debug("Parameter :" + AccountRelatedId);
            try
            {
                return DataAccessLayer.Contacts.RetrieveAll(AccountRelatedId);
            }
            catch (Exception exception)
            {
                _log.Error("Error in RetrieveAllUser :" + exception);
                throw exception;
            }
            finally
            {
                _log.Info("BusinessLayer.RetrieveAllUser Exited");
            }
        }
        #endregion
        
        #region Update
        public static DataObject.Contact RetrieveContact(string uid)
        {
            _log.Info("BusinessLayer.RetrieveUser entered");
            _log.Debug("Parameter :"+uid);
            try
            {
                return DataAccessLayer.Contacts.Retrieve(uid);
            }
            catch (Exception exception)
            {
                _log.Error("Error in BusinessLayer.RetrieveUser :" + exception);
                throw exception;
            }
            finally
            {
                _log.Info("BusinessLayer.RetrieveUser exited");
            }
        }

        public static void EditContact(DataObject.Contact RowData)
        {
            _log.Info("BusinessLayer.EditUser entered");
            _log.Debug("Parameter :"+ JsonConvert.SerializeObject(RowData,Formatting.Indented));
            try
            {
                DataAccessLayer.Contacts.Update(RowData);
            }
            catch (Exception exception)
            {
                _log.Error("Error in BusinessLayer.EditUser :" + exception);
                throw exception;
            }
            finally
            {
                _log.Info("BusinessLayer.EditUser Exited");
            }
        } 
        #endregion

        #region Delete
        public static void DeleteContact(string uid)
        {
            _log.Info("BusinessLayer.DeleteUser entered");
            _log.Debug("Parameter uid :" + uid);
            try
            {
                DataAccessLayer.Contacts.Delete(uid);
            }
            catch (Exception exception)
            {
                _log.Error("Error in BusinessLayer.DeleteUser :" + exception);
                throw exception;
            }
            finally
            {
                _log.Info("BusinessLayer.DeleteUser Exited");
            }
        } 
        #endregion

    }
}
