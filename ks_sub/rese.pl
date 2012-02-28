
sub RESET_TOUITU{

	&TT_GET;

#####まとめ######

			$lockfiledtenka_f_l_d = 1;

require "$mpg_r/sub_db/p_b.pl";
require "$mpg_r/sub_db/p_k.pl";
			open(IN,"./w_db/tenka.cgi");
			$tenka_new = <IN>;
			close(IN);
	($tenkaid,$tenkaname) = split(/<>/,$tenka_new);


		$fk_id = $tenkaid;
	$zensyuminzoku = $k_syuminzoku{$fk_id};
	$syuminzoku = $k_syuminzoku{$fk_id};
	

	$m_tt=$tt;
	$m_tt1=$m_tt;
			($qsec,$qmin,$qhour,$qday) = localtime($m_tt);
				&KTS1;
		if($m_tt ne $m_tt1){
	$m_tt=$m_tt1 + 14400;
	$m_tt1=$m_tt;
			($qsec,$qmin,$qhour,$qday) = localtime($m_tt);
				&KTS1;
		}
		if($m_tt ne $m_tt1){
	$m_tt=$m_tt1 + 14400;
	$m_tt1=$m_tt;
			($qsec,$qmin,$qhour,$qday) = localtime($m_tt);
				&KTS1;
		}
		if($m_tt ne $m_tt1){
	$m_tt=$m_tt1 + 14400;
	$m_tt1=$m_tt;
			($qsec,$qmin,$qhour,$qday) = localtime($m_tt);
				&KTS1;
		}
		if($m_tt ne $m_tt1){
	$m_tt=$m_tt1 + 14400;
	$m_tt1=$m_tt;
			($qsec,$qmin,$qhour,$qday) = localtime($m_tt);
				&KTS1;
		}
		if($m_tt ne $m_tt1){
	$m_tt=$m_tt1 + 14400;
	$m_tt1=$m_tt;
			($qsec,$qmin,$qhour,$qday) = localtime($m_tt);
				&KTS1;
		}
		if($m_tt ne $m_tt1){
	$m_tt=$m_tt1 + 14400;
	$m_tt1=$m_tt;
			($qsec,$qmin,$qhour,$qday) = localtime($m_tt);
				&KTS1;
		}
	$m_tt += 86400 * 7;

	$rekimaprid = sprintf("%05d\.html", $tenkakaisuu);
		$outyou_URL="<a href=\"../$rekimaprid\">$outyou</a>";
	$rrekimaprid = sprintf("%05d", $tenkakaisuu);
	$ryfmaprid = sprintf("%05d\-%04d", $tenkakaisuu, $KAISI_NEN+$pmyear+1);
	$yfmaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear+1);

	if($keika_nen<1){
$keika_nen = 1;
	}
require "$mpg_r/sub_db/umare.pl";
require "$mpg_r/sub_db/tw.pl";

require "$mpg_r/sub_db/kanbu.pl";

#   RANK1    #
	@c=();

require "$mpg_r/sub_db/1.pl";
	open(IN,"./w_db/k_db_l_kuni_db.cgi");
	@KUNI_S_DATA = <IN>;
	close(IN);

		@xcidt = ();
		@xcidb = ();
		$add_k_tw = "";
	foreach(@KUNI_S_DATA){
		($fk_id)=split(/,/);
		$k_name_d[$k_kunino{$fk_id}]="$k_name{$fk_id}";
		$c[$k_kunino{$fk_id}]=0;
		

		$add_k_t[$k_kunino{$fk_id}] = $add_k_tw;
	if($add_k_t[$k_kunino{$fk_id}] eq ""){
		$add_k_t[$k_kunino{$fk_id}] = "t";
	}
	if($add_k_t[$add_k_tw] ne ""){
		$add_k_b[$add_k_tw] = $k_kunino{$fk_id};
	}
		$add_k_tw = $k_kunino{$fk_id};


	}
		$add_k_b[$add_k_tw] = "m";

	open(IN,"./w_db/k_db_d_l_kuni_db.cgi");
	@KUNI_DB_NO_L = <IN>;
	close(IN);

	foreach(@KUNI_DB_NO_L){
		($fk_id)=split(/,/);
					$list_kuni_all .= "$k_p_k_a{$fk_id} ";

	}
#################
	$msyuto = 0;
	$syutohit=0;
	$wzname="";
#################
		$l = 0;
	while ($l<$tosi_kazu) {
							$ft_id = $l;
#################
	if(int($t_ryoumin_suu{$ft_id} * $t_hanei{$ft_id}) >= $syutohit){$syutohit = $t_ryoumin_suu{$ft_id} * $t_hanei{$ft_id};
	$wzname=$t_name{$ft_id};
	$msyuto = $l;
	}

		$l++;
	}



	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

	$old_date = "<a href=\"./$rekimaprid\" target=\"_blank\">$outyou</a> <a href=\"./$yymaprid\" target=\"_blank\">$old_date</a>";

	@list=();
	@lista=();
	@list_etc=();

		@cbl = ();
	$i=0;
$bnheikin = 0;
$bcheikin = 0;
	foreach(@CL_DATA) {
			($f_id) = split(/,/);
$bnheikin += $p_sougou{$f_id};

$bcheikin += $p_10syu_sougou{$f_id};
				

		$fk_id = $p_kunino{$f_id};
			if($k_kunino{$fk_id} > 0){

#				$khsnp = "";
#				if($p_pet_type{$f_id}[0]){
#				$khsnp = $p_pet_name{$f_id}[0];
#				}
				if($c[$p_kunino{$f_id}] <= $EN_MAX){
	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id","$f_id","","","","","","","");
					$p_sougou{$f_id} = $p_buryoku{$f_id} + $p_tiryoku{$f_id} + $p_tousotu{$f_id};
				$list[$p_kunino{$f_id}] .= "<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>$img_sakusei_kekka</td><td class=\"txth\"><a href=\"./db/$rrekimaprid-$f_id.html\" target=\"_blank\"><span class=\"c404000\">$p_name{$f_id}</a></td>
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
<div class=\"bl_block1\">三種</div>
<div class=\"bl_block2\">$p_sougou{$f_id}</div>

</div>

<div class=\"bl_div\">
<div class=\"bl_block1\">十種</div>
<div class=\"bl_block2\">$p_10syu_sougou{$f_id}</div>

</div>

<div class=\"bl_div\">
<div class=\"bl_block1\">人望</div>
<div class=\"bl_block2\">$p_jinbou{$f_id}</div>

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
</tr>";
				}else{
					$lista[$p_kunino{$f_id}] .= "<a href=\"./db/$rrekimaprid-$f_id.html\" target=\"_blank\"><span class=\"c404000\">$p_name{$f_id}</span></a> ";
				}
				$c[$p_kunino{$f_id}]++;
				$cbl[$p_kunino{$f_id}]++;
			}else{
				$musyozoku .= "<a href=\"./db/$rrekimaprid-$f_id.html\" target=\"_blank\"><span class=\"c404000\">$p_name{$f_id}</span></a> ";
			}
	}


		
		$mapseisei = "";
		$mapseisei .= "
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/main.css\" />
<title>$GAME_TITLE$MEN_TITLE $outyou《  登録武将一覧  》</title>
</head><body>$TAG_div_s{$doc_mode}
<a id=\"t\"></a>\[$old_date\]月初めに編集$tt_date（登録武将数$sousu3）<br /><br />

";

	foreach(@KUNI_S_DATA){
		($fk_id)=split(/,/);
	$l_rank[$k_kunino{$fk_id}] = "<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td class=\"txth\" colspan=\"2\">家老筆頭</td><td class=\"txth\">能力</td><td class=\"txth\">功績</td><td class=\"txth\">備考</td><td class=\"txth\">軍備</td></tr>";


	$wkousen[$k_kunino{$fk_id}] = $k_kousen_aite_name{$k_kunino{$fk_id}};



				&KANBU_NAME;
		&ADD_BL_SEISEI;
		$mapseisei .= $add_bl_seisei;

		$mapseisei .= "
<table class=\"kbgcb$k_iro_d{$fk_id}\">
<tr class=\"kbgcb$k_iro_d{$fk_id}\"><td class=\"txth\" width=\"96\"></td><td class=\"txth\" width=\"124\"></td><td class=\"txth\" width=\"70\"></td><td class=\"txth\" width=\"105\"></td><td class=\"txth\" width=\"105\"></td><td class=\"txth\" width=\"105\"></td></tr>
$l_rank[$k_kunino{$fk_id}] $list[$k_kunino{$fk_id}] 
</tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td class=\"kbgcc$k_iro_d{$fk_id}\" colspan=\"6\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$lista[$k_kunino{$fk_id}]</span>
</td></tr>
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
";
	}


	opendir(DFR,"./p_db/touketu");
	while($f_id = readdir(DFR)){
		if($f_id =~ /\.cgi/i){
$f_id =~ s/\.cgi//;
			if(!$p_id{$f_id}){
	&P_READ("touketu","$f_id","$f_id");
			}
				$list_tou .= "<a href=\"./db/$rrekimaprid-$f_id.html\" target=\"_blank\"><span class=\"c404000\">$p_name{$f_id}</span></a> ";

		}
	}
	closedir(DFR);

		$mapseisei .= "
<a id=\"m\"></a>
<div class=\"blt_div\">
<div class=\"blt_block1\"><a href=\"#$add_k_tw\">↑</a></div>
<div class=\"blt_block2\">
<table width=\"100%\" class=\"kbgcb0\"><tr><td class=\"kbgcb0\"><div class=\"txth\"><span class=\"kcc0\"><span class=\"fs4\">無所属</span></span></div></td></tr><tr><td class=\"kbgcc0\"><div class=\"txtc\"><a href=\"./?.m.=blist&amp;.k.=0\">放浪者一覧</a></div></td></tr></table><br />
<table width=\"100%\" class=\"kbgcb0\" border=\"0\">
<tr class=\"kbgcc0\"><td class=\"kbgcc0\">$musyozoku
</td></tr></table>
</div>
<div class=\"blt_block3\"><a href=\"#f\">↓</a></div>
</div></div><div class=\"clear_b\"></div>
<br /><br /><br /><br />

<a id=\"f\"></a>
<div class=\"blt_div\">
<div class=\"blt_block1\"><a href=\"#m\">↑</a></div>
<div class=\"blt_block2\">
<table width=\"100%\" class=\"kbgcb0\"><tr><td class=\"kbgcb0\" ><div class=\"txth\"><span class=\"kcc0\"><span class=\"fs4\">凍結武将一覧</span></span></div></td></tr><tr><td class=\"kbgcc0\"><div class=\"txtc\"><a href=\"./?.m.=blist&amp;.k.=t\">武将一覧</a></div></td></tr></table><br />
<table width=\"100%\" class=\"kbgcb0\" border=\"0\">
<tr class=\"kbgcc0\"><td class=\"kbgcc0\"><div class=\"txtc\"><span class=\"kcb0\">詳細情報は武将一覧を参照のこと</span></div>
</td></tr></table>
</div>
<div class=\"blt_block3\"><a href=\"#f\">↓</a></div>
</div></div><div class=\"clear_b\"></div>

<br /><br /><br /><br />

<a id=\"r\"></a>
<div class=\"blt_div\">
<div class=\"blt_block1\"><a href=\"#f\">↑</a></div>
<div class=\"blt_block2\">
<table width=\"100%\" class=\"kbgcb0\"><tr><td class=\"kbgcb0\"><div class=\"txth\"><span class=\"kcc0\"><span class=\"fs4\">各国の歴史</span></span></div></td></tr></table><br />
<table width=\"100%\" class=\"kbgcb0\" border=\"0\">
<tr class=\"kbgcc0\"><td class=\"kbgcc0\">$list_kuni_all
</td></tr></table>
</div>
<div class=\"blt_block3\"><a href=\"#f\">↓</a></div>
</div></div><div class=\"clear_b\"></div>

<br /><br /><br /><br />
<form action=\"./\" method=\"post\" utn=\"utn\">
<input type=\"submit\" value=\"戻る\"></form>


</div></body></html>";

	open(OUT,">./mapr/$rrekimaprid-b_itiran.html");
	print OUT $mapseisei;
	close(OUT);

	@BUSYOU=();
	foreach(@KUNI_DB_NO_L){
		($fk_id)=split(/,/);
		$cbl[$k_kunino{$fk_id}] = int($cbl[$k_kunino{$fk_id}]);

	}
#   RANK1    #



#########
	%kuni_kurikosi=();
		$addcno = 4;
