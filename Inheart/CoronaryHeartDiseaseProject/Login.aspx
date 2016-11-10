<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Login" %>

<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link rel="stylesheet" href="Styles/admin.css" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
    <base onmouseover="window.status='辽宁省冠心病急救网络信息平台';return true" />
    <title>辽宁省冠心病急救网络信息平台--系统登陆</title>
</head>
<body >
    <form name="form1" id="form1" class="form-horizontal" runat="server">
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <table border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder" >
            <tr class="headerLongin">
                <td colspan="2">
                    <div>
                        <strong><font color="#FFFFFF">&nbsp; 辽宁省冠心病急救网络信息平台 -- 系统登陆 &nbsp; </font></strong>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="padding-right: 0; padding-left: 20px;">
                    <div style="margin-top: -40px">
                        <asp:Image runat="server" ImageUrl="~/Images/112.png" Width="120" />
                    </div>
                </td>
                <td>
                    <table style="margin-top: 20px;margin-left:20px;">
                        <tr>
                            <td style="width: 80px;">地&nbsp;&nbsp;&nbsp;区：</td>
                            <td height="25" class="loginleft">
                               &nbsp;&nbsp;&nbsp;<%=HospitalRegion%>
                            </td>
                        </tr>
                        <tr>
                            <td height="25">医&nbsp;&nbsp;&nbsp;院：</td>
                            <td>
                                <asp:DropDownList ID="Hospitial" TabIndex="1" style="width:200px" runat="server" CssClass="form-control" />
                            </td>
                        </tr>
                        <tr>
                            <td height="25">用户名：</td>
                            <td height="25" class="loginleft">
                                <input name="username" type="text" id="username" maxlength="16" style="width:200px" placeholder="请输入您的用户名"   title="请输入您的用户名"
                                    class="form-control" tabindex="2" />
                            </td>
                        </tr>
                        <tr>
                            <td height="25">密&nbsp;&nbsp;&nbsp;码：</td>
                            <td height="25" class="loginleft">
                                <input name="password" type="password" id="password" maxlength="16" style="width:200px" placeholder="请输入您的密码"   title="请输入您的密码"
                                    class="form-control" tabindex="3" />
                            </td>
                        </tr>
                        <tr>
                            <td>验证码：</td>
                            <td>
                                <div class="form-group" >
                                    <div class="col-xs-3" style="padding-right:0;width:139px;">
                                        <input style="width:139px;" name="verify" type="text" title="请输入验证码" placeholder="验证码" size="5" maxlength="4" tabindex="4" class="form-control" /></div>
                                    <div class="col-xs-2" style="padding-right:0; margin-right:0;margin-top:2px">
                                        <asp:Image ID="ValImage" runat="server" Width="60px" Height="30px" ImageUrl="~/Verfiy.aspx" ImageAlign="Baseline"></asp:Image>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding-bottom: 20px">
                                <input type="submit" value="登录系统" name="B12" class="btn btn-success " style="margin-left: 85px;width:200px"
                                    id="Submit1" onserverclick="Submit_ServerClick" runat="server" tabindex="5" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
    </form>
</body>
</html>