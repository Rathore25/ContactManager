using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.IO;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using log4net;

namespace Utilities
{
    public class HttpRequest
    {
        private static readonly ILog _log = LogManager.GetLogger(typeof(HttpRequest).Name);

        public static string GetHttpRequest(string url, string requestMethod, string requestData)
        {
            _log.Info("GetHttpRequest Entered");
            _log.Debug("url: " + url+"\nrequestMethod: " + requestMethod+"\nrequestData: "+requestData);
            try
            {
                HttpWebRequest Request = (HttpWebRequest)WebRequest.Create(url);
                Request.Method = requestMethod;
                Request.ContentType = "application/json";
                if (!string.IsNullOrEmpty(requestData) && !requestData.Equals("{}"))
                {
                    using (StreamWriter Writer = new StreamWriter(Request.GetRequestStream()))
                    {
                        Writer.Write(requestData);
                    }
                }

                using (HttpWebResponse Response = (HttpWebResponse)Request.GetResponse())
                {
                    using (Stream ResponseData = Response.GetResponseStream())
                    {
                        using (StreamReader Reader = new StreamReader(ResponseData))
                        {
                            var Data = Reader.ReadToEnd();
                            _log.Debug("Result :" + JsonConvert.SerializeObject(Data, Formatting.Indented));
                            return Data;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                _log.Error(ex.Message);
                var protocolException = ex as WebException;
                if (protocolException != null)
                {
                    var responseStream = protocolException.Response.GetResponseStream();
                    var error = new StreamReader(protocolException.Response.GetResponseStream()).ReadToEnd();

                    var ErrorBody = JsonConvert.DeserializeObject<MyCustomErrorDetail>(error);
                    if (ErrorBody != null)
                    {
                        if (!string.IsNullOrEmpty(ErrorBody.ErrorInfo))
                        {
                            throw new Exception(ErrorBody.ErrorDetails);
                        }
                        else
                            throw new Exception(JsonConvert.SerializeObject(ErrorBody));
                    }
                    else
                        throw new Exception(error);

                }
                else
                    throw new Exception("There was an unexpected error with reading the stream.", ex);
            }
            finally
            {
                _log.Info("GetHttpRequest Exited");
            }
        }
    }
}
