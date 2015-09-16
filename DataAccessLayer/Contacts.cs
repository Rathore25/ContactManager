using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newtonsoft.Json;
using log4net;
using MySql.Data.MySqlClient;
using System.Data;
using DataObject;
using System.Configuration;
namespace DataAccessLayer
{

    public class Contacts
    {
        private static readonly ILog _log = LogManager.GetLogger(typeof(Contacts).Name);

        private static string ConnString = ConfigurationManager.ConnectionStrings["MainConnectionString"].ConnectionString;

        #region CreateRow
        public static void Create(DataObject.Contact UserData)
        {
            _log.Info("DatabaseConnectionProvider.Create entered");
            _log.Debug("Parameter : " + JsonConvert.SerializeObject(UserData, Formatting.Indented));
            MySqlConnection Connection = new MySqlConnection(ConnString);

            try
            {
                Connection.Open();
                MySqlCommand InsertCommand = new MySqlCommand("udsp_userdataschema_create", Connection);
                InsertCommand.CommandType = CommandType.StoredProcedure;
                //InsertCommand.CommandText = "INSERT INTO usertable(uid,name,dob,city,phone,emailid,fid) VALUES(@uid,@list0,@list1,@list2,@list3,@list4,@list5)";
                Guid GuidId = Guid.NewGuid();
                InsertCommand.Parameters.AddWithValue("var_ContactId", GuidId.ToString());
                InsertCommand.Parameters.AddWithValue("var_Name", UserData.Name);
                InsertCommand.Parameters.AddWithValue("var_Dob", UserData.Dob);
                InsertCommand.Parameters.AddWithValue("var_City", UserData.City);
                InsertCommand.Parameters.AddWithValue("var_Phone", UserData.PhoneNumber);
                InsertCommand.Parameters.AddWithValue("var_EmailId", UserData.EmailId);
                InsertCommand.Parameters.AddWithValue("var_AccountRelatedId", UserData.AccountId);
                if (InsertCommand.ExecuteNonQuery() == 0)
                {
                    _log.Error("No row was Inserted");
                    throw new Exception("No row was Inserted");
                }
            }
            catch (MySqlException exception)
            {
                _log.Error("MySqlException in Create :" + exception.Message);
                throw exception;
            }
            catch (Exception exception)
            {
                _log.Error("Error in Create " + exception.Message);
                throw exception;
            }
            finally
            {
                if (Connection.State == ConnectionState.Open)
                    Connection.Close();
                _log.Info("DatabaseConnectionProvider.Create exited");
            }
        }
        #endregion

        #region RetrieveAllRows
        public static List<Contact> RetrieveAll(string AccountRelatedId)
        {
            _log.Info("DatabaseConnectionProvider.RetrieveAll entered");
            _log.Debug("Parameter :" + AccountRelatedId);
            MySqlConnection Connection = new MySqlConnection(ConnString);
            try
            {
                Connection.Open();
                MySqlCommand SelectCommand = new MySqlCommand("udsp_userdataschema_retrieve", Connection);
                SelectCommand.CommandType = CommandType.StoredProcedure;
                SelectCommand.Parameters.AddWithValue("var_ContactId", string.Empty);
                SelectCommand.Parameters.AddWithValue("var_AccountRelatedId", AccountRelatedId);
                List<Contact> UserData = new List<Contact>();
                using (MySqlDataReader Reader = SelectCommand.ExecuteReader())
                {

                    while (Reader.Read())
                    {
                        Contact RowData = new Contact();
                        RowData.AutoId = Reader["ContactAutoId"].ToString();
                        RowData.Uid = Reader["ContactId"].ToString();
                        RowData.Name = Reader["Name"].ToString();
                        RowData.Dob = Convert.ToDateTime(Reader["Dob"]);
                        RowData.City = Reader["City"].ToString();
                        RowData.PhoneNumber = Reader["Phone"].ToString();
                        RowData.EmailId = Reader["EmailId"].ToString();
                        RowData.AccountId = Reader["AccountRelatedId"].ToString();
                        UserData.Add(RowData);
                    }
                }
                _log.Debug("Result:= " + JsonConvert.SerializeObject(UserData, Formatting.Indented));
                return UserData;

            }
            catch (MySqlException exception)
            {
                _log.Error("MySqlException in RetrieveAll :" + exception);
                throw exception;
            }
            catch (Exception exception)
            {
                _log.Error("Error in RetrieveAll :" + exception);
                throw exception;
            }
            finally
            {
                if (Connection.State == ConnectionState.Open)
                    Connection.Close();
                _log.Info("DatabaseConnectionProvider.RetrieveAll exited");
            }
        }
        #endregion

