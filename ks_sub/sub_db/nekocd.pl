
require "$mpg_r/sub_db/nekos.pl";

############

sub TAJYUU_HANTEI2 {


if($in{'id'} ne "-$mpass"){

	open(IN,"./w_db/guest/$p_kunino{$f_id}.cgi");
	@GUEST_IN=<IN>;
	close(IN);

	@m_list = ();$hit=0;$hit2=0;

			$i = 0;
			$p = 0;
	while($i - $p <= $#GUEST_IN){
			$add = $i - $p;
($guest_time,$guest_name,$guest_kuni,$guest_taizai,$guest_id) = split(/<>/,$GUEST_IN[$add]);
		if($tt - 1800 > $guest_time and $p_id{$f_id} eq $guest_id){
			$hit2=1;$hit=1;
splice(@GUEST_IN , $i - $p, 1);
			$p ++;
		}elsif($p_id{$f_id} eq $guest_id){
splice(@GUEST_IN , $i - $p, 1);
			$p ++;$hit=1;
		}elsif($tt - 1800 > $guest_time){
splice(@GUEST_IN , $i - $p, 1);
			$p ++;
		}else{
				$m_list .= "<a href=./?.m.=p_b&amp;.id.=$guest_id target=\"_blank\"><span class=\"c000000\">$guest_name</span></a>〔$t_name[$guest_taizai]〕 ";
		}
			$i ++;
	}
		push(@GUEST_IN,"$tt<>$p_name{$f_id}<>$p_kunino{$f_id}<>$p_taizai_iti{$f_id}<>$f_id<>\n");
		$m_list .= "<a href=./?.m.=p_b&amp;.id.=$p_id{$f_id} target=\"_blank\"><span class=\"c000000\">$p_name{$f_id}</span></a>〔$t_name[$p_taizai_iti{$f_id}]〕 ";
	if(!$hit){$hit2=1;
	}
			if($hit2 == 1){ 
	open(OUT,">./w_db/guest/$p_kunino{$f_id}.cgi");
	print OUT @GUEST_IN;
	close(OUT);

&HOST_NAME;
	&TT_GET;
&GET_COOKIE;

if(!$cniti) {
	 	&ER1("クッキーの送受信が確認できません。ブラウザの設定で「クッキーを受け入れる」にするか、PCの設定を見直してください。問題が解決されない場合は、クッキーを一度削除してみてください。");
}
if($ckhost ne $host) {
$nekonyantyekku=1;
}
			$d_id = $ckid;
$d_id =~ tr/A-Z/a-z/;
	open(IN,"./p_db/tt/$f_id.cgi");
	@CN_DATATM = <IN>;
	close(IN);
	($apontm,$apontmk,$apontmip) = split(/<>/,$CN_DATATM[0]);

			if($hfip < 1 and -e "./ip_db/giwaku/$f_id.cgi"){
							unlink("./ip_db/giwaku/$f_id.cgi");

				if($ckhost eq "" or $cktime ne $apontm and $p_tuusan_nensuu{$f_id} < 15){
			$apontmj = $apontm + 86400 - $tt;




	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);
	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$old_date = "<a href=./mapr/$yymaprid>$old_date</a>";


		$fk_id = $p_kunino{$f_id};
 if (!$k_id{$fk_id}) {
	&K_OPEN("kuni_db","$fk_id","$fk_id");
 }

			$apontm = $tt - 200000;
			$apontmk += 10;

			$apontmip = $host;
	@NEW_COMTM=();
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$f_id.cgi");
	print OUT @NEW_COMTM;
	close(OUT);

require "./$mpg_r/sub_db/kanbu.pl";
require "./$mpg_r/sub_db/kakuduke.pl";

	&KUNI_KAKUDUKE("$f_id","$fk_id","$fk_id");
$p_kuni_yakusyoku{$w_id} = 0;
	&BL_SAVE("bl","$f_id","$f_id");


	$cktime = "";
	$ckhost = "";
	$ckid = "";
&SET_COOKIE;
	 	&ER1("登録直後にクッキーをロストしたので貴方のIDのクッキー発行回数が10増えました。クッキー再発行は前回送ったクッキーと内容が一致しない時に起こります。再度プレイされる人は、PCの設定を見直してください。");
				}
			}

		if($hfip < 1 and $apontm eq ""){
			$apontm = $tt - 200000;

			$apontmip = $host;
	@NEW_COMTM=();
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$f_id.cgi");
	print OUT @NEW_COMTM;
	close(OUT);
		}elsif($hfip < 1 and $apontmk < 30 and $ckhost eq ""){
			$apontmk += 1;
			$apontmip = $host;


###########

	open(IN,"./ip_db/ip/ck$host.cgi");
	@CN_DATATM = <IN>;
	close(IN);
	($ckipid,$ckiptm,$ckiphost) = split(/<>/,$CN_DATATM[0]);

 if ($hosta and $ckiphost =~ /\Q$hosta\E/) {
 $hosta = $ckiphost;
 }
 if ($ckiphost and $hosta =~ /\Q$ckiphost\E/) {
 $ckiphost = $hosta;
 }
			$d_id = $ckipid;
$d_id =~ tr/A-Z/a-z/;

		if($tt < $ckiptm + 86400 and $f_id ne $d_id and $hosta eq $ckiphost and -e "./p_db/p/$d_id.cgi"){
			$apontmj = $apontm + 86400 - $tt;

			unlink("./ip_db/ip/ck$host.cgi");

			$apontm = $tt - 200000;
			$apontmk += 10;
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$f_id.cgi");
	print OUT @NEW_COMTM;
	close(OUT);

	open(IN,"./p_db/tt/$d_id.cgi");
	@CN_DATATM = <IN>;
	close(IN);
	($apontm,$apontmk,$apontmip) = split(/<>/,$CN_DATATM[0]);
	@NEW_COMTM=();
			$apontm = $tt - 300000;
			$apontmk += 10;
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$d_id.cgi");
	print OUT @NEW_COMTM;
	close(OUT);

	open(IN,"./p_db/tt/$f_id.cgi");
	@CN_DATATM = <IN>;
	close(IN);
	($apontm,$apontmk,$apontmip) = split(/<>/,$CN_DATATM[0]);

unlink ("./p_db/touketu/$f_id.cgi");
rename ("./p_db/p/$f_id.cgi", "./p_db/touketu/$f_id.cgi");
	@NEW_DATA=();
		$p_jikan{$f_id}=$tt +86400;



	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);
	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$old_date = "<a href=./mapr/$yymaprid>$old_date</a>";


		$fk_id = $p_kunino{$f_id};
 if (!$k_id{$fk_id}) {
	&K_OPEN("kuni_db","$fk_id","$fk_id");
 }

require "./$mpg_r/sub_db/kanbu.pl";
require "./$mpg_r/sub_db/kakuduke.pl";

	&KUNI_KAKUDUKE("$f_id","$fk_id","$fk_id");
$p_kuni_yakusyoku{$w_id} = 0;
	&TOUKETU_SAVE("touketu","$f_id","$f_id");

	if(-e "./p_db/p/$d_id.cgi"){
&P_READ("p","$d_id","$d_id");
	}elsif(-e "./p_db/touketu/$d_id.cgi"){
&P_READ("touketu","$d_id","$d_id");
	}else{
$d_id = "";
	}

unlink ("./p_db/touketu/$d_id.cgi");
rename ("./p_db/p/$d_id.cgi", "./p_db/touketu/$d_id.cgi");
	@NEW_DATA=();
		$p_jikan{$d_id}=$tt +86400;


	open(IN,"./p_db/my_log/$p_id{$d_id}.cgi");
	@F_LOG = <IN>;
	close(IN);

	unshift(@F_LOG,"$p_name{$f_id}との多重登録疑惑が濃厚になったため、貴方のIDと $p_name{$f_id}のデータはペナルティ付き凍結処理となりました。<br />多重登録や複数人が操作する環境からのアクセスは禁じられています。<br />この警告はまれに誤報があります。誤報が起きた方はなるべくクッキーを消さないよう気をつけてください。$tt_date\n");

	splice(@F_LOG,200);

	open(OUT,">./p_db/my_log/$p_id{$d_id}.cgi");
	print OUT @F_LOG;
	close(OUT);

	open(IN,"./p_db/my_log/$f_id.cgi");
	@F_LOG = <IN>;
	close(IN);

	unshift(@F_LOG,"$p_name{$d_id}との多重登録疑惑が濃厚になったため、貴方のIDと $p_name{$d_id}のデータはペナルティ付き凍結処理となりました。<br />多重登録や複数人が操作する環境からのアクセスは禁じられています。<br />この警告はまれに誤報があります。誤報が起きた方はなるべくクッキーを消さないよう気をつけてください。$tt_date\n");

	splice(@F_LOG,200);

	open(OUT,">./p_db/my_log/$f_id.cgi");
	print OUT @F_LOG;
	close(OUT);

	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);
	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$old_date = "<a href=./mapr/$yymaprid>$old_date</a>";


require "./$mpg_r/sub_db/kanbu.pl";
require "./$mpg_r/sub_db/kakuduke.pl";
		$dk_id = $p_kunino{$d_id};
 if (!$k_id{$dk_id}) {
	&K_OPEN("kuni_db","$dk_id","$dk_id");
 }


	&KUNI_KAKUDUKE("$d_id","$dk_id","$dk_id");
$p_kuni_yakusyoku{$w_id} = 0;

	&TOUKETU_SAVE("touketu","$d_id","$d_id");

		$add=int(rand(20)+75);
		$add2=int(rand(5))+1;
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>緊急事態発生みたい！ヽ(ゝ_ヾ)/ 多重登録している人がいるかも！.");
#	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>・・多重チェックを掻い潜ろうとしている可能性・・有り");
#	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>娘々はそんなに甘くないのら・・");
#	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>不正者に裁きの鉄槌を！");
#	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>高感度状況分析ルーチンVol.$add2起動・・・");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>確証はないけど・・自動で応急処置開始するです！");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>容疑⇒多重登録疑惑濃厚（重複指数$add％）");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>対象者⇒$p_name{$f_id}＆ $p_name{$d_id}");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>貴方を・・犯人です！");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>$p_name{$f_id}と $p_name{$d_id}のデータをペナルティ付き凍結処理にしたのら～。");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>猫々娘々が推奨するペナルティ内容はこれ（´ー`)つ「クッキー発行回数＋10回」＆「24時間行動力拘束ボーナス」＆「役職初期化」");

	@NEW_CD_DB = ();
		$i = 0;
		while($i < $MAX_CD){
			push(@NEW_CD_DB,"0<><>休暇をとる<>$tt<><><><>\n");
			$i++;
		}
	open(OUT,">./p_db/cd/$f_id.cgi");
	print OUT @NEW_CD_DB;
	close(OUT);
	@NEW_CD_DB = ();
			push(@NEW_CD_DB,"$tt<>$f_id<><><><>\n");
	open(OUT,">./ip_db/giwaku/$f_id.cgi");
	print OUT @NEW_CD_DB;
	close(OUT);

	@NEW_CD_DB = ();
		$i = 0;
		while($i < $MAX_CD){
			push(@NEW_CD_DB,"0<><>休暇をとる<>$tt<><><><>\n");
			$i++;
		}
	open(OUT,">./p_db/cd/$p_id{$d_id}.cgi");
	print OUT @NEW_CD_DB;
	close(OUT);
	@NEW_CD_DB = ();
			push(@NEW_CD_DB,"$tt<>$p_id{$d_id}<><><><>\n");
	open(OUT,">./ip_db/giwaku/$p_id{$d_id}.cgi");
	print OUT @NEW_CD_DB;
	close(OUT);
	$cktime = "";
	$ckhost = "";
	$ckid = "";
&SET_COOKIE;
	 	&ER1("$p_name{$d_id}との多重登録疑惑が濃厚になったため、貴方のIDと $p_name{$d_id}のデータはペナルティ付き凍結処理となりました。<br />多重登録や複数人が操作する環境からのアクセスは禁じられています。<br />この警告はまれに誤報があります。誤報が起きた方はなるべくクッキーを消さないよう気をつけてください。");

	exit;
		}else{
			$ckiphost = $hosta;
			$ckipid = $f_id;
			$ckiptm = $tt;
	@NEW_COMTM=();
	unshift(@NEW_COMTM,"$ckipid<>$ckiptm<>$ckiphost<>\n");
	open(OUT,">./ip_db/ip/ck$host.cgi");
	print OUT @NEW_COMTM;
	close(OUT);
		}

###########

	@NEW_COMTM=();
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$f_id.cgi");
	print OUT @NEW_COMTM;
	close(OUT);
	$cktime = $apontm;
	$ckhost = $host;
	$ckid = $f_id;
&SET_COOKIE;
#require "./$mpg_r/sub_db/jyuu.pl";
#&TAJYUU_HANTEI0;
	 	&ER3("クッキーが読み取れないorクッキー情報が一致しないためクッキーを再発行しました。<br /><br />$p_name{$f_id}さんのクッキー発行回数/$apontmk回（注：30回でID削除）<br /><br />クッキー設定がオフの場合は、ブラウザの設定でクッキーを受け入れるにしてください。");

		}elsif($hfip < 1 and $apontmk < 30 and $cktime ne $apontm and $d_id){

	open(IN,"./p_db/tt/$d_id.cgi");
	@CN_DATATM = <IN>;
	close(IN);
	($a2pontm,$a2pontmk,$a2pontmip) = split(/<>/,$CN_DATATM[0]);
##########
		if($a2pontm and $a2pontm eq $cktime and $f_id ne $d_id and ($a2pontmip eq $host or $a2pontmip eq $ckhost) and ($apontmip eq $host or $apontmip eq $ckhost) and ((-e "./p_db/p/$d_id.cgi") or (-e "./p_db/touketu/$d_id.cgi"))){
			$apontmj = $apontm + 86400 - $tt;



	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);
	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$old_date = "<a href=./mapr/$yymaprid>$old_date</a>";


		$fk_id = $p_kunino{$f_id};
 if (!$k_id{$fk_id}) {
	&K_OPEN("kuni_db","$fk_id","$fk_id");
 }
							unlink("./p_db/p/$f_id.cgi");
			unlink("./p_db/tt/$f_id.cgi");

require "./$mpg_r/sub_db/kanbu.pl";
require "./$mpg_r/sub_db/kakuduke.pl";

	&KUNI_KAKUDUKE("$f_id","$fk_id","$fk_id");
$p_kuni_yakusyoku{$w_id} = 0;
	&BL_SAVE("bl","$f_id","$f_id");

	if(-e "./p_db/p/$d_id.cgi"){
&P_READ("p","$d_id","$d_id");
	}elsif(-e "./p_db/touketu/$d_id.cgi"){
&P_READ("touketu","$d_id","$d_id");
	}else{
$d_id = "";
	}


	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);
	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$old_date = "<a href=./mapr/$yymaprid>$old_date</a>";



