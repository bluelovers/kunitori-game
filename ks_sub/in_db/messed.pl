
sub MOVE {


	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

	open(IN,"./w_db/guest/msdk_$f_id.cgi") or $mdsid=0;$mdsname=0;;
	@add_list = <IN>;
	close(IN);

	open(IN,"./w_db/guest/msdk_$p_kunino{$f_id}.cgi") or $mdsid2=0;$mdsname2=0;;
	@add_list2 = <IN>;
	close(IN);

	&HEADER;
	&IMG_SAKUSEI("$IMG{0}/bbs0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");

	print <<"PRI";

<table border=\"0\" width=\"600\"><tr><td><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"messe\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".sv.\" value=\"$in{'sv'}\" />
<input type=\"hidden\" name=\".mkj.\" value=\"$in{'mkj'}\" /><input type=\"submit\" value=\"手紙閲覧へ戻る\" /></div></form></td>
</tr></table><hr />

<table class=\"bgc414141\" width=\"600\"><tr><td class=\"bgcFFFFFF\" width=\"100\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"490\">
<span class=\"cFFFFFF\">
《 メッセージ/受信拒否設定 》<br /><br />
ゲーム内で嫌な相手に絡まれてしまった場合、この設定を試してみてください。<br />
拒否するのと同じ操作方法で拒否を解除することも出来ます。</span>
</td></tr></table>

<table width=\"600\"><tr><td><pre>
※ここで拒否設定をすると、指定した相手から個宛手紙が送られて来なくなります。
※外交権限を持つ幹部は国宛外交文の受信拒否設定をすることも可\能です。
※個宛手紙の場合、受信拒否したことは相手側には伝わりません。（一方的な無視状態になります）
※既に受信済みの手紙に対しては効果を発揮しません。

ゲーム内で嫌な相手に絡まれてしまった場合、この設定を試してみてください。
拒否するのと同じ操作方法で拒否を解除することも出来ます。</pre>
</td></tr>
<tr><td><form action=\"$COMMAND\" target=\"$in{'sv'}\" method=\"post\" utn=\"utn\"><div>
【武将名で絞り込む】
<input type=\"hidden\" name=\".m.\" value=\"tegami\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".sv.\" value=\"$in{'sv'}\" />
<input type=\"hidden\" name=\".mkj.\" value=\"$in{'mkj'}\" />
<input type=\"submit\" value=\"個人宛手紙・武将検索\" />
</div></form></td></tr>
<tr><td><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
【国を名前で絞り込む】
<input type=\"hidden\" name=\".m.\" value=\"messed\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"text\" name=\".mkj.\" size=\"20\" value=\"$in{'mkj'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".kai.\" value=\"1\" />
<input type=\"hidden\" name=\".sv.\" value=\"$in{'sv'}\" />
<input type=\"submit\" value=\"この条件で探す or リロード\" />
</div></form></td></tr>
</table>
<table border=\"0\" width=\"600\"><tr><td width=\"200\" class=\"txtr\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"kousinmd\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".sv.\" value=\"$in{'sv'}\" />
<input type=\"hidden\" name=\".mkj.\" value=\"$in{'mkj'}\" />
<select name=\".mes_id2.\" size=\"10\">
PRI

	&IMG_SAKUSEI("$IMG{0}/m_4$p_img_kakutyou{0}","32","32","$p_img_mime{0}","b$f_id");
			print "<option value=\"$f_id\">＝＝拒否済み＝＝</option>\n";
	$hit=0;$i=1;
	foreach(@add_list){
		($mdsid,$mdsname) = split(/<>/);
			if( 50 == $i ) { last; }
			print "<option value=\"$mdsid\">$mdsnameさん\n";
			$com.="<tr><td width=\"32\">$img_sakusei_kekka</td><td class=\"bgcFFF8F0\"><span size=\"3\" color=#aa0000><strong>現在、$mdsnameさんを拒絶しています。</strong></span></td></tr>";
			$hit=1;$i++;
	}
			print "<option value=\"$f_id\">＝＝国交断絶＝＝</option>\n";
	$hit=0;$i=1;
	foreach(@add_list2){
		($mdsid,$mdsname) = split(/<>/);
			if( 10 == $i ) { last; }
			print "<option value=\"$mdsid\">$mdsnameさん</option>\n";
			$com.="<tr><td width=\"32\">$img_sakusei_kekka</td><td class=\"bgcFFF8F0\"><span size=\"3\" color=#aa0000><strong>現在、$mdsnameを拒絶しています。</strong></span></td></tr>";
			$hit=1;$i++;
	}
	print <<"PRI";
<option value=\"\">＝＝相手を選択＝＝</option>
PRI

	open(IN,"./w_db/jyusin/$f_id.cgi");
	@MES_REG = <IN>;
	close(IN);
	$add_no = "j0";
	$w_mes_i = 0;
		while($w_mes_i < $#MES_REG +1){
			($messe_e_id,$messe_f_id,$messe_f_taizai_iti,$messe_f_name,$messe_naiyou,$messe_e_name,$messe_f_cg_sabano,$messe_f_cg_d,$messe_f_kuni,$messe_f) = split(/<>/,$MES_REG[$w_mes_i]);
			$koate_l{$messe_f_id} = $messe_f_name;
	$add_no ++;
	$w_mes_i ++;
		}


delete $koate_l{'m_sakujyo'}; 
foreach $key ( keys %koate_l ) {
	 print "<option value=\"$key\">$koate_l{$key}さん</option>\n";
}
		 if($in{'kai'} ne "" and $in{'mkj'} ne "") {

$add_gaiko_f{$k_yakusyoku_id{$fk_id}[24]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[1]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[2]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[3]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[4]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[5]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[6]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[16]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[17]}=1;
$add_gaiko_f{$k_yakusyoku_id{$fk_id}[18]}=1;
	      if($add_gaiko_f{$f_id}){


$m = 0;
	foreach(@k_seizon_l){
		$ek_id=$_;
       
		if($m >= 20) { next; }
		if($p_kunino{$f_id} eq $k_kunino{$ek_id}) { next; }
		 if($in{'mkj'} ne "") {
if( $in{'mkj'} and $k_name{$ek_id}=~ /\Q$in{'mkj'}\E/ ) { print "<option value=\"$k_kunino[$ek_id]\">$k_name[$ek_id]からの国宛外交文</option>\n"; $m++;}
else{ next; }
         }else{ print "<option value=\"$k_kunino[$ek_id]\">$k_name[$ek_id]からの国宛外交文</option>\n"; $m++;}

		}
	}

         }else{

	open(IN,"./w_db/jyusin/$f_id.cgi");
	@MES_REG1 = <IN>;
	close(IN);
		foreach(@MES_REG1){
			($messe_e_id,$messe_f_id,$messe_f_taizai_iti,$messe_f_name,$messe_naiyou,$messe_e_name,$messe_f_cg_sabano,$messe_f_cg_d,$messe_f_kuni,$messe_f) = split(/<>/);
			print "<option value=\"$messe_f_id\">$messe_f_nameさん</option>\n";

		}
	if($k_yakusyoku_id{$fk_id}[24] eq $f_id or $k_yakusyoku_id{$fk_id}[1] eq $f_id or $k_yakusyoku_id{$fk_id}[2] eq $f_id or $k_yakusyoku_id{$fk_id}[3] eq $f_id or $k_yakusyoku_id{$fk_id}[4] eq $f_id or $k_yakusyoku_id{$fk_id}[5] eq $f_id or $k_yakusyoku_id{$fk_id}[6] eq $f_id or $k_yakusyoku_id{$fk_id}[16] eq $f_id or $k_yakusyoku_id{$fk_id}[17] eq $f_id or $k_yakusyoku_id{$fk_id}[18] eq $f_id){


$m = 0;
	foreach(@k_seizon_l){
		$ek_id=$_;
 print "<option value=\"$k_kunino[$ek_id]\">$k_name[$ek_id]からの国宛外交文</option>\n"; $m++;

		}
	}

         }

	print <<"PRI";
</select>
</td><td>　 　
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"受信拒否/拒否解除/設定をする\" /></div></form>
</td></tr></table>
<hr />【受信拒否済み】表示数<strong>50</strong>件まで<br />


<table width=\"100%\" class=\"0000FF\">$com</table>
PRI

	if(!$hit){ print "<hr />$p_name{$f_id}さんの自宅では、拒否設定は行われていません。<br />\n"; }

	&FOOTER;

	exit;

}

1;