
sub E_ERR {

	&HEADER;
	print "<hr /><span class=\"fs4\">ヽ(｀Д´)ノ</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>$_[0]</strong></span>\n";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\">
<input type=\"hidden\" name=.toi. value=$in{'toi'}><input type=\"hidden\" name=.toi2. value=$in{'toi2'}>
<input type=\"hidden\" name=.toi3. value=$in{'toi3'}><input type=\"hidden\" name=.toi4. value=$in{'toi4'}>
<input type=\"hidden\" name=.toi5. value=$in{'toi5'}>
<input type=\"hidden\" name=.tyekku. value=$in{'tyekku'}>
<input type=\"hidden\" name=\".m.\" value=i_entry1>
<input type=\"hidden\" name=.i. value=$in{'i'}>
<input type=\"hidden\" name=.toi6. value=$in{'toi6'}><input type=\"hidden\" name=.zokumei. value=$in{'zokumei'}>
<input type=\"hidden\" name=.ele. value=$in{'ele'}><input type=\"hidden\" name=.kokumei. value=$in{'kokumei'}><input type=\"hidden\" name=.min. value=$in{'min'}><input type=\"hidden\" name=.icon. value=$in{'icon'}><input type=\"hidden\" name=.str. value=$in{'str'}><input type=\"hidden\" name=.int. value=$in{'int'}><input type=\"hidden\" name=.tou. value=$in{'tou'}><input type=\"hidden\" name=.k_no. value=$in{'k_no'}><input type=\"hidden\" name=.doui. value=$in{'doui'}>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=.keyw. value=$in{'keyw'}><input type=\"hidden\" name=.url. value=$in{'url'}><input type=\"hidden\" name=.chara_name. value=$in{'chara_name'}><input type=\"hidden\" name=.mes. value=$in{'mes'}><input type=\"submit\" value=\"入力に戻る\"></form>";
	print "<br /><br /><hr />\n</div></body></html>\n";
	exit;
}

