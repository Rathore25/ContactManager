using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace ContactManager.Models
{
    public class RegisterModel
    {
        public string AutoId { get; set; }

        public string Guid { get; set; }

        public string UserName { get; set; }

        public string Password { get; set; }

        public string ConfirmPassword { get; set; }

        public string FullName { get; set; }

        public string EmailId { get; set; }
    }


    public class LoginModel
    {
        public string UserName { get; set; }

        public string Password { get; set; }
    }
}