#######
	@CL_DATAMR = ();
	open(IN,"./w_db/k_db_l_kuni_db.cgi");
	@KUNI_S_DATA = <IN>;
	close(IN);
	foreach(@k_no_all_l){
$fk_id = $_;
				push(@CL_DATAMR,"$k_kunino{$fk_id}<>$k_name{$fk_id}<>$k_iro_d{$fk_id}<>$town_get[$k_kunino{$fk_id}]<>$k_busyou_suu{$fk_id}<>$k_kokui{$fk_id}<>$k_outo{$fk_id}<>\n");

##########
		if($tenkaid eq $k_kunino{$fk_id} and !$kuni_kurikosi{$fk_id}){
		$kuni_kurikosi{$fk_id} = 1;
		}elsif($k_kokka_keitai{$fk_id} and $k_kunino{$fk_id} and !$kuni_kurikosi{$fk_id}){
		$kuni_kurikosi{$fk_id} = $addcno;
		$addcno ++;
		}elsif(!$kuni_kurikosi{$fk_id}){
		$kuni_kurikosi{$fk_id} = 0;
		}
###########
	}

	@tmp = map {(split /<>/)[4]} @CL_DATAMR;
	@CL_DATAMR = @CL_DATAMR[sort {$tmp[$b] <=> $tmp[$a]} 0 .. $#tmp];

	@tmp = map {(split /<>/)[3]} @CL_DATAMR;
	@CL_DATAMR = @CL_DATAMR[sort {$tmp[$b] <=> $tmp[$a]} 0 .. $#tmp];

		$k_name_d[0] = "";

		$p2myear=$keika_nen;
		$p2mmonth=$tuki_genzai-1;
				if($p2mmonth < 1){
		$p2myear=$keika_nen-1;
		$p2mmonth=12;
				}
	$p2old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$p2myear, $p2mmonth);
	$p2maprid = sprintf("%05d\-%04d\-%02d\.html", $tenkakaisuu, $KAISI_NEN+$p2myear, $p2mmonth);

		$outyou_URL="<a href=\"../$rekimaprid\">$outyou</a>";
		$map2year_URL="<a href=\"../$yymaprid\">$map2year年</a>";
		$p2old_date_URL="\[<a href=\"./$p2maprid\">$p2old_date</a>\]←";
		$fold_dat_URL="";
		$mapseisei_in_URL="./mapr/tuki/$ymaprid";
	&MAPSR;
	
@S_MOVE = ();
	open(OUT,">./w_db/map_log2r.cgi");
	print OUT @S_MOVE;
	close(OUT);
	open(OUT,">./w_db/map_log3.cgi");
	print OUT @S_MOVE;
	close(OUT);

	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

	$old_date = "<a href=\"./../$rekimaprid\" target=\"_blank\"><span class=\"cFFFFFF\">$outyou</span></a> <a href=\"./../$yymaprid\" target=\"_blank\"><span class=\"cFFFFFF\">$old_date</span></a>";

&RANK_MAKE;



		$mapseisei .= "
<form action=\"./\" method=\"post\" utn=\"utn\"><div>
<input type=\"submit\" value=\"戻る\" /></div></form>

</div></body></html>";

	open(OUT,">./mapr/$rrekimaprid-meisyou.html");
	print OUT $mapseisei;
	close(OUT);
#   RANK2    #
$bnheikin = int($bnheikin / $sousu1);
$bnheikin = int($bnheikin / 3)+1;
$bcheikin = int($bcheikin / $sousu1)+1;

	open(IN,"./w_db/k_db_d_l_kuni_db.cgi");
	@KUNI_DB_NO_L = <IN>;
	close(IN);
	$country_no=1;

	foreach(@KUNI_DB_NO_L){
		($fk_id)=split(/,/);
			unlink("./w_db/guest/msdk_$fk_id.cgi");
		$country_no++;
	}

	@CL_DATA=();
	opendir(DFR,"./p_db/p");
	while($f_id = readdir(DFR)){
		if($f_id =~ /\.cgi/i){
$f_id =~ s/\.cgi//;

		$fk_id = $p_kunino{$f_id};
	
			unlink("./p_db/tt/$f_id.cgi");
							$fbutai_id = int($p_butaino{$f_id});
							$fgundan_id = int($p_gundanno{$f_id});

	open(IN,"./p_db/rank/$f_id.cgi");
	@CN_DATA = <IN>;
	close(IN);
	($rsougoup,$rsougouj,$rbujyokup,$rbujyokuj,$rtiryokup,$rtiryokuj,$rtousotup,$rtousotuj,$rjyussyup,$rjyussyuj,$rkijyoup,$rkijyouj,$rsyagekip,$rsyagekij,$rbujyutup,$rbujyutuj,$rjyujyutup,$rjyujyutuj,$rtyouhoup,$rtyouhouj,$rjyuukisoudap,$rjyuukisoudaj,$rtyoukyoup,$rtyoukyouj,$rjinboup,$rjinbouj,$rseijip,$rseijij,$rsinyoup,$rsinyouj,$rgogyou_kap,$rgogyou_kaj,$rgogyou_suip,$rgogyou_suij,$rgogyou_mokup,$rgogyou_mokuj,$rgogyou_kinp,$rgogyou_kinj,$rgogyou_dop,$rgogyou_doj,$rkarumalcp,$rkarumalc_lj,$rkarumalc_cj,$rkarumaldp,$rkarumald_lj,$rkarumald_dj,$rgekihap,$rgekihaj,$rsisanp,$rsisanj,$rn_meiseip,$rn_meiseij,$rlcl_meiseip,$rlcl_meiseij,$rlcc_meiseip,$rlcc_meiseij,$rldl_meiseip,$rldl_meiseij,$rldd_meiseip,$rldd_meiseij,$rgirip,$rgirij) = split(/<>/,$CN_DATA[0]);


				$khsnp = "";
				if($p_pet_type{$f_id}[0]){
				$khsnp = $p_pet_name{$f_id}[0];
				}
		$add_com = "";
		$add_com2 = "";

	if($gundan_yakusyoku_id{$fgundan_id}[1] eq $f_id){
		$add_com = "<>軍団長";
	}
		$add_com2 = "";
	if($butai_yakusyoku_id{$fbutai_id}[1] eq $f_id){
		$add_com2 = "<>隊長";
	}
		$rank_mes = "";

require "$mpg_r/sub_db/kanbu.pl";

				&KANBU_NAME;

	if($p_kuni_yakusyoku{$f_id}){
		$rank_mes = "【${$zokukanbuptn}[$p_kuni_yakusyoku{$f_id}]】";
	}

$S_MES = "";
	open(IN,"./pr/b/$f_id.cgi");
	@F_LOG2 = <IN>;
	close(IN);

	$khy = "";
	$khc = "";
	$khi = "";
	$kh1 = "";
	$kh2 = "";
	$kh3 = "";
	$kyj = "";
	$ksj = "";
	$kgj = "";
	$ktr = "";
	$kmg = "";
	$ksk = "";
	$ksn1 = "";
	$ksn2 = "";
	$ksn3 = "";
	$ksn4 = "";
	$ksnp = "";
	$khk = "";
	$kf16 = "";
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
	open(IN,"./pr/blog/$f_id.cgi");
	@MES_REG1 = <IN>;
	close(IN);
	$p=0;
		foreach(@MES_REG1){
			($bb2) = split(/<>/);
$bb2 =~ s/mapr\/db\///g;
$S_MES .= "<span class=\"c228B22\">●</span>$bb2<br />";}

	if($khsn4 eq ""){
$khsn4 = "$UMARE[$p_syussei{$f_id}]";
	}

$p_sougou{$f_id} = $p_buryoku{$f_id} + $p_tiryoku{$f_id} + $p_tousotu{$f_id};

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id","$f_id","","","","","","","");
   		$mapseisei = "
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/rekisi.css\" />
<title>$GAME_TITLE$MEN_TITLE $outyou</title>
</head><body $datev3>$TAG_div_s{$doc_mode}
";

	&P_B_1;
   		$mapseisei .= $add_p_come;
   		$mapseisei .= "

</div></div>
";

	&P_B_2;
   		$mapseisei .= $add_p_come;
   		$mapseisei .= "
<br /><br /><hr /><a href=\"../$rrekimaprid-b_itiran.html\" target=\"_top\">武将一覧画面に戻る</a><br /><br /><hr /><a href=\"../$rrekimaprid-meisyou.html\" target=\"_top\">名将一覧画面に戻る</a><br />
</td></tr></table>
</div></body></html>";

$mapseisei =~ s/mapr\/db/\.\./g;
	open(OUT,">./mapr/db/$rrekimaprid-$f_id.html");
	print OUT $mapseisei;
	close(OUT);
	

			$p_sougou{$f_id} = $p_buryoku{$f_id}+$p_tiryoku{$f_id}+$p_tousotu{$f_id};
$p_10syu_sougou{$f_id} = $p_kijyou{$f_id}+$p_syageki{$f_id}+$p_bujyutu{$f_id}+$p_jyujyutu{$f_id}+$p_tyouhou{$f_id}+$p_jyuukisouda{$f_id}+$p_tyoukyou{$f_id}+$p_jinbou{$f_id}+$p_seiji{$f_id}+$p_sinyou{$f_id};
			$p_kuni_nenkou{$f_id} = $p_kuni_kouken{$f_id} + $p_kuni_sikan_nensuu{$f_id} * 150 + $p_neutral_meisei{$f_id};
			$p_sousisan{$f_id} = $p_syoji_kome{$f_id} + $p_syoji_kin{$f_id};
				&P_SAVE("p","$f_id","$f_id");
			push(@CL_DATA,"@NEW_D");

$p_jikan{$f_id} = $m_tt - $kousin_kankaku - int(rand($kousin_kankaku-1)+1);

$p_ex_buryoku{$f_id}= int(50 * $p_buryoku{$f_id} /$bnheikin)+ int(500 * $p_buryoku{$f_id} * 3 /($p_sougou{$f_id}+1));
$p_ex_tiryoku{$f_id}= int(50 * $p_tiryoku{$f_id} /$bnheikin)+ int(500 * $p_tiryoku{$f_id} * 3 /($p_sougou{$f_id}+1));
$p_ex_tousotu{$f_id}= int(50 * $p_tousotu{$f_id} /$bnheikin)+ int(500 * $p_tousotu{$f_id} * 3 /($p_sougou{$f_id}+1));
$p_syoji_kin{$f_id} = int($p_syoji_kin{$f_id} * 10 /($keika_nen+1)) + $p_gekiha{$f_id} * 1000;
$p_syoji_kome{$f_id} = int($p_syoji_kome{$f_id} * 10 /($keika_nen+1)) + $p_neutral_meisei{$f_id} + $p_jinbou{$f_id} * 1000;

$p_buryoku{$f_id}= 0;
$p_tiryoku{$f_id}= 0;
$p_tousotu{$f_id}= 0;
				if($p_ex_buryoku{$f_id} >= 10){
					$add_5= int($p_ex_buryoku{$f_id} /10);
					$p_buryoku{$f_id}+=$add_5;
					$p_ex_buryoku{$f_id}-=10 * $add_5;
				}
				if($p_ex_tiryoku{$f_id} >= 10){
					$add_6= int($p_ex_tiryoku{$f_id} /10);
					$p_tiryoku{$f_id}+=$add_6;
					$p_ex_tiryoku{$f_id}-=10 * $add_6;
				}
				if($p_ex_tousotu{$f_id} >= 10){
					$add_7= int($p_ex_tousotu{$f_id} /10);
					$p_tousotu{$f_id}+=$add_7;
					$p_ex_tousotu{$f_id}-=10 * $add_7;
				}
$p_ex_kijyou{$f_id}= int(3500 * $p_kijyou{$f_id} /$bcheikin)+ 300;
$p_ex_syageki{$f_id}= int(3500 * $p_syageki{$f_id} /$bcheikin)+ 300;
$p_ex_bujyutu{$f_id}= int(3500 * $p_bujyutu{$f_id} /$bcheikin)+ 300;
$p_ex_jyujyutu{$f_id}= int(3500 * $p_jyujyutu{$f_id} /$bcheikin)+ 300;
$p_ex_tyouhou{$f_id}= int(3500 * $p_tyouhou{$f_id} /$bcheikin)+ 300;
$p_ex_jyuukisouda{$f_id}= int(3500 * $p_jyuukisouda{$f_id} /$bcheikin)+ 300;
$p_ex_tyoukyou{$f_id}= int(3500 * $p_tyoukyou{$f_id} /$bcheikin)+ 300;
$p_ex_jinbou{$f_id}= int(3500 * $p_jinbou{$f_id} /$bcheikin)+ 300;
$p_ex_seiji{$f_id}= int(3500 * $p_seiji{$f_id} /$bcheikin)+ 300;
$p_ex_sinyou{$f_id}= int(3500 * $p_sinyou{$f_id} /$bcheikin)+ 300;

$p_kijyou{$f_id}= 0;
$p_syageki{$f_id}= 0;
$p_bujyutu{$f_id}= 0;
$p_jyujyutu{$f_id}= 0;
$p_tyouhou{$f_id}= 0;
$p_jyuukisouda{$f_id}= 0;
$p_tyoukyou{$f_id}= 0;
$p_jinbou{$f_id}= 0;
$p_seiji{$f_id}= 0;
$p_sinyou{$f_id}= 0;

				if($p_ex_kijyou{$f_id} >= 10){
					$add_8= int($p_ex_kijyou{$f_id} /10);
					$p_kijyou{$f_id}+=$add_8;
					$p_ex_kijyou{$f_id}-=10 * $add_8;
				}
				if($p_ex_syageki{$f_id} >= 10){
					$add_8= int($p_ex_syageki{$f_id} /10);
					$p_syageki{$f_id}+=$add_8;
					$p_ex_syageki{$f_id}-=10 * $add_8;
				}
				if($p_ex_bujyutu{$f_id} >= 10){
					$add_8= int($p_ex_bujyutu{$f_id} /10);
					$p_bujyutu{$f_id}+=$add_8;
					$p_ex_bujyutu{$f_id}-=10 * $add_8;
				}
				if($p_ex_jyujyutu{$f_id} >= 10){
					$add_8= int($p_ex_jyujyutu{$f_id} /10);
					$p_jyujyutu{$f_id}+=$add_8;
					$p_ex_jyujyutu{$f_id}-=10 * $add_8;
				}
				if($p_ex_tyouhou{$f_id} >= 10){
					$add_8= int($p_ex_tyouhou{$f_id} /10);
					$p_tyouhou{$f_id}+=$add_8;
					$p_ex_tyouhou{$f_id}-=10 * $add_8;
				}
				if($p_ex_jyuukisouda{$f_id} >= 10){
					$add_8= int($p_ex_jyuukisouda{$f_id} /10);
					$p_jyuukisouda{$f_id}+=$add_8;
					$p_ex_jyuukisouda{$f_id}-=10 * $add_8;
				}
				if($p_ex_tyoukyou{$f_id} >= 10){
					$add_8= int($p_ex_tyoukyou{$f_id} /10);
					$p_tyoukyou{$f_id}+=$add_8;
					$p_ex_tyoukyou{$f_id}-=10 * $add_8;
				}
				if($p_ex_jinbou{$f_id} >= 10){
					$add_8= int($p_ex_jinbou{$f_id} /10);
					$p_jinbou{$f_id}+=$add_8;
					$p_ex_jinbou{$f_id}-=10 * $add_8;
				}
				if($p_ex_seiji{$f_id} >= 10){
					$add_8= int($p_ex_seiji{$f_id} /10);
					$p_seiji{$f_id}+=$add_8;
					$p_ex_seiji{$f_id}-=10 * $add_8;
				}
				if($p_ex_sinyou{$f_id} >= 10){
					$add_8= int($p_ex_sinyou{$f_id} /10);
					$p_sinyou{$f_id}+=$add_8;
					$p_ex_sinyou{$f_id}-=10 * $add_8;
				}
	$get_sol[0] = $p_tousotu{$f_id} + int(($p_buryoku{$f_id} + $p_tousotu{$f_id} + $p_tiryoku{$f_id})*0.1);
	$get_sol[1] = int($p_tiryoku{$f_id}*0.5) + int(($p_buryoku{$f_id} + $p_tousotu{$f_id} + $p_tiryoku{$f_id})*0.1);
	$get_sol[2] = $p_buryoku{$f_id} + int(($p_buryoku{$f_id} + $p_tousotu{$f_id} + $p_tiryoku{$f_id})*0.1);
									$solmax = $get_sol[$SOL_MAXT[$p_heisyu{$f_id}]];
$p_heisisuu{$f_id}= $solmax;
$p_kunren{$f_id}= 0;
$p_gekiha{$f_id}= 0;
$p_kuni_kouken{$f_id}= int($p_kuni_kouken{$f_id} /$keika_nen);
$p_neutral_meisei{$f_id}= int($p_neutral_meisei{$f_id} /$keika_nen);
$p_law_meisei{$f_id} = int($p_dark_meisei{$f_id} /$keika_nen);
$p_chaos_meisei{$f_id} = int($p_dark_meisei{$f_id} /$keika_nen);
$p_light_meisei{$f_id} = int($p_dark_meisei{$f_id} /$keika_nen);
$p_dark_meisei{$f_id} = int($p_dark_meisei{$f_id} /$keika_nen);
$p_ex_karumalc{$f_id} = int($p_ex_karumalc{$f_id} /$keika_nen);
$p_ex_karumald{$f_id} = int($p_ex_karumald{$f_id} /$keika_nen);

	$wksex = $p_syussei{$f_id} % 100;
		if($wksex eq "31"){
$p_gogyou_ka{$f_id} = int(($p_gogyou_ka{$f_id} - 20) /$keika_nen)+20;
$p_gogyou_sui{$f_id} = int(($p_gogyou_sui{$f_id} - 20) /$keika_nen)+20;
$p_gogyou_moku{$f_id} = int(($p_gogyou_moku{$f_id} - 20) /$keika_nen)+20;
$p_gogyou_kin{$f_id} = int(($p_gogyou_kin{$f_id} - 20) /$keika_nen)+20;
$p_gogyou_do{$f_id} = int(($p_gogyou_do{$f_id} - 20) /$keika_nen)+20;
		}else{
$p_gogyou_ka{$f_id} = int($p_gogyou_ka{$f_id} /$keika_nen);
$p_gogyou_sui{$f_id} = int($p_gogyou_sui{$f_id} /$keika_nen);
$p_gogyou_moku{$f_id} = int($p_gogyou_moku{$f_id} /$keika_nen);
$p_gogyou_kin{$f_id} = int($p_gogyou_kin{$f_id} /$keika_nen);
$p_gogyou_do{$f_id} = int($p_gogyou_do{$f_id} /$keika_nen);
		}


$p_gundanid{$f_id} = "";
$p_butaiid{$f_id} = "";
$p_busyou_hp{$f_id} = 100;
$p_busyou_mp{$f_id} = 100;
$p_busyou_sp{$f_id} = 100;
$kptid = "";
$p_pk_kaisuu{$f_id} = 0;
$p_sekentei{$f_id} = 0;

$p_10syu_sougou{$f_id} = $p_kijyou{$f_id}+$p_syageki{$f_id}+$p_bujyutu{$f_id}+$p_jyujyutu{$f_id}+$p_tyouhou{$f_id}+$p_jyuukisouda{$f_id}+$p_tyoukyou{$f_id}+$p_jinbou{$f_id}+$p_seiji{$f_id}+$p_sinyou{$f_id};



			$p_sougou{$f_id} = $p_buryoku{$f_id}+$p_tiryoku{$f_id}+$p_tousotu{$f_id};
			$p_kuni_nenkou{$f_id} = $p_kuni_kouken{$f_id} + $p_kuni_sikan_nensuu{$f_id} * 150 + $p_neutral_meisei{$f_id};
			$p_sousisan{$f_id} = $p_syoji_kome{$f_id} + $p_syoji_kin{$f_id};

$p_kunren_max{$f_id}=100;
$p_sieki_kunren_max{$f_id}=50;
						if($p_buryoku{$f_id} > $p_kunren_max{$f_id}){
$p_kunren_max{$f_id}=$p_buryoku{$f_id};
$p_sieki_kunren_max{$f_id}= int($p_buryoku{$f_id}/2);
						}

	$get_sol[0] = $p_tousotu{$f_id} + int($p_sougou{$f_id}*0.1);
	$get_sol[1] = int($p_tiryoku{$f_id}*0.5) + int($p_sougou{$f_id}*0.1);
	$get_sol[2] = $p_buryoku{$f_id} + int($p_sougou{$f_id}*0.1);
									$p_heisisuu_max{$f_id} = $get_sol[$SOL_MAXT[$p_heisyu{$f_id}]];
						$p_syakui{$f_id} = int($p_neutral_meisei{$f_id} / $SYAKUI_P);
$zaddwmax=100;
						if($p_buryoku{$f_id} > $zaddwmax){
$zaddwmax=$p_buryoku{$f_id};
						}
						if($p_kunren{$f_id} > $zaddwmax){
							$p_kunren{$f_id} = $zaddwmax;
						}
					$ttid = "blog/$f_id";

	@S_MOVEPR = ();

	if($p_habatuno{$f_id}){
$p_habatu_sikan_nensuu{$f_id}+=100;
	}
	if($p_guildno{$f_id}){
$p_guild_sikan_nensuu{$f_id}+=100;
	}
	if($p_gundanno{$f_id}){
$p_gundan_sikan_nensuu{$f_id}+=100;
	}
	if($p_butaino{$f_id}){
$p_butai_sikan_nensuu{$f_id}+=100;
	}
	if($p_ptno{$f_id}){
$p_pt_sikan_nensuu{$f_id}+=100;
	}

	if($p_kunino{$f_id} eq $tenkaid){
$p_kuni_sikan_nensuu{$f_id}+=100;
	unshift(@S_MOVEPR,"\[$k_name_d[$tenkaid]暦元年\]$k_p_k_a{$tenkaid}が天下を統一し、それからしばらく平和な時が流れ、$p_name{$f_id}は$k_name_d[$tenkaid]の武将として幸せな生活を送ることとなる。$tt_date\n");

$p_kunino{$f_id} = 1;
$p_taizai_iti{$f_id} = $msyuto;
	if($p_syubi_eria{$f_id}){
						$defaddpos = "$p_syubi_eria{$f_id}";
						$defadditi = "$msyuto";
						$defaddid = "$f_id";
						$defaddname = "$p_name{$f_id}";
						$defaddcon = $kuni_kurikosi{$fk_id};
						$defaddhei = "$p_heisyu{$f_id}";
						$defadddbdb8 = "$p_syubi_eria{$f_id}";
						$defadddbdb9 = "$p_syubi_tosi{$f_id}";
						&DEF_M;
$kdbdb1 = "$t_name[$msyuto] $senno[$msyuto] ";
$p_syubi_tosi{$f_id} = $msyuto;
$p_syubi_eria{$f_id} = $p_syubi_eria{$f_id};
	}
	}elsif($k_kokka_keitai{$fk_id}){
$p_kunino{$f_id} = $kuni_kurikosi{$fk_id};
	if($p_syubi_eria{$f_id}){
						$defaddpos = "$p_syubi_eria{$f_id}";
						$defadditi = "$k_outo{$fk_id}";
						$defaddid = "$f_id";
						$defaddname = "$p_name{$f_id}";
						$defaddcon = $kuni_kurikosi{$fk_id};
						$defaddhei = "$p_heisyu{$f_id}";
						$defadddbdb8 = "$p_syubi_eria{$f_id}";
						$defadddbdb9 = "$p_syubi_tosi{$f_id}";
						&DEF_M;
$kdbdb1 = "$t_name[$msyuto] $senno[$msyuto] ";
$p_syubi_tosi{$f_id} = $k_outo{$fk_id};
$p_syubi_eria{$f_id} = $p_syubi_eria{$f_id};
	}
$p_kuni_sikan_nensuu{$f_id}+=100;
	unshift(@S_MOVEPR,"\[$k_name_d[$tenkaid]暦元年\]$k_p_k_a{$tenkaid}が天下を統一し、それからしばらく平和な時が流れ、$p_name{$f_id}は$t_name[$p_taizai_iti{$f_id}]の山里に隠れひっそりと暮らすこととなる。$tt_date\n");
	}else{
	if($p_syubi_eria{$f_id}){
						$defaddpos = "0";
						$defadditi = "0";
						$defaddid = "$f_id";
						$defaddname = "$p_name{$f_id}";
						$defaddcon = $kuni_kurikosi{$fk_id};
						$defaddhei = "$p_heisyu{$f_id}";
						$defadddbdb8 = $p_syubi_eria{$f_id};
						$defadddbdb9 = $p_syubi_tosi{$f_id};
						&DEF_D;
$kdbdb1 = " ";
$p_syubi_tosi{$f_id} = 0;
$p_syubi_eria{$f_id} = 0;
	}
	unshift(@S_MOVEPR,"\[$k_name_d[$tenkaid]暦元年\]$k_p_k_a{$tenkaid}が天下を統一し、それからしばらく平和な時が流れ、$p_name{$f_id}は在野武将として諸国を放浪することとなる。$tt_date\n");

$p_kunino{$f_id} = 0;
	}

	open(OUT,">./pr/$ttid.cgi");
	print OUT @S_MOVEPR;
	close(OUT);

	&P_SAVE("p","$f_id","$f_id");
		}
	}
	closedir(DFR);

###################


	opendir(DFR,"./p_db/touketu");
	while($f_id = readdir(DFR)){
		if($f_id =~ /\.cgi/i){
$f_id =~ s/\.cgi//;
	if(!$p_id{$f_id}){
	&P_READ("touketu","$f_id","$f_id");
	}

			unlink("./p_db/tt/$f_id.cgi");
							$fbutai_id = int($p_butaino{$f_id});
							$fgundan_id = int($p_gundanno{$f_id});

			$ktenkakaisuu = 0;
	($ktenkakaisuu,$kmyear) = split(/<>/,$p_db_view[1]);
			$ktenkakaisuu = int($ktenkakaisuu);
			if(!$ktenkakaisuu or $ktenkakaisuu eq $tenkakaisuu){

		$fk_id = $p_kunino{$f_id};
	

	open(IN,"./p_db/rank/$f_id.cgi");
	@CN_DATA = <IN>;
	close(IN);
	($rsougoup,$rsougouj,$rbujyokup,$rbujyokuj,$rtiryokup,$rtiryokuj,$rtousotup,$rtousotuj,$rjyussyup,$rjyussyuj,$rkijyoup,$rkijyouj,$rsyagekip,$rsyagekij,$rbujyutup,$rbujyutuj,$rjyujyutup,$rjyujyutuj,$rtyouhoup,$rtyouhouj,$rjyuukisoudap,$rjyuukisoudaj,$rtyoukyoup,$rtyoukyouj,$rjinboup,$rjinbouj,$rseijip,$rseijij,$rsinyoup,$rsinyouj,$rgogyou_kap,$rgogyou_kaj,$rgogyou_suip,$rgogyou_suij,$rgogyou_mokup,$rgogyou_mokuj,$rgogyou_kinp,$rgogyou_kinj,$rgogyou_dop,$rgogyou_doj,$rkarumalcp,$rkarumalc_lj,$rkarumalc_cj,$rkarumaldp,$rkarumald_lj,$rkarumald_dj,$rgekihap,$rgekihaj,$rsisanp,$rsisanj,$rn_meiseip,$rn_meiseij,$rlcl_meiseip,$rlcl_meiseij,$rlcc_meiseip,$rlcc_meiseij,$rldl_meiseip,$rldl_meiseij,$rldd_meiseip,$rldd_meiseij,$rgirip,$rgirij) = split(/<>/,$CN_DATA[0]);


				$khsnp = "";
				if($p_pet_type{$f_id}[0]){
				$khsnp = $p_pet_name{$f_id}[0];
				}

		$add_com = "";
		$add_com2 = "";

	if($gundan_yakusyoku_id{$fgundan_id}[1] eq $f_id){
		$add_com = "<>軍団長";
	}
		$add_com2 = "";
	if($butai_yakusyoku_id{$fbutai_id}[1] eq $f_id){
		$add_com2 = "<>隊長";
	}
		$rank_mes = "";

require "$mpg_r/sub_db/kanbu.pl";


				&KANBU_NAME;

	if($p_kuni_yakusyoku{$f_id}){
		$rank_mes = "【${$zokukanbuptn}[$p_kuni_yakusyoku{$f_id}]】";
	}

$S_MES = "";
	open(IN,"./pr/b/$f_id.cgi");
	@F_LOG2 = <IN>;
	close(IN);

	$khy = "";
	$khc = "";
	$khi = "";
	$kh1 = "";
	$kh2 = "";
	$kh3 = "";
	$kyj = "";
	$ksj = "";
	$kgj = "";
	$ktr = "";
	$kmg = "";
	$ksk = "";
	$ksn1 = "";
	$ksn2 = "";
	$ksn3 = "";
	$ksn4 = "";
	$ksnp = "";
	$khk = "";
	$kf16 = "";
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
	open(IN,"./pr/blog/$f_id.cgi");
	@MES_REG1 = <IN>;
	close(IN);
	$p=0;
		foreach(@MES_REG1){
			($bb2) = split(/<>/);
$bb2 =~ s/mapr\/db\///g;
$S_MES .= "<span class=\"c228B22\">●</span>$bb2<br />";}

	if($khsn4 eq ""){
$khsn4 = "$UMARE[$p_syussei{$f_id}]";
	}

$p_sougou{$f_id} = $p_buryoku{$f_id} + $p_tiryoku{$f_id} + $p_tousotu{$f_id};
	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id","$f_id","","","","","","","");
   		$mapseisei = "
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<meta http-equiv=\"Content-type\" content=\"text/html; charset=UTF-8\" $TAG_s0>
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/rekisi.css\" />
<title>$GAME_TITLE$MEN_TITLE $outyou</title>
</head><body $datev3>$TAG_div_s{$doc_mode}
";

	&P_B_1;
   		$mapseisei .= $add_p_come;
   		$mapseisei .= "
</div></div>
";

	&P_B_2;
   		$mapseisei .= $add_p_come;
   		$mapseisei .= "
<br /><br /><hr /><a href=\"../$rrekimaprid-b_itiran.html\" target=\"_top\">武将一覧画面に戻る</a><br /><br /><hr /><a href=\"../$rrekimaprid-meisyou.html\" target=\"_top\">名将一覧画面に戻る</a><br />

</td></tr></table>

</div></body></html>";
$mapseisei =~ s/mapr\/db/\.\./g;
	open(OUT,">./mapr/db/$rrekimaprid-$f_id.html");
	print OUT $mapseisei;
	close(OUT);
			$p_sougou{$f_id} = $p_buryoku{$f_id}+$p_tiryoku{$f_id}+$p_tousotu{$f_id};
$p_10syu_sougou{$f_id} = $p_kijyou{$f_id}+$p_syageki{$f_id}+$p_bujyutu{$f_id}+$p_jyujyutu{$f_id}+$p_tyouhou{$f_id}+$p_jyuukisouda{$f_id}+$p_tyoukyou{$f_id}+$p_jinbou{$f_id}+$p_seiji{$f_id}+$p_sinyou{$f_id};
			$p_kuni_nenkou{$f_id} = $p_kuni_kouken{$f_id} + $p_kuni_sikan_nensuu{$f_id} * 300;
			$p_sousisan{$f_id} = $p_syoji_kome{$f_id} + $p_syoji_kin{$f_id};

$p_ex_buryoku{$f_id}= int(50 * $p_buryoku{$f_id} /$bnheikin)+ int(500 * $p_buryoku{$f_id} * 3 /($p_sougou{$f_id}+1));
$p_ex_tiryoku{$f_id}= int(50 * $p_tiryoku{$f_id} /$bnheikin)+ int(500 * $p_tiryoku{$f_id} * 3 /($p_sougou{$f_id}+1));
$p_ex_tousotu{$f_id}= int(50 * $p_tousotu{$f_id} /$bnheikin)+ int(500 * $p_tousotu{$f_id} * 3 /($p_sougou{$f_id}+1));
$p_syoji_kin{$f_id} = int($p_syoji_kin{$f_id} * 10 /($keika_nen+1)) + $p_gekiha{$f_id} * 1000;
$p_syoji_kome{$f_id} = int($p_syoji_kome{$f_id} * 10 /($keika_nen+1)) + $p_neutral_meisei{$f_id} + $p_jinbou{$f_id} * 1000;

$p_buryoku{$f_id}= 0;
$p_tiryoku{$f_id}= 0;
$p_tousotu{$f_id}= 0;

				if($p_ex_buryoku{$f_id} >= 10){
					$add_5= int($p_ex_buryoku{$f_id} /10);
					$p_buryoku{$f_id}+=$add_5;
					$p_ex_buryoku{$f_id}-=10 * $add_5;
				}
				if($p_ex_tiryoku{$f_id} >= 10){
					$add_6= int($p_ex_tiryoku{$f_id} /10);
					$p_tiryoku{$f_id}+=$add_6;
					$p_ex_tiryoku{$f_id}-=10 * $add_6;
				}
				if($p_ex_tousotu{$f_id} >= 10){
					$add_7= int($p_ex_tousotu{$f_id} /10);
					$p_tousotu{$f_id}+=$add_7;
					$p_ex_tousotu{$f_id}-=10 * $add_7;
				}

$p_ex_kijyou{$f_id}= int(3500 * $p_kijyou{$f_id} /$bcheikin)+ 300;
$p_ex_syageki{$f_id}= int(3500 * $p_syageki{$f_id} /$bcheikin)+ 300;
$p_ex_bujyutu{$f_id}= int(3500 * $p_bujyutu{$f_id} /$bcheikin)+ 300;
$p_ex_jyujyutu{$f_id}= int(3500 * $p_jyujyutu{$f_id} /$bcheikin)+ 300;
$p_ex_tyouhou{$f_id}= int(3500 * $p_tyouhou{$f_id} /$bcheikin)+ 300;
$p_ex_jyuukisouda{$f_id}= int(3500 * $p_jyuukisouda{$f_id} /$bcheikin)+ 300;
$p_ex_tyoukyou{$f_id}= int(3500 * $p_tyoukyou{$f_id} /$bcheikin)+ 300;
$p_ex_jinbou{$f_id}= int(3500 * $p_jinbou{$f_id} /$bcheikin)+ 300;
$p_ex_seiji{$f_id}= int(3500 * $p_seiji{$f_id} /$bcheikin)+ 300;
$p_ex_sinyou{$f_id}= int(3500 * $p_sinyou{$f_id} /$bcheikin)+ 300;

$p_kijyou{$f_id}= 0;
$p_syageki{$f_id}= 0;
$p_bujyutu{$f_id}= 0;
$p_jyujyutu{$f_id}= 0;
$p_tyouhou{$f_id}= 0;
$p_jyuukisouda{$f_id}= 0;
$p_tyoukyou{$f_id}= 0;
$p_jinbou{$f_id}= 0;
$p_seiji{$f_id}= 0;
$p_sinyou{$f_id}= 0;
				if($p_ex_kijyou{$f_id} >= 10){
					$add_8= int($p_ex_kijyou{$f_id} /10);
					$p_kijyou{$f_id}+=$add_8;
					$p_ex_kijyou{$f_id}-=10 * $add_8;
				}
				if($p_ex_syageki{$f_id} >= 10){
					$add_8= int($p_ex_syageki{$f_id} /10);
					$p_syageki{$f_id}+=$add_8;
					$p_ex_syageki{$f_id}-=10 * $add_8;
				}
				if($p_ex_bujyutu{$f_id} >= 10){
					$add_8= int($p_ex_bujyutu{$f_id} /10);
					$p_bujyutu{$f_id}+=$add_8;
					$p_ex_bujyutu{$f_id}-=10 * $add_8;
				}
				if($p_ex_jyujyutu{$f_id} >= 10){
					$add_8= int($p_ex_jyujyutu{$f_id} /10);
					$p_jyujyutu{$f_id}+=$add_8;
					$p_ex_jyujyutu{$f_id}-=10 * $add_8;
				}
				if($p_ex_tyouhou{$f_id} >= 10){
					$add_8= int($p_ex_tyouhou{$f_id} /10);
					$p_tyouhou{$f_id}+=$add_8;
					$p_ex_tyouhou{$f_id}-=10 * $add_8;
				}
				if($p_ex_jyuukisouda{$f_id} >= 10){
					$add_8= int($p_ex_jyuukisouda{$f_id} /10);
					$p_jyuukisouda{$f_id}+=$add_8;
					$p_ex_jyuukisouda{$f_id}-=10 * $add_8;
				}
				if($p_ex_tyoukyou{$f_id} >= 10){
					$add_8= int($p_ex_tyoukyou{$f_id} /10);
					$p_tyoukyou{$f_id}+=$add_8;
					$p_ex_tyoukyou{$f_id}-=10 * $add_8;
				}
				if($p_ex_jinbou{$f_id} >= 10){
					$add_8= int($p_ex_jinbou{$f_id} /10);
					$p_jinbou{$f_id}+=$add_8;
					$p_ex_jinbou{$f_id}-=10 * $add_8;
				}
				if($p_ex_seiji{$f_id} >= 10){
					$add_8= int($p_ex_seiji{$f_id} /10);
					$p_seiji{$f_id}+=$add_8;
					$p_ex_seiji{$f_id}-=10 * $add_8;
				}
				if($p_ex_sinyou{$f_id} >= 10){
					$add_8= int($p_ex_sinyou{$f_id} /10);
					$p_sinyou{$f_id}+=$add_8;
					$p_ex_sinyou{$f_id}-=10 * $add_8;
				}

	$get_sol[0] = $p_tousotu{$f_id} + int(($p_buryoku{$f_id} + $p_tousotu{$f_id} + $p_tiryoku{$f_id})*0.1);
	$get_sol[1] = int($p_tiryoku{$f_id}*0.5) + int(($p_buryoku{$f_id} + $p_tousotu{$f_id} + $p_tiryoku{$f_id})*0.1);
	$get_sol[2] = $p_buryoku{$f_id} + int(($p_buryoku{$f_id} + $p_tousotu{$f_id} + $p_tiryoku{$f_id})*0.1);
									$solmax = $get_sol[$SOL_MAXT[$p_heisyu{$f_id}]];
$p_heisisuu{$f_id}= $solmax;
$p_kunren{$f_id}= 0;
$p_gekiha{$f_id}= 0;
$p_kuni_kouken{$f_id}= int($p_kuni_kouken{$f_id} /$keika_nen);
$p_neutral_meisei{$f_id}= int($p_neutral_meisei{$f_id} /$keika_nen);
$p_law_meisei{$f_id} = int($p_dark_meisei{$f_id} /$keika_nen);
$p_chaos_meisei{$f_id} = int($p_dark_meisei{$f_id} /$keika_nen);
$p_light_meisei{$f_id} = int($p_dark_meisei{$f_id} /$keika_nen);
$p_dark_meisei{$f_id} = int($p_dark_meisei{$f_id} /$keika_nen);
$p_ex_karumalc{$f_id} = int($p_ex_karumalc{$f_id} /$keika_nen);
$p_ex_karumald{$f_id} = int($p_ex_karumald{$f_id} /$keika_nen);

	$wksex = $p_syussei{$f_id} % 100;
		if($wksex eq "31"){
$p_gogyou_ka{$f_id} = int(($p_gogyou_ka{$f_id} - 20) /$keika_nen)+20;
$p_gogyou_sui{$f_id} = int(($p_gogyou_sui{$f_id} - 20) /$keika_nen)+20;
$p_gogyou_moku{$f_id} = int(($p_gogyou_moku{$f_id} - 20) /$keika_nen)+20;
$p_gogyou_kin{$f_id} = int(($p_gogyou_kin{$f_id} - 20) /$keika_nen)+20;
$p_gogyou_do{$f_id} = int(($p_gogyou_do{$f_id} - 20) /$keika_nen)+20;
		}else{
$p_gogyou_ka{$f_id} = int($p_gogyou_ka{$f_id} /$keika_nen);
$p_gogyou_sui{$f_id} = int($p_gogyou_sui{$f_id} /$keika_nen);
$p_gogyou_moku{$f_id} = int($p_gogyou_moku{$f_id} /$keika_nen);
$p_gogyou_kin{$f_id} = int($p_gogyou_kin{$f_id} /$keika_nen);
$p_gogyou_do{$f_id} = int($p_gogyou_do{$f_id} /$keika_nen);
		}

$p_jikan{$f_id} = $m_tt - $kousin_kankaku - int(rand($kousin_kankaku-1)+1);
$p_gundanid{$f_id} = "";
$p_butaiid{$f_id} = "";
$p_busyou_hp{$f_id} = 100;
$p_busyou_mp{$f_id} = 100;
$p_busyou_sp{$f_id} = 100;
$kptid = "";
$p_pk_kaisuu{$f_id} = 0;
$p_sekentei{$f_id} = 0;

$p_10syu_sougou{$f_id} = $p_kijyou{$f_id}+$p_syageki{$f_id}+$p_bujyutu{$f_id}+$p_jyujyutu{$f_id}+$p_tyouhou{$f_id}+$p_jyuukisouda{$f_id}+$p_tyoukyou{$f_id}+$p_jinbou{$f_id}+$p_seiji{$f_id}+$p_sinyou{$f_id};



			$p_sougou{$f_id} = $p_buryoku{$f_id}+$p_tiryoku{$f_id}+$p_tousotu{$f_id};
			$p_kuni_nenkou{$f_id} = $p_kuni_kouken{$f_id} + $p_kuni_sikan_nensuu{$f_id} * 150 + $p_neutral_meisei{$f_id};
			$p_sousisan{$f_id} = $p_syoji_kome{$f_id} + $p_syoji_kin{$f_id};

$p_kunren_max{$f_id}=100;
$p_sieki_kunren_max{$f_id}=50;
						if($p_buryoku{$f_id} > $p_kunren_max{$f_id}){
$p_kunren_max{$f_id}=$p_buryoku{$f_id};
$p_sieki_kunren_max{$f_id}= int($p_buryoku{$f_id}/2);
						}

	$get_sol[0] = $p_tousotu{$f_id} + int($p_sougou{$f_id}*0.1);
	$get_sol[1] = int($p_tiryoku{$f_id}*0.5) + int($p_sougou{$f_id}*0.1);
	$get_sol[2] = $p_buryoku{$f_id} + int($p_sougou{$f_id}*0.1);
									$p_heisisuu_max{$f_id} = $get_sol[$SOL_MAXT[$p_heisyu{$f_id}]];
						$p_syakui{$f_id} = int($p_neutral_meisei{$f_id} / $SYAKUI_P);
$zaddwmax=100;
						if($p_buryoku{$f_id} > $zaddwmax){
$zaddwmax=$p_buryoku{$f_id};
						}
						if($p_kunren{$f_id} > $zaddwmax){
							$p_kunren{$f_id} = $zaddwmax;
						}
					$ttid = "blog/$f_id";

	@S_MOVEPR = ();

	if($p_habatuno{$f_id}){
$p_habatu_sikan_nensuu{$f_id}+=100;
	}
	if($p_guildno{$f_id}){
$p_guild_sikan_nensuu{$f_id}+=100;
	}
	if($p_gundanno{$f_id}){
$p_gundan_sikan_nensuu{$f_id}+=100;
	}
	if($p_butaino{$f_id}){
$p_butai_sikan_nensuu{$f_id}+=100;
	}
	if($p_ptno{$f_id}){
$p_pt_sikan_nensuu{$f_id}+=100;
	}
	if($p_kunino{$f_id} eq $tenkaid){
$p_kuni_sikan_nensuu{$f_id}+=100;
	unshift(@S_MOVEPR,"\[$k_name_d[$tenkaid]暦元年\]$k_p_k_a{$tenkaid}が天下を統一し、それからしばらく平和な時が流れ、$p_name{$f_id}は$k_name_d[$tenkaid]の武将として幸せな生活を送ることとなる。$tt_date\n");

$p_kunino{$f_id} = 1;
$p_taizai_iti{$f_id} = $msyuto;
	if($p_syubi_eria{$f_id}){
						$defaddpos = "$p_syubi_eria{$f_id}";
						$defadditi = "$msyuto";
						$defaddid = "$f_id";
						$defaddname = "$p_name{$f_id}";
						$defaddcon = $kuni_kurikosi{$fk_id};
						$defaddhei = "$p_heisyu{$f_id}";
						$defadddbdb8 = "$p_syubi_eria{$f_id}";
						$defadddbdb9 = "$p_syubi_tosi{$f_id}";
						&DEF_M;
$kdbdb1 = "$t_name[$msyuto] $senno[$msyuto] ";
$p_syubi_tosi{$f_id} = $msyuto;
$p_syubi_eria{$f_id} = $p_syubi_eria{$f_id};
	}
	}elsif($k_kokka_keitai{$fk_id}){
$p_kunino{$f_id} = $kuni_kurikosi{$fk_id};
	if($p_syubi_eria{$f_id}){
						$defaddpos = "$p_syubi_eria{$f_id}";
						$defadditi = "$k_outo{$fk_id}";
						$defaddid = "$f_id";
						$defaddname = "$p_name{$f_id}";
						$defaddcon = $kuni_kurikosi{$fk_id};
						$defaddhei = "$p_heisyu{$f_id}";
						$defadddbdb8 = "$p_syubi_eria{$f_id}";
						$defadddbdb9 = "$p_syubi_tosi{$f_id}";
						&DEF_M;
$kdbdb1 = "$t_name[$k_outo{$fk_id}] $senno[$k_outo{$fk_id}] ";
$p_syubi_tosi{$f_id} = $k_outo{$fk_id};
$p_syubi_eria{$f_id} = $p_syubi_eria{$f_id};
	}
$p_kuni_sikan_nensuu{$f_id}+=100;
	unshift(@S_MOVEPR,"\[$k_name_d[$tenkaid]暦元年\]$k_p_k_a{$tenkaid}が天下を統一し、それからしばらく平和な時が流れ、$p_name{$f_id}は$t_name[$p_taizai_iti{$f_id}]の山里に隠れひっそりと暮らすこととなる。$tt_date\n");
	}else{
	if($p_syubi_eria{$f_id}){
						$defaddpos = "0";
						$defadditi = "0";
						$defaddid = "$f_id";
						$defaddname = "$p_name{$f_id}";
						$defaddcon = $kuni_kurikosi{$fk_id};
						$defaddhei = "$p_heisyu{$f_id}";
						$defadddbdb8 = $p_syubi_eria{$f_id};
						$defadddbdb9 = $p_syubi_tosi{$f_id};
						&DEF_D;
$kdbdb1 = " ";
$p_syubi_tosi{$f_id} = 0;
$p_syubi_eria{$f_id} = 0;
	}
	unshift(@S_MOVEPR,"\[$k_name_d[$tenkaid]暦元年\]$k_p_k_a{$tenkaid}が天下を統一し、それからしばらく平和な時が流れ、$p_name{$f_id}は在野武将として諸国を放浪することとなる。$tt_date\n");

$p_kunino{$f_id} = 0;
	}

	open(OUT,">./pr/$ttid.cgi");
	print OUT @S_MOVEPR;
	close(OUT);

	&TOUKETU_SAVE("touketu","$f_id","$f_id");
			}
		}
	}
	closedir(DFR);


###################
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

	$old_date = "<a href=./$rekimaprid target=\"_blank\">$outyou</a> <a href=./$yymaprid target=\"_blank\">$old_date</a>";
		

#   RANK2    #




	foreach(@k_no_all_l){
		$fk_id=int($_);

	open(IN,"./pr/k/$fk_id.cgi");
	@F_LOG2 = <IN>;
	close(IN);

	$khy = "";
	$khc = "";
	$khi = "";
	$kh1 = "";
	$kh2 = "";
	$kh3 = "";
	$kyj = "";
	$ksj = "";
	$kgj = "";
	$ktr = "";
	$kmg = "";
	$ksk = "";
	$ksn1 = "";
	$ksn2 = "";
	$ksn3 = "";
	$ksn4 = "";
	$ksnp = "";
	$khk = "";
	$kf16 = "";
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


$S_MES = "";
	open(IN,"./pr/klog/$fk_id.cgi");
	@MES_REG1 = <IN>;
	close(IN);
	$p=0;
		foreach(@MES_REG1){
			($bb2) = split(/<>/);
$bb2 =~ s/mapr\/db\///g;
$S_MES .= "<span class=\"c228B22\">●</span>$bb2<br />";
		}


   		$mapseisei = "
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/main.css\" />
<title>$GAME_TITLE$MEN_TITLE $outyou</title>
</head><body $datev3>$TAG_div_s{$doc_mode}
";
   		$add_p_k_come = "";

	&P_K_1;
   		$mapseisei .= $add_p_come;
   		$mapseisei .= "
</td></tr>
</table>
";

	&P_K_2;
   		$mapseisei .= $add_p_come;
   		$mapseisei .= "
</div></body></html>
";

$mapseisei =~ s/mapr\/db/\.\./g;
	open(OUT,">./mapr/db/$rrekimaprid-$fk_id.html");
	print OUT $mapseisei;
	close(OUT);


	}





	open(IN,"./w_db/k_db_l_kuni_db.cgi");
	@KUNI_S_DATA = <IN>;
	close(IN);
	open(IN,"./w_db/k_db_d_l_kuni_db.cgi");
	@KUNI_DB_NO_L = <IN>;
	close(IN);
@KUNI_S_DATARESE = @KUNI_S_DATA;
@KUNI_DB_NO_LRESE = @KUNI_DB_NO_L;
@new_charak=();
	unshift(@new_charak,"<><><><><><>無し<>\n");
	$dir="./w_db/kuni";
	$dirtmp="./w_db/tmp";
	foreach(@k_no_all_l){
$fk_id = $_;
		if($kuni_kurikosi{$fk_id}){

rename ("$dir/$fk_id.cgi", "$dirtmp/$kuni_kurikosi{$fk_id}.cgi");
			unlink("$dir/coudata$fk_id.pl");
rename ("$dir/gaiko_$fk_id.cgi", "$dirtmp/gaiko_$kuni_kurikosi{$fk_id}.cgi");
rename ("$dir/lr$fk_id.cgi", "$dirtmp/lr$kuni_kurikosi{$fk_id}.cgi");
rename ("$dir/ctop$fk_id.cgi", "$dirtmp/ctop$kuni_kurikosi{$fk_id}.cgi");

			$k_kousen_aite_name{$fk_id} = "無し";
	open(OUT,">$dirtmp/ctyouhei$kuni_kurikosi{$fk_id}.cgi");
	print OUT @new_charak;
	close(OUT);
		}
	}

	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	opendir(DFR,"$dirtmp");
	while($file = readdir(DFR)){
		if($file ne "index.html"){
rename ("$dirtmp/$file", "$dir/$file");
		}
	}
	closedir(DFR);

#		$thit = 0;
#	while ($thit<$tosi_kazu) {
#$t_zokuno{$thit} = $kuni_kurikosi{$t_zokuno{$thit}};
#$thit ++;
#	}


	@wz=();
	$zc=0;
	while ($zc<$tosi_kazu) {
							$ft_id = $zc;

	if("$t_name{$ft_id}" eq "$wzname"){
	$msyuto = $zc;
	$wz[0] = $t_setuzoku_saki{$ft_id}[0];
	$wz[1] = $t_setuzoku_saki{$ft_id}[1];
	$wz[2] = $t_setuzoku_saki{$ft_id}[2];
	$wz[3] = $t_setuzoku_saki{$ft_id}[3];
	$wz[4] = $t_setuzoku_saki{$ft_id}[4];
	$wz[5] = $t_setuzoku_saki{$ft_id}[5];
	$wz[6] = $t_setuzoku_saki{$ft_id}[6];
	$wz[7] = $t_setuzoku_saki{$ft_id}[7];
	$wz[8] = $t_setuzoku_saki{$ft_id}[8];
	$wz[9] = $t_setuzoku_saki{$ft_id}[9];
$t_kunino{$ft_id}=1;
		if($t_zokuno{$ft_id}){
$t_zokuno{$ft_id}=$kuni_kurikosi{$t_zokuno{$ft_id}};
		}
	}else{
$t_kunino{$ft_id}=0;
		if($t_zokuno{$ft_id}){
$t_zokuno{$ft_id}=$kuni_kurikosi{$t_zokuno{$ft_id}};
		}
$t_nougyou_ti{$ft_id}= int($t_nougyou_ti{$ft_id} /100);
$t_syougyou_ti{$ft_id}= int($t_syougyou_ti{$ft_id} /100);
$t_gijyutu_ti{$ft_id}= 700;
$t_siro_taikyuu_ti{$ft_id}= 999;
$t_zoku_bouei_ti{$ft_id}= 3000;
$t_zoku_taikyuu_ti{$ft_id}= 999;
	}
		$zc++;
	}

	$z1no = 0;
	foreach(@wz){
	if($wz[$z1no] ne ""){
							$ft_id = $wz[$z1no];

$t_kunino{$ft_id}=1;


	}
	$z1no ++;
	}

$minsyukazu=@MINZOKUSAN;
$minsyukazu-=1;
     for($i=0;$i<1000000;$i++){
	$wrminzoku = int(rand($minsyukazu))+1;
		if($syuminzoku ne $wrminzoku){
	($mindname,$mindtw)=split(/<>/,$MINZOKUD[$wrminzoku]);
							$ft_id = $mindtw;

			if($t_kunino{$ft_id} < 1 and $k_syuminzoku{$fk_id} ne $wrminzoku){
$t_kunino{$ft_id}=2;
	$sinkouminzoku1 = $wrminzoku;
	$sinkououto1 = $mindtw;
	$wz2[0] = $t_setuzoku_saki{$ft_id}[0];
	$wz2[1] = $t_setuzoku_saki{$ft_id}[1];
	$wz2[2] = $t_setuzoku_saki{$ft_id}[2];
	$wz2[3] = $t_setuzoku_saki{$ft_id}[3];
	$wz2[4] = $t_setuzoku_saki{$ft_id}[4];
	$wz2[5] = $t_setuzoku_saki{$ft_id}[5];
	$wz2[6] = $t_setuzoku_saki{$ft_id}[6];
	$wz2[7] = $t_setuzoku_saki{$ft_id}[7];
	$wz2[8] = $t_setuzoku_saki{$ft_id}[8];
	$wz2[9] = $t_setuzoku_saki{$ft_id}[9];
	$z1no = 0;
	foreach(@wz2){
	if($wz2[$z1no] ne ""){
							$ft_id = $wz2[$z1no];

$t_kunino{$ft_id}=2;


	}
	$z1no ++;
	}
last;
			}
		}
	}

     for($i=0;$i<1000000;$i++){
	$wrminzoku = int(rand($minsyukazu))+1;
		if($syuminzoku ne $wrminzoku){
	($mindname,$mindtw)=split(/<>/,$MINZOKUD[$wrminzoku]);
							$ft_id = $mindtw;

			if($t_kunino{$ft_id} < 1 and $k_syuminzoku{$fk_id} ne $wrminzoku){
$t_kunino{$ft_id}=3;
	$sinkouminzoku2 = $wrminzoku;
	$sinkououto2 = $mindtw;
	$wz3[0] = $t_setuzoku_saki{$ft_id}[0];
	$wz3[1] = $t_setuzoku_saki{$ft_id}[1];
	$wz3[2] = $t_setuzoku_saki{$ft_id}[2];
	$wz3[3] = $t_setuzoku_saki{$ft_id}[3];
	$wz3[4] = $t_setuzoku_saki{$ft_id}[4];
	$wz3[5] = $t_setuzoku_saki{$ft_id}[5];
	$wz3[6] = $t_setuzoku_saki{$ft_id}[6];
	$wz3[7] = $t_setuzoku_saki{$ft_id}[7];
	$wz3[8] = $t_setuzoku_saki{$ft_id}[8];
	$wz3[9] = $t_setuzoku_saki{$ft_id}[9];
	$z1no = 0;
	foreach(@wz3){
	if($wz3[$z1no] ne ""){
							$ft_id = $wz3[$z1no];

$t_kunino{$ft_id}=3;


	}
	$z1no ++;
	}
last;
			}
		}
	}



#####まとめ######



		$thit = 0;
		$t2hit = 0;
	while ($thit<$butai_kazu_d) {

			if($butai_yomikaki{$thit} ne ""){
$t2hit = $thit;
$butai_kunino{$thit} = int($kuni_kurikosi{$butai_kunino{$thit}});
			}
$thit ++;
	}

		$thit = 0;
		$t2hit = 0;
	while ($thit<$gundan_kazu_d) {

			if($gundan_yomikaki{$thit} ne ""){
$t2hit = $thit;
$gundan_kunino{$thit} = int($kuni_kurikosi{$gundan_kunino{$thit}});
			}
$thit ++;
	}


	$dir="./w_db/cmes";
	$dirtmp="./w_db/tmp";
	foreach(@k_no_all_l){
$fk_id = $_;
		if($kuni_kurikosi{$fk_id}){
	open(IN,"$dir/lt$fk_id.cgi");
	@BBS_DATALT = <IN>;
	close(IN);
foreach(@BBS_DATALT){
		($bbsid0,$bbsno0,$bbstitle0) = split(/<>/);
rename ("$dir/$fk_id$bbsid0.cgi", "$dirtmp/$kuni_kurikosi{$fk_id}$bbsid0.cgi");
rename ("$dir/5g$fk_id$bbsid0.pl", "$dirtmp/5g$kuni_kurikosi{$fk_id}$bbsid0.pl");
rename ("$dir/all$fk_id$bbsid0.pl", "$dirtmp/all$kuni_kurikosi{$fk_id}$bbsid0.pl");
}
rename ("$dir/lt$fk_id.cgi", "$dirtmp/lt$kuni_kurikosi{$fk_id}.cgi");
		}
	}

	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	opendir(DFR,"$dirtmp");
	while($file = readdir(DFR)){
		if($file ne "index.html"){
rename ("$dirtmp/$file", "$dir/$file");
			unlink("$dirtmp/$file");
		}
	}
	closedir(DFR);
###########################
	$dir="./w_db/guest";
	$dirtmp="./w_db/tmp";
	foreach(@k_no_all_l){
$fk_id = $_;
		if($kuni_kurikosi{$fk_id}){
rename ("$dir/bl$fk_id.cgi", "$dirtmp/bl$kuni_kurikosi{$fk_id}.cgi");
rename ("$dir/bl$fk_id.pl", "$dirtmp/bl$kuni_kurikosi{$fk_id}.pl");
rename ("$dir/$fk_id.cgi", "$dirtmp/$kuni_kurikosi{$fk_id}.cgi");
		}else{
			unlink("$dir/bl$fk_id.cgi");
			unlink("$dir/bl$fk_id.pl");
			unlink("$dir/$fk_id.cgi");
		}
	}


	opendir(DFR,"$dirtmp");
	while($file = readdir(DFR)){
		if($file ne "index.html"){
rename ("$dirtmp/$file", "$dir/$file");
			unlink("$dirtmp/$file");
		}
	}
	closedir(DFR);
###########################

	$dir="./pr/klog";
	$dirtmp="./w_db/tmp";
	foreach(@k_no_all_l){
$fk_id = $_;
		if($kuni_kurikosi{$fk_id}){
$ttid = "klog/$fk_id";
&PRLOG("\[$outyou$dourannen3年\]\[$k_name_d[$tenkaid]暦元年\]$k_p_k_a{$tenkaid}が天下を統一し、それからしばらく平和な時が流れ、$k_p_k_a{$fk_id}は$t_name[$k_outo{$fk_id}]の賊砦にてひっそりと過ごすこととなる。$tt_date\n");
rename ("$dir/$fk_id.cgi", "$dirtmp/$kuni_kurikosi{$fk_id}.cgi");
		}else{
			unlink("$dir/$fk_id.cgi");
		}
	}


	opendir(DFR,"$dirtmp");
	while($file = readdir(DFR)){
		if($file ne "index.html"){
rename ("$dirtmp/$file", "$dir/$file");
			unlink("$dirtmp/$file");
		}
	}
	closedir(DFR);
###########################

	$dir="./pr/k";
	$dirtmp="./w_db/tmp";
	foreach(@k_no_all_l){
$fk_id = $_;
		if($kuni_kurikosi{$fk_id}){
rename ("$dir/$fk_id.cgi", "$dirtmp/$kuni_kurikosi{$fk_id}.cgi");
		}else{
			unlink("$dir/$fk_id.cgi");
		}
	}


	opendir(DFR,"$dirtmp");
	while($file = readdir(DFR)){
		if($file ne "index.html"){
rename ("$dirtmp/$file", "$dir/$file");
			unlink("$dirtmp/$file");
		}
	}
	closedir(DFR);
###########################

	$dir="./w_db/kuni_db";
	foreach(@k_no_all_l){
$fk_id = $_;
		if($fk_id > 1 and $kuni_kurikosi{$fk_id} ne "1"){
$k_id{$fk_id} = 0;
$k_kunino{$fk_id} = 0;
			unlink("$dir/$fk_id.cgi");
		}
	}

	foreach(@k_no_all_l){
$fk_id = $_;
$k_id{$fk_id} = $kuni_kurikosi{$fk_id};
$k_kunino{$fk_id} = $kuni_kurikosi{$fk_id};
		if($kuni_kurikosi{$fk_id}){
$k_id{$fk_id} = $kuni_kurikosi{$fk_id};
	&K_W1_SAVE("kuni_db","$kuni_kurikosi{$fk_id}","$fk_id");
	&K_READ("kuni_db","$kuni_kurikosi{$fk_id}","$kuni_kurikosi{$fk_id}");
@{"kuni_l$k_kunino{$kuni_kurikosi{$fk_id}}"}=();
delete $kuni_l{$kuni_kurikosi{$fk_id}};
		}
	}



		$kuni_kazu_max = $khit +3;
		$kuni_kazu = $khit +3;
		if($tenkaid > $kuni_kazu_max){
$fk_id = $tenkaid;
$k_id{$fk_id} = 0;
$k_kunino{$fk_id} = 0;
			unlink("$dir/$fk_id.cgi");
		}
		
####################

#	$dir="./p_db/log";
#	opendir(DFR,"$dir");
#	while($file = readdir(DFR)){
#		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
#			unlink("$dir/$file");
#		}
#	}
#	closedir(DFR);

	$dir="./p_db/rank";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);


	$dir="./w_db/butai";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./w_db/mati";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if(($file =~ /\.cgi/i or $file =~ /\.pl/i) and $file !~ /index\./i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./w_db/mati";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.html/i and $file !~ /index\./i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	@NEW_DATA = ();

	open(OUT,">./w_db/k_sikan_kyozetu.cgi");
	print OUT @NEW_DATA;
	close(OUT);
	open(OUT,">./w_db/kyuuex.cgi");
	print OUT @NEW_DATA;
	close(OUT);


	open(OUT,">./w_db/gundan_list.cgi");
	print OUT @NEW_DATA;
	close(OUT);

	opendir(defd,"./w_db/def");
	while($defdir = readdir(defd)){
	opendir(defl,"./w_db/def/$defdir");
	while($deffile = readdir(defl)){
		if($deffile =~ /\.cgi/i){
			open(page,"./w_db/def/$defdir/$deffile");
			@DEF_LIST3 = <IN>;
			close(page);
$deffile =~ s/\.cgi//g;
									foreach(@DEF_LIST3){
										($mdid,$mdname,$md_tosi,$md_eria,$md_kuni) = split(/<>/);

$d_id = $mdid;

												if($p_kunino{$d_id} and -e "./p_db/p/$p_id{$d_id}.cgi"){

						$defaddpos = "$p_syubi_eria{$d_id}";
						$defadditi = "$p_taizai_iti{$d_id}";
						$defaddid = "$p_id{$d_id}";
						$defaddname = "$p_name{$d_id}";
						$defaddcon = "$p_kunino{$d_id}";
						$defaddhei = "$p_heisyu{$d_id}";
						$defadddbdb8 = "$p_syubi_eria{$d_id}";
						$defadddbdb9 = "$p_syubi_tosi{$d_id}";
						&DEF_M;
$ddbdb1 = "$t_name[$p_taizai_iti{$d_id}] $senno[$p_syubi_eria{$d_id}] ";
$p_syubi_tosi{$d_id} = $p_taizai_iti{$d_id};
$p_syubi_eria{$d_id} = $p_syubi_eria{$d_id};


												}

									}
		}
	}
	closedir(defl);
	}
	closedir(defd);


	open(OUT,">./w_db/kanyuu_bun.cgi");
	print OUT @NEW_DATA;
	close(OUT);

	open(OUT,">./w_db/local_rule.cgi");
	print OUT @NEW_DATA;
	close(OUT);

							unlink("./w_db/bs.cgi");
							unlink("./b_itiran.html");
							unlink("./meisyou.html");


	&M2AP_LOG("全データの移行完了。");
	&MAP_LOG3("全データの移行完了。");
												@listdf=();
												@listdfz=();

	foreach(@p_db_all_l){
				$f_id = $_;

		if($p_syubi_eria{$f_id}){
			${"listdf$listdf_i[$p_kunizokusei{$f_id}]"}[$p_syubi_tosi{$f_id}] .= "$p_name{$f_id} ";
			${"listdf$listdf_i[$p_kunizokusei{$f_id}]no"}[$p_syubi_tosi{$f_id}] ++;

			${"dfi$p_syubi_tosi{$f_id}"}[$p_syubi_eria{$f_id}] .= "$p_name{$f_id}『$k_name_d[$p_kunino{$f_id}]』 ";
			${"dfino$p_syubi_tosi{$f_id}"}[$p_syubi_eria{$f_id}] ++;
		}
	}



												@stv=();
	$zc=0;
	while ($zc<$tosi_kazu) {
							$dt_id = $zc;



   		$stv[$zc] = '$t_name{$ft_id} = \'' . $t_name{$dt_id} . '\';' . '$t_kunino{$ft_id} = \'' . $t_kunino{$dt_id} . '\';' . 
'$t_ryoumin_suu{$ft_id} = \'' . $t_ryoumin_suu{$dt_id} . '\';' . '$t_nougyou_ti{$ft_id} = \'' . $t_nougyou_ti{$dt_id} . '\';' . '$t_syougyou_ti{$ft_id} = \'' . $t_syougyou_ti{$dt_id} . '\';' . 
'$t_siro_bouei_ti{$ft_id} = \'' . $t_siro_bouei_ti{$dt_id} . '\';' . '$t_nougyou_max{$ft_id} = \'' . $t_nougyou_max{$dt_id} . '\';' . '$t_syougyou_max{$ft_id} = \'' . $t_syougyou_max{$dt_id} . '\';' . 
'$t_siro_bouei_max{$ft_id} = \'' . $t_siro_bouei_max{$dt_id} . '\';' . '$t_tian_ti{$ft_id} = \'' . $t_tian_ti{$dt_id} . '\';' . '$t_x_zahyou{$ft_id} = \'' . $t_x_zahyou{$dt_id} . '\';' . 
'$t_y_zahyou{$ft_id} = \'' . $t_y_zahyou{$dt_id} . '\';' . '$zsouba = \'' . "$t_kome_souba{$dt_id}" . '\';' . '$t_kome_souba{$ft_id} = \'' . $t_kome_souba{$ft_id} . '\';' . '$t_siro_taikyuu_ti{$ft_id} = \'' . $t_siro_taikyuu_ti{$dt_id} . '\';' . 
'$t_gijyutu_ti{$ft_id} = \'' . $t_gijyutu_ti{$dt_id} . '\';' . '$zsub2 = \'' . $z2sub2 . '\';' . 
'$t_setuzoku_saki{$ft_id}[0] = \'' . $t_setuzoku_saki{$dt_id}[0] . '\';' . '$t_setuzoku_saki{$ft_id}[1] = \'' . $t_setuzoku_saki{$dt_id}[1] . '\';' . '$t_setuzoku_saki{$ft_id}[2] = \'' . $t_setuzoku_saki{$dt_id}[2] . '\';' . 
'$t_setuzoku_saki{$ft_id}[3] = \'' . $t_setuzoku_saki{$dt_id}[3] . '\';' . '$t_setuzoku_saki{$ft_id}[4] = \'' . $t_setuzoku_saki{$dt_id}[4] . '\';' . '$t_setuzoku_saki{$ft_id}[5] = \'' . $t_setuzoku_saki{$dt_id}[5] . '\';' . 
'$t_setuzoku_saki{$ft_id}[6] = \'' . $t_setuzoku_saki{$dt_id}[6] . '\';' . '$t_setuzoku_saki{$ft_id}[7] = \'' . $t_setuzoku_saki{$dt_id}[7] . '\';' . 
'$listdf = \'' . "$listdf[$zc]（$listdfno[$zc]名）" . '\';' . '$listdfz = \'' . "$listdfz[$zc]（$listdfzno[$zc]名）" . '\';' . 
"\$\{$dfihn\}[1] = \'" . ${$dfihn}[1] . '\';' . "\$\{$dfihnno\}[1] = \'" . int(${$dfihnno}[1]) . '\';' . 
"\$\{$dfihn\}[2] = \'" . ${$dfihn}[2] . '\';' . "\$\{$dfihnno\}[2] = \'" . int(${$dfihnno}[2]) . '\';' . 
"\$\{$dfihn\}[3] = \'" . ${$dfihn}[3] . '\';' . "\$\{$dfihnno\}[3] = \'" . int(${$dfihnno}[3]) . '\';' . 
"\$\{$dfihn\}[4] = \'" . ${$dfihn}[4] . '\';' . "\$\{$dfihnno\}[4] = \'" . int(${$dfihnno}[4]) . '\';' . 
"\$\{$dfihn\}[5] = \'" . ${$dfihn}[5] . '\';' . "\$\{$dfihnno\}[5] = \'" . int(${$dfihnno}[5]) . '\';' . 
"\$\{$dfihn\}[6] = \'" . ${$dfihn}[6] . '\';' . "\$\{$dfihnno\}[6] = \'" . int(${$dfihnno}[6]) . '\';' . 
"\$\{$dfihn\}[11] = \'" . ${$dfihn}[11] . '\';' . "\$\{$dfihnno\}[11] = \'" . int(${$dfihnno}[11]) . '\';' . 
"\$\{$dfihn\}[12] = \'" . ${$dfihn}[12] . '\';' . "\$\{$dfihnno\}[12] = \'" . int(${$dfihnno}[12]) . '\';' . 
"\$\{$dfihn\}[13] = \'" . ${$dfihn}[13] . '\';' . "\$\{$dfihnno\}[13] = \'" . int(${$dfihnno}[13]) . '\';' . 
"\$\{$dfihn\}[20] = \'" . ${$dfihn}[20] . '\';' . "\$\{$dfihnno\}[20] = \'" . int(${$dfihnno}[20]) . '\';' . 
"\$\{$dfihn\}[21] = \'" . ${$dfihn}[21] . '\';' . "\$\{$dfihnno\}[21] = \'" . int(${$dfihnno}[21]) . '\';' . 
"\$\{$dfihn\}[22] = \'" . ${$dfihn}[22] . '\';' . "\$\{$dfihnno\}[22] = \'" . int(${$dfihnno}[22]) . '\';' . 
"\$\{$dfihn\}[23] = \'" . ${$dfihn}[23] . '\';' . "\$\{$dfihnno\}[23] = \'" . int(${$dfihnno}[23]) . '\';' . 
"\$\{$dfihn\}[24] = \'" . ${$dfihn}[24] . '\';' . "\$\{$dfihnno\}[24] = \'" . int(${$dfihnno}[24]) . '\';' . 
"\$\{$dfihn\}[999] = \'" . ${$dfihn}[999] . '\';' . "\$\{$dfihnno\}[999] = \'" . int(${$dfihnno}[999]) . '\';' . 
'1;';

											open(OUT,">./w_db/guest/stv$zc\.pl");
											print OUT $stv[$zc];
											close(OUT);
		$zc++;
	}


			$S_MES = "\$S_MES = \'<span class=\"c228B22\">●</span><br /><span class=\"c228B22\">●</span><br /><span class=\"c228B22\">●</span><br /><span class=\"c228B22\">●</span><br /><span class=\"c228B22\">●</span><br />\';
