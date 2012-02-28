
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

function ks(){
	document.getElementById('tic_vw').innerHTML = '<!-- ai-Ticker --><object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="468" height="30" align="middle"><param name="allowScriptAccess" value="sameDomain" /><param name="movie" value="http://www.ai-line.co.jp/aiticker/ai-ticker_468_30.swf" /><param name="quality" value="high" /><param name="FlashVars" value="rss='+ ticvwurl +'&skin=http://www.ai-line.co.jp/aiticker/skin/468_30_gr.jpg&color=#333333,#666666,#990000,#000099,#666666&speed=1.0" /><embed src="http://www.ai-line.co.jp/aiticker/ai-ticker_468_30.swf" FlashVars="rss='+ ticvwurl +'&skin=http://www.ai-line.co.jp/aiticker/skin/468_30_gr.jpg&color=#333333,#666666,#990000,#000099,#666666&speed=1.0" quality="high" width="468" height="30" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" /></object><!-- ai-Ticker -->';
setTimeout("ks()",300000);

}
	if (ticvwurl != "off"){
	document.getElementById('tic_vw').innerHTML = '<!-- ai-Ticker --><object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="468" height="30" align="middle"><param name="allowScriptAccess" value="sameDomain" /><param name="movie" value="http://www.ai-line.co.jp/aiticker/ai-ticker_468_30.swf" /><param name="quality" value="high" /><param name="FlashVars" value="rss='+ ticvwurl +'&skin=http://www.ai-line.co.jp/aiticker/skin/468_30_gr.jpg&color=#333333,#666666,#990000,#000099,#666666&speed=1.0" /><embed src="http://www.ai-line.co.jp/aiticker/ai-ticker_468_30.swf" FlashVars="rss='+ ticvwurl +'&skin=http://www.ai-line.co.jp/aiticker/skin/468_30_gr.jpg&color=#333333,#666666,#990000,#000099,#666666&speed=1.0" quality="high" width="468" height="30" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" /></object><!-- ai-Ticker -->';
	}