require "./$mpg_r/sub_db/kanbu.pl";
require "./$mpg_r/sub_db/kakuduke.pl";
		$dk_id = $p_kunino{$d_id};
 if (!$k_id{$dk_id}) {
	&K_OPEN("kuni_db","$dk_id","$dk_id");
 }


	&KUNI_KAKUDUKE("$d_id","$dk_id","$dk_id");
$p_kuni_yakusyoku{$w_id} = 0;
	&BL_SAVE("bl","$d_id","$d_id");
							unlink("./p_db/p/$d_id.cgi");
							unlink("./p_db/touketu/$d_id.cgi");
			unlink("./p_db/tt/$d_id.cgi");


	$cktime = "";
	$ckhost = "";
	$ckid = "";
&SET_COOKIE;
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>緊急事態発生みたい！ヽ(ゝ_ヾ)/ 多重登録している人がいるよ！..");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>自動で応急処置開始するです！");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>容疑⇒多重登録");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>対象者⇒$p_name{$f_id}＆ $p_name{$d_id}");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>貴方を・・犯人です！");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>$p_name{$f_id}と $p_name{$d_id}のデータを抹消したのら～。");
	 	&ER1("$p_name{$d_id}との多重容疑が発覚したため、貴方のIDと $p_name{$d_id}は削除されました。多重登録や複数人が操作する環境からのアクセスは禁じられています。");

	exit;
		}
