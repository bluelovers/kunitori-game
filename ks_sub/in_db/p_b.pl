
sub MOVE {

require "$mpg_r/sub_db/1.pl";
require "$mpg_r/sub_db/minzoku.pl";
require "./$mpg_r/sub_db/ad_file.pl";

require "$mpg_r/sub_db/p_b.pl";
require "$mpg_r/sub_db/kanbu.pl";
require "$mpg_r/sub_db/gundan_kanbu.pl";
require "$mpg_r/sub_db/butai_kanbu.pl";
$f_id = $in{'id'};
	$p_kunino{$f_id} = 0;
	if(-e "./p_db/p/$f_id.cgi"){
&P_READ("p","$f_id","$f_id");
	}elsif(-e "./p_db/touketu/$f_id.cgi"){
&P_READ("touketu","$f_id","$f_id");
	}else{
$f_id = "";
	}
	&BIJYOU_READ("$f_id");
	&HIJYOU_READ("$f_id");

	if($f_id ne ""){
	open(IN,"./p_db/tt/ktms4$f_id.cgi");
	@KTM = <IN>;
	close(IN);
	$ktms4 = 7210;
	($ktms4) = split(/<>/,$KTM[0]);
	$ktms4 -= 721;
	($sec,$min,$hour,$mday,$mon,$year,$wday,$yday) = localtime($ktms4);
	$mon++;
	$year += 1900;
	$ww = ("日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日")[$wday];
	$tt_date = sprintf("（$year %02d\/%02d\ $ww）", $mon, $mday);

	open(IN,"./p_db/rank/$in{'id'}.cgi");
	@CN_DATA = <IN>;
	close(IN);
	($rsougoup,$rsougouj,$rbujyokup,$rbujyokuj,$rtiryokup,$rtiryokuj,$rtousotup,$rtousotuj,$rjyussyup,$rjyussyuj,$rkijyoup,$rkijyouj,$rsyagekip,$rsyagekij,$rbujyutup,$rbujyutuj,$rjyujyutup,$rjyujyutuj,$rtyouhoup,$rtyouhouj,$rjyuukisoudap,$rjyuukisoudaj,$rtyoukyoup,$rtyoukyouj,$rjinboup,$rjinbouj,$rseijip,$rseijij,$rsinyoup,$rsinyouj,$rgogyou_kap,$rgogyou_kaj,$rgogyou_suip,$rgogyou_suij,$rgogyou_mokup,$rgogyou_mokuj,$rgogyou_kinp,$rgogyou_kinj,$rgogyou_dop,$rgogyou_doj,$rkarumalcp,$rkarumalc_lj,$rkarumalc_cj,$rkarumaldp,$rkarumald_lj,$rkarumald_dj,$rgekihap,$rgekihaj,$rsisanp,$rsisanj,$rn_meiseip,$rn_meiseij,$rlcl_meiseip,$rlcl_meiseij,$rlcc_meiseip,$rlcc_meiseij,$rldl_meiseip,$rldl_meiseij,$rldd_meiseip,$rldd_meiseij,$rgirip,$rgirij) = split(/<>/,$CN_DATA[0]);
require "$mpg_r/sub_db/umare.pl";


		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

require "$mpg_r/sub_db/citem.pl";
	&P_ITEM_OPEN;

require "$mpg_r/sub_db/tw.pl";
		$rank_mes = "";

	open(IN,"./p_db/co/$f_id.cgi");
	@F_LOG2 = <IN>;
	close(IN);
	($k2f16,$k2hsnp) = split(/<>/,$F_LOG2[16]);

		if(-e "./w_db/allc_butai_db.pl"){
require "./w_db/all_butai_db.pl";

		}else{ 
require "./w_db/all2_butai_db.pl";
		}
		if(-e "./w_db/allc_gundan_db.pl"){
require "./w_db/all_gundan_db.pl";

		}else{ 
require "./w_db/all2_gundan_db.pl";
		}
		$add_com = "";
		$add_com2 = "";



				&KANBU_NAME;

	if($p_kuni_yakusyoku{$f_id}){
		$rank_mes = "【${$zokukanbuptn}[$p_kuni_yakusyoku{$f_id}]】";
	}

	}else { $p_name{$f_id}="城壁"; 
$p_img{$f_id} = "$IMG{0}/siro_eihei";
$p_img_f{$f_id} = $p_img_kakutyou{0};

$p_kunkou{$f_id}="1000";
$p_kuni_kouken{$f_id}="99999";
$p_kunren{$f_id}="？";
$p_buryoku{$f_id}="？";
$p_tiryoku{$f_id}="？";
$p_tousotu{$f_id}="？";
$t_name[999]="城下町";
$p_taizai_iti{$f_id}="999";
$khsn2="壁";
$khsn1="？";
$p_kunino{$f_id}=9999;
$p_heisyu{$f_id}=9999;
$p_syakui{$f_id}=9999;
$k2hsnp="四聖獣";
$k_name_d[9999]="？";
$SOL_TYPE[9999]="技術値次第";
$LANK[9999]="衛兵";
#$item_name{$p_migite{$f_id}}="侍女のほうき★ ";
#$item_name{$p_syomotu{$f_id}}="馬鈞の日記★";
#$item_seinou{$p_migite{$f_id}}="1";
#$item_seinou{$p_syomotu{$f_id}}="7";
#$khsn3="岩を放り投げること";
#$khsn4="プロフィールのアイデア募集中";
#$khsnp="壊すも塗るも貴方の思いのまま。応援ヨロシクね♪";
	}


$S_MES = "";
	if($f_id){
	open(IN,"./pr/b/$f_id.cgi");
	@F_LOG2 = <IN>;
	close(IN);

	($hnof,$hy) = split(/<>/,$F_LOG2[0]);
	($hnof,$hc) = split(/<>/,$F_LOG2[1]);
	($hnof,$hi) = split(/<>/,$F_LOG2[2]);
	($hnof,$h1) = split(/<>/,$F_LOG2[3]);
	($hnof,$h2) = split(/<>/,$F_LOG2[4]);
	($hnof,$h3) = split(/<>/,$F_LOG2[5]);
	($hnof,$hyj) = split(/<>/,$F_LOG2[6]);
	($hnof,$hsj) = split(/<>/,$F_LOG2[7]);
	($hnof,$hgj) = split(/<>/,$F_LOG2[8]);
	($hnof,$htr) = split(/<>/,$F_LOG2[9]);
	($hnof,$hmg) = split(/<>/,$F_LOG2[10]);
	($hnof,$hsk) = split(/<>/,$F_LOG2[11]);
	($kf12,$khsn1) = split(/<>/,$F_LOG2[12]);
	($kf13,$khsn2) = split(/<>/,$F_LOG2[13]);
	($kf14,$khsn3) = split(/<>/,$F_LOG2[14]);
	($kf15,$khsn4) = split(/<>/,$F_LOG2[15]);
	($kf16,$khsnp) = split(/<>/,$F_LOG2[16]);
	($hnof,$hk) = split(/<>/,$F_LOG2[17]);
	open(IN,"./pr/ad/$f_id.txt");
	@F_LOG2 = <IN>;
	close(IN);

	($ad_w_cm_0,$ad_w_cm_1,$ad_w_cm_2,$ad_w_cm_3,$ad_w_cm_4,$ad_w_cm_5,$ad_w_cm_6,$ad_w_cm_7,$ad_w_cm_8,$ad_w_cm_9,$ad_w_op_0,$ad_w_op_1,$ad_w_op_2,$ad_w_op_3,$ad_w_op_4,$ad_w_op_5,$ad_w_op_6,$ad_w_op_7,$ad_w_op_8,$ad_w_op_9,$ad_w_op_10,$ad_w_op_11,$ad_w_op_12,$ad_w_op_13,$ad_w_op_14,$ad_w_op_15,$ad_w_op_16,$ad_w_op_17,$ad_w_op_18,$ad_w_op_19) = split(/<>/,$F_LOG2[0]);
	
	}else{
$hk="？";
$hy="？";
$hc="？";
$hi="？";
$h1="？";
$h2="？";
$h3="？";
$hyj="？";
$hsj="？";
$hgj="？";
$htr="？";
$hmg="？";
$hsk="？";
	}


	if($khsn4 eq ""){
$khsn4 = "$UMARE[$p_syussei{$f_id}]";
	}
	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);

	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$rekimaprid = sprintf("%05d\.html", $tenkakaisuu);
	$old_date = "<a href=\"./mapr/$rekimaprid\" target=\"_blank\"><span class=\"cFFFFFF\">$outyou</span></a> <a href=\"./mapr/tuki/map2.html\" target=\"_blank\"><span class=\"cFFFFFF\">$old_date</span></a>";

	&HEADER;

	open(IN,"./p_db/slogid/$f_id.cgi");
	@S_MOVEPR = <IN>;
	close(IN);
