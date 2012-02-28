

sub RANK_MAKE {

	$best_list = "<tr><td>ランキングの種類</td><td>数値</td><td>武将名</td><td>所属国</td><td>所属派閥</td></tr>";

##############

@POINT = sort { $p_sougou{$b} <=> $p_sougou{$a} or length($b) <=> length($a) or $a cmp $b} keys %p_sougou;
##############
	$point_list = "<tr><td>順位</td><td>総合</td><td>武力</td><td>知力</td><td>統率</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $POINT[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_sansyu_sougou","$f_id","","","","","","","");
	$sougouno1 = $p_sougou{$f_id};
	$best_list .= "<tr><td><strong><a href=\"#2\">・</a>覇王（総合No.1）</strong></td><td class=\"txth\">$p_sougou{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$point_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td class=\"txth\">$p_sougou{$f_id}</td><td>$p_buryoku{$f_id}</td><td>$p_tiryoku{$f_id}</td><td>$p_tousotu{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $POINT[$i];
	$point_list .= "<tr><td>$p位</td><td class=\"txth\">$p_sougou{$f_id}</td><td>$p_buryoku{$f_id}</td><td>$p_tiryoku{$f_id}</td><td>$p_tousotu{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@POINT){
		$f_id = $_;
$ranksougou{$f_id} = $i;
		$i++;
	}

##############
@STR = sort { $p_buryoku{$b} <=> $p_buryoku{$a} or $a cmp $b} keys %p_buryoku;
##############
	$buryoku_list = "<tr><td>順位</td><td>総合</td><td>武力</td><td>知力</td><td>統率</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $STR[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_buryoku","$f_id","","","","","","","");
	$buryokuno1 = $p_buryoku{$f_id};
	$best_list .= "<tr><td><strong><a href=\"#3\">・</a>天下無双（武力No.1）</strong></td><td class=\"txth\">$p_buryoku{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$buryoku_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td>$p_sougou{$f_id}</td><td class=\"txth\">$p_buryoku{$f_id}</td><td>$p_tiryoku{$f_id}</td><td>$p_tousotu{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $STR[$i];
	$buryoku_list .= "<tr><td>$p位</td><td>$p_sougou{$f_id}</td><td class=\"txth\">$p_buryoku{$f_id}</td><td>$p_tiryoku{$f_id}</td><td>$p_tousotu{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@STR){
		$f_id = $_;
$rankburyoku{$f_id} = $i;
		$i++;
	}
##############

@INT = sort { $p_tiryoku{$b} <=> $p_tiryoku{$a} or $a cmp $b} keys %p_tiryoku;

##############
	$tiryoku_list = "<tr><td>順位</td><td>総合</td><td>武力</td><td>知力</td><td>統率</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $INT[0];


	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_tiryoku","$f_id","","","","","","","");
	$tiryokuno1 = $p_tiryoku{$f_id};
	$best_list .= "<tr><td><strong><a href=\"#4\">・</a>神算鬼謀（知力No.1）</strong></td><td class=\"txth\">$p_tiryoku{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$tiryoku_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</td><td>$p_sougou{$f_id}</td><td>$p_buryoku{$f_id}</td><td class=\"txth\">$p_tiryoku{$f_id}</td><td>$p_tousotu{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $INT[$i];
	$tiryoku_list .= "<tr><td>$p位</td><td>$p_sougou{$f_id}</td><td>$p_buryoku{$f_id}</td><td class=\"txth\">$p_tiryoku{$f_id}</td><td>$p_tousotu{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@INT){
		$f_id = $_;
$ranktiryoku{$f_id} = $i;
		$i++;
	}
##############

@TOUSOTU = sort { $p_tousotu{$b} <=> $p_tousotu{$a} or $a cmp $b} keys %p_tousotu;

##############
	$tousotu_list = "<tr><td>順位</td><td>総合</td><td>武力</td><td>知力</td><td>統率</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $TOUSOTU[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_tousotu","$f_id","","","","","","","");
	$tousotuno1 = $p_tousotu{$f_id};
	$best_list .= "<tr><td><strong><a href=\"#5\">・</a>大都督（統率No.1）</strong></td><td class=\"txth\">$p_tousotu{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$tousotu_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td>$p_sougou{$f_id}</td><td>$p_buryoku{$f_id}</td><td>$p_tiryoku{$f_id}</td><td class=\"txth\">$p_tousotu{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $TOUSOTU[$i];
	$tousotu_list .= "<tr><td>$p位</td><td>$p_sougou{$f_id}</td><td>$p_buryoku{$f_id}</td><td>$p_tiryoku{$f_id}</td><td class=\"txth\">$p_tousotu{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@TOUSOTU){
		$f_id = $_;
$ranktousotu{$f_id} = $i;
		$i++;
	}
##############

@JYUSSYU = sort { $p_10syu_sougou{$b} <=> $p_10syu_sougou{$a} or $a cmp $b} keys %p_10syu_sougou;

##############
	$jyusssyu_list = "<tr><td>順位</td><td>三種</td><td>十種</td><td colspan=\"2\">名声</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $JYUSSYU[0];
	$jyussyuno1 = $p_10syu_sougou{$f_id};

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_jyussyu_sougou","$f_id","","","","","","","");
	$best_list .= "<tr><td><strong><a href=\"#6\">・</a>鬼才（十種No.1）</strong></td><td class=\"txth\">$p_10syu_sougou{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$jyusssyu_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td>$p_sougou{$f_id}</td><td class=\"txth\">$p_10syu_sougou{$f_id}</td><td colspan=\"2\">$p_neutral_meisei{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $JYUSSYU[$i];
	$jyusssyu_list .= "<tr><td>$p位</td><td>$p_sougou{$f_id}</td><td class=\"txth\">$p_10syu_sougou{$f_id}</td><td colspan=\"2\">$p_neutral_meisei{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td><a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$p_kunino{$f_id}.html\" target=\"_blank\"><span class=\"c404000\">$k_name_d[$p_kunino{$f_id}]</span></a></td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@JYUSSYU){
		$f_id = $_;
$rankjyussyu{$f_id} = $i;
		$i++;
	}

##############

@KIJYOU = sort { $p_kijyou{$b} <=> $p_kijyou{$a} or $a cmp $b} keys %p_kijyou;

##############
	$kijyou_list = "<tr><td>順位</td><td>三種</td><td>十種</td><td>騎乗</td><td>射撃</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $KIJYOU[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_kijyou","$f_id","","","","","","","");
	$kijyouno1 = $p_kijyou{$f_id};
	$best_list .= "<tr><td><strong><a href=\"#7\">・</a>騎乗No.1</strong></td><td class=\"txth\">$p_kijyou{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$kijyou_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\">$p_kijyou{$f_id}</td><td>$p_syageki{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $KIJYOU[$i];
	$kijyou_list .= "<tr><td>$p位</td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\">$p_kijyou{$f_id}</td><td>$p_syageki{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@KIJYOU){
		$f_id = $_;
$rankkijyou{$f_id} = $i;
		$i++;
	}
##############

@SYAGEKI = sort { $p_syageki{$b} <=> $p_syageki{$a} or $a cmp $b} keys %p_syageki;

##############
	$syageki_list = "<tr><td>順位</td><td>三種</td><td>十種</td><td>射撃</td><td>武術</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $SYAGEKI[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_syageki","$f_id","","","","","","","");
	$syagekino1 = $p_syageki{$f_id};
	$best_list .= "<tr><td><strong><a href=\"#8\">・</a>射撃No.1</strong></td><td class=\"txth\">$p_syageki{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$syageki_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\">$p_syageki{$f_id}</td><td>$p_bujyutu{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $SYAGEKI[$i];
	$syageki_list .= "<tr><td>$p位</td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\">$p_syageki{$f_id}</td><td>$p_bujyutu{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@SYAGEKI){
		$f_id = $_;
$ranksyageki{$f_id} = $i;
		$i++;
	}
##############

@BUJYUTU = sort { $p_bujyutu{$b} <=> $p_bujyutu{$a} or $a cmp $b} keys %p_bujyutu;

##############
	$bujyutu_list = "<tr><td>順位</td><td>三種</td><td>十種</td><td>武術</td><td>諜報</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $BUJYUTU[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_bujyutu","$f_id","","","","","","","");
	$bujyutuno1 = $p_bujyutu{$f_id};
	$best_list .= "<tr><td><strong><a href=\"#9\">・</a>武術No.1</strong></td><td class=\"txth\">$p_bujyutu{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$bujyutu_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\">$p_bujyutu{$f_id}</td><td>$p_tyouhou{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $BUJYUTU[$i];
	$bujyutu_list .= "<tr><td>$p位</td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\">$p_bujyutu{$f_id}</td><td>$p_tyouhou{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@BUJYUTU){
		$f_id = $_;
$rankbujyutu{$f_id} = $i;
		$i++;
	}
##############

@JYUJYUTU = sort { $p_jyujyutu{$b} <=> $p_jyujyutu{$a} or $a cmp $b} keys %p_jyujyutu;

##############
	$jyujyutu_list = "<tr><td>順位</td><td>三種</td><td>十種</td><td>呪術</td><td>調教</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $JYUJYUTU[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_jyujyutu","$f_id","","","","","","","");
	$jyujyutuno1 = $p_jyujyutu{$f_id};
	$best_list .= "<tr><td><strong><a href=\"#10\">・</a>呪術No.1</strong></td><td class=\"txth\">$p_jyujyutu{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$jyujyutu_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\">$p_jyujyutu{$f_id}</td><td>$p_tyoukyou{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $JYUJYUTU[$i];
	$jyujyutu_list .= "<tr><td>$p位</td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\">$p_jyujyutu{$f_id}</td><td>$p_tyoukyou{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@JYUJYUTU){
		$f_id = $_;
$rankjyujyutu{$f_id} = $i;
		$i++;
	}
##############

@TYOUHOU = sort { $p_tyouhou{$b} <=> $p_tyouhou{$a} or $a cmp $b} keys %p_tyouhou;

##############
	$tyouhou_list = "<tr><td>順位</td><td>三種</td><td>十種</td><td>諜報</td><td>政治</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $TYOUHOU[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_tyouhou","$f_id","","","","","","","");
	$tyouhouno1 = $p_tyouhou{$f_id};
	$best_list .= "<tr><td><strong><a href=\"#11\">・</a>諜報No.1</strong></td><td class=\"txth\">$p_tyouhou{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$tyouhou_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\">$p_tyouhou{$f_id}</td><td>$p_seiji{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $TYOUHOU[$i];
	$tyouhou_list .= "<tr><td>$p位</td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\">$p_tyouhou{$f_id}</td><td>$p_seiji{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@TYOUHOU){
		$f_id = $_;
$ranktyouhou{$f_id} = $i;
		$i++;
	}
##############

@JYUUKISOUDA = sort { $p_jyuukisouda{$b} <=> $p_jyuukisouda{$a} or $a cmp $b} keys %p_jyuukisouda;

##############
	$jyuukisouda_list = "<tr><td>順位</td><td>三種</td><td>重機</td><td>射撃</td><td>義理</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $JYUUKISOUDA[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_jyuukisouda","$f_id","","","","","","","");
	$jyuukisoudano1 = $p_jyuukisouda{$f_id};
	$best_list .= "<tr><td><strong><a href=\"#12\">・</a>重機No.1</strong></td><td class=\"txth\">$p_jyuukisouda{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$jyuukisouda_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\">$p_jyuukisouda{$f_id}</td><td>$p_syageki{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $JYUUKISOUDA[$i];
	$jyuukisouda_list .= "<tr><td>$p位</td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\">$p_jyuukisouda{$f_id}</td><td>$p_syageki{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@JYUUKISOUDA){
		$f_id = $_;
$rankjyuukisouda{$f_id} = $i;
		$i++;
	}
##############

