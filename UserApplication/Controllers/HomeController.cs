using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ContactManager.Models;
using System.Net;
using Newtonsoft.Json;
using System.IO;
using System.Web.Security;
using Newtonsoft.Json.Linq;
using log4net;

namespace ContactManager.Controllers
{
    public class HomeController : Controller
    {
        private static readonly ILog _log = LogManager.GetLogger(typeof(HomeController).Name);
        private static string url = System.Configuration.ConfigurationManager.AppSettings["LocalHost"];

        #region Register
        [AllowAnonymous]
        public ActionResult Register()
        {
            _log.Info("Register Entered");
            _log.Info("Register Exited");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Register(RegisterModel model)
        {
            _log.Info("Register HttpPost entered");
            _log.Debug("Parameter :"+JsonConvert.SerializeObject(model,Formatting.Indented));
            try
            {
                var accountData         = model;
                var Data                = JsonConvert.DeserializeObject(Utilities.HttpRequest.GetHttpRequest(url + "AccountService.svc/Register", "POST", JsonConvert.SerializeObject(accountData))) as JToken;
                string ResponseData     = Data["RegisterResult"].ToString();

                _log.Debug("Response :" + ResponseData);
                if (ResponseData.Equals("Success"))
                {
                    return RedirectToAction("Login", "Home");
                }
                else
                    return View();
            }
            catch (Exception ex)
            {
                _log.Error(ex.Message);
                return RedirectToAction("ErrorPage", "Home", new { ex = ex.Message });
            }
            finally
            {
                _log.Info("Register Exited");
            }
        } 
        #endregion

        #region Login
        public ActionResult Login(string returnUrl)
        {
            _log.Info("Login Entered");
            if (returnUrl == "/")
                returnUrl = string.Empty;
            ViewBag.ReturnUrl = returnUrl;
            ViewBag.ErrorMessage = null;
            _log.Info("Login Exited");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Login(LoginModel model, string returnUrl)
        {
            _log.Info("Login FormPost Entered");
            _log.Debug("Parameter :"+model);
            try
            {
                RegisterModel AccountData   = null;
                var loginData               = model;
                var Data                    = JsonConvert.DeserializeObject(Utilities.HttpRequest.GetHttpRequest(url + "AccountService.svc/Login", "POST", JsonConvert.SerializeObject(loginData))) as JToken;
                AccountData                 = JsonConvert.DeserializeObject<RegisterModel>(Data["LoginResult"].ToString());
                
                _log.Debug("Data :"+JsonConvert.SerializeObject(AccountData,Formatting.Indented));
                
                if (!string.IsNullOrEmpty(AccountData.UserName))
                {

                    FormsAuthenticationTicket Ticket    = new FormsAuthenticationTicket(
                            1,
                            AccountData.UserName,
                            DateTime.Now,
                            DateTime.Now.AddMinutes(5),false,
                            JsonConvert.SerializeObject(AccountData, Formatting.Indented),
                            FormsAuthentication.FormsCookiePath);

                    string EncTicket                    = FormsAuthentication.Encrypt(Ticket);
                    HttpCookie Cookie                   = new HttpCookie(FormsAuthentication.FormsCookieName, EncTicket);
                    
                    if (Ticket.IsPersistent)
                    {
                        Cookie.Expires = Ticket.Expiration;
                    }

                    System.Web.HttpContext.Current.Response.Cookies.Add(Cookie);

                    if (string.IsNullOrEmpty(returnUrl))
                    {
                        return RedirectToAction("Index", "Contact");
                    }
                    else
                    {
                        return Redirect(returnUrl);
                    }
                }
                else
                {
                    _log.Debug("Wrong Username or Password");
                    ViewBag.ErrorMessage = "Wrong Username or Password";
                    return View();
                }
            }
            catch (Exception ex)
            {
                _log.Error(ex.Message);
                return RedirectToAction("ErrorPage", "Home", new { ex = ex.Message });
            }
            finally
            {
                _log.Info("Login Exited");
            }

        } 
        #endregion

        #region Forgot Password
        public ActionResult ForgotPassword()
        {
            _log.Info("ForgotPassword Entered");
            ViewBag.Password        = string.Empty;
            ViewBag.ErrorMessage    = string.Empty;
            _log.Info("ForgotPassword Exited");
            return View();
        }

        [HttpPost]
        public ActionResult ForgotPassword(RegisterModel model)
        {
            _log.Info("ForgotPassword Entered");
            _log.Debug("Parameter "+JsonConvert.SerializeObject(model,Formatting.Indented));

            string Password             = string.Empty;
            RegisterModel AccountData   = null;
            var userData                = model;
            try
            {
                var Data        = JsonConvert.DeserializeObject(Utilities.HttpRequest.GetHttpRequest(url + "AccountService.svc/Retrieve", "POST", JsonConvert.SerializeObject(userData))) as JToken;
                AccountData     = JsonConvert.DeserializeObject<RegisterModel>(Data["RetrievePasswordResult"].ToString());
                
                if (string.IsNullOrEmpty(AccountData.Password))
                {
                    ViewBag.ErrorMessage    = "Wrong Username or Email ID";
                    ViewBag.Password        = string.Empty;
                }
                else
                {
                    ViewBag.ErrorMessage    = string.Empty;
                    ViewBag.Password        = "Your password is : " + AccountData.Password;
                }
            }
            catch (Exception ex)
            {
                _log.Error(ex.Message);
                return RedirectToAction("ErrorPage", "Home", new { ex = ex.Message });
            }
            finally
            {
                _log.Info("Forgot Password Exited");
            }
            return View();
        } 
        #endregion

        #region Logout
        [Authorize]
        public ActionResult Logout()
        {
            _log.Info("Logout Entered");
            FormsAuthentication.SignOut();
            _log.Info("Logout Exited");
            return RedirectToAction("Index","Contact");
        } 
        #endregion

        #region Error
        [AllowAnonymous]
        public ActionResult ErrorPage(string ex)
        {
            _log.Info("ErrorPage ErrorPage Entered");
            ViewBag.ErrorMessage = ex;
            _log.Info("ErrorPage Exited");
            return View();
        } 
        #endregion
    }
}
