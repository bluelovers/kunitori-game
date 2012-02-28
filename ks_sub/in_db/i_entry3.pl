
sub E_ERR {

	&HEADER;
	print "<hr /><span class=\"fs4\">ヽ(｀Д´)ノ</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>$_[0]</strong></span>\n";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\">
<input type=\"hidden\" name=.toi. value=$in{'toi'}><input type=\"hidden\" name=.toi2. value=$in{'toi2'}>
<input type=\"hidden\" name=.toi3. value=$in{'toi3'}><input type=\"hidden\" name=.toi4. value=$in{'toi4'}>
<input type=\"hidden\" name=.toi5. value=$in{'toi5'}>
<input type=\"hidden\" name=.tyekku. value=$in{'tyekku'}>
<input type=\"hidden\" name=\".m.\" value=i_entry2>
<input type=\"hidden\" name=.i. value=$in{'i'}>
<input type=\"hidden\" name=.toi6. value=$in{'toi6'}><input type=\"hidden\" name=.zokumei. value=$in{'zokumei'}>
<input type=\"hidden\" name=.ele. value=$in{'ele'}><input type=\"hidden\" name=.kokumei. value=$in{'kokumei'}><input type=\"hidden\" name=.min. value=$in{'min'}><input type=\"hidden\" name=.icon. value=$in{'icon'}><input type=\"hidden\" name=.str. value=$in{'str'}><input type=\"hidden\" name=.int. value=$in{'int'}><input type=\"hidden\" name=.tou. value=$in{'tou'}><input type=\"hidden\" name=.k_no. value=$in{'k_no'}><input type=\"hidden\" name=.doui. value=$in{'doui'}>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=.keyw. value=$in{'keyw'}><input type=\"hidden\" name=.url. value=$in{'url'}><input type=\"hidden\" name=.chara_name. value=$in{'chara_name'}><input type=\"hidden\" name=.mes. value=$in{'mes'}><input type=\"submit\" value=\"入力に戻る\"></form>";
	print "<br /><br /><hr />\n</div></body></html>\n";
	exit;
}