@TYOUKYOU = sort { $p_tyoukyou{$b} <=> $p_tyoukyou{$a} or $a cmp $b} keys %p_tyoukyou;

##############
	$tyoukyou_list = "<tr><td>順位</td><td>三種</td><td>十種</td><td>調教</td><td>騎乗</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $TYOUKYOU[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_tyoukyou","$f_id","","","","","","","");
	$tyoukyouno1 = $p_tyoukyou{$f_id};
	$best_list .= "<tr><td><strong><a href=\"#13\">・</a>調教No.1</strong></td><td class=\"txth\">$p_tyoukyou{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$tyoukyou_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\">$p_tyoukyou{$f_id}</td><td>$p_kijyou{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $TYOUKYOU[$i];
	$tyoukyou_list .= "<tr><td>$p位</td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\">$p_tyoukyou{$f_id}</td><td>$p_kijyou{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@TYOUKYOU){
		$f_id = $_;
$ranktyoukyou{$f_id} = $i;
		$i++;
	}
##############
@JINBOU = sort { $p_jinbou{$b} <=> $p_jinbou{$a} or $a cmp $b} keys %p_jinbou;

##############
	$jinbou_list = "<tr><td>順位</td><td>三種</td><td>十種</td><td>人望</td><td>調教</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $JINBOU[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_jinbou","$f_id","","","","","","","");
	$jinbouno1 = $p_jinbou{$f_id};
	$best_list .= "<tr><td><strong><a href=\"#14\">・</a>人望No.1</strong></td><td class=\"txth\">$p_jinbou{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$jinbou_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\">$p_jinbou{$f_id}</td><td>$p_tyoukyou{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $JINBOU[$i];
	$jinbou_list .= "<tr><td>$p位</td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\">$p_jinbou{$f_id}</td><td>$p_tyoukyou{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@JINBOU){
		$f_id = $_;
$rankjinbou{$f_id} = $i;
		$i++;
	}
##############

@SEIJI = sort { $p_seiji{$b} <=> $p_seiji{$a} or $a cmp $b} keys %p_seiji;

##############
	$seiji_list = "<tr><td>順位</td><td>三種</td><td>十種</td><td>政治</td><td>人望</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $SEIJI[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_seiji","$f_id","","","","","","","");
	$seijino1 = $p_seiji{$f_id};
	$best_list .= "<tr><td><strong><a href=\"#15\">・</a>政治No.1</strong></td><td class=\"txth\">$p_seiji{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$seiji_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\">$p_seiji{$f_id}</td><td>$p_jinbou{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $SEIJI[$i];
	$seiji_list .= "<tr><td>$p位</td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\">$p_seiji{$f_id}</td><td>$p_jinbou{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@SEIJI){
		$f_id = $_;
$rankseiji{$f_id} = $i;
		$i++;
	}
##############

@SINYOU = sort { $p_sinyou{$b} <=> $p_sinyou{$a} or $a cmp $b} keys %p_sinyou;

##############
	$sinyou_list = "<tr><td>順位</td><td>三種</td><td>十種</td><td>商才</td><td>政治</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $SINYOU[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_sinyou","$f_id","","","","","","","");
	$sinyouno1 = $p_sinyou{$f_id};
	$best_list .= "<tr><td><strong><a href=\"#16\">・</a>商才No.1</strong></td><td class=\"txth\">$p_sinyou{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$sinyou_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\">$p_sinyou{$f_id}</td><td>$p_seiji{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $SINYOU[$i];
	$sinyou_list .= "<tr><td>$p位</td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\">$p_sinyou{$f_id}</td><td>$p_seiji{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@SINYOU){
		$f_id = $_;
$ranksinyou{$f_id} = $i;
		$i++;
	}
##############

@GOGYOU_KA = sort { $p_gogyou_ka{$b} <=> $p_gogyou_ka{$a} or $a cmp $b} keys %p_gogyou_ka;

##############
	$gogyou_ka_list = "<tr><td>順位</td><td>三種</td><td>十種</td><td colspan=\"2\">火行</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $GOGYOU_KA[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_gogyou_ka","$f_id","","","","","","","");
	$gogyou_kano1 = $p_gogyou_ka{$f_id};
	$best_list .= "<tr><td><strong><a href=\"#17\">・</a>火行No.1</strong></td><td class=\"txth\">$p_gogyou_ka{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$gogyou_ka_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_gogyou_ka{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $GOGYOU_KA[$i];
	$gogyou_ka_list .= "<tr><td>$p位</td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_gogyou_ka{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@GOGYOU_KA){
		$f_id = $_;
$rankgogyou_ka{$f_id} = $i;
		$i++;
	}
##############

@GOGYOU_SUI = sort { $p_gogyou_sui{$b} <=> $p_gogyou_sui{$a} or $a cmp $b} keys %p_gogyou_sui;

##############
	$gogyou_sui_list = "<tr><td>順位</td><td>三種</td><td>十種</td><td colspan=\"2\">水行</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $GOGYOU_SUI[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_gogyou_sui","$f_id","","","","","","","");
	$gogyou_suino1 = $p_gogyou_sui{$f_id};
	$best_list .= "<tr><td><strong><a href=\"#18\">・</a>水行No.1</strong></td><td class=\"txth\">$p_gogyou_sui{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$gogyou_sui_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_gogyou_sui{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $GOGYOU_SUI[$i];
	$gogyou_sui_list .= "<tr><td>$p位</td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_gogyou_sui{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@GOGYOU_SUI){
		$f_id = $_;
$rankgogyou_sui{$f_id} = $i;
		$i++;
	}
##############

@GOGYOU_MOKU = sort { $p_gogyou_moku{$b} <=> $p_gogyou_moku{$a} or $a cmp $b} keys %p_gogyou_moku;

##############
	$gogyou_moku_list = "<tr><td>順位</td><td>三種</td><td>十種</td><td colspan=\"2\">木行</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $GOGYOU_MOKU[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_gogyou_moku","$f_id","","","","","","","");
	$gogyou_mokuno1 = $p_gogyou_moku{$f_id};
	$best_list .= "<tr><td><strong><a href=\"#19\">・</a>木行No.1</strong></td><td class=\"txth\">$p_gogyou_moku{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$gogyou_moku_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_gogyou_moku{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $GOGYOU_MOKU[$i];
	$gogyou_moku_list .= "<tr><td>$p位</td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_gogyou_moku{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@GOGYOU_MOKU){
		$f_id = $_;
$rankgogyou_moku{$f_id} = $i;
		$i++;
	}
##############

@GOGYOU_KIN = sort { $p_gogyou_kin{$b} <=> $p_gogyou_kin{$a} or $a cmp $b} keys %p_gogyou_kin;

##############
	$gogyou_kin_list = "<tr><td>順位</td><td>三種</td><td>十種</td><td colspan=\"2\">金行</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $GOGYOU_KIN[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_gogyou_kin","$f_id","","","","","","","");
	$gogyou_kinno1 = $p_gogyou_kin{$f_id};
	$best_list .= "<tr><td><strong><a href=\"#20\">・</a>金行No.1</strong></td><td class=\"txth\">$p_gogyou_kin{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$gogyou_kin_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_gogyou_kin{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $GOGYOU_KIN[$i];
	$gogyou_kin_list .= "<tr><td>$p位</td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_gogyou_kin{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@GOGYOU_KIN){
		$f_id = $_;
$rankgogyou_kin{$f_id} = $i;
		$i++;
	}
##############

@GOGYOU_DO = sort { $p_gogyou_do{$b} <=> $p_gogyou_do{$a} or $a cmp $b} keys %p_gogyou_do;

##############
	$gogyou_do_list = "<tr><td>順位</td><td>三種</td><td>十種</td><td colspan=\"2\">土行</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $GOGYOU_DO[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_gogyou_do","$f_id","","","","","","","");
	$gogyou_dono1 = $p_gogyou_do{$f_id};
	$best_list .= "<tr><td><strong><a href=\"#21\">・</a>土行No.1</strong></td><td class=\"txth\">$p_gogyou_do{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$gogyou_do_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_gogyou_do{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $GOGYOU_DO[$i];
	$gogyou_do_list .= "<tr><td>$p位</td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_gogyou_do{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@GOGYOU_DO){
		$f_id = $_;
$rankgogyou_do{$f_id} = $i;
		$i++;
	}
##############

@KARUMA_LC_L = sort { $p_ex_karumalc{$b} <=> $p_ex_karumalc{$a} or $a cmp $b} keys %p_ex_karumalc;

##############
	$karuma_lc_l_list = "<tr><td>順位</td><td colspan=\"2\">律+/混-</td><td colspan=\"2\">光+/闇-</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $KARUMA_LC_L[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_karuma_lc_l","$f_id","","","","","","","");
	$karuma_lc_lno1 = $p_karuma_lc{$f_id};
	$best_list .= "<tr><td><strong><a href=\"#22\">・</a>律師（low）No.1</strong></td><td class=\"txth\">$p_ex_karumalc{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$karuma_lc_l_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td class=\"txth\" colspan=\"2\">$p_ex_karumalc{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_ex_karumald{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $KARUMA_LC_L[$i];
	$karuma_lc_l_list .= "<tr><td>$p位</td><td class=\"txth\" colspan=\"2\">$p_ex_karumalc{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_ex_karumald{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@KARUMA_LC_L){
		$f_id = $_;
$rankkaruma_lc_l{$f_id} = $i;
		$i++;
	}
##############

@KARUMA_LC_C = sort { $p_ex_karumalc{$a} <=> $p_ex_karumalc{$b} or $b cmp $a} keys %p_ex_karumalc;

##############
	$karuma_lc_c_list = "<tr><td>順位</td><td colspan=\"2\">律+/混-</td><td colspan=\"2\">光+/闇-</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $KARUMA_LC_C[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_karuma_lc_l","$f_id","","","","","","","");
	$karuma_lc_cno1 = $p_karuma_lc{$f_id};
	$best_list .= "<tr><td><strong><a href=\"#23\">・</a>無頼（chaos）No.1</strong></td><td class=\"txth\">$p_ex_karumalc{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$karuma_lc_c_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td class=\"txth\" colspan=\"2\">$p_ex_karumalc{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_ex_karumald{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $KARUMA_LC_C[$i];
	$karuma_lc_c_list .= "<tr><td>$p位</td><td class=\"txth\" colspan=\"2\">$p_ex_karumalc{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_ex_karumald{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@KARUMA_LC_C){
		$f_id = $_;
$rankkaruma_lc_c{$f_id} = $i;
		$i++;
	}
##############

@KARUMA_LD_L = sort { $p_ex_karumald{$b} <=> $p_ex_karumald{$a} or $a cmp $b} keys %p_ex_karumald;

##############
	$karuma_ld_l_list = "<tr><td>順位</td><td colspan=\"2\">光+/闇-</td><td colspan=\"2\">律+/混-</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $KARUMA_LD_L[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_karuma_lc_l","$f_id","","","","","","","");
	$karuma_ld_lno1 = $p_karuma_ld{$f_id};
	$best_list .= "<tr><td><strong><a href=\"#24\">・</a>光属性No.1</strong></td><td class=\"txth\">$p_ex_karumald{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$karuma_ld_l_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td class=\"txth\" colspan=\"2\">$p_ex_karumald{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_ex_karumalc{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $KARUMA_LD_L[$i];
	$karuma_ld_l_list .= "<tr><td>$p位</td><td class=\"txth\" colspan=\"2\">$p_ex_karumald{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_ex_karumalc{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@KARUMA_LD_L){
		$f_id = $_;
$rankkaruma_ld_l{$f_id} = $i;
		$i++;
	}
##############

@KARUMA_LD_D = sort { $p_ex_karumald{$a} <=> $p_ex_karumald{$b} or $b cmp $a} keys %p_ex_karumald;

