<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.AdminLogin" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="../Styles/admin.css" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
    <base onmouseover="window.status='辽宁省冠心病急救网络信息平台';return true" />
    <title>辽宁省冠心病急救网络信息平台 -- 系统登陆</title>
</head>
<body>
    <form name="form1" id="form1" runat="server">
        <table style="margin-top: 90px;" width="320" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
            <tr class="headerLongin">
                <td height="30" colspan="2">
                    <div align="center">
                        <strong><font color="#FFFFFF">管理员登陆</font></strong>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 100px; height: 25px; padding-left: 20px; padding-top: 20px;">用户名：</td>
                <td style="padding-top: 20px;">
                    <input name="username" type="text" id="username" class="form-control-user" maxlength="16" placeholder="请输入您的用户名" title="请输入您的用户名"
                        tabindex="2" />
                </td>
            </tr>
            <tr>
                <td style="width: 80px; height: 25px; padding-left: 20px;">密码：</td>
                <td height="25">
                    <input name="password" type="password" id="password" class="form-control-user" maxlength="16" placeholder="请输入您的密码" title="请输入您的密码"
                        tabindex="3" />
                </td>
            </tr>
            <tr>
                <td style="width: 80px; height: 25px; padding-left: 20px;">验证码：
                </td>
                <td>
                    <div class="form-group">
                        <div class="col-xs-2" style="width: 139px;margin-left: 0; padding-left: 0;padding-right:0">
                            <input name="verify" type="text" title="请输入验证码" size="5" maxlength="4" tabindex="4" class="form-control" placeholder="验证码"
                                style="width: 139px;" />
                        </div>
                        <div class="col-xs-2" style="padding-right:0;padding-left:0;padding-top:2px">
                            <asp:Image ID="Image1" runat="server" Width="60px" Height="30px" ImageUrl="~/Verfiy.aspx" ImageAlign="Baseline"></asp:Image>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="padding-bottom: 10px; padding-top: 10px">
                    <input type="submit" value="登录系统" name="B12" class="btn btn-success " style="margin-left: 100px; width: 198px"
                        id="Submit2" onserverclick="Submit1_ServerClick" runat="server" tabindex="5" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
