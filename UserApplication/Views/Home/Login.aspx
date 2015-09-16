<%@ Page Language="C#" MasterPageFile="~/Shared/LoginRegisterMaster.Master" Inherits="System.Web.Mvc.ViewPage<ContactManager.Models.LoginModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
    Login
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <script language="javascript" type="text/javascript">
        var userNameLabel; passwordLabel;
        function init() {
            userNameLabel = document.getElementById('userNameLabel');
            passwordLabel = document.getElementById('passwordLabel');
        }
        function ClearValidation() {
            userNameLabel.innerHTML = "&nbsp;";
            passwordLabel.innerHTML = "&nbsp;";
            return true;
        }
        function Validate() {
            ClearValidation();
            var flag = true;
            var userName = document.getElementById('UserName');
            var password = document.getElementById('Password');

            if (userName.value == "") {
                userNameLabel.innerHTML = "*Please enter a Username";
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
            padding-top:12px;
            display: inline-block;
        }
        #Div-Register
        {
            float:right;
            text-align:right;
            margin:0px;
            padding:0px;
        }
        #Div-Retrieve
        {
            margin:0px;
            float:left;
            text-align:left;
            padding:0px;
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
            <%--<p id="FormMessage">
                Please Enter Your Information</p>--%>
            <div id="Div-Form">
                <div class="Div-TextBox">
                    <%: Html.TextBoxFor(model => model.UserName, new { @class="TextBox", @PlaceHolder="Username*" })%>
                    <label id="userNameLabel" class="ErrorLabel">
                        &nbsp;</label>
                </div>
                <div class="Div-TextBox">
                    <%: Html.PasswordFor(model => model.Password, new { @class = "TextBox", @PlaceHolder = "Password*" })%>
                    <label id="passwordLabel" class="ErrorLabel">
                        <%: ViewBag.ErrorMessage as string%>&nbsp;</label>
                </div>
            </div>
            <div id="Div-SubmitButton">
                <button id="SubmitButton" onclick="return Validate()" type="submit">
                    Login</button>
            </div>
            <div id="Div-Footer">
                <div id="Div-Register">
                    <%: Html.ActionLink("Register", "Register","Home",   
                    null, //   Route args if needed; null if not.
                    new { @class="ChangeViewButton"})%></div>
                <div id="Div-Retrieve">
                    <%: Html.ActionLink("Forgot Password", "ForgotPassword", "Home",   
                    null, //   Route args if needed; null if not.
                    new { @class="ChangeViewButton"})%></div>
            </div>
        </div>
    </div>
    <% } %>
</asp:Content>
