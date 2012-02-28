
sub MOVE {
require "$mpg_r/men_db/en/$menck.pl";

$KOUSIN_NEXT[0] = 'ゲーム開始まで';
$KOUSIN_NEXT[1] = '次の月まで';
$KOUSIN_NEXT[2] = '次の月まで';
$KOUSIN_NEXT[3] = '次の月まで';
$KOUSIN_NEXT[4] = '次の月まで';
$KOUSIN_NEXT[5] = '次の月まで';
$KOUSIN_NEXT[6] = '次の月まで';
$KOUSIN_NEXT[7] = '次の月まで';
$KOUSIN_NEXT[8] = '次の月まで';
$KOUSIN_NEXT[9] = '次の月まで';
$KOUSIN_NEXT[999] = '繰越処理まで';
	&TT_GET;

	&GET_COOKIE;
${"eni_1"} = " checked=\"checked\"";
	&YOBIEN1;


	open(IN,"./seiryoku3.txt");
	$adtxt = <IN>;
	close(IN);

	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);

	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou) = split(/<>/,$JJM[0]);

	$nen_getu = sprintf("%02d\年%02d\月", ($KAISI_NEN + $keika_nen), $tuki_genzai);
	$nen_getu_f = "第$tenkakaisuu部 $outyou $nen_getu";
	$kousin_made_m = int(($m_tt - $tt) / 60);

	$kousin_made_m += 5;

#入口ランダムアイコン（変更してもかまいません）

#			$icon_en = int(rand($KYARA_IMG_MAX{"0"}))+1;
#	&IMG_SAKUSEI("$IMG{0}/$icon_en$p_img_kakutyou{0}","$img_wide","$img_height","$p_img_m{$f_id}","b$f_id");
#$img_sakusei_kekka\&nbsp;&nbsp;&nbsp;<br />
			
			$addc_kousin_f{"1"} = "";
			$addc_kousin_f{""} = "<iframe src=\"./?.m.=0ksi&amp;.i.=k\" name=\"0ksi\" id=\"0ksi\" width=\"1\" height=\"1\" frameborder=\"0\">更新発動フレーム</iframe>";
			$addc_kousin_f{"0"} = "<iframe src=\"./?.m.=0ksi&amp;.i.=k\" name=\"0ksi\" id=\"0ksi\" width=\"1\" height=\"1\" frameborder=\"0\">更新発動フレーム</iframe>";

$M_setumei[0] = '';
$M_setumei[1] = '<a href="./?.m.=map3" target="_top">《 勢力図 》</a>';
$M_setumei[2] = '<a href="./?.m.=rn0" target="_top">《 武将一覧 》</a>';
$M_setumei[3] = '<a href="./?.m.=ms0" target="_top">《 名将一覧 》</a>';
$M_setumei[4] = '<a href="./mapr/index.html" target="_top">《 歴史資料室 》</a>';
if(!$tuki_genzai) {
if($m_tt eq "11111") {
#	$sousuhyouji = "初期設定作業中（初期化作業が終わっていません）";
}else{
if($tenkakaisuu < 2) {
#	$sousuhyouji = "$tt_date2 ゲーム開始！ 新規登録受付中";
$M_setumei[0] = '';
$M_setumei[1] = '《 勢力図 》';
$M_setumei[2] = '《 武将一覧 》';
$M_setumei[3] = '《 名将一覧 》';
$M_setumei[4] = '《 歴史資料室 》';
	$adtxt = <<"PRI";
	<table border="1" width="445"><tr><td><br />ゲームへの参加の際に、メールアドレスや個人情報等は一切必要ありません。<br />左上の《 新規登録 》より、ゲーム内で動くキャラクターを新規登録できます。<br />勢力図、武将一覧などは、ゲーム開始後に、TOPページよりLinkされます。<br />ゲーム開始まで、今しばらくお待ちください。<br />.</td></tr></table>
PRI
	$nen_getu_f = "第$tenkakaisuu部 スタート前";
}else{
#	$sousuhyouji = "$tt_date2 第$tenkakaisuu部 新規スタート!";
$M_setumei[0] = '';
$M_setumei[1] = '<a href="./?.m.=map3" target="_top">《 勢力図 》</a>';
$M_setumei[2] = '<a href="./?.m.=rn0" target="_top">《 武将一覧 》</a>';
$M_setumei[3] = '《 名将一覧 》';
$M_setumei[4] = '<a href="./mapr/index.html" target="_top">《 歴史資料室 》</a>';
	$nen_getu_f = "第$tenkakaisuu部 スタート前";
}
}
}
	&HEADER;
	print <<"PRI";

<table width="90%"><tr><td width="210" class="valignt txtr">
</td><td width="480">
<span class="fs4"><span class="c9C5A4B">$GAME_TITLE$MEN_TITLE</span></span><br /><br />
<strong>$nen_getu_f</strong> 
($KOUSIN_NEXT[$kousinjyoutai] $kousin_made_m 分)<br /><br />$MEN_SIYOU	<br />
</td></tr>
</table>
        
<br /><a href="./?.m.=en0" target="_top">《 新規登録 》</a> 
<a href="../ksmanual.html" target="setumei">《 説明書 》</a>
$M_setumei[1]
$M_setumei[2]
$M_setumei[3]
$M_setumei[4]
<a href="./?.m.=touketu_k" target="_top">《 凍結解除 》</a>

<br />
<hr />
<div class="en_div">
<div class="en_block1">
<form action="$URI/" method="post" target="_top"><div>
<table class="bgc884422"><tr><td class="bgcF8F0E8" width="40">
&nbsp;ID&nbsp;</td><td width="120"><input type="text" size="15" maxlength="12" name=".id." /></td></tr>
<tr><td class="bgcF8F0E8">&nbsp;Pass&nbsp;</td><td><input type="password" size="8" maxlength="12" name=".pass." /><input id="ck" type="checkbox" name=".ckal." value="1" ${"eni_$ckal"} /><input type="hidden" name=".m." value="defo" /><input type="hidden" name=".ckalw." value="1" /></td></tr>
<tr class="bgcF8F0E0"><td class="txtc" colspan="2">
<select name=".i.">
<option value="">XHTML1.0</option>
<option value="b">X-Basic</option>
</select>
<input type="submit" value="ログイン" />
</td></tr></table></div></form>
</div>
<div class="en_block2">$adtxt
</div></div>
<div class="clear_b"></div>
<hr />		
<a href="http://nullpo.in/" target="_top">《 nullpo.in 》</a>\n	
<br /><br />
$en_hyouji

<hr />
$urll

$addc_kousin_f{$KOUSIN_AUTO}
</div></body>
</html>

PRI
	exit;


}



sub YOBIEN1 {
if($mday ne $cniti){
	$cniti = $mday;
	&SET_COOKIE;
}
}



1;
