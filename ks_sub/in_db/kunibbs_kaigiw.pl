
sub MOVE{

use LWP::Simple;
	&TT_GET;
	&HOST_NAME;

	&MOJISUU($in{'title'},20);
	if($mojisuu_o) { &ER1("手短に用件を伝えてください。題名。$mojisuu_re"); }
	&MOJISUU($in{'ins'},2000);
	if($mojisuu_o) { &ER1("手短に用件を伝えてください。本文。$mojisuu_re"); }

	if(($in{'title'} eq "" and $in{'b_no'} eq "")or $in{'ins'} eq "") { &ER1("メッセージが記入されていません。"); }

	if($in{'id'} ne "-$mpass"){
require "$mpg_r/sub_db/ingo2.pl";
$buffer = $in{'title'};
$buffer =~ s/&#46;jp/。mlm。/g;
$buffer =~ s/&#46;com/。mlm。/g;
$buffer =~ s/&#46;net/。mlm。/g;
$buffer =~ s/&#46;kr/。mlm。/g;
$buffer =~ s/ttp/。mlm。/g;
$buffer =~ s/&#46;org/。mlm。/g;
$buffer =~ s/&#46;biz/。mlm。/g;
$buffer =~ s/&#46;info/。mlm。/g;
$buffer =~ s/&#46;tv/。mlm。/g;
$buffer =~ s/&#46;nu/。mlm。/g;
	if($buffer =~ /。mlm。/i){
&ER1("国取掲示板にはURLを掲示しないようお願いします。");
	}
$cnksw = $buffer;
$cnksw =~  s/ //g;
$cnksw =~  s/　//g;
	foreach(@KSW){
if($_ and $cnksw =~ /\Q$_\E/) {
		&ER1("そのタイトルは使用できません。$_『隠語・淫語フィルター』<br /><br />$in{'title'}<br /><br />$in{'ins'}");}
	}

$buffer = $in{'ins'};
$buffer =~ s/&#46;jp/。mlm。/g;
$buffer =~ s/&#46;com/。mlm。/g;
$buffer =~ s/&#46;net/。mlm。/g;
$buffer =~ s/&#46;kr/。mlm。/g;
$buffer =~ s/ttp/。mlm。/g;
$buffer =~ s/&#46;org/。mlm。/g;
$buffer =~ s/&#46;biz/。mlm。/g;
$buffer =~ s/&#46;info/。mlm。/g;
$buffer =~ s/&#46;tv/。mlm。/g;
$buffer =~ s/&#46;nu/。mlm。/g;
	if($buffer =~ /。mlm。/i){
&ER1("国取掲示板にはURLを掲示しないようお願いします。");
	}
$cnksw = $buffer;
$cnksw =~  s/ //g;
$cnksw =~  s/　//g;
	foreach(@KSW){
if($_ and $cnksw =~ /\Q$_\E/) {
		&ER1("その内容は投稿できません。$_『隠語・淫語フィルター』<br /><br />$in{'title'}<br /><br />$in{'ins'}");}
	}


	}

use LWP::Simple;
$in{'ita'} = abs(int($in{'ita'}));
	if($in{'ita'} > 20) { &ER1("板が発見できません。"); }

$p_kunino{$f_id} =abs(int($in{'ita'}));

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

$in{'ref_uri_d'} =~ s/&#46;/\./g;
$in{'ref_uri_d'} =~ s/&#47;/\//g;
$bbsurl =$in{'ref_uri_d'};
$buffer ="";
	$buffer = get("$bbsurl/$in{'bbsurl'}/?.m.=drkunibbs&amp;.id.=$in{'id'}&amp;.pass.=$in{'pass'}&amp;.t.=1");

$URI2=$URI;
$URI="$bbsurl/$in{'bbsurl'}";
$URI_kosaba=$URI;
#	if($buffer eq "") { &ER1("BBSサーバーが停止中です。しばらくたってからアクセスしてください。。"); }
	if($buffer !~ /<><>/) { &ER1("IDパスワードが一致しません。$bbsurl/$in{'bbsurl'}/?.m."); }
	if($buffer eq "<>") { &ER1("投稿は1時間1回までです。"); }
	($p0name,$cgimg,$rank_mes,$ttadd,$p0f_id,$cgimg_sabano) = split(/<>/,$buffer);

$buffer ="";
#require "./p_db/tm/kcs4$kid.pl";


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

	$sageh = 0;
		if($n2){
	if($in{'sage'} ne "age"){
	$sageh = 1;
	}
		$b_threadno = $in{'b_no'};
$lbbtitle = $bbstitle4;
		}else{
		$b_threadno = $tt;
$lbbtitle = $in{'title'};
$add = 3000;
	if($myear < 30){
$add = $myear * 100;
	}

#	if($ttadd > $tt and $in{'id'} ne $mpass) {$add_tt = int(($ttadd - $tt) / 60); &ER1("残り$add_tt分間、新規スレ建てできません。$n2"); }
#	if($rank_mes eq "" and $p_kuni_kouken{$f_id} < $add and $in{'id'} ne $mpass){
#&ER1("新スレッドを立てられるのは、役職持ちの幹部か、勲功値$add以上の武将のみです。一般武将の方は『返信』のみでお願いします。");
#	}
	$buffer = get("$bbsurl/$in{'bbsurl'}/?.m.=drkunibbs&amp;.id.=$in{'id'}&amp;.pass.=$in{'pass'}&amp;.t.=$n2");
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

	$bbname = "<strong>$p0nameより</strong> $rank_mes";

	($lbbid,$lbbtitle2,$lbbmes,$cgimgr,$lbbname,$lbbhost,$lbbtime,$lbbkuniiro,$lbbkuni,$lbbtype,$lbbno,$lbbthreadno,$cgimgr2sabano,$bbsabaurl)=split(/<>/,$BBS_DATA[0]);

	$bno = $lbbno + 1;
	unshift(@BBS_DATA,"$in{'bbsurl'}-$p0f_id<>$lbbtitle<>$in{'ins'}<>$cgimg<>$bbname<>$host<>$tt_date<>$k_iro_d{$fk_id}<>$p_kunino{$f_id}<>$bbtype2<>$bno<>$b_threadno<>$cgimg_sabano<>$URI_kosaba<>\n");

	open(OUT,">./w_db/cmes/$p_kunino{$f_id}$b_threadno.cgi");
	print OUT @BBS_DATA;
	close(OUT);


	foreach(@BBS_DATA){
		($bbid,$bbtitle,$bbmes,$bbcgimg,$bbname,$bbhost,$bbtime,$bbkuniiro,$bbkuni,$bbtype,$bbno,$bbthreadno,$cgimgr2sabano,$bbsabaurl)=split(/<>/);

		($bbid1,$bbid2)=split(/\-/,$bbid);
$URI=$bbsabaurl;
	&IMG_B_CG_SAKUSEI("$bbcgimg","$img_wide","$img_height","$p_img_mime{$cgimgr2sabano}","b$f_id$bbthreadno","$bbid2","0","","","","","","");
$img_sakusei_kekka =~ s/\'/\\'/g;
		if($bbno eq "1"){
				$c_mes = '$c_mesa .= \'';
$c_mes .= "<table border=\"0\" width=\"700\" class=\"tlauto ofscroll kbgcc$k_iro_d{$fk_id}\">
<tr><td width=\"20%\"></td><td width=\"80%\"></td></tr>
<tr>
<td colspan=\"2\" class=\"kbgcb$k_iro_d{$fk_id}\"><strong><span class=\"kcc$k_iro_d{$fk_id}\">◆$bbtitle（$bno件）</span></strong></td>
</tr>
<tr>
<td width=\"80\" rowspan=\"2\" class=\"txtc\">$img_sakusei_kekka</td>
<td class=\"bgc414141\"><span class=\"msp\"><span class=\"cFFFFFF\">$bbmes</span></span></td>
</tr>
<tr>
<td>$bbname <span class=\"kcb$k_iro_d{$fk_id}\">$bbtime</span></td>
</tr>
";
		}
	}
$c_mes2 = $c_mes;
	$n = 0;
	foreach(@BBS_DATA){
		($bbid,$bbtitle,$bbmes,$bbcgimg,$bbname,$bbhost,$bbtime,$bbkuniiro,$bbkuni,$bbtype,$bbno,$bbthreadno,$cgimgr2sabano,$bbsabaurl)=split(/<>/);

		($bbid1,$bbid2)=split(/\-/,$bbid);
$URI=$bbsabaurl;
	&IMG_B_CG_SAKUSEI("$bbcgimg","$img_wide","$img_height","$p_img_mime{$cgimgr2sabano}","b$f_id$bbthreadno","$bbid2","0","","","","","","");
$img_sakusei_kekka =~ s/\'/\\'/g;
			if($bbno ne "1"){
			if($n < 5){
					$c_mes .= "<tr><td colspan=\"2\"><div class=\"bbsre_div\"><div class=\"bbsre_block1\"><span class=\"msp\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$bbmes</span></span></div><div class=\"bbsre_block2\">$img_sakusei_kekka</div></div><div class=\"clear_b\"><a href=\"./?.m.=p_b&amp;.id.=$bbid\" target=\"_blank\"><span class=\"kcb$k_iro_d{$fk_id}\">$bbname $bbtime</span></a></div></td></tr>";
			}

					$c_mes2 .= "<tr><td colspan=\"2\"><div class=\"bbsre_div\"><div class=\"bbsre_block1\"><span class=\"msp\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$bbmes</span></span></div><div class=\"bbsre_block2\">$img_sakusei_kekka</div></div><div class=\"clear_b\"><a href=\"./?.m.=p_b&amp;.id.=$bbid\" target=\"_blank\"><span class=\"kcb$k_iro_d{$fk_id}\">$bbname $bbtime</span></a></div></td></tr>";
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

$URI=$URI2;
	&UNLOCK_FILE("kaigi");

	&HEADER;
	print <<"PRI";
<hr /><span class=\"fs4\">国取掲示板に書き込みをしました。</span><br /><br />

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\">

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<input type=\"submit\" value=\"ＯＫ\" /></form>
PRI


	&FOOTER;
	exit;
	
}
1;