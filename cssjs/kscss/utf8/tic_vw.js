

	ticvwurl = "";
	ckname = "TICURL" + "=";
	ckw = document.cookie+";";
	ckre = ckw.indexOf(ckname);
	if (ckre != -1){
	last = ckw.indexOf(";",ckre);
	ticvwurl = unescape(ckw.substring(ckre + ckname.length,last));
	}else{
	ticvwurl = 'http%3A%2F%2Fgame.kunitori.com%2Ftxt%2Fsaba_all.xml';
	}

	if (ticvwurl != "off"){
document.write('<!-- ai-Ticker-J --><style type="text/css">a#ai-ticker-j_title:link {text-decoration:none;color:#333333;font-size:12px;}a#ai-ticker-j_title:visited {text-decoration:none;color:#333333;font-size:12px;}#ai-ticker-j_itemdate {color:#990000;font-size:10px;}a#ai-ticker-j_itemtitle:link{text-decoration:none;color:#000099;font-size:12px;}a#ai-ticker-j_itemtitle:visited{text-decoration:none;color:#000099;font-size:12px;}a#ai-ticker-j_itemdesc:link {text-decoration:none;color:#666666;font-size:12px;}a#ai-ticker-j_itemdesc:visited{text-decoration:none;color:#666666;font-size:12px;}#aiticker-j_copyright {color:#666666;font-size:12px;}</style><span style='padding:0px;width:468px;'><script type="text/javascript" src="http://www.ai-line.co.jp/aiticker-j/getjs_document.php?rss=' + cbins + '&width=418&scrolldelay=85" charset="UTF-8"></script></span><!-- ai-Ticker-J -->');
	}