##############
	$karuma_ld_d_list = "<tr><td>順位</td><td colspan=\"2\">光+/闇-</td><td colspan=\"2\">律+/混-</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $KARUMA_LD_D[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_karuma_lc_l","$f_id","","","","","","","");
	$karuma_ld_dno1 = $p_karuma_ld{$f_id};
	$best_list .= "<tr><td><strong><a href=\"#25\">・</a>闇属性No.1</strong></td><td class=\"txth\">$p_ex_karumald{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$karuma_ld_d_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td class=\"txth\" colspan=\"2\">$p_ex_karumald{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_ex_karumalc{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $KARUMA_LD_D[$i];
	$karuma_ld_d_list .= "<tr><td>$p位</td><td class=\"txth\" colspan=\"2\">$p_ex_karumald{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_ex_karumalc{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@KARUMA_LD_D){
		$f_id = $_;
$rankkaruma_ld_d{$f_id} = $i;
		$i++;
	}
##############
@GEKIHA = sort { $p_gekiha{$b} <=> $p_gekiha{$a} or $a cmp $b} keys %p_gekiha;

##############
	$gekiha_list = "<tr><td>順位</td><td>三種</td><td>十種</td><td colspan=\"2\">撃破数</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $GEKIHA[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_gekiha","$f_id","","","","","","","");
	$best_list .= "<tr><td><strong><a href=\"#26\">・</a>撃破No.1</strong></td><td class=\"txth\">$p_gekiha{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td></tr>";
	$gekiha_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_gekiha{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $GEKIHA[$i];
	$gekiha_list .= "<tr><td>$p位</td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_gekiha{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@GEKIHA){
		$f_id = $_;
$rankgekiha{$f_id} = $i;
		$i++;
	}

##############

@SISAN = sort { $p_sousisan{$b} <=> $p_sousisan{$a} or $a cmp $b} keys %p_sousisan;

##############
	$sousisan_list = "<tr><td>順位</td><td>商才</td><td colspan=\"3\">総資産</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $SISAN[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_sisan","$f_id","","","","","","","");
	$best_list .= "<tr><td><strong><a href=\"#27\">・</a>大富豪（総資産No.1）</strong></td><td class=\"txth\">$p_sousisan{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$sousisan_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td>$p_sinyou{$f_id}</td><td class=\"txth\" colspan=\"3\">$p_sousisan{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $SISAN[$i];
	$sousisan_list .= "<tr><td>$p位</td><td>$p_sinyou{$f_id}</td><td class=\"txth\" colspan=\"3\">$p_sousisan{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@SISAN){
		$f_id = $_;
$ranksisan{$f_id} = $i;
		$i++;
	}
##############

@MEISEI = sort { $p_neutral_meisei{$b} <=> $p_neutral_meisei{$a} or $a cmp $b} keys %p_neutral_meisei;

##############
	$neutral_meisei_list = "<tr><td>順位</td><td>三種</td><td>十種</td><td colspan=\"2\">名声</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $MEISEI[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_meisei","$f_id","","","","","","","");
	$best_list .= "<tr><td><strong><a href=\"#28\">・</a>名声No.1</strong></td><td class=\"txth\">$p_neutral_meisei{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$neutral_meisei_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_neutral_meisei{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $MEISEI[$i];
	$neutral_meisei_list .= "<tr><td>$p位</td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_neutral_meisei{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@MEISEI){
		$f_id = $_;
$rankneutral_meisei{$f_id} = $i;
		$i++;
	}
##############

@GIRI = sort { $p_exgiri{$b} <=> $p_exgiri{$a} or $a cmp $b} keys %p_exgiri;

##############
	$giri_list = "<tr><td>順位</td><td>三種</td><td>十種</td><td>人望</td><td>義理</td><td colspan=\"2\">名前</td><td>所属国</td><td>所属派閥</td></tr>";

		$f_id = $GIRI[0];

	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_giri","$f_id","","","","","","","");
	$best_list .= "<tr><td><strong><a href=\"#29\">・</a>義理No.1</strong></td><td class=\"txth\">$p_exgiri{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
	$giri_list .= "<tr><td class=\"txth\"><span class=\"c0000FF\">☆1位</span></td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td>$p_jinbou{$f_id}</td><td class=\"txth\">$p_exgiri{$f_id}</td><td class=\"txth\">$p_p_b_a{$f_id}</td><td>$img_sakusei_kekka</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";

	$p=2;
	while($p <= 10){
	$i= $p - 1;
		$f_id = $GIRI[$i];
	$giri_list .= "<tr><td>$p位</td><td>$p_sougou{$f_id}</td><td>$p_10syu_sougou{$f_id}</td><td>$p_jinbou{$f_id}</td><td class=\"txth\">$p_exgiri{$f_id}</td><td class=\"txth\" colspan=\"2\">$p_p_b_a{$f_id}</td><td>$k_p_k_a{$p_kunino{$f_id}}</td><td>$h_p_h_a{$p_habatuno{$f_id}}</td></tr>";
		$p++;
	}

	$i= 1;
	foreach(@GIRI){
		$f_id = $_;
$rankgiri{$f_id} = $i;
	@RANKNEW=();
	unshift(@RANKNEW,"$p_sougou{$f_id}<>$ranksougou{$f_id}<>$p_buryoku{$f_id}<>$rankburyoku{$f_id}<>$p_tiryoku{$f_id}<>$ranktiryoku{$f_id}<>$p_tousotu{$f_id}<>$ranktousotu{$f_id}<>$p_10syu_sougou{$f_id}<>$rankjyussyu{$f_id}<>$p_kijyou{$f_id}<>$rankkijyou{$f_id}<>$p_syageki{$f_id}<>$ranksyageki{$f_id}<>$p_bujyutu{$f_id}<>$rankbujyutu{$f_id}<>$p_jyujyutu{$f_id}<>$rankjyujyutu{$f_id}<>$p_tyouhou{$f_id}<>$ranktyouhou{$f_id}<>$p_jyuukisouda{$f_id}<>$rankjyuukisouda{$f_id}<>$p_tyoukyou{$f_id}<>$ranktyoukyou{$f_id}<>$p_jinbou{$f_id}<>$rankjinbou{$f_id}<>$p_seiji{$f_id}<>$rankseiji{$f_id}<>$p_sinyou{$f_id}<>$ranksinyou{$f_id}<>$p_gogyou_ka{$f_id}<>$rankgogyou_ka{$f_id}<>$p_gogyou_sui{$f_id}<>$rankgogyou_sui{$f_id}<>$p_gogyou_moku{$f_id}<>$rankgogyou_moku{$f_id}<>$p_gogyou_kin{$f_id}<>$rankgogyou_kin{$f_id}<>$p_gogyou_ka{$f_id}<>$rankgogyou_do{$f_id}<>$p_karumalc{$f_id}<>$rankkarumalc_l{$f_id}<>$rankkarumalc_c{$f_id}<>$p_karumald{$f_id}<>$rankkarumald_l{$f_id}<>$rankkarumald_d{$f_id}<>$p_gekiha{$f_id}<>$rankgekiha{$f_id}<>$p_sousisan{$f_id}<>$ranksisan{$f_id}<>$p_neutral_meisei{$f_id}<>$rankneutral_meisei{$f_id}<>$p_law_meisei{$f_id}<>$ranklaw_meisei{$f_id}<>$p_chaos_meisei{$f_id}<>$rankchaos_meisei{$f_id}<>$p_light_meisei{$f_id}<>$ranklight_meisei{$f_id}<>$p_dark_meisei{$f_id}<>$rankdark_meisei{$f_id}<>$p_exgiri{$f_id}<>$rankgiri{$f_id}<>\n");
	open(OUT,">./p_db/rank/$f_id.cgi");
	print OUT @RANKNEW;
	close(OUT);
		$i++;
	}

##############

	@TMTM=();
	unshift(@TMTM,"$sougouno1<>$buryokuno1<>$tiryokuno1<>$tousotuno1<>$jyussyuno1<>\n");
	open(OUT,">./w_db/no1.cgi");
	print OUT @TMTM;
	close(OUT);

		
		$mapseisei = "";
		$mapseisei .= "$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/main.css\" />
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/td_center.css\" />
<title>$GAME_TITLE$MEN_TITLE $outyou《  名 将 一 覧  》</title>
</head><body>$TAG_div_s{$doc_mode}
<a id=\"1\"></a>
<div class=\"txtl\">\[$old_date\] 月初めに編集$tt_date（稼動武将数$sousu1）</div>

<br /><br />\n<a href=\"#1\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#2\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"150\"></td><td width=\"105\"></td><td width=\"115\"></td><td width=\"115\"></td><td width=\"115\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"5\"><span class=\"fs4\"><span class=\"cCCDDCC\">大陸の覇者</span></span></td></tr>
$best_list
</table>
<br /><br /><br /><br />
<br /><br /><br /><br />

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />

<a id=\"2\"></a>\n<a href=\"#1\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#3\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">三種総合ベスト10</span></span></td></tr>
$point_list
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"3\"></a>\n<a href=\"#2\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#4\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">武力ベスト10</span></span></td></tr>
$buryoku_list
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"4\"></a>\n<a href=\"#3\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#5\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">知力ベスト10</span></span></td></tr>
$tiryoku_list
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"5\"></a>\n<a href=\"#4\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#6\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">統率ベスト10</span></span></td></tr>
$tousotu_list
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"6\"></a>\n<a href=\"#5\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#7\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">鬼才ベスト10</span></span></td></tr>
$jyusssyu_list
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"7\"></a>\n<a href=\"#6\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#8\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">騎乗ベスト10</span></span></td></tr>
$kijyou_list
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"8\"></a>\n<a href=\"#7\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#9\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">射撃ベスト10</span></span></td></tr>
$syageki_list
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"9\"></a>\n<a href=\"#8\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#10\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">武術ベスト10</span></span></td></tr>
$bujyutu_list
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"10\"></a>\n<a href=\"#9\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#11\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">呪術ベスト10</span></span></td></tr>
$jyujyutu_list
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"11\"></a>\n<a href=\"#10\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#12\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">諜報ベスト10</span></span></td></tr>
$tyouhou_list
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"12\"></a>\n<a href=\"#11\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#13\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">重機操舵ベスト10</span></span></td></tr>
$jyuukisouda_list
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"13\"></a>\n<a href=\"#12\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#14\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">調教ベスト10</span></span></td></tr>
$tyoukyou_list
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"14\"></a>\n<a href=\"#13\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#15\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">人望ベスト10</span></span></td></tr>
$jinbou_list
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"15\"></a>\n<a href=\"#14\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#16\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">政治ベスト10</span></span></td></tr>
$seiji_list
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"16\"></a>\n<a href=\"#15\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#17\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">商才ベスト10</span></span></td></tr>
$sinyou_list
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"17\"></a>\n<a href=\"#16\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#18\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">火行ベスト10</span></span></td></tr>
$gogyou_ka_list
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"18\"></a>\n<a href=\"#17\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#19\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">水行ベスト10</span></span></td></tr>
$gogyou_sui_list
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"19\"></a>\n<a href=\"#18\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#20\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">木行ベスト10</span></span></td></tr>
$gogyou_moku_list
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"20\"></a>\n<a href=\"#19\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#21\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">金行ベスト10</span></span></td></tr>
$gogyou_kin_list
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"21\"></a>\n<a href=\"#20\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#22\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">土行ベスト10</span></span></td></tr>
$gogyou_do_list
</table>
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"22\"></a>\n<a href=\"#21\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#23\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">律師（low）ベスト10</span></span></td></tr>
$karuma_lc_l_list
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"23\"></a>\n<a href=\"#22\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#24\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">無頼（chaos）ベスト10</span></span></td></tr>
$karuma_lc_c_list
</table>
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"24\"></a>\n<a href=\"#23\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#25\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">光属性ベスト10</span></span></td></tr>
$karuma_ld_l_list
</table>
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"25\"></a>\n<a href=\"#24\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#26\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">闇属性ベスト10</span></span></td></tr>
$karuma_ld_d_list
</table>
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"26\"></a>\n<a href=\"#25\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#27\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">撃破数ベスト10</span></span></td></tr>
$gekiha_list
</table>
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"27\"></a>\n<a href=\"#26\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#28\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">資産ベスト10</span></span></td></tr>
$sousisan_list
</table>



