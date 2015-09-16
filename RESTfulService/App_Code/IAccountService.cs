using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.ServiceModel.Web;
using DataAccessLayer;
using DataObject;

namespace RESTfulService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IAccountService" in both code and config file together.
    [ServiceContract]
    public interface IAccountService
    {
        [OperationContract]
        [WebInvoke(
                    Method = "POST",
                    RequestFormat = WebMessageFormat.Json,
                    ResponseFormat = WebMessageFormat.Json,
                    BodyStyle = WebMessageBodyStyle.WrappedResponse,
                    UriTemplate = "/Register"
                   )]

        string Register(Register accountData);

        [OperationContract]
        [WebInvoke(
                    Method = "POST",
                    RequestFormat = WebMessageFormat.Json,
                    ResponseFormat = WebMessageFormat.Json,
                    BodyStyle = WebMessageBodyStyle.WrappedResponse,
                    UriTemplate = "/Login"
                   )]

        Register Login(Login loginData);

        [OperationContract]
        [WebInvoke(
                    Method = "POST",
                    RequestFormat = WebMessageFormat.Json,
                    ResponseFormat = WebMessageFormat.Json,
                    BodyStyle = WebMessageBodyStyle.WrappedResponse,
                    UriTemplate = "/Retrieve"
                   )]

        Register RetrievePassword(Register userData);
    }

    [DataContract]
    public class MyCustomErrorDetail
    {
        public MyCustomErrorDetail(string errorInfo, string errorDetails)
        {
            ErrorInfo = errorInfo;
            ErrorDetails = errorDetails;
        }

        [DataMember]
        public string ErrorInfo { get; private set; }

        [DataMember]
        public string ErrorDetails { get; private set; }
    }

}
