using System;
using DataObject;
using log4net;

namespace BusinessLayer
{
    public class Accounts
    {
        private static readonly ILog _log = LogManager.GetLogger(typeof(Accounts).Name);
        
        public static void Register(Register accountData)
        {
            _log.Info("BusinessLayer.Register Entered");
            try
            {
                DataAccessLayer.Accounts.RegisterData(accountData);
            }
            catch (Exception ex)
            {
                _log.Error(ex.Message);
                throw ex;
            }
            finally
            {
                _log.Info("BusinessLayer.Register Exited");
            }
        }

        public static DataObject.Register Login(DataObject.Login loginData)
        {
            _log.Info("BusinessLayer.Validate Entered");
            try
            {
                return DataAccessLayer.Accounts.Login(loginData);
            }
            catch (Exception ex)
            {
                _log.Error(ex.Message);
                throw ex;
            }
            finally
            {
                _log.Info("BusinessLayer.Validate Exited");
            }

        }

        public static DataObject.Register Retrieve(DataObject.Register userData)
        {
            _log.Info("BusinessLayer.Retrieve Entered");
            try
            {
                return DataAccessLayer.Accounts.RetrievePassword(userData);
            }
            catch (Exception ex)
            {
                _log.Error(ex.Message);
                throw ex;
            }
            finally
            {
                _log.Info("BusinessLayer.Retrieve Exited");
            }

        }
    }
}
