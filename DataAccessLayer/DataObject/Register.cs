using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace DataObject
{
    [DataContract]
    public class Register
    {
        [DataMember]
        public string AutoId { get; set; }
        [DataMember]
        public string Guid { get; set; }
        [DataMember]
        public string UserName { get; set; }
        [DataMember]
        public string Password { get; set; }
        [DataMember]
        public string ConfirmPassword { get; set; }
        [DataMember]
        public string FullName { get; set; }
        [DataMember]
        public string EmailId { get; set; }
    }
}
