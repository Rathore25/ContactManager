<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<ContactManager.Models.ContactModel>>" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <link id="Link1" runat="server" rel="shortcut icon" href="~/Content/Images/iOS-contacts-logo.ico"
        type="image/x-icon" />
    <link id="Link2" runat="server" rel="icon" href="~/Content/Images/iOS-contacts-logo.ico"
        type="image/ico" />
    <%-- Save as Pdf --%>
    <script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
    <script src="../../Content/js/tableExport.jquery.plugin-master/jquery.base64.js"></script>
    <script src="../../Content/js/tableExport.jquery.plugin-master/tableExport.js"></script>
    <script src="../../Content/js/tableExport.jquery.plugin-master/html2canvas.js"></script>
    <script src="../../Content/js/tableExport.jquery.plugin-master/jspdf/libs/base64.js"></script>
    <script src="../../Content/js/tableExport.jquery.plugin-master/jspdf/libs/sprintf.js"></script>
    <script src="../../Content/js/tableExport.jquery.plugin-master/jspdf/jspdf.js"></script>


    <%--datatable--%>
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
        rel="stylesheet">
    
    <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">
    </style>
    <script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    
    <%--script for datatable--%>
    
    <script type="text/javascript">
        $(document).ready(function () {
            $('#ContactTable').dataTable({
                "columnDefs": [
                                { "orderable": false, "targets": 5 }
                               ],
                "dom": '<f<t><"bottom"ilp>>',
                "lengthMenu": [ 5,10, 25, 50, 100 ]
            });
            $('#exportpdf').bind('click', function (e) {
                debugger;
                $('#ContactTable').tableExport({ type: 'pdf', escape: 'false' });
            });        
        });
    </script>
    <style type="text/css">
        
       #Body 
       {
            font-family: "Segoe UI" , Frutiger, "Frutiger Linotype" , "Dejavu Sans" , "Helvetica Neue" , Arial, sans-serif;
            background-image: url("<%:Url.Content("~/Content/images/BlackWhiteAbstract-Polygon-Background-02-1024.jpg")%>");
            height: 100%;
            width: 100%;
            margin-top:0px;
            margin-left:0px;
        }
               
        #Div-Background 
        {
            color: rgb(51,79,78);
            margin-left: auto;
            margin-right: auto;
            /*width: 1200px;*/
            height: 100%;
                padding: 0px 40px;
        }
        #Div-TableHeading
        {
            background-color: transparent;
            text-align: center;
            font-weight: bold;
            display: flex;
        }
        #exportpdf
        {
            margin:15px;
        }
        #exportpdf : hover
        {
            transform:scale(1.2);
        }
        #Div-Header
        {
            background-color: transparent;
            /* float: right; */
            /*width: 1000px;*/
            text-align: right;
            margin-left: auto;
            margin-right: auto;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        @keyframes fadeInDown 
        { 
        0% { 
            opacity: 0; 
            transform: translateY(-20px); 
            } 
        100% { 
            opacity: 1; 
            transform: translateY(0); 
            } 
        }
        #Div-Table
        {
            display: block;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 100px;
            animation-duration: 1s;
            animation-name: fadeInDown;
            animation-timing-function: ease-in-out;
        }
        #ContactTable.dataTable.order-column tbody tr>.sorting_1,
        #ContactTable.dataTable.order-column tbody tr>.sorting_2,
        #ContactTable.dataTable.order-column tbody tr>.sorting_3,
        #ContactTable.dataTable.display tbody tr>.sorting_1,
        #ContactTable.dataTable.display tbody tr>.sorting_2,
        #ContactTable.dataTable.display tbody tr>.sorting_3 
        {
            background-color:transparent;
        }
        .dataTables_wrapper .dataTables_paginate .paginate_button.current, .dataTables_wrapper .dataTables_paginate .paginate_button.current:hover {
        color: #333333 !important;
        border: 1px solid #7c490f;
        background-color: #f5d4ae;
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #f5d4ae), color-stop(100%, #e6902e));
        /* Chrome,Safari4+ */
        background: -webkit-linear-gradient(top, #f5d4ae 0%, #e6902e 100%);
        /* Chrome10+,Safari5.1+ */
        background: -moz-linear-gradient(top, #f5d4ae 0%, #e6902e 100%);
        /* FF3.6+ */
        background: -ms-linear-gradient(top, #f5d4ae 0%, #e6902e 100%);
        /* IE10+ */
        background: -o-linear-gradient(top, #f5d4ae 0%, #e6902e 100%);
        /* Opera 11.10+ */
        background: linear-gradient(to bottom, #f5d4ae 0%, #e6902e 100%);
        /* W3C */ }
      .dataTables_wrapper .dataTables_paginate .paginate_button.disabled, .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:hover, .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:active {
        cursor: default;
        color: #666 !important;
        border: 1px solid transparent;
        background: transparent;
        box-shadow: none; }
      .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
        color: white !important;
        border: 1px solid #e3a156;
        background-color: #f7e5d1;
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #f7e5d1), color-stop(100%, #e3a156));
        /* Chrome,Safari4+ */
        background: -webkit-linear-gradient(top, #f7e5d1 0%, #e3a156 100%);
        /* Chrome10+,Safari5.1+ */
        background: -moz-linear-gradient(top, #f7e5d1 0%, #e3a156 100%);
        /* FF3.6+ */
        background: -ms-linear-gradient(top, #f7e5d1 0%, #e3a156 100%);
        /* IE10+ */
        background: -o-linear-gradient(top, #f7e5d1 0%, #e3a156 100%);
        /* Opera 11.10+ */
        background: linear-gradient(to bottom, #f7e5d1 0%, #e3a156 100%);
        /* W3C */ }
      .dataTables_wrapper .dataTables_paginate .paginate_button:active {
        outline: none;
        background-color: #eab982;
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #eab982), color-stop(100%, #e29c4d));
        /* Chrome,Safari4+ */
        background: -webkit-linear-gradient(top, #eab982 0%, #e29c4d 100%);
        /* Chrome10+,Safari5.1+ */
        background: -moz-linear-gradient(top, #eab982 0%, #e29c4d 100%);
        /* FF3.6+ */
        background: -ms-linear-gradient(top, #eab982 0%, #e29c4d 100%);
        /* IE10+ */
        background: -o-linear-gradient(top, #eab982 0%, #e29c4d 100%);
        /* Opera 11.10+ */
        background: linear-gradient(to bottom, #eab982 0%, #e29c4d 100%);
        /* W3C */
        box-shadow: inset 0 0 3px #111; }
        .dataTables_wrapper .dataTables_filter
        {
            float: left;
            text-align: right;
        }
        .dataTables_wrapper .dataTables_filter input
        {
            margin-left: 0.5em;
            border-radius: 8px;
            border-style: solid;
            border-width: 1px;
            border-color: rgb(51,79,78);
            padding-left:10px;
            font-weight:normal;
        }
        *:focus
        {
            outline: 0;
        }
        .bottom
        {
            width:100%;
            height:40px;
            display: inline-flex;
        }
        #ContactTable_length
        {
            padding-top:.755em;
            margin-left:auto;
            margin-right:auto;
            width:160px;
            text-align:center;            
        }
        #ContactTable
        {
            /*padding: 30px;*/
            margin-left: auto;
            margin-right: auto;
            background-color: transparent;
            text-align: left;
            border-style: solid;
            border-collapse:collapse;
            /*border-color: rgb(217,133,59);*/
        }
        #ContactTable td
        {
            padding-left: 5px;
            padding-right: 5px;
            padding-top: 10px;
            padding-bottom: 10px;
            border-style: solid;
            border-width: thin;
            border-collapse: collapse;
            border-color: rgb(51,79,78);
        }
        #ContactTable th
        {
            padding-left: 5px;
            padding-right: 5px;
            padding-top: 10px;
            padding-bottom: 10px;
            border-style: solid;
            border-width: thin;
            border-collapse: collapse;
            border-color: rgb(51,79,78);            
        }
        #ContactTable tr:nth-child(even)
        {
            background-color: #ddd;
        }
        #ContactTable tr:nth-child(odd)
        {
            background-color:White;
        }
        #ContactTable tr:hover
        {
            background-color:rgb(165, 219, 219);
        }
        #Delete
        {
            background-image:url("<%:Url.Content("~/Content/images/delete-20x20.png")%>");
            display:block;
            float:right;
            height:20px;
            width:20px;
            text-decoration:none;
            margin-left:5px;
            background-color:transparent;
        }
        #Delete:hover
        {
            transform:scale(1.2);
        }
        #Update
        {
            background-image:url("<%:Url.Content("~/Content/images/edit-20x20.png")%>");
            display:block;
            float:left;
            height:20px;
            width:20px;
            text-decoration:none;
            background-color:transparent;
        }
        #Update:hover
        {
            transform:scale(1.2);
        }
        #Create
        {
            border-radius: 6px;
            border: 1px solid rgb(208, 39, 24);
            display: inline-block;
            cursor: pointer;
            color: rgb(255, 255, 255);
            font-size: 17px;
            font-weight: bolder;
            padding: 4px 16px;
            text-decoration: none;
            text-shadow: rgb(129, 14, 5) 1px 2px 4px;
            background: linear-gradient(rgb(230, 160, 90) 40%, rgb(190, 80, 50) 100%) rgb(217,133,70);
            text-shadow: rgba(0,0,0,.4) 0 1px 0;
            font-family: 'Segoe UI' , Frutiger, 'Frutiger Linotype' , 'Dejavu Sans' , 'Helvetica Neue' , Arial, sans-serif;
        }
        #Create:hover
        {
            background: linear-gradient(rgb(240, 180, 100) 40%, rgb(180, 90, 60) 100%) rgb(217,133,59);
        }
        #Create:active
        {
            background-color: rgb(230,140,70);
        }
        #Header
        {
            width: 100%;
            height: 60px;
            margin-left: 0px;
            margin-right: 10px;
            border-bottom-style: solid;
            border-bottom-color: rgb(217,133,80);
            background-image: url("<%:Url.Content("~/Content/images/Polygon-final.jpg")%>");
            color: rgb(51,79,78);
        }
        #Div-LogoHeadingSubheading
        {
            width: 50%;
            float: left;
            height: 100%;
            display: flex;
        }
        #Logo
        {
                height: 56px;
    width: 64px;
            float: left;
            padding: 3px;
        }
        #Heading
        {
            margin-top: auto;
            margin-bottom: auto;
            font-size: 30px;
            padding: 10px;
                font-weight: bold;
        }
        #SubHeading
        {
            margin-top: auto;
            margin-bottom: auto;
            padding: 5px;
                font-size: 1.17em;
    font-weight: bold;
}
        }
        #Div-Logout
        {
                width: 5%;
    height: 100%;
    float: right;
    margin-top: auto;
    margin-bottom: auto;
    margin-right: 10px;
        }
        #Logout:hover
        {
            transform:scale(1.1);
        }
    </style>
    <meta name="viewport" content="width=device-width" />
    <title>Contacts</title>
</head>
<body id="Body">
    <div id="Header">
        <div id="Div-LogoHeadingSubheading">
            <img id="Logo" src="<%:Url.Content("~/Content/images/iOS-contacts-logo.png") %>" alt="Logo" />
            <h1 id="Heading">
                iManager</h1>
            <h3 id="SubHeading">
                -Manage your contacts easily</h3>
        </div>
        <div id="Div-Logout">
            <a href="../Home/Logout" title="Logout" style="float: right; padding: 10px;">
                <img id="Logout" src="<%:Url.Content("~/Content/images/Logout.png") %>" alt="Logo" /></a>
        </div>
    </div>
    <div id="Div-Background">
        <div id="Div-TableHeading">
        
            <div style="width: 250px;float: left;">
                <h1 id="BodyHeading" style="font-weight: bold;
                                            text-decoration: underline;
                                            text-align: left;
                                            margin-top: 10px;
                                            margin-bottom: 10px;">
                    My Contacts</h1>
            </div>
            <div style="width:70px; display:none">
                <img id="exportpdf" src="<%:Url.Content("~/Content/images/SaveAsPdf 35x35.png") %>" title="Export to pdf" alt="Export to pdf" /></div>
        </div>
        <div id="Div-Header">
            <%: Html.ActionLink("Create", "Create", "Contact",   
                    null, //   Route args if needed; null if not.
                    new {id="Create"})%>
        </div>
        <div id="Div-Table">
        <div class="table-responsive">
            <table id="ContactTable" class="display table" width="100%">
                <thead>
                    <tr class="TableHead" style="background-color: rgb(51,79,78); color: White;">
                        <th>
                            Name
                        </th>
                        <th>
                            Date of Birth
                        </th>
                        <th>
                            City
                        </th>
                        <th style="text-align: right; padding-right:20px;">
                            Phone Number
                        </th>
                        <th>
                            Email Id
                        </th>
                        <th style="text-align: center">
                            Action
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <% foreach (var Contact in Model)
                       { %>
                    <tr class="TableRow">
                        <td>
                            <%= Html.Encode(Contact.Name)%>
                        </td>
                        <td>
                            <%= Html.Encode(Contact.Dob.ToString("dd-MMM-yyyy"))%>
                        </td>
                        <td>
                            <%= Html.Encode(Contact.City)%>
                        </td>
                        <td style="text-align: right;padding-right:10px;">
                            <%= Html.Encode(Contact.PhoneNumber)%>
                        </td>
                        <td>
                            <%= Html.Encode(Contact.EmailId)%>
                        </td>
                        <td style=" width:60px;padding-right:20px; padding-left:20px;">
                            <%: Html.ActionLink(" ", "Edit", "Contact",
                                                                   new { id = Contact.Uid },
                                        new {id="Update", Title="Edit"})%>
                            <%: Html.ActionLink(" ", "Delete", "Contact",
                                                                   new { uid = Contact.Uid }, //   Route args if needed; null if not.
                                        new {id="Delete", Title="Delete", onclick = "return confirm('Do you want to delete this contact?');" })%>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            </div>
        </div>
    </div>
</body>
</html>
