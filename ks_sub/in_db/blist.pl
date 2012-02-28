
sub MOVE {
require "$mpg_r/sub_db/1.pl";
require "$mpg_r/sub_db/tw.pl";

require "$mpg_r/sub_db/kanbu.pl";


	if($in{'k'} eq "t"){
	open(IN,"./w_db/kuni/tmr$in{'k'}.cgi");
	@TMTM = <IN>;
	close(IN);
	($tmtm) = split(/<>/,$TMTM[0]);
	if($tmtm+86400 < $tt){
$next_time = $tmtm+300-$tt;
	@TMTM=();
	unshift(@TMTM,"$tt<>\n");
	open(OUT,">./w_db/kuni/tmr$in{'k'}.cgi");
	print OUT @TMTM;
	close(OUT);

require "$mpg_r/sub_db/minzoku.pl";

	$i=0;


	$l_rank[0] = "<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td class=\"txth\" colspan=\"2\">武将名（所属国）</td><td class=\"txth\">能力</td><td class=\"txth\">功績</td><td class=\"txth\">備考</td><td class=\"txth\">軍備</td></tr>";

	opendir(DFR,"./p_db/touketu");
	while($f_id = readdir(DFR)){
		if($f_id =~ /\.cgi/i){
$f_id =~ s/\.cgi//;
	&P_READ("touketu","$f_id","$f_id");
				

		$fk_id = $p_kunino{$f_id};
		if(!$k_id{$fk_id}){
	&K_READ("kuni_db","$fk_id","$fk_id");
		}

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
			if($c[$k_kunino{$fk_id}] <= $EN_MAX){
	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id","$f_id","","$ELE_C[$k_iro_d{$fk_id}]","","","","");
			$list[0] .= "<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>$img_sakusei_kekka</td><td class=\"txth\"><a href=\"../../?.m.=p_b&amp;.id.=$p_id{$f_id}\" target=\"_blank\"><span class=\"c404000\">$p_name{$f_id}</a><br /><br />（<a href=\"../../?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$p_kunino{$f_id}\" target=\"_blank\"><span class=\"c404000\">$k_name{$fk_id}</span></a>）</td>
<td>

<div class=\"bl_div\">
<div class=\"bl_block1\">武力</div>
<div class=\"bl_block2\">$p_buryoku{$f_id}</div>

</div>

<div class=\"bl_div\">
<div class=\"bl_block1\">知力</div>
<div class=\"bl_block2\">$p_tiryoku{$f_id}</div>

</div>

<div class=\"bl_div\">
<div class=\"bl_block1\">統率</div>
<div class=\"bl_block2\">$p_tousotu{$f_id}</div>

</div>

<div class=\"bl_div\">
<div class=\"bl_block1\">三種</div>
<div class=\"bl_block2\">$p_sougou{$f_id}</div>

</div>

<div class=\"bl_div\">
<div class=\"bl_block1\">十種</div>
<div class=\"bl_block2\">$p_10syu_sougou{$f_id}</div>

</div>
<div class=\"clear_b\"></div>
</td><td>

<div class=\"bl_div\">
<div class=\"bl_block1\">爵位</div>
<div class=\"bl_block2\">$LANK[$p_syakui{$f_id}]</div>

</div>
<div class=\"bl_div\">
<div class=\"bl_block1\">貢献</div>
<div class=\"bl_block2\">$p_kuni_kouken{$f_id}</div>

</div>

<div class=\"bl_div\">
<div class=\"bl_block1\">従年</div>
<div class=\"bl_block2\">$p_kuni_sikan_nensuu{$f_id}</div>

</div>

<div class=\"bl_div\">
<div class=\"bl_block1\">義理</div>
<div class=\"bl_block2\">$p_exgiri{$f_id}</div>

</div>

<div class=\"bl_div\">
<div class=\"bl_block1\">撃破</div>
<div class=\"bl_block2\">$p_gekiha{$f_id}</div>

</div>
<div class=\"clear_b\"></div>
</td><td>

<div class=\"bl_div\">
<div class=\"bl_block1\">民族</div>
<div class=\"bl_block2\">$MINZOKUSAN[$p_minzoku{$f_id}]</div>

</div>

<div class=\"bl_div\">
<div class=\"bl_block1\">金</div>
<div class=\"bl_block2\">$p_syoji_kin{$f_id}</div>

</div>

<div class=\"bl_div\">
<div class=\"bl_block1\">米</div>
<div class=\"bl_block2\">$p_syoji_kome{$f_id}</div>

</div>

<div class=\"bl_div\">
<div class=\"bl_block1\">風評</div>
<div class=\"bl_block2\">$HUUHYOU[$p_sekentei{$f_id}]</div>

</div>

<div class=\"bl_div\">
<div class=\"bl_block1\">将疲</div>
<div class=\"bl_block2\">$p_b_hirou{$f_id}</div>

</div>
<div class=\"clear_b\"></div>
</td><td>

<div class=\"bl_div\">
<div class=\"bl_block1\">兵種</div>
<div class=\"bl_block2\">$SOL_TYPE[$p_heisyu{$f_id}]</div>

</div>
<div class=\"bl_div\">
<div class=\"bl_block1\">兵数</div>
<div class=\"bl_block2\">$p_heisisuu{$f_id}</div>

</div>

<div class=\"bl_div\">
<div class=\"bl_block1\">訓練</div>
<div class=\"bl_block2\">$p_kunren{$f_id}</div>

</div>

<div class=\"bl_div\">
<div class=\"bl_block1\">士気</div>
<div class=\"bl_block2\">$p_hei_siki{$f_id}</div>

</div>

<div class=\"bl_div\">
<div class=\"bl_block1\">兵疲</div>
<div class=\"bl_block2\">$p_h_hirou{$f_id}</div>

</div>
<div class=\"clear_b\"></div>

</td>
</tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td colspan=\"6\">Last login$tt_date</td></tr>";
			}
			$c[$k_kunino{$fk_id}]++;
			$c2[$p_kunino{$f_id}]++;
		}
	}
	closedir(DFR);

		
		$mapseisei = "";
		$mapseisei .= "
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/main.css\" />
<title>$GAME_TITLE</title>
</head><body>$TAG_div_s{$doc_mode}

";


	$k_iro_d{$fk_id}=int($k_iro_d{$fk_id});

		$mapseisei .= "
	<table class=\"kbgcb0\" width=\"600\"><tr><td colspan=\"2\" class=\"kbgcb0\"><span class=\"txtc\"><span class=\"kcc0\"><span class=\"fs4\">凍結武将一覧</span></span></td></tr><tr><td class=\"kbgcc0\"><span class=\"kcb0\">武将数</span></td><td class=\"kbgcc0\"><span class=\"kcb0\"> $c[0] 名</td></tr></table><br />
<table class=\"kbgcb0\" width=\"600\" border=\"0\">
<tr class=\"kbgcb0\"><td class=\"txth\" width=\"96\"></td><td class=\"txth\" width=124></td><td class=\"txth\" width=\"70\"></td><td class=\"txth\" width=\"105\"></td><td class=\"txth\" width=\"105\"></td><td class=\"txth\" width=\"105\"></td></tr>
$l_rank[0] $list[0] 
</tr>
</table><br /><br /><br /><br /><br />
</div></body></html>";

	open(OUT,">./w_db/kuni/$in{'k'}.html");
	print OUT $mapseisei;
	close(OUT);

	
	}
	}
		$add_tosi_s_url = "./w_db/kuni/$in{'k'}.html";
#$doc_mode = "x";
	&HEADER;
print <<"PRI";
<iframe title=\"\" src=\"$add_tosi_s_url\" name=\"seiryoku\" width=\"100%\" height=\"605\" frameborder=\"0\" border=\"0\">
<ilayer src=\"$add_tosi_s_url\" name=\"seiryoku\" width=\"160\" height=\"500\" frameborder=\"0\" border=\"0\">インラインフレームに対応していない方は下のリンクで新しい窓を開いてください。<br /><a href=\"$add_tosi_s_url\" target=\"seiryoku\">入り口</a>
</ilayer> 
</iframe>
<a href=\"$URI/b_itiran.html\">登録武将一覧へ戻る</a>
</div></body></html>
PRI



	exit;

}

1;