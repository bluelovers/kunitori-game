
function cbcopyaitic(cbins,cbtitle){
cbins = '<!-- ai-Ticker --><object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="468" height="30" align="middle"><param name="allowScriptAccess" value="sameDomain" /><param name="movie" value="http://www.ai-line.co.jp/aiticker/ai-ticker_468_30.swf" /><param name="quality" value="high" /><param name="FlashVars" value="rss=' + cbins + '&skin=http://www.ai-line.co.jp/aiticker/skin/468_30_gr.jpg&color=#333333,#666666,#990000,#000099,#666666&speed=1.0" /><embed src="http://www.ai-line.co.jp/aiticker/ai-ticker_468_30.swf" FlashVars="rss=' + cbins + '&skin=http://www.ai-line.co.jp/aiticker/skin/468_30_gr.jpg&color=#333333,#666666,#990000,#000099,#666666&speed=1.0" quality="high" width="468" height="30" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" /></object><!-- ai-Ticker -->';
window.clipboardData.setData("text",cbins);
alert("クリップボードに"+ cbtitle +"のニュース速報用HTMLタグをコピーしました");

}

function ckticw(ckticwtype){
ckticurl = new Array();
ckticurl[0] = document.ticcssurl.ticurl.value;
ckticurl[1] = 'http%3A%2F%2Fgame.kunitori.com%2Ftxt%2Fsaba_all.rdf';
ckticurl[2] = 'http%3A%2F%2Fblog.goo.ne.jp%2Fmmocc%2Findex.rdf';
ckticurl[9] = 'off';
ckticurl[11] = parent.location.href + 'rss%2Fmap_all.rdf';
ckticurl[12] = parent.location.href + 'rss%2Fsiki_all.rdf';
ckticurl[13] = parent.location.href + 'rss%2Fibento_all.rdf';
ckticurl[21] = 'http%3A%2F%2Fnews.goo.ne.jp%2Fnews%2Frss%2Ftopics%2Fchumoku%2Findex.rdf';
ckticurl[22] = 'http%3A%2F%2Fnews.goo.ne.jp%2Fnews%2Frss%2Ftopics%2Fshakai%2Findex.rdf';
ckticurl[23] = 'http%3A%2F%2Fnews.goo.ne.jp%2Fnews%2Frss%2Ftopics%2Fkokusai%2Findex.rdf';
ckticurl[24] = 'http%3A%2F%2Fnews.goo.ne.jp%2Frss%2Ftopics%2Fseiji%2Findex.rdf';
ckticurl[25] = 'http%3A%2F%2Fnews.goo.ne.jp%2Frss%2Ftopstories%2Fbusiness%2Findex.rdf';
ckticurl[26] = 'http%3A%2F%2Fnews.goo.ne.jp%2Fnews%2Frss%2Ftopics%2Fgeino%2Findex.rdf';
ckticurl[27] = 'http%3A%2F%2Fnews.goo.ne.jp%2Fnews%2Frss%2Ftopics%2Fsports%2Findex.rdf';
ckticurl[28] = 'http%3A%2F%2Fweather.goo.ne.jp%2Fearthquake%2Findex.rdf';
ckticurl[29] = 'http%3A%2F%2Fgame.goo.ne.jp%2Fnews%2Findex.rdf';
ckticurl[30] = 'http%3A%2F%2Fanime.goo.ne.jp%2Fnews%2Findex.rdf';

	yuukoukigen = 1000;
	tt = new Date();
	tt.setTime(tt.getTime()+(yuukoukigen * 1000 * 86400));
	ttw = tt.toGMTString();
	document.cookie = "TICURL" + "=" + ckticurl[ckticwtype] + ";expires=" + ttw;


}