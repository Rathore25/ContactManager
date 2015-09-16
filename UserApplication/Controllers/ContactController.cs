using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using log4net;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using ContactManager.Models;

namespace ContactManager.Controllers
{
    [Authorize]
    public class ContactController : Controller
    {
        private static string _url = ConfigurationManager.AppSettings["LocalHost"];

        private static readonly ILog _log   = LogManager.GetLogger(typeof(ContactController).Name);

        #region Create
        public ActionResult Create()
        {
            _log.Info("Create Entered");
            _log.Info("Create Exited");
            return View(new ContactModel());
        }


        public JsonResult CreateNewContact(ContactModel Contact)
        {
            _log.Info("CreatedNewContact Entered");
            _log.Debug("Contact :"+JsonConvert.SerializeObject(Contact,Formatting.Indented));

            ContactModel UserData                  = new ContactModel();
            HttpCookie AuthCookie               = Request.Cookies[FormsAuthentication.FormsCookieName];
            FormsAuthenticationTicket Ticket    = FormsAuthentication.Decrypt(AuthCookie.Value);
            RegisterModel RegisteredUserData    = JsonConvert.DeserializeObject<RegisterModel>(Ticket.UserData);
            var DateofBirth                     = Convert.ToDateTime(Contact.Dob);

            JsonSerializerSettings DateFormat   = new JsonSerializerSettings
            {
                DateFormatHandling = DateFormatHandling.MicrosoftDateFormat
            };

            UserData.AccountId      = (RegisteredUserData.Guid);
            UserData.Name           = (Contact.Name ?? string.Empty);
            UserData.Dob            = (DateofBirth);
            UserData.City           = (Contact.City ?? string.Empty);
            UserData.PhoneNumber    = (Contact.PhoneNumber ?? string.Empty);
            UserData.EmailId        = (Contact.EmailId ?? string.Empty);
            string Error = string.Empty;
            try
            {
                string Result   = string.Empty;
                var Data = JsonConvert.DeserializeObject(Utilities.HttpRequest.GetHttpRequest(_url + "ContactService.svc/Add", "POST", JsonConvert.SerializeObject(UserData, DateFormat))) as JToken;
                Result          = Data["AddUserResult"].ToString();

                if (Result.Equals("Success"))
                {
                    Result = "Contact was created successfully!";
                }
                _log.Debug("Result :" + Result);
                return Json(new { Result = Result, Status="Success" });
            }
            catch (Exception ex)
            {
                _log.Error(ex.Message);
                Error = ex.Message;
            }
            finally
            {
                _log.Info("CreateNewContact Exited");
            }
            return Json(new { Result = Error, Status = "Failure" });
        }
        #endregion

        #region Retrieve
        public ActionResult Index()
        {
            _log.Info("Index Entered");
            if (Request.IsAuthenticated)
            {
                List<ContactModel> UserData = null;
                try
                {
                    HttpCookie AuthCookie               = Request.Cookies[FormsAuthentication.FormsCookieName];
                    FormsAuthenticationTicket Ticket    = FormsAuthentication.Decrypt(AuthCookie.Value);
                    RegisterModel RegisteredUserData    = JsonConvert.DeserializeObject<RegisterModel>(Ticket.UserData);
                    string AccountRelatedId                          = RegisteredUserData.Guid;
                    var UserDataResponse = JsonConvert.DeserializeObject(Utilities.HttpRequest.GetHttpRequest(_url + "ContactService.svc/Users", "POST", JsonConvert.SerializeObject(AccountRelatedId, Formatting.Indented))) as JToken;
                    
                    if (UserDataResponse != null)
                    {
                        UserData = JsonConvert.DeserializeObject<List<ContactModel>>(UserDataResponse["RetrieveAllUsersResult"].ToString());
                    }
                }
                catch (Exception ex)
                {
                    _log.Error("Exception in Index :" + ex);
                    return RedirectToAction("ErrorPage", "Home", new { ex = ex.Message });
                }
                finally
                {
                    _log.Info("Index Exited");

                }
                _log.Debug("UserData :"+JsonConvert.SerializeObject(UserData,Formatting.Indented));
                return View(UserData ?? new List<ContactModel>());
            }
            else
                return RedirectToAction("Login", "Home");
        }
        #endregion