1;";
											open(OUT,">./w_db/map5.pl");
											print OUT $S_MES;
											close(OUT);


			$S_MES = "\$S_MES = \'・<br />・<br />・<br />・<br />・<br />\';
1;";
											open(OUT,">./w_db/mapall.pl");
											print OUT $S_MES;
											close(OUT);

			$S_MES = "\$D_MES = \'・<br />・<br />・<br />・<br />・<br />\';
1;";
											open(OUT,">./w_db/map2all.pl");
											print OUT $S_MES;
											close(OUT);



   		$kousen = "
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/main.css\" />
<title>$GAME_TITLE$MEN_TITLE $outyou</title>
</head><body>$TAG_div_s{$doc_mode}
名将一覧は初年度12月に編集されます。<br />
データが作成されるまで暫くお待ち下さい。<br />
</div></body></html>";

	open(OUT,">./meisyou.html");
	print OUT $kousen;
	close(OUT);
   		$kousen = "
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/main.css\" />
<title>$GAME_TITLE$MEN_TITLE $outyou</title>
</head><body>$TAG_div_s{$doc_mode}
まだゲーム本編が開始されていません。<br />
登録武将一覧は初年度1月に編集されます。<br />
データが作成されるまで暫くお待ち下さい。<br />
</div></body></html>";

	open(OUT,">./b_itiran.html");
	print OUT $kousen;
	close(OUT);
	# DATE LIST

	$add_keika_nen = $keika_nen;
	$keika_nen = 0;
	$tuki_genzai = 0;
	$kousinjyoutai = 0;
	$tenkakaisuu ++;
