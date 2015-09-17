<%@ Page Language="C#" MasterPageFile="~/Shared/UserCreateUpdate.Master" Inherits="System.Web.Mvc.ViewPage<ContactManager.Models.ContactModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
    Update
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">
        $(document).ready(
      function () {
          $("#Dob").datepicker
          ({
              changeMonth: true,
              changeYear: true,
              maxDate: "-1d",
              minDate: "-70y"
          });
      }
    );
    </script>
    <script language="javascript" type="text/javascript">
        function UpdateContact() {
            if (Validate()) {
                debugger;
                var Contact = {};
                Contact.Name = $("#Name").val();
                Contact.Dob = $("#Dob").val();
                Contact.City = $("#City").val();
                Contact.PhoneNumber = $("#PhoneNumber").val();
                Contact.EmailId = $("#EmailId").val();
                Contact.Uid = $("#Uid").val();
                $.ajax({
                    type: "POST",
                    url: "../Contact/UpdateContact",
                    contentType: "application/json; charset=utf-8",
                    data: '{Contact: ' + JSON.stringify(Contact) + '}',
                    dataType: "json",
                    success: function (data) {
                        debugger;
                        if (data.Status == "Success") {
                            $("#Message").html(data.Result).css('color', 'green');
                            setTimeout(function () { window.location = "../Contact/Index"; }, 3000);
                        }
                        else {
                            $("#Message").html(data.Result).css('color', 'red');
                        }

                    },
                    error: function () {
                        debugger;
                        $("#Message").html("Error").css('color', 'red');
                    }
                });
            }
            return false;
        }
        var nameLabel, dobLabel, cityLabel, phoneNumberLabel, emailIdLabel;
        function init() {
            nameLabel = document.getElementById('nameLabel');
            dobLabel = document.getElementById('dobLabel');
            cityLabel = document.getElementById('cityLabel');
            phoneNumberLabel = document.getElementById('phoneNumberLabel');
            emailIdLabel = document.getElementById('emailIdLabel');
        }
        function ClearValidation() {
            nameLabel.innerHTML = "&nbsp;";
            dobLabel.innerHTML = "&nbsp;";
            cityLabel.innerHTML = "&nbsp;";
            phoneNumberLabel.innerHTML = "&nbsp;";
            emailIdLabel.innerHTML = "&nbsp;";
            return true;
        }
        function Validate() {
            ClearValidation();
            var flag = true;
            var name = document.getElementById('Name');
            var dob = document.getElementById('Dob');
            var city = document.getElementById('City');
            var phoneNumber = document.getElementById('PhoneNumber');
            var emailId = document.getElementById('EmailId');
            var lengthOfPhoneNumber = ((phoneNumber.value).toString()).length;
            if (name.value == "") {
                nameLabel.innerHTML = "*Please enter a Name";
                flag = false;
                name.focus();
                return false;
            }
            if (dob.value == "") {
                dobLabel.innerHTML = "*Please enter date of birth";
                flag = false;
                dob.focus();
                return false;
            }
            var dobPattern = "[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}"
            if ((dob.value).match(dobPattern) == null) {
                dobLabel.innerHTML = "*Please enter a valid date of birth";
                flag = false;
                emailId.focus();
                return false;
            }
            if (city.value == "") {
                cityLabel.innerHTML = "*Please enter city";
                flag = false;
                city.focus();
                return false;
            }
            if (lengthOfPhoneNumber == 0) {
                phoneNumberLabel.innerHTML = "*Please enter the phone number";
            }
            if (lengthOfPhoneNumber != 10) {
                phoneNumberLabel.innerHTML = "*Please enter a 10 digit phone number";
                flag = false;
                phoneNumber.focus();
                return false;
            }
            if (((phoneNumber.value).toString()).match(/[a-z]/i)) {
                phoneNumberLabel.innerHTML = "*Please enter a 10 digit phone number";
                flag = false;
                phoneNumber.focus();
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
        #Div-Form
        {
            text-align: left;
            background-color: transparent;
            margin-left: auto;
            margin-right: auto;
            padding-bottom: 15px;
            width: 350px;
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
            width: 345px;
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
        #Background0
        {
            text-align: center;
            color: rgb(51,79,78);
            height:400px;
            width:1350;
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
            border-style: solid;
            border-width: 3px;
            border-color: rgb(217,133,59);
            background-image: url("<%:Url.Content("~/Content/images/Polygon-final.jpg")%>");
            background-color: transparent;
            padding: 20px;
            display: block;
            margin-left: auto;
            margin-right: auto;
            margin-top: 50px;
            margin-bottom: 50px;
            animation-duration: .5s;
            animation-name: bounceIn;
            animation-timing-function: ease-in-out;
            font-family: 'Segoe UI' , Frutiger, 'Frutiger Linotype' , 'Dejavu Sans' , 'Helvetica Neue' , Arial, sans-serif;
        }
        #Div-Footer
        {
            background-color:transparent;
            margin-left:auto;
            margin-right:auto;
            width:350px;
            text-align: right;
        }
        .ChangeViewButton
        {
            text-decoration:none;
            color:rgb(51,79,78);
            background-color:transparent;
            padding-top:10px;
        }
        .ChangeViewButton:hover
        {
            color:rgb(230,100,50);
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
        <div style="font-weight:bold;padding-top:30px; font-size:20px;">
            <label id="Message" style="padding:5px;">&nbsp;</label>
        </div>
        <div id="Background1">
            <h1 style="font-size: 30px; margin-top: 0px; text-align: center;">
                Update Contact Details
            </h1>
            <div class="editor-field">
                <%: Html.HiddenFor(model => model.Uid)%>
                <%: Html.ValidationMessageFor(model => model.Uid)%>
            </div>
            <div id="Div-Form">
                <div class="Div-TextBox">
                    
                    <%: Html.TextBoxFor(model => model.Name, new { @class = "TextBox" })%>
                    <label id="nameLabel" class="ErrorLabel">
                        &nbsp;</label>
                </div>
                <div class="Div-TextBox">
                    <%: Html.TextBoxFor(model => model.Dob, new { @class = "TextBox",@Value =Model.Dob.ToString("MM/dd/yyyy") })%>
                    <label id="dobLabel" class="ErrorLabel">
                        &nbsp;</label>
                </div>
                <div class="Div-TextBox">
                    <%: Html.TextBoxFor(model => model.City, new { @class = "TextBox" })%>
                    <label id="cityLabel" class="ErrorLabel">
                        &nbsp;</label>
                </div>
                <div class="Div-TextBox">
                    <%: Html.TextBoxFor(model => model.PhoneNumber, new { @class = "TextBox" })%>
                    <label id="phoneNumberLabel" class="ErrorLabel">
                        &nbsp;</label>
                </div>
                <div class="Div-TextBox">
                    <%: Html.TextBoxFor(model => model.EmailId, new { @class = "TextBox" })%>
                    <label id="emailIdLabel" class="ErrorLabel">
                        &nbsp;</label>
                </div>
            </div>
            <div id="Div-SubmitButton">
                <button id="SubmitButton" onclick="return UpdateContact()" type="submit">
                    Update</button>
            </div>
            <div id="Div-Footer">
                <%: Html.ActionLink("Back to List", "Index", "Contact",   
                    null, //   Route args if needed; null if not.
                    new { @class="ChangeViewButton"})%>
            </div>
        </div>
    </div>
    <% } %>
</asp:Content>