        #region Update
        public ActionResult Edit(string id)
        {
            _log.Info("Edit Entered");
            _log.Debug("paramater id:= " + id);

            ContactModel Model = null;
            try
            {
                var userId = id;
                var UserDataResponse = JsonConvert.DeserializeObject(Utilities.HttpRequest.GetHttpRequest(_url + "ContactService.svc/User", "POST", JsonConvert.SerializeObject(userId, Formatting.Indented))) as JToken;

                if (UserDataResponse != null)
                {
                    Model = JsonConvert.DeserializeObject<ContactModel>(UserDataResponse["RetrieveUserResult"].ToString());
                }
            }
            catch (Exception ex)
            {
                _log.Error("Error in Populating the Edit page with previous data : " + ex.Message);
                return RedirectToAction("ErrorPage", "Home", new { ex = ex.Message });
            }
            finally
            {
                _log.Info("Edit Exited");
            }
            _log.Debug("Model:"+JsonConvert.SerializeObject(Model,Formatting.Indented));
            return View(Model ?? new ContactModel());
        }

        public JsonResult UpdateContact(ContactModel Contact)
        {
            _log.Info("UpdateContact Entered");
            _log.Debug("Contact :"+JsonConvert.SerializeObject(Contact,Formatting.Indented));
            string Error = string.Empty;
            try
            {
                    ContactModel UserData  = new ContactModel();
                    var DateofBirth     = Convert.ToDateTime(Contact.Dob);

                    JsonSerializerSettings DateFormat = new JsonSerializerSettings
                    {
                        DateFormatHandling = DateFormatHandling.MicrosoftDateFormat
                    };

                    HttpCookie AuthCookie               = Request.Cookies[FormsAuthentication.FormsCookieName];
                    FormsAuthenticationTicket Ticket    = FormsAuthentication.Decrypt(AuthCookie.Value);
                    RegisterModel RegisteredUserData    = JsonConvert.DeserializeObject<RegisterModel>(Ticket.UserData);

                    UserData.AccountId            = RegisteredUserData.Guid;
                    UserData.Uid            = Contact.Uid;
                    UserData.Name           = (Contact.Name ?? string.Empty);
                    UserData.Dob            = (DateofBirth);
                    UserData.City           = (Contact.City ?? string.Empty);
                    UserData.PhoneNumber    = (Contact.PhoneNumber ?? string.Empty);
                    UserData.EmailId        = (Contact.EmailId ?? string.Empty);
                    string Result           = string.Empty;
                    var Data = JsonConvert.DeserializeObject(Utilities.HttpRequest.GetHttpRequest(_url + "ContactService.svc/Update", "POST", JsonConvert.SerializeObject(UserData, DateFormat))) as JToken;
                    Result                  = Data["UpdateUserResult"].ToString();
                    if (Result.Equals("Success"))
                    {
                        Result = "Contact was updated successfully!";
                    }
                    _log.Debug("Result :" + Result);
                    return Json(new { Result = Result, Status = "Success" });
            }
            catch (Exception ex)
            {
                _log.Error(ex.Message);
                Error = ex.Message;
            }
            finally
            {
                _log.Info("UpdateContact Exited");
            }
            return Json(new { Result = Error, Status = "Failure" });
        }
        #endregion

        #region Delete
        public ActionResult Delete(string uid)
        {
            _log.Info("Delete entered");
            _log.Debug("Parameter id :" + uid);
            try
            {
                string Result = string.Empty;
                var Data = JsonConvert.DeserializeObject(Utilities.HttpRequest.GetHttpRequest(_url + "ContactService.svc/Delete", "POST", JsonConvert.SerializeObject(uid))) as JToken;
                if (Data != null)
                {
                    Result = Data["DeleteUserResult"].ToString();
                }
                _log.Debug("Result :=" + Result);
            }
            catch (Exception ex)
            {
                _log.Error(ex.Message);
                return RedirectToAction("ErrorPage", "Home", new { ex = ex.Message });
            }
            finally
            {
                _log.Info("Delete exited");
            }
            return RedirectToAction("Index", "Contact");
        }
        #endregion
    }
}