$kuni_tenka_kaisuu = $tenkakaisuu;
	$outyou = "$tenkaname暦";
	$seibento1 = 0;
	$seibento2 = 0;
	$kaisinen = 100;
	$zenkaisinen = 100;
	$touitunen = 400;
	$zentensimei = "$k_tensi_name{$kuni_kurikosi{$tenkaid}}";

$MINZOKUOU[0] = "霊帝 ";
$MINZOKUOU[1] = "王昭君 ";
$MINZOKUOU[2] = "劉淵 ";
$MINZOKUOU[3] = "石勒 ";
$MINZOKUOU[4] = "拓跋部 ";
$MINZOKUOU[5] = "楼班 ";
$MINZOKUOU[6] = "苻堅 ";
$MINZOKUOU[7] = "迷当大王 ";
$MINZOKUOU[8] = "勾踐 ";
$MINZOKUOU[9] = "鄒牟 ";
$MINZOKUOU[10] = "木鹿大王 ";
$MINZOKUOU[11] = "闔廬 ";
$MINZOKUOU[12] = "孟獲 ";
$MINZOKUOU[13] = "兀突骨 ";
$MINZOKUOU[14] = "卑弥呼 ";

$MINZOKUKOKUMEI[0] = "後漢 ";
$MINZOKUKOKUMEI[1] = "フン ";
$MINZOKUKOKUMEI[2] = "漢 ";
$MINZOKUKOKUMEI[3] = "後趙 ";
$MINZOKUKOKUMEI[4] = "燕 ";
$MINZOKUKOKUMEI[5] = "奚 ";
$MINZOKUKOKUMEI[6] = "前秦 ";
$MINZOKUKOKUMEI[7] = "後秦 ";
$MINZOKUKOKUMEI[8] = "越 ";
$MINZOKUKOKUMEI[9] = "高句麗 ";
$MINZOKUKOKUMEI[10] = "徴 ";
$MINZOKUKOKUMEI[11] = "呉 ";
$MINZOKUKOKUMEI[12] = "南蛮 ";
$MINZOKUKOKUMEI[13] = "烏戈 ";
$MINZOKUKOKUMEI[14] = "倭 ";

		$fk_id = 1;
	&K_READ("kuni_db","$fk_id","$fk_id");
		$new_kuni_id_in = $fk_id;
