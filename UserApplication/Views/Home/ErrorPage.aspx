<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>ErrorPage</title>
    <style type="text/css">
        #Body
        {
            background-image:url("<%:Url.Content("~/Content/Images/BlackWhiteAbstract-Polygon-Background-02-1024.jpg")%>");
            height:100%;
            width:100%;
        }
        #Logo
        {
            width: 100px; 
            height: 40px;
            margin-left: auto; 
            margin-right: auto;
        }
        #Div-Logo
        {
            text-align: center;
            width:150px;
            margin-right:auto;
            margin-left:auto;
        }
        .Heading
        {
            font-family:'Segoe UI', Frutiger, 'Frutiger Linotype', 'Dejavu Sans', 'Helvetica Neue', Arial, sans-serif;
        }
        #Background0
        {
            background-image: url("~/Content/images/Polygon-final.jpg");            
            text-align: center;
            color: rgb(51,79,78);
            color: #3A5919;
            padding-bottom:30px;
        }
    </style>
</head>
<body id="Body">
    <div id="Div-Logo">
        <img id="Logo" src="<%:Url.Content("~/Content/images/oie_transparent.png")%>" alt="Logo" />
    </div>
    <div id="Background0">
        <div id="Div-HeadingName">
            <h1 class="Heading">
            Error</h1>
        </div>
        <div id="Div-ErrorMessage">
            <%: ViewBag.ErrorMessage %>
        </div>
    </div>
    <div class="Return">
        <%: Html.ActionLink("Back", "Index","Contact") %>
    </div>
</body>
</html>
