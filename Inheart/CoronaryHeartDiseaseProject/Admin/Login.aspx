<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="CoronaryHeartDiseaseProject.AdminLogin" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>����ʡ���Ĳ�����������Ϣƽ̨ -- ϵͳ��½</title>
    <link href="../Styles/admin.css" rel="stylesheet" type="text/css" />
    <base onmouseover="window.status='����ʡ���Ĳ�����������Ϣƽ̨';return true" />
</head>
<body background="../images/bg.gif">
    <form name="form1" id="form1" runat="server">
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <table width="320" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
        <tr class="header">
            <td height="25" colspan="2">
                <div align="center">
                    <strong><font color="#FFFFFF">����Ա��½</font></strong></div>
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td width="32%" height="25">
                �û�����
            </td>
            <td height="25">
                <input name="username" type="text" id="username"  style="width:210"  maxlength="16" title="�����������û���"
                    tabindex="2" />
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td height="25">
                ���룺
            </td>
            <td height="25">
                <input name="password" type="password" id="password"  style="width:210" maxlength="16" title="��������������"
                    tabindex="3" />
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td height="25">
                ��֤�룺
            </td>
            <td height="25">
                <input name="verify" type="text" title="��������֤��" size="5" maxlength="4" tabindex="4"
                    style="text-align: center; vertical-align: top" />
                <asp:Image ID="ValImage" runat="server" Width="60px" ImageUrl="~/Verfiy.aspx" Style="text-align: center;
                    vertical-align: middle;" ImageAlign="Baseline"></asp:Image>
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td height="25" colspan="2" align="center">
                <input style="cursor: hand" type="submit" value="��¼ϵͳ" name="B12" class="Button"
                    id="Submit1" onserverclick="Submit1_ServerClick" runat="server" tabindex="5" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input style="cursor: hand" type="reset" value="�����д" name="B1" class="Button" tabindex="6" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>