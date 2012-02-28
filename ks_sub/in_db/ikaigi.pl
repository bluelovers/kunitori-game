sub MOVE {

	&P_OPEN;


require "./$mpg_r/sub_db/neko$KEITAI_T.pl";
&TAJYUU_HANTEI;
	&HEADER;

	open(IN,"./w_db/cmes/lt$p_kunino{$f_id}.cgi");
	@BBS_DATALT = <IN>;
	close(IN);
$bid0 = $in{'bbs_no'};
				if($bid0 < 1){
$bid0 = 0;
				}
	($bbsid0,$bbsno0,$bbstitle0) = split(/<>/,$BBS_DATALT[$bid0]);


	print <<"PRI";

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=\".m.\"><option value=\"$in{'m'}\">リロード</option><option value=\"i_cd\">コマンド</option><option value=\"i_s\">情報</option><option value=\"i_m\">手紙</option><option value=\"ikaigi\">門下省</option><option value="sirei">中書省</option><option value="ru-ru">尚書省</option><option value="ilog">過去ログ</option><option value="itemo">競売会場</option><option value="item">アイテム管理</option><option value="senpou">戦法設定</option><option value="gundan">軍団編成</option><option value="butai">部隊編成</option><option value="idkanri">LoginID管理</option><option value="come">コメント編集</option><option value="bcome">自己PR編集</option><option value="adcome">広告/OPT編集</option><option value="yakuba">国取役場</option><option value="tyuusei">忠誠度変更</option><option value="gazou">画像変更</option><option value="act_cd">アクティブC変更</option></select><input type=\"submit\" value=\"画面移動\" /><input type=\"hidden\" name=\".i.\" value=\"i\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /></div></form>
PRI



	$n = 0;
	foreach(@BBS_DATALT){
		($bbsid1,$bbsno1,$bbstitle1)=split(/<>/);
				if($n < 5){
	print " <form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=ikaigi>
<input type=\"hidden\" name=\".i.\" value=\"i\" />
<input type=\"hidden\" name=.bbs_no. value=$n>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"$bbstitle1($bbsno1)\">
</div></form>";
				}
			$n++;
	}

	open(IN,"./w_db/cmes/$p_kunino{$f_id}$bbsid0.cgi");
	@BBS_DATA = <IN>;
	close(IN);

	$bidl = @BBS_DATA - 1;
		($bbid3,$bbtitle3,$bbmes3,$bbcgimg3,$bbname3,$bbhost3,$bbtime3,$bbkuniiro3,$bbkuni3,$bbtype3,$bbno3,$bbthreadno3,$cgimgr2sabano,$bbsabaurl)=split(/<>/,@BBS_DATA[$bidl]);
$bbname3 =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
	print " - $bbtitle3($bbsno0) -<br /><hr />$bbmes3<br />$bbname3<hr />";


	print <<"PRI";
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<select name=.sage.>
<option value=sage>sage
<option value=age>age</select> <input type=text name=.ins. size=10>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=.b_no. value=$bbsid0>
<input type=\"hidden\" name=\".m.\" value=ikaigiw>
<input type=\"hidden\" name=\".i.\" value=\"i\" />
<input type=\"hidden\" name=\".m_add.\" value=\"ikaigi\" />
<input type=\"submit\" value=\"返信\" />
</div></form><hr />
PRI

	$s_n = 0;
	foreach(@BBS_DATA){
		($bbid,$bbtitle,$bbmes,$bbcgimg,$bbname,$bbhost,$bbtime,$bbkuniiro,$bbkuni,$bbtype,$bbno,$bbthreadno,$cgimgr2sabano,$bbsabaurl)=split(/<>/);
				if($s_n < 5 and $bbno > 0){
	print <<"PRI";
$bbmes<br />$bbname<hr />
PRI
				}
			$s_n++;
	}


print <<"PRI";

PRI

	&FOOTER;
	exit;
}
1;