$k_kouhou_tyouhei{$fk_id}[0] = $msyuto;
$k_kouhou_tyouhei_name{$fk_id} = "$t_name[$msyuto]";

		$k_kousen_aite_k{$fk_id}[0]=2;
		$k_kousen_aite_k{$fk_id}[1]=3;
		$k_kousen_aite_k{$fk_id}[2]=0;
		$k_kousen_aite_k{$fk_id}[3]=0;
		$k_kousen_aite_k{$fk_id}[4]=0;
		$k_kousen_aite_k{$fk_id}[5]=0;
		$k_kousen_aite_k{$fk_id}[6]=0;
		$k_kousen_aite_k{$fk_id}[7]=0;
		$k_kousen_aite_k{$fk_id}[8]=0;
		$k_kousen_aite_k{$fk_id}[9]=0;

$k_kokko_sougaku{$fk_id} = int($k_kokko_sougaku{$fk_id} / $add_keika_nen);
$k_keika_t{$fk_id} = 69;
$k_kokui{$fk_id} = 0;
$k_kokusaku{$fk_id} = 10;
$k_kouryaku_mokuhyou{$fk_id}[0] = 0;
$k_zenki_tosisuu{$fk_id} = 1;
$k_kouhou_tyouhei{$fk_id}[0] = $msyuto;
$k_kouhou_tyouhei_name{$fk_id} = "$t_name[$msyuto]";