###########
			$apontmk += 1;
			$apontmip = $host;
	@NEW_COMTM=();
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$f_id.cgi");
	print OUT @NEW_COMTM;
	close(OUT);
	$cktime = $apontm;
	$ckhost = $host;
	$ckid = $f_id;
&SET_COOKIE;
#require "./$mpg_r/sub_db/jyuu.pl";
#&TAJYUU_HANTEI0;
	 	&ER3("クッキーが読み取れないorクッキー情報が一致しないためクッキーを再発行しました。<br /><br />$p_name{$f_id}さんのクッキー発行回数/$apontmk回（注：30回でID削除）<br /><br />クッキー設定がオフの場合は、ブラウザの設定でクッキーを受け入れるにしてください。");

		}elsif($hfip < 1 and $apontmk >= 30 and ($ckhost eq "" or $cktime ne $apontm)){
			$apontm = $tt;$apontmk += 1;

			$apontmip = $host;
	@NEW_COMTM=();
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$f_id.cgi");
	print OUT @NEW_COMTM;
	close(OUT);
		}

		if($hfip < 1 and $apontm + 86400 > $tt){
			$apontmj = $apontm + 86400 - $tt;




	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);
	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$old_date = "<a href=./mapr/$yymaprid>$old_date</a>";


		$fk_id = $p_kunino{$f_id};
 if (!$k_id{$fk_id}) {
	&K_OPEN("kuni_db","$fk_id","$fk_id");
 }
							unlink("./p_db/p/$f_id.cgi");
			unlink("./p_db/tt/$f_id.cgi");

