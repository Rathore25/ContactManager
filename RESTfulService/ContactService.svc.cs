using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using log4net;
using BusinessLayer;
using DataObject;
using Newtonsoft.Json;

namespace RESTfulService
{
    public class ContactService : IContactService
    {

        private static readonly ILog _log = LogManager.GetLogger(typeof(ContactService).Name);

        #region Create
        public string AddUser(Contact userData)
        {
            _log.Info("AddUser Entered");
            _log.Debug("userData :" + JsonConvert.SerializeObject(userData, Formatting.Indented));

            try
            {
                BusinessLayer.Contacts.CreateContact(userData);
                _log.Debug("Result : Success");
                return "Success";
            }
            catch (Exception ex)
            {
                MyCustomErrorDetail Error = new MyCustomErrorDetail("Error in Adding User", ex.Message);
                _log.Error("Error in Adding User" + ex.Message);
                throw new WebFaultException<MyCustomErrorDetail>(Error, System.Net.HttpStatusCode.InternalServerError);
            }
            finally
            {
                _log.Info("AddUser Exited");
            }
        }
        #endregion

        #region Retrieve
        public List<Contact> RetrieveAllUsers(string AccountRelatedId)
        {
            _log.Info("RetrieveAllUsers Entered");
            _log.Debug("Parameter id:" + AccountRelatedId);
            try
            {
                List<Contact> ListOut = BusinessLayer.Contacts.RetrieveAllContact(AccountRelatedId);

                _log.Debug("Result :" + JsonConvert.SerializeObject(ListOut, Formatting.Indented));
                return ListOut;
            }
            catch (Exception ex)
            {
                _log.Error("Unexpected Error :" + ex.Message);
                MyCustomErrorDetail Error = new MyCustomErrorDetail("Unexpected Error", ex.Message);
                throw new WebFaultException<MyCustomErrorDetail>(Error, System.Net.HttpStatusCode.InternalServerError);
            }
            finally
            {
                _log.Info("RetrieveAllUsers Exited");
            }
        }
        #endregion

        #region Update
        public Contact RetrieveUser(string userId)
        {
            _log.Info("RetrieveUser Entered");
            _log.Debug("Parameter :" + userId);
            try
            {
                Contact Data = BusinessLayer.Contacts.RetrieveContact(userId);

                if (string.IsNullOrEmpty(Data.AutoId))
                {
                    _log.Error("No User with such id was in the database");
                    MyCustomErrorDetail Error = new MyCustomErrorDetail("No user found", "No User with such id was in the database");
                    throw new WebFaultException<MyCustomErrorDetail>(Error, System.Net.HttpStatusCode.NotFound);
                }
                else
                {
                    _log.Debug("Result :" + JsonConvert.SerializeObject(Data, Formatting.Indented));
                    return Data;
                }
            }
            catch (Exception ex)
            {
                _log.Error("Unexpected Error :" + ex.Message);
                MyCustomErrorDetail Error = new MyCustomErrorDetail("Unexpected Error", ex.Message);
                throw new WebFaultException<MyCustomErrorDetail>(Error, System.Net.HttpStatusCode.InternalServerError);
            }
            finally
            {
                _log.Info("RetrieveUser Exited");
            }
        }

        public string UpdateUser(DataObject.Contact userData)
        {
            _log.Info("UpdateUser Entered");
            _log.Debug("Parameter :" + JsonConvert.SerializeObject(userData, Formatting.Indented));
            try
            {
                BusinessLayer.Contacts.EditContact(userData);
                _log.Debug("Result : Success");
                return "Success";
            }
            catch (Exception ex)
            {
                _log.Error("Error in Updating :" + ex.Message);
                MyCustomErrorDetail Error = new MyCustomErrorDetail("Error in Updating User", ex.Message);
                throw new WebFaultException<MyCustomErrorDetail>(Error, System.Net.HttpStatusCode.InternalServerError);
            }
            finally
            {
                _log.Info("UpdateUser Exited");
            }
        }
        #endregion

        #region Delete
        public string DeleteUser(string uid)
        {
            _log.Info("DeleteUser Entered");
            _log.Debug("Parameter id:" + uid);
            try
            {
                BusinessLayer.Contacts.DeleteContact(uid);
                _log.Debug("Result : Success");
                return "Success";
            }
            catch (Exception ex)
            {
                _log.Error("Error in Deleting User :" + ex.Message);
                MyCustomErrorDetail Error = new MyCustomErrorDetail("Error in Deleting User", ex.Message);
                throw new WebFaultException<MyCustomErrorDetail>(Error, System.Net.HttpStatusCode.InternalServerError);
            }
            finally
            {
                _log.Info("DeleteUser Exited");
            }
        }
        #endregion

    }
}