$k_kunino{$fk_id} = 1;
$k_id{$fk_id} = 1;
$k_keika_nen{$fk_id} += 100;
	&K_W1_SAVE("kuni_db","$fk_id","$fk_id");

				$new_kuni_id_in = 2;
		$fk_id = $new_kuni_id_in;
	&K_READ("kuni_db","$fk_id","$fk_id");
$add_name_d = "$MINZOKUKOKUMEI[$sinkouminzoku1]";
$in{'zokumei'} = "$add_name_d ";
$in{'min'} = $sinkouminzoku1;
$in{'ele'} = 2;
$in{'id'} = "";
$in{'mes'} = "$MINZOKUOU[$sinkouminzoku1] ";
$k_name_d{$fk_id} = '';
$xtoorina = '';
$k_name_z{$fk_id} = '';
$xkokugou = '';
$k_outo{$fk_id} = $sinkououto1;
$k_kokka_keitai{$fk_id} = 0;
$xflag2 = '';
$xflag3 = '';
$xflag4 = '';
$xflag5 = '';
@xtatemono = ();
$xdbdb1 = '';
$xdbdb2 = '';
$xdbdb3 = '';
$xdbdb4 = '';
$xdbdb5 = '';
$xdbdb6 = '';
$xdbdb7 = '';
$xdbdb8 = '';
$xdbdb9 = '';
$xdbdb10 = '';
	
