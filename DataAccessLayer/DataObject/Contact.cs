using System;
using System.Runtime.Serialization;

namespace DataObject
{
    [DataContract]
    public class Contact
    {
        [DataMember]
        public string AccountId { get; set; }
        [DataMember]
        public string AutoId { get; set; }
        [DataMember]
        public string Uid { get; set; }
        [DataMember]
        public string Name { get; set; }
        [DataMember]
        public DateTime Dob { get; set; }
        [DataMember]
        public string City { get; set; }
        [DataMember]
        public string PhoneNumber { get; set; }
        [DataMember]
        public string EmailId { get; set; }
    }
}
