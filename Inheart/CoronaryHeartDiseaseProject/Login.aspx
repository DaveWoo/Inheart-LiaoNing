<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Login" %>

<html>
<head>
    <meta charset="utf-8" />
    <title>辽宁省冠心病急救网络信息平台--系统登陆</title>
    <link href="Styles/admin.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css">
    <script src="/Scripts/bootstrap.min.js"></script>
    <script src="/Scripts/jquery-1.9.1.min.js"></script>
    <base onmouseover="window.status='辽宁省冠心病急救网络信息平台';return true" />
    <style type="text/css">
        .style1 {
            width: 209px;
        }

        .foot {
            margin-top: 150px;
            position: relative;
            margin-left: auto;
            color: #4D4D4D;
            line-height: 21px;
            clear: both;
            text-align: center;
            bottom: 0px;
        }
    </style>
</head>
<body background="images/bg.gif">
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
        <table border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder" style="width: 500px;">
            <tr class="headerLongin">
                <td colspan="2">
                    <div>
                        <strong><font color="#FFFFFF">&nbsp; 辽宁省冠心病急救网络信息平台 -- 系统登陆 &nbsp; </font></strong>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="padding-right: 20px; padding-left: 20px;">
                    <div style="margin-top: -40px">
                        <asp:Image runat="server" ImageUrl="~/Images/112.png" Width="120" />
                    </div>
                </td>
                <td>
                    <table style="margin-top: 20px">
                        <tr>
                            <td style="width: 80px;">地&nbsp;&nbsp;&nbsp;区：
                            </td>
                            <td height="25" class="style1">
                                <%=HospitalRegion%>
                            </td>
                        </tr>
                        <tr>
                            <td height="25">医&nbsp;&nbsp;&nbsp;院：
                            </td>
                            <td>
                                <asp:DropDownList ID="Hospitial" TabIndex="1" runat="server" CssClass="form-control" />
                            </td>
                        </tr>
                        <tr>
                            <td height="25">用户名：
                            </td>
                            <td height="25" class="style1">
                                <input name="username" type="text" id="username" maxlength="16" title="请输入您的用户名"
                                    class="form-control" tabindex="2" />
                            </td>
                        </tr>
                        <tr>
                            <td height="25">密&nbsp;&nbsp;&nbsp;码：
                            </td>
                            <td height="25" class="style1">
                                <input name="password" type="password" id="password" maxlength="16" title="请输入您的密码"
                                    class="form-control" tabindex="3" />
                            </td>
                        </tr>
                        <tr>
                            <td>验证码：
                            </td>
                            <td>
                                <div class="form-group">
                                    <div class="col-xs-5">
                                        <input name="verify" type="text" title="请输入验证码" size="5" maxlength="4" tabindex="4" class="form-control"
                                            style="width: 90px; text-align: center; vertical-align: top" />
                                    </div>
                                    <div class="col-xs-2">
                                        <asp:Image ID="ValImage" runat="server" Width="60px" Height="32px" ImageUrl="~/Verfiy.aspx" ImageAlign="Baseline"></asp:Image>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding-bottom: 20px">
                                <input type="submit" value="登录系统" name="B12" class="btn btn-success " style="margin-left: 80px"
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
    <%--   <div class="foot">
        联系电话：024-24016114 - 电子信箱：lzqlr@medmail.com.cn<br />
        辽宁省人民医院版权所有<br />
        <span class="cRed">&copy;2012</span>
    </div>--%>
</body>
</html>
