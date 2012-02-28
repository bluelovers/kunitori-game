
sub MOVE {

	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
require "./$mpg_r/sub_db/kanbu.pl";

				&KANBU_NAME;

	if($k_kunino{$fk_id} < 1){
&ER1("在野武将はこのコマンドを使えません。");
	}

if($p_kuni_sikan_nensuu{$f_id} < 100 and !$k_kokka_keitai{$fk_id}){
&ER1("仕官年数（従年数）100年以上の武将にしか使えません。");
	}

	if($p_kuni_yakusyoku{$f_id}){
		$rank_mes = "【${$zokukanbuptn}[$p_kuni_yakusyoku{$f_id}]】";
	}

	if($k_yakusyoku_id{$fk_id}[1] eq "$f_id"){
		$rank_mes = "${$zokukanbuptn}[1]";
	}elsif($k_yakusyoku_id{$fk_id}[2] eq "$f_id"){
		$rank_mes = "${$zokukanbuptn}[2]";
	}elsif($k_yakusyoku_id{$fk_id}[3] eq "$f_id"){
		$rank_mes = "${$zokukanbuptn}[3]";
	}elsif($k_yakusyoku_id{$fk_id}[4] eq "$f_id"){
		$rank_mes = "${$zokukanbuptn}[4]";
	}elsif($k_yakusyoku_id{$fk_id}[5] eq "$f_id"){
		$rank_mes = "${$zokukanbuptn}[5]";
	}elsif($k_yakusyoku_id{$fk_id}[6] eq "$f_id"){
		$rank_mes = "${$zokukanbuptn}[6]";
	}elsif($k_yakusyoku_id{$fk_id}[7] eq "$f_id"){
		$rank_mes = "${$zokukanbuptn}[7]";
	}elsif($k_yakusyoku_id{$fk_id}[10] eq "$f_id"){
		$rank_mes = "${$zokukanbuptn}[10]";
	}elsif($k_yakusyoku_id{$fk_id}[8] eq "$f_id"){
		$rank_mes = "${$zokukanbuptn}[8]";
	}elsif($k_yakusyoku_id{$fk_id}[9] eq "$f_id"){
		$rank_mes = "${$zokukanbuptn}[9]";
	}elsif($k_yakusyoku_id{$fk_id}[15] eq "$f_id"){
		$rank_mes = "${$zokukanbuptn}[15]";
	}elsif($k_yakusyoku_id{$fk_id}[11] eq "$f_id"){
		$rank_mes = "${$zokukanbuptn}[11]";
	}elsif($k_yakusyoku_id{$fk_id}[12] eq "$f_id"){
		$rank_mes = "${$zokukanbuptn}[12]";
	}elsif($k_yakusyoku_id{$fk_id}[13] eq "$f_id"){
		$rank_mes = "${$zokukanbuptn}[13]";
	}elsif($k_yakusyoku_id{$fk_id}[14] eq "$f_id"){
		$rank_mes = "${$zokukanbuptn}[14]";
	}
	if($rank_mes ne ""){&ER1("既に何らかの役職についています。");}

								$jfl = int($p_tousotu{$f_id} * 300 / ($p_tousotu{$f_id} + $p_buryoku{$f_id} + $p_tiryoku{$f_id}));
								$jfs = int($p_buryoku{$f_id} * 300 / ($p_tousotu{$f_id} + $p_buryoku{$f_id} + $p_tiryoku{$f_id}));
								$jfi = int($p_tiryoku{$f_id} * 300 / ($p_tousotu{$f_id} + $p_buryoku{$f_id} + $p_tiryoku{$f_id}));
	if($k_yakusyoku_id{$fk_id}[1] eq "" and $k_kokka_keitai{$fk_id}){
		$k_yakusyoku_id{$fk_id}[1] = $f_id;
		$rank_mes = "${$zokukanbuptn}[1]";
$p_kuni_yakusyoku{$f_id} = 1;
	}elsif($k_yakusyoku_id{$fk_id}[2] eq "" and $k_kokka_keitai{$fk_id}){
		$k_yakusyoku_id{$fk_id}[2] = $f_id;
		$rank_mes = "${$zokukanbuptn}[2]";
$p_kuni_yakusyoku{$f_id} = 2;
	}elsif($k_yakusyoku_id{$fk_id}[3] eq "" and $k_kokka_keitai{$fk_id}){
		$k_yakusyoku_id{$fk_id}[3] = $f_id;
		$rank_mes = "${$zokukanbuptn}[3]";
$p_kuni_yakusyoku{$f_id} = 3;
	}elsif($k_yakusyoku_id{$fk_id}[7] eq "" and ($jfs>129 or $jfl>129)){
		$k_yakusyoku_id{$fk_id}[7] = $f_id;
		$rank_mes = "${$zokukanbuptn}[7]";
$p_kuni_yakusyoku{$f_id} = 7;
	}elsif($k_yakusyoku_id{$fk_id}[4] eq "" and $jfi>129 and !$k_kokka_keitai{$fk_id}){
		$k_yakusyoku_id{$fk_id}[4] = $f_id;
		$rank_mes = "${$zokukanbuptn}[4]";
$p_kuni_yakusyoku{$f_id} = 4;
	}elsif($k_yakusyoku_id{$fk_id}[5] eq "" and $jfi>129 and !$k_kokka_keitai{$fk_id}){
		$k_yakusyoku_id{$fk_id}[5] = $f_id;
		$rank_mes = "${$zokukanbuptn}[5]";
$p_kuni_yakusyoku{$f_id} = 5;
	}elsif($k_yakusyoku_id{$fk_id}[6] eq "" and $jfi>129 and !$k_kokka_keitai{$fk_id}){
		$k_yakusyoku_id{$fk_id}[6] = $f_id;
		$rank_mes = "${$zokukanbuptn}[6]";
$p_kuni_yakusyoku{$f_id} = 6;
	}elsif($k_yakusyoku_id{$fk_id}[10] eq "" and ($jfs>129 or $jfl>129)){
		$k_yakusyoku_id{$fk_id}[10] = $f_id;
		$rank_mes = "${$zokukanbuptn}[10]";
$p_kuni_yakusyoku{$f_id} = 10;
	}elsif($k_yakusyoku_id{$fk_id}[8] eq "" and ($jfs>129 or $jfl>129)){
		$k_yakusyoku_id{$fk_id}[8] = $f_id;
		$rank_mes = "${$zokukanbuptn}[8]";
$p_kuni_yakusyoku{$f_id} = 8;
	}elsif($k_yakusyoku_id{$fk_id}[9] eq "" and ($jfs>129 or $jfl>129)){
		$k_yakusyoku_id{$fk_id}[9] = $f_id;
		$rank_mes = "${$zokukanbuptn}[9]";
$p_kuni_yakusyoku{$f_id} = 9;
	}elsif($k_yakusyoku_id{$fk_id}[11] eq "" and ($jfs>129 or $jfl>129)){
		$k_yakusyoku_id{$fk_id}[11] = $f_id;
		$rank_mes = "${$zokukanbuptn}[11]";
$p_kuni_yakusyoku{$f_id} = 11;
	}elsif($k_yakusyoku_id{$fk_id}[12] eq "" and ($jfs>129 or $jfl>129)){
		$k_yakusyoku_id{$fk_id}[12] = $f_id;
		$rank_mes = "${$zokukanbuptn}[12]";
$p_kuni_yakusyoku{$f_id} = 12;
	}elsif($k_yakusyoku_id{$fk_id}[13] eq "" and ($jfs>129 or $jfl>129)){
		$k_yakusyoku_id{$fk_id}[13] = $f_id;
		$rank_mes = "${$zokukanbuptn}[13]";
$p_kuni_yakusyoku{$f_id} = 13;
	}elsif($k_yakusyoku_id{$fk_id}[14] eq "" and ($jfs>129 or $jfl>129)){
		$k_yakusyoku_id{$fk_id}[14] = $f_id;
		$rank_mes = "${$zokukanbuptn}[14]";
$p_kuni_yakusyoku{$f_id} = 14;
	}elsif($k_yakusyoku_id{$fk_id}[19] eq ""){
		$k_yakusyoku_id{$fk_id}[19] = $f_id;
		$rank_mes = "${$zokukanbuptn}[19]";
$p_kuni_yakusyoku{$f_id} = 19;
	}elsif($k_yakusyoku_id{$fk_id}[20] eq ""){
		$k_yakusyoku_id{$fk_id}[20] = $f_id;
		$rank_mes = "${$zokukanbuptn}[20]";
$p_kuni_yakusyoku{$f_id} = 20;
	}elsif($k_yakusyoku_id{$fk_id}[21] eq ""){
		$k_yakusyoku_id{$fk_id}[21] = $f_id;
		$rank_mes = "${$zokukanbuptn}[21]";
$p_kuni_yakusyoku{$f_id} = 21;
	}elsif($k_yakusyoku_id{$fk_id}[22] eq ""){
		$k_yakusyoku_id{$fk_id}[22] = $f_id;
		$rank_mes = "${$zokukanbuptn}[22]";
$p_kuni_yakusyoku{$f_id} = 22;
	}elsif($k_yakusyoku_id{$fk_id}[23] eq ""){
		$k_yakusyoku_id{$fk_id}[23] = $f_id;
		$rank_mes = "${$zokukanbuptn}[23]";
$p_kuni_yakusyoku{$f_id} = 23;
	}elsif($k_yakusyoku_id{$fk_id}[24] eq ""){
		$k_yakusyoku_id{$fk_id}[24] = $f_id;
		$rank_mes = "${$zokukanbuptn}[24]";
$p_kuni_yakusyoku{$f_id} = 24;
	}elsif($k_yakusyoku_id{$fk_id}[25] eq ""){
		$k_yakusyoku_id{$fk_id}[25] = $f_id;
		$rank_mes = "${$zokukanbuptn}[25]";
$p_kuni_yakusyoku{$f_id} = 25;
	}elsif($k_yakusyoku_id{$fk_id}[26] eq ""){
		$k_yakusyoku_id{$fk_id}[26] = $f_id;
		$rank_mes = "${$zokukanbuptn}[26]";
$p_kuni_yakusyoku{$f_id} = 26;
	}elsif($k_yakusyoku_id{$fk_id}[27] eq ""){
		$k_yakusyoku_id{$fk_id}[27] = $f_id;
		$rank_mes = "${$zokukanbuptn}[27]";
$p_kuni_yakusyoku{$f_id} = 27;
	}else{
&ER1("全ての役職が埋まってしまっていますorあなたに相応しい役職が残っていません。必要能力値と国の詳細情報の方をご確認ください。");
	}

	&TT_GET;
&F_LOCK;

	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);
	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$old_date = "<a href=\"./mapr/$yymaprid\">$old_date</a>";

		$tname = "新・$rank_mes";
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]自己推薦により、$k_p_k_a{$p_kunino{$f_id}}の$rank_mesに就任する。");
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$f_id}が新たな$rank_mesとなる。");



	

	&K_SAVE("kuni_db","$fk_id","$fk_id");
	open(IN,"./p_db/tt/ktms4$f_id.cgi");
	@KTM = <IN>;
	close(IN);
	($ktms4,$ktms4w,$tmtmit,$tmtmw1,$tmtmw2,$tmtmw3) = split(/<>/,$KTM[0]);
	@KTM=();
			$ktms4=1;
	unshift(@KTM,"$ktms4<>$ktms4w<>$tmtmit<>$tmtmw1<>$tmtmw2<>$tmtmw3<>\n");
	open(OUT,">./p_db/tt/ktms4$f_id.cgi");
	print OUT @KTM;
	close(OUT);


	$p_exyabou{$f_id} += 5;

	&P_SAVE("p","$f_id","$f_id");

	&UNLOCK_FILE;

	&CD_END("$p_name{$f_id}が$k_name_d[$p_kunino{$f_id}]の$tnameに就任しました。","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"submit\" value=\"ＯＫ\" />","");#CD_END

	exit;

}




1;