<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"28\"></a>\n<a href=\"#27\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#29\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">名声ベスト10</span></span></td></tr>
$neutral_meisei_list
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<a id=\"29\"></a>\n<a href=\"#28\">↑↑↑</a> <a href=\"#1\">・</a> <a href=\"#30\">↓↓↓</a>
<table border=\"1\" width=\"600\">
<tr><td width=\"44\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"34\"></td><td width=\"105\"></td><td width=\"100\"></td><td width=\"105\"></td><td width=\"105\"></td></tr>
<tr class=\"bgc446644\"><td class=\"txth\" colspan=\"9\"><span class=\"fs4\"><span class=\"cCCDDCC\">義理ベスト10</span></span></td></tr>
$giri_list
</table>

<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
";

}

sub RANK0 {

&RANK_MAKE;

		$mapseisei .= "
<form action=\"$COMMAND\" method=\"post\" target=\"_top\"><div>
<input type=\"submit\" value=\"ログイン画面へ\" /></div></form>
$mapseisei2

</div></body></html>";

	open(OUT,">./meisyou.html");
	print OUT $mapseisei;
	close(OUT);

		if($tuki_genzai eq "1"){
			$mapseisei2 = $mapseisei;
			$mapseisei2 =~ s/\/mapr/\./;

rename ("./ranking2w.html", "./mapr/tuki/$ryymaprid-r2.html");

	open(OUT,">./ranking2w.html");
	print OUT $mapseisei2;
	close(OUT);
		}

}

