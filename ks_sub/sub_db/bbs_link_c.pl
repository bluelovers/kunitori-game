
sub BBS_LINK_C {
#リンク切れチェック（重いのが難点）

use LWP::Simple;

$URI_BBS_LINK_C=$URI;

	open(IN,"./w_db/cmes/lt$p_kunino{$f_id}.cgi");
	@BBS_DATALT = <IN>;
	close(IN);

foreach(@BBS_DATALT){
		($bbsid0,$bbsno0,$bbstitle0) = split(/<>/);
$b_threadno = $bbsid0;
	@BBS_LINK_C_URL = ();
	open(IN,"./w_db/cmes/$p_kunino{$f_id}$b_threadno.cgi");
	@BBS_DATA = <IN>;
	close(IN);

	foreach(@BBS_DATA){
		($bbid,$bbtitle,$bbmes,$bbcgimg,$bbname,$bbhost,$bbtime,$bbkuniiro,$bbkuni,$bbtype,$bbno,$bbthreadno,$cgimgr2sabano,$bbsabaurl)=split(/<>/);
		($bbid1,$bbid2)=split(/\-/,$bbid);
@BBS_LINK_C_head = head("$bbsabaurl/cg/$bbid2\_$img_wide\_0.html");
		if(500 > $BBS_LINK_C_head[2] or 1000 < $BBS_LINK_C_head[2]){
$BBS_LINK_C_get = "";
$BBS_LINK_C_get = get("$bbsabaurl/cg/$bbid2\_$img_wide\_0.html");
			if($BBS_LINK_C_get !~ /Link\<\/title\>/){
	unshift(@BBS_LINK_C_URL,$bbsabaurl);
			}
		}
	}

		if(@BBS_LINK_C_URL){
    &F_LOCK("kaigi");
@NEW_BBS_DATA = ();
	open(OUT,">./w_db/cmes/$p_kunino{$f_id}$b_threadno.cgi");
	print OUT @BBS_DATA;
	close(OUT);
$BBS_LINK_C_URL_no=0;
	foreach(@BBS_DATA){
		($bbid,$bbtitle,$bbmes,$bbcgimg,$bbname,$bbhost,$bbtime,$bbkuniiro,$bbkuni,$bbtype,$bbno,$bbthreadno,$cgimgr2sabano,$bbsabaurl)=split(/<>/);

		($bbid1,$bbid2)=split(/\-/,$bbid);
	foreach(@BBS_LINK_C_URL){
		if($bbsabaurl eq $_){
$bbsabaurl=$URI_BBS_LINK_C;

$img_sakusei_kekka2 ="$TAG_html_s{$doc_mode}
<head><meta http-equiv=\"Content-type\" content=\"text/html; charset=UTF-8\" />
<title>Link切れ差し替え</title>
<style type=\"text/css\">
html {height : 100% ; overflow : hidden} 
body {height : 100% ; overflow : hidden} 
body { margin:0px; }
</style>
</head><body>$TAG_div_s{$doc_mode}
<img src=\"$IMG{0}/0$p_img_kakutyou{0}\" width=\"$img_wide_d\" height=\"$img_height_d\" />
</div></body></html>
";
		open(OUT,">./cg/$bbid2\_$img_wide\_0.html");
		print OUT $img_sakusei_kekka2;
		close(OUT);
last;
		}
	}

	push(@NEW_BBS_DATA,"$bbid<>$bbtitle<>$bbmes<>$bbcgimg<>$bbname<>$bbhost<>$bbtime<>$bbkuniiro<>$bbkuni<>$bbtype<>$bbno<>$bbthreadno<>$cgimgr2sabano<>$bbsabaurl<>\n");
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
$BBS_LINK_C_URL_no++;
	}
$c_mes2 = $c_mes;

@BBS_DATA = @NEW_BBS_DATA;
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

	open(OUT,">./w_db/cmes/$p_kunino{$f_id}$b_threadno.cgi");
	print OUT @NEW_BBS_DATA;
	close(OUT);
$URI=$URI2;
	&UNLOCK_FILE("kaigi");

		}
}

}

1;