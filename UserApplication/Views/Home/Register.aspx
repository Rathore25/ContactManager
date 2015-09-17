<%@ Page Language="C#" MasterPageFile="~/Shared/LoginRegisterMaster.Master" Inherits="System.Web.Mvc.ViewPage<ContactManager.Models.RegisterModel>" %>


    <asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
    Register
    </asp:Content>
    <asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <script language="javascript" type="text/javascript">
        var usernameLabel, passwordLabel, confirmPasswordLabel, fullNameLabel, emailIdLabel;
        function init() {
            usernameLabel = document.getElementById('usernameLabel');
            passwordLabel = document.getElementById('passwordLabel');
            confirmPasswordLabel = document.getElementById('confirmPasswordLabel');
            fullNameLabel = document.getElementById('fullNameLabel');
            emailIdLabel = document.getElementById('emailIdLabel');
        }
        function ClearValidation() {
            usernameLabel.innerHTML = "&nbsp;";
            passwordLabel.innerHTML = "&nbsp;";
            confirmPasswordLabel.innerHTML = "&nbsp;";
            fullNameLabel.innerHTML = "&nbsp;";
            emailIdLabel.innerHTML = "&nbsp;";
            return true;
        }
        function Validate() {
            ClearValidation();
            var flag = true;
            var userName = document.getElementById('UserName');
            var password = document.getElementById('Password');
            var confirmPassword = document.getElementById('ConfirmPassword');
            var fullName = document.getElementById('FullName');
            var emailId = document.getElementById('EmailId');
            var valid = password.value == confirmPassword.value;
            var lengthOfPassword = ((password.value).toString()).length;
            var lengthOfUserName = ((userName.value).toString()).length;

            if (userName.value == "") {
                usernameLabel.innerHTML = "*Please enter a Username";
                flag = false;
                userName.focus();
                return false;
            }
            if (lengthOfUserName < 4 || lengthOfUserName > 20) {
                usernameLabel.innerHTML = "*Length of Username should be 4-20";
                flag = false;
                userName.focus();
                return false;
            }

            if (password.value == "") {
                passwordLabel.innerHTML = "*Please enter a password";
                flag = false;
                password.focus();
                return false;
            }
            if (lengthOfPassword < 8 || lengthOfPassword > 15) {
                passwordLabel.innerHTML = "*Length of Password should be 8-15";
                flag = false;
                password.focus();
                return false;
            }
            if (confirmPassword.value == "") {
                confirmPasswordLabel.innerHTML = "*Please retype the password";
                flag = false;
                confirmPassword.focus();
                return false;
            }
            if (!valid) {
                confirmPasswordLabel.innerHTML = "*The passwords do not match";
                flag = false;
                confirmPassword.focus();
                return false;
            }

            if (fullName.value == "") {
                fullNameLabel.innerHTML = "*Please enter your full name";
                flag = false;
                fullName.focus();
                return false;
            }
            if (emailId.value == "") {
                emailIdLabel.innerHTML = "*Please enter your EmailId";
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
            width: 350px;
            height: 450px;
            border-style: solid;
            border-width: 3px;
            border-color: rgb(217,133,59);
            background-image: url("<%:Url.Content("~/Content/images/Polygon-final.jpg")%>");
            background-color: transparent;
            padding: 20px;
            display: block;
            margin-left: auto;
            margin-right: auto;
            margin-top: 0px;
            margin-bottom: 50px;
            animation-duration: .5s;
            animation-name: bounceIn;
            animation-timing-function: ease-in-out;
            font-family: 'Segoe UI' , Frutiger, 'Frutiger Linotype' , 'Dejavu Sans' , 'Helvetica Neue' , Arial, sans-serif;
        }
        #Div-Form 
        {
            text-align: left;
            background-color: transparent;
            margin-left: auto;
            margin-right: auto;
            padding-bottom: 10px;
        }
        .Div-TextBox
        {
            padding-top: 5px;
            padding-bottom: 5px;
        }
        .TextBox
        {
            padding-left: 5px;
            height: 30px;
            font-size: 15px;
            border-radius: 9px;
            border-style: none;
            width: 98%;
            margin-left: auto;
            margin-right: auto;
        }
        .Heading
        {
            font-family: 'Segoe UI' , Frutiger, 'Frutiger Linotype' , 'Dejavu Sans' , 'Helvetica Neue' , Arial, sans-serif;
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
            background: linear-gradient(rgb(217, 150, 80) 5%, rgb(180, 70, 30) 100%) rgb(217,133,59);
            text-shadow: rgba(0,0,0,.4) 0 1px 0;
            font-family: 'Segoe UI' , Frutiger, 'Frutiger Linotype' , 'Dejavu Sans' , 'Helvetica Neue' , Arial, sans-serif;
        }
        #SubmitButton:hover
        {
            background: linear-gradient(rgb(230, 160, 90) 5%, rgb(180, 70, 30) 100%) rgb(217,133,59);
        }
        #SubmitButton:active
        {
            background-color: rgb(230,140,70);
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
            font-size: 28px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            margin-top: 0px;
            margin-bottom: 20px;
        }
        #Div-Footer
        {
            background-color:transparent;
            float:right;
            width:100px;
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
    </style>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <div id="Background0">
        <div id="Background1">
            <p id="FormMessage">
                Register</p>
            <div id="Div-Form">
                <div class="Div-TextBox">
                    <%: Html.TextBoxFor(model => model.UserName, new { @class="TextBox", @PlaceHolder="Username*"})%>
                    <label id="usernameLabel" class="ErrorLabel">
                        &nbsp;</label>
                </div>
                <div class="Div-TextBox">
                    <%: Html.PasswordFor(model => model.Password, new { @class = "TextBox", @PlaceHolder = "Password*" })%>
                    <label id="passwordLabel" class="ErrorLabel">
                        &nbsp;</label>
                </div>
                <div class="Div-TextBox">
                    <%: Html.PasswordFor(model => model.ConfirmPassword, new { @class = "TextBox", @PlaceHolder = "Confirm Password*" })%>
                    <label id="confirmPasswordLabel" class="ErrorLabel">
                        &nbsp;</label>
                </div>
                <div class="Div-TextBox">
                    <%: Html.TextBoxFor(model => model.FullName, new { @class = "TextBox", @PlaceHolder = "Full name*" })%>
                    <label id="fullNameLabel" class="ErrorLabel">
                        &nbsp;</label>
                </div>
                <div class="Div-TextBox">
                    <%: Html.TextBoxFor(model => model.EmailId, new { @class = "TextBox", @PlaceHolder = "Email Id*" })%>
                    <label id="emailIdLabel" class="ErrorLabel">
                        &nbsp;</label>
                </div>
            </div>
            <div id="Div-SubmitButton">
                <button id="SubmitButton" onclick="return Validate()" type="submit">
                    Register</button>
            </div>
            <div id="Div-Footer">
                <%: Html.ActionLink("Login", "Login", "Home",   
                    null,
                    new { @class="ChangeViewButton"})%>
            </div>
        </div>
    </div>
    <% } %>
    </asp:Content>