        #region UpdateRow
        #region SpecificRowData
        public static DataObject.Contact Retrieve(string uid)
        {
            _log.Info("DatabaseConnectionProvider.Retrieve entered");
            _log.Debug("Parameter autoId : " + uid);
            MySqlConnection Connection = new MySqlConnection(ConnString);

            try
            {
                Connection.Open();
                MySqlCommand SpecificUserCommand = new MySqlCommand("udsp_userdataschema_retrieve", Connection);
                SpecificUserCommand.CommandType = CommandType.StoredProcedure;
                SpecificUserCommand.Parameters.AddWithValue("var_ContactId", uid);
                SpecificUserCommand.Parameters.AddWithValue("var_AccountRelatedId", string.Empty);
                MySqlDataReader Reader = SpecificUserCommand.ExecuteReader();

                DataObject.Contact UserRow = new DataObject.Contact();
                while (Reader.Read())
                {
                    UserRow.AutoId = (Reader["ContactAutoId"].ToString());
                    UserRow.Uid = (Reader["ContactId"].ToString());
                    UserRow.Name = (Reader["Name"].ToString());
                    UserRow.Dob = (Convert.ToDateTime(Reader["Dob"]));
                    UserRow.City = (Reader["City"].ToString());
                    UserRow.PhoneNumber = (Reader["Phone"].ToString());
                    UserRow.EmailId = (Reader["EmailId"].ToString());
                    UserRow.AccountId = (Reader["AccountRelatedId"].ToString());
                }
                _log.Debug("Result :=" + JsonConvert.SerializeObject(UserRow, Formatting.Indented));
                return UserRow;
            }
            catch (MySqlException exception)
            {
                _log.Error("MySqlException in Retrieve :" + exception);
                throw exception;
            }
            catch (Exception exception)
            {
                _log.Error("Error in Retrieve :" + exception.Message);
                throw exception;
            }
            finally
            {
                if (Connection.State == ConnectionState.Open)
                    Connection.Close();
                _log.Info("DatabaseConnectionProvider.Retrieve exited");
            }

        }
        #endregion

        #region EditRow
        public static void Update(DataObject.Contact RowData)
        {
            _log.Info("DatabaseConnectionProvider.Update entered");
            _log.Debug("parameter =" + RowData);
            MySqlConnection Connection = new MySqlConnection(ConnString);

            try
            {
                Connection.Open();
                MySqlCommand UpdateCommand = new MySqlCommand("udsp_userdataschema_update", Connection);
                UpdateCommand.CommandType = CommandType.StoredProcedure;

                UpdateCommand.Parameters.AddWithValue("var_ContactId", RowData.Uid);
                UpdateCommand.Parameters.AddWithValue("var_Name", RowData.Name);
                UpdateCommand.Parameters.AddWithValue("var_Dob", RowData.Dob);
                UpdateCommand.Parameters.AddWithValue("var_City", RowData.City);
                UpdateCommand.Parameters.AddWithValue("var_Phone", RowData.PhoneNumber);
                UpdateCommand.Parameters.AddWithValue("var_EmailId", RowData.EmailId);
                UpdateCommand.Parameters.AddWithValue("var_AccountRelatedId", RowData.AccountId);
                if (UpdateCommand.ExecuteNonQuery() == 0)
                {
                    _log.Error("No row was updated");
                    throw new Exception("No row was updated");
                }
            }
            catch (MySqlException exception)
            {
                _log.Error("MySqlException in Update :" + exception);
                throw exception;
            }
            catch (Exception exception)
            {
                _log.Error("Error in Update :" + exception.Message);
                throw exception;
            }
            finally
            {
                if (Connection.State == ConnectionState.Open)
                    Connection.Close();
                _log.Info("DatabaseConnectionProvider.Update exited");
            }

        }
        #endregion
        #endregion

        #region DeleteRow
        public static void Delete(string uid)
        {
            _log.Info("DatabaseConnectionProvider.Delete entered");
            _log.Debug("parameter uid =" + uid);
            MySqlConnection Connection = new MySqlConnection(ConnString);
            try
            {
                Connection.Open();
                MySqlCommand DeleteCommand = new MySqlCommand("udsp_userdataschema_delete", Connection);
                DeleteCommand.CommandType = CommandType.StoredProcedure;

                DeleteCommand.Parameters.AddWithValue("var_ContactId", uid);

                if (DeleteCommand.ExecuteNonQuery() == 0)
                {
                    _log.Error("No user with such id in database");
                    throw new Exception("No user with such id in database");
                }

            }
            catch (MySqlException exception)
            {
                _log.Error("MySqlException in Delete :" + exception);
                throw exception;
            }
            catch (Exception exception)
            {
                _log.Error("Error in Delete :" + exception.Message);
                throw exception;
            }
            finally
            {
                if (Connection.State == ConnectionState.Open)
                    Connection.Close();
                _log.Info("DatabaseConnectionProvider.Delete exited");
            }

        }
        #endregion
    }
}
