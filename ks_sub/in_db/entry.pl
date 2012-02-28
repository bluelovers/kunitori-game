
sub MOVE {

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
${"s7t$in{'toi7'}"} = " checked=\"checked\"";

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
<input type=\"hidden\" name=\".m.\" value=\"entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"1\" />
<input type=\"submit\" value=\"はい\"></div></form>";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"2\" />
<input type=\"submit\" value=\"いいえ\"></div></form>";
			}elsif($in{'tyekku'} eq "1"){
	print <<"PRI";
<pre>
$p_name{$f_id}の侍女

そうですか・・また何処かでご縁がありましたら・・その時はよろしくお願い致します・・。
</pre>
PRI
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"221\" />
<input type=\"submit\" value=\"はい\" /></div></form>";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"222\" />
<input type=\"submit\" value=\"冗談だよ\" /></div></form>";
			}elsif($in{'tyekku'} eq "2"){
	print <<"PRI";
<pre>
$p_name{$f_id}の侍女

それでは、何故新規登録画面に？
</pre>
PRI
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"21\" />
<input type=\"submit\" value=\"様子見\" /></div></form>";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"22\" />
<input type=\"submit\" value=\"キャラを作り直すため\" /></div></form>";
			}elsif($in{'tyekku'} eq "21"){
	print <<"PRI";
<pre>
$p_name{$f_id}の侍女

では、新規登録画面へ移行致します。このままでは登録作業は出来ませんので予めご了\承ください。
</pre>
PRI
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"999\" />
<input type=\"submit\" value=\"OK\" /></div></form>";
			}elsif($in{'tyekku'} eq "22"){
	print <<"PRI";
<pre>
$p_name{$f_id}の侍女

そうですか・・残念です。それでは以前のデータを削除し新規登録画面に移行致します。
</pre>
PRI
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"221\" />
<input type=\"submit\" value=\"はい\" /></div></form>";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"222\" />
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
<input type=\"hidden\" name=\".m.\" value=\"entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"2221\" />
<input type=\"submit\" value=\"はい\" /></div></form>";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"2222\" />
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
<input type=\"hidden\" name=\".m.\" value=\"entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"22221\" />
<input type=\"submit\" value=\"はい\" /></div></form>";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"22222\" />
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
<input type=\"hidden\" name=\".m.\" value=\"entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"1\" />
<input type=\"submit\" value=\"はい\" /></div></form>";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"2\" />
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
<input type=\"hidden\" name=\".m.\" value=\"entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"21\" />
<input type=\"submit\" value=\"はい\" /></div></form>";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"22\" />
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
<input type=\"hidden\" name=\".m.\" value=\"entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"999\" />
<input type=\"submit\" value=\"新規登録画面へ\" /></div></form>";
			}elsif($in{'tyekku'} eq "22"){
	print <<"PRI";
<pre>
$p_name{$f_id}の侍女

それでは、以前のデータ「$p_name{$f_id}」でゲームを再開されるのですか？
</pre>
PRI
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"1\" />
<input type=\"submit\" value=\"はい\" /></div></form>";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"entry\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"222\" />
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
	&K_READ("kuni_db","$fk_id","$fk_id");
$cwidw = "cwidc$k_kunino{$fk_id}";
$cwidw2 = "c$k_kunino{$fk_id}";
		if($k_kokka_keitai{$fk_id}){
		$messz .= "<tr><td class=\"kbgcc$k_iro_d{$fk_id}\"><a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"c404000\">$k_name{$fk_id}</span></a></td><td class=\"kbgcc$k_iro_d{$fk_id}\">$k_tensi_name{$fk_id}</td><td class=\"kbgcc$k_iro_d{$fk_id}\">$k_kokui{$fk_id}</td><td class=\"kbgcc$k_iro_d{$fk_id}\">$MINZOKUSAN[$k_syuminzoku{$fk_id}]</td><td class=\"kbgcc$k_iro_d{$fk_id}\">$cou_cmes[$k_kunino{$fk_id}]<br /><input type=\"radio\" name=\".k_no.\" value=\"$cwidw2\"${$cwidw} />この$ctcome[$k_kokka_keitai{$fk_id}]へ仕官（初期位置:$t_name[$k_outo{$fk_id}]$ctcome2[$k_kokka_keitai{$fk_id}]）</td></tr>";
		}else{
		$mess .= "<tr><td class=\"kbgcc$k_iro_d{$fk_id}\"><a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"c404000\">$k_name{$fk_id}</span></a></td><td class=\"kbgcc$k_iro_d{$fk_id}\">$k_tensi_name{$fk_id}</td><td class=\"kbgcc$k_iro_d{$fk_id}\">$k_kokui{$fk_id}</td><td class=\"kbgcc$k_iro_d{$fk_id}\">$MINZOKUSAN[$k_syuminzoku{$fk_id}]</td><td class=\"kbgcc$k_iro_d{$fk_id}\">$cou_cmes[$k_kunino{$fk_id}]<br /><input type=\"radio\" name=\".k_no.\" value=\"$cwidw2\"${$cwidw} />この$ctcome[$k_kokka_keitai{$fk_id}]へ仕官（初期位置:$t_name[$k_outo{$fk_id}]$ctcome2[$k_kokka_keitai{$fk_id}]）</td></tr>";
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

$IMAGEKAZU -= int($KYARA_IMG_MAX{$KYARA_IMG_SABA_D} + 1);

$datev4.="saba_i=0;saba=new Array();saba_f=new Array();$datev2saba$datev2cgl$datev2cgs";
	&HEADER;
print <<"PRI";

<script type=\"text/javascript\" src=\"$CSS_URI/gazoue.js\"></script>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\" name=\"entry\" id=\"entry\"><div>
<a id=\"1\"></a>「ID・パス・キーワード」の三点を記入したら<a href="#2">次の項目</a>へ

<table class=\"bgc884422\" border=\"0\" width=\"595\">

<tr><td width=\"105\"></td><td width=\"480\"></td></tr>
<tr><td colspan=\"2\" class=\"bgcF8F0E0\">
・ 登録する前に<a href=\"./ksmanual.html\" target=\"_blank\"><span class=\"cFF0000\">ゲーム説明並びに利用規約</span></a>をお読み下さい。<br />
・ 各面毎に１人１キャラまで。２重登録は禁止。
<br />・ 注：１つの接続元から１つのIDのみ利用できます。共有PCからのアクセスは推奨していません。<br />
・ この面における稼動人数の上限設定は$EN_MAX名です。（現在の稼動人数$sousu1名/登録人数$sousu3名）<br />
・ 何処の支配もうけていない都市（【】空欄の都市）を選択すると新規建国可\能です。
<br />・ 既に建国済みの場合、その都市を支配している国の配下武将となります。 <br />
</td></tr>
<tr><td class=\"bgcF8F0E8\">ID</td><td class=\"bgcFFF8F0\"><input type=\"text\" name=\".id.\" size=\"15\" maxlength=\"12\" value=\"$in{'id'}\" /><br />・ゲームで使用するIDを記入してください。<br /> [半角英数字の小文字で４～１２文字以内]※英字を１字以上混ぜてください。</td></tr><tr><td class=\"bgcF8F0E8\">パスワード</td><td class=\"bgcFFF8F0\"><input type=\"password\" name=\".pass.\" size=\"8\" maxlength=\"8\" value=\"$in{'pass'}\" /><br />・ゲームで使用するパスワードを記入してください。<br /> [半角英数字で４～８文字以内]</td></tr>

<tr><td class=\"bgcF8F0E8\">適当なキーワード</td><td class=\"bgcFFF8F0\"><input type=\"text\" name=\".keyw.\" size=\"35\" value=\"$nmail\" />

</td></tr>
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id="2"></a>「イメージ画像・武将名・能力値」の三点を記入したら<a href="#3">次の項目</a>へ


<tr><td class=\"bgcFFF8F0\">


<table class=\"bgc884422\" border=\"2\" width=\"590\"><tr><td class=\"bgc000000\" width=\"120\">
<img src=\"$IMG{$in{'icon_saba'}}/$in{'icon'}$p_img_kakutyou{$in{'icon_saba'}}\" name=\"Img\" id=\"Img\" />
</td><td class=\"bgcFFF8F0\" width=\"100\">
<select name=\".icon.\" onChange=\"cgimgno(this);\" size=\"25\">
PRI
	foreach (0..$KYARA_IMG_MAX{$in{'icon_saba'}}){
$iconid = "iid$_";
print "<option value=\"$_\"${$iconid}>イメージ[$_]</option>\n";
	}
print <<"PRI";
</select></td><td class=\"bgcFFF8F0\">・武将のイメージを選択してください。
<br />・全部で$IMAGEKAZU種類<br /><br />・<a href=\"./?.m.=egazou\" target=\"_blank\">
<span class=\"cFF0000\">イメージ一覧</span></a><br />
$IMAGECOME<br /><select name=\".icon_saba.\" onChange=\"cgimgsaba(this)\">$add_g_saba_l</select><br /><br />
※登録後に自作画像に変更することも可能です。<br />
※設定方法：ゲーム内画面⇒「キャラ画像を変更」<br />
※初期画像非使用を希望する方は0番を選択してください。<br /><br />
自作画像リンク（お試し版）<input type=\"text\" name=\".icon_0.\" size=\"30\" onChange=\"cgimgurl(this);\" value=\"画像URLを入力して下さい\">
<br />※実際の変更はゲーム内のキャラ画像を変更より<br /><br />・お勧め画像アップロード掲示板<br /><a href=\"http://multi-thread.net/\" target=\"_blank\">マルチ BBS</a><br /><br />・お勧め画像作成サイト<br /><a href=\"http://www.moeruavatar.com/\" target=\"_blank\">萌える！アバターメーカー</a>
<br /><a href=\"http://illustmaker.abi-station.com/\" target=\"_blank\">似顔絵イラストメーカー</a>

</td></tr></table></td></tr>


<table class=\"bgc884422\" border=\"2\" width=\"590\">

<tr class=\"bgcFFF8F0\"><td width=\"40\"></td><td width=\"120\"></td><td width=\"420\"></td></tr>
<tr class=\"bgcFFF8F0\"><td>武将名</td><td colspan=\"2\"><input type=\"text\" name=\".chara_name.\" size=\"30\" value=\"$in{'chara_name'}\" />（全角大文字で１～８文字以内）</td></tr>
<tr class=\"bgcFFF8F0\"><td>武力</td><td><input type=\"text\" name=\".str.\" size=\"5\" maxlength=\"3\" value=\"$in{'str'}\" />[0～100]</td><td rowspan=\"3\">三つの能力の合計が150になるように振り当てて下さい。</td></tr>
<tr class=\"bgcFFF8F0\"><td>知力</td><td><input type=\"text\" name=\".int.\" size=\"5\" maxlength=\"3\" value=\"$in{'int'}\" />[0～100]</td></tr>
<tr class=\"bgcFFF8F0\"><td>統率力</td><td><input type=\"text\" name=\".tou.\" size=\"5\" maxlength=\"3\" value=\"$in{'tou'}\" />[0～100]</td></tr>
</table></td></tr>

</table>


<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id="3">「民族・問い１～問い６」の７点を選択しおわったら<a href="#4">次の項目</a>へ

<table class=\"bgc884422\" width=\"590\">

<tr class=\"bgc884422\"><td width=\"40\"></td><td width=\"540\"></td></tr>
<tr><td class=\"bgcF8F0E0\">民族</td><td class=\"bgcFFF8F0\">どの民族でスタートしますか？<br />
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
</td></tr>

<tr><td class=\"bgcF8F0E0\">問い１</td><td class=\"bgcFFF8F0\">

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

</td></tr>


<tr><td class=\"bgcF8F0E0\">問い２</td><td class=\"bgcFFF8F0\">

幼い時、道端で野良犬に吼えられました。貴方のとった行動は？<br />
<input type=\"radio\" name=\".toi3.\" value=\"1\"${"s3t1"} />一目散に逃げる
<input type=\"radio\" name=\".toi3.\" value=\"2\"${"s3t2"} />その場でしゃがみ込み一歩も動けない
<input type=\"radio\" name=\".toi3.\" value=\"3\"${"s3t3"} />その場で死んだ振りをしてみる<br />
<input type=\"radio\" name=\".toi3.\" value=\"4\"${"s3t4"} />道端に落ちていた木の棒を手に取り追っ払う
<input type=\"radio\" name=\".toi3.\" value=\"5\"${"s3t5"} />うちとけてじゃれあう
<input type=\"radio\" name=\".toi3.\" value=\"6\"${"s3t6"} />一睨みして追い返す
</td></tr>


<tr><td class=\"bgcF8F0E0\">問い３</td><td class=\"bgcFFF8F0\" />

路地裏で酒に酔っ払った爺に絡まれました。貴方のとった行動は？<br />
<input type=\"radio\" name=\".toi4.\" value=\"1\"${"s4t1"} />その場でしばき倒す
<input type=\"radio\" name=\".toi4.\" value=\"2\"${"s4t2"} />なだめて家まで送ってゆく
<input type=\"radio\" name=\".toi4.\" value=\"3\"${"s4t3"} />口論になる<br />
<input type=\"radio\" name=\".toi4.\" value=\"4\"${"s4t4"} />無視してその場を後にする
<input type=\"radio\" name=\".toi4.\" value=\"5\"${"s4t5"} />おろおろしてその場に立ち尽くす
</td></tr>


<tr><td class=\"bgcF8F0E0\">問い４</td><td class=\"bgcFFF8F0\">

真夜中に大地震が起きました。貴方のとった行動は？<br />
<input type=\"radio\" name=\".toi5.\" value=\"1\"${"s5t1"} />村人の避難を手伝う
<input type=\"radio\" name=\".toi5.\" value=\"2\"${"s5t2"} />近くの店に強盗に入る
<input type=\"radio\" name=\".toi5.\" value=\"3\"${"s5t3"} />水と食料を確保する<br />
<input type=\"radio\" name=\".toi5.\" value=\"4\"${"s5t4"} />熟睡
<input type=\"radio\" name=\".toi5.\" value=\"5\"${"s5t5"} />パニックになってあたふたする
<input type=\"radio\" name=\".toi5.\" value=\"6\"${"s5t6"} />机の下に隠れる
</td></tr>

<tr><td class=\"bgcF8F0E0\">問い５</td><td class=\"bgcFFF8F0\">

街が疫病に侵され大勢の死者が出ました。貴方のとった行動は？<br />
<input type=\"radio\" name=\".toi6.\" value=\"1\"${"s6t1"} />死者を手厚く弔う
<input type=\"radio\" name=\".toi6.\" value=\"2\"${"s6t2"} />村人の看護に当たる
<input type=\"radio\" name=\".toi6.\" value=\"3\"${"s6t3"} />別な街に移住する<br />
<input type=\"radio\" name=\".toi6.\" value=\"4\"${"s6t4"} />感染しないように人付き合いを避ける
<input type=\"radio\" name=\".toi6.\" value=\"5\"${"s6t5"} />近隣諸国を訪ね特効薬を探す
</td></tr>

<tr><td class=\"bgcF8F0E0\">問い６</td><td class=\"bgcFFF8F0\">

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


<br /><br /><br /><br />
<br /><br /><br /><br /><a id=\"4\"></a>「仕官先」を指定してください。選択せずに次の項目で開始都市を直接選択することも可\能です。<a href=\"#5\">次の項目</a>へ

<br />
<table class=\"bgc884422\" width=\"590\">
<tr><td class=\"txth\" class=\"bgcFFF8F0\">

<table class=\"bgc884422\" width=\"585\">
<tr class=\"bgcFFF0F5\"><td class=\"txth\">
国家一覧
</td></tr></table>

<table class=\"bgc884422\" width=\"585\">$mess</table></td></tr>
</table>
<hr />
<table class=\"bgc884422\" width=\"590\">
<tr><td class=\"txth\" class=\"bgcFFF8F0\">
<table class=\"bgc884422\" width=\"585\">
<tr class=\"bgcFFF0F5\"><td class=\"txth\">
賊軍一覧
</td></tr></table>

<table class=\"bgc884422\" width=\"585\">$messz</table>
</td></tr>
</table>
<br /><br /><br /><br />
<br /><br /><br /><br />

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"5\"></a>前の項目で仕官先未選択の場合、この項目で「開始都市」を選択してください。<a href=\"#6\">次の項目</a>へ

<table class=\"bgc884422\" width=\"590\">
<tr class=\"bgcF8F0E8\"><td class=\"bgcFFF8F0\" width=\"190\">
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
</td><td width=\"400\">
<object data=\"./w_db/map.html\" type=\"text/html\" width=\"400\" height=\"515\">オブジェクトタグに対応していない方は下のリンクで新しい窓を開いてください。<br /><a href=\"./w_db/map.html\" target=\"_blank\">勢力図</a></object>
</td></tr>
</table>


<br /><br /><br /><br />
<br /><br /><br /><br /><a id=\"6\"></a>空白地を選択した場合、「国名、賊名、天子、国の色」の四点を記入したら<a href=\"#7\">次の項目</a>へ
<table width=\"590\" class=\"bgc884422\">
<tr class=\"bgc884422\"><td class=\"txth\" width=\"45\"></td><td class=\"txth\" width=\"545\"></td></tr>
<tr class=\"bgcFFF0F5\"><td class=\"txth\" colspan=\"2\">建国</td></tr>
<tr class=\"bgcF8F0E0\"><td>国名</td><td class=\"bgcFFF8F0\"><input type=\"text\" name=\".kokumei.\" size=\"30\" value=\"$in{'kokumei'}\" /><br />・新国家の名称を決めてください。<br /> [全角大文字で１～８文字]</td></tr>
<tr class=\"bgcF8F0E0\"><td>賊名</td><td class=\"bgcFFF8F0\"><input type=\"text\" name=\".zokumei.\" size=\"30\" value=\"$in{'zokumei'}\" /><br />・賊砦でスタートする場合、建国成功後の新国家の名称と共に、<br />賊の名称を決めてください。<br /> [全角大文字で１～８文字以内]/末尾に（○○賊）\表示\は有りません。</td></tr>
<tr class=\"bgcF8F0E0\"><td>天子</td><td class=\"bgcFFF8F0\"><input type=\"text\" name=\".mes.\" size=\"30\" value=\"$in{'mes'}\" /><br />・新国家の皇帝となる天子の名称を決めてください。<br />国の最高位である天子はNPC（コンピューター）が担当致します。<br /> [全角大文字で１～８文字以内]/例：霊帝。楓姫。</td></tr>
<tr><td class=\"bgcF8F0E0\">国の色</td><td class=\"bgcFFF8F0\">$eleele・国の色を決めてください。</td></tr>

</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br /><a id=\"7\"></a>

<table width=\"590\" class=\"bgc884422\">
<tr class=\"bgcFFF8F0\"><td class=\"txtc\">

<br />最後に簡単な登録審査を行っています。（ゲームの登録に必須）<br />プレイされる方は下記の問いに答えてから登録ボタンを押して下さい。<br />
<br /><hr />
<!-- バグなどのトラブルがあったときの報告先は？（正解必須項目）<br />
<input type=\"radio\" name=\".toi.\" value=\"1\"${"s1t1"} />ゲーム内・掲示板
<input type=\"radio\" name=\".toi.\" value=\"2\"${"s1t2"} />ゲーム内・会議室
<input type=\"radio\" name=\".toi.\" value=\"3\"${"s1t3"} />管理人のメールアドレス
<input type=\"radio\" name=\".toi.\" value=\"4\"${"s1t4"} />管理人の掲示板<br />
<input type=\"radio\" name=\".toi.\" value=\"5\"${"s1t5"} />カスタマーズセンター
<input type=\"radio\" name=\".toi.\" value=\"6\"${"s1t6"} />サポートダイアル
<input type=\"radio\" name=\".toi.\" value=\"7\"${"s1t7"} />報告の必要なし
<input type=\"radio\" name=\".toi.\" value=\"8\"${"s1t8"} />ゲーム内・バグ報告フォーム
-->
<br /><br /><hr />


<input type=\"hidden\" name=\".tyekku.\" value=\"$in{'tyekku'}\" /><a href=\"./ksmanualf.html#5\" target=\"_blank\"><span class=\"cFF0000\">$GAME_TITLE利用規約</span></a>に同意しますか？
<br />
<br />
<input type=\"radio\" name=\".doui.\" value=\"1\"${"sdt1"} />同意する<br />
<input type=\"radio\" name=\".doui.\" value=\"0\"${"sdt0"} />同意しない<br /><br /><hr /><br />

<br /><br /><input type=\"hidden\" name=\".m.\" value=\"entry2\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"$in{'tyekku'}\" />
<input type=\"submit\" value=\"～ 《 登録 》 ～\" />

</td></tr>

</table>
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />

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