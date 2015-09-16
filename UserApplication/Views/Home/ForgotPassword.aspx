<%@ Page Language="C#" MasterPageFile="~/Shared/LoginRegisterMaster.Master" Inherits="System.Web.Mvc.ViewPage<ContactManager.Models.RegisterModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
    Retrieve Password
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#EmailId").val('');
            $("#UserName").val('');
        });
    </script>
    <script language="javascript" type="text/javascript">
        var userNameLabel; emailIdLabel;
        function init() {
            userNameLabel = document.getElementById('userNameLabel');
            emailIdLabel = document.getElementById('emailIdLabel');
        }
        function ClearValidation() {
            userNameLabel.innerHTML = "&nbsp;";
            emailIdLabel.innerHTML = "&nbsp;";
            return true;
        }
        function Validate() {
            ClearValidation();
            var flag = true;
            var userName = document.getElementById('UserName');
            var emailId = document.getElementById('EmailId');

            if (userName.value == "") {
                userNameLabel.innerHTML = "*Please enter your registered Username";
                flag = false;
                userName.focus();
                return false;
            }
            if (emailId.value == "") {
                emailIdLabel.innerHTML = "*Please enter your registered EmailId";
                flag = false;
                emailId.focus();
                return false;
            }
            var emailPattern = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}"
            if ((emailId.value).match(emailPattern) == null) {
                emailIdLabel.innerHTML = "*Please enter a valid email id";
                flag = false;
                emailId.focus();
                return false;
            }
            return flag;
        }
    </script>
    <style type="text/css">
        
      
        #Background0
        {           
            text-align: center;
            color: rgb(51,79,78);
            margin-top: 50px;
        }
        @keyframes bounceIn 
        {
            0%
            {
                    transform: scale(0.5);
                    opacity: 0;
            }
            70% 
            {
                    transform: scale(1.1);
                    opacity: 1;
            }
            100%   
            {
                    transform: scale(1);
            }
        }
        #Background1
        {
            
            border-style:solid;
            border-width:3px;
            border-color:rgb(217,133,59);
            background-image: url("../../Content/images/Polygon-final.jpg");
            background-color: transparent;
            padding: 20px;
            width: 300px;
            display: block;
            margin-left: auto;
            margin-right: auto;
            animation-duration:.5s;
            animation-name: bounceIn;
            animation-timing-function: ease-in-out;
        }
        #Div-Form
        {
            text-align:left;
            background-color: transparent;
            margin-left: auto;
            margin-right: auto;
            padding-bottom:15px;
        }
        .Div-TextBox
        {
            padding-top:5px;
            padding-bottom:5px;
        }
        .TextBox
        {
            padding-left:5px;
            height:30px;
            font-size:15px;
            border-radius:9px;
            border-style:none;
            width:98%;
            margin-left: auto;
            margin-right: auto;
        }
        #SubmitButton:active, #SubmitButton:focus, #SubmitButton.active
        {
            background-image: none;
            outline: 0;
            -webkit-box-shadow: none;
            box-shadow: none;
        }
        #SubmitButton
        {
            
            border-radius: 6px;
            border: 1px solid rgb(208, 39, 24);
            display: inline-block;
            cursor: pointer;
            color: rgb(255, 255, 255);
            font-size: 17px;
            font-weight: bolder;
            padding: 8px 32px;
            text-decoration: none;
            text-shadow: rgb(129, 14, 5) 1px 2px 4px;
            background :linear-gradient(rgb(217, 150, 80) 5%, rgb(180, 70, 30) 100%) rgb(217,133,59);
            text-shadow: rgba(0,0,0,.4) 0 1px 0;
            font-family:'Segoe UI', Frutiger, 'Frutiger Linotype', 'Dejavu Sans', 'Helvetica Neue', Arial, sans-serif;
            
        }
        #SubmitButton:hover
        {
            background: linear-gradient(rgb(230, 160, 90) 5%, rgb(180, 70, 30) 100%) rgb(217,133,59);
        }
        #SubmitButton:active
        {
            background-color:rgb(230,140,70);
        }
        #Div-SubmitButton
        {
            width: 150px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }
        *:focus
        {
            outline: 0;
        }
        #FormMessage
        {
            font-size:20px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }
        #Div-Footer
        {
            background-color:transparent;
            margin-left:auto;
            margin-right:auto;
            width:300px;
            padding-top:10px;
            text-align: right;
        }
        .ChangeViewButton
        {
            text-decoration:none;
            color:rgb(51,79,78);
        }
        .ChangeViewButton:hover
        {
            color:rgb(255, 90, 0);
        }
        .ErrorLabel
        {
            font-size:12px;
            color:Red;
        }
        #Password
        {
            color:Green;
            font-size:15px;
            padding-bottom:20px;
        }
    </style>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <div id="Background0">
        <div id="Password">
            <asp:Label ID="passwordLabel" runat="server" Text="Label"><%: ViewBag.Password as string%>&nbsp;</asp:Label>
        </div>
        <div id="Background1">
            <div id="Div-Form">
                <div class="Div-TextBox">
                    <%: Html.TextBoxFor(model => model.UserName, new { @class="TextBox", @PlaceHolder="Username*" })%>
                    <label id="userNameLabel" class="ErrorLabel">
                        &nbsp;</label>
                </div>
                <div class="Div-TextBox">
                    <%: Html.TextBoxFor(model => model.EmailId, new { @class = "TextBox", @PlaceHolder = "Email Id*" })%>
                    <label id="emailIdLabel" class="ErrorLabel">
                        <%: ViewBag.ErrorMessage as string%>&nbsp;</label>
                </div>
            </div>
            <div id="Div-SubmitButton">
                <button id="SubmitButton" onclick="return Validate()" type="submit">
                    Retrieve</button>
            </div>
            <div id="Div-Footer">
                <%: Html.ActionLink("Login", "Login","Home",   
                    null, //   Route args if needed; null if not.
                    new { @class="ChangeViewButton"})%>
            </div>
        </div>
    </div>
    <% } %>
</asp:Content>