require "./$mpg_r/sub_db/kanbu.pl";
require "./$mpg_r/sub_db/kakuduke.pl";


	&KUNI_KAKUDUKE("$f_id","$fk_id","$fk_id");
$p_kuni_yakusyoku{$w_id} = 0;
	&BL_SAVE("bl","$f_id","$f_id");

	$cktime = "";
	$ckhost = "";
	$ckid = "";
&SET_COOKIE;
	 	&MAP_LOG("[クッキー再発行回数30回突破]$f_id：$p_name{$f_id}は削除されました。");
	 	&ER1("クッキー再発行回数が30回突破したので貴方のIDは削除されました。クッキー再発行は前回送ったクッキーと内容が一致しない時に起こります。再度プレイされる人は、PCの設定を見直してください。");
		}

if($nekonyantyekku) {
&NKONYANS;
}

			if($kasouhit and $kasou1ip ne $host_name){ 
&TT_GET;
	@KTM=();
	unshift(@KTM,"$kasouid<>$kasoupass<>$f_id<>$host_name<>$tt_date<>$kasou1ip<>$kasou1tt<>$kasou2ip<>$kasou2tt<>\n");
	open(OUT,">./p_db/id/$kasouid.cgi");
	print OUT @KTM;
	close(OUT);
			}
