<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.ReportingManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="Styles/main.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css">
    <script src="/Scripts/bootstrap.min.js"></script>
    <script src="/Scripts/jquery-1.9.1.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script language="javascript" type="text/javascript">
        function CheckAll(form) {
            for (var i = 0; i < form.elements.length; i++) {
                var e = form.elements[i];
                if (e.name != 'chkall')
                    if (e.disabled == 0) {
                        e.checked = form.chkall.checked;
                    }
            }
        }
        function btnAddMedical_onclick() {

        }

    </script>
    <title></title>
    <style type="text/css">
        .tableborder {
            background: #D6E0EF;
            border: 1px solid #698CC3;
        }

        .header {
            font: 9pt Tahoma, Verdana;
            color: #FFFFFF;
            font-weight: bold;
            background-color: #66aadb;
        }

        .Button {
            border: groove inset 1px #000000;
            background: #84B0DC;
            filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#84B0DC',endColorstr='#ffffff', gradientType='0')progid:DXImageTransform.Microsoft.dropshadow(OffX=2, OffY=2, Color='#8b9b99', Positive='true');
            color: black;
            font-family: Comic Sans MS;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="sc" runat="server">
        </asp:ScriptManager>
        <div>
            <asp:GridView ID="GridView1" runat="server" CellPadding="5" AutoGenerateColumns="false">
            </asp:GridView>
            <table align="center" border="0" cellpadding="3" cellspacing="1" class="tableborder"
                width="100%">
                <tr bgcolor="#ffffff">
                    <td colspan="4" height="25">
                        <div align="right">
                            <input id="btnImportExcel" name="Submit822" type="button" value="导出Excel" runat="server"
                                align="right" class="Button" onserverclick="ImportExcel_Click" />&nbsp;&nbsp;
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
