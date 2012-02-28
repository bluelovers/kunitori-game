
sub MOVE {

require "./w_db/mapall.pl";

	&TT_GET;

		$mapcome = "
<tr><td class=\"txth\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"submit\" value=\" ログイン画面 \" />
";
	if($in{'id'} ne ""){
	&P_OPEN;
		$mapcome = "
<tr><td class=\"txth\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"submit\" value=\" コマンド画面 \" />
";
	}else{
	}


		$w_tic_cb_ins{'all'} = "$URI/rss/map_all.xml";
		$w_tic_cb_ins{'all'} =~ s/\//%2F/g;
		$w_tic_cb_ins{'all'} =~ s/\:/%3A/g;

	$datev2 = "<script type=\"text/javascript\" src=\"$CSS_URI/tic_v.js\"></script>";
	&HEADER;
print <<"PRI";


<table width=\"60%\">
$mapcome
</div></form></td><td class=\"txth\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"map2\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"submit\" value=\"全体ログ\" />
</div></form></td><td class=\"txth\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"map3\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"submit\" value=\"史記・勢力図\" />
</div></form></td></tr>
</table>

<table width=\"100%\" border=\"3\">
<tr><td class=\"txth\" bgcolor=\"#D3D3D3\">全体ログ - <a href=\"./rss/map_all.xml\">RSS配信</a> - <a href=\"#\" onclick=\"javascript:cbcopyaitic('$w_tic_cb_ins{'all'}','全体ログ');\">自分のホームページに貼り付ける</a></td></tr>
<tr><td>$S_MES</td>
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