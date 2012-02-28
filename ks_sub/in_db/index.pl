
sub MOVE {
	$urll = "./?.m.=enter_sample4";
	$urll{'0'} = "$URIFL/es4.html";
	$urll{'1'} = "./?.m.=en&amp;.log.=1";
	$urll{'0'} = "./?.m.=en&amp;.log.=1";
	$hostr = $ENV{'HTTP_REFERER'};
##############
if($hostr =~ /\Q$DOMAIN\E/ or $hostr =~ /\Q$URI_SP_D_T\E/) {
	$urll = "./?.m.=en&amp;.log.=1";
}else{
	$urll2 = "<hr />
<iframe src=\"http://bbs.kunitori.com/ktre/ac.shtml\" title=\"rank\" name=\"rns\" id=\"rns\" width=\"700\" height=\"300\" frameborder=\"0\">インラインフレームに対応していない方は下のリンクで新しい窓を開いてください。<br />
<a href=\"http://bbs.kunitori.com/ktre/ac.shtml\" target=\"rns\">$GAME_TITLE</a><br />オンライン戦国シミュレーションゲーム ・ 後漢王朝 歴史S-RPG ( 三国志ネットゲーム ) <br />$GAME_TITLE<br />携帯ゲーム MMORPG CGIゲーム 無料ゲーム 国取りゲーム<br />$GAME_TITLE<br />$URIFL/
</iframe>
";
	open(OUT,">./re.txt");
	print OUT $hostr;
	close(OUT);
}
	open(IN,"./sannka.txt");
	$sousu1 = <IN>;
	close(IN);
#use LWP::Simple;
#	$sousu1 = get("$URI/sannka.txt");
#	$sousu1 = int($sousu1);

	$datev2 = "<script type=\"text/javascript\" src=\"$CSS_URI/uric.js\"></script>";
	$datev4 = "kssend('$URI');";

	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);

	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou) = split(/<>/,$JJM[0]);

	$sousuhyouji = "参加人数($sousu1人)";
if(!$tuki_genzai) {
if($m_tt eq "11111") {
	$sousuhyouji = "初期設定作業中（初期化作業が終わっていません）";
}else{
	($sec,$min,$hour,$mday,$mon,$year,$wday,$yday) = localtime($m_tt);
	$mon++;
	$year += 1900;
	$ww = (Sun,Mon,Tue,Wed,Thu,Fri,Sat)[$wday];
	$tt_date2 = sprintf("（$year %02d\/%02d\ %02d\:%02d\ $ww）", $mon, $mday, $hour, $min);
if($tenkakaisuu < 2) {
	$sousuhyouji = "$tt_date2 ゲーム開始！ 新規登録受付中";
}else{
	$sousuhyouji = "$tt_date2 第$tenkakaisuu部 新規スタート!";
}
}
}
	
	&HEADER;
	print <<"PRI";

<iframe src=\"$urll{$SP_F}\" name=\"ens\" id=\"ens\" width=\"700\" height=\"400\" frameborder=\"0\">インラインフレームに対応していない方は下のリンクで新しい窓を開いてください。<br /><a href=\"./?.m.=en\" target=\"ens\">$GAME_TITLE</a><br />
オンライン戦国シミュレーションゲーム ・ 後漢王朝 歴史S-RPG ( 三国志ネットゲーム ) <br />$GAME_TITLE<br />携帯ゲーム MMORPG CGIゲーム 無料ゲーム 国取りゲーム<br />$GAME_TITLE<br />$URI/

</iframe> 
<br /><a href=\"./?.m.=en\" target=\"ens\">《 ENTER 》</a> $sousuhyouji	<a href=\"./?.m.=i\&amp;.i.=i\">《 携帯版 》</a>

<br />

<br />
PRI



	&FOOTER;
	exit;
}
1;