sub MOVE {

	if($in{'str'} < 5 or $in{'str'} > 100){&E_ERR("武力が正しく入力されていません。");}
	if($in{'int'} < 5 or $in{'int'} > 100){&E_ERR("知力が正しく入力されていません。");}
	if($in{'tou'} < 5 or $in{'tou'} > 100){&E_ERR("統率力が正しく入力されていません。");}
	&MOJISUU($in{'chara_name'},16);
	if($in{'chara_name'} eq "" or $mojisuu_h_all < 2 or $mojisuu_o) { &E_ERR("キャラクターの名前が正しく入力されていません。$in{'chara_name'}。$mojisuu_re"); }
	$max = int($in{'str'} + $in{'int'} + $in{'tou'});
	if($max ne "150"){
		&E_ERR("三種能力の合計値が150ではありません。（計・$max）");
	}
require "./$mpg_r/sub_db/ingo.pl";


	if($in{'pass'} ne "4253md5"){
$cnksw = $in{'chara_name'};
$cnksw =~  s/ //g;
$cnksw =~  s/　//g;
	foreach(@KSW){
if($_ and $cnksw =~ /\Q$_\E/ ) {
		&E_ERR("そのキャラネームは使用できません。$_『隠語・淫語フィルター』");}
	}

if($cnksw eq "") {
		&E_ERR("そのキャラネームは使用できません。『隠語・淫語フィルター』");}

	}

	if($in{'toi2'} eq "") { &E_ERR('項目を埋めてください。toi2'); }
	if($in{'toi3'} eq "") { &E_ERR('項目を埋めてください。toi3'); }
	if($in{'toi4'} eq "") { &E_ERR('項目を埋めてください。toi4'); }
	if($in{'toi5'} eq "") { &E_ERR('項目を埋めてください。toi5'); }
	if($in{'toi6'} eq "") { &E_ERR('項目を埋めてください。toi6'); }
	if($in{'toi7'} eq "") { &E_ERR('項目を埋めてください。toi7'); }
	if($in{'min'} eq "") { &E_ERR('項目を埋めてください。min'); }
	if ($in{'min'} =~ m/[^0-9]/ or $in{'min'} > 14) {&E_ERR("正規のフォームで登録してください。"); }
	if ($in{'toi2'} =~ m/[^0-9]/ or $in{'toi2'} > 199) {&E_ERR("正規のフォームで登録してください。"); }
	
	
	
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
${"ele$in{'ele'}"} = " checked=\"checked\"";

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
	$mess .= "";

	$messz = "";
	$messz .= "";

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
		$messz .= "★国名│<a href=\"./?.i.=i&amp;.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\&amp;.i.=i\" target=\"_blank\"><span class=\"c404000\">$k_name{$fk_id}</span></a>│国威│$k_kokui{$fk_id}│主民族│$MINZOKUSAN[$k_syuminzoku{$fk_id}]│勧誘文│$cou_cmes[$k_kunino{$fk_id}]<br /><input type=\"radio\" name=\".k_no.\" value=\"$cwidw2\"${$cwidw} />この$ctcome[$k_kokka_keitai{$fk_id}]へ仕官（初期位置:$t_name[$k_outo{$fk_id}]$ctcome2[$k_kokka_keitai{$fk_id}]）<hr />";
		}else{
		$mess .= "★賊名│<a href=\"./?.i.=i&amp;.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\&amp;.i.=i\" target=\"_blank\"><span class=\"c404000\">$k_name{$fk_id}</span></a>│国威│$k_kokui{$fk_id}│主民族│$MINZOKUSAN[$k_syuminzoku{$fk_id}]│勧誘文│$cou_cmes[$k_kunino{$fk_id}]<br /><input type=\"radio\" name=\".k_no.\" value=\"$cwidw2\"${$cwidw} />この$ctcome[$k_kokka_keitai{$fk_id}]へ仕官（初期位置:$t_name[$k_outo{$fk_id}]$ctcome2[$k_kokka_keitai{$fk_id}]）<hr />";
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
$eleele .= "<div class=\"kuniiro_block\"><span class=\"kcm$i\">■</span><br /><input type=\"radio\" name=\".ele.\" value=\"$i${'ele$i'}\"></div>";
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



<a id=\"4\"></a>新規登録画面－３：入力はこのページで最後です。必要な項目を記入した後、登録を押すと新規登録できます。<br /><br />
「仕官先」を指定してください。選択せずに次の項目で開始都市を直接選択することも可\能です。<a href=\"#5\">開始都市直接選択</a>


<table class=\"bgc884422\" border=\"0\" width=\"240\">
<tr><td class=\"bgcF8F0E0\">
<hr />
国家一覧
</td></tr>
<tr><td class=\"bgcF8F0E0\">
$mess
</td></tr>
</table>
<hr />

<table class=\"bgc884422\" border=\"0\" width=\"240\">
<tr><td class=\"bgcF8F0E0\">
<hr />
賊軍一覧
</td></tr>
<tr><td class=\"bgcF8F0E0\">
$messz
</td></tr>
</table>
<hr />
<a id=\"5\"></a>前の項目で仕官先未選択の場合、この項目で「開始都市」を選択してください。<a href=\"#4\">国家・賊軍一覧</a>

<table class=\"bgc884422\" border=\"0\" width=\"240\">
<tr><td class=\"bgcF8F0E0\">
注：規約や地図などのリンク先ページに飛ぶ場合は、ブラウザ端末の前に戻るを利用して新規登録画面に戻ってください。<br />
・<a href=\"./?.m.=rn0\" target=\"_blank\"><span class=\"cFF0000\">登録武将一覧</span></a> <br />
・<a href=\"./?.m.=map3\" target=\"_blank\"><span class=\"cFF0000\">勢力図（拡大版）</span></a><br /><br />
・前項目で仕官先未選択の場合<br />
・開始都市を選択して下さい。<br />
<select name=\".k_no.\" size=\"30\">
<option value=\"\"> ※説明※ </option>
<option value=\"\"> 都市の名称【国家の名称】</option>
<option value=\"\"> 【無所属】は空白地</option>
<option value=\"\"> ーーーーーーーーーーーー</option>
$t_list
</select>
</td></tr>
</table>
<hr />

<a id=\"6\"></a>空白地を選択した場合、「国名、賊名、天子、国の色」の四点を記入してください

<table class=\"bgc884422\" border=\"0\" width=\"240\">
<tr class=\"bgc884422\"><td class=\"txth\" width=\"45\"></td><td class=\"txth\" width=\"100\"></td></tr>
<tr class=\"bgcFFF0F5\"><td class=\"txth\" colspan=\"2\">建国</td></tr>
<tr class=\"bgcF8F0E0\"><td>国名</td><td class=\"bgcFFF8F0\"><input type=\"text\" name=\".kokumei.\" size=\"14\" value=\"$in{'kokumei'}\" /><br />・新国家の名称を決めてください。<br /> [全角大文字で１～８文字]</td></tr>
<tr class=\"bgcF8F0E0\"><td>賊名</td><td class=\"bgcFFF8F0\"><input type=\"text\" name=\".zokumei.\" size=\"14\" value=\"$in{'zokumei'}\" /><br />・賊砦でスタートする場合、建国成功後の新国家の名称と共に、<br />賊の名称を決めてください。<br /> [全角大文字で１～８文字以内]/末尾に（○○賊）\表示\は有りません。</td></tr>
<tr class=\"bgcF8F0E0\"><td>天子</td><td class=\"bgcFFF8F0\"><input type=\"text\" name=\".mes.\" size=\"14\" value=\"$in{'mes'}\" /><br />・新国家の皇帝となる天子の名称を決めてください。<br />国の最高位である天子はNPC（コンピューター）が担当致します。<br /> [全角大文字で１～８文字以内]/例：霊帝。楓姫。</td></tr>
<tr><td class=\"bgcF8F0E0\">国の色</td><td class=\"bgcFFF8F0\">$eleele・国の色を決めてください。※CSS非対応の旧式ブラウザだと色は表示されませんのでその場合は適当でかまいません。</td></tr>

</table>
<hr />
<a id=\"7\"></a>

<table class=\"bgc884422\" border=\"0\" width=\"240\">
<tr class=\"bgcFFF8F0\"><td class=\"txtc\">

<br />

<input type=\"hidden\" name=\".tyekku.\" value=\"7\" />
<a href=\"$URI/?.m.=setumei\&amp;.koumoku.=5\&amp;.i.=i\" target=\"_blank\"><span class=\"cFF0000\">$GAME_TITLE利用規約</span></a>に同意しますか？
<br />
<br />
<input type=\"radio\" name=\".doui.\" value=\"1\"${"sdt1"} />同意する<br />
<input type=\"radio\" name=\".doui.\" value=\"0\"${"sdt0"} />同意しない<br /><br /><hr /><br />

<br /><br /><input type=\"hidden\" name=\".m.\" value=\"entry2\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"$in{'tyekku'}\" />
<input type=\"submit\" value=\"～ 《 登録 》 ～\" />

</td></tr>

</table>
<br /><br />
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



<br /><br /><input type=\"hidden\" name=\".m.\" value=\"i_entry2\" />
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