sub RANK1 {
#   RANK1    #
	@c=();

require "./$mpg_r/sub_db/1.pl";

require "./$mpg_r/sub_db/kanbu.pl";

		@xcidt = ();
		@xcidb = ();
		$add_k_tw = "";
	foreach(@k_seizon_l){
		$fk_id=$_;
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


	$l=0;
	while ($l<$tosi_kazu) {
							unlink("./w_db/mati/tyouheihit$l.cgi");
		$l++;
	}



	$i=0;

	@list=();
	@lista=();
	@list_etc=();
		@cbl = ();

	foreach(@p_db_all_l){
			$f_id = $_;

$fk_id = $p_kunino{$f_id};
$ft_id = $p_taizai_iti{$f_id};
	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id\_touroku","$f_id","","","","","","","");
				$khsnp = "";
				$khsnp = $p_pet_name{$f_id}[0];


			$ldate = $TOUKETU_T - $p_mikoudou_t{$f_id};
$ims{$ldate} = "凍結まで<span class=\"c0000FF\">$ldate</span>";
$ims{0} = "<span class=\"cFF0000\">凍結対象</span>";
				$rm = $ims{$ldate};

			if($k_kunino{$fk_id}){
				if(!$c[$fk_id]){
					$p_sougou{$f_id} = $p_buryoku{$f_id} + $p_tiryoku{$f_id} + $p_tousotu{$f_id};
				$list[$fk_id] .= "<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>$img_sakusei_kekka</td><td class=\"txth\">$p_p_b_a{$f_id}
</td><td>
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
</td></tr>";
					$lista[$fk_id] .= "$p_p_b_a{$f_id}";
				}else{
					$lista[$fk_id] .= "$p_p_b_a{$f_id}";
				}
				$c[$fk_id]++;
				$cbl[$k_kunino{$fk_id}]++;
#################
			$blist[$k_kunino{$fk_id}] .= "<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>$img_sakusei_kekka</td><td class=\"txth\"><a href=\"../../?.m.=p_b&amp;.id.=$p_id{$f_id}\" target=\"_blank\"><span class=\"c404000\">$p_name{$f_id}</a></td><td>
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
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td colspan=\"6\">$rmターン│神獣：$jyuu[$p_pet_type{$f_id}[0]]$khsnp</td></tr>";

#################
			}else{
				$list_etc .= "$p_p_b_a{$f_id} ";
#################

			$blist[$k_kunino{$fk_id}] .= "<tr class=\"kbgcc$k_iro_d{$k_kunino{$fk_id}}\"><td>$img_sakusei_kekka</td><td class=\"txth\"><a href=\"../../?.m.=p_b&amp;.id.=$p_id{$f_id}\" target=\"_blank\"><span class=\"c404000\">$p_name{$f_id}</a></td>
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
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td colspan=\"6\">$rmターン│神獣：$jyuu[$p_pet_type{$f_id}[0]]$khsnp</td></tr>";


			$blist[$k_id{$fk_id}] .= "<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>$img_sakusei_kekka</td><td class=\"txth\"><a href=\"../../?.m.=p_b&amp;.id.=$p_id{$f_id}\" target=\"_blank\"><span class=\"c404000\">$p_name{$f_id}</a></td>
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
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td colspan=\"6\">$rmターン│神獣：$jyuu[$p_pet_type{$f_id}[0]]$khsnp</td></tr>";

#################
			}
		$add_w[$k_kunino{$fk_id}] = "k";
		$add_w[0] = "x";
		$add_w2[0] = "$add_w[$k_kunino{$fk_id}]";
		$add_w2[1] = "z";
		$add_w2[2] = "z";
			$com_list{"tmrk$ft_id"} = "";
			$com_list{"tmrz$ft_id"} = "";
			$com_list{"tmrx$ft_id"} = "";
				open(IN,"./p_db/cd/$f_id.cgi");
				@CD_DB = <IN>;
				close(IN);
				$i=0;
				while($i < 4){
					($cd_id,$cd_no,$cd_name,$cd_op0,$cd_op1,$cd_op2,$cd_op3) = split(/<>/,$CD_DB[$i]);
					$no = $i+1;
					$com_list{"tmr$add_w2[$k_kokka_keitai{$k_kunino{$fk_id}}]$ft_id"} .= "$no:$cd_name<br />";
				$i++;
				}
###############TOSI_S
	&IMG_B_CG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide","$img_height","$p_img_m{$f_id}","b$f_id","$f_id","","#FFF0F5","","","","");
			$add_w = "
<tr class=\"bgcFFF8F0\"><td class=\"bgcFFF0F5\">$img_sakusei_kekka
</td>
<td class=\"txtc\"><a href=\"../../?.m.=p_b&amp;.id.=$p_id{$p_id{$f_id}}\" target=\"_blank\"><span class=\"c404000\">$p_name{$f_id}</span></a><br /><br />（<a href=\"../../?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$fk_id\" target=\"_blank\"><span class=\"c404000\">$k_name_d[$fk_id]</span></a>）</td>
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
</td><td>";

			$tosi_seisei_l{"tmrk$ft_id"} .= $add_w;
			$tosi_seisei_l{"tmrz$ft_id"} .= $add_w;
			$tosi_seisei_l{"tmrx$ft_id"} .= $add_w;

			$tosi_seisei_l{"tmrk$ft_id"} .= $com_list{"tmrk$ft_id"};
			$tosi_seisei_l{"tmrz$ft_id"} .= $com_list{"tmrz$ft_id"};
			$tosi_seisei_l{"tmrx$ft_id"} .= $com_list{"tmrx$ft_id"};
			$tosi_seisei_l{"tmrk$ft_id"} .= "</td></tr>";
			$tosi_seisei_l{"tmrz$ft_id"} .= "</td></tr>";
			$tosi_seisei_l{"tmrx$ft_id"} .= "</td></tr>";
############

	}

		
		$mapseisei = "";
		$mapseisei .= "$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/main.css\" />
<title>$GAME_TITLE$MEN_TITLE $outyou《  登録武将一覧  》</title>
</head><body>$TAG_div_s{$doc_mode}
<a id=\"t\"></a>\[$old_date\]月初めに編集$tt_date（稼動武将数$sousu1/登録武将数$sousu3）<br /><br />

";


		$bl_mapseisei = "";
		$bl_mapseisei .= "$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/main.css\" />
<title>$GAME_TITLE$MEN_TITLE $outyou《  武将一覧  》</title>
</head><body>$TAG_div_s{$doc_mode}
\[$old_date\]月初めに編集$tt_date<br /><br />
";


	$k_iro_d{"0"}=0;

		$add_seisei = "$bl_mapseisei
	<table class=\"kbgcb0\" width=\"600\"><tr class=\"kbgcb0\"><td colspan=\"2\" class=\"txtc\"><span class=\"fs4\"><span class=\"kcc$k_iro_d{$fk_id}\">無所属</span></span></td></tr><tr><td class=\"kbgcc$k_iro_d{$fk_id}\"><span class=\"kcb0\">武将数</span></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><span class=\"kcb0\"> $cbl[0] 名</span></td></tr></table><br />
<table class=\"kbgcb0\" border=\"0\">
<tr class=\"kbgcc0\"><td class=\"txth\" colspan=\"2\">武将名</td><td class=\"txth\">能力</td><td class=\"txth\">功績</td><td class=\"txth\">備考</td><td class=\"txth\">軍備</td></tr>
$blist[0] 
</tr>
</table><br /><br /><br /><br /><br />
</div></body></html>";
	open(OUT,">./w_db/kuni/0.html");
	print OUT $add_seisei;
	close(OUT);

	foreach(@k_no_all_l){
		$fk_id=int($_);


	$wkousen[$k_kunino{$fk_id}] = $k_kousen_aite_name{$k_kunino{$fk_id}};
	$l_rank[$k_kunino{$fk_id}] = "
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td class=\"txth\" colspan=\"2\">武将名</td><td class=\"txth\">能力</td><td class=\"txth\">功績</td><td class=\"txth\">備考</td><td class=\"txth\">軍備</td></tr>";
&KANBU_NAME;

				$rm = $ims{$ldate};

		if($k_kunino{$fk_id}){
		$add_seisei = "$bl_mapseisei";
		&ADD_BL_SEISEI;
		$add_seisei .= $add_bl_seisei;
		$add_seisei .= "
<table class=\"kbgcb$k_iro_d{$fk_id}\" width=\"600\">
<tr class=\"kbgcb$k_iro_d{$fk_id}\"><td class=\"txth\" width=\"96\"></td><td class=\"txth\" width=\"120\"></td><td class=\"txth\" width=\"70\"></td><td class=\"txth\" width=\"100\"></td><td class=\"txth\" width=\"100\"></td><td class=\"txth\" width=\"100\"></td></tr>
$l_rank[$k_kunino{$fk_id}] $blist[$k_kunino{$fk_id}] 
</tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td class=\"kbgcc$k_iro_d{$fk_id}\" class=\"txtc\" colspan=\"6\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$lista[$k_kunino{$fk_id}]</span>
</td></tr>
</table>
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
";
		}else{
		$add_seisei = "$bl_mapseisei
	<table class=\"kbgcb0\" width=\"60%\"><tr><td colspan=\"2\" class=\"kbgcb0\"><span class=\"txtc\"><a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_id{$fk_id}\" target=\"_blank\"><span class=\"kcc0\"><span class=\"fs4\">$k_name_d{$fk_id}</a>系列の無所属</span></span></span></td></tr><tr><td class=\"kbgcc0\"><span class=\"kcb0\">武将数</span></td><td class=\"kbgcc0\"><span class=\"kcb0\"> $c2[$fk_id] 名</span></td></tr></table><br />
<table class=\"kbgcb0\" border=\"0\">
$blist[$k_id{$fk_id}] 
</tr>
</table><br /><br /><br /><br /><br />
</div></body></html>";
		}
	$add_seisei =~  s/\"\.\/\?/\"\.\.\/\.\.\/\?/g;
	open(OUT,">./w_db/kuni/$fk_id.html");
	print OUT $add_seisei;
	close(OUT);
	}

	foreach(@k_seizon_l){
		$fk_id=$_;
	$l_rank[$k_kunino{$fk_id}] = "<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td class=\"txth\" colspan=\"2\">家老筆頭</td><td class=\"txth\">能力</td><td class=\"txth\">功績</td><td class=\"txth\">備考</td><td class=\"txth\">軍備</td></tr>";

	$wkousen[$k_kunino{$fk_id}] = $k_kousen_aite_name{$k_kunino{$fk_id}};
&KANBU_NAME;

		&ADD_BL_SEISEI;
		$mapseisei .= $add_bl_seisei;

		$mapseisei .= "<table class=\"kbgcb$k_iro_d{$fk_id}\" width=\"600\">
<tr class=\"kbgcb$k_iro_d{$fk_id}\"><td class=\"txth\" width=\"96\"></td><td class=\"txth\" width=\"120\"></td><td class=\"txth\" width=\"70\"></td><td class=\"txth\" width=\"100\"></td><td class=\"txth\" width=\"100\"></td><td class=\"txth\" width=\"100\"></td></tr>
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


		$mapseisei .= "<a id=\"m\"></a>
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
<form action=\"$COMMAND\" method=\"post\" target=\"_top\"><div>
<input type=\"submit\" value=\"ログイン画面へ\" /></div></form>

</div></body></html>";

	open(OUT,">./b_itiran.html");
	print OUT $mapseisei;
	close(OUT);

$mapseisei =~ s/ target=\"_blank\"//g;
	open(OUT,">./itiran.html");
	print OUT $mapseisei;
	close(OUT);

	open(OUT,">./kadou.txt");
	print OUT $sousu1;
	close(OUT);

	open(OUT,">./sannka.txt");
	print OUT $sousu3;
	close(OUT);


###########TOSI_S

$mwyear = int($keika_nen/10 +1)*10;
$mvyear = $KAISI_NEN+$mwyear;
	$new_datev = sprintf("%02d", $mvyear, $tuki_genzai);

		if($keika_nen % 10 < 3){
$mtno = 2;
$mwyear2 = $mvyear - 7;
$mwyear2 = "$mwyear2年1月";
		}elsif($keika_nen % 10 < 6){
$mtno = 3;
$mwyear2 = $mvyear - 4;
$mwyear2 = "$mwyear2年1月";
		}else{
$mwyear2 = $mwyear;
$mtno = 3;
$mthit = 1;
$mwyear2 = "次期評定待ち";
		}
$new_datev = "$new_datev年1月";

		$thit = 0;
	while ($thit<$tosi_kazu) {

		$ft_id = $thit;
$listtzno[$ft_id] = int($listtzno[$ft_id]);
$listtzdno[$ft_id] = int($listtzdno[$ft_id]);
$listtzzno[$ft_id] = int($listtzzno[$ft_id]);
$listtzxno[$ft_id] = int($listtzxno[$ft_id]);

		$fk_id = $t_kunino{$ft_id};
$add_name = $k_name{$t_zokuno{$ft_id}};
$k_name{$t_zokuno{$ft_id}} = "賊勢力";
$hantei = "tmrk$ft_id";
	&TOSI_S_W;
		$fk_id = $t_zokuno{$ft_id};
$hantei = "tmrz$ft_id";
	&TOSI_S_W;
		$fk_id = 0;
$hantei = "tmrx$ft_id";
	&TOSI_S_W;
$k_name{$t_zokuno{$ft_id}} = $add_name;

$thit ++;
	}
#######

#   RANK1    #

}



sub RANKD {
#   RANKD    #
#   RANKK    #
#?	@list=();
#&SYUUHUKU1;
							unlink("./w_db/busyoulb.cgi");
rename ("./w_db/busyoul.cgi", "./w_db/busyoulb.cgi");
											open(OUT,">./w_db/busyoul.cgi");
											print OUT @CL_DATA;
											close(OUT);


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


	$zc=0;
	while ($zc<$tosi_kazu) {

			$listtzno[$zc] = int($listtzno[$zc]);
			$listdfno[$zc] = int($listdfno[$zc]);
			$listdfzno[$zc] = int($listdfzno[$zc]);
$t_kuni_taizai_b{$zc} = $listtzno[$zc];
$t_siro_syubi_suu{$zc} = $listdfno[$zc];
$t_toride_syubi_suu{$zc} = $listdfzno[$zc];

			$dt_id = $zc;
			$dfihn = "dfi$zc";
			$dfihnno = "dfino$zc";
   		$stv[$zc] = '$ft_id = \'' . $zc . '\';' . '$t_name{$ft_id} = \'' . $t_name{$dt_id} . '\';' . '$t_kunino{$ft_id} = \'' . $t_kunino{$dt_id} . '\';' . 
'$t_ryoumin_suu{$ft_id} = \'' . $t_ryoumin_suu{$dt_id} . '\';' . '$t_nougyou_ti{$ft_id} = \'' . $t_nougyou_ti{$dt_id} . '\';' . '$t_syougyou_ti{$ft_id} = \'' . $t_syougyou_ti{$dt_id} . '\';' . 
'$t_siro_bouei_ti{$ft_id} = \'' . $t_siro_bouei_ti{$dt_id} . '\';' . '$t_nougyou_max{$ft_id} = \'' . $t_nougyou_max{$dt_id} . '\';' . '$t_syougyou_max{$ft_id} = \'' . $t_syougyou_max{$dt_id} . '\';' . 
'$t_siro_bouei_max{$ft_id} = \'' . $t_siro_bouei_max{$dt_id} . '\';' . '$t_tian_ti{$ft_id} = \'' . $t_tian_ti{$dt_id} . '\';' . '$t_x_zahyou{$ft_id} = \'' . $t_x_zahyou{$dt_id} . '\';' . 
'$t_y_zahyou{$ft_id} = \'' . $t_y_zahyou{$dt_id} . '\';' . '$zsouba = \'' . "$t_kome_souba{$dt_id}" . '\';' . '$t_kome_souba{$ft_id} = \'' . $t_kome_souba{$dt_id} . '\';' . '$t_siro_taikyuu_ti{$ft_id} = \'' . $t_siro_taikyuu_ti{$dt_id} . '\';' . 
'$t_gijyutu_ti{$ft_id} = \'' . $t_gijyutu_ti{$dt_id} . '\';' . '$zsub2 = \'' . $z2sub2 . '\';' . 
'$t_setuzoku_saki{$ft_id}[0] = \'' . $t_setuzoku_saki{$dt_id}[0] . '\';' . '$t_setuzoku_saki{$ft_id}[1] = \'' . $t_setuzoku_saki{$dt_id}[1] . '\';' . '$t_setuzoku_saki{$ft_id}[2] = \'' . $t_setuzoku_saki{$dt_id}[2] . '\';' . 
'$t_setuzoku_saki{$ft_id}[3] = \'' . $t_setuzoku_saki{$dt_id}[3] . '\';' . '$t_setuzoku_saki{$ft_id}[4] = \'' . $t_setuzoku_saki{$dt_id}[4] . '\';' . '$t_setuzoku_saki{$ft_id}[5] = \'' . $t_setuzoku_saki{$dt_id}[5] . '\';' . 
'$t_setuzoku_saki{$ft_id}[6] = \'' . $t_setuzoku_saki{$dt_id}[6] . '\';' . '$t_setuzoku_saki{$ft_id}[7] = \'' . $t_setuzoku_saki{$dt_id}[7] . '\';' . '$t_setuzoku_saki{$ft_id}[8] = \'' . $t_setuzoku_saki{$dt_id}[8] . '\';' . 
'$t_setuzoku_saki{$ft_id}[9] = \'' . $t_setuzoku_saki{$dt_id}[9] . '\';' . 
'$listdf = \'' . "$listdf[$zc]（$listdfno[$zc]名）" . '\';' . '$listdfz = \'' . "$listdfz[$zc]（$listdfzno[$zc]名）" . '\';' . 
'$listdfno = \'' . $listdfno[$zc] . '\';' . '$listdfzno = \'' . $listdfzno[$zc] . '\';' . 
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

											open(OUT,">./w_db/guest/stv$zc.pl");
											print OUT $stv[$zc];
											close(OUT);
		$zc++;
	}


	foreach(@k_no_all_l){
		$fk_id=$_;
			$pl_end_l[$k_kunino{$fk_id}] ++;

		if($k_kunino{$fk_id}){
												@stv=();

$t_list = "\$t_list = \'";
	$zc=0;
	while ($zc<$tosi_kazu) {
							$dt_id = $zc;

		if($t_kunino{$dt_id} eq $k_kunino{$fk_id}){


		$t_list .= "<tr class=\"bgcCCCCCC\"><td class=\"txth\" rowspan=\"3\" width=\"6%\">$t_name{$dt_id}</td><td width=\"8%\">領民</td><td class=\"txtr\" width=\"7%\">$t_ryoumin_suu{$dt_id}</td><td width=\"4%\">農業</td><td class=\"txtr\" width=\"9%\">$t_nougyou_ti{$dt_id}/$t_nougyou_max{$dt_id}</td><td width=\"4%\">商業</td><td class=\"txtr\" width=\"9%\">$t_syougyou_ti{$dt_id}/$t_syougyou_max{$dt_id}</td><td width=\"6%\">防衛力</td><td class=\"txtr\" width=\"9%\">$t_siro_bouei_ti{$dt_id}/$t_siro_bouei_max{$dt_id}</td><td width=\"6%\">壁耐久</td><td class=\"txtr\" width=\"6%\">$t_siro_taikyuu_ti{$dt_id}/$t_siro_taikyuu_max{$dt_id}</td><td width=\"4%\">技術</td><td class=\"txtr\" width=\"6%\">$t_gijyutu_ti{$dt_id}/$t_gijyutu_max{$dt_id}</td><td width=\"4%\">治安</td><td class=\"txtr\" width=\"3%\">$t_tian_ti{$dt_id}</td><td width=\"4%\">相場</td><td class=\"txtr\" width=\"6%\">$t_kome_souba{$dt_id}</td></tr><tr><td>滞在武将</td><td colspan=\"15\">$listtz[$zc]（$listtzno[$zc]名）</td></tr><tr><td>城の守備</td><td colspan=\"15\">$listdf[$zc]（$listdfno[$zc]名）</td></tr>";
		}

		$zc++;
	}

	$t_list .= "\';
1;";
											open(OUT,">./w_db/kuni/db$k_kunino{$fk_id}\.pl");
											print OUT $t_list;
											close(OUT);
		}
	}

#   RANKK    #


	open(IN,"./w_db/map_log.cgi");
	@S_MOVE = <IN>;
	close(IN);

$RSS_LOG = '';
$RSS_LOG2 = '';
#############
			$S_MES = "\$S_MES = \'";
	$p=0;
	while($p<5){
($rss_log_db,$rss_tt_tt,$rss_tt_db,$rss_title_db,$rss_link_db,$subject_rss_db,$creator_rss_db) = split(/<>/,$S_MOVE[$p]);

$S_MES .= "<span class=\"c228B22\">●</span>$rss_log_db<br />";$p++;
	}
	$S_MES .= "\';
1;";
											open(OUT,">./w_db/map5.pl");
											print OUT $S_MES;
											close(OUT);

#############
	$p=0;
	while($p<20){
($rss_log_db,$rss_tt_tt,$rss_tt_db,$rss_title_db,$rss_link_db,$subject_rss_db,$creator_rss_db) = split(/<>/,$S_MOVE[$p]);

$RSS_LOG .= <<"PRI";
<item rdf:about="$rss_link_db?$p">
  <title><![CDATA[ $saba_name\ $rss_title_db]]></title>
  <link>$rss_link_db</link>
  <dc:date>$rss_tt_db</dc:date>
  <dc:language>ja</dc:language>
  <sy:updatePeriod>hourly</sy:updatePeriod>
</item>
PRI
$RSS_LOG2 .= <<"PRI";
    <rdf:li rdf:resource="$rss_link_db?$p"/>
PRI
$p++;
	}

			$S_MES = "\$S_MES = \'";
#############
	$p=0;
	while($p<200){
############
($rss_log_db,$rss_tt_tt,$rss_tt_db,$rss_title_db,$rss_link_db,$subject_rss_db,$creator_rss_db) = split(/<>/,$S_MOVE[$p]);

#############
		$S_MES .= "・$rss_log_db<br />";
		$p++;
									if($p % 10 == 0){
		$S_MES .= "<br />";
									}
	}
	$S_MES .= "\';
1;";
											open(OUT,">./w_db/mapall.pl");
											print OUT $S_MES;
											close(OUT);

	$RSS_LOG .= "

</rdf:RDF>";
$RSS_LOG =~ s/&nbsp;//g;
$RSS_LOG =~ s/&/&amp;/g;
$RSS_LOG0 = <<"PRI";
<?xml version="1.0" encoding="UTF-8" ?>
<rdf:RDF 
  xmlns="http://purl.org/rss/1.0/"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" 
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:sy="http://purl.org/rss/1.0/modules/syndication/"
  xml:lang="ja">

<channel rdf:about="$URI/rss/map_all.rdf">
  <title><![CDATA[ $MEN_TITLE/全体ログ]]></title>
  <link>$URI/?.m.=map2</link>
  <description><![CDATA[ $GAME_TITLE・$MEN_TITLE/全体ログ新着情報をGET]]></description>
  <dc:publisher>MMO Communications</dc:publisher>
  <dc:rights>Copyright:(C) 2005 MMO Communications. All Rights Reserved.</dc:rights>
  <dc:date>$tt_rss</dc:date>
    <items>
    <rdf:Seq>
$RSS_LOG2
    </rdf:Seq>
  </items>
</channel>
PRI
											open(OUT,">./rss/map_all.rdf");
											print OUT "$RSS_LOG0$RSS_LOG";
											close(OUT);

#   RANKD    #

}

sub MAPSR
{
	$map2year = $KAISI_NEN+$keika_nen;
	$yy2maprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $map2year);
		$map2year_URL="<a href=\"../$yy2maprid\">$map2year年</a>";
	$rekimaprid = sprintf("%05d\.html", $tenkakaisuu);
		$outyou_URL="<a href=\"../$rekimaprid\">$outyou</a>";
	$rrekimaprid = sprintf("%05d", $tenkakaisuu);


@CL_DATAMR = ();
	foreach(@k_seizon_l){
		$fk_id=$_;
#$k_busyou_suu{$k_kunino{$fk_id}}
			push(@CL_DATAMR,"$k_kunino{$fk_id}<>$k_name{$fk_id}<>$k_iro_d{$fk_id}<>$town_get[$k_kunino{$fk_id}]<>$k_busyou_suu{$fk_id}<>$k_kokui{$fk_id}<>$k_outo{$fk_id}<>\n");
	}

	@tmp = map {(split /<>/)[4]} @CL_DATAMR;
	@CL_DATAMR = @CL_DATAMR[sort {$tmp[$b] <=> $tmp[$a]} 0 .. $#tmp];

	@tmp = map {(split /<>/)[3]} @CL_DATAMR;
	@CL_DATAMR = @CL_DATAMR[sort {$tmp[$b] <=> $tmp[$a]} 0 .. $#tmp];

		$k_name_d[0] = "";

$ELE_C[6] = "#F8F0E0";
		$mapseisei_1 = "";
		$mapseisei_1 .= "$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/rekisi.css\" />
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/map.css\" />
<title>$GAME_TITLE$MEN_TITLE $outyou $yold_date</title>
</head><body>$TAG_div_s{$doc_mode}
<a id=\"t\"></a><strong>$outyou_URL $map2year_URL・<a href=\"$URI/?.m.=map3\">勢力図</a></strong><div class=\"txtc\"><a href=\"#k\">↓</a></div><strong>$p2old_date_URL - \[$yold_date\] - ";

		$mapseisei_2 = "";
		$mapseisei_2 .= "</strong>
<table class=\"bgc60AF60\" width=\"955\" border=\"0\" cellspacing=\"0\">
<tr>
<td width=\"15\" class=\"bgcF8F0E8\">-</td>";

    for($i=0;$i<10;$i++){
		$mapseisei_2 .= "<td width=\"90\" class=\"bgcF8F0E0\">$i</td>";
	}
	$mapseisei_2 .= "</tr>";
     for($i=0;$i<13;$i++){
		$mapseisei_2 .= "<tr><td class=\"bgcFFF8F0\">$i</td>";
		for($j=0;$j<10;$j++){
				$col="";
				if(-e "./$mpg_r/sub_db/twid/$j\_$i.pl"){
	open(IN,"./$mpg_r/sub_db/twid/$j\_$i.pl");
	$zc = <IN>;
	close(IN);
							$dt_id = $zc;
						$col = "kbgcm$k_iro_d[$t_kunino{$dt_id}]";
						$cou_n = $k_name_d[$t_kunino[$dt_id]];
						$cou_n3 = " 領/$town_get[$t_kunino{$dt_id}]<br /> 将/$k_busyou_suu{$t_kunino{$dt_id}}";
				if(!$k_kunino[$t_kunino{$dt_id}]){$col = "bgcFFFFFF";
						$cou_n = "？";
						$cou_n3 = " 空白地";
				}

#	&IMG_B_CG_SAKUSEI("$IMG{0}/m_$t_cgno_d{$dt_id}$p_img_kakutyou{0}","32","32","$p_img_mime{0}","t$dt_id","m_$t_cgno_d{$dt_id}","","$col","","","","","");
$mapseisei_2 .= "<td class=\"$col\"><div class=\"txtc\"><span class=\"fs8\">$cou_n</span><table><tr><td rowspan=\"2\" class=\"m_$t_cgno_d{$dt_id}\"> </td><td class=\"txtc\" title=\"$t_name{$dt_id}の賊砦【$k_name[$t_zokuno{$dt_id}]】\">$t_name{$dt_id}</td></tr><tr><td class=\"fs7\">$cou_n3</td></tr></table></div></td>";

				}elsif($i eq "1" and $j eq "8"){
					$mapseisei_2 .= "<td class=\"txth\">
<span class=\"c60AF60\">＿＿＿</span>│<span class=\"c60AF60\">＿＿＿</span><br />
<span class=\"c60AF60\">＿＿＿</span>│<span class=\"c60AF60\">＿＿＿</span><br />
<span class=\"c60AF60\">＿＿＿</span>│<span class=\"c60AF60\">＿＿＿</span><br />
<span class=\"c60AF60\">＿＿＿_</span>＼<span class=\"c60AF60\">_＿＿</span><br /></td>";
				}elsif($i eq "2" and $j eq "8"){
					$mapseisei_2 .= "<td class=\"txth\">
<span class=\"c60AF60\">＿＿＿＿＿</span>＼<span class=\"c60AF60\">＿</span><br />
<span class=\"c60AF60\">＿＿＿＿＿＿</span>＼<br />
<span class=\"c60AF60\">＿＿＿＿＿＿＿</span><br />
<span class=\"c60AF60\">＿＿＿＿＿＿＿</span><br /></td>";
				}elsif($i eq "2" and $j eq "9"){
					$mapseisei_2 .= "<td class=\"txth\">
<span class=\"c60AF60\">＿</span>／<span class=\"c60AF60\">＿＿</span>＼<span class=\"c60AF60\">＿＿</span><br />
／<span class=\"c60AF60\">＿＿＿＿</span>＼<span class=\"c60AF60\">＿</span><br />
＼<span class=\"c60AF60\">＿＿＿＿</span>倭へ<br />
<span class=\"c60AF60\">＿</span>＼<span class=\"c60AF60\">＿＿＿＿＿</span><br /></td>";
				}elsif($i eq "8" and $j eq "9"){
					$mapseisei_2 .= "<td class=\"txth\">
<span class=\"c60AF60\">＿＿＿＿＿＿＿</span><br />
<span class=\"c60AF60\">＿＿＿＿</span>漢陽へ<br />
<span class=\"c60AF60\">＿＿＿＿</span>│<span class=\"c60AF60\">＿＿</span><br />
<span class=\"c60AF60\">＿＿＿＿</span>│<span class=\"c60AF60\">＿＿</span><br /></td>";
				}elsif($i eq "10" and $j eq "7"){
					$mapseisei_2 .= "<td class=\"txth\">
<span class=\"c60AF60\">＿＿＿</span>│<span class=\"c60AF60\">＿＿＿</span><br />
<span class=\"c60AF60\">＿＿＿</span>│<span class=\"c60AF60\">＿＿＿</span><br />
＿＿＿│＿＿<span class=\"c60AF60\">＿</span><br />
<span class=\"c60AF60\">＿＿＿＿＿＿</span>＼<br /></td>";
				}elsif($i eq "12" and $j eq "3"){
					$mapseisei_2 .= "<td class=\"txth\">
<span class=\"c60AF60\">＿＿＿＿＿＿＿</span><br />
＿＿＿＿＿＿＿<br />
<span class=\"c60AF60\">＿＿＿＿＿＿＿</span><br />
<span class=\"c60AF60\">＿＿＿＿＿＿＿</span><br /></td>";
				}elsif($i eq "11" and $j eq "5"){
					$mapseisei_2 .= "<td class=\"txth\">
<span class=\"c60AF60\">＿＿＿＿＿＿＿</span><br />
<span class=\"c60AF60\">＿＿＿＿＿＿＿</span><br />
＿＿＿＿＿＿＿<br />
<span class=\"c60AF60\">＿＿＿</span>│<span class=\"c60AF60\">＿＿＿</span><br /></td>";
				}elsif($i eq "12" and $j eq "5"){
					$mapseisei_2 .= "<td class=\"txth\">
<span class=\"c60AF60\">＿＿＿</span>│<span class=\"c60AF60\">＿＿＿</span><br />
＿＿＿│<span class=\"c60AF60\">＿＿＿</span><br />
<span class=\"c60AF60\">＿＿＿＿＿＿＿</span><br />
<span class=\"c60AF60\">＿＿＿＿＿＿＿</span><br /></td>";
				}elsif($i eq "11" and $j eq "6"){
					$mapseisei_2 .= "<td class=\"txth\">
<span class=\"c60AF60\">＿＿＿</span>│<span class=\"c60AF60\">＿＿＿</span><br />
<span class=\"c60AF60\">＿＿＿</span>│<span class=\"c60AF60\">＿＿＿</span><br />
＿＿＿│<span class=\"c60AF60\">＿＿＿</span><br />
<span class=\"c60AF60\">＿＿＿＿＿＿＿</span><br /></td>";
				}elsif($i eq "9" and $j eq "8"){
					$mapseisei_2 .= "<td class=\"txth\">
<span class=\"c60AF60\">＿</span>／<span class=\"c60AF60\">＿＿＿＿＿</span><br />
／<span class=\"c60AF60\">＿＿＿＿＿＿</span><br />
<span class=\"c60AF60\">＿＿＿＿＿＿＿</span><br />
<span class=\"c60AF60\">＿＿＿＿＿＿＿</span><br /></td>";
				}elsif($i eq "8" and $j eq "8"){
					$mapseisei_2 .= "<td class=\"txth\">
<span class=\"c60AF60\">＿＿＿</span>│<span class=\"c60AF60\">＿＿＿</span><br />
<span class=\"c60AF60\">＿＿＿</span>│<span class=\"c60AF60\">＿＿＿</span><br />
<span class=\"c60AF60\">＿＿＿</span>│<span class=\"c60AF60\">＿＿＿</span><br />
<span class=\"c60AF60\">＿＿_</span>／<span class=\"c60AF60\">_＿＿＿</span><br /></td>";
				}else{
					$mapseisei_2 .= "<td class=\"txth\"><span class=\"c60AF60\"><br />＿＿＿＿＿＿＿<br /></span></td>";
				}
		}
		$mapseisei_2 .= "</tr>";
	}

   		$mapseisei_2 .= "
</table><a id=\"k\"></a><br /><div class=\"txtc\"><a href=\"#t\">↑</a></div><br />
<table border=\"1\" width=\"955\">
<tr class=\"bgcF8F0E8\"><td class=\"txth\" width=\"120\">国名</td><td class=\"txth\" width=\"85\">領土</td><td class=\"txth\" width=\"30\">武将</td><td class=\"txth\" width=\"120\">天子</td><td class=\"txth\" width=\"60\">主民族</td><td class=\"txth\" width=\"30\">国威</td><td class=\"txth\" width=\"60\">国策</td><td class=\"txth\" width=\"60\">国教</td><td class=\"txth\" width=\"75\">国庫</td><td class=\"txth\" width=\"290\">交戦相手国</td></tr>
";

		$mapseisei2 = "";
		$i = 0;
				foreach(@CL_DATAMR){
					($wmrid,$wmrname,$wmrele,$wmrtg,$wmrbs,$wmrki,$wmouto)=split(/<>/);
	if($wmrid){
		if(!$wmrtg){
   		$wmrtg = "$t_name[$wmouto]の賊砦";
		}else{
   		$wmrtg = "$wmrtg/$t_name[$wmouto]";
		}
		$mapseisei_2 .= "<tr class=\"kbgcc$wmrele\"><td class=\"txth\"><a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$wmrid\" target=\"_blank\"><span class=\"c000000\">$wmrname</span></a></td><td class=\"txth\">$wmrtg</td><td class=\"txth\">$wmrbs</td><td class=\"txth\">$k_tensi_name{$wmrid}</td><td class=\"txth\">$MINZOKUSAN[$k_syuminzoku{$wmrid}]</td><td class=\"txth\">$wmrki</td><td class=\"txth\">$KOKUSAKU[$k_kokusaku{$wmrid}]</td><td class=\"txth\">$KOKKYOU[$k_kokkyou{$wmrid}]</td><td class=\"txth\">$k_kokko_sougaku{$wmrid}</td><td class=\"txth\">$k_kousen_aite_name{$wmrid}</td></tr>";
		if($i < 3){
		$mapseisei2 .= "<tr class=\"kbgcc$wmrele\"><td class=\"txtc\"><a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$wmrid\" target=\"_blank\"><span class=\"c000000\">$wmrname</span></a></td><td class=\"txtc\">$wmrtg</td><td class=\"txtc\">$wmrbs</td><td class=\"txtc\">$MINZOKUSAN[$k_syuminzoku{$wmrid}]</td><td class=\"txtc\">$wmrki</td><td class=\"txtc\">$KOKUSAKU[$k_kokusaku{$wmrid}]</td><td class=\"txtc\">$KOKKYOU[$k_kokkyou{$wmrid}]</td></tr>";
		}
		$i ++;
	}
				}

   		$mapseisei_2 .= "</table>";
   		$mapseisei_2 .= "<br /><br />$tt_date（稼動武将数$sousu1/登録武将数$sousu3）<br /><hr /><a href=\"../../\" target=\"_top\">ログイン画面に戻る</a><br /></div></body></html>";

		if(!-e "./mapr/tuki/map3.html"){
unlink ("./mapr/tuki/$pmaprid");
rename ("./mapr/tuki/map2.html", "./mapr/tuki/$pmaprid");
		}else{
unlink ("./mapr/tuki/$pmaprid");
rename ("./mapr/tuki/map3.html", "./mapr/tuki/$pmaprid");
		}
	open(OUT,">$mapseisei_in_URL");
	print OUT "$mapseisei_1$mapseisei_2";
	close(OUT);
	$ymaprid = sprintf("%05d\-%04d\-%02d\.html", $tenkakaisuu, $KAISI_NEN+$keika_nen, $tuki_genzai);
	open(OUT,">./mapr/tuki/$ymaprid");
	print OUT "$mapseisei_1$mapseisei_2";
	close(OUT);

	open(OUT,">./mapr/tuki/map3.html");
	print OUT "$mapseisei_1$fold_dat_URL$mapseisei_2";
	close(OUT);
################

   		$mapseisei = "<table border=\"1\" width=\"445\"><tr class=\"bgcF8F0E8\"><td class=\"txtc\" width=\"120\">国名</td><td class=\"txtc\" width=\"85\">領土</td><td class=\"txtc\" width=\"30\">武将</td><td class=\"txtc\" width=\"60\">主民族</td><td class=\"txtc\" width=\"30\">国威</td><td class=\"txtc\" width=\"60\">国策</td><td class=\"txtc\" width=\"60\">国教</td></tr>";
   		$mapseisei .= "$mapseisei2</table>";

	open(OUT,">./seiryoku3.txt");
	print OUT $mapseisei;
	close(OUT);

###############
	open(IN,"./w_db/map_log2r.cgi");
	@S_MOVE = <IN>;
	close(IN);

		$MAPR_MES = "";
	$p=0;
		foreach(@S_MOVE){
($rss_log_db,$rss_tt_tt,$rss_tt_db,$rss_title_db,$rss_link_db,$subject_rss_db,$creator_rss_db) = split(/<>/,$S_MOVE[$p]);
		$MAPR_MES .= "・$rss_log_db<br />";
		$p++;
		}
		
		if($tuki_genzai eq "1" or $tuki_genzai eq "0" or $kousinjyoutai eq "999"){



		if($keika_nen ne "0" and $tenka ne "1"){
@S_MOVE = ();
	open(OUT,">./w_db/map_log2r.cgi");
	print OUT @S_MOVE;
	close(OUT);
		}
$mapryy = $KAISI_NEN + $keika_nen - 1;
$mapryp = $KAISI_NEN + $keika_nen - 2;
$mapryf = $KAISI_NEN + $keika_nen;
		$comeseisei = "<tr><td class=\"txth\" colspan=\"3\"><a href=\"./tuki/$ryymaprid-r2.html\"> - 名将一覧 - </a></td></tr>";
		if($keika_nen < 1){
		$comeseisei = "";
$mapryy = $KAISI_NEN + $keika_nen;
$mapryp = $KAISI_NEN + $keika_nen;
$mapryf = $KAISI_NEN + $keika_nen + 1;
		}
		if($keika_nen eq "1"){
$ypmaprid = $yymaprid;
$mapryp = $KAISI_NEN + $keika_nen - 1;
		}
		
   		$mapseisei_p_w = "./mapr/$yymaprid";
   		$mapseisei_y_w = "$ryymaprid";
		if($kousinjyoutai ne "999"){
		$mapseisei = "";
		$mapseisei .= "$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/main.css\" />
<title>$GAME_TITLE$MEN_TITLE $outyou $mapryy年</title>
</head><body>$TAG_div_s{$doc_mode}
<span class=\"cAA8866\"><strong>\[<a href=\"./$ypmaprid\">$mapryp年</a>\]← - <a href=\"./$rekimaprid\">$outyou</a> $mapryy年の出来事 - →\[<a href=\"./$yfmaprid\">$mapryf年</a>\]</strong></span><br />

<table border=\"1\" width=\"600\"><tr><td class=\"txth\" colspan=\"3\"> - 勢力図 - </td></tr>
<tr><td class=\"txth\"><a href=\"./tuki/$ryymaprid-01.html\"> - $mapryy年01月 - </a></td><td class=\"txth\"><a href=\"./tuki/$ryymaprid-02.html\"> - $mapryy年02月 - </a></td><td class=\"txth\"><a href=\"./tuki/$ryymaprid-03.html\"> - $mapryy年03月 - </a></td></tr>
<tr><td class=\"txth\"><a href=\"./tuki/$ryymaprid-04.html\"> - $mapryy年04月 - </a></td><td class=\"txth\"><a href=\"./tuki/$ryymaprid-05.html\"> - $mapryy年05月 - </a></td><td class=\"txth\"><a href=\"./tuki/$ryymaprid-06.html\"> - $mapryy年06月 - </a></td></tr>
<tr><td class=\"txth\"><a href=\"./tuki/$ryymaprid-07.html\"> - $mapryy年07月 - </a></td><td class=\"txth\"><a href=\"./tuki/$ryymaprid-08.html\"> - $mapryy年08月 - </a></td><td class=\"txth\"><a href=\"./tuki/$ryymaprid-09.html\"> - $mapryy年09月 - </a></td></tr>
<tr><td class=\"txth\"><a href=\"./tuki/$ryymaprid-10.html\"> - $mapryy年10月 - </a></td><td class=\"txth\"><a href=\"./tuki/$ryymaprid-11.html\"> - $mapryy年11月 - </a></td><td class=\"txth\"><a href=\"./tuki/$ryymaprid-12.html\"> - $mapryy年12月 - </a></td></tr>$comeseisei
";

   		$mapseisei .= "</table>";
   		$mapseisei .= "
<br />

<table cellspacing=\"1\" width=\"80%\">
<tr><td class=\"bgcF8F0E0\">$mapryy年の史記</td></tr>
<tr><td class=\"bgcF8F0E0\">$MAPR_MES</td></tr>
</table>
";
   		$mapseisei .= "<br /><hr /><a href=\"../\" target=\"_top\">ログイン画面に戻る</a><br /></div></body></html>";
	open(OUT,">./mapr/$yymaprid");
	print OUT $mapseisei;
	close(OUT);
   		$mapseisei_p_w = "./mapr/$yfmaprid";
   		$mapseisei_y_w = "$ryfmaprid";
		}

	$p=0;
		@TUKI_URL_W =();
	while($p<=$tuki_genzai){
	$tuki_02d = sprintf("%02d", $p);
		$TUKI_URL_W[$p] = "<a href=\"./tuki/$mapseisei_y_w-$tuki_02d\.html\"> - $mapryf年$tuki_02d\月 - </a>";
		$p++;
	}

		$mapseisei = "";
		$mapseisei .= "$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/main.css\" />
<title>$GAME_TITLE$MEN_TITLE $outyou $mapryf年</title>
</head><body>$TAG_div_s{$doc_mode}
<span class=\"cAA8866\"><strong>\[<a href=\"./$yymaprid\">$mapryy年</a>\]← - <a href=\"./$rekimaprid\">$outyou</a> $mapryf年の出来事 - </strong></span><br />

<table border=\"1\" width=\"600\"><tr><td class=\"txth\" colspan=\"3\"> - 勢力図 - </td></tr>
<tr><td class=\"txth\">$TUKI_URL_W[1]</td><td class=\"txth\">$TUKI_URL_W[2]</td><td class=\"txth\">$TUKI_URL_W[3]</td></tr>
<tr><td class=\"txth\">$TUKI_URL_W[4]</td><td class=\"txth\">$TUKI_URL_W[5]</td><td class=\"txth\">$TUKI_URL_W[6]</td></tr>
<tr><td class=\"txth\">$TUKI_URL_W[7]</td><td class=\"txth\">$TUKI_URL_W[8]</td><td class=\"txth\">$TUKI_URL_W[9]</td></tr>
<tr><td class=\"txth\">$TUKI_URL_W[10]</td><td class=\"txth\">$TUKI_URL_W[11]</td><td class=\"txth\">$TUKI_URL_W[12]</td></tr>
";

   		$mapseisei .= "</table>";
   		$mapseisei_end_t = "";
		if($kousinjyoutai eq "999"){
		$mapseisei = "";
		$mapseisei .= "$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/main.css\" />
<title>$GAME_TITLE$MEN_TITLE $outyou $mapryf年</title>
</head><body>$TAG_div_s{$doc_mode}
<span class=\"cAA8866\"><strong>\[<a href=\"./$ypmaprid\">$mapryy年</a>\]← - <a href=\"./$rekimaprid\">$outyou</a> $mapryf年の出来事 - </strong></span><br />

<table border=\"1\" width=\"600\"><tr><td class=\"txth\" colspan=\"3\"> - 勢力図 - </td></tr>
<tr><td class=\"txth\">$TUKI_URL_W[1]</td><td class=\"txth\">$TUKI_URL_W[2]</td><td class=\"txth\">$TUKI_URL_W[3]</td></tr>
<tr><td class=\"txth\">$TUKI_URL_W[4]</td><td class=\"txth\">$TUKI_URL_W[5]</td><td class=\"txth\">$TUKI_URL_W[6]</td></tr>
<tr><td class=\"txth\">$TUKI_URL_W[7]</td><td class=\"txth\">$TUKI_URL_W[8]</td><td class=\"txth\">$TUKI_URL_W[9]</td></tr>
<tr><td class=\"txth\">$TUKI_URL_W[10]</td><td class=\"txth\">$TUKI_URL_W[11]</td><td class=\"txth\">$TUKI_URL_W[12]</td></tr>
";

   		$mapseisei .= "</table>";
   		$mapseisei .= "
<br />

<table cellspacing=\"1\" width=\"80%\">
<tr><td class=\"bgcF8F0E0\">$mapryf年の史記</td></tr>
<tr><td class=\"bgcF8F0E0\">$MAPR_MES</td></tr>
</table>
";
   		$mapseisei_end_t = "
 - <a href=\"./$rrekimaprid-b_itiran.html\" target=\"_top\">登録武将一覧へ</a>・<a href=\"./$rrekimaprid-meisyou.html\" target=\"_top\">名将一覧へ</a> - <br /><br /><br />
";
		}
   		$mapseisei .= "<br /><hr /><a href=\"../\" target=\"_top\">ログイン画面に戻る</a><br /></div></body></html>";
	open(OUT,">$mapseisei_p_w");
	print OUT $mapseisei;
	close(OUT);

		$S_MES = "";

	$p=0;
	while($p<=$keika_nen){
$maprnen = $KAISI_NEN+$p;
	$maprnen2 = sprintf("%04d\.html", $maprnen);
		$S_MES .= " - <a href=\"./$rrekimaprid-$maprnen2\">$maprnen年</a>";
		$p++;
									if($p % 10 == 0){
		$S_MES .= " - <br /><br />";
									}
	}
$woutyou =$outyou;
$woutyou =~  s/暦//g;
		$mapseisei = "";
		$mapseisei .= "$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/main.css\" />
<title>$GAME_TITLE$MEN_TITLE $outyou</title>
</head><body>$TAG_div_s{$doc_mode}
<span class=\"cAA8866\"><strong> - <a href=\"./index.html\">$MEN_TITLE</a> $woutyou王朝 - </strong></span><br /><br /><br />
$mapseisei_end_t
$S_MES";

   		$mapseisei .= "<br /><br /><hr /><a href=\"../\" target=\"_top\">ログイン画面に戻る</a><br /></div></body></html>";
	open(OUT,">./mapr/$rekimaprid");
	print OUT $mapseisei;
	close(OUT);

		}else{
   		$mapseisei_p_w = "./mapr/$yymaprid";
   		$mapseisei_y_w = "$ryymaprid";
$mapryy = $KAISI_NEN + $keika_nen - 1;
$mapryp = $KAISI_NEN + $keika_nen - 2;
$mapryf = $KAISI_NEN + $keika_nen;
	$p=0;
		@TUKI_URL_W =();
	while($p<=$tuki_genzai){
	$tuki_02d = sprintf("%02d", $p);
		$TUKI_URL_W[$p] = "<a href=\"./tuki/$mapseisei_y_w-$tuki_02d\.html\"> - $mapryf年$tuki_02d\月 - </a>";
		$p++;
	}

		$mapseisei = "";
		$mapseisei .= "$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/main.css\" />
<title>$GAME_TITLE$MEN_TITLE $outyou $mapryf年</title>
</head><body>$TAG_div_s{$doc_mode}
<span class=\"cAA8866\"><strong>\[<a href=\"./$yymaprid\">$mapryy年</a>\]← - <a href=\"./$rekimaprid\">$outyou</a> $mapryf年の出来事 - </strong></span><br />

<table border=\"1\" width=\"600\"><tr><td class=\"txth\" colspan=\"3\"> - 勢力図 - </td></tr>
<tr><td class=\"txth\">$TUKI_URL_W[1]</td><td class=\"txth\">$TUKI_URL_W[2]</td><td class=\"txth\">$TUKI_URL_W[3]</td></tr>
<tr><td class=\"txth\">$TUKI_URL_W[4]</td><td class=\"txth\">$TUKI_URL_W[5]</td><td class=\"txth\">$TUKI_URL_W[6]</td></tr>
<tr><td class=\"txth\">$TUKI_URL_W[7]</td><td class=\"txth\">$TUKI_URL_W[8]</td><td class=\"txth\">$TUKI_URL_W[9]</td></tr>
<tr><td class=\"txth\">$TUKI_URL_W[10]</td><td class=\"txth\">$TUKI_URL_W[11]</td><td class=\"txth\">$TUKI_URL_W[12]</td></tr>
";

   		$mapseisei .= "</table>";
   		$mapseisei .= "
<br />

<table cellspacing=\"1\" width=\"80%\">
<tr><td class=\"bgcF8F0E0\">$mapryf年の史記</td></tr>
<tr><td class=\"bgcF8F0E0\">$MAPR_MES</td></tr>
</table>
";
   		$mapseisei .= "<br /><hr /><a href=\"../\" target=\"_top\">ログイン画面に戻る</a><br /></div></body></html>";
	open(OUT,">$mapseisei_p_w");
	print OUT $mapseisei;
	close(OUT);
		}

}


sub TOSI_S_W {
		$tosi_seisei{$hantei} = "$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/main.css\" />
<title>$GAME_TITLE</title>
</head><body>$TAG_div_s{$doc_mode}
生成日時$tt_date<br />";

	if($hantei ne "tmrx$ft_id"){
$sousyuu = int($k_zenki_sou_syuunyuu{$fk_id} *1.5);
$ssyuu = int($k_kin_syuunyuu_sougaku{$fk_id}+$k_kome_syuunyuu_sougaku{$fk_id});

$k_mokuhyou_tosi{$fk_id}[0]=int($k_mokuhyou_tosi{$fk_id}[0]);
$comk[1] = "$t_name[$k_mokuhyou_tosi{$fk_id}[0]]の城を陥落させ、領土を増やす。";
$comk[2] = "$t_name[$k_mokuhyou_tosi{$fk_id}[0]]の城を陥落させ、領土を増やす。
目標都市を落とし、現領土を維持した暁には、都市$t_name[$k_katujyou_tosi{$fk_id}[0]]を、盟友$k_name_d[$k_katujyou_aite{$fk_id}[0]]に差し出す。";
$comk[3] = "国の総収入を$sousyuu以上にする。（現在の総収入⇒$ssyuu）";
$comk[4] = "大国：$k_name_d[$k_kyuusai_aite{$fk_id}[0]]に付き従い、領土拡張を図る。";
$comk[11] = "大国に脅かされ窮地に陥っている盟友$k_name_d[$k_kyuusai_aite{$fk_id}[0]]を護りとおす。";
$comk[12] = "$k_name_d[$k_teisen_aite{$fk_id}[0]]に対しての交戦指定を取りやめ、目標を以下のように切り替える。<br />
$t_name[$k_mokuhyou_tosi{$fk_id}[0]]の城を陥落させ、領土を増やす。";
$comk[13] = "$k_name_d[$k_teisen_aite{$fk_id}[0]]に対しての交戦指定を取りやめ、目標を以下のように切り替える。<br />
国の総収入を$sousyuu以上にする。";
$comk[14] = "$k_name_d[$k_teisen_aite{$fk_id}[0]]に対しての交戦指定を取りやめ、目標を以下のように切り替える。<br />
大国に脅かされ窮地に陥っている盟友$k_name_d[$k_kyuusai_aite{$fk_id}[0]]を護りとおす。";
$comk[0] = "天子が即位したばかりで評定はまだ開かれていません。";

	$wkousen[$k_kunino{$fk_id}] = $k_kousen_aite_name{$k_kunino{$fk_id}};
	$wkousen[$k_kunino{$fk_id}] =~ s/\"\.\/\?/\"\.\.\/\.\.\/\?/g;

&KANBU_NAME;

		$tosi_seisei{$hantei} .= "
<table width=\"70%\" class=\"kbgcb$k_iro_d{$fk_id}\">
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>金収入</td><td class=\"txtr\">$k_kin_syuunyuu_sougaku{$fk_id}</td><td>米収入</td><td class=\"txtr\">$k_kome_syuunyuu_sougaku{$fk_id}</td><td>次期再評定</td><td class=\"txtr\">$mwyear2</td><td>次期評定</td><td class=\"txtr\">$new_datev</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>攻略目標</td><td colspan=\"7\" class=\"txtr\">$comk[$k_kouryaku_mokuhyou{$fk_id}[0]]</td></tr></table>

<br />";

		&ADD_BL_SEISEI;
		$tosi_seisei{$hantei} .= $add_bl_seisei;

	}else{
		$tosi_seisei{$hantei} .= "
<br />
《 放浪中 》
<br />";
	}

		$tosi_seisei{$hantei} .= "
<br />
都市情報<br /><strong>《 $t_name{$ft_id} 》滞在者$listtzdno[$ft_id]名<br /><br />
（$k_name{$t_kunino{$ft_id}}：$listtzno[$ft_id]名、$k_name{$t_zokuno{$ft_id}}：$listtzzno[$ft_id]名、放浪：$listtzxno[$ft_id]名）</strong>
<br />
<table class=\"bgc808000\" border=\"1\" width=\"100%\">
<tr class=\"bgc808000\"><td class=\"txth\" width=\"64\"></td><td class=\"txth\" width=\"120\"></td><td class=\"txth\" width=\"70\"></td><td class=\"txth\" width=\"100\"></td><td class=\"txth\" width=\"100\"></td><td class=\"txth\" width=\"100\"></td><td class=\"txth\"></td></tr>
<tr class=\"bgcFFF0F5\"><td class=\"txth\" colspan=\"2\">武将名（所属国）</td><td class=\"txth\">能力</td><td class=\"txth\">功績</td><td class=\"txth\">軍備</td><td class=\"txth\">備考</td><td class=\"txth\">コマンド</td></tr>
$tosi_seisei_l{$hantei}
</table>
</div></body></html>";

	$tosi_seisei{$hantei} =~ s/\"\.\/\?/\"\.\.\/\.\.\/\?/g;
	open(IN,"./w_db/mati/$hantei.cgi");
	@TMTM = <IN>;
	close(IN);
	($tmtm) = split(/<>/,$TMTM[0]);
$tmtmkako = $tmtm;
$tmtm = $tt + int(rand(1000)) * int(rand(1000));
$tmtm = "$fk_id\_$tmtm";
	open(OUT,">./w_db/mati/$hantei$tmtm.html");
	print OUT $tosi_seisei{$hantei};
	close(OUT);

	@TMTM=();
	unshift(@TMTM,"$tmtm<>\n");
	open(OUT,">./w_db/mati/$hantei.cgi");
	print OUT @TMTM;
	close(OUT);
							unlink("./w_db/mati/$hantei$tmtmkako.html");

}
####################
1;
