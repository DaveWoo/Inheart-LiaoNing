namespace CoronaryHeartDiseaseProject
{
	using System;
	using System.Collections.Generic;
	using System.Drawing;
	using System.Text.RegularExpressions;
	using System.Web;

	public class BaseSystem
	{
		#region Javascsript常见的弹出窗口(重载1次)

		/// <summary>
		/// javascsript常见的弹出窗口
		/// </summary>
		/// <param name="Msg">要显示的提示信息</param>
		/// <param name="Url">要转到的网站地址</param>
		/// <returns></returns>
		public static string ShowWindow(string Msg, string Url)
		{
			string resultstring = "";
			resultstring = "<script language=\"javascript\">";
			resultstring += "alert(\"" + Msg + "\");";
			resultstring += "window.location=\"" + Url + "\";";
			resultstring += "</script>";
			return resultstring;
		}

		/// <summary>
		/// javascsript常见的弹出窗口
		/// </summary>
		/// <param name="Msg">要显示的提示信息</param>
		/// <returns></returns>
		public static string ShowWindow(string Msg)
		{
			string resultstring = "";
			resultstring = "<script language=\"javascript\">";
			resultstring += "alert(\"" + Msg + "\");";
			resultstring += "window.history.go(-1);";
			resultstring += "</script>";
			return resultstring;
		}

		#endregion Javascsript常见的弹出窗口(重载1次)

		#region 数据绑定

		/// <summary>
		/// 绑定病例集合数据
		/// </summary>
		/// <typeparam name="T">模板</typeparam>
		/// <param name="dataList">数据集合</param>
		/// <param name="bindingData">绑定数据</param>
		/// <param name="DataStartIndex">数据开始索引</param>
		/// <param name="PageStartIndex">页面开始索引</param>
		/// <param name="PageSize">页面尺寸</param>
		public static void BindProduceData<T>(System.Web.UI.WebControls.DataList dataList, List<T> bindingData, int DataStartIndex, int PageStartIndex, int PageSize)
		{
			List<T> bindingList = new List<T>();
			if (dataList != null)
			{
				for (int i = PageStartIndex * PageSize; i < bindingData.Count; i++)
				{
					if (bindingData[i] == null || bindingList.Count > 11)
					{
						break;
					}
					bindingList.Add(bindingData[i]);
				}
				if (bindingList != null)
				{
					dataList.DataSource = bindingList;
					dataList.DataBind();
				}
			}
		}

		#endregion 数据绑定

		#region 生成验证码

		/// <summary>
		/// 生成验证码
		/// </summary>
		public static void DrawImage()
		{
			BaseSystem img = new BaseSystem();
			HttpContext.Current.Session["CheckCode"] = img.RndNum(4);
			img.CreateImages(HttpContext.Current.Session["CheckCode"].ToString());
		}

		/// <summary>
		/// 生成验证图片
		/// </summary>
		/// <param name="checkCode">验证字符</param>
		public void CreateImages(string checkCode)
		{
			int iwidth = (int)(checkCode.Length * 13);
			System.Drawing.Bitmap image = new System.Drawing.Bitmap(iwidth, 23);
			Graphics g = Graphics.FromImage(image);
			g.Clear(Color.BlanchedAlmond);
			//定义颜色
			Color[] c = { Color.Black, Color.Red, Color.DarkBlue, Color.Green, Color.Orange, Color.Brown, Color.DarkCyan, Color.Purple };
			//定义字体
			string[] font = { "Verdana", "Microsoft Sans Serif", "Comic Sans MS", "Arial", "宋体" };
			Random rand = new Random();
			//随机输出噪点
			for (int i = 0; i < 50; i++)
			{
				int x = rand.Next(image.Width);
				int y = rand.Next(image.Height);
				g.DrawRectangle(new Pen(Color.LightGray, 0), x, y, 1, 1);
			}

			//输出不同字体和颜色的验证码字符
			for (int i = 0; i < checkCode.Length; i++)
			{
				int cindex = rand.Next(7);
				int findex = rand.Next(5);

				Font f = new System.Drawing.Font(font[findex], 10, System.Drawing.FontStyle.Bold);
				Brush b = new System.Drawing.SolidBrush(c[cindex]);
				int ii = 4;
				if ((i + 1) % 2 == 0)
				{
					ii = 2;
				}
				g.DrawString(checkCode.Substring(i, 1), f, b, 3 + (i * 12), ii);
			}
			//画一个边框
			g.DrawRectangle(new Pen(Color.White, 0), 0, 0, image.Width - 1, image.Height - 1);

			//输出到浏览器
			System.IO.MemoryStream ms = new System.IO.MemoryStream();
			image.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
			HttpContext.Current.Response.ClearContent();
			//Response.ClearContent();
			HttpContext.Current.Response.ContentType = "image/Jpeg";
			HttpContext.Current.Response.BinaryWrite(ms.ToArray());
			g.Dispose();
			image.Dispose();
		}

		/// <summary>
		/// 生成随机的字母
		/// </summary>
		/// <param name="VcodeNum">生成字母的个数</param>
		/// <returns>string</returns>
		public string RndNum(int VcodeNum)
		{
			string Vchar = "0,1,2,3,4,5,6,7,8,9";
			string[] VcArray = Vchar.Split(',');
			string VNum = ""; //由于字符串很短，就不用StringBuilder了
			int temp = -1; //记录上次随机数值，尽量避免生产几个一样的随机数

			//采用一个简单的算法以保证生成随机数的不同
			Random rand = new Random();
			for (int i = 1; i < VcodeNum + 1; i++)
			{
				if (temp != -1)
				{
					rand = new Random(i * temp * unchecked((int)DateTime.Now.Ticks));
				}
				int t = rand.Next(VcArray.Length);
				if (temp != -1 && temp == t)
				{
					return RndNum(VcodeNum);
				}
				temp = t;
				VNum += VcArray[t];
			}
			return VNum;
		}

		#endregion 生成验证码

		#region 过滤html标记

		/// <summary>
		/// 过滤html标记
		/// </summary>
		/// <param name="strHtml"></param>
		/// <returns></returns>
		public static string StripHTML(string strHtml)
		{
			string[] aryReg ={
							@"<script[^>]*?>.*?</script>",
							@"<(\/\s*)?!?((\w+:)?\w+)(\w+(\s*=?\s*(([""'])(\\[""'tbnr]|[^\7])*?\7|\w+)|.{0})|\s)*?(\/\s*)?>",
							@"([\r\n])[\s]+",
							@"&(quot|#34);",
							@"&(amp|#38);",
							@"&(lt|#60);",
							@"&(gt|#62);",
							@"&(nbsp|#160);",
							@"&(iexcl|#161);",
							@"&(cent|#162);",
							@"&(pound|#163);",
							@"&(copy|#169);",
							@"&#(\d+);",
							@"-->",
							@"<!--.*\n"
							};
			string[] aryRep = {
							"",
							"",
							"",
							"\"",
							"&",
							"<",
							">",
							" ",
							"\xa1",//chr(161),
							"\xa2",//chr(162),
							"\xa3",//chr(163),
							"\xa9",//chr(169),
							"",
							"\r\n",
							""
						 };
			string newReg = aryReg[0];
			string strOutput = strHtml;
			for (int i = 0; i < aryReg.Length; i++)
			{
				Regex regex = new Regex(aryReg[i], RegexOptions.IgnoreCase);
				strOutput = regex.Replace(strOutput, aryRep[i]);
			}
			strOutput.Replace("<", "");
			strOutput.Replace(">", "");
			strOutput.Replace("\r\n", "");

			return strOutput;
		}

		#endregion 过滤html标记
	}
}