#require "./$mpg_r/sub_db/jyuu.pl";
#&TAJYUU_HANTEI0;
	$cktime = $apontm;
	$ckhost = $host;
	$ckid = $f_id;
&SET_COOKIE;

			}



}
}



############
sub TAJYUU_HANTEI {

if($in{'id'} ne "-$mpass"){
&HOST_NAME;
	&TT_GET;
&GET_COOKIE;


if(!$cniti) {
	 	&ER1("クッキーの送受信が確認できません。ブラウザの設定で「クッキーを受け入れる」にするか、PCの設定を見直してください。");
}
if($ckhost ne $host) {
$nekonyantyekku=1;
}
	open(IN,"./w_db/guest/$p_kunino{$f_id}.cgi");
	@GUEST_IN=<IN>;
	close(IN);

	@m_list = ();$hit=0;$hit2=0;@NEW_G_LIST=();

	open(IN,"./p_db/tt/$f_id.cgi");
	@CN_DATATM = <IN>;
	close(IN);
	($apontm,$apontmk,$apontmip) = split(/<>/,$CN_DATATM[0]);

			if($hfip < 1 and -e "./ip_db/giwaku/$f_id.cgi"){
							unlink("./ip_db/giwaku/$f_id.cgi");

				if($ckhost eq "" or $cktime ne $apontm and $p_tuusan_nensuu{$f_id} < 15){
			$apontmj = $apontm + 86400 - $tt;




	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);
	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$old_date = "<a href=./mapr/$yymaprid>$old_date</a>";


		$fk_id = $p_kunino{$f_id};
 if (!$k_id{$fk_id}) {
	&K_OPEN("kuni_db","$fk_id","$fk_id");
 }

			$apontm = $tt - 200000;
			$apontmk += 10;

			$apontmip = $host;
	@NEW_COMTM=();
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$f_id.cgi");
	print OUT @NEW_COMTM;
	close(OUT);

require "./$mpg_r/sub_db/kanbu.pl";
require "./$mpg_r/sub_db/kakuduke.pl";

	&KUNI_KAKUDUKE("$f_id","$fk_id","$fk_id");
$p_kuni_yakusyoku{$w_id} = 0;
	&BL_SAVE("bl","$f_id","$f_id");

	$cktime = "";
	$ckhost = "";
	$ckid = "";
&SET_COOKIE;
	 	&ER1("登録直後にクッキーをロストしたので貴方のIDのクッキー発行回数が10増えました。クッキー再発行は前回送ったクッキーと内容が一致しない時に起こります。再度プレイされる人は、PCの設定を見直してください。");
				}
			}
		if($hfip < 1 and $apontm eq ""){
			$apontm = $tt - 200000;
			$apontmip = $host;
	@NEW_COMTM=();
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$f_id.cgi");
	print OUT @NEW_COMTM;
	close(OUT);
		}elsif($hfip < 1 and $apontmk < 30 and $ckhost eq ""){
			$apontmk += 1;
			$apontmip = $host;

###########
	open(IN,"./ip_db/ip/ck$host.cgi");
	@CN_DATATM = <IN>;
	close(IN);
	($ckipid,$ckiptm,$ckiphost) = split(/<>/,$CN_DATATM[0]);

 if ($hosta and $ckiphost =~ /\Q$hosta\E/) {
 $hosta = $ckiphost;
 }
 if ($ckiphost and $hosta =~ /\Q$ckiphost\E/) {
 $ckiphost = $hosta;
 }
			$d_id = $ckipid;
$d_id =~ tr/A-Z/a-z/;

		if($tt < $ckiptm + 86400 and $f_id ne $d_id and $hosta eq $ckiphost and -e "./p_db/p/$d_id.cgi"){
			$apontmj = $apontm + 86400 - $tt;

			unlink("./ip_db/ip/ck$host.cgi");

			$apontm = $tt - 200000;
			$apontmk += 10;
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$f_id.cgi");
	print OUT @NEW_COMTM;
	close(OUT);

	open(IN,"./p_db/tt/$d_id.cgi");
	@CN_DATATM = <IN>;
	close(IN);
	($apontm,$apontmk,$apontmip) = split(/<>/,$CN_DATATM[0]);
			$apontm = $tt - 300000;
	@NEW_COMTM=();
			$apontmk += 10;
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$d_id.cgi");
	print OUT @NEW_COMTM;
	close(OUT);

	open(IN,"./p_db/tt/$f_id.cgi");
	@CN_DATATM = <IN>;
	close(IN);
	($apontm,$apontmk,$apontmip) = split(/<>/,$CN_DATATM[0]);

unlink ("./p_db/touketu/$f_id.cgi");
rename ("./p_db/p/$f_id.cgi", "./p_db/touketu/$f_id.cgi");
	@NEW_DATA=();
		$p_jikan{$f_id}=$tt +86400;



	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);
	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$old_date = "<a href=./mapr/$yymaprid>$old_date</a>";


		$fk_id = $p_kunino{$f_id};
 if (!$k_id{$fk_id}) {
	&K_OPEN("kuni_db","$fk_id","$fk_id");
 }

require "./$mpg_r/sub_db/kanbu.pl";
require "./$mpg_r/sub_db/kakuduke.pl";


	&KUNI_KAKUDUKE("$f_id","$fk_id","$fk_id");
$p_kuni_yakusyoku{$w_id} = 0;
	&TOUKETU_SAVE("touketu","$f_id","$f_id");


	if(-e "./p_db/p/$d_id.cgi"){
&P_READ("p","$d_id","$d_id");
	}elsif(-e "./p_db/touketu/$d_id.cgi"){
&P_READ("touketu","$d_id","$d_id");
	}else{
$d_id = "";
	}
unlink ("./p_db/touketu/$d_id.cgi");
rename ("./p_db/p/$d_id.cgi", "./p_db/touketu/$d_id.cgi");
		$p_jikan{$d_id}=$tt +86400;


	open(IN,"./p_db/my_log/$p_id{$d_id}.cgi");
	@F_LOG = <IN>;
	close(IN);

	unshift(@F_LOG,"$p_name{$f_id}との多重登録疑惑が濃厚になったため、貴方のIDと $p_name{$f_id}のデータはペナルティ付き凍結処理となりました。<br />多重登録や複数人が操作する環境からのアクセスは禁じられています。<br />この警告はまれに誤報があります。誤報が起きた方はなるべくクッキーを消さないよう気をつけてください。$tt_date\n");

	splice(@F_LOG,200);

	open(OUT,">./p_db/my_log/$p_id{$d_id}.cgi");
	print OUT @F_LOG;
	close(OUT);

	open(IN,"./p_db/my_log/$f_id.cgi");
	@F_LOG = <IN>;
	close(IN);

	unshift(@F_LOG,"$p_name{$d_id}との多重登録疑惑が濃厚になったため、貴方のIDと $p_name{$d_id}のデータはペナルティ付き凍結処理となりました。<br />多重登録や複数人が操作する環境からのアクセスは禁じられています。<br />この警告はまれに誤報があります。誤報が起きた方はなるべくクッキーを消さないよう気をつけてください。$tt_date\n");

	splice(@F_LOG,200);

	open(OUT,">./p_db/my_log/$f_id.cgi");
	print OUT @F_LOG;
	close(OUT);

	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);
	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$old_date = "<a href=./mapr/$yymaprid>$old_date</a>";


require "./$mpg_r/sub_db/kanbu.pl";
require "./$mpg_r/sub_db/kakuduke.pl";
		$dk_id = $p_kunino{$d_id};
 if (!$k_id{$dk_id}) {
	&K_OPEN("kuni_db","$dk_id","$dk_id");
 }


	&KUNI_KAKUDUKE("$d_id","$dk_id","$dk_id");
$p_kuni_yakusyoku{$w_id} = 0;
	&TOUKETU_SAVE("touketu","$d_id","$d_id");

		$add=int(rand(20)+75);
		$add2=int(rand(5));
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>緊急事態発生みたい！ヽ(ゝ_ヾ)/ 多重登録している人がいるかも！...");
#	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>・・多重チェックを掻い潜ろうとしている可能性・・有り");
#	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>娘々はそんなに甘くないのら・・");
#	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>不正者に裁きの鉄槌を！");
#	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>高感度状況分析ルーチンVol.$add2起動・・・");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>確証はないけど・・自動で応急処置開始するです！");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>容疑⇒多重登録疑惑濃厚（重複指数$add％）");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>対象者⇒$p_name{$f_id}＆ $p_name{$d_id}");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>貴方を・・犯人です！");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>$p_name{$f_id}と $p_name{$d_id}のデータをペナルティ付き凍結処理にしたのら～。");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>猫々娘々が推奨するペナルティ内容はこれ（´ー`)つ「クッキー発行回数＋10回」＆「24時間行動力拘束ボーナス」＆「役職初期化」");

	@NEW_CD_DB = ();
		$i = 0;
		while($i < $MAX_CD){
			push(@NEW_CD_DB,"0<><>休暇をとる<>$tt<><><><>\n");
			$i++;
		}
	open(OUT,">./p_db/cd/$f_id.cgi");
	print OUT @NEW_CD_DB;
	close(OUT);
	@NEW_CD_DB = ();
			push(@NEW_CD_DB,"$tt<>$f_id<><><><>\n");
	open(OUT,">./ip_db/giwaku/$f_id.cgi");
	print OUT @NEW_CD_DB;
	close(OUT);

	@NEW_CD_DB = ();
		$i = 0;
		while($i < $MAX_CD){
			push(@NEW_CD_DB,"0<><>休暇をとる<>$tt<><><><>\n");
			$i++;
		}
	open(OUT,">./p_db/cd/$p_id{$d_id}.cgi");
	print OUT @NEW_CD_DB;
	close(OUT);
	@NEW_CD_DB = ();
			push(@NEW_CD_DB,"$tt<>$p_id{$d_id}<><><><>\n");
	open(OUT,">./ip_db/giwaku/$p_id{$d_id}.cgi");
	print OUT @NEW_CD_DB;
	close(OUT);
	$cktime = "";
	$ckhost = "";
	$ckid = "";
&SET_COOKIE;
	 	&ER1("$p_name{$d_id}との多重登録疑惑が濃厚になったため、貴方のIDと $p_name{$d_id}のデータはペナルティ付き凍結処理となりました。<br />多重登録や複数人が操作する環境からのアクセスは禁じられています。<br />この警告はまれに誤報があります。誤報が起きた方はなるべくクッキーを消さないよう気をつけてください。");

	exit;
		}else{
			$ckiphost = $hosta;
			$ckipid = $f_id;
			$ckiptm = $tt;
	@NEW_COMTM=();
	unshift(@NEW_COMTM,"$ckipid<>$ckiptm<>$ckiphost<>\n");
	open(OUT,">./ip_db/ip/ck$host.cgi");
	print OUT @NEW_COMTM;
	close(OUT);
		}

