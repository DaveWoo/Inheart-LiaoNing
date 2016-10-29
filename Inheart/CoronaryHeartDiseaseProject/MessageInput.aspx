<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MessageInput.aspx.cs" Inherits="CoronaryHeartDiseaseProject.MessageInput" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link href="Styles/main.css" type="text/css" rel="stylesheet" />
  <%--  <script src="Scripts/CalendarAll.js" type="text/javascript"></script>--%>
  <%--  <script src="Scripts\Calendar3.js" type="text/javascript"></script>--%>
	<script type="text/javascript">
		//确保日历容器节点在 body 最后，否则 FireFox 中不能出现在最上方   
		function InitContainerPanel() //初始化容器   
		{   
			var str = '<div id="calendarPanel" style="position: absolute;display: none;z-index:9999; background-color: #FFFFFF;border: 1px solid #CCCCCC;width:175px;font-size:12px;"></div>';   
			if(document.all)   
			{   
				str += '<iframe style="position:absolute;z-index:2000;width:expression(this.previousSibling.offsetWidth);';   
				str += 'height:expression(this.previousSibling.offsetHeight);';   
				str += 'left:expression(this.previousSibling.offsetLeft);top:expression(this.previousSibling.offsetTop);';   
				str += 'display:expression(this.previousSibling.style.display);" scrolling="no" frameborder="no"></iframe>';   
			}   
			var div = document.createElement("div");   
			div.innerHTML = str;   
			div.id = "ContainerPanel";   
			div.style.display ="none";   
			document.body.appendChild(div);   
		}//调用calendar.show(dateControl, popControl);   
		//-->  
		<!--
		var cal;
		var isFocus=false; //是否为焦点
		var pickMode ={
			"second":1,
			"minute":2,
			"hour":3,
			"day":4,
			"month":5,
			"year":6  };
	
		var topY=0,leftX=0;  //自定义定位偏移量 2007-02-11 由 www.ttkc.net添加
		//选择日期 → 由 www.ttkc.net 2007-06-10 添加，通过 ID 来选日期
		function SelectDateById(id,strFormat,x,y)
		{
			var obj = document.getElementById(id);
			if(obj == null){return false;}
			obj.focus();
			if(obj.onclick != null){obj.onclick();}
			else if(obj.click != null){obj.click();}
			else{SelectDate(obj,strFormat,x,y)}
		} 
		//选择日期 → 由 www.ttkc.net 2006-06-25 添加
		function SelectDate(obj,strFormat,x,y)
		{

			leftX =(x == null) ? leftX : x;
			topY  =(y == null) ? topY : y;//自定义定位偏移量 2007-02-11 由 www.ttkc.net添加 
			if(document.getElementById("ContainerPanel")==null){InitContainerPanel();}
			var date = new Date();
			var by = date.getFullYear()-50;  //最小值 → 50 年前
			var ey = date.getFullYear()+50;  //最大值 → 50 年后
			//cal = new Calendar(by, ey,1,strFormat);    //初始化英文版，0 为中文版
			cal = (cal==null) ? new Calendar(by, ey, 0) : cal;    //不用每次都初始化 2006-12-03 修正
			cal.DateMode =pickMode["second"]; //复位
			if(strFormat.indexOf('s')< 0) {cal.DateMode =pickMode["minute"];}//精度为分
			if(strFormat.indexOf('m')< 0) {cal.DateMode =pickMode["hour"];}//精度为时
			if(strFormat.indexOf('h')< 0) {cal.DateMode =pickMode["day"];}//精度为日
			if(strFormat.indexOf('d')< 0) {cal.DateMode =pickMode["month"];}//精度为月
			if(strFormat.indexOf('M')< 0) {cal.DateMode =pickMode["year"];}//精度为年
			if(strFormat.indexOf('y')< 0) {cal.DateMode =pickMode["second"];}//默认精度为秒
			cal.dateFormatStyleOld = cal.dateFormatStyle;
			cal.dateFormatStyle = strFormat;
			cal.show(obj);
		}
		/**//**//**//**//**//**//**//**
 * 返回日期
 * @param d the delimiter
 * @param p the pattern of your date
 2006-06-25 由 www.ttkc.net 修改为根据用户指定的 style 来确定；
 */
		String.prototype.toDate = function(style) {
			var y = this.substring(style.indexOf('y'),style.lastIndexOf('y')+1);//年
			var M = this.substring(style.indexOf('M'),style.lastIndexOf('M')+1);//月
			var d = this.substring(style.indexOf('d'),style.lastIndexOf('d')+1);//日
			var h = this.substring(style.indexOf('h'),style.lastIndexOf('h')+1);//时
			var m = this.substring(style.indexOf('m'),style.lastIndexOf('m')+1);//分
			var s = this.substring(style.indexOf('s'),style.lastIndexOf('s')+1);//秒

			if(s == null ||s == "" || isNaN(s)) {s = new Date().getSeconds();}
			if(m == null ||m == "" || isNaN(m)) {m = new Date().getMinutes();}
			if(h == null ||h == "" || isNaN(h)) {h = new Date().getHours();}
			if(d == null ||d == "" || isNaN(d)) {d = new Date().getDate();}
			if(M == null ||M == "" || isNaN(M)) {M = new Date().getMonth()+1;}
			if(y == null ||y == "" || isNaN(y)) {y = new Date().getFullYear();}
			var dt ;
			eval ("dt = new Date('"+ y+"', '"+(M-1)+"','"+ d+"','"+ h+"','"+ m+"','"+ s +"')");
			return dt;
		}

		/**//**//**//**//**//**//**//**
 * 格式化日期
 * @param   d the delimiter
 * @param   p the pattern of your date
 * @author  meizz
 */
		Date.prototype.format = function(style) {
			var o = {
				"M+" : this.getMonth() + 1, //month
				"d+" : this.getDate(),      //day
				"h+" : this.getHours(),     //hour
				"m+" : this.getMinutes(),   //minute
				"s+" : this.getSeconds(),   //second
				"w+" : "天一二三四五六".charAt(this.getDay()),   //week
				"q+" : Math.floor((this.getMonth() + 3) / 3),  //quarter
				"S"  : this.getMilliseconds() //millisecond
			}
			if(/(y+)/.test(style)) {
				style = style.replace(RegExp.$1,
				(this.getFullYear() + "").substr(4 - RegExp.$1.length));
			}
			for(var k in o){
				if(new RegExp("("+ k +")").test(style)){
					style = style.replace(RegExp.$1,
					  RegExp.$1.length == 1 ? o[k] :
					  ("00" + o[k]).substr(("" + o[k]).length));
				}
			}
			return style;
		}

		//2007-09-14  由www.ttkc.net添加返回所选日期
		Calendar.prototype.ReturnDate = function(dt) {
			if (this.dateControl != null){this.dateControl.value = dt;}
			calendar.hide();
			if(this.dateControl.onchange == null){return;} 
			//将 onchange 转成其它函数，以免触发验证事件
			var ev = this.dateControl.onchange.toString(); //找出函数的字串
			ev = ev.substring(
		   ((ev.indexOf("ValidatorOnChange();")> 0) ? ev.indexOf("ValidatorOnChange();") + 20 : ev.indexOf("{") + 1)
			, ev.lastIndexOf("}"));//去除验证函数 ValidatorOnChange();
			var fun = new Function(ev);  //重新定义函数
			this.dateControl.changeEvent = fun; 
			this.dateControl.changeEvent();//触发自定义 changeEvent 函数
		}

		/**//**//**//**//**//**//**//**
 * 日历类
 * @param   beginYear 1990
 * @param   endYear   2010
 * @param   lang      0(中文)|1(英语) 可自由扩充
 * @param   dateFormatStyle  "yyyy-MM-dd";
 * @version 2006-04-01
 * @author  KimSoft (jinqinghua [at] gmail.com)
 * @update
 */
		function Calendar(beginYear, endYear, lang, dateFormatStyle) {
			this.beginYear = 1950;
			this.endYear = 2050;
			this.lang = 0;            //0(中文) | 1(英文)
			this.dateFormatStyle = "yyyy-MM-dd hh:mm:ss";

			if (beginYear != null && endYear != null){
				this.beginYear = beginYear;
				this.endYear = endYear;
			}
			if (lang != null){
				this.lang = lang
			}

			if (dateFormatStyle != null){
				this.dateFormatStyle = dateFormatStyle
			}

			this.dateControl = null;
			this.panel = this.getElementById("calendarPanel");
			this.container = this.getElementById("ContainerPanel");
			this.form  = null;

			this.date = new Date();
			this.year = this.date.getFullYear();
			this.month = this.date.getMonth();
  
			this.day = this.date.getDate();
			this.hour = this.date.getHours();
			this.minute = this.date.getMinutes();
			this.second = this.date.getSeconds();

			this.colors = {
				"cur_word"      : "#FFFFFF",  //当日日期文字颜色
				"cur_bg"        : "#00FF00",  //当日日期单元格背影色
				"sel_bg"        : "#FFCCCC",  //已被选择的日期单元格背影色 2006-12-03 www.ttkc.net添加  
				"sun_word"      : "#FF0000",  //星期天文字颜色  
				"sat_word"      : "#0000FF",  //星期六文字颜色  
				"td_word_light" : "#333333",  //单元格文字颜色  
				"td_word_dark"  : "#CCCCCC",  //单元格文字暗色  
				"td_bg_out"     : "#EFEFEF",  //单元格背影色
				"td_bg_over"    : "#FFCC00",  //单元格背影色
				"tr_word"       : "#FFFFFF",  //日历头文字颜色  
				"tr_bg"         : "#666666",  //日历头背影色
				"input_border"  : "#CCCCCC",  //input控件的边框颜色  
				"input_bg"      : "#EFEFEF"   //input控件的背影色
			}
			/* //2008-01-29 放到了 show ，因为要做 pickMode 判断
			  this.draw();
			  this.bindYear();
			  this.bindMonth();
			  */
			//this.changeSelect();
			//this.bindData(); //2006-12-30 由民工.砖家注释
		}

		/**//**//**//**//**//**//**//**
 * 日历类属性（语言包，可自由扩展）
 */
		Calendar.language = {
			"year"   : [[""], [""]],
			"months" : [["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
				  ["JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"]
			],
			"weeks"  : [["日","一","二","三","四","五","六"],
				  ["SUN","MON","TUR","WED","THU","FRI","SAT"]
			],
			"hour"  : [["时"], ["H"]],
			"minute"  : [["分"], ["M"]],
			"second"  : [["秒"], ["S"]],
			"clear"  : [["清空"], ["CLS"]],
			"today"  : [["今天"], ["TODAY"]],
			"pickTxt"  : [["确定"], ["OK"]],//pickMode 精确到年、月时把今天变成“确定”
			"close"  : [["关闭"], ["CLOSE"]]
		}

		Calendar.prototype.draw = function() {
			calendar = this;

			var mvAry = [];
			//mvAry[mvAry.length]  = '  <form name="calendarForm" style="margin: 0px;">'; //因 <form> 不能嵌套， 2006-12-01 由www.ttkc.net改用 Div
			mvAry[mvAry.length]  = '  <div name="calendarForm" style="margin: 0px;">';
			mvAry[mvAry.length]  = '    <table width="100%" border="0" cellpadding="0" cellspacing="1" style="font-size:12px;">';
			mvAry[mvAry.length]  = '      <tr>';
			mvAry[mvAry.length]  = '        <th align="left" width="1%"><input style="border: 1px solid ' + calendar.colors["input_border"] + ';background-color:' + calendar.colors["input_bg"] + ';width:16px;height:20px;';
			if(calendar.DateMode > pickMode["month"]){mvAry[mvAry.length]  = 'display:none;';}//pickMode 精确到年时隐藏“月”
			mvAry[mvAry.length]  ='" name="prevMonth" type="button" id="prevMonth" value="&lt;" /></th>';
			mvAry[mvAry.length]  = '        <th align="center" width="98%" nowrap="nowrap"><select name="calendarYear" id="calendarYear" style="font-size:12px;"></select><select name="calendarMonth" id="calendarMonth" style="font-size:12px;';
			if(calendar.DateMode > pickMode["month"]){mvAry[mvAry.length]  = 'display:none;';}//pickMode 精确到年时隐藏“月”
			mvAry[mvAry.length]  = '"></select></th>';
			mvAry[mvAry.length]  = '        <th align="right" width="1%"><input style="border: 1px solid ' + calendar.colors["input_border"] + ';background-color:' + calendar.colors["input_bg"] + ';width:16px;height:20px;';
			if(calendar.DateMode > pickMode["month"]){mvAry[mvAry.length]  = 'display:none;';}//pickMode 精确到年时隐藏“月”
			mvAry[mvAry.length]  ='" name="nextMonth" type="button" id="nextMonth" value="&gt;" /></th>';
			mvAry[mvAry.length]  = '      </tr>';
			mvAry[mvAry.length]  = '    </table>';
			mvAry[mvAry.length]  = '    <table id="calendarTable" width="100%" style="border:0px solid #CCCCCC;background-color:#FFFFFF;font-size:12px;';
			if(calendar.DateMode >= pickMode["month"]){mvAry[mvAry.length]  = 'display:none;';}//pickMode 精确到年、月时隐藏“天”
			mvAry[mvAry.length]  = '" border="0" cellpadding="3" cellspacing="1">';
			mvAry[mvAry.length]  = '      <tr>';
			for(var i = 0; i < 7; i++) {
				mvAry[mvAry.length]  = '      <th style="font-weight:normal;background-color:' + calendar.colors["tr_bg"] + ';color:' + calendar.colors["tr_word"] + ';">' + Calendar.language["weeks"][this.lang][i] + '</th>';
			}
			mvAry[mvAry.length]  = '      </tr>';
			for(var i = 0; i < 6;i++){
				mvAry[mvAry.length]  = '    <tr align="center">';
				for(var j = 0; j < 7; j++) {
					if (j == 0){
						mvAry[mvAry.length]  = '  <td style="cursor:default;color:' + calendar.colors["sun_word"] + ';"></td>';
					} else if(j == 6) {
						mvAry[mvAry.length]  = '  <td style="cursor:default;color:' + calendar.colors["sat_word"] + ';"></td>';
					} else {
						mvAry[mvAry.length]  = '  <td style="cursor:default;"></td>';
					}
				}
				mvAry[mvAry.length]  = '    </tr>';
			}

			//2009-03-03 添加的代码，放置时间的行
			mvAry[mvAry.length]  = '      <tr style="';
			if(calendar.DateMode >= pickMode["day"]){mvAry[mvAry.length]  = 'display:none;';}//pickMode 精确到时日隐藏“时间”
			mvAry[mvAry.length]  = '"><td align="center" colspan="7">';
			mvAry[mvAry.length]  = '      <select name="calendarHour" id="calendarHour" style="font-size:12px;"></select>' + Calendar.language["hour"][this.lang];
			mvAry[mvAry.length]  = '<span style="'
			if(calendar.DateMode >= pickMode["hour"]){mvAry[mvAry.length]  = 'display:none;';}//pickMode 精确到小时时隐藏“分”
			mvAry[mvAry.length]  = '"><select name="calendarMinute" id="calendarMinute" style="font-size:12px;"></select>' + Calendar.language["minute"][this.lang]+'</span>';
			mvAry[mvAry.length]  = '<span style="'
			if(calendar.DateMode >= pickMode["minute"]){mvAry[mvAry.length]  = 'display:none;';}//pickMode 精确到小时、分时隐藏“秒”
			mvAry[mvAry.length]  = '"><select name="calendarSecond" id="calendarSecond" style="font-size:12px;"></select>'+ Calendar.language["second"][this.lang]+'</span>';
			mvAry[mvAry.length]  = '      </td></tr>';
  
			mvAry[mvAry.length]  = '    </table>';
			//mvAry[mvAry.length]  = '  </from>';
			mvAry[mvAry.length]  = '      <div align="center" style="padding:4px 4px 4px 4px;background-color:' + calendar.colors["input_bg"] + ';">';
			mvAry[mvAry.length]  = '        <input name="calendarClear" type="button" id="calendarClear" value="' + Calendar.language["clear"][this.lang] + '" style="border: 1px solid ' + calendar.colors["input_border"] + ';background-color:' + calendar.colors["input_bg"] + ';width:40px;height:20px;font-size:12px;cursor:pointer;"/>';
			mvAry[mvAry.length]  = '        <input name="calendarToday" type="button" id="calendarToday" value="' 
			mvAry[mvAry.length]  = (calendar.DateMode == pickMode["day"]) ? Calendar.language["today"][this.lang] : Calendar.language["pickTxt"][this.lang];
			mvAry[mvAry.length]  = '" style="border: 1px solid ' + calendar.colors["input_border"] + ';background-color:' + calendar.colors["input_bg"] + ';width:60px;height:20px;font-size:12px;cursor:pointer"/>';
			mvAry[mvAry.length]  = '        <input name="calendarClose" type="button" id="calendarClose" value="' + Calendar.language["close"][this.lang] + '" style="border: 1px solid ' + calendar.colors["input_border"] + ';background-color:' + calendar.colors["input_bg"] + ';width:40px;height:20px;font-size:12px;cursor:pointer"/>';
			mvAry[mvAry.length]  = '      </div>';
  
			mvAry[mvAry.length]  = '  </div>';
			this.panel.innerHTML = mvAry.join("");
  
			/**//**//**//******** 以下代码由www.ttkc.net 2006-12-01 添加 **********/
			var obj = this.getElementById("prevMonth");
			obj.onclick = function () {calendar.goPrevMonth(calendar);}
			obj.onblur = function () {calendar.onblur();}
			this.prevMonth= obj;
  
			obj = this.getElementById("nextMonth");
			obj.onclick = function () {calendar.goNextMonth(calendar);}
			obj.onblur = function () {calendar.onblur();}
			this.nextMonth= obj;

			obj = this.getElementById("calendarClear");
			obj.onclick = function () 
			{ calendar.ReturnDate(""); /*calendar.dateControl.value = "";calendar.hide();*///2007-09-14 由www.ttkc.net注释
			}
			this.calendarClear = obj;
  
			obj = this.getElementById("calendarClose");
			obj.onclick = function () {calendar.hide();}
			this.calendarClose = obj;
  
			obj = this.getElementById("calendarYear");
			obj.onchange = function () {calendar.update(calendar);}
			obj.onblur = function () {calendar.onblur();}
			this.calendarYear = obj;
  
			obj = this.getElementById("calendarMonth");
			with(obj)
			{
				onchange = function () {calendar.update(calendar);}
				onblur = function () {calendar.onblur();}
			}this.calendarMonth = obj;
  
			obj = this.getElementById("calendarHour");
			obj.onchange = function () {calendar.hour = this.options[this.selectedIndex].value;}
			obj.onblur = function () {calendar.onblur();}
			this.calendarHour = obj;
   
			obj = this.getElementById("calendarMinute");
			obj.onchange = function () {calendar.minute = this.options[this.selectedIndex].value;}
			obj.onblur = function () {calendar.onblur();}
			this.calendarMinute = obj;
  
			obj = this.getElementById("calendarSecond");
			obj.onchange = function () {calendar.second = this.options[this.selectedIndex].value;}
			obj.onblur = function () {calendar.onblur();}
			this.calendarSecond = obj;

			obj = this.getElementById("calendarToday");
			obj.onclick = function () {
				var today = (calendar.DateMode != pickMode["day"]) ?
								  new Date(calendar.year,calendar.month,calendar.day,calendar.hour,calendar.minute,calendar.second)
								  : new Date();//2008-01-29
				calendar.ReturnDate(today.format(calendar.dateFormatStyle));
			}
			this.calendarToday = obj;
		}

		//年份下拉框绑定数据
		Calendar.prototype.bindYear = function() {
			var cy = this.calendarYear;//2006-12-01 由www.ttkc.net修改
			cy.length = 0;
			for (var i = this.beginYear; i <= this.endYear; i++){
				cy.options[cy.length] = new Option(i + Calendar.language["year"][this.lang], i);
			}
		}

		//月份下拉框绑定数据
		Calendar.prototype.bindMonth = function() {
			var cm = this.calendarMonth;//2006-12-01 由www.ttkc.net修改
			cm.length = 0;
			for (var i = 0; i < 12; i++){
				cm.options[cm.length] = new Option(Calendar.language["months"][this.lang][i], i);
			}
		}

		//小时下拉框绑定数据
		Calendar.prototype.bindHour = function() {
			var ch = this.calendarHour;
			if(ch.length > 0){return;}//2009-03-03 不需要重新绑定，提高性能
			//ch.length = 0;
			var h;
			for (var i = 0; i < 24; i++){
				h = ("00" + i +"").substr(("" + i).length);
				ch.options[ch.length] = new Option(h, h);
			}
		}

		//分钟下拉框绑定数据
		Calendar.prototype.bindMinute = function() {
			var cM = this.calendarMinute;
			if(cM.length > 0){return;}//2009-03-03 不需要重新绑定，提高性能
			//cM.length = 0;
			var M;
			for (var i = 0; i < 60; i++){
				M = ("00" + i +"").substr(("" + i).length);
				cM.options[cM.length] = new Option(M, M);
			}
		}

		//秒钟下拉框绑定数据
		Calendar.prototype.bindSecond = function() {
			var cs = this.calendarSecond;
			if(cs.length > 0){return;}//2009-03-03 不需要重新绑定，提高性能
			//cs.length = 0;
			var s;
			for (var i = 0; i < 60; i++){
				s = ("00" + i +"").substr(("" + i).length);
				cs.options[cs.length] = new Option(s, s);
			}
		}

		//向前一月
		Calendar.prototype.goPrevMonth = function(e){
			if (this.year == this.beginYear && this.month == 0){return;}
			this.month--;
			if (this.month == -1) {
				this.year--;
				this.month = 11;
			}
			this.date = new Date(this.year, this.month, 1);
			this.changeSelect();
			this.bindData();
		}

		//向后一月
		Calendar.prototype.goNextMonth = function(e){
			if (this.year == this.endYear && this.month == 11){return;}
			this.month++;
			if (this.month == 12) {
				this.year++;
				this.month = 0;
			}
			this.date = new Date(this.year, this.month, 1);
			this.changeSelect();
			this.bindData();
		}

		//改变SELECT选中状态
		Calendar.prototype.changeSelect = function() {
			var cy = this.calendarYear;//2006-12-01 由www.ttkc.net修改
			var cm = this.calendarMonth;
			var ch = this.calendarHour;
			var cM = this.calendarMinute;
			var cs = this.calendarSecond;
			//2006-12-30 由民工.砖家修改，减少运算次数
			cy[this.date.getFullYear()-this.beginYear].selected = true;
			cm[this.date.getMonth()].selected =true;
  
			//2009-03-03 添加，初始化时间的值
			ch[this.hour].selected =true;
			cM[this.minute].selected =true;
			cs[this.second].selected =true;
		}

		//更新年、月
		Calendar.prototype.update = function (e){
			this.year  = e.calendarYear.options[e.calendarYear.selectedIndex].value;//2006-12-01 由www.ttkc.net修改
			this.month = e.calendarMonth.options[e.calendarMonth.selectedIndex].value;
			this.date = new Date(this.year, this.month, 1);
			//this.changeSelect();
			this.bindData();
		}

		//绑定数据到月视图
		Calendar.prototype.bindData = function () {
			var calendar = this;
			if(calendar.DateMode >= pickMode["month"]){return;}//2008-01-29
			// var dateArray = this.getMonthViewArray(this.date.getYear(), this.date.getMonth());
			//2006-12-30 由民工.砖家修改 在Firefox 下年份错误
			var dateArray = this.getMonthViewArray(this.date.getFullYear(), this.date.getMonth());
			var tds = this.getElementById("calendarTable").getElementsByTagName("td");
			for(var i = 0; i < tds.length; i++) {
				tds[i].style.backgroundColor = calendar.colors["td_bg_out"];
				tds[i].onclick = function () {return;}
				tds[i].onmouseover = function () {return;}
				tds[i].onmouseout = function () {return;}
				if (i > dateArray.length - 1) break;
				tds[i].innerHTML = dateArray[i];
				if (dateArray[i] != "&nbsp;"){
					tds[i].bgColorTxt = "td_bg_out"; //2009-03-03 保存背景色的class
					var cur = new Date();
					tds[i].isToday = false;
					if (cur.getFullYear() == calendar.date.getFullYear() && cur.getMonth() == calendar.date.getMonth() && cur.getDate() == dateArray[i]) {
						//是今天的单元格
						tds[i].style.backgroundColor = calendar.colors["cur_bg"];
						tds[i].bgColorTxt = "cur_bg";
						tds[i].isToday = true;
					}
					if(calendar.dateControl != null )
					{
						cur = calendar.dateControl.value.toDate(calendar.dateFormatStyle);
						if (cur.getFullYear() == calendar.date.getFullYear() && cur.getMonth() == calendar.date.getMonth()&& cur.getDate() == dateArray[i]) {
							//是已被选中的单元格
							calendar.selectedDayTD = tds[i];
							tds[i].style.backgroundColor = calendar.colors["sel_bg"];
							tds[i].bgColorTxt = "sel_bg";
						}
					}
					tds[i].onclick = function () {
						if(calendar.DateMode == pickMode["day"]) //2009-03-03 当选择日期时，点击格子即返回值
						{
							calendar.ReturnDate(new Date(calendar.date.getFullYear(),
																calendar.date.getMonth(),
																this.innerHTML).format(calendar.dateFormatStyle));
						}
						else
						{
							if(calendar.selectedDayTD != null) //2009-03-03 清除已选中的背景色
							{
								calendar.selectedDayTD.style.backgroundColor =(calendar.selectedDayTD.isToday)? calendar.colors["cur_bg"] : calendar.colors["td_bg_out"];
							}
							this.style.backgroundColor = calendar.colors["sel_bg"];
							calendar.day = this.innerHTML;
							calendar.selectedDayTD = this; //2009-03-03 记录已选中的日子
						}
					}
					tds[i].style.cursor ="pointer"; //2007-08-06 由www.ttkc.net添加，鼠标变成手指状
					tds[i].onmouseover = function () {
						this.style.backgroundColor = calendar.colors["td_bg_over"];
					}
					tds[i].onmouseout = function () {
						if(calendar.selectedDayTD != this) {
							this.style.backgroundColor = calendar.colors[this.bgColorTxt];}
					}
					tds[i].onblur = function () {calendar.onblur();}
				}
			}
		}

		//根据年、月得到月视图数据(数组形式)
		Calendar.prototype.getMonthViewArray = function (y, m) {
			var mvArray = [];
			var dayOfFirstDay = new Date(y, m, 1).getDay();
			var daysOfMonth = new Date(y, m + 1, 0).getDate();
			for (var i = 0; i < 42; i++) {
				mvArray[i] = "&nbsp;";
			}
			for (var i = 0; i < daysOfMonth; i++){
				mvArray[i + dayOfFirstDay] = i + 1;
			}
			return mvArray;
		}

		//扩展 document.getElementById(id) 多浏览器兼容性 from meizz tree source
		Calendar.prototype.getElementById = function(id){
			if (typeof(id) != "string" || id == "") return null;
			if (document.getElementById) return document.getElementById(id);
			if (document.all) return document.all(id);
			try {return eval(id);} catch(e){ return null;}
		}

		//扩展 object.getElementsByTagName(tagName)
		Calendar.prototype.getElementsByTagName = function(object, tagName){
			if (document.getElementsByTagName) return document.getElementsByTagName(tagName);
			if (document.all) return document.all.tags(tagName);
		}

		//取得HTML控件绝对位置
		Calendar.prototype.getAbsPoint = function (e){
			var x = e.offsetLeft;
			var y = e.offsetTop;
			while(e = e.offsetParent){
				x += e.offsetLeft;
				y += e.offsetTop;
			}
			return {"x": x, "y": y};
		}

		//显示日历
		Calendar.prototype.show = function (dateObj, popControl) {
			if (dateObj == null){
				throw new Error("arguments[0] is necessary")
			}
			this.dateControl = dateObj;
			var now =  new Date();
			this.date = (dateObj.value.length > 0) ? new Date(dateObj.value.toDate(this.dateFormatStyle)) : now.format(this.dateFormatStyle).toDate(this.dateFormatStyle) ;//2008-01-29 www.ttkc.net添加 → 若为空则根据dateFormatStyle初始化日期

			if(this.panel.innerHTML==""||cal.dateFormatStyleOld != cal.dateFormatStyle)//2008-01-29 把构造表格放在此处，2009-03-03 若请示的样式改变，则重新初始化
			{
				this.draw();
				this.bindYear();
				this.bindMonth();
				this.bindHour();
				this.bindMinute();
				this.bindSecond();
			}
			this.year = this.date.getFullYear();
			this.month = this.date.getMonth();
			this.day = this.date.getDate();
			this.hour = this.date.getHours();
			this.minute = this.date.getMinutes();
			this.second = this.date.getSeconds();
			this.changeSelect();
			this.bindData();

			if (popControl == null){
				popControl = dateObj;
			}
			var xy = this.getAbsPoint(popControl);
			//this.panel.style.left = xy.x + "px";
			//this.panel.style.top = (xy.y + dateObj.offsetHeight) + "px";
			this.panel.style.left = (xy.x + leftX)+ "px"; //由www.ttkc.net 2007-02-11 修改 → 加入自定义偏移量
			this.panel.style.top = (xy.y + topY + dateObj.offsetHeight) + "px";
  
			//由www.ttkc.net 2006-06-25 修改 → 把 visibility 变为 display，并添加失去焦点的事件  //this.setDisplayStyle("select", "hidden");
			//this.panel.style.visibility = "visible";
			//this.container.style.visibility = "visible";
			this.panel.style.display = "";
			this.container.style.display = "";
  
			if( !this.dateControl.isTransEvent)
			{
				this.dateControl.isTransEvent = true;
				/* 已写在返回值的时候  ReturnDate 函数中，去除验证事件的函数
				this.dateControl.changeEvent = this.dateControl.onchange;//将 onchange 转成其它函数，以免触发验证事件
				this.dateControl.onchange = function()
				{if(typeof(this.changeEvent) =='function'){this.changeEvent();}}*/
				if(this.dateControl.onblur != null){
					this.dateControl.blurEvent = this.dateControl.onblur;}//2007-09-14 保存主文本框的 onblur ，使其原本的事件不被覆盖
				this.dateControl.onblur = function()
				{calendar.onblur();if(typeof(this.blurEvent) =='function'){this.blurEvent();}
				}
			}
  
			this.container.onmouseover = function(){isFocus=true;}
			this.container.onmouseout = function(){isFocus=false;}
		}

		//隐藏日历
		Calendar.prototype.hide = function() {
			//this.setDisplayStyle("select", "visible");
			//this.panel.style.visibility = "hidden";
			//this.container.style.visibility = "hidden";
			this.panel.style.display = "none";
			this.container.style.display = "none";
			isFocus=false;
		}

		//焦点转移时隐藏日历 → 由www.ttkc.net 2006-06-25 添加
		Calendar.prototype.onblur = function() {
			if(!isFocus){this.hide();}
		}

		//以下由www.ttkc.net 2007-07-26 修改 → 确保日历容器节点在 body 最后，否则 FireFox 中不能出现在最上方
		function InitContainerPanel() //初始化容器
		{
			var str = '<div id="calendarPanel" style="position: absolute;display: none;z-index:9999; background-color: #FFFFFF;border: 1px solid #CCCCCC;width:175px;font-size:12px;"></div>';
			if(document.all)
			{
				str += '<iframe style="position:absolute;z-index:2000;width:expression(this.previousSibling.offsetWidth);';
				str += 'height:expression(this.previousSibling.offsetHeight);';
				str += 'left:expression(this.previousSibling.offsetLeft);top:expression(this.previousSibling.offsetTop);';
				str += 'display:expression(this.previousSibling.style.display);" scrolling="no" frameborder="no"></iframe>';
			}
			var div = document.createElement("div");
			div.innerHTML = str;
			div.id = "ContainerPanel";
			div.style.display ="none";
			document.body.appendChild(div);
		}//调用calendar.show(dateControl, popControl);
		//--> 
</script>  
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
	<script language="javascript" src="Scripts/Preview.js" type="text/javascript">
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

		if (window.print) {
			document.write('<form><input type=button name=print value="Print" onClick="window.print()"></form>');
		}

	</script>
	<script language="javascript" type="text/javascript">
		function ST1() {
			alert("急性ST段抬高性心肌梗死（STEMI） <br\>满足（1）或（2）任一项：  <br\>（1）缺血症状(静息时发作疼痛，气短，压榨样不适；或逐渐加重的上述症状；研究者确认症状继发于缺血)；   <br\>（2）ECG变化与心肌梗死改变一致：   <br\>    在没有既往左室高电压或传导异常的情况下在2个连续导联新出现显著的Q波(或V1-V2出现显著增高的R波)；<br\>≥2个连续导联有ST段抬高0.1mV以上; <br\>    出现新的左束支传导阻滞； <br\>（3）心肌标志物：<br\>    肌钙蛋白：定量检测位于心肌坏死的诊断范围内，否则至少其他的心肌标志物之一必须>2倍ULN； CK-MB ≥ULN。 ", "急性ST段抬高性心肌梗死（STEMI）", "#000000", 600, 300);
		}

		function NonST() {
			alert("急性非ST段抬高性心肌梗死（NSTEMI） <br\>（1）缺血症状(静息时发作疼痛，气短，压榨样不适；<br\>或逐渐加重的上述症状；研究者确认症状继发于缺血)；<br\>（2）ECG一过性ST段抬高，或ST段压低，或与心肌缺血相符的T波改变；  <br\>（3）伴有心肌坏死的生物标记物升高（CK和CK-MB或肌钙蛋白）,达到心肌梗死诊断标准。", "急性非ST段抬高性心肌梗死（NSTEMI）", "#000000", 600, 250);
		}

		function Other() {
			alert("不稳定型心绞痛： <br\>（1） 缺血症状(静息时发作疼痛，气短，压榨样不适；<br\>        或逐渐加重的上述症状；研究者确认症状继发于缺血)；  <br\>（2） ECG在一个或多个导联上有一过性或持久性ST段偏移0.1mV或0.1mV以上； <br\>（3） 不伴有心肌坏死的生物标记物升高（CK和CK-MB或肌钙蛋白）或心肌坏死的生物标记物升高但未达到心肌梗死诊断标准。 ", "不稳定型心绞痛", "#000000", 600, 250);
		}
	</script>
	<style type="text/css">
		.style14
		{
			width: 458px;
		}
	</style>
	<title>病例表单</title>
</head>
<body onunload="return '你确实要关闭吗?'">
	<form id="form1" runat="server">
	<asp:Panel ID="Panel1" runat="server" Enabled="true">
		<asp:ScriptManager ID="sc" runat="server">
		</asp:ScriptManager>
		<asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="5" DynamicLayout="true">
			<ProgressTemplate>
				<%-- <span style="color: Red; position: absolute; font-size: 14px; padding: 5px; width: auto;
					top: 70%; left: 50%;">Loading.....</span>--%>
			</ProgressTemplate>
		</asp:UpdateProgress>
		<table class="UserTableBorder" cellspacing="0" cellpadding="0" align="left" border="0">
			<tr>
				<td class="style9" style="display: none">
					<asp:Label ID="lblMessage" runat="server" Width="700px" ForeColor="Red"></asp:Label>
				</td>
			</tr>
			<tr onmouseover="this.className='highlight'" onmouseout="this.className='normal'">
				<td class="THTitle">
					电子病历
				</td>
			</tr>
			<%-- 一般资料--%>
			<tr onmouseover="this.className='highlight'" onmouseout="this.className='normal'">
				<td>
					<table cellpadding="0" cellspacing="0" border="0" class="category-item">
						<tr>
							<td class="subTitleTip">
								提示：<br />
								1、请在收治10天内录入病例；提交10天后将不允许修改。
								<asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<%-- 一般资料--%>
			<tr onmouseover="this.className='highlight'" onmouseout="this.className='normal'">
				<td>
					<table cellpadding="0" cellspacing="0" border="0" class="category-item">
						<tr>
							<td class="subTitle">
								一般资料
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing1">
											姓名:
										</td>
										<td class="Column2ZhuSuXianBingShi">
											<asp:TextBox ID="txtPatientName" runat="server" TabIndex="10" ToolTip="姓名不能为空."></asp:TextBox>
										</td>
										<td class="Column3">
											性别：
										</td>
										<td class="Column4">
											<asp:DropDownList ID="dropDownSex" runat="server" TabIndex="12" Width="166px" ToolTip="请选择性别.">
												<asp:ListItem Selected="True">请选择</asp:ListItem>
												<asp:ListItem>男</asp:ListItem>
												<asp:ListItem>女</asp:ListItem>
											</asp:DropDownList>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing1">
											民族（国籍）：
										</td>
										<td class="Column2ZhuSuXianBingShi">
											<asp:DropDownList ID="dropNationality" runat="server" TabIndex="16" Width="166px"
												ToolTip="不能为空">
												<asp:ListItem Selected="True" Text="请选择" Value="-1"></asp:ListItem>
												<asp:ListItem Text="汉族" Value="1"></asp:ListItem>
												<asp:ListItem Text="满族" Value="2"></asp:ListItem>
												<asp:ListItem Text="朝鲜族" Value="3"></asp:ListItem>
												<asp:ListItem Text="回族" Value="4"></asp:ListItem>
												<asp:ListItem Text="蒙古族" Value="5"></asp:ListItem>
												<asp:ListItem Text="其他" Value="55"></asp:ListItem>
												<asp:ListItem Text="外籍" Value="56"></asp:ListItem>
											</asp:DropDownList>
										</td>
										<td class="Column3">
											职业：
										</td>
										<td class="Column4">
											<asp:DropDownList ID="DropDownListJob" runat="server" CssClass="TextBoxSyle" TabIndex="16"
												ToolTip="不能为空" Width="166px">
												<asp:ListItem Selected="True" Text="请选择" Value="-1"></asp:ListItem>
												<asp:ListItem Text="工人" Value="1"></asp:ListItem>
												<asp:ListItem Text="农民" Value="2"></asp:ListItem>
												<asp:ListItem Text="军人" Value="3"></asp:ListItem>
												<asp:ListItem Text="学生" Value="4"></asp:ListItem>
												<asp:ListItem Text="专业技术人员" Value="5"></asp:ListItem>
												<asp:ListItem Text="商业从业人员" Value="55"></asp:ListItem>
												<asp:ListItem Text="职员" Value="55"></asp:ListItem>
												<asp:ListItem Text="其他" Value="55"></asp:ListItem>
											</asp:DropDownList>
										</td>
									</tr>
									<script>
										function PopCalendar(obj) {
											showx = event.screenX - event.offsetX;  // + deltaX;
											showy = event.screenY - event.offsetY - 168; // + deltaY;
											window.showModalDialog("calendar.htm", obj, "dialogWidth:180px; dialogHeight:230px; dialogTop:" + showy + "px; status:no; directories:yes;scrollbars:no;Resizable=no; ");
										}
									</script>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing1">
											出生日期:
										</td>
										<td class="Column2ZhuSuXianBingShi">
											<asp:TextBox ID="txbBirthDay" runat="server" Width="150px" AutoPostBack="true" onfocus="new Calendar().show(this);"
												OnTextChanged="txbBirthDay_TextChanged" ToolTip="出生日期不能为空."></asp:TextBox>
										</td>
										<td class="Column3">
											年龄：
										</td>
										<td class="Column4">
											<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
												<ContentTemplate>
													<asp:TextBox ID="txtAge" runat="server" Enabled="false" Text="..." Width="148px"
														Height="20px" />
												</ContentTemplate>
												<Triggers>
													<%-- <asp:AsyncPostBackTrigger ControlID="txbBirthDay" EventName="TextChanged" />--%>
												</Triggers>
											</asp:UpdatePanel>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr style="border: solid;">
										<td class="Column1JiBing1">
											就诊时间:
										</td>
										<td class="Column2ZhuSuXianBingShi">
											<asp:TextBox ID="txbTreatTime" runat="server" onclick="SelectDate(this,'yyyy-MM-dd hh:mm')"
											   readonly="true"  Width="151px" ToolTip="就诊时间不能为空."></asp:TextBox>
										</td>
										<td class="Column3">
											发病时间:
										</td>
										<td class="Column4">
											<asp:TextBox ID="txtDiseaseHour" runat="server" Width="99px" ToolTip="不能为空" />
											小时
											<asp:CustomValidator ID="cusValidatorAge" runat="server" ControlToValidate="txtDiseaseHour"
												Display="Dynamic" ErrorMessage="无效时间." OnServerValidate="ServerValidation" ValidateEmptyText="false"></asp:CustomValidator>
											<script runat="server">

												void ServerValidation(object source, ServerValidateEventArgs args)
												{
													try
													{
														int i = int.Parse(args.Value);
														args.IsValid = true;
													}
													catch (Exception ex)
													{
														args.IsValid = false;
													}
												}
											</script>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing1">
											病史叙述者:
										</td>
										<td class="Column2ZhuSuXianBingShi">
											<asp:DropDownList ID="ddlDiseaseDescriber" runat="server" TabIndex="12" Width="166px"
												ToolTip="不能为空">
												<asp:ListItem Selected="True">请选择</asp:ListItem>
												<asp:ListItem>患者本人</asp:ListItem>
												<asp:ListItem>患者家属</asp:ListItem>
											</asp:DropDownList>
										</td>
										<td class="Column3">
											来院方式:
										</td>
										<td class="Column4">
											<asp:DropDownList ID="ddlTrafficWay" runat="server" TabIndex="12" Width="166px" ToolTip="不能为空">
												<asp:ListItem Selected="True">请选择</asp:ListItem>
												<asp:ListItem>乘救护车</asp:ListItem>
												<asp:ListItem>乘其它交通工具</asp:ListItem>
												<asp:ListItem>步行</asp:ListItem>
											</asp:DropDownList>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing1">
											可靠程度:
										</td>
										<td class="Column2ZhuSuXianBingShi">
											<asp:DropDownList ID="ddlReliability" runat="server" TabIndex="12" Width="166px"
												ToolTip="不能为空">
												<asp:ListItem Selected="True">请选择</asp:ListItem>
												<asp:ListItem>可靠</asp:ListItem>
												<asp:ListItem>不可靠</asp:ListItem>
											</asp:DropDownList>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<%-- 主诉和现病史--%>
			<tr onmouseover="this.className='highlight'" onmouseout="this.className='normal'">
				<td>
					<table cellpadding="0" cellspacing="0" class="category-item">
						<tr>
							<td class="subTitle">
								主诉和现病史
							</td>
						</tr>
						<tr>
							<td>
								<asp:UpdatePanel runat="server" ID="UpdatePanel29">
									<ContentTemplate>
										<table cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td class="Column1JiBing1">
													胸痛（闷）:
												</td>
												<td>
													<asp:RadioButtonList ToolTip="不能为空" AutoPostBack="true" ID="rblChestPainExist" runat="server"
														RepeatDirection="Horizontal" RepeatLayout="Flow">
														<asp:ListItem>无</asp:ListItem>
														<asp:ListItem>有</asp:ListItem>
													</asp:RadioButtonList>
												</td>
											</tr>
										</table>
									</ContentTemplate>
									<Triggers>
										<asp:AsyncPostBackTrigger ControlID="rblChestPainExist" EventName="SelectedIndexChanged" />
									</Triggers>
								</asp:UpdatePanel>
							</td>
						</tr>
						<tr>
							<td>
								<asp:UpdatePanel runat="server" ID="UpdatePanel18">
									<ContentTemplate>
										<table cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td class="Column1JiBing1">
													诱因:
												</td>
												<td class="Column2ZhuSuXianBingShi">
													<asp:RadioButtonList ToolTip="不能为空" AutoPostBack="true" ID="rblIncentiveExist" runat="server"
														RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="rblIncentiveExist_SelectedIndexChanged">
														<asp:ListItem>无</asp:ListItem>
														<asp:ListItem>有</asp:ListItem>
													</asp:RadioButtonList>
												</td>
												<td>
													<asp:Panel runat="server" ID="PanelrblIncentiveType">
														<asp:CheckBox runat="server" Text="体力活动" ID="chkIncentiveTypePhysical" />
														<asp:CheckBox runat="server" Text="情绪激动" ID="chkIncentiveTypeExcite" />
														<asp:CheckBox runat="server" Text="饱餐" ID="chkIncentiveTypeEatMuch" />
														<asp:CheckBox runat="server" Text="排便" ID="chkIncentiveTypeDefecate" /><br />
														<asp:CheckBox runat="server" Text="寒冷刺激" ID="chkIncentiveTypeColdStimulation" />
														<asp:CheckBox runat="server" Text="其他" ID="chkIncentiveTypeOther" />
													</asp:Panel>
												</td>
											</tr>
										</table>
									</ContentTemplate>
									<Triggers>
										<asp:AsyncPostBackTrigger ControlID="rblIncentiveExist" EventName="SelectedIndexChanged" />
									</Triggers>
								</asp:UpdatePanel>
							</td>
						</tr>
						<tr>
							<td>
								<asp:UpdatePanel runat="server" ID="UpdatePanel19">
									<ContentTemplate>
										<table cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td class="Column1JiBing1">
													部位:
												</td>
												<td class="Column2ZhuSuXianBingShi">
													<asp:RadioButtonList ToolTip="不能为空" AutoPostBack="true" ID="rblPositionExist" runat="server"
														RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="rblPositionExist_SelectedIndexChanged">
														<asp:ListItem>无</asp:ListItem>
														<asp:ListItem>有</asp:ListItem>
													</asp:RadioButtonList>
												</td>
												<td>
													<asp:Panel runat="server" ID="PanelrblPositionType">
														<asp:CheckBox runat="server" Text="心前区或胸骨后" ID="chkPositionTypePrecordium" />
														<asp:CheckBox runat="server" Text="咽颈部" ID="chkPositionTypeChest" /><br />
														<asp:CheckBox runat="server" Text="剑突下或上腹部" ID="chkPositionTypeBelowXiphoid" />
														<asp:CheckBox runat="server" Text="肩背部" ID="chkPositionTypeShoulder" />
														<asp:CheckBox runat="server" Text="其他" ID="chkPositionTypeOther" />
													</asp:Panel>
												</td>
											</tr>
										</table>
									</ContentTemplate>
									<Triggers>
										<asp:AsyncPostBackTrigger ControlID="rblPositionExist" EventName="SelectedIndexChanged" />
									</Triggers>
								</asp:UpdatePanel>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing1">
											性质:
										</td>
										<td>
											<asp:CheckBox runat="server" Text="胸闷痛或压缩感" ID="chkPropertiesTypeChestPain" />
											<asp:CheckBox runat="server" Text="咽部痛或紧缩感" ID="chkPropertiesTypePharyngeal" />
											<asp:CheckBox runat="server" Text="胸部刀割或烧心感" ID="chkPropertiesTypeChestCut" />
											<asp:CheckBox runat="server" Text="其他" ID="chkPropertiesTypeOther" />
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<asp:UpdatePanel runat="server" ID="UpdatePanel20">
									<ContentTemplate>
										<table cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td class="Column1JiBing1">
													放射痛部位:
												</td>
												<td class="Column2ZhuSuXianBingShi">
													<asp:RadioButtonList ToolTip="不能为空" AutoPostBack="true" ID="rblRadiationPainExist"
														runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="rblRadiationPainExist_SelectedIndexChanged">
														<asp:ListItem>无</asp:ListItem>
														<asp:ListItem>有</asp:ListItem>
													</asp:RadioButtonList>
												</td>
												<td>
													<asp:Panel runat="server" ID="PanelrblRadiationPainType">
														<asp:CheckBox runat="server" Text="左肩臂部" ID="chkRadiationPainTypeLeftShoulder" />
														<asp:CheckBox runat="server" Text="咽部痛咽颈颌面部或紧缩感" ID="chkRadiationPainTypePharyngeal" />
														<br />
														<asp:CheckBox runat="server" Text="上腹部" ID="chkRadiationPainTypeEpigastralgia" />
														<asp:CheckBox runat="server" Text="其他" ID="chkRadiationPainTypeOther" />
													</asp:Panel>
												</td>
											</tr>
										</table>
									</ContentTemplate>
									<Triggers>
										<asp:AsyncPostBackTrigger ControlID="rblRadiationPainExist" EventName="SelectedIndexChanged" />
									</Triggers>
								</asp:UpdatePanel>
							</td>
						</tr>
						<tr>
							<td>
								<asp:UpdatePanel runat="server" ID="UpdatePanel21">
									<ContentTemplate>
										<table cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td class="Column1JiBing1">
													伴随症状:
												</td>
												<td class="Column2ZhuSuXianBingShi">
													<asp:RadioButtonList ToolTip="不能为空" AutoPostBack="true" ID="rblConcomitantSymptomExist"
														runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="rblConcomitantSymptomExist_SelectedIndexChanged">
														<asp:ListItem>无</asp:ListItem>
														<asp:ListItem>有</asp:ListItem>
													</asp:RadioButtonList>
												</td>
												<td>
													<asp:Panel runat="server" ID="PanelrblConcomitantSymptomType">
														<asp:CheckBox runat="server" Text="心悸" ID="chkConcomitantSymptomTypePalpitation" />
														<asp:CheckBox runat="server" Text="劳力性呼吸困难" ID="chkConcomitantSymptomTypeTiredBreath" />
														<asp:CheckBox runat="server" Text="黑朦" ID="chkConcomitantSymptomTypeAmaurosis" />
														<asp:CheckBox runat="server" Text="晕厥" ID="chkConcomitantSymptomTypeSyncope" /><br />
														<asp:CheckBox runat="server" Text="其他" ID="chkConcomitantSymptomTypeOther" />
													</asp:Panel>
												</td>
											</tr>
										</table>
									</ContentTemplate>
									<Triggers>
										<asp:AsyncPostBackTrigger ControlID="rblConcomitantSymptomExist" EventName="SelectedIndexChanged" />
									</Triggers>
								</asp:UpdatePanel>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing1">
											缓解因素:
										</td>
										<td>
											<asp:CheckBox runat="server" Text="休息" ID="chkRelievingFactorsRest" />
											<asp:CheckBox runat="server" Text="硝酸酯类药物" ID="chkRelievingFactorsNitrate" />
											<asp:CheckBox runat="server" Text="钙拮抗剂" ID="chkRelievingFactorsCaRivalry" />
											<asp:CheckBox runat="server" Text="其他" ID="chkRelievingFactorsOther" />
											<br />
											<asp:CheckBox runat="server" Text="持续不缓解" ID="chkRelievingFactorsLastRespond" />
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<%-- 既往病史：--%>
			<tr onmouseover="this.className='highlight'" onmouseout="this.className='normal'">
				<td>
					<table cellpadding="0" cellspacing="0" border="0" class="category-item">
						<tr>
							<td class="subTitle">
								既往病史
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing1">
											心肌梗死：
										</td>
										<td class="Column2JiWangBingShi">
											<asp:RadioButtonList ToolTip="不能为空" AutoPostBack="false" ID="rblMIConfirm" runat="server"
												RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="61">
												<asp:ListItem>无</asp:ListItem>
												<asp:ListItem>不肯定</asp:ListItem>
												<asp:ListItem>肯定</asp:ListItem>
											</asp:RadioButtonList>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<asp:UpdatePanel runat="server" ID="UpdatePanel22">
									<ContentTemplate>
										<table cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td class="Column1JiBing1">
													高血压：
												</td>
												<td class="Column2JiWangBingShi">
													<asp:RadioButtonList ToolTip="不能为空" AutoPostBack="true" ID="rblHypertensionConfirm"
														runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="61"
														OnSelectedIndexChanged="rblHypertensionConfirm_SelectedIndexChanged">
														<asp:ListItem>无</asp:ListItem>
														<asp:ListItem>不肯定</asp:ListItem>
														<asp:ListItem>肯定</asp:ListItem>
													</asp:RadioButtonList>
												</td>
												<td>
													<asp:Panel runat="server" ID="PanelddlHypertensionLasted">
														病程(年):&nbsp;
														<asp:DropDownList ID="ddlHypertensionLasted" runat="server" RepeatDirection="Horizontal"
															RepeatLayout="Flow" TabIndex="61" Width="120px">
															<asp:ListItem>0</asp:ListItem>
															<asp:ListItem>1</asp:ListItem>
															<asp:ListItem>2</asp:ListItem>
															<asp:ListItem>3</asp:ListItem>
															<asp:ListItem>4</asp:ListItem>
															<asp:ListItem>5</asp:ListItem>
															<asp:ListItem>6</asp:ListItem>
															<asp:ListItem>7</asp:ListItem>
															<asp:ListItem>8</asp:ListItem>
															<asp:ListItem>9</asp:ListItem>
															<asp:ListItem>10</asp:ListItem>
															<asp:ListItem>11</asp:ListItem>
															<asp:ListItem>12</asp:ListItem>
															<asp:ListItem>13</asp:ListItem>
															<asp:ListItem>14</asp:ListItem>
															<asp:ListItem>15</asp:ListItem>
															<asp:ListItem>16</asp:ListItem>
															<asp:ListItem>17</asp:ListItem>
															<asp:ListItem>18</asp:ListItem>
															<asp:ListItem>19</asp:ListItem>
															<asp:ListItem>20</asp:ListItem>
															<asp:ListItem>20年以上</asp:ListItem>
														</asp:DropDownList>
														<br />
														治疗状况:
														<asp:DropDownList ID="ddlHypertensionTreatedState" runat="server" RepeatDirection="Horizontal"
															RepeatLayout="Flow" TabIndex="61" Width="120px">
															<asp:ListItem>未治疗</asp:ListItem>
															<asp:ListItem>间断用药</asp:ListItem>
															<asp:ListItem>规律用药</asp:ListItem>
														</asp:DropDownList>
													</asp:Panel>
												</td>
											</tr>
										</table>
									</ContentTemplate>
									<Triggers>
										<asp:AsyncPostBackTrigger ControlID="rblHypertensionConfirm" EventName="SelectedIndexChanged" />
									</Triggers>
								</asp:UpdatePanel>
							</td>
						</tr>
						<tr>
							<td>
								<asp:UpdatePanel runat="server" ID="UpdatePanel23">
									<ContentTemplate>
										<table cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td class="Column1JiBing1">
													糖尿病：
												</td>
												<td class="Column2JiWangBingShi">
													<asp:RadioButtonList ToolTip="不能为空" AutoPostBack="true" ID="rblGlycuresisConfirm"
														runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="rblGlycuresisConfirm_SelectedIndexChanged">
														<asp:ListItem>无</asp:ListItem>
														<asp:ListItem>不肯定</asp:ListItem>
														<asp:ListItem>肯定</asp:ListItem>
													</asp:RadioButtonList>
												</td>
												<td>
													<asp:Panel runat="server" ID="PanelddlGlycuresisLasted">
														病程(年):&nbsp;
														<asp:DropDownList ID="ddlGlycuresisLasted" runat="server" RepeatDirection="Horizontal"
															RepeatLayout="Flow" TabIndex="61" Width="120px">
															<asp:ListItem>0</asp:ListItem>
															<asp:ListItem>1</asp:ListItem>
															<asp:ListItem>2</asp:ListItem>
															<asp:ListItem>3</asp:ListItem>
															<asp:ListItem>4</asp:ListItem>
															<asp:ListItem>5</asp:ListItem>
															<asp:ListItem>6</asp:ListItem>
															<asp:ListItem>7</asp:ListItem>
															<asp:ListItem>8</asp:ListItem>
															<asp:ListItem>9</asp:ListItem>
															<asp:ListItem>10</asp:ListItem>
															<asp:ListItem>11</asp:ListItem>
															<asp:ListItem>12</asp:ListItem>
															<asp:ListItem>13</asp:ListItem>
															<asp:ListItem>14</asp:ListItem>
															<asp:ListItem>15</asp:ListItem>
															<asp:ListItem>16</asp:ListItem>
															<asp:ListItem>17</asp:ListItem>
															<asp:ListItem>18</asp:ListItem>
															<asp:ListItem>19</asp:ListItem>
															<asp:ListItem>20</asp:ListItem>
															<asp:ListItem>20年以上</asp:ListItem>
														</asp:DropDownList>
														<br />
														治疗状况:
														<asp:DropDownList ID="ddlGlycuresisTreatedState" runat="server" RepeatDirection="Horizontal"
															RepeatLayout="Flow" TabIndex="61" Width="120px">
															<asp:ListItem>未治疗</asp:ListItem>
															<asp:ListItem>口服药治疗</asp:ListItem>
															<asp:ListItem>胰岛素治疗</asp:ListItem>
															<asp:ListItem>运动,饮食治疗</asp:ListItem>
														</asp:DropDownList>
													</asp:Panel>
												</td>
											</tr>
										</table>
									</ContentTemplate>
									<Triggers>
										<asp:AsyncPostBackTrigger ControlID="rblGlycuresisConfirm" EventName="SelectedIndexChanged" />
									</Triggers>
								</asp:UpdatePanel>
							</td>
						</tr>
						<tr>
							<td>
								<asp:UpdatePanel runat="server" ID="UpdatePanel24">
									<ContentTemplate>
										<table cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td class="Column1JiBing1">
													脑卒中：
												</td>
												<td class="Column2JiWangBingShi">
													<asp:RadioButtonList ToolTip="不能为空" AutoPostBack="true" ID="rblCerebralHemorrhageConfirm"
														runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="rblCerebralHemorrhageConfirm_SelectedIndexChanged">
														<asp:ListItem>无</asp:ListItem>
														<asp:ListItem>不肯定</asp:ListItem>
														<asp:ListItem>肯定</asp:ListItem>
													</asp:RadioButtonList>
												</td>
												<td>
													<asp:Panel runat="server" ID="PanelrblCerebralHemorrhageTreateLasted">
														发病距此次就诊时间 :<asp:RadioButtonList  AutoPostBack="true" ID="rblCerebralHemorrhageTreateLasted"
															runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
															<asp:ListItem>3个月内</asp:ListItem>
															<asp:ListItem>3-6个月</asp:ListItem>
															<asp:ListItem>6-12个月</asp:ListItem>
															<asp:ListItem>12个月以上</asp:ListItem>
														</asp:RadioButtonList>
													</asp:Panel>
												</td>
											</tr>
										</table>
									</ContentTemplate>
									<Triggers>
										<asp:AsyncPostBackTrigger ControlID="rblCerebralHemorrhageConfirm" EventName="SelectedIndexChanged" />
									</Triggers>
								</asp:UpdatePanel>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing1">
											外围血管病：
										</td>
										<td class="Column2JiWangBingShi">
											<asp:RadioButtonList ToolTip="不能为空" AutoPostBack="false" ID="rblPeripheralVascularConfirm"
												runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
												<asp:ListItem>无</asp:ListItem>
												<asp:ListItem>不肯定</asp:ListItem>
												<asp:ListItem>肯定</asp:ListItem>
											</asp:RadioButtonList>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="l">
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing1">
											贫血或其它出血性疾病：
										</td>
										<td class="Column2JiWangBingShi">
											<asp:RadioButtonList ToolTip="不能为空" AutoPostBack="false" ID="rblAnemiaOrOtherConfirm"
												runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
												<asp:ListItem>无</asp:ListItem>
												<asp:ListItem>不肯定</asp:ListItem>
												<asp:ListItem>肯定</asp:ListItem>
											</asp:RadioButtonList>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<%-- 初步诊断--%>
			<tr onmouseover="this.className='highlight'" onmouseout="this.className='normal'">
				<td>
					<table cellpadding="0" cellspacing="0" border="0" class="category-item">
						<tr>
							<td class="subTitle">
								初步诊断
							</td>
						</tr>
						<tr>
							<td>
								<asp:UpdatePanel runat="server" ID="UpdatePanel25">
									<ContentTemplate>
										<table cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td class="Column1ZhuSuXianBingShi">
													<asp:RadioButton ID="rdAcuteST" Text="急性ST段抬高性心肌梗死" GroupName="ST" runat="server"
														Checked="true" AutoPostBack="true" OnCheckedChanged="rdAcuteST_CheckedChanged" />
												</td>
												<td>
													<asp:Panel runat="server" ID="PanelrdAcuteST">
														<asp:CheckBox ID="chkAnteroseptal" Text="前间壁" runat="server" />
														<asp:CheckBox ID="chkAntetheca" Text="前壁" runat="server" />
														<asp:CheckBox ID="chkExtensive" Text="广泛前壁" runat="server" />
														<asp:CheckBox ID="chkHeartWall" Text="侧壁" runat="server" />
														<asp:CheckBox ID="chkHighWall" Text="高侧壁" runat="server" />
														<br />
														<asp:CheckBox ID="chkInteriorWall" Text="下壁" runat="server" />
														<asp:CheckBox ID="chkBackWall" Text="后壁" runat="server" />
														<asp:CheckBox ID="chkRightVentricular" Text="右室" runat="server" />
													</asp:Panel>
												</td>
												<td style="width: 110px;">
													<button type="button" onclick="javascript:ST1()" class="treatStand">
														诊断标准</button>
												</td>
											</tr>
										</table>
									</ContentTemplate>
									<Triggers>
										<asp:AsyncPostBackTrigger ControlID="rdAcuteST" EventName="CheckedChanged" />
									</Triggers>
								</asp:UpdatePanel>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<%-- 疾病伴随状态--%>
			<tr onmouseover="this.className='highlight'" onmouseout="this.className='normal'">
				<td>
					<table cellpadding="0" cellspacing="0" border="0" class="category-item">
						<tr>
							<td class="subTitle">
								疾病伴随状态
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td>
											<asp:UpdatePanel runat="server" ID="UpdatePanel26">
												<ContentTemplate>
													<table cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td class="Column1JiBing1">
																心律失常:
															</td>
															<td class="Column2JiBing1">
																<asp:RadioButtonList ToolTip="不能为空" AutoPostBack="true" ID="ddlArrhythmiaExist" runat="server"
																	RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="ddlArrhythmiaExist_SelectedIndexChanged">
																	<asp:ListItem>无</asp:ListItem>
																	<asp:ListItem>有</asp:ListItem>
																</asp:RadioButtonList>
																&nbsp;
															</td>
															<td>
																<fieldset>
																	<asp:Panel runat="server" ID="PanelddlArrhythmiaExist">
																		<asp:CheckBox ID="chkVPB" Text="室早" runat="server" />
																		<asp:CheckBox ID="chkVT" Text="室速" runat="server" />
																		<asp:CheckBox ID="chkVF" Text="室颤" runat="server" />
																		<asp:CheckBox ID="chmAts" Text="室上性早搏" runat="server" />
																		<br />
																		<asp:CheckBox ID="chkAFS1" Text="房速" runat="server" />
																		<asp:CheckBox ID="chkAF" Text="房颤" runat="server" />
																		<asp:CheckBox ID="chkAPB" Text="窦性心动过缓" runat="server" />
																		<br />
																		房室传导阻滞（<asp:CheckBox ID="chkAVBI" Text="I度" runat="server" />
																		<asp:CheckBox ID="chkAVBII" Text="II度" runat="server" />
																		<asp:CheckBox ID="chkAVBIII" Text="III度" runat="server" />)
																		<br />
																		<asp:CheckBox ID="chkAFS" Text="左束支传导阻滞 " runat="server" />
																		<asp:CheckBox ID="chkRBBB" Text="右束支传导阻滞 " runat="server" />
																		<br />
																		<asp:CheckBox ID="chkAVBOther" Text="其他" runat="server" />
																	</asp:Panel>
																</fieldset>
															</td>
														</tr>
													</table>
												</ContentTemplate>
												<Triggers>
													<asp:AsyncPostBackTrigger ControlID="ddlArrhythmiaExist" EventName="SelectedIndexChanged" />
												</Triggers>
											</asp:UpdatePanel>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing1">
											低血压状态:
										</td>
										<td class="Column2JiBing1">
											<asp:RadioButtonList ToolTip="不能为空" AutoPostBack="false" ID="ddlHypotensionExist"
												runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
												<asp:ListItem>无</asp:ListItem>
												<asp:ListItem>有</asp:ListItem>
											</asp:RadioButtonList>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing1">
											心源性休克:
										</td>
										<td class="Column2JiBing1">
											<asp:RadioButtonList ToolTip="不能为空" AutoPostBack="false" ID="RadioButtonList2" runat="server"
												RepeatDirection="Horizontal" RepeatLayout="Flow">
												<asp:ListItem>无</asp:ListItem>
												<asp:ListItem>有</asp:ListItem>
												<asp:ListItem>不肯定</asp:ListItem>
											</asp:RadioButtonList>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing1">
											二尖瓣脱垂或断裂:
										</td>
										<td class="Column2JiBing1">
											<asp:RadioButtonList ToolTip="不能为空" AutoPostBack="false" ID="ddlMitralValveProlapseOrBreakExist"
												runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
												<asp:ListItem>无</asp:ListItem>
												<asp:ListItem>有</asp:ListItem>
												<asp:ListItem>不肯定</asp:ListItem>
											</asp:RadioButtonList>
										</td>
										<td style="width: 140px; color: Blue;">
											心室间隔穿孔:
										</td>
										<td class="Column4JiBing1">
											<asp:RadioButtonList ToolTip="不能为空" AutoPostBack="false" ID="rblPerforationofVentricularSeptumConfirm"
												runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
												<asp:ListItem>无</asp:ListItem>
												<asp:ListItem>有</asp:ListItem>
												<asp:ListItem>不肯定</asp:ListItem>
											</asp:RadioButtonList>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing1">
											脑卒中:
										</td>
										<td class="Column2JiBing1">
											<asp:RadioButtonList ToolTip="不能为空" AutoPostBack="false" ID="ddlStrokeExist" runat="server"
												RepeatDirection="Horizontal" RepeatLayout="Flow">
												<asp:ListItem>无</asp:ListItem>
												<asp:ListItem>有</asp:ListItem>
												<asp:ListItem>不肯定</asp:ListItem>
											</asp:RadioButtonList>
										</td>
										<td style="width: 140px; color: Blue;">
											消化道出血:
										</td>
										<td class="Column4JiBing1">
											<asp:RadioButtonList ToolTip="不能为空" AutoPostBack="false" ID="ddlOGLBExist" runat="server"
												RepeatDirection="Horizontal" RepeatLayout="Flow">
												<asp:ListItem>无</asp:ListItem>
												<asp:ListItem>有</asp:ListItem>
												<asp:ListItem>不肯定</asp:ListItem>
											</asp:RadioButtonList>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing1">
											心功能分级:
										</td>
										<td>
											<asp:RadioButtonList ToolTip="不能为空" AutoPostBack="false" ID="ddlKilipLever" runat="server"
												TabIndex="121" RepeatDirection="Horizontal" RepeatLayout="Flow">
												<asp:ListItem> Killip Ⅰ级 </asp:ListItem>
												<asp:ListItem> Killip Ⅱ级 </asp:ListItem>
												<asp:ListItem> Killip Ⅲ级 </asp:ListItem>
												<asp:ListItem> Killip Ⅳ级 </asp:ListItem>
											</asp:RadioButtonList>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<%--  诊断治疗过程--%>
			<tr onmouseover="this.className='highlight'" onmouseout="this.className='normal'">
				<td>
					<table cellpadding="0" cellspacing="0" border="0" class="category-item">
						<tr>
							<td class="subTitle">
								诊断治疗过程
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing1">
											就诊后首次血压:
										</td>
										<td>
											收缩压
											<asp:TextBox ID="txtBloodPressure" runat="server" Width="80px" CssClass="TextBoxSyle"></asp:TextBox>mmHg
										</td>
										<td>
											舒张压
											<asp:TextBox ID="txtDiastolicPressure" runat="server" Width="80px" CssClass="TextBoxSyle"></asp:TextBox>mmHg
											<asp:CustomValidator ID="CustomValidator1" ControlToValidate="txtDiastolicPressure"
												runat="server" ValidateEmptyText="false" ErrorMessage="请输入数字." OnServerValidate="ServerValidation" />
											<asp:CustomValidator ID="CustomValidatorBloodPressure" ControlToValidate="txtBloodPressure"
												runat="server" ValidateEmptyText="false" ErrorMessage="请输入数字." OnServerValidate="ServerValidation" />
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing1">
											首次心率：
										</td>
										<td>
											<asp:TextBox ToolTip="不为空" ID="txtFirstTimeHeartRate" runat="server" Width="40px" Height="18px"></asp:TextBox>
											&nbsp;次/分
											<asp:CustomValidator ID="CustomValidator8" ControlToValidate="txtFirstTimeHeartRate"
												runat="server" ValidateEmptyText="false" ErrorMessage="请输入数字" OnServerValidate="ServerValidation" />
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing1">
											首次心电图时间:
										</td>
										<td>
											<asp:TextBox ToolTip="不为空" ID="txtFirstTimeXinDianTu" runat="server" onclick="SelectDate(this,'yyyy-MM-dd hh:mm')" readonly="true" ></asp:TextBox>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing1">
											首次抽血时间：
										</td>
										<td>
											<asp:TextBox ToolTip="不为空" ID="txtFirstTimeBlood" runat="server" onclick="SelectDate(this,'yyyy-MM-dd hh:mm')" readonly="true" ></asp:TextBox>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing1">
											化验结果回报时间：<br />
										</td>
										<td>
											<asp:TextBox ToolTip="不为空" ID="txtFisrtTimeReturn" runat="server" onclick="SelectDate(this,'yyyy-MM-dd hh:mm')" readonly="true" ></asp:TextBox>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing1">
											首次cTNT结果：
										</td>
										<td>
											<asp:TextBox ID="txtCNTResult" runat="server"></asp:TextBox>
											<asp:CustomValidator ID="customValidator4" runat="server" ControlToValidate="txtCNTResult"
												ErrorMessage="请输入数字." Display="Dynamic" ValidateEmptyText="false" OnServerValidate="ServerValidation" />
											（正常值：<asp:TextBox ID="txtRegularCNT" runat="server" Width="116px"></asp:TextBox>(pg/ml))
											<asp:CustomValidator ID="customValidator5" runat="server" ControlToValidate="txtRegularCNT"
												ErrorMessage="请输入数字." Display="Dynamic" ValidateEmptyText="false" OnServerValidate="ServerValidation" />
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing11">
											是否向患者或家属提出静脉溶栓的建议:
										</td>
										<td>
											<asp:RadioButtonList ToolTip="不能为空" AutoPostBack="false" ID="rdbIntroduceThrombolysisSuggestion"
												runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
												<asp:ListItem>是</asp:ListItem>
												<asp:ListItem>否</asp:ListItem>
											</asp:RadioButtonList>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing11">
											向患者或家属提出静脉溶栓建议的时间:
										</td>
										<td>
											<asp:TextBox ToolTip="不为空" ID="txbIntroduceThrombolysisSuggestionDate" runat="server" onclick="SelectDate(this,'yyyy-MM-dd hh:mm')" readonly="true" ></asp:TextBox>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing11" style="color: Red; font-weight: bold">
											是否进行了静脉溶栓治疗:
										</td>
										<td>
											<asp:RadioButtonList ToolTip="是否溶栓不能为空" ID="rdbThrombolysisTreateConfirm" runat="server"
												AutoPostBack="true" RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="rdbThrombolysisTreateConfirm_SelectedIndexChanged1"
												>
												<asp:ListItem>是</asp:ListItem>
												<asp:ListItem>否</asp:ListItem>
											</asp:RadioButtonList>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<asp:UpdatePanel runat="server" ID="UpdatePanel3">
									<ContentTemplate>
										<tr>
											<td>
												<asp:Panel ID="panelWeiJinXingJingMaiRongShuan" AutoPostBack="true" runat="server">
													<fieldset>
														<legend>未进行静脉溶栓的原因</legend>
														<div class="styleLeft">
															<asp:CheckBox ID="chkUnThrombolysisReasonForUnSute" runat="server" Text="不适合静脉溶栓或已超过静脉溶栓的时间窗" />
															<br />
															<asp:CheckBox ID="chkUnThrombolysisReasonForPatientDisagree" runat="server" Text="患者或家属不同意" />
															<br />
															<asp:CheckBox ID="chkUnThrombolyticForEconomicReason" runat="server" Text="患者经济方面的原因" />
															<br />
															<asp:CheckBox ID="chkUnThrombolyticForHospitalCanNotDid" runat="server" Text="本院不能进行静脉溶栓治疗" />
															<br />
															<asp:CheckBox ID="chkUnThrombolyticForContraindication" runat="server" Text="有溶栓治疗禁忌症" />
														</div>
													</fieldset>
												</asp:Panel>
												<asp:Panel ID="panelRongShuanLiYou" AutoPostBack="true" runat="server">
													<fieldset>
														<legend>溶栓理由</legend>
														<div class="styleLeft" style="text-align: left;">
															<asp:CheckBox ID="chkThrombolyticForDisagree" runat="server" Text="不同意进行介入治疗" />
															<br />
															<asp:CheckBox ID="chkThrombolyticForEconomicReason" runat="server" Text="因经济原因不能进行介入治疗" />
															<br />
															<asp:CheckBox ID="chkThrombolyticForDream" runat="server" Text="有介入治疗的禁忌证" />
															<br />
															<asp:CheckBox ID="chkThrombolyticForTimeLimited" runat="server" Text="不能在3小时内到达有介入资质的医院" />
														</div>
													</fieldset>
												</asp:Panel>
											</td>
										</tr>
									</ContentTemplate>
									<Triggers>
										<asp:AsyncPostBackTrigger ControlID="rdbThrombolysisTreateConfirm" EventName="SelectedIndexChanged" />
									</Triggers>
								</asp:UpdatePanel>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td class="Column1JiBing11">
											开始静脉溶栓距离就诊时间:（D2N）
										</td>
										<td>
											<asp:RadioButtonList ToolTip="不能为空" ID="rblTreatTime" runat="server" AutoPostBack="false"
												RepeatDirection="Horizontal" RepeatLayout="Flow">
												<asp:ListItem>≤0.5h</asp:ListItem>
												<asp:ListItem>0.5-1.0h</asp:ListItem>
												<asp:ListItem>0.5-1.5h</asp:ListItem>
												<asp:ListItem>1.5-2.0h</asp:ListItem>
												<asp:ListItem>＞2.0h</asp:ListItem>
											</asp:RadioButtonList>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<%--    静脉溶栓--%>
						<tr>
							<td>
								<fieldset>
									<legend>静脉溶栓</legend>
									<table border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td>
												<asp:UpdatePanel runat="server" ID="updatePanel4">
													<ContentTemplate>
														<table border="0" cellpadding="0" cellspacing="0" class="styleLeft">
															<tr>
																<td class="tableWidth2">
																	<asp:RadioButton ID="niaoJiMei" runat="server" GroupName="JingMaiRongShuan" Text="尿激酶: &nbsp;&nbsp;"
																		OnCheckedChanged="niaoJiMei_CheckedChanged" AutoPostBack="true" />
																	<asp:RadioButtonList  ID="rblUrokinase" runat="server" AutoPostBack="true"
																		RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="rblUrokinase_SelectedIndexChanged">
																		<asp:ListItem>50  万U</asp:ListItem>
																		<asp:ListItem>100 万U</asp:ListItem>
																		<asp:ListItem>150 万U</asp:ListItem>
																	</asp:RadioButtonList>
																	&nbsp;&nbsp;&nbsp;&nbsp;其他：<asp:TextBox ID="txtUrokinaseOther" runat="server"></asp:TextBox>
																	&nbsp;(万U)
																	<asp:CustomValidator ID="customValidator6" runat="server" ControlToValidate="txtUrokinaseOther"
																		Display="Dynamic" ErrorMessage="请输入数字." OnServerValidate="ServerValidation" ValidateEmptyText="false" />
																</td>
															</tr>
															<tr>
																<td>
																	<asp:RadioButton ID="aiTiPuMei" runat="server" GroupName="JingMaiRongShuan" Text="阿替普酶:"
																		OnCheckedChanged="aiTiPuMei_CheckedChanged" AutoPostBack="true" />
																	<asp:RadioButtonList  ID="rblAlteplase" runat="server" AutoPostBack="true"
																		RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="rblAlteplase_SelectedIndexChanged">
																		<asp:ListItem>50  mg</asp:ListItem>
																		<asp:ListItem>100 mg</asp:ListItem>
																	</asp:RadioButtonList>
																</td>
															</tr>
															<tr>
																<td>
																	<asp:RadioButton ID="ruiTiPuMei" runat="server" GroupName="JingMaiRongShuan" Text="瑞替普酶:"
																		OnCheckedChanged="ruiTiPuMei_CheckedChanged" AutoPostBack="true" />
																	<asp:RadioButtonList  ID="rblReteplase" runat="server" AutoPostBack="true"
																		RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="rblReteplase_SelectedIndexChanged">
																		<asp:ListItem>10MU×1次</asp:ListItem>
																		<asp:ListItem>10MU×2次</asp:ListItem>
																		<asp:ListItem>10MU×3次</asp:ListItem>
																	</asp:RadioButtonList>
																</td>
															</tr>
															<tr>
																<td>
																	<span style="color: Red; font-weight: bold">是否再通:</span>&nbsp;<asp:RadioButtonList
																		ID="rblPass" runat="server" AutoPostBack="false" RepeatDirection="Horizontal"
																		RepeatLayout="Flow">
																		<asp:ListItem>是</asp:ListItem>
																		<asp:ListItem>否</asp:ListItem>
																	</asp:RadioButtonList>
																</td>
															</tr>
															<tr>
																<td>
																	<table border="0" cellpadding="0" cellspacing="0">
																		<tr>
																			<td>
																				<span style="color: Red; font-weight: bold">并发症:</span>
																				<asp:CheckBox ID="chkReperfusionArrhythmia" runat="server" Text="再灌注心律失常" />&nbsp;
																				<asp:CheckBox ID="chkAnaphylaxis" runat="server" Text="过敏反应 " />&nbsp;
																			</td>
																			<td>
																				<asp:UpdatePanel runat="server" ID="UpdatePanel2">
																					<ContentTemplate>
																						<asp:CheckBox ID="chkBlood" AutoPostBack="true" runat="server" Text="出血 " OnCheckedChanged="chkBlood_CheckedChanged" />
																						<asp:RadioButtonList   ID="rblBleed" runat="server" AutoPostBack="false"
																							RepeatDirection="Horizontal" RepeatLayout="Flow">
																							<asp:ListItem>小量</asp:ListItem>
																							<asp:ListItem>中等量</asp:ListItem>
																							<asp:ListItem>大量</asp:ListItem>
																						</asp:RadioButtonList>
																					</ContentTemplate>
																					<Triggers>
																						<asp:AsyncPostBackTrigger ControlID="chkBlood" EventName="CheckedChanged" />
																					</Triggers>
																				</asp:UpdatePanel>
																			</td>
																		</tr>
																	</table>
																</td>
															</tr>
														</table>
													</ContentTemplate>
													<Triggers>
														<asp:AsyncPostBackTrigger ControlID="rblUrokinase" EventName="SelectedIndexChanged" />
														<asp:AsyncPostBackTrigger ControlID="rblAlteplase" EventName="SelectedIndexChanged" />
														<asp:AsyncPostBackTrigger ControlID="rblReteplase" EventName="SelectedIndexChanged" />
													</Triggers>
												</asp:UpdatePanel>
											</td>
										</tr>
									</table>
								</fieldset>
							</td>
						</tr>
						<%--    辅助用药--%>
						<tr>
							<td>
								<fieldset>
									<legend>辅助用药</legend>
									<table border="0" cellpadding="0" cellspacing="0" class="styleLeft">
										<tr>
											<td colspan="2" class="tableWidth2">
												阿斯匹林:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButtonList 
													ID="rblAspirinDosage" runat="server" AutoPostBack="false" RepeatDirection="Horizontal"
													RepeatLayout="Flow">
													<asp:ListItem>未用</asp:ListItem>
													<asp:ListItem>100 mg</asp:ListItem>
													<asp:ListItem>200 mg</asp:ListItem>
													<asp:ListItem>300 mg</asp:ListItem>
												</asp:RadioButtonList>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												氯吡格雷:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButtonList 
													ID="rblClopidogrelDosage" runat="server" AutoPostBack="false" RepeatDirection="Horizontal"
													RepeatLayout="Flow">
													<asp:ListItem>未用</asp:ListItem>
													<asp:ListItem>75  mg</asp:ListItem>
													<asp:ListItem>300 mg</asp:ListItem>
													<asp:ListItem>600 mg</asp:ListItem>
												</asp:RadioButtonList>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<asp:UpdatePanel ID="UpdatePanel27" runat="server">
													<ContentTemplate>
														<table border="0" cellpadding="0" cellspacing="0">
															<tr>
																<td class="Column6">
																	是否应用他汀类药物:
																</td>
																<td class="Column1">
																	<asp:RadioButtonList  ID="rblLoadStatinUsed" runat="server" AutoPostBack="true"
																		OnSelectedIndexChanged="rblLoadStatinUsed_SelectedIndexChanged" RepeatDirection="Horizontal"
																		RepeatLayout="Flow">
																		<asp:ListItem>是</asp:ListItem>
																		<asp:ListItem>否</asp:ListItem>
																	</asp:RadioButtonList>
																</td>
																<td>
																	<asp:Panel ID="PanelRadioButtonList" runat="server">
																		<asp:CheckBox ID="chkSimvastatin" runat="server" Text="辛伐他汀 " />
																		<asp:CheckBox ID="chkPravastatin" runat="server" Text="普伐他汀" />
																		<asp:CheckBox ID="chkFluvastatin" runat="server" Text="氟伐他汀" />
																		<asp:CheckBox ID="chkAtorvastatin" runat="server" Text="阿托伐他汀" />
																		<br />
																		<asp:CheckBox ID="chkRosuvastatin" runat="server" Text="瑞舒伐他汀" />
																		<asp:CheckBox ID="chkPitavastatin" runat="server" Text="匹伐他汀" />
																	</asp:Panel>
																</td>
															</tr>
														</table>
													</ContentTemplate>
													<Triggers>
														<asp:AsyncPostBackTrigger ControlID="rblLoadStatinUsed" EventName="SelectedIndexChanged" />
													</Triggers>
												</asp:UpdatePanel>
											</td>
										</tr>
										<tr>
											<td style="width: 350px;">
												是否应用血管紧张素转换酶抑制剂（ACEI）或ARB:
											</td>
											<td style="width: 410px;">
												<asp:RadioButtonList ToolTip="不能为空" ID="rblACEIConfirm" runat="server" AutoPostBack="false"
													RepeatDirection="Horizontal" RepeatLayout="Flow">
													<asp:ListItem>是</asp:ListItem>
													<asp:ListItem>否</asp:ListItem>
												</asp:RadioButtonList>
											</td>
										</tr>
										<tr>
											<td>
												是否应用β-受体阻滞剂:
											</td>
											<td>
												<asp:RadioButtonList ToolTip="不能为空" ID="rblBRBConfrim" runat="server" AutoPostBack="false"
													RepeatDirection="Horizontal" RepeatLayout="Flow">
													<asp:ListItem>是</asp:ListItem>
													<asp:ListItem>否</asp:ListItem>
												</asp:RadioButtonList>
											</td>
										</tr>
									</table>
								</fieldset>
							</td>
						</tr>
						<tr>
							<td>
								<table border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td class="Column1JiBing11">
											是否向患者或家属介绍急诊冠脉介入治疗:
										</td>
										<td class="style14">
											<asp:RadioButtonList ToolTip="不能为空" ID="rblIntroduceEmergencyCoronaryConfirm" runat="server"
												AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow">
												<asp:ListItem>是</asp:ListItem>
												<asp:ListItem>否</asp:ListItem>
											</asp:RadioButtonList>
										</td>
									</tr>
									<tr>
										<td class="Column1JiBing11">
											向患者或家属介绍急诊冠脉介入治疗的时间:
										</td>
										<td class="style14">
											<asp:TextBox ToolTip="不为空" ID="txtIntroduceEmergencyCoronaryDate" runat="server" CssClass="Wdate" onclick="SelectDate(this,'yyyy-MM-dd hh:mm')" readonly="true"></asp:TextBox>
										</td>
									</tr>
									<tr>
										<td class="Column1JiBing11">
											患者或家属是否已同意接受冠脉介入治疗:
										</td>
										<td class="style14">
											<asp:RadioButtonList ToolTip="不能为空" ID="rblAgreeEmergencyCoronaryConfirm" runat="server"
												AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow">
												<asp:ListItem>是</asp:ListItem>
												<asp:ListItem>否</asp:ListItem>
											</asp:RadioButtonList>
										</td>
									</tr>
									<tr>
										<td class="Column1JiBing11">
											是否在本医院实施了急诊冠脉介入治疗:
										</td>
										<td class="style14">
											<asp:RadioButtonList ToolTip="姓名不能为空" ID="rdbEmergencyCoronaryTreateConfirm" runat="server"
												AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow" >
												<asp:ListItem>是</asp:ListItem>
												<asp:ListItem>否</asp:ListItem>
											</asp:RadioButtonList>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<fieldset>
									<legend>未进行急诊冠脉介入治疗的原因</legend>
									<table border="0" cellpadding="0" cellspacing="0" class="styleLeft" style="width: 390px;">
										<tr>
											<td>
												<asp:CheckBox ID="chkUnEmergencyCoronaryTreateForHospitalUnable" runat="server" Text="本院不能开展" />
												<br />
												<asp:CheckBox ID="chkUnEmergencyCoronaryTreateForOverTreateTime" runat="server" Text="已超过介入治疗有效时间窗" />
												<br />
												<asp:CheckBox ID="chkUnEmergencyCoronaryTreateForPatientDisagree" runat="server"
													Text="患者或家属不同意" />
												<br />
												<asp:CheckBox ID="chkUnEmergencyCoronaryTreateForEmergency" runat="server" Text="患者经济原因" />
												<br />
												<asp:CheckBox ID="chkUnEmergencyCoronaryTreateForContraindication" runat="server"
													Text="有介入治疗禁忌症" />
											</td>
										</tr>
									</table>
								</fieldset>
							</td>
						</tr>
						<tr>
							<td>
								<fieldset>
									<legend>在本医院急诊介入治疗</legend>
									<table border="0" cellpadding="0" cellspacing="0" class="styleLeft" style="width: 400px;">
										<tr>
											<td class="Column1">
												是否成功:
											</td>
											<td>
												<asp:RadioButtonList ToolTip="不能为空" ID="rblSucceed" runat="server" AutoPostBack="false"
													RepeatDirection="Horizontal" RepeatLayout="Flow">
													<asp:ListItem>是</asp:ListItem>
													<asp:ListItem>否</asp:ListItem>
												</asp:RadioButtonList>
											</td>
										</tr>
										<tr>
											<td class="Column1">
												D2B时间:
											</td>
											<td>
												<asp:TextBox ID="txtD2BTime" runat="server"></asp:TextBox>
												分钟
												<asp:CustomValidator ID="customValidator7" runat="server" ControlToValidate="txtD2BTime"
													Display="Dynamic" ErrorMessage="请输入数字." OnServerValidate="ServerValidation" ValidateEmptyText="false" />
											</td>
										</tr>
									</table>
								</fieldset>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<%--    临床转归--%>
			<tr onmouseover="this.className='highlight'" onmouseout="this.className='normal'">
				<td>
					<table cellpadding="0" cellspacing="0" border="0" class="category-item">
						<tr>
							<td class="subTitle">
								临床转归
							</td>
						</tr>
						<tr>
							<td>
								<asp:UpdatePanel ID="UpdatePanel31" runat="server">
									<ContentTemplate>
										<table border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td class="Column1JiBing11">
													在院24h内是否进行了心肺复苏:
												</td>
												<td>
													<asp:RadioButtonList ToolTip="不能为空" ID="rblCPR" runat="server" AutoPostBack="true"
														OnSelectedIndexChanged="rblCPR_SelectedIndexChanged" RepeatDirection="Horizontal"
														RepeatLayout="Flow">
														<asp:ListItem>是</asp:ListItem>
														<asp:ListItem>否</asp:ListItem>
													</asp:RadioButtonList>
												</td>
												<td>
													<asp:Panel ID="panetxtCPRTimes" runat="server">
														&nbsp; [次数:
														<asp:TextBox ID="txtCPRTimes" runat="server"></asp:TextBox>
														]
														<asp:CustomValidator ID="customValidator2" runat="server" ControlToValidate="txtCPRTimes"
															Display="Dynamic" ErrorMessage="请输入数字." OnServerValidate="ServerValidation" ValidateEmptyText="false" />
													</asp:Panel>
												</td>
											</tr>
										</table>
									</ContentTemplate>
									<Triggers>
										<asp:AsyncPostBackTrigger ControlID="rblCPR" EventName="SelectedIndexChanged" />
									</Triggers>
								</asp:UpdatePanel>
							</td>
						</tr>
						<tr>
							<td>
								<asp:UpdatePanel ID="UpdatePanel28" runat="server">
									<ContentTemplate>
										<table border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td>
													<span style="color: Blue">在院24h内的转归:</span>
													<asp:RadioButtonList ToolTip="姓名不能为空" ID="rblTreatResult" runat="server" AutoPostBack="true"
														OnSelectedIndexChanged="rblTreatResult_SelectedIndexChanged" RepeatDirection="Horizontal"
														RepeatLayout="Flow"  >
														<asp:ListItem>无变化</asp:ListItem>
														<asp:ListItem>好转</asp:ListItem>
														<asp:ListItem>加重</asp:ListItem>
														<asp:ListItem>死亡</asp:ListItem>
													</asp:RadioButtonList>
												</td>
											</tr>
											<tr>
												<td>
													<asp:Panel ID="panelrblTreatResult" runat="server">
														<fieldset>
															<table border="0" cellpadding="0" cellspacing="0" class="tableWidth2">
																<tr>
																	<td class="Column1">
																		死亡时间：
																	</td>
																	<td>
																		<asp:TextBox ID="txtDeadTime" runat="server" onclick="SelectDate(this,'yyyy-MM-dd hh:mm')" readonly="true" ></asp:TextBox>
																	</td>
																</tr>
																<tr>
																	<td class="Column1">
																		死亡原因:
																	</td>
																	<td class="tdTopBottomLine" style="border-left: 1px dashed #000;">
																		<asp:CheckBox ID="chkDeadForVentriclarArrhythmias" runat="server" Text="室性心律失常（室速，室颤）" />&nbsp;
																		<asp:CheckBox ID="chkDeadForCardiacArrest" runat="server" Text="心跳骤停/电机械分离" />&nbsp;
																		<asp:CheckBox ID="chkDeadForCardiogenicShock" runat="server" Text="心源性休克" /><br />
																		<asp:CheckBox ID="chkDeadForACVD" runat="server" Text="急性脑血管病 " />&nbsp;
																		<asp:CheckBox ID="chkDeadForGIH" runat="server" Text="消化道大出血 " />&nbsp;
																		<asp:CheckBox ID="chkDeadForOther" runat="server" Text="其它" />
																	</td>
																</tr>
															</table>
														</fieldset>
													</asp:Panel>
												</td>
											</tr>
										</table>
									</ContentTemplate>
									<Triggers>
										<asp:AsyncPostBackTrigger ControlID="rblTreatResult" EventName="SelectedIndexChanged" />
									</Triggers>
								</asp:UpdatePanel>
							</td>
						</tr>
						<tr>
							<td>
								<asp:UpdatePanel runat="server" ID="updatePanelTransfer">
									<ContentTemplate>
										<table border="0" cellpadding="0" cellspacing="0" class="tableWidth2">
											<tr>
												<td class="Column1JiBing11">
													转上级医院:
												</td>
												<td>
													<asp:RadioButtonList ToolTip="是否转院" ID="rblTransUpHospitalConfirm" runat="server"
														AutoPostBack="true"   OnSelectedIndexChanged="rblTransUpHospitalConfirm_SelectedIndexChanged"
														RepeatDirection="Horizontal" RepeatLayout="Flow">
														<asp:ListItem>是</asp:ListItem>
														<asp:ListItem>否</asp:ListItem>
													</asp:RadioButtonList>
												</td>
											</tr>
											<tr>
												<td>
													<asp:Panel runat="server" ID="panelTransfer">
														<fieldset>
															<legend>转院</legend>
															<table border="0" cellpadding="0" cellspacing="0" class="tableWidth2">
																<tr>
																	<td colspan="2">
																		<asp:RadioButtonList  ID="rblTransUpHospitalLever" runat="server" AutoPostBack="true"
																			RepeatDirection="Horizontal" RepeatLayout="Flow">
																			<asp:ListItem>市级医院</asp:ListItem>
																			<asp:ListItem>省级医院</asp:ListItem>
																		</asp:RadioButtonList>
																	</td>
																</tr>
																<tr>
																	<td colspan="2">
																		<span style="color: Blue">患者转院前是否已与上级医院联系准备下一步的治疗: </span>
																		<asp:RadioButtonList  ID="rblConnectUpHospitalConfirm" runat="server"
																			AutoPostBack="true" OnSelectedIndexChanged="rblConnectUpHospitalConfirm_SelectedIndexChanged"
																			RepeatDirection="Horizontal" RepeatLayout="Flow">
																			<asp:ListItem>是</asp:ListItem>
																			<asp:ListItem>否</asp:ListItem>
																		</asp:RadioButtonList>
																	</td>
																</tr>
																<tr>
																	<td class="Column1JiBing11">
																		患者转上级医院时间:
																	</td>
																	<td>
																		<asp:TextBox  ID="txbTransUpHospitalDate" runat="server" value="" maxlength="100"   onclick="SelectDate(this,'yyyy-MM-dd hh:mm')" readonly="true" style="width:265px;cursor:pointer"></asp:TextBox>
																	</td>
																</tr>
															</table>
														</fieldset>
													</asp:Panel>
												</td>
											</tr>
										</table>
									</ContentTemplate>
									<Triggers>
										<asp:AsyncPostBackTrigger ControlID="rblTransUpHospitalConfirm" EventName="SelectedIndexChanged" />
									</Triggers>
								</asp:UpdatePanel>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td style="padding-bottom: 100px;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td align="center">
					<asp:Button ID="btnSave" runat="server" CssClass="ButtonSave" OnClick="btnSave_Click"
						Text="保存" />
					&nbsp;&nbsp;
					<asp:Button ID="btnSubmit" runat="server" Text="提交" CssClass="ButtonSave" OnClick="btnSubmit_Click" />
					&nbsp;&nbsp;&nbsp;
					<asp:Button ID="btnEnterPrint" Text="进入打印页面" OnClick="btnEnterPrint_Click" class="ButtonSave"
						runat="server" Width="145px" />
				</td>
			</tr>
			<tr>
				<td style="padding-bottom: 160px;">
					&nbsp;
				</td>
			</tr>
		</table>
	</asp:Panel>
	</form>
</body>
</html>
