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
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IUserService" in both code and config file together.
    [ServiceContract]
    public interface IUserService
    {

        #region Create
        [OperationContract]
        [WebInvoke(
                    Method = "POST",
                    RequestFormat = WebMessageFormat.Json,
                    ResponseFormat = WebMessageFormat.Json,
                    BodyStyle = WebMessageBodyStyle.WrappedResponse,
                    UriTemplate = "/Add"
                   )]

        string AddUser(Contact userData); 
        #endregion

        #region Update
        [OperationContract]
        [WebInvoke(
                    Method = "POST",
                    RequestFormat = WebMessageFormat.Json,
                    ResponseFormat = WebMessageFormat.Json,
                    BodyStyle=WebMessageBodyStyle.WrappedResponse,
                    UriTemplate = "/User"
                   )]

        Contact RetrieveUser(string userId);

        [OperationContract]
        [WebInvoke(
                    Method = "POST",
                    RequestFormat = WebMessageFormat.Json,
                    ResponseFormat = WebMessageFormat.Json,
                    BodyStyle=WebMessageBodyStyle.WrappedResponse,
                    UriTemplate = "/Update"
                   )]

        string UpdateUser(Contact userData); 
        #endregion

        #region Retrieve
        [OperationContract]
        [WebInvoke(
                    Method = "POST",
                    RequestFormat = WebMessageFormat.Json,
                    ResponseFormat = WebMessageFormat.Json,
                    BodyStyle = WebMessageBodyStyle.WrappedResponse,
                    UriTemplate = "/Users"
                   )]

        List<Contact> RetrieveAllUsers(string AccountRelatedId);
        #endregion

        #region Delete
        [OperationContract]
        [WebInvoke(
                    Method = "POST",
                    RequestFormat = WebMessageFormat.Json,
                    ResponseFormat = WebMessageFormat.Json,
                    BodyStyle = WebMessageBodyStyle.WrappedResponse,
                    UriTemplate = "/Delete"
                   )]

        string DeleteUser(string uid); 
        #endregion
    }    
}
