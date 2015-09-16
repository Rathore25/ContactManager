using MySql.Data.MySqlClient;
using MySql.Data;
using System.Linq;
using System.Text;
using System.Data;
using System.Configuration;
using System;
using System.Web;
using log4net;
using Newtonsoft.Json;
using DataObject;

namespace DataAccessLayer
{
    public class Accounts
    {
        #region Private Members     [02]
        private static readonly ILog _log = LogManager.GetLogger(typeof(Accounts).Name);

        private static string _ConnString = ConfigurationManager.ConnectionStrings["MainConnectionString"].ConnectionString; 
        #endregion

        #region Public Methods      [03]
        public static void RegisterData(Register accountData)
        {
            _log.Info("RegisterData Entered");
            _log.Debug("Parameter :" + JsonConvert.SerializeObject(accountData, Formatting.Indented));
            MySqlConnection Connection = new MySqlConnection(_ConnString);
            try
            {
                Connection.Open();
                MySqlCommand Command = new MySqlCommand("udsp_account_register", Connection);
                Command.CommandType = CommandType.StoredProcedure;

                Command.Parameters.AddWithValue("var_AccountId", Guid.NewGuid().ToString());
                Command.Parameters.AddWithValue("var_Username", accountData.UserName);
                Command.Parameters.AddWithValue("var_Password", accountData.Password);
                Command.Parameters.AddWithValue("var_FullName", accountData.FullName);
                Command.Parameters.AddWithValue("var_EmailId", accountData.EmailId);
                
                if (Command.ExecuteNonQuery() == 0)
                {
                    _log.Error("No person was registered");
                    throw new Exception("No person was registered");
                }

            }
            catch (MySqlException exception)
            {
                _log.Error("MySqlException " + exception);
                throw exception;
            }
            catch (Exception ex)
            {
                _log.Error(ex.Message);
                throw ex;
            }
            finally
            {
                if (Connection.State == ConnectionState.Open)
                {
                    Connection.Close();
                }
                _log.Info("RegisterData Exited");
            }
        }

        public static Register Login(Login loginData)
        {
            _log.Info("ValidateData Entered");
            _log.Debug("Parameter :" + JsonConvert.SerializeObject(loginData, Formatting.Indented));
            MySqlConnection Connection = new MySqlConnection(_ConnString);
            try
            {
                Connection.Open();
                DataObject.Register AccountData = new DataObject.Register();
                MySqlCommand ValidateCommand = new MySqlCommand("udsp_account_validate", Connection);
                ValidateCommand.CommandType = CommandType.StoredProcedure;
                Guid GuidId = Guid.NewGuid();
                
                ValidateCommand.Parameters.AddWithValue("var_Username", loginData.UserName);
                ValidateCommand.Parameters.AddWithValue("var_Password", loginData.Password);
                MySqlDataReader Reader = ValidateCommand.ExecuteReader();

                while (Reader.Read())
                {
                    AccountData.AutoId      = Reader["AccountAutoId"].ToString();
                    AccountData.Guid        = Reader["AccountId"].ToString();
                    AccountData.UserName    = Reader["Username"].ToString();
                    AccountData.Password    = Reader["Password"].ToString();
                    AccountData.FullName    = Reader["FullName"].ToString();
                    AccountData.EmailId     = Reader["EmailId"].ToString();
                }
                _log.Debug("Result :" + JsonConvert.SerializeObject(AccountData, Formatting.Indented));
                return AccountData;

            }
            catch (MySqlException exception)
            {
                _log.Error("MySqlException " + exception);
                throw exception;
            }
            catch (Exception ex)
            {
                _log.Error(ex.Message);
                throw ex;
            }
            finally
            {
                if (Connection.State == ConnectionState.Open)
                {
                    Connection.Close();
                }
                _log.Info("Validate Data Exited");
            }
        }

        public static Register RetrievePassword(Register userData)
        {
            _log.Info("RetrievePassword Entered");
            _log.Debug("Parameter :" + JsonConvert.SerializeObject(userData, Formatting.Indented));
            MySqlConnection Connection = new MySqlConnection(_ConnString);
            try
            {
                Connection.Open();
                DataObject.Register Password = new DataObject.Register();
                MySqlCommand RetrieveCommand = new MySqlCommand("udsp_account_retrieve", Connection);
                RetrieveCommand.CommandType = CommandType.StoredProcedure;
                Guid GuidId = Guid.NewGuid();
                RetrieveCommand.Parameters.AddWithValue("var_Username", userData.UserName);
                RetrieveCommand.Parameters.AddWithValue("var_EmailId", userData.EmailId);
                MySqlDataReader Reader = RetrieveCommand.ExecuteReader();

                while (Reader.Read())
                {
                    Password.AutoId = string.Empty;
                    Password.Guid = string.Empty;
                    Password.UserName = string.Empty;
                    Password.Password = Reader["Password"].ToString();
                    Password.FullName = string.Empty;
                    Password.EmailId = string.Empty;
                }
                _log.Debug("Result :" + JsonConvert.SerializeObject(Password, Formatting.Indented));
                return Password;

            }
            catch (MySqlException exception)
            {
                _log.Error("MySqlException " + exception);
                throw exception;
            }
            catch (Exception ex)
            {
                _log.Error(ex.Message);
                throw ex;
            }
            finally
            {
                if (Connection.State == ConnectionState.Open)
                {
                    Connection.Close();
                }
                _log.Info("RetrievePassword Exited");
            }
        } 
        #endregion
    }
}
