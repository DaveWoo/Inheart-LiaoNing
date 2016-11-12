
// fix for deprecated method in Chrome 37
if (!window.showModalDialog) {
    window.showModalDialog = function (arg1, arg2, arg3) {

        var w;
        var h;
        var resizable = "no";
        var scroll = "no";
        var status = "no";

        // get the modal specs
        var mdattrs = arg3.split(";");
        for (i = 0; i < mdattrs.length; i++) {
            var mdattr = mdattrs[i].split(":");

            var n = mdattr[0];
            var v = mdattr[1];
            if (n) { n = n.trim().toLowerCase(); }
            if (v) { v = v.trim().toLowerCase(); }

            if (n == "dialogheight") {
                h = v.replace("px", "");
            } else if (n == "dialogwidth") {
                w = v.replace("px", "");
            } else if (n == "resizable") {
                resizable = v;
            } else if (n == "scroll") {
                scroll = v;
            } else if (n == "status") {
                status = v;
            }
        }

        var left = window.screenX + (window.outerWidth / 2) - (w / 2);
        var top = window.screenY + (window.outerHeight / 2) - (h / 2);
        //var targetWin = window.open(arg1, arg2, 'toolbar=no, location=no,directories=no, status=' + status + ', menubar=no, scrollbars=' + scroll + ', resizable=' + resizable + ', copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
        window.open(arg1, arg2, "height=100, width=400, toolbar =no, menubar=no, scrollbars=no, resizable=yes, location=yes, status=no");
        targetWin.document.write(arg2);
        targetWin.focus();
    };
}

function alert(msg, title, fontColor, width, height) {
    var content;
    content = "<html><head><title>" + title + "</title></head>";
    content += "<body   bgcolor='#f0fafc'>";
    content += "<font   color='" + fontColor + "'; padding:5px>" + msg + "</font>";
    content += "<br><center><button   style='width:80px; margin-top:20px'   onclick='window.close();'>确   定</button></center>";
    content += "</body></html>";
    var x = window.showModalDialog("alert.htm", content, "dialogWidth:" + width + "px;dialogHeight:" + height + "px;status:no;help:no;resizable=no;location=no;toolbar=no");
}

var pb_strConfirmCloseMessage;
var pb_blnCloseWindow = false;
pb_strConfirmCloseMessage = "确实要离开该页面吗?您的文章内容还没有进行保存！按“提交”继续，或按“取消”留在当前页面。";
function ConfirmClose() {
    if (pb_blnCloseWindow == false) {
        window.event.returnValue = pb_strConfirmCloseMessage;
        pb_blnCloseWindow = true;
    }
}

function ShowConfirmClose(blnValue) {
    if (blnValue) {
        document.body.onbeforeunload = ConfirmClose;
    } else {
        document.body.onbeforeunload = null;
    }
}

function ST1() {
    alert("急性ST段抬高性心肌梗死（STEMI） <br\>满足（1）或（2）任一项：  <br\>（1）缺血症状(静息时发作疼痛，气短，压榨样不适；或逐渐加重的上述症状；研究者确认症状继发于缺血)；   <br\>（2）ECG变化与心肌梗死改变一致：   <br\>    在没有既往左室高电压或传导异常的情况下在2个连续导联新出现显著的Q波(或V1-V2出现显著增高的R波)；<br\>≥2个连续导联有ST段抬高0.1mV以上; <br\>    出现新的左束支传导阻滞； <br\>（3）心肌标志物：<br\>    肌钙蛋白：定量检测位于心肌坏死的诊断范围内，否则至少其他的心肌标志物之一必须>2倍ULN； CK-MB ≥ULN。 ", "急性ST段抬高性心肌梗死（STEMI）", "#000000", 600, 300);
}

function NonST() {
    alert("急性非ST段抬高性心肌梗死（NSTEMI） <br\>（1）缺血症状(静息时发作疼痛，气短，压榨样不适；<br\>或逐渐加重的上述症状；研究者确认症状继发于缺血)；<br\>（2）ECG一过性ST段抬高，或ST段压低，或与心肌缺血相符的T波改变；  <br\>（3）伴有心肌坏死的生物标记物升高（CK和CK-MB或肌钙蛋白）,达到心肌梗死诊断标准。", "急性非ST段抬高性心肌梗死（NSTEMI）", "#000000", 600, 250);
}

function Other() {
    alert("不稳定型心绞痛： <br\>（1） 缺血症状(静息时发作疼痛，气短，压榨样不适；<br\>        或逐渐加重的上述症状；研究者确认症状继发于缺血)；  <br\>（2） ECG在一个或多个导联上有一过性或持久性ST段偏移0.1mV或0.1mV以上； <br\>（3） 不伴有心肌坏死的生物标记物升高（CK和CK-MB或肌钙蛋白）或心肌坏死的生物标记物升高但未达到心肌梗死诊断标准。 ", "不稳定型心绞痛", "#000000", 600, 250);
}