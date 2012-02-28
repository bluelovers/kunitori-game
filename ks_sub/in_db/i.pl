
sub MOVE {
	open(READ,"./w_db/jikan_jiku_main.cgi");
	@JJM = <READ>;
	close(READ);

	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou) = split(/<>/,$JJM[0]);

	open(READ,"./w_db/map_log2.cgi");
	@M_LOG_L = <READ>;
	close(READ);
	$i=0;
	while($i<3){
	($come_add) = split(/<>/,$M_LOG_L[$i]);
$come_add =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$M_LOG_MES .= "$come_add<br />";$i++;
	}
	&GET_COOKIE;
${"eni_1"} = " checked=\"checked\"";

	$nen_getu = sprintf("%02d\年%02d\月", $KAISI_NEN + $keika_nen, $tuki_genzai);
	$nen_getu_f = "第$tenkakaisuu部 $outyou $nen_getu";
	$kousin_made_m = int(($m_tt - $tt) / 60);
#	$kousin_made_m = int(($tt % 86400)/60);

	$kousin_made_m += 5;

	&HEADER;
	print <<"PRI";
$GAME_TITLE$MEN_TITLE<br />
$nen_getu_f<br />
次の月まで $kousin_made_m 分<br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" />
<input type=\"hidden\" name=\".i.\" value=\"i\" />
ID<input type=\"text\" size=\"8\" name=\".id.\" value=\"\" /><br />
PASS<input type=\"password\" size=\"8\" name=\".pass.\" /><br />
<label for=\"ck\"><input id=\"ck\" type=\"checkbox\" name=\".ckal.\" value=\"1\" ${"eni_$ckal"} /> 自動ログイン</label><br />
<input type=\"hidden\" name=\".ckalw.\" value=\"1\" /><input type=\"submit\" value=\"ログイン\" /></div></form>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"i_entry\" />
<input type=\"hidden\" name=\".i.\" value=\"i\" /><input type=\"submit\" value=\"携帯版新規登録\" /></div></form>

史記<br />
$M_LOG_MES
<hr />

<a href=\"$URI/?.m.=setumei\&amp;.i.=i\" target=\"_blank\"><span class=\"cFF0000\">携帯版説明書</span></a>
<hr />

<a href=\"$URI/?.m.=touketu_k\&amp;.i.=i\" target=\"_blank\"><span class=\"cFF0000\">ID凍結解除</span></a>

<hr />
<a href=\"./\">PC版入口へ</a>
<hr />
※自動ログインとブックマークURLは個人用携帯専用です。ボタン一つでログインできる為、共用端末から使用しないようお願いします。自動ログインはクッキー対応端末のみ使用できます。
PRI

	&FOOTER;
	exit;

}


1;