$k_kousen_aite_k{$fk_id}[0] = '1';
		$k_kousen_aite_k{$fk_id}[1]=0;
		$k_kousen_aite_k{$fk_id}[2]=0;
		$k_kousen_aite_k{$fk_id}[3]=0;
		$k_kousen_aite_k{$fk_id}[4]=0;
		$k_kousen_aite_k{$fk_id}[5]=0;
		$k_kousen_aite_k{$fk_id}[6]=0;
		$k_kousen_aite_k{$fk_id}[7]=0;
		$k_kousen_aite_k{$fk_id}[8]=0;
		$k_kousen_aite_k{$fk_id}[9]=0;
	
$k_name_d{$fk_id} = "$add_name_d ";
$k_name_k{$fk_id} = "$add_name_d ";
$k_name_outyou{$fk_id}="$add_name_d ";
$k_name_z{$fk_id} = "$in{'zokumei'} ";
$k_syuminzoku{$fk_id} = $in{'min'};
$k_yakusyoku_id{$fk_id}[1] = $in{'id'};

$k_id{$fk_id} = $new_kuni_id_in;
$k_kunino{$fk_id} = $new_kuni_id_in;
$k_name{$fk_id} = "$add_name_d ";
$k_iro_d{$fk_id} = $in{'ele'};
$k_keika_t{$fk_id} = 0;
$k_kokui{$fk_id} = 80;
$k_sirei_bun{$fk_id} = " ";
$k_tensi_name{$fk_id} = $in{'mes'};
$k_kouryaku_mokuhyou{$fk_id}[0] = 0;
$k_zenki_tosisuu{$fk_id} = 1;
$k_busyou_kazei{$fk_id} = 0;
$k_kokko_sougaku{$fk_id} = 1000000;
$k_zenki_sou_syuunyuu{$fk_id} = 0;
$k_kouhou_tyouhei{$fk_id}[0] = $sinkououto1;
$k_yomikaki{$fk_id} = 0;
$k_kouhou_tyouhei_name{$fk_id} = "$t_name[$sinkououto1]";

	&K_W1_SAVE("kuni_db","$fk_id","$fk_id");

				$new_kuni_id_in = 3;
		$fk_id = $new_kuni_id_in;
	&K_READ("kuni_db","$fk_id","$fk_id");
$add_name_d = "$MINZOKUKOKUMEI[$sinkouminzoku2]";
$in{'zokumei'} = "$add_name_d ";
$in{'min'} = $sinkouminzoku2;
$in{'ele'} = 3;
$in{'id'} = "";
$in{'mes'} = "$MINZOKUOU[$sinkouminzoku2] ";
$k_name_d{$fk_id} = '';
$xtoorina = '';
$k_name_z{$fk_id} = '';
$xkokugou = '';
$k_outo{$fk_id} = $sinkououto2;
$k_kokka_keitai{$fk_id} = 0;
$xflag2 = '';
$xflag3 = '';
$xflag4 = '';
$xflag5 = '';
@xtatemono = ();
$xdbdb1 = '';
$xdbdb2 = '';
$xdbdb3 = '';
$xdbdb4 = '';
$xdbdb5 = '';
$xdbdb6 = '';
$xdbdb7 = '';
$xdbdb8 = '';
$xdbdb9 = '';
$xdbdb10 = '';
	
$k_kousen_aite_k{$fk_id}[0] = '1';
		$k_kousen_aite_k{$fk_id}[1]=0;
		$k_kousen_aite_k{$fk_id}[2]=0;
		$k_kousen_aite_k{$fk_id}[3]=0;
		$k_kousen_aite_k{$fk_id}[4]=0;
		$k_kousen_aite_k{$fk_id}[5]=0;
		$k_kousen_aite_k{$fk_id}[6]=0;
		$k_kousen_aite_k{$fk_id}[7]=0;
		$k_kousen_aite_k{$fk_id}[8]=0;
		$k_kousen_aite_k{$fk_id}[9]=0;
	
$k_name_d{$fk_id} = "$add_name_d ";
$k_name_k{$fk_id} = "$add_name_d ";
$k_name_outyou{$fk_id}="$add_name_d ";
$k_name_z{$fk_id} = "$in{'zokumei'} ";
$k_syuminzoku{$fk_id} = $in{'min'};
$k_yakusyoku_id{$fk_id}[1] = $in{'id'};

$k_id{$fk_id} = $new_kuni_id_in;
$k_kunino{$fk_id} = $new_kuni_id_in;
$k_name{$fk_id} = "$add_name_d ";
$k_iro_d{$fk_id} = $in{'ele'};
$k_keika_t{$fk_id} = 0;
$k_kokui{$fk_id} = 80;
$k_sirei_bun{$fk_id} = " ";
$k_tensi_name{$fk_id} = $in{'mes'};
$k_kouryaku_mokuhyou{$fk_id}[0] = 0;
$k_zenki_tosisuu{$fk_id} = 1;
$k_busyou_kazei{$fk_id} = 0;
$k_kokko_sougaku{$fk_id} = 1000000;
$k_zenki_sou_syuunyuu{$fk_id} = 0;
$k_kouhou_tyouhei{$fk_id}[0] = $sinkououto2;
$k_yomikaki{$fk_id} = 0;
$k_kouhou_tyouhei_name{$fk_id} = "$t_name[$sinkououto2]";

	&K_N_SAVE("kuni_db","$fk_id","$fk_id");

####################再装てん

	&K_W2_SAVE("kuni_db","1","1");
	&RIKAUNTO;

				@cbl=();
	foreach(@p_db_all_l){
			$f_id = $_;

				$cbl[$p_kunino{$f_id}]++;
	push(@{"kuni_l$k_kunino{$p_kunino{$f_id}}"},"$f_id<>$p_name{$f_id}<>$p_habatuno{$f_id}<>$p_mikoudou_t{$f_id}<>$p_sousisan{$f_id}<>$p_tyuusei{$f_id}<>\n");
	$kuni_l{$k_kunino{$p_kunino{$f_id}}} = "kuni_l$k_kunino{$p_kunino{$f_id}}";
	}
####################

	open(IN,"./w_db/k_db_d_l_kuni_db.cgi");
	@KUNI_DB_NO_L = <IN>;
	close(IN);
	open(IN,"./w_db/k_db_l_kuni_db.cgi");
	@KUNI_S_DATA = <IN>;
	close(IN);
							unlink("./w_db/kuni/coudata1.pl");
							unlink("./w_db/kuni/coudata2.pl");
							unlink("./w_db/kuni/coudata3.pl");
	foreach(@KUNI_DB_NO_L){
		($fk_id)=split(/,/);
		unlink("./w_db/kuni/coudata$fk_id.pl");
	}
		$fk_id = 1;
$k_outo{$fk_id} = $msyuto;
	
	

&MAPS;

							$fk_id=1;
							$zvhit=0;
	$k_kousen_aite_name{$fk_id} = "";
		$k_name_d[0] = "";
	foreach(@{$k_kousen_aite_k{$fk_id}}){
							$add_no=int($_);
							$add_no=$k_kunino{$add_no};
		if($add_no){
	$k_kousen_aite_name{$fk_id} .= "『$k_p_k_a{$add_no}』";
		}
							$zvhit+=$add_no;
	}
		$k_name_d[0] = "無所属";

		if($zvhit < 1){
			$k_kousen_aite_name{$fk_id} = "無し";
		}
						if($k_kokusaku{$k_kunino{$fk_id}} eq "10"){
	$k_kousen_aite_name{$fk_id} = "全ての国";
						}
							$fk_id=2;
							$zvhit=0;
	$k_kousen_aite_name{$fk_id} = "";
		$k_name_d[0] = "";
	foreach(@{$k_kousen_aite_k{$fk_id}}){
							$add_no=int($_);
							$add_no=$k_kunino{$add_no};
		if($add_no){
	$k_kousen_aite_name{$fk_id} .= "『$k_p_k_a{$add_no}』";
		}
							$zvhit+=$add_no;
	}
		$k_name_d[0] = "無所属";

		if($zvhit < 1){
			$k_kousen_aite_name{$fk_id} = "無し";
		}
						if($k_kokusaku{$k_kunino{$fk_id}} eq "10"){
	$k_kousen_aite_name{$fk_id} = "全ての国";
						}

							$fk_id=3;
							$zvhit=0;
	$k_kousen_aite_name{$fk_id} = "";
		$k_name_d[0] = "";
	foreach(@{$k_kousen_aite_k{$fk_id}}){
							$add_no=int($_);
							$add_no=$k_kunino{$add_no};
		if($add_no){
	$k_kousen_aite_name{$fk_id} .= "『$k_p_k_a{$add_no}』";
		}
							$zvhit+=$add_no;
	}
		$k_name_d[0] = "無所属";

		if($zvhit < 1){
			$k_kousen_aite_name{$fk_id} = "無し";
		}
						if($k_kokusaku{$k_kunino{$fk_id}} eq "10"){
	$k_kousen_aite_name{$fk_id} = "全ての国";
						}



				&KANBU_NAME;

	if($k_yakusyoku_id{$fk_id}[15] ne ""){

	$oniwabanid ="$p_name{$k_yakusyoku_id{$fk_id}[15]}";
	}else{
	$oniwabanid="${$zokukanbuptn}[15]";
	}

	if($k_yakusyoku_id{$fk_id}[1] ne ""){
	$taihu_id ="$p_name{$k_yakusyoku_id{$fk_id}[1]}";
	}else{
	$taihu_id="${$zokukanbuptn}[1]";
	}

	$kisyuu_tosino = @{$t_setuzoku_saki{$msyuto}};
	$kisyuu_tosi = int(rand($kisyuu_tosino));
	$dourannen = int(rand(10))+70;
	$dourannen2 = int(rand(7))+90;
	$dourannen3 = 99;
		$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);
