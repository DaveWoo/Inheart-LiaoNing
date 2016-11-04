<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>辽宁省冠心病急救网络信息平台</title>
    <script language="javaScript">

        function alert(msg, title, fontColor, width, height) {
            var content;
            content = "<html><head><title>" + title + "</title></head>";
            content += "<body   bgcolor='#f0fafc'>";
            content += "<font   color='" + fontColor + "'; padding:5px>" + msg + "</font>";
            content += "<br><center><button   style='width:80px; margin-top:20px'   onclick='window.close();'>确   定</button></center>";
            content += "</body></html>";
            var x = window.showModalDialog("alert.htm", content, "dialogWidth:" + width + "px;dialogHeight:" + height + "px;status:no;help:no");
        }
    </script>
    <script language="javascript" type="text/javascript">
        function ST1() {
            alert("1．本系统是为配合辽宁省医学高峰建设工程—“辽宁省基层医疗机构急性<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ST段抬高型心肌梗死规范化救治” 项目的实施而创建。<br />2．本系统使用者为全省范围内经过规范化建设、具有急性心肌梗死诊断和救治能<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;力的县、区级综合医院或同等规模级别的医院心内科或急诊科相关医务人员。<br />3．本系统录入的参数为上述医院连续收治的急性ST段抬高型心肌梗死患者的<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;基本诊疗信息。<br />4．“辽宁省心血管专业医疗质量控制中心”和“辽宁省心血管病介入诊疗<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;技术质量控制中心”负责本系统的日常维护及数据的管理。", "系统说明", "#000000", 600, 300);
        }
    </script>
    <style>
        html, body {
            height: 100%;
            margin: 0px;
            background-image: url(../images/va_page_05.jpg);
            background-repeat: repeat-x;
            background-position: bottom;
            background-color: #EDF5FA;
            font-size: 18px;
        }

        A:link {
            line-height: 23px;
            color: #000000;
            font-size: 18px;
            font-weight: normal;
            text-decoration: none;
        }

        A:visited {
            line-height: 23px;
            color: #000000;
            font-size: 18px;
            font-weight: normal;
            text-decoration: none;
        }

        A:active {
            line-height: 23px;
            font-size: 18px;
            font-weight: normal;
            text-decoration: none;
        }

        A:hover {
            line-height: 23px;
            color: #fc7d01;
            font-size: 18px;
            font-weight: normal;
            text-decoration: none;
        }

        .rs-topic .head ul li a:hover {
            color: #546b8c;
        }

        .rs-topic .head ul li.sel th {
            color: #333;
            table-layout: fixed;
            font-size: 16px;
            word-break: break-all;
            line-height: 200%;
            border: 1px solid #F0F5FD;
            background: #fafbfc;
        }

        th {
            table-layout: fixed;
            font-size: 16px;
            word-break: break-all;
            line-height: 200%;
            border: 1px solid #F0F5FD;
        }

        td {
            table-layout: fixed;
            font-size: 16px;
            word-break: break-all;
            line-height: 200%;
            border: 1px solid #F0F5FD;
        }

        .relation-split {
            padding: 0 5px;
            color: #999;
            font-size: 16px;
            line-height: 14px;
        }

        .left {
            width: 200px;
        }

        .right {
            width: 300px;
            font-size: 18px;
        }

        #leftDiv {
            float: left;
        }

        #rightDiv {
            float: left;
        }

        .left1 {
            width: 120px;
        }

        .left2 {
            width: 120px;
        }

        .left3 {
            width: 120px;
        }

        .left4 {
            width: 120px;
        }

        .left5 {
            width: 120px;
        }

        .t1 {
            font-size: 30px;
        }

        li {
            list-style-type: decimal;
            line-height: normal;
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
    <script language="javascript">
        var curId; // 保存全局id
        document.onclick = Hanlder;
        function Hanlder(e) {
            e = e || event;
            var tag = e.srcElement || e.target;
            if (tag.id) {
                curId = tag.id;
            }
        }
    </script>
    <script language="javascript">

        function show_hiddendiv(obj) {
            document.getElementById(obj.parent.curId + "_hidden_div").style.display = 'block';
            document.getElementById(obj.parent.curId + "_a").href = 'javascript:hidden_showdiv(this);';
            document.getElementById(obj.curId).innerHTML = "[-]";
        }
        function hidden_showdiv(obj) {
            document.getElementById(obj.parent.curId + "_hidden_div").style.display = 'none';
            document.getElementById(obj.parent.curId + "_a").href = 'javascript:show_hiddendiv(this);';
            document.getElementById(obj.curId).innerHTML = "[+]";
        }
    </script>
</head>
<body>
    <table width="800" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: 50px;">
        <tr>
            <td>
                <h2 style="color: Blue; text-align: center; font-family: 黑体" class="t1">辽宁省冠心病急救网络信息平台
                </h2>
            </td>
        </tr>
        <%--     <tr>
                <td>
                    <asp:Image runat="server" ImageUrl="~/Images/liaoning2.png" Width="977px" Height="300px" />
                </td>
            </tr>--%>
    </table>
    <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <div style="clear: both; font-size: 14px; left: 30px; font-family: 微软雅黑; color: #333; margin-right: auto; background-color: #c7d1e0">
                    &nbsp;&nbsp; 系统说明
                </div>
                <div style="font-family: 楷体; font-size: 14px; margin: 0px; padding: 0px;">
                    <ul>
                        <li>本系统是为配合辽宁省医学高峰建设工程—“辽宁省基层医疗机构急性ST段抬高型心肌梗死规范化救治” 项目的实施而创建。</li>
                        <li>本系统使用者为全省范围内经过规范化建设、具有急性心肌梗死诊断和救治能力的县、区级综合医院或同等规模级别的医院心内科或急诊科相关医务人员。</li>
                        <li>本系统录入的参数为上述医院连续收治的急性ST段抬高型心肌梗死患者的基本诊疗信息。</li>
                        <li>“辽宁省心血管专业医疗质量控制中心”和“辽宁省心血管病介入诊疗技术质量控制中心”负责本系统的日常维护及数据的管理。</li>
                    </ul>
                </div>
            </td>
        </tr>
    </table>
    <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <div style="clear: both; font-size: 14px; left: 30px; font-family: 微软雅黑; color: #333; margin-right: auto; background-color: #c7d1e0">
                    &nbsp;&nbsp; 选择医院所在城市 点击进入
                </div>
            </td>
        </tr>
    </table>
    <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <div id="leftDiv" style="margin-left: auto;">
                    <div>
                        <table bordercolor="#DEDFE1" cellpadding="0" cellspacing="0" border="0">
                            <tbody>
                                <tr>
                                    <td class="left">
                                        <span class="relation-split">▪</span> <a id="shenyang_a" href="Login.aspx?hr=shenyang">沈阳市</a>
                                    </td>
                                    <td class="left">
                                        <span class="relation-split">▪</span> <a id="A12" href="Login.aspx?hr=dalian">大连市</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left">
                                        <span class="relation-split">▪</span> <a id="A3" href="Login.aspx?hr=anshan">鞍山市</a>
                                    </td>
                                    <td class="left">
                                        <span class="relation-split">▪</span> <a id="A5" href="Login.aspx?hr=fushun">抚顺市</a>
                                    </td>
                                    <td class="left">
                                        <span class="relation-split">▪</span> <a id="A11" href="Login.aspx?hr=benxi">本溪市</a>
                                    </td>
                                    <td class="left">
                                        <span class="relation-split">▪</span> <a id="A4" href="Login.aspx?hr=dandong">丹东市</a>
                                    </td>
                                </tr>
                                <%--    <tr>
                                        <td>
                                            <a href="Admin/SuperAdmin.aspx"><span style="color: Red">超级管理员入口<span></span></a>
                                        </td>
                                    </tr>--%>
                                <tr>
                                    <td class="left">
                                        <span class="relation-split">▪</span> <a id="A2" href="Login.aspx?hr=jinzhou">锦州市</a>
                                    </td>
                                    <td class="left">
                                        <span class="relation-split">▪</span> <a id="A9" href="Login.aspx?hr=yingkou">营口市</a>
                                    </td>
                                    <td class="left">
                                        <span class="relation-split">▪</span> <a id="A8" href="Login.aspx?hr=fuxin">阜新市</a>
                                    </td>
                                    <td class="left">
                                        <span class="relation-split">▪</span> <a id="A13" href="Login.aspx?hr=liaoyang">辽阳市</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left">
                                        <span class="relation-split">▪</span> <a id="A16" href="Login.aspx?hr=panjin">盘锦市</a>
                                    </td>
                                    <td class="left">
                                        <span class="relation-split">▪</span> <a id="A17" href="Login.aspx?hr=tieling">铁岭市</a>
                                    </td>
                                    <td class="left">
                                        <span class="relation-split">▪</span> <a id="A18" href="Login.aspx?hr=chaoyang">朝阳市</a>
                                    </td>
                                    <td class="left">
                                        <span class="relation-split">▪</span> <a id="A19" href="Login.aspx?hr=huludao">葫芦岛市</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <div class="foot">
        联系电话：024-24016114 - 电子信箱：lzqlr@medmail.com.cn<br />
        辽宁省人民医院版权所有<br />
        <span class="cRed">&copy;2012</span>
    </div>
</body>
</html>