###########

	@NEW_COMTM=();
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$f_id.cgi");
	print OUT @NEW_COMTM;
	close(OUT);
	$cktime = $apontm;
	$ckhost = $host;
	$ckid = $f_id;
&SET_COOKIE;
#require "./$mpg_r/sub_db/jyuu.pl";
#&TAJYUU_HANTEI0;

	 	&ER3("クッキーが読み取れないorクッキー情報が一致しないためクッキーを再発行しました。<br /><br />$p_name{$f_id}さんのクッキー発行回数/$apontmk回（注：30回でID削除）<br /><br />クッキー設定がオフの場合は、ブラウザの設定でクッキーを受け入れるにしてください。");

		}elsif($hfip < 1 and $apontmk < 30 and $cktime ne $apontm and $d_id){

	open(IN,"./p_db/tt/$d_id.cgi");
	@CN_DATATM = <IN>;
	close(IN);
	($a2pontm,$a2pontmk,$a2pontmip) = split(/<>/,$CN_DATATM[0]);
##########
		if($a2pontm and $a2pontm eq $cktime and $f_id ne $d_id and ($a2pontmip eq $host or $a2pontmip eq $ckhost) and ($apontmip eq $host or $apontmip eq $ckhost) and ((-e "./p_db/p/$d_id.cgi") or (-e "./p_db/touketu/$d_id.cgi"))){
			$apontmj = $apontm + 86400 - $tt;




	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);
	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$old_date = "<a href=./mapr/$yymaprid>$old_date</a>";


		$fk_id = $p_kunino{$f_id};
 if (!$k_id{$fk_id}) {
	&K_OPEN("kuni_db","$fk_id","$fk_id");
 }
							unlink("./p_db/p/$f_id.cgi");
			unlink("./p_db/tt/$f_id.cgi");

require "./$mpg_r/sub_db/kanbu.pl";
require "./$mpg_r/sub_db/kakuduke.pl";


	&KUNI_KAKUDUKE("$f_id","$fk_id","$fk_id");
$p_kuni_yakusyoku{$w_id} = 0;
	&BL_SAVE("bl","$f_id","$f_id");


	if(-e "./p_db/p/$d_id.cgi"){
&P_READ("p","$d_id","$d_id");
	}elsif(-e "./p_db/touketu/$d_id.cgi"){
&P_READ("touketu","$d_id","$d_id");
	}else{
$d_id = "";
	}



	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);
	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$old_date = "<a href=./mapr/$yymaprid>$old_date</a>";