&MAP_LOG2("<br />・<span class=\"c0000FF\">【王朝設立】</span>\[$outyou元年\]<a href=\"./?.m.=p_b&amp;.id.=1\" target=\"_blank\"><span class=\"c0000FF\">$zentensimei</span></a>が<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=1\" target=\"_blank\"><span class=\"c000000\">$k_name_d[1]王朝</span></a>を設立しました。王都：$t_name[$msyuto]<br />");
&MAP_LOG2("<span class=\"cFF0000\">【動乱】</span>\[$outyou$dourannen年\]平穏な時を打ち破るようにして、異民族国家「$MINZOKUKOKUMEI[$sinkouminzoku1]」が「$k_name_d[1]」に攻め込みました！！");
&MAP_LOG2("<span class=\"cFF0000\">【動乱】</span>\[$outyou$dourannen2年\]「$k_name_d[1]」 vs 「$MINZOKUKOKUMEI[$sinkouminzoku1] 」の戦いは熾烈を極め多くの都市が空白化することとなる。。");
&MAP_LOG2("<span class=\"cFF0000\">【動乱】</span>\[$outyou$dourannen3年\]戦乱の最中、第三勢力の「$MINZOKUKOKUMEI[$sinkouminzoku2]」が「$k_name_d[1]」に奇襲を仕掛け戦局は更に混沌とし、「$k_name_d[1]王朝」は設立以来最大の危機を迎えるのであった。");
&MAP_LOG2("<span class=\"c0000FF\">【$GAME_TITLE$MEN_TITLE 第$tenkakaisuu部スタート】</span>$outyou、100年・・。突然の異民族の侵攻により、新たなる戦乱の幕が開けようとしていた！");

	$touitumes1 = "<br /><br />$k_name_d[1]：評定会議場<br /><span class=\"c0000FF\">【斥候】</span>申し上げます。先刻、$t_name[$t_setuzoku_saki{$msyuto}[$kisyuu_tosi]]の物見櫓にて多数の敵軍を確認！「$MINZOKUKOKUMEI[$sinkouminzoku2]」の者と思われます！<br />$t_name[$t_setuzoku_saki{$msyuto}[$kisyuu_tosi]]の守衛の手におえるものではなく、至急本国からの援軍をもらいたしとのこと！<br /><span class=\"c0000FF\">【$zentensimei】</span>・・な、それはまことか？<br /><span class=\"c0000FF\">【$zentensimei】</span>「$taihu_id」・・「$taihu_id」は何をしておったのじゃ！<br /><span class=\"c0000FF\">【$taihu_id】</span>申し訳ありません。「$MINZOKUKOKUMEI[$sinkouminzoku1]」との戦いに専念するため、<br /><span class=\"c0000FF\">【$taihu_id】</span>「$MINZOKUKOKUMEI[$sinkouminzoku2]」とはここしばらくの間 友好関係を結んでいたのですが・・。<br /><span class=\"c0000FF\">【$oniwabanid】</span>間者からの情報によりますと、「$MINZOKUKOKUMEI[$sinkouminzoku1]」との戦いの裏を取られるような形で布陣の準備間に合わず、<br /><span class=\"c0000FF\">【$oniwabanid】</span>敵主力部隊が$t_name[$msyuto]の傍までせまってきてる模様・・。如何なさいましょうか？<br /><span class=\"c0000FF\">【$zentensimei】</span>・・・<br />$outyou、100年・・。突然の異民族の侵攻により、新たなる戦乱の幕が開けようとしていた！<br />";

$ttid = "klog/1";
&PRLOG("\[$outyou$dourannen3年\]$touitumes1");

&M2AP_LOG("$touitumes1");

$ttid = "klog/2";
&PRLOG("\[$outyou$dourannen年\]<a href=\"./?.m.=p_b&amp;.id.=2\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$MINZOKUOU[$sinkouminzoku1]</span></a>の意向により<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=1\" target=\"_blank\"><span class=\"kcb1\">$k_name_d[1]</span></a>に対する攻撃許可が下されました。");
$ttid = "klog/3";
&PRLOG("\[$outyou$dourannen3年\]<a href=\"./?.m.=p_b&amp;.id.=3\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$MINZOKUOU[$sinkouminzoku2]</span></a>の意向により<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=1\" target=\"_blank\"><span class=\"kcb1\">$k_name_d[1]</span></a>に対する攻撃許可が下されました。");


$woutyou =$outyou;
$woutyou =~  s/暦//g;
	@OUTYOU_DATA = ();
	open(IN,"./w_db/outyou.cgi");
	@OUTYOU_DATA = <IN>;
	close(IN);
	$rekimaprid = sprintf("%05d\.html", $tenkakaisuu);
		unshift(@OUTYOU_DATA,"$tenkakaisuu<>$woutyou<>$rekimaprid<>$t_name[$msyuto]<>$zentensimei<>$tt_date<>\n");

	open(OUT,">./w_db/outyou.cgi");
	print OUT @OUTYOU_DATA;
	close(OUT);

splice( @JJM, 0, 1, "$keika_nen<>$tuki_genzai<>$m_tt<>$kousinjyoutai<>$tenkakaisuu<>$outyou<>$seibento1<>$seibento2<>$syuminzoku<>$msyuto<>$kaisinen<>$zenkaisinen<>$touitunen<>$sinkouminzoku1<>$sinkouminzoku2<>$zentensimei<><><><><>\n");


	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$maprid = sprintf("%05d\-%04d\-%02d\.html", $tenkakaisuu, $KAISI_NEN+$keika_nen, $tuki_genzai);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);
	$old_date = "<a href=\"./mapr/$yymaprid\">$old_date</a>";
#require "$mpg_r/bl-1.pl";
#	&RANK12;
#	&RANKD2;

		$S_MES = "";

	open(IN,"./w_db/outyou.cgi");
	@OUTYOU_DATA = <IN>;
	close(IN);

	foreach(@OUTYOU_DATA){
		($outyouid,$outyouname,$outyouurl,$outyououto,$outyouki,$outyoutt)=split(/<>/);
		$S_MES .= " - <a href=\"./$outyouurl\">$MEN_TITLE 第$outyouid部 $outyoutt～<br />$outyouname王朝：王都「$outyououto」：初代皇帝「$outyouki」 - </a><br /><br />";
	}
		$mapseisei = "";
		$mapseisei .= "
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/rekisi_main.css\" />
<title>$GAME_TITLE$MEN_TITLE</title>
</head><body>$TAG_div_s{$doc_mode}
<strong><span class=\"fs4\"> - 歴史資料室 - </span></strong><br />
$S_MES";

   		$mapseisei .= "<br /><br /><hr /><a href=\"../\" target=\"_top\">ログイン画面に戻る</a><br /></div></body></html>";
	open(OUT,">./mapr/index.html");
	print OUT $mapseisei;
	close(OUT);


	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$pmaprid = sprintf("%05d\-%04d\-%02d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear, $pmmonth);
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$ryymaprid = sprintf("%05d\-%04d", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$ypmaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear-1);

	$pold_date = $old_date;
	$old_date = "<a href=\"./mapr/$yymaprid\">$old_date</a>";


	$ryfmaprid = sprintf("%05d\-%04d", $tenkakaisuu, $KAISI_NEN+$pmyear+1);
	$yfmaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear+1);

	$maprid = sprintf("%05d\-%04d\-%02d\.html", $tenkakaisuu, $KAISI_NEN+$keika_nen, $tuki_genzai);

	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);
	$yold_date = $old_date;
	$old_date = "<a href=\"./mapr/$yfmaprid\">$old_date</a>";
		$fmmonth=$tuki_genzai+1;
		if($fmmonth > 12){
			$fmyear++;
			$fmmonth=1;
		}
	$fmaprid = sprintf("%05d\-%04d\-%02d\.html", $tenkakaisuu, $KAISI_NEN+$keika_nen, $fmmonth);
	$fold_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $fmmonth);
		$fmyear=$keika_nen+1;


   		$kousen = "
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/rekisi_main.css\" />
<title>$GAME_TITLE$MEN_TITLE $outyou</title>
</head><body>$TAG_div_s{$doc_mode}
歴史資料室は初年度1月に編集されます。<br />
データが作成されるまで暫くお待ち下さい。<br />
</div></body></html>";

	open(OUT,">./mapr/$rekimaprid");
	print OUT $kousen;
	close(OUT);
	@TMTM=();
	unshift(@TMTM,"150<>100<>100<>100<>500<>\n");
	open(OUT,">./w_db/no1.cgi");
	print OUT @TMTM;
	close(OUT);
###############
	open(IN,"./w_db/k_db_d_l_kuni_db.cgi");
	@KUNI_DB_NO_L = <IN>;
	close(IN);

	$kuni_kazu = @KUNI_DB_NO_L;

												@listbusyou=();
		$listcc = "";
$k_name_d[0] = "無所属";
	@BUSYOU=();
	foreach(@KUNI_DB_NO_L){
		($fk_id)=split(/,/);
#らんく１
					$listcc .= "<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"c404000\">$k_name{$fk_id}</a> ";
#都市表示更新処理開始
			$listbusyou[$k_kunino{$fk_id}] = "\$list = \'";
#おわり

	}

%butai_busyou_suu = ();
%gundan_busyou_suu = ();
	@charano=();
	@CL_DATA=();
	$dir="./p_db/p";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i){
$f_id = $file;
$f_id =~ s/\.cgi//;
			open(page,"$dir/$file");
			@page = <page>;
			close(page);

		$p_kunizokusei{$f_id} = int($k_kokka_keitai{$fk_id});
		$p_taizai_iti{$f_id} = int($p_taizai_iti{$f_id});
		$p_kunino{$f_id} = int($p_kunino{$f_id});
		$p_sougou{$f_id} = $p_tousotu{$f_id} + $p_tiryoku{$f_id} + $p_buryoku{$f_id}+1;
								$jfl = int(($p_tousotu{$f_id}+1) * 300 / $p_sougou{$f_id});
								$jfs = int(($p_buryoku{$f_id}+1) * 300 / $p_sougou{$f_id});
								$jfi = int(($p_tiryoku{$f_id}+1) * 300 / $p_sougou{$f_id});

####おまけ処理（更新内容保管）
			$listbusyou[$p_kunino{$f_id}] .= "<option value=$f_id>・$p_name{$f_id} </option>";
							$ft_id = $p_taizai_iti{$f_id};
		if($p_kunino{$f_id} eq $t_kunino{$ft_id}){
			$listtz[$p_taizai_iti{$f_id}] .= "$p_name{$f_id} ";
			$listtzno[$p_taizai_iti{$f_id}] ++;

		}
####ランキング収集用CL
			$p_sougou{$f_id} = $p_buryoku{$f_id}+$p_tiryoku{$f_id}+$p_tousotu{$f_id};
			$p_kuni_nenkou{$f_id} = $p_kuni_kouken{$f_id} + $p_kuni_sikan_nensuu{$f_id} * 150 + $p_neutral_meisei{$f_id};
			$p_sousisan{$f_id} = $p_syoji_kome{$f_id} + $p_syoji_kin{$f_id};
$charanow=int($p_cgno_d{$f_id})+ 1000 * int($p_cg_sabano{$f_id});
$charano[$charanow] ++;
$p_10syu_sougou{$f_id} = $p_kijyou{$f_id}+$p_syageki{$f_id}+$p_bujyutu{$f_id}+$p_jyujyutu{$f_id}+$p_tyouhou{$f_id}+$p_jyuukisouda{$f_id}+$p_tyoukyou{$f_id}+$p_jinbou{$f_id}+$p_seiji{$f_id}+$p_sinyou{$f_id};



$p_k_iro_d{$f_id} = $k_iro_d[$k_kunino{$p_kunino{$f_id}}];

			$p_sougou{$f_id} = $p_buryoku{$f_id}+$p_tiryoku{$f_id}+$p_tousotu{$f_id};
			$p_kuni_nenkou{$f_id} = $p_kuni_kouken{$f_id} + $p_kuni_sikan_nensuu{$f_id} * 150 + $p_neutral_meisei{$f_id};
			$p_sousisan{$f_id} = $p_syoji_kome{$f_id} + $p_syoji_kin{$f_id};

$p_kunren_max{$f_id}=100;
$p_sieki_kunren_max{$f_id}=50;
						if($p_buryoku{$f_id} > $p_kunren_max{$f_id}){
$p_kunren_max{$f_id}=$p_buryoku{$f_id};
$p_sieki_kunren_max{$f_id}= int($p_buryoku{$f_id}/2);
						}

	$get_sol[0] = $p_tousotu{$f_id} + int($p_sougou{$f_id}*0.1);
	$get_sol[1] = int($p_tiryoku{$f_id}*0.5) + int($p_sougou{$f_id}*0.1);
	$get_sol[2] = $p_buryoku{$f_id} + int($p_sougou{$f_id}*0.1);
									$p_heisisuu_max{$f_id} = $get_sol[$SOL_MAXT[$p_heisyu{$f_id}]];
$p_syakui{$f_id}=int($p_syakui{$f_id});

%add_p=();
$add_p{$gundan_kunino{$p_gundanno{$f_id}}} = $p_gundanno{$f_id};
$p_gundanno{$f_id} = int($add_p{$p_kunino{$f_id}});
%add_p=();
$add_p{$butai_kunino{$p_butaino{$f_id}}} = $p_butaino{$f_id};
$p_butaino{$f_id} = int($add_p{$p_kunino{$f_id}});

								
$p_syoji_kin{$f_id} = int($p_syoji_kin{$f_id});
$p_syoji_kome{$f_id} = int($p_syoji_kome{$f_id});
$p_kunino{$f_id} = int($p_kunino{$f_id});
$p_guildno{$f_id} = int($p_guildno{$f_id});
$p_habatuno{$f_id} = int($p_habatuno{$f_id});
$p_ptno{$f_id} = int($p_ptno{$f_id});
$p_kuni_yakusyoku{$f_id}=int($p_kuni_yakusyoku{$f_id});
$p_habatu_yakusyoku{$f_id}=int($p_habatu_yakusyoku{$f_id});
$p_gundan_yakusyoku{$f_id}=int($p_gundan_yakusyoku{$f_id});
$p_butai_yakusyoku{$f_id}=int($p_butai_yakusyoku{$f_id});
$p_guild_yakusyoku{$f_id}=int($p_guild_yakusyoku{$f_id});
$p_pt_yakusyoku{$f_id}=int($p_pt_yakusyoku{$f_id});

$p_butaino{$f_id} = int($butai_no{$p_butaino{$f_id}});
$p_gundanno{$f_id} = int($gundan_no{$p_gundanno{$f_id}});
$butai_busyou_suu{$p_butaino{$f_id}}++;
$gundan_busyou_suu{$p_gundanno{$f_id}}++;
@{$p_cgno{$f_id}} = ();
$charanow=int($p_cgno_d{$f_id})+ (1000 * int($p_cg_sabano{$f_id}));
$charano[$charanow] ++;
				$cbl[$p_kunino{$f_id}]++;
				&P_SAVE("p","$f_id","$f_id");
			push(@CL_DATA,"@NEW_D");
####
		}
	}
	closedir(DFR);

					$list_kuni_all = "";
	foreach(@KUNI_DB_NO_L){
		($fk_id)=split(/,/);
		$k_busyou_suu{$fk_id} = int($cbl[$fk_id]);
					$list_kuni_all .= "$k_p_k_a{$fk_id} ";

	}
	@tmp = map {(split /,/)[186]} @CL_DATA;
	@CL_DATA = @CL_DATA[sort {$tmp[$b] <=> $tmp[$a]} 0 .. $#tmp];
require "$mpg_r/bl-1.pl";

	&RANK1;


		$outyou_URL="<a href=\"../$rekimaprid\">$outyou</a>";
		$p2old_date_URL="\[<a href=\"./$pmaprid\">$pold_date</a>\]←";
		$fold_dat_URL="→\[<a href=\"./$fmaprid\">$fold_date</a>\]";
		$mapseisei_in_URL="./mapr/tuki/map2.html";
	&MAPSR;
	
	open(OUT,">./$menck.js");
	print OUT "";
	close(OUT);

}
1;

