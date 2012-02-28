
sub MOVE{

	&P_OPEN;
	&TT_GET;
	&HOST_NAME;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");


require "./p_db/tt/kcs4$f_id.pl";

	&MOJISUU($in{'title'},20);
	if($mojisuu_o) { &ER1("手短に用件を伝えてください。題名。$mojisuu_re"); }
	&MOJISUU($in{'ins'},2000);
	if($mojisuu_o) { &ER1("手短に用件を伝えてください。本文。$mojisuu_re"); }

	if(($in{'title'} eq "" and $in{'b_no'} eq "")or $in{'ins'} eq "") { &ER1("メッセージが記入されていません。"); }

	$hit = 0;
	@insl = split(/<br $TAG_s0>/,$in{'ins'});
	foreach(@insl){
		if(length($_) > 110){
	$hit = 1;
	$add_eiji = $_;
	$eiji_kazu = ($add_eiji =~ tr/a-zA-Z0-9+-_*@$&`?}][{|\~^=)(%#!/a-zA-Z0-9+-_*@$&`?}][{|\~^=)(%#!/);
	if($eiji_kazu > 110) {
&ER1("英数字＆記号文字列が多すぎます。せめて改行してください。");
	}
		}
	}
	if($in{'t'} eq "pre"){
		if(!$hit){
	$mes_ins = "<pre>";
	$mes_ins .= "$in{'ins'}";
	$mes_ins .= "</pre>";
	$in{'ins'} = $mes_ins;
		}
	}

	open(IN,"./w_db/cmes/lt$p_kunino{$f_id}.cgi");
	@BBS_DATALT = <IN>;
	close(IN);

	$n2 = 0;
	foreach(@BBS_DATALT){
		($bbsid3,$bbsno3,$bbstitle3) = split(/<>/);
		if($in{'b_no'} eq $bbsid3){
	$n2 = 1;
$bbstitle4 = $bbstitle3;
		}
	}

	$sageh = 0;
		if($n2 ne "0"){
	if($in{'sage'} ne "age"){
	$sageh = 1;
	}
		$b_threadno = $in{'b_no'};
$lbbtitle = $bbstitle4;
		}else{
		$b_threadno = $tt;
$lbbtitle = $in{'title'};
	open(IN,"./w_db/jikan_jiku_main.cgi") or &ER1('ファイルを開けませんでした。');
	@JJM = <IN>;
	close(IN);

	($keika_nen,$tuki_genzai,$m_tt) = split(/<>/,$JJM[0]);
$add = 3000;
	if($keika_nen < 30){
$add = $keika_nen * 100;
	}
	if($rank_mes eq "" and $p_kuni_kouken{$f_id} < $add){
&ER1("新スレッドを立てられるのは、役職持ちの幹部か、勲功値$add以上の武将のみです。一般武将の方は『返信』のみでお願いします。");
	}
		}

    &F_LOCK("kaigi");

	open(IN,"./w_db/cmes/lt$p_kunino{$f_id}.cgi");
	@BBS_DATALT = <IN>;
	close(IN);

	open(IN,"./w_db/cmes/$p_kunino{$f_id}$b_threadno.cgi");
	@BBS_DATA = <IN>;
	close(IN);

	$bbs_num = @BBS_DATA;
	if($bbs_num > 200) { &ER1("レスは200行以上書き込めません。新スレを立ててください。"); }

	$bbname = "<strong>$p_name{$f_id}より</strong> $rank_mes";

	($lbbid,$lbbtitle2,$lbbmes,$lbbcharaimg,$lbbname,$lbbhost,$lbbtime,$lbbkuniiro,$lbbkuni,$lbbtype,$lbbno,$lbbthreadno,$cgimgr2sabano,$bbsabaurl)=split(/<>/,$BBS_DATA[0]);

	$bno = $lbbno + 1;
	unshift(@BBS_DATA,"$f_id<>$lbbtitle<>$in{'ins'}<>$p_img{$f_id}$p_cgno{$f_id}[0]$p_img_f{$f_id}<>$bbname<>$host<>$tt_date<>$k_iro_d{$fk_id}<>$p_kunino{$f_id}<>$bbtype2<>$bno<>$b_threadno<>$p_cg_sabano{$f_id}<>$URI_kosaba<>\n");

	open(OUT,">./w_db/cmes/$p_kunino{$f_id}$b_threadno.cgi");
	print OUT @BBS_DATA;
	close(OUT);


	foreach(@BBS_DATA){
		($bbid,$bbtitle,$bbmes,$bbcgimg,$bbname,$bbhost,$bbtime,$bbkuniiro,$bbkuni,$bbtype,$bbno,$bbthreadno,$cgimgr2sabano,$bbsabaurl,$cgimgr2sabano,$bbsabaurl)=split(/<>/);
######
	&IMG_B_CG_SAKUSEI("$bbcgimg","$img_wide","$img_height","$p_img_mime{$cgimgr2sabano}","b$f_id$bbthreadno","$bbid","0","","","","","","");
$img_sakusei_kekka =~ s/\'/\\'/g;
		if($bbno eq "1"){
				$c_mes = '$c_mesa .= \'';
$c_mes .= "<table border=\"0\" width=\"700\" class=\"tlauto ofscroll kbgcc$k_iro_d{$fk_id}\">
<tr><td width=\"20%\"></td><td width=\"80%\"></td></tr>
<tr><td colspan=\"2\" class=\"kbgcb$k_iro_d{$fk_id}\"><strong><span class=\"kcc$k_iro_d{$fk_id}\">◆$bbtitle（$bno件）</span></strong></td>
</tr>
<tr>
<td width=\"80\" rowspan=\"2\" class=\"txtc\">$img_sakusei_kekka</td>
<td class=\"bgc414141\"><span class=\"msp cFFFFFF\">$bbmes</span></td>
</tr>
<tr>
<td><a href=\"./?.m.=p_b&amp;.id.=$bbid\" target=\"_blank\"><span class=\"kcb$k_iro_d{$fk_id}\">$bbname $bbtime</span></a></td>
</tr>
";
		}
	}
$c_mes2 = $c_mes;
	$n = 0;
	foreach(@BBS_DATA){
		($bbid,$bbtitle,$bbmes,$bbcgimg,$bbname,$bbhost,$bbtime,$bbkuniiro,$bbkuni,$bbtype,$bbno,$bbthreadno,$cgimgr2sabano,$bbsabaurl,$cgimgr2sabano,$bbsabaurl)=split(/<>/);
######限定
			if(length($bbcgimg)<5){
	$bbcgimg = "http://miraisu.kir.jp/kts4/01.gif";
			}
######
	&IMG_B_CG_SAKUSEI("$bbcgimg","$img_wide","$img_height","$p_img_mime{$cgimgr2sabano}","b$f_id$bbthreadno","$bbid","0","","","","","","");
$img_sakusei_kekka =~ s/\'/\\'/g;
			if($bbno ne 1){
			if($n < 5){
					$c_mes .= "<tr><td colspan=\"2\"><div class=\"bbsre_div\"><div class=\"bbsre_block1\"><span class=\"msp kcb$k_iro_d{$p_kunino{$f_id}}\">$bbmes</span></div><div class=\"bbsre_block2\">$img_sakusei_kekka</div></div><div class=\"clear_b\"></div><a href=\"./?.m.=p_b&amp;.id.=$bbid\" target=\"_blank\"><span class=\"kcb$k_iro_d{$fk_id}\">$bbname $bbtime</span></a></td></tr>";
			}


					$c_mes2 .= "<tr><td colspan=\"2\"><div class=\"bbsre_div\"><div class=\"bbsre_block1\"><span class=\"msp kcb$k_iro_d{$p_kunino{$f_id}}\">$bbmes</span></div><div class=\"bbsre_block2\">$img_sakusei_kekka</div></div><div class=\"clear_b\"></div><a href=\"./?.m.=p_b&amp;.id.=$bbid\" target=\"_blank\"><span class=\"kcb$k_iro_d{$fk_id}\">$bbname $bbtime</span></a></td></tr>";
	$n ++;

			}
	}


$c_mes .= '</td></tr></table>\';
1;';
$c_mes2 .= '</td></tr></table>\';
1;';

	open(OUT,">./w_db/cmes/all$p_kunino{$f_id}$b_threadno.pl");
	print OUT $c_mes2;
	close(OUT);

	open(OUT,">./w_db/cmes/5g$p_kunino{$f_id}$b_threadno.pl");
	print OUT $c_mes;
	close(OUT);


		if($sageh eq "0"){
			@NEW_COU=();
	foreach(@BBS_DATALT){
		($bbsid0,$bbsno0,$bbstitle0) = split(/<>/);
		if($b_threadno eq $bbsid0){
		}else{
			push (@NEW_COU,"$bbsid0<>$bbsno0<>$bbstitle0<>\n");
		}
	}
			unshift (@NEW_COU,"$b_threadno<>$bno<>$lbbtitle<>\n");
$bbsid0 = "";
		($bbsid0,$bbsno0,$bbstitle0)=split(/<>/,$NEW_COU[30]);
		if($bbsid0 ne ""){
							unlink("./w_db/cmes/all$p_kunino{$f_id}$bbsid0.cgi");
							unlink("./w_db/cmes/5g$p_kunino{$f_id}$bbsid0.cgi");
							unlink("./w_db/cmes/all$p_kunino{$f_id}$bbsid0.pl");
							unlink("./w_db/cmes/5g$p_kunino{$f_id}$bbsid0.pl");
		}

		}elsif($sageh ne "0"){
			@NEW_COU=();
	foreach(@BBS_DATALT){
		($bbsid0,$bbsno0,$bbstitle0) = split(/<>/);
		if($b_threadno eq $bbsid0){
			push (@NEW_COU,"$b_threadno<>$bno<>$lbbtitle<>\n");
		}else{
			push (@NEW_COU,"$bbsid0<>$bbsno0<>$bbstitle0<>\n");
		}
	}
		}

	splice(@NEW_COU,30);
	open(OUT,">./w_db/cmes/lt$p_kunino{$f_id}.cgi");
	print OUT @NEW_COU;
	close(OUT);

	&UNLOCK_FILE("kaigi");

	&CD_END("門下省に記事を掲載致しました。","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"$in{'m_add'}\" /><input type=\"submit\" value=\"ＯＫ\" />","");#CD_END

	exit;
	
}
1;