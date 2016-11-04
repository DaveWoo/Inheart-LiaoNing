<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.AdminLogin" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>辽宁省冠心病急救网络信息平台 -- 系统登陆</title>
    <link href="../Styles/admin.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css">
    <script src="/Scripts/bootstrap.min.js"></script>
    <script src="/Scripts/jquery-1.9.1.min.js"></script>
    <base onmouseover="window.status='辽宁省冠心病急救网络信息平台';return true" />
</head>
<body background="../images/bg.gif">
    <form name="form1" id="form1" runat="server">
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <table width="320" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
            <tr class="headerLongin">
                <td height="25" colspan="2">
                    <div align="center">
                        <strong><font color="#FFFFFF">管理员登陆</font></strong>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 80px; height: 25px;padding-left:10px;padding-top:20px">用户名：
                </td>
                <td >
                    <input name="username" type="text" id="username" class="form-control" style="margin-top:20px;margin-right:10px" maxlength="16" title="请输入您的用户名"
                        tabindex="2" />
                </td>
            </tr>
            <tr>
                <td style="width: 80px; height: 25px;padding-left:10px;" >密码：
                </td>
                <td height="25">
                    <input name="password" type="password" id="password" class="form-control" maxlength="16" title="请输入您的密码"
                        tabindex="3" />
                </td>
            </tr>
            <tr>
                <td style="width: 80px; height: 25px;padding-left:10px;">验证码：
                </td>
                <td>
                    <div class="form-group" >
                        <div class="col-xs-5" style="margin-left:0;padding-left:0">
                            <input name="verify" type="text" title="请输入验证码" size="5" maxlength="4" tabindex="4" class="form-control"
                                style="width: 90px;" />
                        </div>
                        <div class="col-xs-2">
                            <asp:Image ID="Image1"  runat="server" Width="60px" Height="32px" ImageUrl="~/Verfiy.aspx" ImageAlign="Baseline"></asp:Image>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="padding-bottom: 10px;padding-top:10px" >
                    <input type="submit" value="登录系统" name="B12" class="btn btn-success " style="margin-left: 80px"
                        id="Submit2" onserverclick="Submit1_ServerClick" runat="server" tabindex="5" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