require "./$mpg_r/sub_db/kanbu.pl";
require "./$mpg_r/sub_db/kakuduke.pl";
		$dk_id = $p_kunino{$d_id};
 if (!$k_id{$dk_id}) {
	&K_OPEN("kuni_db","$dk_id","$dk_id");
 }


	&KUNI_KAKUDUKE("$d_id","$dk_id","$dk_id");
$p_kuni_yakusyoku{$w_id} = 0;
	&BL_SAVE("bl","$d_id","$d_id");
							unlink("./p_db/p/$d_id.cgi");
							unlink("./p_db/touketu/$d_id.cgi");
			unlink("./p_db/tt/$d_id.cgi");



	$cktime = "";
	$ckhost = "";
	$ckid = "";
&SET_COOKIE;
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>緊急事態発生みたい！ヽ(ゝ_ヾ)/ 多重登録している人がいるよ！....");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>自動で応急処置開始するです！");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>容疑⇒多重登録");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>対象者⇒$p_name{$f_id}＆ $p_name{$d_id}");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>貴方を・・犯人です！");
	&MAP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>$p_name{$f_id}と $p_name{$d_id}のデータを抹消したのら～。");
	 	&ER1("$p_name{$d_id}との多重容疑が発覚したため、貴方のIDと $p_name{$d_id}のデータは抹消されました。<br />多重登録や複数人が操作する環境からのアクセスは禁じられています。");

	exit;
		}
