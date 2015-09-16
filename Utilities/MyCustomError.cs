using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Utilities
{
    public class MyCustomErrorDetail
    {
        public MyCustomErrorDetail(string errorInfo, string errorDetails)
        {
            ErrorInfo = errorInfo;
            ErrorDetails = errorDetails;
        }

        public string ErrorInfo { get; private set; }

        
        public string ErrorDetails { get; private set; }
    }
}
