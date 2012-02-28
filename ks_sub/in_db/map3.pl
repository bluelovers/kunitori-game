
sub MOVE {

	open(READ,"./w_db/jikan_jiku_main.cgi");
	@JJM = <READ>;
	close(READ);

	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou) = split(/<>/,$JJM[0]);

require "./w_db/map2all.pl";
require "./w_db/map3all.pl";

	&TT_GET;
		$mapcome = "
<tr><td class=\"txth\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"submit\" value=\" ログイン画面 \" />
";
	if($in{'id'} ne ""){
	&P_OPEN;
		$mapcome = "
<tr><td class=\"txth\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"submit\" value=\" コマンド画面 \" />
";
	}
		$mapcome2 = "./mapr/tuki/map2.html";
	if($tuki_genzai < 1){
		$mapcome2 = "./w_db/map.html";
	}

		$w_tic_cb_ins{'siki'} = "$URI/rss/siki_all.xml";
		$w_tic_cb_ins{'siki'} =~ s/\//%2F/g;
		$w_tic_cb_ins{'siki'} =~ s/\:/%3A/g;

		$w_tic_cb_ins{'ibento'} = "$URI/rss/ibento_all.xml";
		$w_tic_cb_ins{'ibento'} =~ s/\//%2F/g;
		$w_tic_cb_ins{'ibento'} =~ s/\:/%3A/g;
	$datev2 = "<script type=\"text/javascript\" src=\"$CSS_URI/tic_v.js\"></script>";
	&HEADER;
print <<"PRI";

<table width=\"60%\">
$mapcome
</div></form></td><td class=\"txth\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"map2\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\"><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\"><input type=\"submit\" value=\"全体ログ\" />
</div></form></td><td class=\"txth\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"map3\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\"><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\"><input type=\"submit\" value=\"史記・勢力図\" />
</div></form></td></tr>
</table>

<table width=\"100%\" border=\"1\">
<tr class=\"bgcD3D3D3\"><td class=\"txth\">&nbsp;史記&nbsp; - <a href=\"./rss/siki_all.xml\">RSS配信</a> - <a href=\"#\" onclick=\"javascript:cbcopyaitic('$w_tic_cb_ins{'siki'}','史記');\">自分のホームページに貼り付ける</a></td></tr>
<tr><td>$D_MES</td></tr>
<tr class=\"bgcD3D3D3\"><td class=\"txth\">イベント - <a href=\"./rss/ibento_all.xml\">RSS配信</a> - <a href=\"#\" onclick=\"javascript:cbcopyaitic('$w_tic_cb_ins{'ibento'}','イベント');\">自分のホームページに貼り付ける</a></td></tr>
<tr><td>$I_MES</td></tr>

<tr class=\"bgcD3D3D3\"><td class=\"txth\">勢力図</td></tr>
<tr><td class=\"bgc884422\">
<object data=\"$mapcome2\" type=\"text/html\" width=\"100%\" height=\"820\" name=\"seiryoku\" id=\"seiryokuzu\">オブジェクトタグに対応していない方は下のリンクで新しい窓を開いてください。<br /><a href=\"./mapr/tuki/map2.html\" target=\"_blank\">勢力図</a></object>
</td>
</tr>

</table>

<br />
$tt_date

<br />
PRI
	&FOOTER;
	exit;

}

1;