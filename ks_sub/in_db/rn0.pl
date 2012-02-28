
sub MOVE {
		if(-e "./w_db/allc_kuni_db.pl"){
require "./w_db/all_kuni_db.pl";

		}else{ 
require "./w_db/all2_kuni_db.pl";
		}

	foreach(@k_seizon_l){
		$fk_id=$_;
					$listcc .= "<a href=\"./b_itiran.html#$k_kunino[$fk_id]\" target=\"_en\">・$k_name[$fk_id]</a><br />";
	}
#$doc_mode = "x";
	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);

	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou) = split(/<>/,$JJM[0]);

	$sousuhyouji = "";
	$sousuhyouji2no = "";
if(!$tuki_genzai) {
	$sousuhyouji2no = "#1";
if($m_tt eq "11111") {
	$sousuhyouji = "初期設定作業中（初期化作業が終わっていません）<br /><br />";
}else{
	($sec,$min,$hour,$mday,$mon,$year,$wday,$yday) = localtime($m_tt);
	$mon++;
	$year += 1900;
	$ww = (Sun,Mon,Tue,Wed,Thu,Fri,Sat)[$wday];
	$tt_date2 = sprintf("（$year %02d\/%02d\ %02d\:%02d\ $ww）", $mon, $mday, $hour, $min);
if($tenkakaisuu) {
	$sousuhyouji = "$tt_date2 ゲーム開始！ 新規登録受付中<br /><br />注：ゲームが開始されるまで、新規登録者情報はすぐにこのページに反映されません<br />リアルタイム表示ではないため、現時点ではまだ表示されていない参加者がいる可能性があります<br /><br />";
}else{
	$sousuhyouji = "$tt_date2 第$tenkakaisuu部 新規スタート!<br /><br />注：第$tenkakaisuu部の更新が開始されるまで、新規登録者情報はすぐにこのページに反映されません<br />リアルタイム表示ではないため、現時点ではまだ表示されていない参加者がいる可能性があります<br /><br />";
}
}
}
	&HEADER;
	print <<"PRI";

<table width=\"780\"><tr><td class=\"valignt\" width=\"650\">$sousuhyouji
<iframe title=\"\" src=\"./b_itiran.html$sousuhyouji2no\" name=\"_en\" width=\"640\" height=\"500\" frameborder=\"0\">
インラインフレームに対応していない方は下のリンクで新しい窓を開いてください。<br /><a href=\"./b_itiran.html$sousuhyouji2no\" target=\"_en\">入り口</a>
</iframe> </td><td class=\"valignt\" width=\"135\">
<form action=\"./\" method=\"post\" utn=\"utn\"><div>《  登録武将一覧  》<br />
<input type=\"submit\" value=ログイン画面へ></div></form>
<a href=\"./b_itiran.html#t\" target=\"_en\">更新日時</a>
<br /><br />
$listcc
<br /><a href=\"./b_itiran.html#m\" target=\"_en\">・放浪者</a>
<br /><a href=\"./b_itiran.html#f\" target=\"_en\">・凍結武将</a>
<br /><a href=\"./b_itiran.html#r\" target=\"_en\">・各国の歴史</a>

</td></tr>
</table>

</div></body>
</html>
PRI
	exit;
}
1;