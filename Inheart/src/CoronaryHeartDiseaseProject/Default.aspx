﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Default" %>

<!DOCTYPE html>
<html>
<head>
    <%--设置编码--%>
    <meta charset="utf-8" />
    <%--页面首次由浏览器加载时的初始缩放级别。--%>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <%--引用bootstrap--%>
    <link rel="stylesheet" href="./Content/bootstrap.min.css" />

    <link rel="stylesheet" href="./Styles/home.css" />
    <title>辽宁省冠心病急救网络信息平台</title>
</head>
<body>
    <table width="800" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: 50px;">
        <tr>
            <td>
                <div class="t1">
                    辽宁省冠心病急救网络信息平台
                </div>
            </td>
        </tr>
    </table>
    <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <div class="title-1">
                    &nbsp;&nbsp; 系统说明
                </div>
                <div class="sys_body">
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
                <div class="title-1">
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
        联系电话：024-24016114 | 电子信箱：lzqlr@medmail.com.cn | 辽宁省人民医院版权所有 <span class="cRed">&copy;2016</span>
    </div>
</body>
</html>