$i = 0;
	while ($i < 4) {
$slogtl[$i] = "N/A";
		($addl[$i],$slogtl[$i],$old_datel[$i],$tt_datel[$i])=split(/<>/,$S_MOVEPR[$i]);
	if($tt_datel[$i]){
	($qsec,$qmin,$qhour,$qmday,$qmon,$qyear,$qwday,$qyday) = localtime($tt_datel[$i]);
	$qmon++;
#	$qyear += 1900;
	$tt_datel[$i] = sprintf("%02d\/%02d\ %02d\:%02d", $qmon, $qmday, $qhour, $qmin);
	$slogtl[$i] = "<a href=\"./?.m.=logf&amp;.l.=$addl[$i]&amp;.id.=$f_id\"><span class=\"c000000\">$slogtl[$i]</span></a>";
	}else{
	$tt_datel[$i] = "N/A";
	}
$i ++;
	}


#$URIHTTPNUKI =$URI;

#$URIHTTPNUKI =~ s/http:\/\///g;
#$URIHTTPNUKI2 =$URI;

$URIHTTPNUKI ="kunitori.com";
$URIHTTPNUKI2 ="kunitori.com";
	&IMG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id");

#運営側広告を貼る際は、設定ファイル面データの該当項目を修正してください。簡単に広告付きに切り替えることができます。

	if($in{'i'} ne "i"){
	open(IN,"./pr/blog/$f_id.cgi");
	@MES_REG1 = <IN>;
	close(IN);
	$p=0;
		foreach(@MES_REG1){
			($bb2) = split(/<>/);
$S_MES .= "<span class=\"c228B22\">●</span>$bb2<br />";
		}
	&P_B_AD;

	&P_B_1;
print <<"PRI";
$add_p_come
PRI

print <<"PRI";
<table class=\"kbgcb$k_iro_d{$fk_id}\" width=\"240\">
<tr class=\"bgc442200\"><td width=\"68\"></td><td class=\"txth\" width=\"167\"></td></tr>
<tr class=\"bgc442200\"><td class=\"txth\" colspan=\"2\"><span class=\"cFFFFFF\">戦歴（<a href=\"./?.m.=slog_b&amp;.id.=$in{'id'}\"><span class=\"cFFFFFF\">一覧表示</span></a>）</span></td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>$tt_datel[0]</td><td class=\"txtr\">$slogtl[0]</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>$tt_datel[1]</td><td class=\"txtr\">$slogtl[1]</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>$tt_datel[2]</td><td class=\"txtr\">$slogtl[2]</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>$tt_datel[3]</td><td class=\"txtr\">$slogtl[3]</td></tr>

</table>
</div></div>
<br />
$kstool_w{$ad_w_op_0}<br />
<div class=\"clear_b\"></div>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div class=\"p_b_div\"><input type=\"hidden\" name=\".m.\" value=\"msend\" /><input type=\"hidden\" name=\".ckalm.\" value=\"1\"  />
貴方のID<input type="text" size="10" name=".id." value="" />
：貴方のPASS<input type="password" size=\"10\" name=\".pass.\" />
<br />内容<textarea rows="3" cols="40" name=\".naiyou.\"></textarea>

<input type=\"hidden\" name=\".mes_id.\" value=\"$f_id\" /><input type="submit" value="$p_name{$f_id}さんに手紙を送る" /></div></form>

$add_ad_come{$ad_w_cm_0_t}
PRI
	&P_B_2;
print <<"PRI";
$add_p_come
PRI

#use LWP::Simple;
#	$code = get("http://miraisu.ddo.jp/sn/kousin2.txt");
#	open(OUT,">../cs/t.txt");
#	print OUT $code;
#	close(OUT);
	}else{
$S_MES = "";
	open(IN,"./pr/klog/$fk_id.cgi");
	@LOG_DATA = <IN>;
	close(IN);

	$i_max = @LOG_DATA;
	$i=0;
	while($i<20){
	$bb2="";
			($bb2) = split(/<>/,$LOG_DATA[$i]);
$S_MES .= "$bb2<br />";
		$i++;
	}

	&P_B_AD_I;
$slogtl[0] =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$slogtl[1] =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$slogtl[2] =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$slogtl[3] =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
$S_MES =~ s/\.m\./\.i\.=i\&amp\;\.m\./g;
print <<"PRI";
$img_sakusei_kekka<br />
武将名:$p_name{$f_id}<br />Last login:$tt_date<br />

所属国:$k_p_k_a{$fk_id}$rank_mes<br />
所属軍団:$gundan_name[$p_gundanno{$f_id}]$GUNDAN_KANBU[$p_gundan_yakusyoku{$f_id}]<br />
所属部隊:$butai_name[$p_butaino{$f_id}]$BUTAI_KANBU[$p_butai_yakusyoku{$f_id}]<br />

$add_ad_come{$ad_w_cm_0_t}<br />
<table class=\"kbgcb$k_iro_d{$fk_id}\" width=\"240\">
<tr class=\"bgc442200\"><td width=\"68\"></td><td class=\"txtr\"></td><td class=\"txtr\" width=\"68\"></td></tr>
<tr class=\"bgc442200\"><td class=\"txth\" colspan=\"3\">$old_date</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>総合/順位</td><td class=\"txtr\">$rsougoup</td><td class=\"txtr\">$rsougouj位</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>武力/順位</td><td class=\"txtr\">$rbujyokup</td><td class=\"txtr\">$rbujyokuj位</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>知力/順位</td><td class=\"txtr\">$rtiryokup</td><td class=\"txtr\">$rtiryokuj位</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>統率/順位</td><td class=\"txtr\">$rtousotup</td><td class=\"txtr\">$rtousotuj位</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>十種/順位</td><td class=\"txtr\">$rjyussyup</td><td class=\"txtr\">$rjyussyuj位</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>資産/順位</td><td class=\"txtr\">$rsisanp</td><td class=\"txtr\">$rsisanj位</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>名声/順位</td><td class=\"txtr\">$rn_meiseip</td><td class=\"txtr\">$rn_meiseij位</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>撃破/順位</td><td class=\"txtr\">$rgekihap</td><td class=\"txtr\">$rgekihaj位</td></tr>
</table>
<br />
<table class=\"kbgcb$k_iro_d{$fk_id}\" width=\"240\">
<tr class=\"bgc442200\"><td width=\"68\"></td><td class=\"txth\" width=\"167\"></td></tr>
<tr class=\"bgc442200\"><td class=\"txth\" colspan=\"2\"><span class=\"cFFFFFF\">戦歴（<a href=\"./?.m.=slog_b&amp;.id.=$in{'id'}\"><span class=\"cFFFFFF\">一覧表示</span></a>）</span></td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>$tt_datel[0]</td><td class=\"txtr\">$slogtl[0]</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>$tt_datel[1]</td><td class=\"txtr\">$slogtl[1]</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>$tt_datel[2]</td><td class=\"txtr\">$slogtl[2]</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>$tt_datel[3]</td><td class=\"txtr\">$slogtl[3]</td></tr>
</table><br />
$kstool_w{$ad_w_op_0}<br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div class=\"p_b_div\"><input type=\"hidden\" name=\".m.\" value=\"msend\" /><input type=\"hidden\" name=\".ckalm.\" value=\"1\"  />
貴方のID<input type="text" size="10" name=".id." value="" />
：貴方のPASS<input type="password" size=\"10\" name=\".pass.\" />
<br />内容<textarea rows="3" cols="30" name=\".naiyou.\"></textarea>
<input type=\"hidden\" name=\".i.\" value=\"i\" />
<input type=\"hidden\" name=\".mes_id.\" value=\"$f_id\" /><input type="submit" value="$p_name{$f_id}さんに手紙を送る" /></div></form>

<table width=\"240\">
<tr><td class=\"bgcF8F0E0\">$p_name{$f_id}の伝記</td></tr>
<tr><td class=\"bgcF8F0E0\">$S_MES</td></tr>
</table>

<table class=\"bgc000080\" width=\"240\">
<tr class=\"bgc000080\"><td width=\"60\"></td><td width=\"175\"></td></tr>
<tr class=\"bgcF8F0E0\"><td class=\"txth\" colspan=\"2\">$p_name{$f_id}の中の人</td></tr>

<tr class=\"bgcF8F0E0\"><td>URL</td><td>$hk</td></tr>
<tr class=\"bgcF8F0E0\"><td>e-mail</td><td>$hy</td></tr>
<tr class=\"bgcF8F0E0\"><td>ICQ</td><td>$hc</td></tr>
<tr class=\"bgcF8F0E0\"><td>IRC</td><td>$hi</td></tr>
<tr class=\"bgcF8F0E0\"><td>職業</td><td>$h1</td></tr>
<tr class=\"bgcF8F0E0\"><td>住所</td><td>$h2</td></tr>

<tr class=\"bgcF8F0E0\"><td>年齢</td><td>$h3</td></tr>
<tr class=\"bgcF8F0E0\"><td>性別</td><td>$hyj</td></tr>
<tr class=\"bgcF8F0E0\"><td>趣味</td><td>$hsj</td></tr>
<tr class=\"bgcF8F0E0\"><td>特技</td><td>$hgj</td></tr>
<tr class=\"bgcF8F0E0\"><td>好きな物</td><td>$htr</td></tr>
<tr class=\"bgcF8F0E0\"><td>嫌いな物</td><td>$hmg</td></tr>
<tr class=\"bgcF8F0E0\"><td>PR文</td><td><span class=\"msp\">$hsk</span></td></tr>
</table>
PRI
	}
	&FOOTER;
	exit;

}


1;