sub MOVE {
	$in{'icon'} = abs(int($in{'icon'}));
	$in{'icon_saba'} = abs(int($in{'icon_saba'}));

foreach $key ( keys %IMG ) {
$key=int($key);
$add_img[$key]=$key;
}
	if($in{'icon_saba'}>$#add_img){&E_ERR("画像鯖が正しく入力されていません。");}
	if($in{'icon'} > $KYARA_IMG_MAX{$in{'icon_saba'}}) { &ER1("0～$KYARA_IMG_MAX{$in{'icon_saba'}}の間で入力してください。"); }


		if(-e "./w_db/allc_kuni_db.pl"){
require "./w_db/all_kuni_db.pl";

		}else{ 
require "./w_db/all2_kuni_db.pl";
		}

require "./$mpg_r/sub_db/minzoku.pl";
require "./$mpg_r/sub_db/tw.pl";

$in{'icon'} = int($in{'icon'});

${"iid$in{'icon'}"} = " selected=\"selected\"";
${"twid$in{'k_no'}"} = " selected=\"selected\"";
${"cwid$in{'k_no'}"} = " checked=\"checked\"";
${"m1t$in{'min'}"} = " checked=\"checked\"";
${"s1t$in{'toi'}"} = " checked=\"checked\"";
${"s2t$in{'toi2'}"} = " checked=\"checked\"";
${"s3t$in{'toi3'}"} = " checked=\"checked\"";
${"s4t$in{'toi4'}"} = " checked=\"checked\"";
${"s5t$in{'toi5'}"} = " checked=\"checked\"";
${"s6t$in{'toi6'}"} = " checked=\"checked\"";

${"sdt$in{'doui'}"} = " checked=\"checked\"";

$in{'str'} = int($in{'str'});
$in{'int'} = int($in{'int'});
$in{'tou'} = int($in{'tou'});
	&E_MAX;

&GET_COOKIE;
###############
	if(-e "./p_db/p/$ckid.cgi" and -e "./p_db/tt/$ckid.cgi" and $in{'tyekku'} ne "999"){
	&HEADER;
	open(IN,"./p_db/tt/$ckid.cgi");
	@CN_DATATM = <IN>;
	close(IN);
	($apontm,$apontmk) = split(/<>/,$CN_DATATM[0]);

	$f_id=$ckid;
	&P_READ("p","$f_id","$f_id");
		if($apontm eq $cktime){
			if(!$in{'tyekku'}){
	print <<"PRI";
<pre>
$p_name{$f_id}の侍女

あの・・ご主人様。僭越ながら申し上げます。既存のキャラはどうするのでしょうか？
まさか・・お家取り潰しですか？
</pre>
PRI
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"i_entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"1\" />
<input type=\"hidden\" name=.i. value=$in{'i'}>
<input type=\"submit\" value=\"はい\"></div></form>";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"i_entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"2\" />
<input type=\"hidden\" name=.i. value=$in{'i'}>
<input type=\"submit\" value=\"いいえ\"></div></form>";
			}elsif($in{'tyekku'} eq "1"){
	print <<"PRI";
<pre>
$p_name{$f_id}の侍女

そうですか・・また何処かでご縁がありましたら・・その時はよろしくお願い致します・・。
</pre>
PRI
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"i_entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"221\" />
<input type=\"hidden\" name=.i. value=$in{'i'}>
<input type=\"submit\" value=\"はい\" /></div></form>";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"i_entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"222\" />
<input type=\"hidden\" name=.i. value=$in{'i'}>
<input type=\"submit\" value=\"冗談だよ\" /></div></form>";
			}elsif($in{'tyekku'} eq "2"){
	print <<"PRI";
<pre>
$p_name{$f_id}の侍女

それでは、何故新規登録画面に？
</pre>
PRI
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"i_entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"21\" />
<input type=\"hidden\" name=.i. value=$in{'i'}>
<input type=\"submit\" value=\"様子見\" /></div></form>";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"i_entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"22\" />
<input type=\"hidden\" name=.i. value=$in{'i'}>
<input type=\"submit\" value=\"キャラを作り直すため\" /></div></form>";
			}elsif($in{'tyekku'} eq "21"){
	print <<"PRI";
<pre>
$p_name{$f_id}の侍女

では、新規登録画面へ移行致します。このままでは登録作業は出来ませんので予めご了\承ください。
</pre>
PRI
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"i_entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"999\" />
<input type=\"hidden\" name=.i. value=$in{'i'}>
<input type=\"submit\" value=\"OK\" /></div></form>";
			}elsif($in{'tyekku'} eq "22"){
	print <<"PRI";
<pre>
$p_name{$f_id}の侍女

そうですか・・残念です。それでは以前のデータを削除し新規登録画面に移行致します。
</pre>
PRI
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"i_entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"221\" />
<input type=\"hidden\" name=.i. value=$in{'i'}>
<input type=\"submit\" value=\"はい\" /></div></form>";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"i_entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"222\" />
<input type=\"hidden\" name=.i. value=$in{'i'}>
<input type=\"submit\" value=\"冗談だよ\" /></div></form>";
			}elsif($in{'tyekku'} eq "221"){
	print <<"PRI";
<pre>
$p_name{$f_id}の侍女

では、お手数になりますが、説明書に記載されているID凍結申請を行ってくださいませ。
</pre>
PRI
			}elsif($in{'tyekku'} eq "222"){
	print <<"PRI";
<pre>
$p_name{$f_id}の侍女

・・っほ。よかった。それではまたお傍で御仕え出来るのですね？
</pre>
PRI
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"i_entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"2221\" />
<input type=\"hidden\" name=.i. value=$in{'i'}>
<input type=\"submit\" value=\"はい\" /></div></form>";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"i_entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"2222\" />
<input type=\"hidden\" name=.i. value=$in{'i'}>
<input type=\"submit\" value=\"本当はキャラを削除しようと思っている\" /></div></form>";
			}elsif($in{'tyekku'} eq "2221"){
	print <<"PRI";
<pre>
$p_name{$f_id}の侍女

それでは、これからもよろしくお願い致します。ご主人様。
</pre>
PRI
			}elsif($in{'tyekku'} eq "2222"){
	print <<"PRI";
<pre>
$p_name{$f_id}の侍女

・・では、やはりキャラの削除を？　・・本当にここでお別れなんですね。
</pre>
PRI
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"i_entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"22221\" />
<input type=\"hidden\" name=.i. value=$in{'i'}>
<input type=\"submit\" value=\"はい\" /></div></form>";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"i_entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"22222\" />
<input type=\"hidden\" name=.i. value=$in{'i'}>
<input type=\"submit\" value=\"冗談だよ\" /></div></form>";
			}elsif($in{'tyekku'} eq "22221"){
	print <<"PRI";
<pre>
$p_name{$f_id}の侍女

では、名残惜しいですが・・お元気で。
お手数になりますが、説明書に記載されているID凍結申請を行って下さると助かります。
</pre>
PRI
			}elsif($in{'tyekku'} eq "22222"){
	print <<"PRI";
<pre>
$p_name{$f_id}の侍女

・・ごめんなさい。私、もう限界です。実家に帰らせていただきます。。
</pre>
PRI
			}
		}
###############
	}elsif(-e "./p_db/touketu/$ckid.cgi" and -e "./p_db/tt/$ckid.cgi" and $in{'tyekku'} ne "999"){
	&HEADER;
	open(IN,"./p_db/tt/$ckid.cgi");
	@CN_DATATM = <IN>;
	close(IN);
	($apontm,$apontmk) = split(/<>/,$CN_DATATM[0]);

$f_id = $ckid;
	&P_READ("touketu","$f_id","$f_id");
		if($apontm eq $cktime){
			if(!$in{'tyekku'}){
	print <<"PRI";
<pre>
$p_name{$f_id}の侍女

お待ちしておりました、ご主人様。
以前のデータ「$p_name{$f_id}」でゲームを再開されますか？
</pre>
PRI
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"i_entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"1\" />
<input type=\"hidden\" name=.i. value=$in{'i'}>
<input type=\"submit\" value=\"はい\" /></div></form>";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"i_entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"2\" />
<input type=\"hidden\" name=.i. value=$in{'i'}>
<input type=\"submit\" value=\"いいえ\" /></div></form>";
			}elsif($in{'tyekku'} eq "1"){
	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);

	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);

	&TT_GET;

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
	print <<"PRI";
<pre>
$p_name{$f_id}の侍女

復帰作業が完了\しました。それではごゆるりと御くつろぎ下さい。
$touketucome
</pre>
PRI
			}elsif($in{'tyekku'} eq "2"){
	print <<"PRI";
<pre>
$p_name{$f_id}の侍女

そうですか・・残念です。それでは以前のデータを削除し新規登録画面に移行致します。
</pre>
PRI
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"i_entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"21\" />
<input type=\"hidden\" name=.i. value=$in{'i'}>
<input type=\"submit\" value=\"はい\" /></div></form>";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"i_entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"22\" />
<input type=\"hidden\" name=.i. value=$in{'i'}>
<input type=\"submit\" value=\"ちょ・・ちょっとまって１１！\" /></div></form>";
			}elsif($in{'tyekku'} eq "21"){
							unlink("./p_db/touketu/$f_id.cgi");
							unlink("./p_db/my_log/$f_id.cgi");
							unlink("./p_db/cd/$f_id.cgi");
							unlink("./p_db/co/$f_id.cgi");
							unlink("./pr/b/$f_id.cgi");
							unlink("./pr/blog/$f_id.cgi");
			unlink("./p_db/tt/$f_id.cgi");

unlink ("./p_db/bl/$f_id.cgi");
rename ("./p_db/touketu/$f_id.cgi", "./p_db/bl/$f_id.cgi");
unlink ("./p_db/touketu/$f_id.cgi");
	&BL_SAVE("bl","$f_id","$f_id");
	$ckid = "";
	$ckhost = "";
	$cktime = "";
&SET_COOKIE;
	print <<"PRI";
<pre>
$p_name{$f_id}の侍女

データの削除を完了しました。
また何処かでご縁がありましたら・・その時はよろしくお願い致します。お元気で・・。
</pre>
PRI
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"i_entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"999\" />
<input type=\"hidden\" name=.i. value=$in{'i'}>
<input type=\"submit\" value=\"新規登録画面へ\" /></div></form>";
			}elsif($in{'tyekku'} eq "22"){
	print <<"PRI";
<pre>
$p_name{$f_id}の侍女

それでは、以前のデータ「$p_name{$f_id}」でゲームを再開されるのですか？
</pre>
PRI
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"i_entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"1\" />
<input type=\"hidden\" name=.i. value=$in{'i'}>
<input type=\"submit\" value=\"はい\" /></div></form>";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"i_entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"222\" />
<input type=\"hidden\" name=.i. value=$in{'i'}>
<input type=\"submit\" value=\"いいえ\" /></div></form>";
			}elsif($in{'tyekku'} eq "222"){
	print <<"PRI";
<pre>
$p_name{$f_id}の侍女

私、優柔不断なご主人様は嫌いです！
</pre>
PRI
			}
		}
###############
	}else{
	open(IN,"./w_db/kanyuu_bun.cgi");
	@MES_DATA = <IN>;
	close(IN);

	$mess = "";
	$mess .= "<tr class=\"bgcFFFFFF\"><td class=\"txth\" width=\"105\">国名</td><td class=\"txth\" width=\"105\">天子</td><td class=\"txth\" width=\"30\">国威</td><td class=\"txth\" width=55>主民族</td><td class=\"txth\" width=\"290\">勧誘文</td></tr>";

	$messz = "";
	$messz .= "<tr class=\"bgcFFFFFF\"><td class=\"txth\" width=\"105\">賊名</td><td class=\"txth\" width=\"105\">天子</td><td class=\"txth\" width=\"30\">国威</td><td class=\"txth\" width=55>主民族</td><td class=\"txth\" width=\"290\">勧誘文</td></tr>";

$ctcome[0] = "国";
$ctcome[1] = "賊";
$ctcome2[0] = "";
$ctcome2[1] = "の賊砦";
	foreach(@MES_DATA){
		($cmes,$cd_id)=split(/<>/);
		$cou_cmes[$cd_id] = "$cmes";

	}
	foreach(@k_seizon_l){
		$fk_id=$_;

		if(!$k_id{$fk_id}){
	&K_READ("kuni_db","$fk_id","$fk_id");
		}

$cwidw = "cwidc$k_kunino{$fk_id}";
$cwidw2 = "c$k_kunino{$fk_id}";
		if($k_kokka_keitai{$fk_id}){
		$messz .= "<tr><td class=\"kbgcc$k_iro_d{$fk_id}\"><a href=\"./?.i.=i&amp;.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"c404000\">$k_name{$fk_id}</span></a></td><td class=\"kbgcc$k_iro_d{$fk_id}\">$k_tensi_name{$fk_id}</td><td class=\"kbgcc$k_iro_d{$fk_id}\">$k_kokui{$fk_id}</td><td class=\"kbgcc$k_iro_d{$fk_id}\">$MINZOKUSAN[$k_syuminzoku{$fk_id}]</td><td class=\"kbgcc$k_iro_d{$fk_id}\">$cou_cmes[$k_kunino{$fk_id}]<br /><input type=\"radio\" name=\".k_no.\" value=\"$cwidw2\"${$cwidw} />この$ctcome[$k_kokka_keitai{$fk_id}]へ仕官（初期位置:$t_name[$k_outo{$fk_id}]$ctcome2[$k_kokka_keitai{$fk_id}]）</td></tr>";
		}else{
		$mess .= "<tr><td class=\"kbgcc$k_iro_d{$fk_id}\"><a href=\"./?.i.=i&amp;.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"c404000\">$k_name{$fk_id}</span></a></td><td class=\"kbgcc$k_iro_d{$fk_id}\">$k_tensi_name{$fk_id}</td><td class=\"kbgcc$k_iro_d{$fk_id}\">$k_kokui{$fk_id}</td><td class=\"kbgcc$k_iro_d{$fk_id}\">$MINZOKUSAN[$k_syuminzoku{$fk_id}]</td><td class=\"kbgcc$k_iro_d{$fk_id}\">$cou_cmes[$k_kunino{$fk_id}]<br /><input type=\"radio\" name=\".k_no.\" value=\"$cwidw2\"${$cwidw} />この$ctcome[$k_kokka_keitai{$fk_id}]へ仕官（初期位置:$t_name[$k_outo{$fk_id}]$ctcome2[$k_kokka_keitai{$fk_id}]）</td></tr>";
		}
	}



		if(-e "./w_db/allc_tosi_db.pl"){
require "./w_db/all_tosi_db.pl";

		}else{ 
require "./w_db/all2_tosi_db.pl";
		}


	$zc=0;
	while ($zc<$tosi_kazu) {
							$dt_id = $zc;
$zcid = "twid$zc";
		$t_list .= "<option value=\"$zc\"${$zcid}>$t_name[$zc]/$k_name_d[$t_kunino[$dt_id]]</option>";
		$zc++;
	}

	$zc=0;
	while ($zc<$tosi_kazu) {
							$ft_id = $zc;
		$add_tn_l[$zc] = "$t_name[$zc]の賊";
$zcid = "twidz$zc";
		$t_list .= "<option value=\"z$zc\"${$zcid}>$add_tn_l[$zc]/$k_name_d[$t_zokuno[$ft_id]]</option>";
		$zc++;
	}
$nmail = "";
$nmail = $in{'mail'};

		if($in{'icon_saba'} eq ""){
$in{'icon_saba'} = 0;
		}


$eleele = "<div class=\"kuniiro_div\">";
	$i=0;
	foreach(@ELE_BG){
$eleele .= "<div class=\"kuniiro_block\"><span class=\"kcm$i\">■</span><br /><input type=\"radio\" name=\".ele.\" value=\"$i\"></div>";
	$i++;
	}

$eleele .= "</div><div class=\"clear_b\"></div>";

	$in{'icon'} = abs(int($in{'icon'}));
	$in{'icon_saba'} = abs(int($in{'icon_saba'}));

$add_saba_sel[$in{'icon_saba'}] = " selected=\"selected\"";

$datev2cgl.="sitem = [";
$datev2cgs.="litem = [";
foreach $key ( keys %IMG ) {
$key=int($key);
$add_img[$key]=$key;
}


foreach (@add_img){
$add_g_saba_l.="<option value=\"$_\"$add_saba_sel[$_]>$IMG_SABA_NAME{$_}</option>";
$datev2cgl.="	[";
$datev2cgs.="	[";
	foreach (0..$KYARA_IMG_MAX{$_}){
$datev2cgl.="$_,";
$datev2cgs.="'イメージ\[$_\]',";
$IMAGEKAZU ++;
	}
	chop($datev2cgl);
$datev2cgl.="],";
	chop($datev2cgs);
$datev2cgs.="],";
$datev2saba.="saba[$_]='$IMG{$_}/';saba_f[$_]='$p_img_kakutyou{$_}';";
}
	chop($datev2cgl);
$datev2cgl.="];";
	chop($datev2cgs);
$datev2cgs.="];";

$IMAGEKAZU -= @add_img;

$datev4.="saba_i=0;saba=new Array();saba_f=new Array();$datev2saba$datev2cgl$datev2cgs";
	&HEADER;
print <<"PRI";

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\" name=\"entry\" id=\"entry\"><div>

<input type=\"hidden\" name=\".toi.\" value=\"$in{'toi'}\" /><input type=\"hidden\" name=\".toi2.\" value=\"$in{'toi2'}\" />
<input type=\"hidden\" name=\".toi3.\" value=\"$in{'toi3'}\" /><input type=\"hidden\" name=\".toi4.\" value=\"$in{'toi4'}\" />
<input type=\"hidden\" name=\".toi5.\" value=\"$in{'toi5'}\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"$in{'tyekku'}\" />
<input type=\"hidden\" name=\".icon_saba.\" value=\"$in{'icon_saba'}\" />
<input type=\"hidden\" name=\".i.\" value=\"i\" />
<input type=\"hidden\" name=\".m.\" value=\"entry\" />
<input type=\"hidden\" name=\".toi6.\" value=\"$in{'toi6'}\" />
<input type=\"hidden\" name=\".toi7.\" value=\"$in{'toi7'}\" /><input type=\"hidden\" name=\".zokumei.\" value=\"$in{'zokumei'}\" />
<input type=\"hidden\" name=\".ele.\" value=\"$in{'ele'}\" /><input type=\"hidden\" name=\".kokumei.\" value=\"$in{'kokumei'}\" /><input type=\"hidden\" name=\".min.\" value=\"$in{'min'}\" /><input type=\"hidden\" name=\".icon.\" value=\"$in{'icon'}\" /><input type=\"hidden\" name=\".str.\" value=\"$in{'str'}\" /><input type=\"hidden\" name=\".int.\" value=\"$in{'int'}\" /><input type=\"hidden\" name=\".tou.\" value=\"$in{'tou'}\" /><input type=\"hidden\" name=\".k_no.\" value=\"$in{'k_no'}\" /><input type=\"hidden\" name=\".doui.\" value=\"$in{'doui'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".keyw.\" value=\"$in{'keyw'}\" /><input type=\"hidden\" name=\".url.\" value=\"$in{'url'}\" /><input type=\"hidden\" name=\".chara_name.\" value=\"$in{'chara_name'}\" /><input type=\"hidden\" name=\".mes.\" value=\"$in{'mes'}\" />


<a id=\"1\"></a>新規登録画面－２：「武将名・能力値・民族・問い１～問い６」の八点を記入して下さい。

<table class=\"bgc884422\" border=\"0\" width=\"240\">

<tr><td class=\"bgcF8F0E8\"><hr />武将名</td></tr>
<tr><td class=\"bgcFFF8F0\"><input type=\"text\" name=\".chara_name.\" size=\"16\" value=\"$in{'chara_name'}\" /><br />（全角大文字で１～８文字以内）</td></tr>

<tr><td class=\"bgcF8F0E0\">
<hr />下記の三つの能力の合計が150になるように振り当てて下さい。
</td></tr>
<tr><td class=\"bgcF8F0E8\">武力</td></tr>
<tr><td class=\"bgcFFF8F0\"><input type=\"text\" name=\".str.\" size=\"5\" maxlength=\"3\" value=\"$in{'str'}\" />[0～100]</td></tr>
<tr><td class=\"bgcF8F0E8\">知力</td></tr>
<tr><td class=\"bgcFFF8F0\"><input type=\"text\" name=\".int.\" size=\"5\" maxlength=\"3\" value=\"$in{'int'}\" />[0～100]</td></tr>
<tr><td class=\"bgcF8F0E8\">統率力</td></tr>
<tr><td class=\"bgcFFF8F0\"><input type=\"text\" name=\".tou.\" size=\"5\" maxlength=\"3\" value=\"$in{'tou'}\" />[0～100]</td></tr>


<tr><td class=\"bgcF8F0E0\"><hr />民族</td></tr><tr><td class=\"bgcFFF8F0\">どの民族でスタートしますか？<br />
<input type=\"radio\" name=\".min.\" value=\"0\"${"m1t0"} />華人
<input type=\"radio\" name=\".min.\" value=\"14\"${"m1t14"} />倭人
<input type=\"radio\" name=\".min.\" value=\"3\"${"m1t3"} />羯族
<input type=\"radio\" name=\".min.\" value=\"10\"${"m1t10"} />京族
<input type=\"radio\" name=\".min.\" value=\"6\"${"m1t6"} />テイ族<br / />
<input type=\"radio\" name=\".min.\" value=\"11\"${"m1t11"} />苗族
<input type=\"radio\" name=\".min.\" value=\"8\"${"m1t8"} />瑤族
<input type=\"radio\" name=\".min.\" value=\"13\"${"m1t13"} />烏戈族
<input type=\"radio\" name=\".min.\" value=\"4\"${"m1t4"} />鮮卑族
<input type=\"radio\" name=\".min.\" value=\"2\"${"m1t2"} />南匈奴族<br / />
<input type=\"radio\" name=\".min.\" value=\"7\"${"m1t7"} />羌族
<input type=\"radio\" name=\".min.\" value=\"12\"${"m1t12"} />彝族
<input type=\"radio\" name=\".min.\" value=\"5\"${"m1t5"} />烏桓族
<input type=\"radio\" name=\".min.\" value=\"9\"${"m1t9"} />扶余族
<input type=\"radio\" name=\".min.\" value=\"1\"${"m1t1"} />北匈奴族
<hr />
</td></tr>

<tr><td class=\"bgcF8F0E0\"><hr />問い１</td></tr><tr><td class=\"bgcFFF8F0\">

貴方の生まれは？（ゲーム内のキャラについて）<br />
<input type=\"radio\" name=\".toi2.\" value=\"101\"${"s2t101"} />農家の息子
<input type=\"radio\" name=\".toi2.\" value=\"1\"${"s2t1"} />農家の娘
<input type=\"radio\" name=\".toi2.\" value=\"102\"${"s2t102"} />武官の息子
<input type=\"radio\" name=\".toi2.\" value=\"2\"${"s2t2"} />武官の娘
<input type=\"radio\" name=\".toi2.\" value=\"103\"${"s2t103"} />盗賊の息子
<input type=\"radio\" name=\".toi2.\" value=\"3\"${"s2t3"} />盗賊の娘<br />

<input type=\"radio\" name=\".toi2.\" value=\"104\"${"s2t104"} />猟師の息子
<input type=\"radio\" name=\".toi2.\" value=\"4\"${"s2t4"} />猟師の娘
<input type=\"radio\" name=\".toi2.\" value=\"105\"${"s2t105"} />長老の息子
<input type=\"radio\" name=\".toi2.\" value=\"5\"${"s2t5"} />長老の娘
<input type=\"radio\" name=\".toi2.\" value=\"106\"${"s2t106"} />神官の息子
<input type=\"radio\" name=\".toi2.\" value=\"6\"${"s2t6"} />神官の娘<br />

<input type=\"radio\" name=\".toi2.\" value=\"107\"${"s2t107"} />漁師の息子
<input type=\"radio\" name=\".toi2.\" value=\"7\"${"s2t7"} />漁師の娘
<input type=\"radio\" name=\".toi2.\" value=\"108\"${"s2t108"} />文官の息子
<input type=\"radio\" name=\".toi2.\" value=\"8\"${"s2t8"} />文官の娘
<input type=\"radio\" name=\".toi2.\" value=\"109\"${"s2t109"} />飲み屋の息子
<input type=\"radio\" name=\".toi2.\" value=\"9\"${"s2t9"} />飲み屋の娘<br />

<input type=\"radio\" name=\".toi2.\" value=\"110\"${"s2t110"} />大工の息子
<input type=\"radio\" name=\".toi2.\" value=\"10\"${"s2t10"} />大工の娘
<input type=\"radio\" name=\".toi2.\" value=\"111\"${"s2t111"} />間者の息子
<input type=\"radio\" name=\".toi2.\" value=\"11\"${"s2t11"} />間者の娘
<input type=\"radio\" name=\".toi2.\" value=\"112\"${"s2t112"} />踊り子の息子
<input type=\"radio\" name=\".toi2.\" value=\"12\"${"s2t12"} />踊り子の娘<br />

<input type=\"radio\" name=\".toi2.\" value=\"113\"${"s2t113"} />遊牧民の息子
<input type=\"radio\" name=\".toi2.\" value=\"13\"${"s2t13"} />遊牧民の娘
<input type=\"radio\" name=\".toi2.\" value=\"114\"${"s2t114"} />武術家の息子
<input type=\"radio\" name=\".toi2.\" value=\"14\"${"s2t14"} />武術家の娘
<input type=\"radio\" name=\".toi2.\" value=\"115\"${"s2t115"} />貴族の息子
<input type=\"radio\" name=\".toi2.\" value=\"15\"${"s2t15"} />貴族の娘<br />

<input type=\"radio\" name=\".toi2.\" value=\"116\"${"s2t116"} />武器屋の息子
<input type=\"radio\" name=\".toi2.\" value=\"16\"${"s2t16"} />武器屋の娘
<input type=\"radio\" name=\".toi2.\" value=\"117\"${"s2t117"} />雑貨屋の息子
<input type=\"radio\" name=\".toi2.\" value=\"17\"${"s2t17"} />雑貨屋の娘
<input type=\"radio\" name=\".toi2.\" value=\"118\"${"s2t118"} />医者の息子
<input type=\"radio\" name=\".toi2.\" value=\"18\"${"s2t18"} />医者の娘<br />

<input type=\"radio\" name=\".toi2.\" value=\"131\"${"s2t131"} />仙女の落とし子（♂）
<input type=\"radio\" name=\".toi2.\" value=\"31\"${"s2t31"} />仙女の落とし子（♀）
<input type=\"radio\" name=\".toi2.\" value=\"132\"${"s2t132"} />孤児（♂）
<input type=\"radio\" name=\".toi2.\" value=\"33\"${"s2t33"} />孤児（♀）<br />
<input type=\"radio\" name=\".toi2.\" value=\"133\"${"s2t133"} />吸血鬼の隠し子（♂）
<input type=\"radio\" name=\".toi2.\" value=\"33\"${"s2t33"} />吸血鬼の隠し子（♀）
<input type=\"radio\" name=\".toi2.\" value=\"134\"${"s2t134"} />不明（♂）
<input type=\"radio\" name=\".toi2.\" value=\"34\"${"s2t34"} />不明（♀）<br />
<hr />

</td></tr>


<tr><td class=\"bgcF8F0E0\"><hr />問い２</td></tr><tr><td class=\"bgcFFF8F0\">

幼い時、道端で野良犬に吼えられました。貴方のとった行動は？<br />
<input type=\"radio\" name=\".toi3.\" value=\"1\"${"s3t1"} />一目散に逃げる
<input type=\"radio\" name=\".toi3.\" value=\"2\"${"s3t2"} />その場でしゃがみ込み一歩も動けない
<input type=\"radio\" name=\".toi3.\" value=\"3\"${"s3t3"} />その場で死んだ振りをしてみる<br />
<input type=\"radio\" name=\".toi3.\" value=\"4\"${"s3t4"} />道端に落ちていた木の棒を手に取り追っ払う
<input type=\"radio\" name=\".toi3.\" value=\"5\"${"s3t5"} />うちとけてじゃれあう
<input type=\"radio\" name=\".toi3.\" value=\"6\"${"s3t6"} />一睨みして追い返す
<hr />
</td></tr>


<tr><td class=\"bgcF8F0E0\"><hr />問い３</td></tr><tr><td class=\"bgcFFF8F0\" />

路地裏で酒に酔っ払った爺に絡まれました。貴方のとった行動は？<br />
<input type=\"radio\" name=\".toi4.\" value=\"1\"${"s4t1"} />その場でしばき倒す
<input type=\"radio\" name=\".toi4.\" value=\"2\"${"s4t2"} />なだめて家まで送ってゆく
<input type=\"radio\" name=\".toi4.\" value=\"3\"${"s4t3"} />口論になる<br />
<input type=\"radio\" name=\".toi4.\" value=\"4\"${"s4t4"} />無視してその場を後にする
<input type=\"radio\" name=\".toi4.\" value=\"5\"${"s4t5"} />おろおろしてその場に立ち尽くす
<hr />
</td></tr>


<tr><td class=\"bgcF8F0E0\"><hr />問い４</td></tr><tr><td class=\"bgcFFF8F0\">

真夜中に大地震が起きました。貴方のとった行動は？<br />
<input type=\"radio\" name=\".toi5.\" value=\"1\"${"s5t1"} />村人の避難を手伝う
<input type=\"radio\" name=\".toi5.\" value=\"2\"${"s5t2"} />近くの店に強盗に入る
<input type=\"radio\" name=\".toi5.\" value=\"3\"${"s5t3"} />水と食料を確保する<br />
<input type=\"radio\" name=\".toi5.\" value=\"4\"${"s5t4"} />熟睡
<input type=\"radio\" name=\".toi5.\" value=\"5\"${"s5t5"} />パニックになってあたふたする
<input type=\"radio\" name=\".toi5.\" value=\"6\"${"s5t6"} />机の下に隠れる
<hr />
</td></tr>

<tr><td class=\"bgcF8F0E0\"><hr />問い５</td></tr><tr><td class=\"bgcFFF8F0\">

街が疫病に侵され大勢の死者が出ました。貴方のとった行動は？<br />
<input type=\"radio\" name=\".toi6.\" value=\"1\"${"s6t1"} />死者を手厚く弔う
<input type=\"radio\" name=\".toi6.\" value=\"2\"${"s6t2"} />村人の看護に当たる
<input type=\"radio\" name=\".toi6.\" value=\"3\"${"s6t3"} />別な街に移住する<br />
<input type=\"radio\" name=\".toi6.\" value=\"4\"${"s6t4"} />感染しないように人付き合いを避ける
<input type=\"radio\" name=\".toi6.\" value=\"5\"${"s6t5"} />近隣諸国を訪ね特効薬を探す
</td></tr>


<tr><td class=\"bgcF8F0E0\"><hr />問い６</td></tr><tr><td class=\"bgcFFF8F0\">

貴方の趣味は？（能力の方向性が大まかに変化します）<br />
<input type=\"radio\" name=\".toi7.\" value=\"1\"${"s7t1"} />乗馬
<input type=\"radio\" name=\".toi7.\" value=\"2\"${"s7t2"} />やぶさめ
<input type=\"radio\" name=\".toi7.\" value=\"3\"${"s7t3"} />弓道
<input type=\"radio\" name=\".toi7.\" value=\"4\"${"s7t4"} />武道
<input type=\"radio\" name=\".toi7.\" value=\"5\"${"s7t5"} />魔術
<input type=\"radio\" name=\".toi7.\" value=\"6\"${"s7t6"} />考古学
<input type=\"radio\" name=\".toi7.\" value=\"7\"${"s7t7"} />瞑想
<input type=\"radio\" name=\".toi7.\" value=\"8\"${"s7t8"} />読書<br />
<input type=\"radio\" name=\".toi7.\" value=\"9\"${"s7t9"} />工作
<input type=\"radio\" name=\".toi7.\" value=\"10\"${"s7t10"} />人助け
<input type=\"radio\" name=\".toi7.\" value=\"11\"${"s7t11"} />人物評
<input type=\"radio\" name=\".toi7.\" value=\"12\"${"s7t12"} />演説
<input type=\"radio\" name=\".toi7.\" value=\"13\"${"s7t13"} />ペットを飼う
<input type=\"radio\" name=\".toi7.\" value=\"14\"${"s7t14"} />買い物
<input type=\"radio\" name=\".toi7.\" value=\"15\"${"s7t15"} />演奏
<input type=\"radio\" name=\".toi7.\" value=\"16\"${"s7t16"} />踊り<br />
<input type=\"radio\" name=\".toi7.\" value=\"17\"${"s7t17"} />動物と戯れる
<input type=\"radio\" name=\".toi7.\" value=\"18\"${"s7t18"} />曲芸
<input type=\"radio\" name=\".toi7.\" value=\"19\"${"s7t19"} />歌唱
<input type=\"radio\" name=\".toi7.\" value=\"20\"${"s7t20"} />占い
<input type=\"radio\" name=\".toi7.\" value=\"21\"${"s7t21"} />賭博
<input type=\"radio\" name=\".toi7.\" value=\"22\"${"s7t22"} />酒飲み
<input type=\"radio\" name=\".toi7.\" value=\"23\"${"s7t23"} />喧嘩
<input type=\"radio\" name=\".toi7.\" value=\"24\"${"s7t24"} />裏家業<br />
<input type=\"radio\" name=\".toi7.\" value=\"25\"${"s7t25"} />お散歩
<input type=\"radio\" name=\".toi7.\" value=\"26\"${"s7t26"} />お昼ね
<input type=\"radio\" name=\".toi7.\" value=\"27\"${"s7t27"} />隠れんぼ
<input type=\"radio\" name=\".toi7.\" value=\"28\"${"s7t28"} />お絵描き<br />
<input type=\"radio\" name=\".toi7.\" value=\"0\"${"s7t0"} />その他
</td></tr>
</table>
<br /><br /><input type=\"hidden\" name=\".m.\" value=\"i_entry3\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"$in{'tyekku'}\" />
<input type=\"submit\" value=\"～ 《 次へ 》 ～\" />


</div></form>



<form action=\"$COMMAND\" method=\"post\" utn=\"utn\" name=\"entry\" id=\"entry\"><div>

<input type=\"hidden\" name=\".toi.\" value=\"$in{'toi'}\" /><input type=\"hidden\" name=\".toi2.\" value=\"$in{'toi2'}\" />
<input type=\"hidden\" name=\".toi3.\" value=\"$in{'toi3'}\" /><input type=\"hidden\" name=\".toi4.\" value=\"$in{'toi4'}\" />
<input type=\"hidden\" name=\".toi5.\" value=\"$in{'toi5'}\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"$in{'tyekku'}\" />
<input type=\"hidden\" name=\".icon_saba.\" value=\"$in{'icon_saba'}\" />
<input type=\"hidden\" name=\".i.\" value=\"i\" />
<input type=\"hidden\" name=\".m.\" value=\"entry\" />
<input type=\"hidden\" name=\".toi6.\" value=\"$in{'toi6'}\" />
<input type=\"hidden\" name=\".toi7.\" value=\"$in{'toi7'}\" /><input type=\"hidden\" name=\".zokumei.\" value=\"$in{'zokumei'}\" />
<input type=\"hidden\" name=\".ele.\" value=\"$in{'ele'}\" /><input type=\"hidden\" name=\".kokumei.\" value=\"$in{'kokumei'}\" /><input type=\"hidden\" name=\".min.\" value=\"$in{'min'}\" /><input type=\"hidden\" name=\".icon.\" value=\"$in{'icon'}\" /><input type=\"hidden\" name=\".str.\" value=\"$in{'str'}\" /><input type=\"hidden\" name=\".int.\" value=\"$in{'int'}\" /><input type=\"hidden\" name=\".tou.\" value=\"$in{'tou'}\" /><input type=\"hidden\" name=\".k_no.\" value=\"$in{'k_no'}\" /><input type=\"hidden\" name=\".doui.\" value=\"$in{'doui'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".keyw.\" value=\"$in{'keyw'}\" /><input type=\"hidden\" name=\".url.\" value=\"$in{'url'}\" /><input type=\"hidden\" name=\".chara_name.\" value=\"$in{'chara_name'}\" /><input type=\"hidden\" name=\".mes.\" value=\"$in{'mes'}\" />

<br /><br /><input type=\"hidden\" name=\".m.\" value=\"i_entry\" />
<input type=\"submit\" value=\"前の画面に戻る\" />

</div></form>

PRI

	}
	&FOOTER;

	exit;
}


sub E_MAX {

opendir(CF,'./p_db/p');
@cfs = (readdir(CF));
closedir(CF);
$sousu1 = $#cfs -2;
		if($sousu1 > $EN_MAX){
			&ER2("稼動人数が最大登録人数$EN_MAXを超えています。現在登録制限がかかっています。");
		}
opendir(CF,'./p_db/touketu');
@cfs = (readdir(CF));
closedir(CF);
$sousu3 = $#cfs -2 +$sousu1;

}
1;