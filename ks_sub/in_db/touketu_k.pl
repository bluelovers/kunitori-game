
sub MOVE {

	&HEADER;

&GET_COOKIE;

	if($in{'id'}){
###############
	$kasouhit = 0;
		if(-e "./p_db/id/$in{'id'}.cgi"){
	$kasoupass=n;
	$kasouid = $in{'id'};
	$kasouhit = 1;
	open(IN,"./p_db/id/$kasouid.cgi");
	@CM_DATA = <IN>;
	close(IN);
	($kasouid,$kasoupass,$f_id,$kasou1ip,$kasou1tt,$kasou2ip,$kasou2tt,$kasou3ip,$kasou3tt) = split(/<>/,$CM_DATA[0]);

	if($in{'pass'} ne $kasoupass){
	if(!$f_id){
	print <<"PRI";
<pre>
IDが確認できません。
</pre>
PRI
	&FOOTER;
	exit;
	}
	print <<"PRI";
<pre>
ID/パスが正しくありません。
</pre>
PRI
	&FOOTER;
	exit;
	}
		}else{ 
	$f_id = $in{'id'};
		}


###############
	if(-e "./p_db/p/$f_id.cgi"){
	print <<"PRI";
<pre>
貴方のIDは稼動している模様です。
</pre>
PRI
	}elsif(-e "./p_db/touketu/$f_id.cgi"){

	&P_READ("touketu","$f_id","$f_id");
		if($in{'pass'} ne $p_pass{$f_id} and !$kasouhit){
	print <<"PRI";
<pre>
ID/パスが正しくありません。
</pre>
PRI
		}else{
			
			
	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);

	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);

	&TT_GET;
	
    &F_LOCK;

unlink ("./p_db/p/$f_id.cgi");
rename ("./p_db/touketu/$f_id.cgi", "./p_db/p/$f_id.cgi");
	$p_jikan{$f_id} += int(($m_tt - $p_jikan{$f_id}) * 0.3);
			if($p_jikan{$f_id} < $m_tt - (360 * $kousin_kankaku)){
	$p_jikan{$f_id} = $m_tt - (360 * $kousin_kankaku);
			}

	&P_SAVE("p","$f_id","$f_id");
	($ktenkakaisuu,$kmyear) = split(/<>/,$p_db_view[1]);
			if($ktenkakaisuu ne $tenkakaisuu){
   		$touketucome = "途中で天下統一が発生していたため、データが半初期化されました。";
			}
	&MAP_LOG("《 ID凍結解除 》$p_name{$f_id}がゲームに復帰しました。");
	if($in{'i'} eq "i"){
	print <<"PRI";
<pre>
データ「$p_name{$f_id}」の復旧作業が完了しました。（モバイル版へログインできます）
$touketucome
</pre>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" />
<input type=\"hidden\" name=\".i.\" value=\"i\" />
ID<input type=\"text\" size=\"8\" name=\".id.\" value=\"\" /><br />
PASS<input type=\"password\" size=\"8\" name=\".pass.\" /><br />
<label for=\"ck\"><input id=\"ck\" type=\"checkbox\" name=\".ckal.\" value=\"1\" ${"eni_$ckal"} /> 自動ログイン</label><br />
<input type=\"hidden\" name=\".ckalw.\" value=\"1\" /><input type=\"submit\" value=\"ログイン\" /></div></form>
PRI
	}else{
	print <<"PRI";
<pre>
データ「$p_name{$f_id}」の復旧作業が完了しました。（PC版へログインできます）
$touketucome
</pre>
PRI
print "<form action=\"$COMMAND\" method=\"post\" target=\"_parent\" utn=\"utn\"><div><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"defo\" />
<input type=\"submit\" value=\"ゲーム開始\">
</div></form>";
	}
	
	&UNLOCK_FILE; 
	
		}
	}elsif($f_id and !-e "./p_db/touketu/$f_id.cgi"){
	print <<"PRI";
<pre>
貴方の入力したID「$in{'id'}」はゲーム上に存在していません。
</pre>
PRI
	}else{
	print <<"PRI";

<pre>
ここでは、長期間アクセスしなかったことにより放置削除された凍結IDを元通りに復元することが出来ます。
尚、途中で天下統一があった場合、各種能力値は他のプレイヤーと同じように初期値近くまで抑えられます。
予めご了\承ください。
</pre>
<form action=\"$COMMAND\" method=\"post\" target=\"_top\" utn=\"utn\"><div>
<table class=\"bgc884422\"><tr><td width=\"40\" class=\"bgcF8F0E8\">&nbsp;ID&nbsp;</td><td width=\"120\"><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"hidden\" name=\".m.\" value=\"touketu_k\"><input type=\"text\" size=\"15\" maxlength=\"12\" name=\".id.\" /></td></tr>
<tr><td class=\"bgcF8F0E8\">&nbsp;Pass&nbsp;</td><td><input type=\"password\" size=\"8\" maxlength=\"8\" name=\".pass.\" /></td></tr>
<tr><td class=\"bgcF8F0E0\" class=\"txtc\" colspan=\"2\"><input type="submit" value="凍結解除"></td></tr></table></div></form>

PRI
	}

	}elsif(-e "./p_db/p/$ckid.cgi"){
	print <<"PRI";
<pre>
貴方のデフォルトID「$ckid」は稼動中です。
</pre>
PRI
	}else{
	print <<"PRI";

<pre>
ここでは、長期間アクセスしなかったことにより放置削除された凍結IDを元通りに復元することが出来ます。
尚、途中で天下統一があった場合、各種能力値は他のプレイヤーと同じように初期値近くまで抑えられます。
予めご了\承ください。
</pre>
<form action=\"$COMMAND\" method=\"post\" target=\"_top\" utn=\"utn\"><div>
<table class=\"bgc884422\"><tr><td width=\"40\" class=\"bgcF8F0E8\">&nbsp;ID&nbsp;</td><td width=\"120\"><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"hidden\" name=\".m.\" value=touketu_k><input type=\"text\" size=\"15\" maxlength=\"12\" name=\".id.\" /></td></tr>
<tr><td class=\"bgcF8F0E8\">&nbsp;Pass&nbsp;</td><td><input type=\"password\" size=\"8\" maxlength=\"8\" name=\".pass.\" /></td></tr>
<tr><td class=\"bgcF8F0E0\" class=\"txtc\" colspan=\"2\"><input type="submit" value="凍結解除"></td></tr></table></div></form>

PRI
	}
###############
	&FOOTER;
	exit;
}

1;