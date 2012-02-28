
sub MOVE {

	open(IN,"./w_db/bagu_end.cgi");
	@BAGU_END = <IN>;
	close(IN);
	$misyori_kazu = @BAGU_END;
		if($misyori_kazu > 30 and $in{'id'} ne "-$mpass"){
 &ER1("報告がたまりすぎで混み合っています。（$misyori_kazu件）しばらくたってからお問い合わせ下さい。");
		}
	if($in{'houkokukuni'}) {
$in{'houkokuhasseikcon'} = $in{'houkokukuni'};
	}
use LWP::Simple;
	&TT_GET;
	&HOST_NAME;
#	$addcm2 ="<pre>タイトル$in{'houkokutaitoru'}：\r\n面→$in{'houkokumen'}：\r\n所属国→$in{'houkokusyozoku'}：\r\n操作ID→$in{'houkokuid'}：\r\n誤動作発生頻度→$in{'houkokuhindo'}：\r\n誤動作面→$in{'houkokuhasseimen'}：\r\n影響範囲→$in{'houkokuhani'}：\r\n発生ID→$in{'houkokuhasseikid'}：\r\n相手方ID→$in{'houkokuhasseieid'}：\r\n発生国→$in{'houkokuhasseikcon'}：\r\n相手国→$in{'houkokuhasseiecon'}：\r\nログ→$in{'houkokuinslog'}：\r\n内容→$in{'houkokuinsgodousa'}：\r\n発生日時→$in{'houkokunitiji'}：\r\nその他→$in{'houkokuinssonota'}：\r\n有償？→$in{'houkokusapo'}：\r\nメール→$in{'houkokumail'}：\r\nIP→$host：\r\n報告時間→$tt_date：</pre>";

$in{'ita'} = $in{'ita'};
	if(!$in{'ins'}) {
$in{'title'} =$in{'houkokutaitoru'};

$in{'ins'} ="<pre>タイトル→$in{'houkokutaitoru'}<br />面→$in{'houkokumen'}<br />所属国→$in{'houkokusyozoku'}<br />操作ID→$in{'houkokuid'}<br />誤動作発生頻度→$in{'houkokuhindo'}<br />誤動作面→$in{'houkokuhasseimen'}<br />影響範囲→$in{'houkokuhani'}<br />発生ID→$in{'houkokuhasseikid'}<br />相手方ID→$in{'houkokuhasseieid'}<br />発生国→$in{'houkokuhasseikcon'}<br />相手国→$in{'houkokuhasseiecon'}<br />ーーーーーーーー<br />操作内容→<br />$in{'houkokuinsgenninn'}<br />ーーーーーーーー<br />ログ→<br />$in{'houkokuinslog'}<br />ーーーーーーーー<br />内容→<br />$in{'houkokuinsgodousa'}<br />ーーーーーーーー<br />発生日時→$in{'houkokunitiji'}<br />ーーーーーーーー<br />その他→<br />$in{'houkokuinssonota'}<br />ーーーーーーーー<br />メール→$in{'houkokumail'}<br />IP→$host<br />報告時間→$tt_date</pre>";
		if($in{'t'} eq "kaiketu"){
$bbtype2 = "end";
$in{'ins'} ="<strong>《 解決 》</strong><br />この問題は対応完了\致しました。動作等は未確認です。<br />問題が再発する場合は、お手数になりますが再度報告フォームから送信されるようお願い致します。";
		}elsif($in{'t'} eq "ijyounasi") {
$bbtype2 = "end";
$in{'ins'} ="<strong>《 異常は見受けられず 》</strong><br />報告ありがとうございます。<br />一通り調べましたところ、正常動作をしています。<br />この問題は、ゲーム上の仕様、又は動作異常が見受けられません。<br />ログ不足で原因究明に至っていないケースが稀にありますが、<br />正常動作している可能性が高いと思われます。";
		}elsif($in{'t'} eq "kiyaku") {
$bbtype2 = "end";
$in{'ins'} ="<strong>《 お知らせ・規約に掲載済み 》</strong><br />報告ありがとうございます。<br />その問題は、お知らせや規約等に既に掲載されています。<br />報告フォーム送信画面にある重要事項をもう一度よくお読み下さい。<br />重複報告が増えるば増えるほどバグへ対処が遅れます。<br />対処に当たれる時間には限りがありますので、ご理解のほどをよろしくお願いします。";
		}elsif($in{'t'} eq "douitu") {
$bbtype2 = "end";
$in{'ins'} ="<strong>《 同一報告多数 》</strong><br />報告ありがとうございます。<br />この問題と同じ内容の報告が多数寄せられています。<br />修正が行われるまで今しばらくお待ち下さい。";
		}elsif($in{'t'} eq "iken") {
$bbtype2 = "end";
$in{'ins'} ="<strong>《 確認 》</strong><br />ご意見ご感想ありがとうございます。<br />良い意見等は参考にしつつ、今後の運営に役立てていく予定です。また何かありましたらよろしくお願いします。";
		}elsif($in{'t'} eq "rogubusoku") {
$bbtype2 = "end";
$in{'ins'} ="<strong>《 ログ不足で原因不明 》</strong><br />報告ありがとうございます。<br />ログ不足で原因不明です。<br />問題が再発する場合は、お手数になりますが再度報告フォームから送信されるようお願い致します。";
		}elsif(!$in{'houkokutaitoru'} and $in{'id'} eq "-$mpass") {
$in{'ins'} ="<strong>《 確認 》</strong><br />報告ありがとうございます。<br />対応には時間がかかることがあります、ご迷惑をおかけしますが今しばらくお待ちください。";
		}
	}

	&MOJISUU($in{'title'},20);
	if($mojisuu_o) { &ER1("手短に用件を伝えてください。題名。$mojisuu_re"); }
	&MOJISUU($in{'ins'},4000);
	if($mojisuu_o) { &ER1("手短に用件を伝えてください。本文。$mojisuu_re"); }

	if(($in{'title'} eq "" and $in{'b_no'} eq "")or $in{'ins'} eq "") { &ER1("メッセージが記入されていません。"); }

###############
$p_kunino{$f_id} =$in{'ita'};

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
###############
$in{'ref_uri_d'} =~ s/&#46;/\./g;
$in{'ref_uri_d'} =~ s/&#47;/\//g;
$bbsurl =$in{'ref_uri_d'};
$buffer ="";
	$buffer = get("$bbsurl/$in{'bbsurl'}/?.m.=drkunibbs&amp;.id.=$in{'id'}&amp;.pass.=$in{'pass'}&amp;.t.=1");

$URI2=$URI;
$URI="$bbsurl/$in{'bbsurl'}";
$URI_kosaba=$URI;
#	if($buffer eq "") { &ER1("BBSサーバーが停止中です。しばらくたってからアクセスしてください。。"); }
	if($buffer !~ /<><>/) { &ER1("IDパスワードが一致しません。"); }
	if($buffer eq "<>") { &ER1("投稿は1時間1回までです。"); }
	($p0name,$cgimg,$rank_mes,$ttadd,$p0f_id,$cgimg_sabano) = split(/<>/,$buffer);
	if("$in{'bbsurl'}-$p0f_id" ne $in{'ita'} and $in{'id'} ne "-$mpass") { &ER1("面＆IDパスワードが一致しません。"); }

	if($in{'t'} =~ "item" and $in{'pass'} eq "ixchel" and $in{'id'} eq "-$mpass"){
$add_if =$in{'t'};
$add_if =~ s/item//;
	($ita_men,$ita_id) = split(/\-/,$in{'ita'});
$ita_url ="http://game.kunitori.com";
#if($ita_men =~ /kts/ ) {
#$ita_url ="http://test.kunitori.com";
#}
	$buffer = get("$ita_url/$ita_men/?.m.=drkunibbs&amp;.id.=$in{'id'}&amp;.pass.=$ita_id&amp;.t.=item");
	($add_p0name,$add_cgimg,$add_rank_mes,$add_ttadd,$add_p0f_id) = split(/<>/,$buffer);
	$buffer = get("$ita_url/$ita_men/?.m.=itemp&amp;.id.=$in{'id'}&amp;.pass.=$ita_id&amp;.tmtmw3.=$add_ttadd&amp;.item_f.=$add_if");

$in{'ins'} ="<strong>《 アイテム配布Lv$add_if 》</strong><br />報告ありがとうございます。<br />謝礼としてアイテムを送付致しましたのでご確認下さい。<br />今後ともよろしくお願いします。";
	}
	if(($in{'t'} eq "kiyaku" or $in{'t'} eq "ijyounasi") and $in{'pass'} eq "ixchel" and $in{'id'} eq "-$mpass"){
$add_tt =604800;
if($in{'t'} eq "kiyaku") {
$add_tt =1209600;
}
	($ita_men,$ita_id) = split(/\-/,$in{'ita'});
$ita_url ="http://game.kunitori.com";
#if($ita_men =~ /kts/ ) {
#$ita_url ="http://test.kunitori.com";
#}
	$buffer = get("$ita_url/$ita_men/?.m.=drkunibbs&amp;.id.=$in{'id'}&amp;.pass.=$ita_id&amp;.tt.=$add_tt");
	}
$buffer ="";
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
	if($ttadd > $tt) { $add_tt = int(($ttadd - $tt) / 60); &ER1("残り$add_tt分間、新規スレ建てできません。$n2"); }
	if($rank_mes eq "" and $p_kuni_kouken{$f_id} < $add){
&ER1("新スレッドを立てられるのは、役職持ちの幹部か、勲功値$add以上の武将のみです。一般武将の方は『返信』のみでお願いします。");
	}
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

	if($lbbtype eq "end" and $in{'t'} ne "kaiketu"){
&ER1("このスレッドは解決済みです。新規投稿を行う場合は新しくスレッドを立てて下さい。");
	}
	$bno = $lbbno + 1;
	unshift(@BBS_DATA,"$in{'bbsurl'}-$p0f_id<>$lbbtitle<>$in{'ins'}<>$cgimg<>$bbname<>$host<>$tt_date<>$k_iro_d{$fk_id}<>$p_kunino{$f_id}<>$bbtype2<>$bno<>$b_threadno<>$cgimg_sabano<>$URI_kosaba<>\n");

	open(OUT,">./w_db/cmes/$p_kunino{$f_id}$b_threadno.cgi");
	print OUT @BBS_DATA;
	close(OUT);

	foreach(@BBS_DATA){
		($bbid,$bbtitle,$bbmes,$bbcgimg,$bbname,$bbhost,$bbtime,$bbkuniiro,$bbkuni,$bbtype,$bbno,$bbthreadno,$cgimgr2sabano,$bbsabaurl,$cgimgr2sabano,$bbsabaurl)=split(/<>/);
		if($bbno eq "1"){
				$c_mes = '$c_mesa .= \'';
		($bbid1,$bbid2)=split(/\-/,$bbid);
$URI=$bbsabaurl;
	&IMG_B_CG_SAKUSEI("$bbcgimg","$img_wide","$img_height","$p_img_mime{$cgimgr2sabano}","b$f_id$bbthreadno","$bbid2","0","","","","","","");
$img_sakusei_kekka =~ s/\'/\\'/g;
$c_mes .= "<table border=\"0\" width=\"700\" class=\"tlauto ofscroll kbgcc$k_iro_d{$fk_id}\">
<tr><td width=\"20%\"></td><td width=\"80%\"></td></tr>
<tr><td colspan=\"2\" class=\"kbgcb$k_iro_d{$fk_id}\"><strong><span class=\"kcc$k_iro_d{$fk_id}\">◆$bbtitle（$bno件）</span></strong></td>
</tr>
<tr>
<td width=\"80\" rowspan=\"2\" class=\"txtc\">$img_sakusei_kekka</td>
<td class=\"bgc414141\"><span class=\"msp\"><span class=\"cFFFFFF\">$bbmes</span></span></td>
</tr>
<tr>
<td>$bbname <span class=\"fs1\"><span class=\"kcb$k_iro_d{$fk_id}\">$bbtime</span></span></td>
</tr>
";
		}
	}
$c_mes2 = $c_mes;
	$n = 0;
	foreach(@BBS_DATA){
		($bbid,$bbtitle,$bbmes,$bbcgimg,$bbname,$bbhost,$bbtime,$bbkuniiro,$bbkuni,$bbtype,$bbno,$bbthreadno,$cgimgr2sabano,$bbsabaurl,$cgimgr2sabano,$bbsabaurl)=split(/<>/);
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
		($bbsid0,$bbsno0,$bbstitle0)=split(/<>/,$NEW_COU[9]);
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
#################
		if(!$n2){
	open(IN,"./w_db/bagu_end.cgi");
	@BAGU_END = <IN>;
	close(IN);
			push (@BAGU_END,"$b_threadno<>$bbsno0<>$in{'title'}<>$in{'ita'}<>$in{'bbsurl'}<>\n");
	open(OUT,">./w_db/bagu_end.cgi");
	print OUT @BAGU_END;
	close(OUT);
	$misyori_kazu = @BAGU_END;
	$misyori_c = "<br />現在、未処理の報告が$misyori_kazu件溜まっています。";
		}else{
			if($bbtype2 eq "end"){
	open(IN,"./w_db/bagu_end.cgi");
	@BAGU_END = <IN>;
	close(IN);
	$i = 0;
	foreach(@BAGU_END){
		($bbsid0,$bbsno0,$bbstitle0,$bbsita,$bbsurl) = split(/<>/);
		if($b_threadno eq $bbsid0 and $bbsita eq $in{'ita'}){
splice(@BAGU_END , $i, 1);
		}
	$i ++;
	}
	open(OUT,">./w_db/bagu_end.cgi");
	print OUT @BAGU_END;
	close(OUT);
			}
		}
#################
$URI=$URI2;
	&UNLOCK_FILE("kaigi");
	&HEADER;

	print <<"PRI";
<hr /><span class=\"fs4\">報告完了しますた。$misyori_c</span><br /><br />
対処までに時間がかかることがあります。予めご了\承ください<br /><br />

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=houkoku_bbs>

<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=.bbsurl. value=$in{'bbsurl'}>
<input type=\"hidden\" name=.ita. value=$in{'ita'}>
<input type=\"submit\" value=\"戻る\" /></div></form>

PRI

	&FOOTER;

	exit;

}




1;