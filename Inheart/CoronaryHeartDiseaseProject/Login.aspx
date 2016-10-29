<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CoronaryHeartDiseaseProject.Login" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>辽宁省冠心病急救网络信息平台--系统登陆</title>
    <link href="Styles/admin.css" rel="stylesheet" type="text/css" />
    <base onmouseover="window.status='辽宁省冠心病急救网络信息平台';return true" />
    <style type="text/css">
        .style1
        {
            width: 209px;
        }
        .foot
        {
            position: relative;
            margin-left: auto;
            color: #4D4D4D;
            width: 960px;
            line-height: 21px;
            clear: both;
            border-top: 1px solid #4D4D4D;
            text-align: center;
            bottom: 0px;
            left: 10%;
            right: 10%;
        }
    </style>
</head>
<body background="images/bg.gif">
    <form name="form1" id="form1" runat="server">
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <table border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
        <tr class="headerLongin">
            <td height="25" colspan="2">
                <div align="center">
                    <strong><font color="#FFFFFF">&nbsp; 辽宁省冠心病急救网络信息平台 -- 系统登陆 &nbsp; </font></strong>
                </div>
            </td>
        </tr>
        <tr>
            <td style="padding-right: 50px;">
                <asp:Image runat="server" ImageUrl="~/Images/112.png" Width="120" />
            </td>
            <td>
                <table>
                    <tr>
                        <td height="25">
                            地&nbsp;&nbsp;&nbsp;区：
                        </td>
                        <td height="25" class="style1">
                            <%=HospitalRegion%>
                        </td>
                    </tr>
                    <tr>
                        <td height="25">
                            医&nbsp;&nbsp;&nbsp;院：
                        </td>
                        <td height="25" class="style1">
                            <asp:DropDownList ID="Hospitial" runat="server" Width="242px" />
                        </td>
                    </tr>
                    <tr>
                        <td height="25">
                            用户名：
                        </td>
                        <td height="25" class="style1">
                            <input name="username" type="text" id="username" maxlength="16" title="请输入您的用户名"
                                class="tableWidth" tabindex="2" />
                        </td>
                    </tr>
                    <tr>
                        <td height="25">
                            密&nbsp;&nbsp;&nbsp;码：
                        </td>
                        <td height="25" class="style1">
                            <input name="password" type="password" id="password" maxlength="16" title="请输入您的密码"
                                class="tableWidth" tabindex="3" />
                        </td>
                    </tr>
                    <tr>
                        <td height="25">
                            验证码：
                        </td>
                        <td height="25" class="style1">
                            <input name="verify" type="text" title="请输入验证码" size="5" maxlength="4" tabindex="4"
                                style="text-align: center; vertical-align: top" />
                            <asp:Image ID="ValImage" runat="server" Width="60px" ImageUrl="~/Verfiy.aspx" Style="text-align: center;
                                vertical-align: middle;" ImageAlign="Baseline"></asp:Image>
                        </td>
                    </tr>
                    <tr>
                        <td height="25" colspan="2" align="center">
                            <input style="cursor: hand" type="submit" value="登录系统" name="B12" class="Button"
                                id="Submit1" onserverclick="Submit_ServerClick" runat="server" tabindex="5" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <input style="cursor: hand" type="reset" value="清除重写" name="B1" class="Button" tabindex="6" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    </form>
    <div class="foot">
        联系电话：024-24016114 - 电子信箱：lzqlr@medmail.com.cn<br />
        辽宁省人民医院版权所有<br />
        <span class="cRed">&copy;2012</span>
    </div>
</body>
</html>
