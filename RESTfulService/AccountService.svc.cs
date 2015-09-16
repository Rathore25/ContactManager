using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using BusinessLayer;
using DataAccessLayer;
using System.ServiceModel.Web;
using DataObject;
using log4net;
using Newtonsoft.Json;

namespace RESTfulService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "AccountService" in code, svc and config file together.
    public class AccountService : IAccountService
    {
        private static readonly ILog _log = LogManager.GetLogger(typeof(AccountService).Name);

        public string Register(Register accountData)
        {
            _log.Info("Register Entered");
            _log.Debug("Parameter :"+JsonConvert.SerializeObject(accountData,Formatting.Indented));
            try
            {
                BusinessLayer.Accounts.Register(accountData);
                _log.Debug("Result : Success");
                return "Success";
            }
            catch (Exception ex)
            {
                _log.Error("Error in Registering: " + ex.Message);
                MyCustomErrorDetail Error = new MyCustomErrorDetail("Error in Registering", ex.Message);
                throw new WebFaultException<MyCustomErrorDetail>(Error, System.Net.HttpStatusCode.InternalServerError);
            }
            finally
            {
                _log.Info("Register Exited");
            }
        }

        public Register Login(DataObject.Login loginData)
        {
            _log.Info("Login Entered");
            _log.Debug("Parameter :"+JsonConvert.SerializeObject(loginData,Formatting.Indented));
            try
            {
                Register RegisteredData = BusinessLayer.Accounts.Login(loginData);
                if (string.IsNullOrEmpty(RegisteredData.Guid) || string.IsNullOrEmpty(RegisteredData.UserName))
                {
                    _log.Debug("Result :" + JsonConvert.SerializeObject(new Register(), Formatting.Indented));
                    return new Register();
                }
                else
                {
                    _log.Debug("Result :" + JsonConvert.SerializeObject(RegisteredData, Formatting.Indented));
                    return RegisteredData;
                }
            }
            catch (Exception ex)
            {
                _log.Error(ex.Message);
                MyCustomErrorDetail Error = new MyCustomErrorDetail("Unexpected error", ex.Message);
                throw new WebFaultException<MyCustomErrorDetail>(Error, System.Net.HttpStatusCode.InternalServerError);
            }
            finally
            {
                _log.Info("Login Exited");
            }
        }

        public Register RetrievePassword(Register userData)
        {
            _log.Info("RetrievePassword Entered");
            _log.Debug("Parameter :"+JsonConvert.SerializeObject(userData,Formatting.Indented));
            try
            {
                DataObject.Register Password = BusinessLayer.Accounts.Retrieve(userData);
                if (string.IsNullOrEmpty(Password.Password))
                {
                    _log.Debug("Result :" + JsonConvert.SerializeObject(new Register(), Formatting.Indented));
                    return new Register();
                }
                else
                {
                    _log.Debug("Result :" + JsonConvert.SerializeObject(Password, Formatting.Indented));
                    return Password;
                }
            }
            catch (Exception ex)
            {
                _log.Error(ex.Message);
                MyCustomErrorDetail Error = new MyCustomErrorDetail("Unexpected Error" + ex.Source, ex.Message);
                throw new WebFaultException<MyCustomErrorDetail>(Error, System.Net.HttpStatusCode.InternalServerError);
            }
            finally
            {
                _log.Info("RetrievePassword Exited");
            }
        }
    }
}
