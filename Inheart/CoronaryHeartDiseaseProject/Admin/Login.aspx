<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.AdminLogin" %>

<!DOCTYPE html>
<html>
<head>
    <%--设置编码--%>
    <meta charset="utf-8" />
    <%--页面首次由浏览器加载时的初始缩放级别。--%>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <%--管理页面相关的样式--%>
    <link rel="stylesheet" href="../Styles/admin.css" />

    <%--引用bootstrap和相关的Jquery--%>
    <link rel="stylesheet" href="../Content/bootstrap.min.css" />
    <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap.min.js"></script>

    <base onmouseover="window.status='辽宁省冠心病急救网络信息平台';return true" />
    <title>辽宁省冠心病急救网络信息平台 -- 系统登陆</title>
</head>
<body>
    <form name="form1" id="form1" runat="server">
        <table style="margin-top: 90px;" width="320" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborderLogin">
            <tr>
                <td colspan="2" class="headerLongin">
                    <span>管理员登陆</span>

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
                <td style="width: 80px; height: 25px; padding-left: 20px;">密&nbsp;&nbsp;&nbsp;码：</td>
                <td>
                    <input name="password" type="password" id="password" class="form-control-user" maxlength="16" placeholder="请输入您的密码" title="请输入您的密码"
                        tabindex="3" />
                </td>
            </tr>
            <tr>
                <td style="width: 80px; height: 25px; padding-left: 20px;">验证码：
                </td>
                <td>
                    <div class="form-group">
                        <div class="col-xs-2" style="width: 140px; margin-left: 0; padding-left: 0; padding-right: 0">
                            <input name="verify" type="text" title="请输入验证码" size="5" maxlength="4" tabindex="4" class="form-control" placeholder="验证码"
                                style="width: 140px;" />
                        </div>
                        <div class="col-xs-2" style="padding-right: 0; padding-left: 0; padding-top: 2px">
                            <asp:Image ID="Image1" runat="server" Width="62px" Height="32px" ImageUrl="~/Verfiy.aspx" ImageAlign="Baseline"></asp:Image>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="padding-bottom: 10px; padding-top: 10px">
                    <input type="submit" value="登录系统" name="B12" class="btn btn-info " style="margin-left: 99px; width: 200px"
                        id="Submit2" onserverclick="Submit1_ServerClick" runat="server" tabindex="5" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