###########
			$apontmk += 1;
			$apontmip = $host;
	@NEW_COMTM=();
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$f_id.cgi");
	print OUT @NEW_COMTM;
	close(OUT);
	$cktime = $apontm;
	$ckhost = $host;
	$ckid = $f_id;
&SET_COOKIE;
#require "./$mpg_r/sub_db/jyuu.pl";
#&TAJYUU_HANTEI0;
	 	&ER3("クッキーが読み取れないorクッキー情報が一致しないためクッキーを再発行しました。<br /><br />$p_name{$f_id}さんのクッキー発行回数/$apontmk回（注：30回でID削除）<br /><br />クッキー設定がオフの場合は、ブラウザの設定でクッキーを受け入れるにしてください。");

		}elsif($hfip < 1 and $apontmk >= 30 and ($ckhost eq "" or $cktime ne $apontm)){
			$apontm = $tt;$apontmk += 1;

			$apontmip = $host;
	@NEW_COMTM=();
	unshift(@NEW_COMTM,"$apontm<>$apontmk<>$apontmip<>\n");
	open(OUT,">./p_db/tt/$f_id.cgi");
	print OUT @NEW_COMTM;
	close(OUT);
		}

		if($hfip < 1 and $apontm + 86400 > $tt){
			$apontmj = $apontm + 86400 - $tt;




	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);
	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$old_date = "<a href=./mapr/$yymaprid>$old_date</a>";


		$fk_id = $p_kunino{$f_id};
 if (!$k_id{$fk_id}) {
	&K_OPEN("kuni_db","$fk_id","$fk_id");
 }
							unlink("./p_db/p/$f_id.cgi");
			unlink("./p_db/tt/$f_id.cgi");

require "./$mpg_r/sub_db/kanbu.pl";
require "./$mpg_r/sub_db/kakuduke.pl";


	&KUNI_KAKUDUKE("$f_id","$fk_id","$fk_id");
$p_kuni_yakusyoku{$w_id} = 0;
	&BL_SAVE("bl","$f_id","$f_id");

	$cktime = "";
	$ckhost = "";
	$ckid = "";
&SET_COOKIE;
	 	&MAP_LOG("[クッキー再発行回数30回突破]$f_id：$p_name{$f_id}は削除されました。");
	 	&ER1("クッキー再発行回数が30回突破したので貴方のIDは削除されました。クッキー再発行は前回送ったクッキーと内容が一致しない時に起こります。再度プレイされる人は、PCの設定を見直してください。");
		}

			$i = 0;
			$p = 0;
	while($i - $p <= $#GUEST_IN){
			$add = $i - $p;
($guest_time,$guest_name,$guest_kuni,$guest_taizai,$guest_id) = split(/<>/,$GUEST_IN[$add]);
		if($tt - 1800 > $guest_time and $p_id{$f_id} eq $guest_id){
			$hit2=1;$hit=1;
splice(@GUEST_IN , $i - $p, 1);
			$p ++;
		}elsif($p_id{$f_id} eq $guest_id){
splice(@GUEST_IN , $i - $p, 1);
			$p ++;$hit=1;
		}elsif($tt - 1800 > $guest_time){
splice(@GUEST_IN , $i - $p, 1);
			$p ++;
		}else{
				$m_list .= "<a href=./?.m.=p_b&amp;.id.=$guest_id target=\"_blank\"><span class=\"c000000\">$guest_name</span></a>〔$t_name[$guest_taizai]〕 ";
		}
			$i ++;
	}

		push(@GUEST_IN,"$tt<>$p_name{$f_id}<>$p_kunino{$f_id}<>$p_taizai_iti{$f_id}<>$f_id<>\n");
	if(!$hit){
$hit2=1;
	}
if($nekonyantyekku) {
&NKONYANS;
}
			if($hit2 == 1){ 
	open(OUT,">./w_db/guest/$p_kunino{$f_id}.cgi");
	print OUT @GUEST_IN;
	close(OUT);

			if($kasouhit and $kasou1ip ne $host_name and $kasouid){ 
&TT_GET;
	@KTM=();
	unshift(@KTM,"$kasouid<>$kasoupass<>$f_id<>$host_name<>$tt_date<>$kasou1ip<>$kasou1tt<>$kasou2ip<>$kasou2tt<>\n");
	open(OUT,">./p_db/id/$kasouid.cgi");
	print OUT @KTM;
	close(OUT);
			unlink("./p_db/id/.cgi");
			}
#require "./$mpg_r/sub_db/jyuu.pl";
#&TAJYUU_HANTEI0;
	$cktime = $apontm;
	$ckhost = $host;
	$ckid = $f_id;
&SET_COOKIE;
			}



}
}


1;
