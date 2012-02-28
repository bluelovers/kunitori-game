
sub MOVE {
$BAGU_HOUKOKU{0} = "<form action=\"$COMMAND\" target=\"$ktms4w\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"houkoku\" />
<input type=\"submit\" value=\"バグ報告\" /></div></form>";

$BAGU_HOUKOKU{1} = "";

	&GET_COOKIE;
require "./$mpg_r/sub_db/minzoku.pl";
require "./$mpg_r/sub_db/sen.pl";


 if ($ENV{'HTTP_REFERER'} and $ENV{'HTTP_REFERER'} !~ /$DOMAIN/i and $ENV{'HTTP_REFERER'} !~ /$DOMAIN_T/i) {
&TT_GET;
	open(OUT,">>../0noip.cgi");
	print OUT "$MEN_TITLE$URI/?.m.=p_b&amp;.id.=$in{'id'} $host$tt_date$ENV{'HTTP_REFERER'}\n";
	close(OUT);
	&ER1("許可\のない外部サイトからのログインは認められていません。<br /><a href=\"$HOME_URL_U\">$HOME_NAME_U</a>の<a href=\"$URI/\">正規ログイン画面</a>からお入り下さい。<br /><br /><a href=\"$URI/\" onclick=\"window.external.addFavorite('$HOME_URL_U','$HOME_NAME_U');\">javascriptで$HOME_NAME_Uをブックマークに追加する</a><br /><a href=\"$URI/\" onclick=\"window.external.addFavorite('$URI/','$MEN_TITLE');\">javascriptで$MEN_TITLEログインページをブックマークに追加する</a><br /><a href=\"$URI/\" onclick=\"style.behavior='url(#default#homepage)';setHomePage('$HOME_URL_U');\">javascriptで$HOME_NAME_Uをホームページに設定する</a>");
 }
	&P_OPEN;


	open(IN,"./p_db/tt/ktms4$f_id.cgi");
	@KTM = <IN>;
	close(IN);
	($ktms4,$ktms4w,$tmtmit,$tmtmw1,$tmtmw2,$tmtmw3) = split(/<>/,$KTM[0]);

$hit=0;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");

	open(IN,"./w_db/tm.cgi");
	@TMTM = <IN>;
	close(IN);
	($tmtm,$tmtm2) = split(/<>/,$TMTM[0]);


	if($ktms4 > $tmtm2 and (-e "./p_db/tt/kcs4$f_id.pl")){
		if($in{'sv'} ne $ktms4w and $in{'sv'} ne ""){
			if($in{'sv'} ne "nw"){
		$in{'sv'} = "cw";
			}
		$ktms4w = "$in{'sv'}";
	@KTM=();
	unshift(@KTM,"$ktms4<>$ktms4w<>$tmtmit<>$tmtmw1<>$tmtmw2<>$tmtmw3<>\n");
	open(OUT,">./p_db/tt/ktms4$f_id.cgi");
	print OUT @KTM;
	close(OUT);
		}
require "./p_db/tt/kcs4$f_id.pl";
	}else{



	if($in{'sv'} ne "nw"){
		$in{'sv'} = "cw";
	}
		$ktms4w = "$in{'sv'}";


require "./$mpg_r/sub_db/tw.pl";

require "./$mpg_r/sub_db/neko$KEITAI_T.pl";
	&TAJYUU_HANTEI2;


require "./$mpg_r/sub_db/kanbu.pl";

				&KANBU_NAME;

	if($p_kuni_yakusyoku{$f_id}){
		$rank_mes = "【${$zokukanbuptn}[$p_kuni_yakusyoku{$f_id}]】";
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

	$new_date = $old_date;

		$king_com = "";

	&BIJYOU_READ("$f_id");
	&HIJYOU_READ("$f_id");
	if($k_keika_t{$fk_id} < 72){
		$add_t = 72 - $k_keika_t{$fk_id};
		$add_tc = "";
		if($k_kousen_aite_name{$fk_id} =~ /\//){
		$add_tc = "<br />";
		}
		$add_tc .= "《 交戦解除まで残り $add_t ターン 》";
	}


	open(IN,"./p_db/slogid/t_$p_taizai_iti{$f_id}.cgi");
	@S_MOVEPR = <IN>;
	close(IN);
$i = 0;
		($addl[$i],$slogtl[$i],$old_datel[$i],$tt_datel[$i])=split(/<>/,$S_MOVEPR[$i]);
	if($tt_datel[$i]){
	($qsec,$qmin,$qhour,$qmday,$qmon,$qyear,$qwday,$qyday) = localtime($tt_datel[$i]);
	$qmon++;
#	$qyear += 1900;
	$ktt_datel[$i] = sprintf("%02d\/%02d\ %02d\:%02d", $qmon, $qmday, $qhour, $qmin);
	$kslogtl[$i] = "<a href=\"./?.m.=logf&amp;.l.=$addl[$i]&amp;.id.=$f_id\" target=\"_blank\"><span class=\"c000000\">$slogtl[$i]</span></a>";
	}else{
	$ktt_datel[$i] = "N/A";
	}

	open(IN,"./p_db/slogid/t_z$p_taizai_iti{$f_id}.cgi");
	@S_MOVEPR = <IN>;
	close(IN);
$i = 0;
		($addl[$i],$slogtl[$i],$old_datel[$i],$tt_datel[$i])=split(/<>/,$S_MOVEPR[$i]);
	if($tt_datel[$i]){
	($qsec,$qmin,$qhour,$qmday,$qmon,$qyear,$qwday,$qyday) = localtime($tt_datel[$i]);
	$qmon++;
#	$qyear += 1900;
	$ztt_datel[$i] = sprintf("%02d\/%02d\ %02d\:%02d", $qmon, $qmday, $qhour, $qmin);
	$zslogtl[$i] = "<a href=\"./?.m.=logf&amp;.l.=$addl[$i]&amp;.id.=$f_id\" target=\"_blank\"><span class=\"c000000\">$slogtl[$i]</span></a>";
	}else{
	$ztt_datel[$i] = "N/A";
	}


	if($p_syubi_eria{$f_id}){
		$syubiitic = "$t_name[$p_syubi_tosi{$f_id}] $senno[$p_syubi_eria{$f_id}] ";
	}
			$ttktm = $tt+721;
	@KTM=();
	unshift(@KTM,"$ttktm<>$ktms4w<>$tmtmit<>$tmtmw1<>$tmtmw2<>$tmtmw3<>\n");
	open(OUT,">./p_db/tt/ktms4$f_id.cgi");
	print OUT @KTM;
	close(OUT);

   		$kcs4 = '$xaddmes = \'' . $xaddmes . '\';' . '$xc = \'' . $xc . '\';' . 
'$rank_mes = \'' . $rank_mes . '\';' . '$sirei_han = \'' . $sirei_han . '\';' . '$m_list = \'' . $m_list . '\';' . 
'$ztt_datel[0] = \'' . $ztt_datel[0] . '\';' . '$zslogtl[0] = \'' . $zslogtl[0] . '\';' .
'$ktt_datel[0] = \'' . $ktt_datel[0] . '\';' . '$kslogtl[0] = \'' . $kslogtl[0] . '\';' .
'$b_st_w{$f_id} = \'' . $b_st_w{$f_id} . '\';' . '$h_st_w{$f_id} = \'' . $h_st_w{$f_id} . '\';' .
'$syubiitic = \'' . $syubiitic . '\';' . '$new_date = \'' . $new_date . '\';' . '$add_tc = \'' . $add_tc . '\';1;';


	open(OUT,">./p_db/tt/kcs4$f_id.pl");
	print OUT $kcs4;
	close(OUT);

	}

	$p_taizai_iti{$f_id} = int($p_taizai_iti{$f_id});
	$p_kunino{$f_id} = int($p_kunino{$f_id});
#require "./w_db/guest/stv$p_taizai_iti{$f_id}.pl";
$t_zokuno{$ft_id} = int($t_zokuno{$ft_id});
	&HEADER;

	if($p_syubi_eria{$f_id}){
		$syubiitic = "$t_name[$p_syubi_tosi{$f_id}] $senno[$p_syubi_eria{$f_id}] ";
	}
$t_x_zahyou{$ft_id}++;
$t_y_zahyou{$ft_id}++;
	&IMG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide","$img_height","$p_img_m{$f_id}","b$f_id");
	print <<"PRI";

<table width=\"770\">
<tr><td class=\"valignt txtr\" width=\"110\"><br /><a href=\"../ksmanual.html\" target=\"setumei\">説明書</a><br /><a href=\"./?.m.=rn0\" target=\"setumei\">武将一覧</a><br /><a href=\"./?.m.=ms0\" target=\"setumei\">名将一覧</a><br /><a href=\"http://multi-thread.net/bbs/\" target=\"_blank\">マルチ BBS</a>$sencome</td><td width=\"555\">


<object data=\"$URI/tic.html\" type=\"text/html\" width=\"550\" height=\"70\">オブジェクトタグに対応していない方は下のリンクで新しい窓を開いてください。<br /><a href=\"$URI/tic.html\" target=\"_blank\">国取ニュース</a></object>

</td><td width=\"110\" class=\"txtc\" rowspan=\"2\" class=\"valignt\">
<object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\"
 codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0\"
 width=\"100\" height=\"100\" id=\"aclock01_black\" align=\"\">
<param name=\"movie\" VALUE=\"$URIFL/aclock01_black.swf?logo=false\">
<param name=\"quality\" VALUE=\"high\">
<param name=\"bgcolor\" VALUE=\"#000000\">
<embed src=\"$URIFL/aclock01_black.swf?logo=false\" quality=\"high\" bgcolor=\"#000000\" width=\"100\" height=\"100\" name=\"aclock01_black\" align=\"\"
 TYPE=\"application/x-shockwave-flash\" PLUGINSPAGE=\"http://www.macromedia.com/go/getflashplayer\"></EMBED>
</object>
</td></tr>
<tr><td class=\"bgcF8F0E8\" colspan=\"2\"><span class=\"cAA0000\">$k_name{$fk_id}/重要連絡事項（指令）:$k_sirei_bun{$fk_id}</td></tr>
</table>

<div class=\"defo_div\">
<div class=\"defo_block1\">
<table width=\"100%\">

<tr class=\"bgc442200\"><td class=\"txth\">$new_date</td></tr>

</table>

<object data=\"./w_db/map.html\" type=\"text/html\" width=\"400\" height=\"515\">オブジェクトタグに対応していない方は下のリンクで新しい窓を開いてください。<br /><a href=\"./w_db/map.html\" target=\"_blank\">勢力図</a></object>


<table width=\"400\" class=\"kbgcb$k_iro_d[$t_kunino{$ft_id}]\">
<tr><td width=\"45\"></td><td width=\"80\"></td><td width=\"45\"></td><td width=\"80\"></td><td width=\"45\"></td><td width=\"80\"></td></tr>
<tr class=\"kbgcb$k_iro_d{$t_kunino{$ft_id}}\"><td class=\"txth\" colspan=\"6\"><span class=\"kcc$k_iro_d{$t_kunino{$ft_id}}\">$t_name{$ft_id}（座標/X軸$t_x_zahyou{$ft_id}/Y軸$t_y_zahyou{$ft_id}）</span></td></tr>
<tr class=\"kbgcc$k_iro_d[$t_kunino{$ft_id}]\"><td width=\"133\" colspan=\"2\">国│<strong><a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$t_kunino{$ft_id}\" target=\"_blank\"><span class=\"c000000\">$k_name[$k_kunino[$t_kunino[$ft_id]]]</span></a></strong></td><td width=\"51\">農業</td><td class=\"txtr\" width=\"82\">$t_nougyou_ti{$ft_id}/$t_nougyou_max{$ft_id}</td><td width=\"51\">米相場</td><td class=\"txtr\" width=\"82\">$t_kome_souba{$ft_id}</td></tr>
<tr class=\"kbgcc$k_iro_d[$t_kunino{$ft_id}]\"><td width=\"51\">領民</td><td class=\"txtr\" width=\"82\">$t_ryoumin_suu{$ft_id}</td><td>商業</td><td class=\"txtr\">$t_syougyou_ti{$ft_id}/$t_syougyou_max{$ft_id}</td><td>技術</td><td class=\"txtr\">$t_gijyutu_ti{$ft_id}/$t_gijyutu_max{$ft_id}</td></tr>
<tr class=\"kbgcc$k_iro_d[$t_kunino{$ft_id}]\"><td>治安</td><td class=\"txtr\">$t_tian_ti{$ft_id}</td><td>城/防衛</td><td class=\"txtr\">$t_siro_bouei_ti{$ft_id}/$t_siro_bouei_max{$ft_id}</td><td>城/耐久</td><td class=\"txtr\">$t_siro_taikyuu_ti{$ft_id}/$t_siro_taikyuu_max{$ft_id}</td></tr>
<tr class=\"kbgcc$k_iro_d[$t_kunino{$ft_id}]\"><td>城/守備</td><td class=\"txtr\">$t_siro_syubi_suu{$ft_id}</td><td><a href=\"./?.m.=slog_tk&amp;.id.=$p_taizai_iti{$f_id}\" target=\"_blank\"><span class=\"c000000\">戦闘log</span></a></td><td class=\"txtr\">$ktt_datel[0]</td><td class=\"txtr\" colspan=\"2\">$kslogtl[0]</td></tr>
<tr class=\"kbgcc$k_iro_d[$t_zokuno{$ft_id}]\"><td colspan=\"2\">賊│<strong><a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$t_zokuno{$ft_id}\" target=\"_blank\"><span class=\"c000000\">$k_name_d[$k_kunino[$t_zokuno[$ft_id]]]</span></a></strong></td><td>賊/防衛</td><td class=\"txtr\">$t_zoku_bouei_ti{$ft_id}/$t_zoku_bouei_max{$ft_id}</td><td>賊/耐久</td><td class=\"txtr\">$t_zoku_taikyuu_ti{$ft_id}/$t_zoku_taikyuu_max{$ft_id}</td></tr>
<tr class=\"kbgcc$k_iro_d[$t_zokuno{$ft_id}]\"><td>賊/守備</td><td class=\"txtr\">$t_toride_syubi_suu{$ft_id}</td><td><a href=\"./?.m.=slog_tz&amp;.id.=$p_taizai_iti{$f_id}\" target=\"_blank\"><span class=\"c000000\">戦闘log</span></a></td><td class=\"txtr\">$ztt_datel[0]</td><td class=\"txtr\" colspan=\"2\">$zslogtl[0]</td></tr>

</table>
<table width=\"100%\"><tr><td>
</td>

</tr>
</table>
</div><div class=\"defo_block2\">

<table width=\"100%\">

<tr class=\"kbgcb$k_iro_d{$fk_id}\"><td class=\"txth\" width=\"100%\"><span class=\"kcc$k_iro_d{$fk_id}\">Online</span></td></tr>
<tr><td class=\"kbgcc$k_iro_d[$t_kunino{$ft_id}]\">$m_list</td></tr>

</table>
<table width=\"100%\" class=\"kbgcb$k_iro_d{$fk_id}\">
<tr class=\"kbgcb$k_iro_d{$fk_id}\"><td class=\"txth\" colspan=\"3\" width=\"100%\"><span class=\"kcc$k_iro_d{$fk_id}\"><a href=./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$p_kunino{$f_id} target=\"_blank\"><span class=\"kcc$k_iro_d{$fk_id}\">$k_name{$fk_id}</span></a></span></td></tr>

<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td class=\"txth\" width=\"50%\"><form action=\"$COMMAND\" target=\"$ktms4w\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kaigi\" />
<input type=\"submit\" value=\"門下省\" /></div></form>
</td>
<td class=\"txth\"><form action=\"$COMMAND\" target=\"$ktms4w\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".m.\" value=\"sirei\" /><input type=\"submit\" value=\"中書省\" /></div></form>
</td>
<td class=\"txth\" width=\"50%\">
<form action=\"$COMMAND\" target=\"$ktms4w\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"ru-ru\" />
<input type=\"submit\" value=\"尚書省\" /></div></form>
</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td class=\"txth\">交戦相手国
</td><td class=\"txth\" colspan=\"2\">$k_kousen_aite_name{$fk_id}$add_tc
</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td class=\"txth\">後方徴兵都市
</td><td class=\"txth\" colspan=\"2\">$k_kouhou_tyouhei_name{$fk_id}
</td></tr>
</table>

<table class=\"kbgcb$k_iro_d{$fk_id}\" width=\"100%\">
<tr><td width=\"39\"></td><td width=\"26\"></td><td width=\"26\"></td><td class=\"txth\" width=\"61\"></td><td width=\"26\"></td><td class=\"txth\" width=\"61\"></td><td width=\"26\"></td><td class=\"txth\" width=\"61\"></td></tr>
<tr class=\"kbgcb$k_iro_d{$fk_id}\"><td class=\"txth\" colspan=\"8\"><a href=\"./?.m.=p_b&amp;.id.=$p_id{$f_id}\" target=\"_blank\"><span class=\"kcc$k_iro_d{$fk_id}\">$p_name{$f_id}$rank_mes</span></a></td></tr>


<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td class=\"txth\" rowspan=\"4\" colspan=\"2\">$img_sakusei_kekka</td><td>武力</td><td class=\"txth\">$p_buryoku{$f_id}</td><td>知力</td><td class=\"txth\">$p_tiryoku{$f_id}</td><td>統率</td><td class=\"txth\">$p_tousotu{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>武EX</td><td class=\"txth\">$p_ex_buryoku{$f_id}</td><td>知EX</td><td class=\"txth\">$p_ex_tiryoku{$f_id}</td><td>統EX</td><td class=\"txth\">$p_ex_tousotu{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td class=\"txtc\">金</td><td class=\"txth\">$p_syoji_kin{$f_id}</td><td class=\"txtc\">米</td><td class=\"txth\">$p_syoji_kome{$f_id}</td><td>人望</td><td class=\"txth\">$p_jinbou{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>民族</td><td class=\"txth\">$MINZOKUSAN[$p_minzoku{$f_id}]</td><td>勲功</td><td class=\"txth\">$p_kunkou{$f_id}</td><td>名声</td><td class=\"txth\">$p_kuni_kouken{$f_id}</td></tr>


<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>所属国</td><td class=\"txth\" colspan=\"3\">$k_name_d[$p_kunino{$f_id}]</td><td>義理</td><td class=\"txth\">$p_exgiri{$f_id}</td><td>撃破</td><td class=\"txth\">$p_gekiha{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>派閥</td><td class=\"txth\" colspan=\"3\">$habatu_name_d[$p_habatuno{$f_id}]</td><td>守備</td><td class=\"txth\" colspan=\"3\">$syubiitic</td></tr>


<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>兵種</td><td class=\"txth\" colspan=\"3\">$SOL_TYPE[$p_heisyu{$f_id}]</td><td>兵数</td><td class=\"txth\">$p_heisisuu{$f_id}</td><td>訓練</td><td class=\"txth\">$p_kunren{$f_id}</td></tr>



<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td rowspan=\"5\" colspan=\"4\">
<form action=\"$COMMAND\" target=\"$ktms4w\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<select name=\".m.\" size=\"5\">
<option value=\"itemo\">競売会場</option>
<option value=\"item\">アイテム管理</option>
<option value=\"senpou\">戦法設定</option>
<option value=\"gundan\">軍団編成</option>
<option value=\"butai\">部隊編成</option>
<option value=\"idkanri\">LoginID管理</option>
<option value=\"come\">コメント編集</option>
<option value=\"bcome\">自己PR編集</option>
<option value=\"adcome\">広告/OPT編集</option>
<option value=\"yakuba\">国取役場</option>
<option value=\"tyuusei\">忠誠度変更</option>
</select>
<input type=\"submit\" value=\"実行\" /></div></form>
</td><td>将異</td><td class=\"txth\">$b_st_w{$f_id}</td><td>兵異</td><td class=\"txth\">$h_st_w{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>将疲</td><td class=\"txth\">$p_b_hirou{$f_id}</td><td>兵疲</td><td class=\"txth\">$p_h_hirou{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>体力</td><td class=\"txth\">$p_tairyoku{$f_id}</td><td>士気</td><td class=\"txth\">$p_hei_siki{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>副指</td><td class=\"txth\">$HUKUSIREI[$kmeidosirei]</td><td>獣指</td><td class=\"txth\">$PETSIREI[$kpetsirei]</td></tr>

</table>


<table width=\"100%\">
<tr><td width=\"38%\">
<form action=\"$COMMAND\" target=\"$ktms4w\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"tosi_l\" />
<input type=\"submit\" value=\"都市一覧\" /></div></form></td>
<td width=\"29%\">
<form action=\"$COMMAND\" target=\"$ktms4w\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"tosi_s\" />
<input type=\"submit\" value=\"詳細情報\" /></div></form>
</td><td class=\"txtr\" width=\"33%\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".sv.\" value=\"$ktms4w\" />
<input type=\"hidden\" name=\".m.\" value=\"defo\" />
<input type=\"submit\" value=\"画面更新\" /></div></form>
</td></tr>

<tr><td>
<form action=\"$COMMAND\" target=\"$ktms4w\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"my_log\" />
<input type=\"submit\" value=\"過去ログ\" /></div></form></td>

<td>
<form action=\"$COMMAND\" target=\"$ktms4w\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"map2\" />
<input type=\"submit\" value=\"全体ログ\" /></div></form></td>
<td class=\"txtr\">
<form action=\"$COMMAND\" target=\"$ktms4w\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"messe\" />
<input type=\"submit\" value=\"手紙閲覧\" /></div></form></td>
</tr>

<tr>
<td>
<form action=\"$COMMAND\" target=\"_parent\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".sv.\" value=\"nw\" />
<input type=\"hidden\" name=\".m.\" value=\"defo\" />
<input type=\"submit\" value=\"新・窓\" /></div></form></td>
<td>
<form action=\"$COMMAND\" target=\"_parent\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".sv.\" value=\"cw\" />
<input type=\"hidden\" name=\".m.\" value=\"defo\" />
<input type=\"submit\" value=\"フレーム\" /></div></form></td>
<td class=\"txtr\">
<form action=\"$COMMAND\" target=\"$ktms4w\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"cd\" />
<input type=\"submit\" value=\"コマンド画面\" /></div></form></td>

</tr>

</table>
<table width=\"100%\">
<tr>
<td width=\"45%\">
<form action=\"$COMMAND\" target=\"$ktms4w\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<select name=\".m.\">
<option value=99901>1</option>
<option value=99902>2</option>
<option value=99903>3</option>
<option value=99904>4</option>
<option value=99905>5</option>
</select>
<input type=\"submit\" value=\"ループ転写\" /></div></form></td>
<td>
<form action=\"$COMMAND\" target=\"$ktms4w\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"act_cd\" />
<input type=\"submit\" value=\"アクティブコマンド編集\" /></div></form></td>

</tr>
<tr>
<td class=\"txth\">
$BAGU_HOUKOKU{$SP_F}
</td>

<td>
<form action=\"$COMMAND\" target=\"$ktms4w\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"gazou\" />
<input type=\"submit\" value=\"キャラ画像を変更\" /></div></form></td>


</tr>
</table>

</div></div>
<div class=\"clear_b\"></div>
<div colspan=\"defo_div\">

<form name=\"wsset\" method=\"post\" action=\"$COMMAND\" target=\"$ktms4w\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"defo_gedan\" />
</div></form>

</div>
<iframe title=\"\" name=\"cw\" width=\"100%\" height=\"1200\" frameborder=\"0\" border=\"0\">
<ilayer name=\"cw\" width=\"100%\" height=\"1200\" frameborder=\"0\" border=\"0\">インラインフレームに対応していない方は新窓でコマンド入力してください。
</ilayer>
</iframe>
<script type=\"text/javascript\" src=\"$CSS_URI/defo2.js\"></script>

</div></body></html>
PRI

	exit;

}
1;

