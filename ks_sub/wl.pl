
sub WLPL {
	&BAG_LOG("WL\n");
	if($m_tt < $tt or $kousinjyoutai eq "999"){
	&BAG_LOG("月繰越\n");
		if(!$m_tt){
		$m_tt = $tt;
		&M2AP_LOG("ゲームを開始しました。");
		}else{
		$m_tt += $kousin_kankaku;
			($qsec,$qmin,$qhour,$qday) = localtime($m_tt);
				&KTS1;
			if($kousinjyoutai < 1){
			$kousinjyoutai=1;
			}
		}

		$tukikurikosi = 1;
		$tuki_genzai++;
		if($tuki_genzai > 12){
			$keika_nen++;
			$tuki_genzai=1;
		}

		$nen_genzai=$keika_nen+$KAISI_NEN;
	$ryfmaprid = sprintf("%05d\-%04d", $tenkakaisuu, $KAISI_NEN+$pmyear+1);
	$yfmaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear+1);

	$maprid = sprintf("%05d\-%04d\-%02d\.html", $tenkakaisuu, $KAISI_NEN+$keika_nen, $tuki_genzai);

	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);
	$yold_date = $old_date;
	$old_date = "<a href=\"./mapr/$yfmaprid\">$old_date</a>";
		$fmmonth=$tuki_genzai+1;
		$fmyear=$keika_nen;
		if($fmmonth > 12){
			$fmyear++;
			$fmmonth=1;
		}
	$fmaprid = sprintf("%05d\-%04d\-%02d\.html", $tenkakaisuu, $KAISI_NEN+$fmyear, $fmmonth);
	$fold_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$fmyear, $fmmonth);

splice( @JJM, 0, 1, "$keika_nen<>$tuki_genzai<>$m_tt<>$kousinjyoutai<>$tenkakaisuu<>$outyou<>$seibento1<>$seibento2<>$syuminzoku<>$msyuto<>$kaisinen<>$zenkaisinen<>$touitunen<>$sinkouminzoku1<>$sinkouminzoku2<>$zentensimei<><><><><>\n");


	&BAG_LOG("滅亡\n");

$zokuhcome = "";

$zokuh=0;
		@zdb=();
		@zdbtype=();
		$zdbtypec[0]="武将不足";
		$zdbtypec[1]="王都不在";
		$zdbtypec[99]="臨時メンテナンス/$ARASI_SAKIJYO_K_RIYUU\/";
$i = 0;
	while ($i<$tosi_kazu) {
							$ft_id = $i;
			if($t_siro_taikyuu_ti{$ft_id} < 500){
				$t_siro_taikyuu_ti{$ft_id} += 10;
			}
			if($t_zoku_taikyuu_ti{$ft_id} < 500){
				$t_zoku_taikyuu_ti{$ft_id} += 10;
			}
			if($t_siro_bouei_ti{$ft_id} < 300){
				$t_siro_bouei_ti{$ft_id} += 5;
			}
			if($t_zoku_bouei_ti{$ft_id} < 300){
				$t_zoku_bouei_ti{$ft_id} += 5;
			}
$i ++;
	}
		$zc=0;
	foreach(@k_seizon_l){
		$fk_id=$_;
	if($fk_id eq $ARASI_SAKIJYO_K_ID and $fk_id){
		$zdb[$zc]=$fk_id;
		$zdbtype[$fk_id]=99;
		$zc++;
	}

$kbsuu2{$fk_id} = $cbl[$fk_id]+$k_busyou_suu{$fk_id};
	if(!$kbsuu2{$fk_id}){
		$zdb[$zc]=$fk_id;
		$zdbtype[$fk_id]=0;
		$zc++;
		$f_id=$k_yakusyoku_id{$k_kunino{$fk_id}}[1];
					if(-e "./p_db/touketu/$f_id.cgi"){
	&P_READ("touketu","$f_id","$f_id");
$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$p_name{$f_id}は武将不足により国を放棄したため$SYOUIJYOU[101]状態になりました。");
		if(!$p_hjijyou_w{$f_id}[101]){
		$p_hjijyou{$f_id}[4]=101;
	&HIJYOU_READ("$f_id");
		}
		$p_hjijyouc{$f_id}[$p_hjijyou_no{$f_id}[101]] = 120;
	&TOUKETU_SAVE("touketu","$f_id","$f_id");
					}else{
		if(!$p_hjijyou_w{$f_id}[101]){
		$p_hjijyou{$f_id}[4]=101;
	&HIJYOU_READ("$f_id");
		}
		$p_hjijyouc{$f_id}[$p_hjijyou_no{$f_id}[101]] = 120;
$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$p_name{$f_id}は武将不足により国を放棄したため$SYOUIJYOU[101]状態になりました。");
					}
	}elsif($k_kokka_keitai{$fk_id}){
							$ft_id = $k_outo{$fk_id};
		if($t_zokuno{$ft_id} ne $fk_id){
		$zdb[$zc]=$fk_id;
		$zdbtype[$fk_id]=1;
		$zc++;
		}
	}
			$k_keika_t{$fk_id} += 1;
			$fk_id = $k_kunino{$fk_id};

		$hit = 0;
			if($k_kokkyou{$k_kunino{$fk_id}} eq "6"){
			$add_k2 = 0;
			if($k_kunino{$k_kousen_aite_k{$fk_id}[0]} and !int(rand(3))){
		$dk_id = $k_kousen_aite_k{$fk_id}[0];
			$add_k2 = $k_kunino{$dk_id};
$housakuhit = $k_outo{$dk_id} +1;
		$hit = 1;
			}elsif($k_kunino{$k_kousen_aite_k{$fk_id}[1]} and !int(rand(3))){
		$dk_id = $k_kousen_aite_k{$fk_id}[1];
			$add_k2 = $k_kunino{$dk_id};
$housakuhit = $k_outo{$dk_id} +1;
		$hit = 1;
			}elsif($k_kunino{$k_kousen_aite_k{$fk_id}[2]} and !int(rand(3))){
		$dk_id = $k_kousen_aite_k{$fk_id}[2];
			$add_k2 = $k_kunino{$dk_id};
$housakuhit = $k_outo{$dk_id} +1;
		$hit = 1;
			}elsif($k_kunino{$k_kousen_aite_k{$fk_id}[3]} and !int(rand(3))){
		$dk_id = $k_kousen_aite_k{$fk_id}[3];
			$add_k2 = $k_kunino{$dk_id};
$housakuhit = $k_outo{$dk_id} +1;
		$hit = 1;
			}elsif($k_kunino{$k_kousen_aite_k{$fk_id}[4]} and !int(rand(3))){
		$dk_id = $k_kousen_aite_k{$fk_id}[4];
			$add_k2 = $k_kunino{$dk_id};
$housakuhit = $k_outo{$dk_id} +1;
		$hit = 1;
			}elsif($k_kunino{$k_kousen_aite_k{$fk_id}[5]} and !int(rand(3))){
		$dk_id = $k_kousen_aite_k{$fk_id}[5];
			$add_k2 = $k_kunino{$dk_id};
$housakuhit = $k_outo{$dk_id} +1;
		$hit = 1;
			}elsif($k_kunino{$k_kousen_aite_k{$fk_id}[6]} and !int(rand(3))){
		$dk_id = $k_kousen_aite_k{$fk_id}[6];
			$add_k2 = $k_kunino{$dk_id};
$housakuhit = $k_outo{$dk_id} +1;
		$hit = 1;
			}elsif($k_kunino{$k_kousen_aite_k{$fk_id}[7]} and !int(rand(3))){
		$dk_id = $k_kousen_aite_k{$fk_id}[7];
			$add_k2 = $k_kunino{$dk_id};
$housakuhit = $k_outo{$dk_id} +1;
		$hit = 1;
			}elsif($k_kunino{$k_kousen_aite_k{$fk_id}[8]} and !int(rand(3))){
		$dk_id = $k_kousen_aite_k{$fk_id}[8];
			$add_k2 = $k_kunino{$dk_id};
$housakuhit = $k_outo{$dk_id} +1;
		$hit = 1;
			}elsif($k_kunino{$k_kousen_aite_k{$fk_id}[9]} and !int(rand(3))){
		$dk_id = $k_kousen_aite_k{$fk_id}[9];
			$add_k2 = $k_kunino{$dk_id};
$housakuhit = $k_outo{$dk_id} +1;
		$hit = 1;
			}
			if(!$add_k2){
		$hit = 0;
			}
	if($k_kokkyou_keika_nen{$k_kunino{$fk_id}} > 5 and !int(rand(12))){
		if($hit and !$ino and $tuki_genzai < 7 and $tuki_genzai > 4){
			$ino = 1;
	&MAP_LOG3("<span class=\"cDA70D6\">【邪神召喚】</span>淮水に眠りし邪なる大猿よ・・共工が僕、$k_name_d[$fk_id]の意に従いて彼の国 $k_name_d[$add_k2]に大いなる災いを齎し給え・・出でよ「浮游」！！");
	&M2AP_LOG("<span class=\"cDA70D6\">【邪神召喚】</span>淮水に眠りし邪なる大猿よ・・共工が僕、$k_name_d[$fk_id]の意に従いて彼の国 $k_name_d[$add_k2]に大いなる災いを齎し給え・・出でよ「浮游」！！");
		}
	}elsif($k_kokkyou_keika_nen{$k_kunino{$fk_id}} > 10 and !int(rand(12))){
		if($hit and !$ino){
			$ino = 4;
	&MAP_LOG3("<span class=\"cDA70D6\">【邪神召喚】</span>柔利国に住まいし邪なる大蛇よ・・共工が僕、$k_name_d[$fk_id]の意に従いて彼の国 $k_name_d[$add_k2]に大いなる災いを齎し給え・・出でよ「相柳」！！");
	&M2AP_LOG("<span class=\"cDA70D6\">【邪神召喚】</span>柔利国に住まいし邪なる大蛇よ・・共工が僕、$k_name_d[$fk_id]の意に従いて彼の国 $k_name_d[$add_k2]に大いなる災いを齎し給え・・出でよ「相柳」！！");
		}
	}
			}elsif($k_kokkyou{$k_kunino{$fk_id}} eq "8"){
			if($k_kunino{$k_kousen_aite_k{$fk_id}[0]} and !int(rand(3))){
		$dk_id = $k_kousen_aite_k{$fk_id}[0];
			$add_k2 = $k_kunino{$dk_id};
$housakuhit = $k_outo{$dk_id} +1;
		$hit = 1;
			}elsif($k_kunino{$k_kousen_aite_k{$fk_id}[1]} and !int(rand(3))){
		$dk_id = $k_kousen_aite_k{$fk_id}[1];
			$add_k2 = $k_kunino{$dk_id};
$housakuhit = $k_outo{$dk_id} +1;
		$hit = 1;
			}elsif($k_kunino{$k_kousen_aite_k{$fk_id}[2]} and !int(rand(3))){
		$dk_id = $k_kousen_aite_k{$fk_id}[2];
			$add_k2 = $k_kunino{$dk_id};
$housakuhit = $k_outo{$dk_id} +1;
		$hit = 1;
			}elsif($k_kunino{$k_kousen_aite_k{$fk_id}[3]} and !int(rand(3))){
		$dk_id = $k_kousen_aite_k{$fk_id}[3];
			$add_k2 = $k_kunino{$dk_id};
$housakuhit = $k_outo{$dk_id} +1;
		$hit = 1;
			}elsif($k_kunino{$k_kousen_aite_k{$fk_id}[4]} and !int(rand(3))){
		$dk_id = $k_kousen_aite_k{$fk_id}[4];
			$add_k2 = $k_kunino{$dk_id};
$housakuhit = $k_outo{$dk_id} +1;
		$hit = 1;
			}elsif($k_kunino{$k_kousen_aite_k{$fk_id}[5]} and !int(rand(3))){
		$dk_id = $k_kousen_aite_k{$fk_id}[5];
			$add_k2 = $k_kunino{$dk_id};
$housakuhit = $k_outo{$dk_id} +1;
		$hit = 1;
			}elsif($k_kunino{$k_kousen_aite_k{$fk_id}[6]} and !int(rand(3))){
		$dk_id = $k_kousen_aite_k{$fk_id}[6];
			$add_k2 = $k_kunino{$dk_id};
$housakuhit = $k_outo{$dk_id} +1;
		$hit = 1;
			}elsif($k_kunino{$k_kousen_aite_k{$fk_id}[7]} and !int(rand(3))){
		$dk_id = $k_kousen_aite_k{$fk_id}[7];
			$add_k2 = $k_kunino{$dk_id};
$housakuhit = $k_outo{$dk_id} +1;
		$hit = 1;
			}elsif($k_kunino{$k_kousen_aite_k{$fk_id}[8]} and !int(rand(3))){
		$dk_id = $k_kousen_aite_k{$fk_id}[8];
			$add_k2 = $k_kunino{$dk_id};
$housakuhit = $k_outo{$dk_id} +1;
		$hit = 1;
			}elsif($k_kunino{$k_kousen_aite_k{$fk_id}[9]} and !int(rand(3))){
		$dk_id = $k_kousen_aite_k{$fk_id}[9];
			$add_k2 = $k_kunino{$dk_id};
$housakuhit = $k_outo{$dk_id} +1;
		$hit = 1;
			}
	if($k_kokkyou_keika_nen{$k_kunino{$fk_id}} > 5 and !int(rand(12))){
		if($hit and !$ino and $tuki_genzai < 7 and $tuki_genzai > 4){
			$ino = 7;
	&MAP_LOG3("<span class=\"cDA70D6\">【邪神召喚】</span>赤水の北に眠りし異形なる天女よ・・黄帝が僕、$k_name_d[$fk_id]の意に従いて彼の国 $k_name_d[$add_k2]に大いなる災いを齎し給え・・来たれ「女魃」！！");
	&M2AP_LOG("<span class=\"cDA70D6\">【邪神召喚】</span>赤水の北に眠りし異形なる天女よ・・黄帝が僕、$k_name_d[$fk_id]の意に従いて彼の国 $k_name_d[$add_k2]に大いなる災いを齎し給え・・来たれ「女魃」！！");
		}
	}
			}elsif($k_kokkyou{$k_kunino{$fk_id}} eq "12"){
	if($k_kokkyou_keika_nen{$k_kunino{$fk_id}} > 5 and !int(rand(3))){
		if($tuki_genzai eq "4" and !$ino){
			$ino = 3;
$housakuhit = $k_outo{$fk_id} +1;
		}
	}
			}

		}

		if(!$ino){
$housakuhit = "";
		}

		@cbl=();
												foreach(@zdb){
													if($_){
		$add_k2=$_;
		$fk_id = $add_k2;
		$zc = 0;
if($k_kokka_keitai{$fk_id}){
	while ($zc<$tosi_kazu) {
							$dt_id = $zc;

		$dk_id = $t_zokuno{$dt_id};
		if($t_name{$dt_id} and $add_k2 eq $t_zokuno{$dt_id}){
$t_zokuno{$dt_id}=0;
$zokuh=1;
$zokuhcome .= "$t_name{$dt_id}の賊砦";
		}
		$zc++;
	}
		&MAP_LOG3("<span class=\"cFF0000\">【空白地化】</span>\[$old_date\]$zokuhcomeは支配する賊が$zdbtypec[$zdbtype[$add_k2]]で消滅した為、空白地となりました。。");
		&M2AP_LOG("<span class=\"cFF0000\">【空白地化】</span>\[$old_date\]$zokuhcomeは支配する賊が$zdbtypec[$zdbtype[$add_k2]]で消滅した為、空白地となりました。。");

	foreach(@p_db_all_l){
			$e_id = $_;
			if($p_kunino{$e_id} eq $add_k2){
		$ttid = "blog/$p_id{$e_id}";
		&PRLOG("\[$old_date\]仕官先の$k_p_k_a{$add_k2}が滅亡してしまい、放浪の旅に出る。。");
	&KUNI_KAKUDUKE("$e_id","$p_kunino{$e_id}","$p_kunino{$e_id}");
		$p_kuni_yakusyoku{$e_id} = 0;
			}

	}
									$e_id = 0;
}else{
	while ($zc<$tosi_kazu) {
							$dt_id = $zc;

		if($t_name{$dt_id} and $add_k2 eq $t_kunino{$dt_id}){
$zokuhcome .= "$t_name{$dt_id} ";
$t_kunino{$dt_id}=0;
$zokuh=2;
		}
		if($t_name{$dt_id} and $add_k2 eq $t_zokuno{$dt_id}){
$t_zokuno{$dt_id}=0;
		}
		$zc++;
	}
		&MAP_LOG3("<span class=\"cFF0000\">【空白地化】</span>\[$old_date\]$zokuhcomeは支配国が$zdbtypec[$zdbtype[$add_k2]]で消滅した為、空白地となりました。。");
		&M2AP_LOG("<span class=\"cFF0000\">【空白地化】</span>\[$old_date\]$zokuhcomeは支配国が$zdbtypec[$zdbtype[$add_k2]]で消滅した為、空白地となりました。。");

	foreach(@p_db_all_l){
			$e_id = $_;
			if($p_kunino{$e_id} eq $add_k2){
		$ttid = "blog/$p_id{$e_id}";
		&PRLOG("\[$old_date\]仕官先の$k_p_k_a{$add_k2}が滅亡してしまい、放浪の旅に出る。。");
	&KUNI_KAKUDUKE("$e_id","$p_kunino{$e_id}","$p_kunino{$e_id}");
		$p_kuni_yakusyoku{$e_id} = 0;
			}

	}
									$e_id = 0;
}
							unlink("./w_db/kuni/coudata$add_k2\.pl");
									$ttid = "klog/$add_k2";
									&PRLOG("\[$old_date\]$k_p_k_a{$add_k2}は$zdbtypec[$zdbtype[$add_k2]]のため滅亡しました。。");
												&MAP_LOG3("<span class=\"cFF0000\">【滅亡】</span>\[$old_date\]$k_p_k_a{$add_k2}は$zdbtypec[$zdbtype[$add_k2]]のため滅亡しました。。");
												&M2AP_LOG("<span class=\"cFF0000\">【滅亡】</span>\[$old_date\]$k_p_k_a{$add_k2}は$zdbtypec[$zdbtype[$add_k2]]のため滅亡しました。。");

$k_kunino{$add_k2}=0;
$k_name{$add_k2}='無所属';
$k_iro_d{$add_k2}=0;
$k_kokui{$add_k2}=0;
$k_yomikaki{$add_k2}=0;
			unlink("./w_db/kuni_db/$add_k2.cgi");
	&K_W1_SAVE("kuni_db","$add_k2","$add_k2");

													}
												}
	if($zokuh){

												&RIKAUNTO;
												&MAPS;
	}

	if($tuki_genzai eq "1" or $tuki_genzai eq "7"){

							$ft_id = 0;
#	&T_SAVE("tosi_db","$ft_id","$ft_id");
	@cex_total2=();

		foreach(@p_db_all_l){
			$f_id = $_;
$cex_total2[$p_kunino{$f_id}]=int($cex_total2[$p_kunino{$f_id}]);
				if($p_kunkou{$f_id} > 0){
				$cou_numw[$p_kunino{$f_id}]++;


$MINHENDOU1[0] = '1';
$MINHENDOU1[1] = '1';
$MINHENDOU1[2] = '3';
$MINHENDOU1[3] = '6';
$MINHENDOU1[4] = '9';
$MINHENDOU1[5] = '12';
$MINHENDOU1[6] = '15';
$MINHENDOU1[7] = '18';
$MINHENDOU1[8] = '21';
$MINHENDOU1[9] = '24';
$MINHENDOU1[999] = '24';

$MINHENDOU2[0] = '500';
$MINHENDOU2[1] = '500';
$MINHENDOU2[2] = '450';
$MINHENDOU2[3] = '400';
$MINHENDOU2[4] = '350';
$MINHENDOU2[5] = '300';
$MINHENDOU2[6] = '250';
$MINHENDOU2[7] = '200';
$MINHENDOU2[8] = '150';
$MINHENDOU2[9] = '100';
$MINHENDOU2[999] = '100';

				if($cou_numw[$p_kunino{$f_id}] >= ($sousu2 * $MINHENDOU1[$kousinjyoutai])){
$cex_total2[$p_kunino{$f_id}] += $MINHENDOU2[$kousinjyoutai];
				}
				}

				$cex_total2[$p_kunino{$f_id}] += $p_kunkou{$f_id};
		}

	}


		$b_hit = 0;
		if($tuki_genzai eq "1"){
	&BAG_LOG("1月処理\n");

		$thit = 0;
	while ($thit<$tosi_kazu) {
							$ft_id = $thit;
			if($k_kokkyou{$t_kunino{$ft_id}} eq "1" and $k_kokkyou_keika_nen{$t_kunino{$ft_id}} > 5 and $t_gijyutu_max{$ft_id}<2999){
$t_gijyutu_max{$ft_id} += int((rand(3)+1)*50);
			}elsif($t_gijyutu_max{$ft_id}>1198){
$t_gijyutu_max{$ft_id} -= 200;
			}else{
$t_gijyutu_max{$ft_id} = 999;
			}
		$thit ++;
	}

			&M2AP_LOG("$nen_genzai年$tuki_genzai月:<span class=\"cFF8C00\">【納税期】</span>各武将に給与が支払われました。");


			$b_hit = 1;
$i = 0;
	while ($i<$tosi_kazu) {
							$ft_id = $i;
			if($t_tian_ti{$ft_id} < 50){
				$t_tian_ti{$ft_id} += 1;
			}
$i ++;
	}

	foreach(@k_seizon_l){
$k_keika_nen{$_} ++;
	}

	if($kousinjyoutai < 999){
		if(!int(rand(5)) and !$ino){
			$ihit=1;
			$b_hit=1;
			$ino = 99;
			if($ino eq 99){
		@IBENTOWT=();
$TIBENTOM[0] = '倭';
$TIBENTOM[1] = '荊州北部';
$TIBENTOM[2] = '荊州南部';
$TIBENTOM[3] = '司州';
$TIBENTOM[4] = '予州';
$TIBENTOM[5] = '益州北部';
$TIBENTOM[6] = '益州南部';
$TIBENTOM[7] = '揚州北部';
$TIBENTOM[8] = '揚州南部';
$TIBENTOM[9] = '冀州';
$TIBENTOM[10] = '青州';
$TIBENTOM[11] = '徐州';
$TIBENTOM[12] = '幽州東部';
$TIBENTOM[13] = '幽州西部';
$TIBENTOM[14] = '并州';
$TIBENTOM[15] = '涼州南東部';
$TIBENTOM[16] = '涼州北西部';
$TIBENTOM[17] = '亠兌州';
$TIBENTOM[18] = '交州東部';
$TIBENTOM[19] = '交州西部';
$zc = @TIBENTOM;
			$tibento = int(rand($zc));

$TIBENTOMNO[0] = '22<>78<><><><><><><><><><><><><><>';
$TIBENTOMNO[1] = '16<>25<>26<>32<><><><><><><><><><><><>';
$TIBENTOMNO[2] = '38<>40<>41<>37<><><><><><><><><><><><>';
$TIBENTOMNO[3] = '10<>9<>5<>61<>62<><><><><><><><><><><>';
$TIBENTOMNO[4] = '11<>42<>47<>48<><><><><><><><><><><><>';
$TIBENTOMNO[5] = '70<>55<>59<>15<>21<>20<>23<>24<><><><><><><><>';
$TIBENTOMNO[6] = '76<>65<>64<>30<>67<>54<>53<><><><><><><><><>';
$TIBENTOMNO[7] = '17<>29<>35<>27<>33<><><><><><><><><><><>';
$TIBENTOMNO[8] = '28<>44<>49<>71<><><><><><><><><><><><>';
$TIBENTOMNO[9] = '3<>6<>82<><><><><><><><><><><><><>';
$TIBENTOMNO[10] = '7<>8<>77<>43<><><><><><><><><><><><>';
$TIBENTOMNO[11] = '68<>14<>18<>73<><><><><><><><><><><><>';
$TIBENTOMNO[12] = '0<>52<>79<><><><><><><><><><><><><>';
$TIBENTOMNO[13] = '34<>50<>51<><><><><><><><><><><><><>';
$TIBENTOMNO[14] = '2<>58<>60<><><><><><><><><><><><><>';
$TIBENTOMNO[15] = '39<>4<>81<>56<><><><><><><><><><><><>';
$TIBENTOMNO[16] = '1<>46<>83<><><><><><><><><><><><><>';
$TIBENTOMNO[17] = '12<>13<>72<><><><><><><><><><><><><>';
$TIBENTOMNO[18] = '45<>63<>66<>74<><><><><><><><><><><><>';
$TIBENTOMNO[19] = '80<>19<>36<>57<>69<><><><><><><><><><><>';
					@iz = ();
($iz[0],$iz[1],$iz[2],$iz[3],$iz[4],$iz[5],$iz[6],$iz[7],$iz[8],$iz[9],$zi[10],$iz[11],$iz[12],$iz[13],$iz[14])=split(/<>/,$TIBENTOMNO[$tibento]);
					@IBENTOWT = @iz;
$ibenttiku0 = "$TIBENTOM[$tibento]で賊が\暴れています！各地の城で大きな被害が出ている模様です。。";
			}
		}
	}


#   RANK2    #


$i = 0;
	while($i <= $#charano){
$charano[$i] = int($charano[$i]);
$CHARA_GAZO[$i] = "$charano[$i]\n";
$i ++;
	}

	open(OUT,">./w_db/gazor.cgi");
	print OUT @CHARA_GAZO;
	close(OUT);


#   RANK2    #



#   NPC    #
$keika_nen = int($keika_nen);


#   NPC    #

#####給料######
	&BAG_LOG("給料\n");
					&KYUURYOU;

#####給料######


#   NPC    #
		if($keika_nen % 10 == 0 or $keika_nen % 10 == 3 or $keika_nen % 10 == 6){

	&BAG_LOG3("スタート\n");

##################補給線
	if($keika_nen % 10 == 0 and $keika_nen){

	&BAG_LOG3("補給線");
	&BAG_LOG("補給線\n");
#########
		$thit = 0;
	while ($thit<$tosi_kazu) {
	&T_W1_SAVE("tosi_db","$thit","$thit");
	&T_READ("tosi_db","$thit","s-$thit");
		$thit ++;
	}
##########

	$zc = 0;
	while ($zc<$tosi_kazu) {
							$ft_id = $zc;

	$t_kunino{$ft_id} = 0;
		$zc ++;
	}


	foreach(@k_seizon_l){
		$fk_id=$_;
	if(!$k_kokka_keitai{$fk_id} and !$town_get[$fk_id]){
$k_kunino{$fk_id}=0;
$k_name{$fk_id}='無所属';
$k_iro_d{$fk_id}=0;
$k_kokui{$fk_id}=0;
next;
	}
	if($k_kokka_keitai{$fk_id} or !$k_kunino{$fk_id}){
next;
	}
##########補給線###########
							$ft_id = $k_outo{$fk_id};

$t_kunino{$ft_id} = $k_kunino{$fk_id};
	&HOKYUUSEN;
##########補給線###########
	}
@town_get = ();
	$hit = 0;
		$zc = 0;
	while ($zc<$tosi_kazu) {
							$dt_id = "s-$zc";
							$ft_id = $zc;
		$town_get[$t_kunino{$ft_id}] ++;

$add_k2 = $t_kunino{$dt_id};
			if(!$t_kunino{$ft_id} and $t_kunino{$dt_id} ne $t_kunino{$ft_id} and $k_name_d[$add_k2] and $add_k2){
		$fk_id = $add_k2;
	$hit =1;
	$ttid = "klog/$add_k2";
	&PRLOG("\[$old_date\]$t_name{$dt_id}は、王都：$t_name[$k_outo{$fk_id}]からの補給路が断たれているため空白地化しました。。");
	&MAP_LOG2("<span class=\"cFF0000\">【空白地化】</span>\[$old_date\]$k_p_k_a{$add_k2}領 $t_name{$dt_id}は、王都：$t_name[$k_outo{$fk_id}]からの補給路が断たれているため空白地化しました。。");
	&M2AP_LOG("<span class=\"cFF0000\">【空白地化】</span>\[$old_date\]$k_p_k_a{$add_k2}領 $t_name{$dt_id}は、王都：$t_name[$k_outo{$fk_id}]からの補給路が断たれているため空白地化しました。。");

			}
		$zc ++;
	}

			if($hit){
												&RIKAUNTO;
												&MAPS;
			}
	}

##################補給線

	&BAG_LOG("評定\n");
	&BAG_LOG3("評定");

											open(OUT,">./w_db/busyoul2.cgi");
											print OUT @CL_DATA;
											close(OUT);
		if($tenkakaisuu < 1){
$tenkakaisuu = 1;
		}


$sainpc = 0;
$sainpcid = "";
				if($keika_nen % 10 == 3 or $keika_nen % 10 == 6){
$sainpc = 1;
					if($keika_nen % 10 == 3){
$sainpcid = " 2";
					}elsif($keika_nen % 10 == 6){
$sainpcid = " 3";
											open(OUT,">./w_db/busyoul3.cgi");
											print OUT @CL_DATA;
											close(OUT);
					}
				}



	foreach(@k_seizon_l){
		$fk_id=$_;

	if($k_kokka_keitai{$fk_id}){
next;
	}

	&BAG_LOG("評定$fk_id\n");
	&BAG_LOG3("評定$fk_id\n");
$genzaisyuu = $k_kin_syuunyuu_sougaku{$fk_id} + $k_kome_syuunyuu_sougaku{$fk_id} + 1;

$nshit = 1;
$nshit2 = 0;


$tosiherikazu = 0;
$tosihuekazu = 0;
				if($town_get[$k_kunino{$fk_id}] < $k_zenki_tosisuu{$fk_id}){
$tosiherikazu = $k_zenki_tosisuu{$fk_id} - $town_get[$k_kunino{$fk_id}];
				}else{
$tosihuekazu = $town_get[$k_kunino{$fk_id}] - $k_zenki_tosisuu{$fk_id};
				}
		if($k_kouryaku_mokuhyou{$fk_id}[0] < 1 or $k_busyou_suu{$k_kunino{$fk_id}} < 3){
$nshit = 61;
		if(length($k_tensi_name{$fk_id}) < 2){
$k_tensi_name{$fk_id} = "？ ";
		}
		}


		if($k_kouryaku_mokuhyou{$fk_id}[0] eq "1"){
			if($k_mokuhyou_tosi{$fk_id}[0] ne ""){
							$ft_id = $k_mokuhyou_tosi{$fk_id}[0];

$rinhit = 0;
	foreach(@{$t_setuzoku_saki{$ft_id}}){
		if("$_" ne ""){
							$dt_id = $_;
			if($k_kunino{$dt_id} eq $k_kunino{$fk_id}){
$rinhit = 1;
			}
		}
	}
				if($k_kunino{$fk_id} eq $t_kunino{$ft_id} and $town_get[$k_kunino{$fk_id}] > $k_zenki_tosisuu{$fk_id} and $k_kanraku_hantei{$fk_id} < 11){

				}elsif($rinhit==1 and $k_kunino{$fk_id} ne $t_kunino{$ft_id} and $k_mokuhyou_kuni{$fk_id}[0] and $k_mokuhyou_kuni{$fk_id}[0] ne $t_kunino{$ft_id} and $town_get[$k_kunino{$fk_id}] >= $k_zenki_tosisuu{$fk_id} and $k_kanraku_hantei{$fk_id} < 11){
$nshit2 = 1;
				}else{
	if($nshit ne 61){
$nshit = 0;
	}
				}
			}else{
	if($nshit ne 61){
$nshit = 0;
	}
			}
		}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "2"){
			if($k_mokuhyou_tosi{$fk_id}[0] ne ""){
							$ft_id = $k_mokuhyou_tosi{$fk_id}[0];

$rinhit = 0;
	foreach(@{$t_setuzoku_saki{$ft_id}}){
		if("$_" ne ""){
							$dt_id = $_;
			if($k_kunino{$dt_id} eq $k_kunino{$fk_id}){
$rinhit = 1;
			}
		}
	}
$katujyohit = 0;
				if($k_kunino{$fk_id} eq $t_kunino{$ft_id} and $town_get[$k_kunino{$fk_id}] > $k_zenki_tosisuu{$fk_id} and $k_kanraku_hantei{$fk_id} < 11){
$katujyohit = 1;
				}elsif($rinhit==1 and $k_kunino{$fk_id} ne $t_kunino{$ft_id} and $k_mokuhyou_kuni{$fk_id}[0] ne "0" and $k_mokuhyou_kuni{$fk_id}[0] ne $t_kunino{$ft_id} and $town_get[$k_kunino{$fk_id}] >= $k_zenki_tosisuu{$fk_id} and $k_kanraku_hantei{$fk_id} < 11){

$nshit2 = 1;
				}else{
	if($nshit ne 61){
$nshit = 0;
	}
				}

	if($katujyohit == 1 and $sainpc < 1){
	&KATUJYOUSYORI;
	}

			}else{
	if($nshit ne 61){
$nshit = 0;
	}
			}
		}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "3"){
			if($genzaisyuu > $k_zenki_sou_syuunyuu{$fk_id} * 2){
			}elsif($genzaisyuu > $k_zenki_sou_syuunyuu{$fk_id} * 1.5){
$nshit2 = 1;
			}else{
	if($nshit ne 61){
$nshit = 0;
	}
			}
		}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "4"){
			if($town_get[$k_kyuusai_aite{$fk_id}[0]] + $town_get[$k_kunino{$fk_id}] > $k_kyuusai_tosisuu{$fk_id}[0] + $k_zenki_tosisuu{$fk_id} and $sainpc < 1){
$nshit2 = 1;
			}else{
	if($nshit ne 61){
$nshit = 0;
	}
			}
		}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "11"){
			if($town_get[$k_kyuusai_aite{$fk_id}[0]] + $town_get[$k_kunino{$fk_id}] >= $k_kyuusai_tosisuu{$fk_id}[0] + $k_zenki_tosisuu{$fk_id} and $k_kanraku_hantei{$fk_id} < 11 and $sainpc < 1){
$nshit2 = 1;
			}else{
	if($nshit ne 61){
$nshit = 0;
	}
			}
		}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "12"){
			if($k_mokuhyou_tosi{$fk_id}[0] ne ""){
							$ft_id = $k_mokuhyou_tosi{$fk_id}[0];

$rinhit = 0;
	foreach(@{$t_setuzoku_saki{$ft_id}}){
		if("$_" ne ""){
							$dt_id = $_;
			if($k_kunino{$dt_id} eq $k_kunino{$fk_id}){
$rinhit = 1;
			}
		}
	}
				if($k_kunino{$fk_id} eq $t_kunino{$ft_id} and $town_get[$k_kunino{$fk_id}] > $k_zenki_tosisuu{$fk_id} and $k_kanraku_hantei{$fk_id} < 11){

				}elsif($rinhit==1 and $k_kunino{$fk_id} ne $t_kunino{$ft_id} and $k_mokuhyou_kuni{$fk_id}[0] ne "0" and $k_mokuhyou_kuni{$fk_id}[0] ne $t_kunino{$ft_id} and $town_get[$k_kunino{$fk_id}] >= $k_zenki_tosisuu{$fk_id} and $k_kanraku_hantei{$fk_id} < 11){
$nshit2 = 1;
				}else{
	if($nshit ne 61){
$nshit = 0;
	}
				}
			}else{
	if($nshit ne 61){
$nshit = 0;
	}
			}
		}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "13"){
			if($genzaisyuu > $k_zenki_sou_syuunyuu{$fk_id} * 2){
			}elsif($genzaisyuu > $k_zenki_sou_syuunyuu{$fk_id} * 1.5){
$nshit2 = 1;
			}else{
	if($nshit ne 61){
$nshit = 0;
	}
			}
		}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "14"){
			if($town_get[$k_kyuusai_aite{$fk_id}[0]] + $town_get[$k_kunino{$fk_id}] >= $k_kyuusai_tosisuu{$fk_id}[0] + $k_zenki_tosisuu{$fk_id} and $k_kanraku_hantei{$fk_id} < 11 and $sainpc < 1){
$nshit2 = 1;
			}else{
	if($nshit ne 61){
$nshit = 0;
	}
			}
		}


	&BAG_LOG3("comk");
$sousyuu = int($k_zenki_sou_syuunyuu{$fk_id} *1.5);
								if($k_kouryaku_mokuhyou{$fk_id}[0] eq "1"){
$comk = "$t_name[$k_mokuhyou_tosi{$fk_id}[0]]の城を陥落させ、領土を増やす。";
								}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "2"){
$comk = "$t_name[$k_mokuhyou_tosi{$fk_id}[0]]の城を陥落させ、領土を増やす。";
	if($sainpc < 1){
$comk .= "目標都市を落とし、現領土を維持した暁には、都市$t_name[$k_katujyou_tosi{$fk_id}[0]]を、盟友$k_name_d[$k_katujyou_aite{$fk_id}[0]]に差し出す。";
	}
								}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "3"){
$comk = "国の総収入を$sousyuu以上にする。(現在の総収入⇒$genzaisyuu)";
								}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "4"){
$comk = "大国：$k_name_d[$k_kyuusai_aite{$fk_id}[0]]に付き従い、領土拡張を図る。";
								}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "11"){
$comk = "大国に脅かされ窮地に陥っている盟友$k_name_d[$k_kyuusai_aite{$fk_id}[0]]を護りとおす。";
								}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "12"){
$comk = "$k_name_d[$k_teisen_aite{$fk_id}[0]]に対しての交戦指定を取りやめ、目標を以下のように切り替える。<br />$t_name[$k_mokuhyou_tosi{$fk_id}[0]]の城を陥落させ、領土を増やす。";
								}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "13"){
$comk = "$k_name_d[$k_teisen_aite{$fk_id}[0]]に対しての交戦指定を取りやめ、目標を以下のように切り替える。<br />国の総収入を$sousyuu以上にする。(現在の総収入⇒$genzaisyuu)";
								}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "14"){
$comk = "$k_name_d[$k_teisen_aite{$fk_id}[0]]に対しての交戦指定を取りやめ、目標を以下のように切り替える。<br />大国に脅かされ窮地に陥っている盟友$k_name_d[$k_kyuusai_aite{$fk_id}[0]]を護りとおす。";
								}elsif($k_kouryaku_mokuhyou{$fk_id}[0] < 1){
$comk = "天子が即位したばかりで評定はまだ開かれていません。";
								}

			if(!$sainpc and !$nshit and $k_kanraku_hantei{$fk_id} eq "10"){
$nshit = 60;
			}
		@npcai2 = ();
		@npcai3 = ();
		@npcai4 = ();
		@npcai7 = ();
		@npcai8 = ();
		@npcai9 = ();
		@npcai10 = ();
		@npcai11 = ();
		@npcai12 = ();
$i=0;
	while ($i < 27) {
$i++;
$kanid[$i] = "";

$nten1[$i] = "";
$nhyou2[$i] = 0;
$nsaku3[$i] = 61;
$nkyou4[$i] = 61;
$ntt5[$i] = 0;
$nnamae6[$i] = "";
$nkout7[$i] = "";
$nkatuk8[$i] = 0;
$nkatut9[$i] = "";
$nteik10[$i] = 0;
$nkyuuk11[$i] = 0;
$nzei12[$i] = 0;
$ndb13[$i] = "";
#武将ID
$ndb14[$i] = 0;
#未
$ndb15[$i] = 0;
#未
$ndb16[$i] = "";
#未
$ndb17[$i] = "";
#未
$nseikou18[$i] = 0;
$ntuu19[$i] = 0;
$nhit[$i] = 0;

$ytero[$i] = 0;
		open(IN,"./w_db/kuni/ctop$k_kunino{$fk_id} npc$i$sainpcid.cgi");
		@NPCOP1 = <IN>;
		close(IN);
	($nten1[$i],$nhyou2[$i],$nsaku3[$i],$nkyou4[$i],$ntt5[$i],$nnamae6[$i],$nkout7[$i],$nkatuk8[$i],$nkatut9[$i],$nteik10[$i],$nkyuuk11[$i],$nzei12[$i],$ndb13[$i],$ndb14[$i],$ndb15[$i],$ndb16[$i],$ndb17[$i],$nseikou18[$i],$ntuu19[$i],$nhit[$i]) = split(/<>/,$NPCOP1[0]);
$ytero[$i] = $nhyou2[$i];
	&BAG_LOG3("NPCK1//$NPCOP1[0]");
		if($nshit == 0){
$ytero[$i] = 0;
		}elsif($nshit == 61){
$ytero[$i] = 1;
		}
$nnv2 = $nhyou2[$i];
$nnv3 = $nsaku3[$i];
$nnv4 = $nkyou4[$i];
$nnv7 = $nkout7[$i];
$nnv8 = $nkatuk8[$i];
$nnv9 = $nkatut9[$i];
$nnv10 = $nteik10[$i];
$nnv11 = $nkyuuk11[$i];
$nnv12 = $nzei12[$i];
		if($i < 4){

$npckslv = 0;
$npckklv = 1;
$npchtlv = 5;

		}elsif($i < 7){

$npckslv = 5;
$npckklv = 0;
$npchtlv = 4;

		}elsif($i < 8){

$npckslv = 7;
$npckklv = 0;
$npchtlv = 3;

		}elsif($i < 11){

$npckslv = 3;
$npckklv = 0;
$npchtlv = 2;

		}elsif($i < 15){

$npckslv = 0;
$npckklv = 0;
$npchtlv = 1;

		}elsif($i == 15){

$npckslv = 0;
$npckklv = 0;
$npchtlv = 0;

		}elsif($i < 19){

$npckslv = 0;
$npckklv = 0;
$npchtlv = 2;

		}elsif($i < 28){

$npckslv = 1;
$npckklv = 0;
$npchtlv = 2;

		}
$npcai3[$nnv3] += $npckslv;
$npcai4[$nnv4] += $npckklv;
			if($nnv2 > 0){
$npcai2[$nnv2] += $npchtlv;
			}
			if($nnv7 ne ""){
$npcai7[$nnv7] += $npchtlv;
			}
			if($nnv8 > 0){
$npcai8[$nnv8] += $npchtlv;
			}
			if($nnv9 ne ""){
$npcai9[$nnv9] += $npchtlv;
			}
			if($nnv10 > 0){
$npcai10[$nnv10] += $npchtlv;
			}
			if($nnv11 > 0){
$npcai11[$nnv11] += $npchtlv;
			}
			if($nnv12 > 0){
$npcai12[$nnv12] += $npchtlv;
			}
	}


$imax=99;
		if($kuni_kazu_d > $imax){
$imax=$kuni_kazu_d+1;
		}
$i=0;
	@NPCK = ();
	while ($i < $imax) {
			push(@NPCK,"$i<>$npcai2[$i]<>$npcai3[$i]<>$npcai4[$i]<>$npcai7[$i]<>$npcai8[$i]<>$npcai9[$i]<>$npcai10[$i]<>$npcai11[$i]<>$npcai12[$i]<>\n");
$i++;
	}

	&BAG_LOG3("NPCK2");
	@tmp = map {(split /<>/)[1]} @NPCK;
	@NPCK2 = @NPCK[sort {$tmp[$b] <=> $tmp[$a]} 0 .. $#tmp];

	&BAG_LOG3("NPCK3");
	@tmp = map {(split /<>/)[2]} @NPCK;
	@NPCK3 = @NPCK[sort {$tmp[$b] <=> $tmp[$a]} 0 .. $#tmp];

	&BAG_LOG3("NPCK4");
	@tmp = map {(split /<>/)[3]} @NPCK;
	@NPCK4 = @NPCK[sort {$tmp[$b] <=> $tmp[$a]} 0 .. $#tmp];

	&BAG_LOG3("NPCK5");
	@tmp = map {(split /<>/)[4]} @NPCK;
	@NPCK7 = @NPCK[sort {$tmp[$b] <=> $tmp[$a]} 0 .. $#tmp];

	&BAG_LOG3("NPCK6");
	@tmp = map {(split /<>/)[5]} @NPCK;
	@NPCK8 = @NPCK[sort {$tmp[$b] <=> $tmp[$a]} 0 .. $#tmp];

	&BAG_LOG3("NPCK7");
	@tmp = map {(split /<>/)[6]} @NPCK;
	@NPCK9 = @NPCK[sort {$tmp[$b] <=> $tmp[$a]} 0 .. $#tmp];

	&BAG_LOG3("NPCK8");
	@tmp = map {(split /<>/)[7]} @NPCK;
	@NPCK10 = @NPCK[sort {$tmp[$b] <=> $tmp[$a]} 0 .. $#tmp];

	&BAG_LOG3("NPCK9");
	@tmp = map {(split /<>/)[8]} @NPCK;
	@NPCK11 = @NPCK[sort {$tmp[$b] <=> $tmp[$a]} 0 .. $#tmp];

	&BAG_LOG3("NPCK10");
	@tmp = map {(split /<>/)[9]} @NPCK;
	@NPCK12 = @NPCK[sort {$tmp[$b] <=> $tmp[$a]} 0 .. $#tmp];


			($npcrno,$npcaid2,$npcaid3,$npcaid4,$npcaid7,$npcaid8,$npcaid9,$npcaid10,$npcaid11,$npcaid12) = split(/<>/,$NPCK2[0]);

$npcaiv2 = $npcrno;
									if($t_kunino{$dt_id} eq 24){
									$npcaiv2 = 1;
									$npcrno = 1;
									}
									if($t_kunino{$dt_id} eq 24 and ($npcaiv2 eq 12 or $npcaiv2 eq 13 or $npcaiv2 eq 14)){
									$npcaiv2 = 1;
									$npcrno = 1;
									}
		if($npcaiv2 ne "61" and $npcaiv2){$k_kouryaku_mokuhyou{$fk_id}[0] = $npcaiv2;
		}elsif($npcaiv2 eq "61"){
	if($sainpc == 1){
next;
	}
		}else{
	if($sainpc == 1){
next;
	}
$k_kouryaku_mokuhyou{$fk_id}[0] = 3;
		}

	if($sainpc < 1){
			($npcrno,$npcaid2,$npcaid3,$npcaid4,$npcaid7,$npcaid8,$npcaid9,$npcaid10,$npcaid11,$npcaid12) = split(/<>/,$NPCK3[0]);

	&BAG_LOG3("hyoutei///$NPCK3[0]");
$npcaiv3 = $npcrno;

		if($npcaiv3 ne "61" and $npcaiv3 ne $k_kokusaku{$fk_id}){

			if($tenkakaisuu > 1 and $k_kunino{$fk_id} eq "1" and $keika_nen < 100){

									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]天下統一した国家は戦乱が起こってから100年の間、国策が$KOKUSAKU[10]に固定されます。");

			}else{
$k_kokusaku{$fk_id} = $npcaiv3;$k_kokusaku_keika_nen{$fk_id} = 0;
	$kadd=$KOKUSAKUG[$k_kokusaku{$fk_id}];
if(!$k_kokkyou{$fk_id}){
	if($k_kokkyou_keika_nen{$fk_id} > 15){
	$kadd=int($KOKUSAKUG[$k_kokusaku{$fk_id}] * 0.5);
	}elsif($k_kokkyou_keika_nen{$fk_id} > 10){
	$kadd=int($KOKUSAKUG[$k_kokusaku{$fk_id}] * 0.7);
	}elsif($k_kokkyou_keika_nen{$fk_id} > 5){
	$kadd=int($KOKUSAKUG[$k_kokusaku{$fk_id}] * 0.9);
	}
}
	if($k_kokko_sougaku{$fk_id} >= $kadd){
$k_kokko_sougaku{$fk_id} -= $kadd;
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]国策「$KOKUSAKU[$k_kokusaku{$fk_id}]」を発令しました。");
	}else{
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]国庫の金が不足しているため、国策「$KOKUSAKU[$k_kokusaku{$fk_id}]」を発令できません。コスト：$kadd。国庫：$k_kokko_sougaku{$fk_id}。国策の発令を取り止め「$KOKUSAKU[0]」に設定いたします。");
$k_kokusaku{$fk_id} = 0;
	}
			}
		}else{
	$kadd=$KOKUSAKUG[$k_kokusaku{$fk_id}];
if(!$k_kokkyou{$fk_id}){
	if($k_kokkyou_keika_nen{$fk_id} > 15){
	$kadd=int($KOKUSAKUG[$k_kokusaku{$fk_id}] * 0.5);
	}elsif($k_kokkyou_keika_nen{$fk_id} > 10){
	$kadd=int($KOKUSAKUG[$k_kokusaku{$fk_id}] * 0.7);
	}elsif($k_kokkyou_keika_nen{$fk_id} > 5){
	$kadd=int($KOKUSAKUG[$k_kokusaku{$fk_id}] * 0.9);
	}
}
	if($k_kokko_sougaku{$fk_id} >= $kadd){
$k_kokusaku_keika_nen{$fk_id} ++;
$k_kokko_sougaku{$fk_id} -= $kadd;
	}else{
$k_kokusaku{$fk_id} = 0;
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]国庫の金が不足しているため、国策「$KOKUSAKU[$k_kokusaku{$fk_id}]」を維持できません。コスト：$kadd。国庫：$k_kokko_sougaku{$fk_id}。国策の発令を取り止め「$KOKUSAKU[0]」に設定いたします。");
	}
		}

			($npcrno,$npcaid2,$npcaid3,$npcaid4,$npcaid7,$npcaid8,$npcaid9,$npcaid10,$npcaid11,$npcaid12) = split(/<>/,$NPCK4[0]);

$npcaiv4 = $npcrno;
		if($npcaid4 eq "3" and $npcaiv4 ne "61" and $npcaiv4 ne $k_kokkyou{$fk_id}){$k_kokkyou{$fk_id} = $npcaiv4;$k_kokkyou_keika_nen{$fk_id} = 0;
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]国教「$KOKKYOU[$k_kokkyou{$fk_id}]」を布教しました。");
		}else{$k_kokkyou_keika_nen{$fk_id} ++;
		}
	}

			($npcrno,$npcaid2,$npcaid3,$npcaid4,$npcaid7,$npcaid8,$npcaid9,$npcaid10,$npcaid11,$npcaid12) = split(/<>/,$NPCK7[0]);

									if($t_kunino{$dt_id} eq 24){
									$npcaiv7 = 9;
									}
$npcaiv7 = $npcrno;
		if($npcaiv7 ne ""){
							$ft_id = $npcaiv7;
			if($t_kunino{$ft_id} ne $k_kunino{$fk_id}){
$k_mokuhyou_tosi{$fk_id}[0] = $npcaiv7;$k_mokuhyou_kuni{$fk_id}[0] = $t_kunino{$ft_id};
			}
		}else{$k_mokuhyou_tosi{$fk_id}[0] = "";
$k_mokuhyou_kuni{$fk_id}[0] = 0;
		}
			($npcrno,$npcaid2,$npcaid3,$npcaid4,$npcaid7,$npcaid8,$npcaid9,$npcaid10,$npcaid11,$npcaid12) = split(/<>/,$NPCK8[0]);

$npcaiv8 = $npcrno;
		if($npcaiv8 ne "" and $npcaiv8 ne "0"){$k_katujyou_aite{$fk_id}[0] = $npcaiv8;
		}else{$k_katujyou_aite{$fk_id}[0] = 0;
		}

			($npcrno,$npcaid2,$npcaid3,$npcaid4,$npcaid7,$npcaid8,$npcaid9,$npcaid10,$npcaid11,$npcaid12) = split(/<>/,$NPCK9[0]);

$npcaiv9 = $npcrno;
		if($npcaiv9 ne ""){$k_katujyou_tosi{$fk_id}[0] = $npcaiv9;
		}else{$k_katujyou_tosi{$fk_id}[0] = "";
		}

			($npcrno,$npcaid2,$npcaid3,$npcaid4,$npcaid7,$npcaid8,$npcaid9,$npcaid10,$npcaid11,$npcaid12) = split(/<>/,$NPCK10[0]);

$npcaiv10 = $npcrno;
		if($npcaiv10 ne "" and $npcaiv10 ne "0"){$k_teisen_aite{$fk_id}[0] = $npcaiv10;
		}else{$k_teisen_aite{$fk_id}[0] = 0;
		}

			($npcrno,$npcaid2,$npcaid3,$npcaid4,$npcaid7,$npcaid8,$npcaid9,$npcaid10,$npcaid11,$npcaid12) = split(/<>/,$NPCK11[0]);

$npcaiv11 = $npcrno;
		if($npcaiv11 ne "" and $npcaiv11 ne "0" and $npcaiv11 ne $k_kunino{$fk_id}){$k_kyuusai_aite{$fk_id}[0] = $npcaiv11;
$k_kyuusai_tosisuu{$fk_id}[0] = $town_get[$k_kyuusai_aite{$fk_id}[0]];
			if($k_zenki_tosisuu{$fk_id} < 1){$k_kyuusai_aite{$fk_id}[0] = "";
			}
		}else{$k_kyuusai_aite{$fk_id}[0] = $npcaiv11;
		}

			($npcrno,$npcaid2,$npcaid3,$npcaid4,$npcaid7,$npcaid8,$npcaid9,$npcaid10,$npcaid11,$npcaid12) = split(/<>/,$NPCK12[0]);

$npcaiv12 = $npcrno;
		if($npcaiv12 ne "61" and $npcaiv12 ne "" and $npcaiv12 ne "0" and $npcaiv12 ne $k_busyou_kazei{$fk_id}){
	$ttid = "klog/$k_kunino{$fk_id}";
	&PRLOG("\[$old_date\]武将に対する所得税率：『$k_busyou_kazei{$fk_id}％』⇒『$npcaiv12％』");
$k_busyou_kazei{$fk_id} = $npcaiv12;

		}elsif($npcaiv12 eq "61"){
		}else{
		}


	&BAG_LOG3("褒賞");
##########褒賞###########
$i=0;
$saihanw = 0;

		if($nshit eq "0" and $sainpc < 1){
	$ttid = "klog/$k_kunino{$fk_id}";
	&PRLOG("\[$old_date\]攻略目標『$comk』の達成に失敗しました。");
		}elsif($nshit eq "60"){
		}elsif($nshit eq "61" and $sainpc < 1){
	$ttid = "klog/$k_kunino{$fk_id}";
	&PRLOG("\[$old_date\]武将数が規定数に達していない為、評定結果は国に影響を及ぼしませんでした。");
		}elsif($nshit eq "1"){
	$ttid = "klog/$k_kunino{$fk_id}";
	&PRLOG("\[$old_date\]攻略目標『$comk』を達成致しました。");
			if($sainpc eq "1"){
	$ttid = "klog/$k_kunino{$fk_id}";
	&PRLOG("\[$old_date\]再評定により攻略目標を変更いたしました。");
			}
		}else{
	$ttid = "klog/$k_kunino{$fk_id}";
	&PRLOG("\[$old_date\]再評定により攻略目標を変更いたしました。");
$saihanw = 1;
		}

$etensiw = "";
	while ($i < 27) {
$i++;
		if($ndb13[$i] and $i ne "15"){
$e_id = $ndb13[$i];
	&BAG_LOG3("進言$e_id");
	if($p_id{$e_id}){



$add_come1 = "";
$add_come2 = "";
	if(!$nhit[$i]){
$add_come1 = "進言を行わなかったものの";
$add_come2 = "進言を行わずに";
	}
	if($i == 1){
$etensiw = $p_minzoku{$e_id};
	}
		if($nshit eq "1" and $nhit[$i] eq "2"){
$goldww = int($k_kokko_sougaku{$fk_id} * 0.02);
$p_syoji_kin{$e_id} += $goldww;
$k_kokko_sougaku{$fk_id} -= $goldww;
	$ttid = "blog/$ndb13[$i]";
	&PRLOG("\[$old_date\]前期の評定『$comk』において、$KANBU[$i]として的確な進言を行ったことが評価され、$p_name{$e_id}の名が大陸全土に知れ渡りました！！（$goldwwの報奨金）");
$p_kuni_kouken{$e_id} += int($p_kuni_kouken{$e_id} * 0.04);
$p_neutral_meisei{$e_id} += int($p_kuni_kouken{$e_id} * 0.04);

	$w_id=$p_id{$e_id};&P_LOG_W("\[$old_date\]前期の評定『$comk』において、$KANBU[$i]として的確な進言を行ったことが評価され、$p_name{$e_id}の名が大陸全土に知れ渡りました！！（$goldwwの報奨金）");

$nseikou18[$i] += $tosihuekazu + 1;
$nseikou18[$i] ++;
		}elsif($nshit eq "1" and ($nhit[$i] eq "1" or $ntuu19[$i] < 2)){
$goldww = int($k_kokko_sougaku{$fk_id} * 0.01);
$p_syoji_kin{$e_id} += $goldww;
$k_kokko_sougaku{$fk_id} -= $goldww;
	$ttid = "blog/$ndb13[$i]";
	&PRLOG("\[$old_date\]前期の評定『$comk』において、$add_come1$KANBU[$i]として攻略目標を達成したことにより、$p_name{$e_id}の名声が高まりました！（$goldwwの報奨金）");


	$w_id=$p_id{$e_id};&P_LOG_W("\[$old_date\]前期の評定『$comk』において、$KANBU[$i]として攻略目標を達成したことにより、$p_name{$e_id}の名声が高まりました！（$goldwwの報奨金）");
$p_kuni_kouken{$e_id} += int($p_kuni_kouken{$e_id} * 0.02);
$p_neutral_meisei{$e_id} += int($p_kuni_kouken{$e_id} * 0.02);

		}elsif($nshit < 1 and $nhit[$i] eq "2" and $sainpc < 1 and $ntuu19[$i] > 1){
	$ttid = "blog/$ndb13[$i]";
	&PRLOG("\[$old_date\]前期の評定『$comk』において、$KANBU[$i]として不的確な進言をしたことにより、$p_name{$e_id}に対する失望の声が広まっています・・。");

	$w_id=$p_id{$e_id};&P_LOG_W("\[$old_date\]前期の評定『$comk』において、$KANBU[$i]として不的確な進言をしたことにより、$p_name{$e_id}に対する失望の声が広まっています・・。");

$p_kuni_kouken{$e_id} -= int($p_kuni_kouken{$e_id} * 0.1);
$p_neutral_meisei{$e_id} -= int($p_kuni_kouken{$e_id} * 0.1);
$nseikou18[$i] -= 2 + $tosiherikazu;
		if($nseikou18[$i] > 0 and $ntuu19[$i] > 1){
$ytero[$i] = 1;
		}

		}elsif($nshit < 1 and ($nhit[$i] eq "1" or $ntuu19[$i] < 2) and $sainpc < 1){
	$ttid = "blog/$ndb13[$i]";
	&PRLOG("\[$old_date\]前期の評定『$comk』において、$add_come2$KANBU[$i]として攻略目標を達成出来なかったことにより、$p_name{$e_id}に対する失望の声が広まっています・・。");


	$w_id=$p_id{$e_id};&P_LOG_W("\[$old_date\]前期の評定『$comk』において、$KANBU[$i]として攻略目標を達成出来なかったことにより、$p_name{$e_id}に対する失望の声が広まっています・・。");
$p_kuni_kouken{$e_id} -= int($p_kuni_kouken{$e_id} * 0.06);
$p_neutral_meisei{$e_id} -= int($p_kuni_kouken{$e_id} * 0.06);
$nseikou18[$i] -= 1 + $tosiherikazu;
		if($nseikou18[$i] > 0 and $ntuu19[$i] > 1){
$ytero[$i] = 1;
		}

		}elsif($nshit ne "61" and !$nhit[$i] and $sainpc < 1 and $ntuu19[$i] > 1){
	$ttid = "blog/$ndb13[$i]";
	&PRLOG("\[$old_date\]$KANBU[$i]として前期の評定において進言を行わなかったことにより、$p_name{$e_id}に対する失望の声が広まっています・・。");


	$w_id=$p_id{$e_id};&P_LOG_W("\[$old_date\]$KANBU[$i]として前期の評定において進言を行わなかったことにより、$p_name{$e_id}に対する失望の声が広まっています・・。");
$p_kuni_kouken{$e_id} -= int($p_kuni_kouken{$e_id} * 0.02);
$p_neutral_meisei{$e_id} -= int($p_kuni_kouken{$e_id} * 0.02);
$nseikou18[$i] -= 1;
		if($nseikou18[$i]){
$ytero[$i] = 1;
		}

		}
$kannamae[$i] = $p_name{$e_id};
$kanid[$i] = $p_id{$e_id};$ntuu19[$i] ++;
	}
		}
$nhit[$i] = 0;

	}

	if($nshit < 1 and $sainpc < 1){
$k_kokui{$fk_id} -= 5;
		if($nshit2){
$k_kokui{$fk_id} -= 5;
		}
$k_kokui{$fk_id} -= $tosiherikazu * 10;
		if($k_kokusaku{$k_kunino{$fk_id}} eq "3" and $k_kokui{$fk_id} < 30 and $k_kokusaku_keika_nen{$k_kunino{$fk_id}} > 2){
$k_kokui{$fk_id} += 5;
		}

	}elsif($nshit eq "1"){
$k_kokui{$fk_id} += 10;
		if($nshit2){
$k_kokui{$fk_id} -= 5;
		}
		if($k_kokui{$fk_id} > 90){
$k_kokui{$fk_id} -= 5;
		}
$k_kokui{$fk_id} -= $tosiherikazu * 10;
		if($k_kokusaku{$k_kunino{$fk_id}} eq "3" and $k_kokui{$fk_id} < 90 and $k_kokusaku_keika_nen{$k_kunino{$fk_id}} > 2){
$k_kokui{$fk_id} += 5;
		}

	}
		if($k_kokui{$fk_id} < 1){
$k_kokui{$fk_id} = 0;
		}elsif($k_kokui{$fk_id} > 120){
$k_kokui{$fk_id} = 120;
		}
##########褒賞###########


		if($saihanw < 1){
$k_zenki_tosisuu{$fk_id} = $town_get[$k_kunino{$fk_id}];
$k_zenki_sou_syuunyuu{$fk_id} = $genzaisyuu;
$k_kanraku_hantei{$fk_id} = 0;
			if($sainpc){
$k_kanraku_hantei{$fk_id} = 1;
			}
		}

			if($k_kanraku_hantei{$fk_id} > 10){
$k_kanraku_hantei{$fk_id} = 1;
$k_kokui{$fk_id} -= 5;
		if($k_kokui{$fk_id} < 1){
$k_kokui{$fk_id} = 0;
		}
			}

##########本評定###########
		if($sainpc < 1){

$k_zenki_tosisuu{$fk_id} = $town_get[$k_kunino{$fk_id}];
$k_zenki_sou_syuunyuu{$fk_id} = $genzaisyuu;
##########天子名・役職テロ###########
$k_kanraku_hantei{$fk_id} = 0;

	&BAG_LOG3("天子名・役職テロ$nten1[1]");
		if((($nten1[1] ne "" and $nshit == 1) or $k_tensi_name{$fk_id} eq "") and $nten1[1] eq $nten1[2] and $nten1[2] eq $nten1[3]){

				&KANBU_NAME;
		if($tenkakaisuu >= 2 and ($k_kunino{$fk_id} eq "2" or $k_kunino{$fk_id} eq "3")){
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]${$zokukanbuptn}[1]「$nnamae6[1]」・${$zokukanbuptn}[2]「$nnamae6[2]」・${$zokukanbuptn}[3]「$nnamae6[3]」、上公の三人の意向により、新天子「$nten1[1]」を擁立しようとしましたが失敗に終わりました。ゲームの歴史に大きく絡む、天子「$k_tensi_name{$fk_id}」を廃することはできません。");

		}else{
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]${$zokukanbuptn}[1]「$nnamae6[1]」・${$zokukanbuptn}[2]「$nnamae6[2]」・${$zokukanbuptn}[3]「$nnamae6[3]」、上公の三人の意向により、天子「$k_tensi_name{$fk_id}」を廃し、新天子「$nten1[1]」を即位させました。");
$k_tensi_name{$fk_id} = $nten1[1];
				if($etensiw ne "" and $etensiw ne $k_syuminzoku{$fk_id}){
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]皇位禅定の影響を受け、主民族が「$MINZOKUSAN[$k_syuminzoku{$fk_id}]」⇒「$MINZOKUSAN[$etensiw]」に変更されました。");

$k_syuminzoku{$fk_id} = $etensiw;
				}

		}

		}

@p_db_all_l_w=@p_db_all_l;

$jk=0;$sk=0;$sg=0;@shit=();
	foreach(@p_db_all_l_w){
			$f_id = $_;
	if(($p_tyuusei{$f_id} < 70 and !$p_kuni_yakusyoku{$f_id}) or $fk_id ne $p_kunino{$f_id}){
next;
	}

	&BAG_LOG3("役職$f_id");
								$jfl = int($p_tousotu{$f_id} * 300 / $p_sougou{$f_id});
								$jfs = int($p_buryoku{$f_id} * 300 / $p_sougou{$f_id});
								$jfi = int($p_tiryoku{$f_id} * 300 / $p_sougou{$f_id});
		$jk=0;$sk=0;$sg=0;
		if($shit[1] < 1 and $jk < 1){
$teroid=1;
							$e_id=$k_yakusyoku_id{$fk_id}[1];
										if($p_kunino{$e_id} ne $p_kunino{$f_id}){
							$ytero[$teroid] = 0;
											if($p_id{$e_id} eq ""){
							$k_yakusyoku_id{$fk_id}[1]="";
											}
										}
				if($k_yakusyoku_id{$fk_id}[1] ne $f_id and int(($k_keika_t{$fk_id}/36) - 3) < $p_kuni_sikan_nensuu{$f_id} and ($ytero[$teroid] < 1 or $k_yakusyoku_id{$fk_id}[1] eq "")){
						if($k_yakusyoku_id{$fk_id}[1] eq ""){
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が$KANBU[$teroid]に任命される。");

	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$KANBU[$teroid]に任命される。");
						}else{
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が新たな$KANBU[$teroid]に任命される。");
	$ttid = "blog/$p_id{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}$KANBU[$teroid]の任を解かれる。");
	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$k_p_k_a{$p_kunino{$f_id}}の新たな$KANBU[$teroid]に任命される。");
						}
		$d_id = $k_yakusyoku_id{$fk_id}[1];
		$k_yakusyoku_id{$fk_id}[1]=$f_id;
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","");
	if($k_yakusyoku_id{$fk_id}[2] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[2] = "";
	}elsif($k_yakusyoku_id{$fk_id}[3] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[3] = "";
	}elsif($k_yakusyoku_id{$fk_id}[16] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[16] = "";
	}elsif($k_yakusyoku_id{$fk_id}[17] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[17] = "";
	}elsif($k_yakusyoku_id{$fk_id}[18] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[18] = "";
	}
		$d_id = $f_id;
	&KUNI_KAKUDUKE("$d_id","$fk_id","");
$nseikou18[$teroid] =0;$ntuu19[$teroid] =0;
$nhit[$teroid] = 0;$shit[$teroid]=1;

$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$jk++;$sk++;$sg++;

				}elsif($ytero[$teroid] and $k_yakusyoku_id{$fk_id}[1] eq $f_id){
$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$jk++;$shit[$teroid]=1;

				}
		}
		if($shit[2] < 1 and $jk < 1){
$teroid=2;
							$e_id=$k_yakusyoku_id{$fk_id}[2];
										if($p_kunino{$e_id} ne $p_kunino{$f_id}){
							$ytero[$teroid] = 0;
											if($p_id{$e_id} eq ""){
							$k_yakusyoku_id{$fk_id}[2]="";
											}
										}
				if($k_yakusyoku_id{$fk_id}[2] ne $f_id and int(($k_keika_t{$fk_id}/36) - 3) < $p_kuni_sikan_nensuu{$f_id} and ($ytero[$teroid] < 1 or $k_yakusyoku_id{$fk_id}[2] eq "")){
						if($k_yakusyoku_id{$fk_id}[2] eq ""){
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が$KANBU[$teroid]に任命される。");

	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$KANBU[$teroid]に任命される。");
						}else{
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が新たな$KANBU[$teroid]に任命される。");
	$ttid = "blog/$p_id{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}$KANBU[$teroid]の任を解かれる。");
	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$k_p_k_a{$p_kunino{$f_id}}の新たな$KANBU[$teroid]に任命される。");
						}
		$d_id = $k_yakusyoku_id{$fk_id}[2];
		$k_yakusyoku_id{$fk_id}[2]=$f_id;
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","");
	if($k_yakusyoku_id{$fk_id}[1] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[1] = "";
	}elsif($k_yakusyoku_id{$fk_id}[3] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[3] = "";
	}elsif($k_yakusyoku_id{$fk_id}[16] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[16] = "";
	}elsif($k_yakusyoku_id{$fk_id}[17] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[17] = "";
	}elsif($k_yakusyoku_id{$fk_id}[18] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[18] = "";
	}
		$d_id = $f_id;
	&KUNI_KAKUDUKE("$d_id","$fk_id","");
$nseikou18[$teroid] =0;$ntuu19[$teroid] =0;
$nhit[$teroid] = 0;$shit[$teroid]=1;

$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$jk++;$sk++;$sg++;

				}elsif($ytero[$teroid] and $k_yakusyoku_id{$fk_id}[2] eq $f_id){
$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$jk++;$shit[$teroid]=1;

				}
		}
		if($shit[3] < 1 and $jk < 1){
$teroid=3;
							$e_id=$k_yakusyoku_id{$fk_id}[3];
										if($p_kunino{$e_id} ne $p_kunino{$f_id}){
							$ytero[$teroid] = 0;
											if($p_id{$e_id} eq ""){
							$k_yakusyoku_id{$fk_id}[3]="";
											}
										}
				if($k_yakusyoku_id{$fk_id}[3] ne $f_id and int(($k_keika_t{$fk_id}/36) - 3) < $p_kuni_sikan_nensuu{$f_id} and ($ytero[$teroid] < 1 or $k_yakusyoku_id{$fk_id}[3] eq "")){
						if($k_yakusyoku_id{$fk_id}[3] eq ""){
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が$KANBU[$teroid]に任命される。");

	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$KANBU[$teroid]に任命される。");
						}else{
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が新たな$KANBU[$teroid]に任命される。");
	$ttid = "blog/$p_id{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}$KANBU[$teroid]の任を解かれる。");
	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$k_p_k_a{$p_kunino{$f_id}}の新たな$KANBU[$teroid]に任命される。");
					}
		$d_id = $k_yakusyoku_id{$fk_id}[3];
		$k_yakusyoku_id{$fk_id}[3]=$f_id;
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","");
	if($k_yakusyoku_id{$fk_id}[1] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[1] = "";
	}elsif($k_yakusyoku_id{$fk_id}[2] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[2] = "";
	}elsif($k_yakusyoku_id{$fk_id}[16] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[16] = "";
	}elsif($k_yakusyoku_id{$fk_id}[17] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[17] = "";
	}elsif($k_yakusyoku_id{$fk_id}[18] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[18] = "";
	}
		$d_id = $f_id;
	&KUNI_KAKUDUKE("$d_id","$fk_id","");	
$nseikou18[$teroid] =0;$ntuu19[$teroid] =0;
$nhit[$teroid] = 0;$shit[$teroid]=1;

$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$jk++;$sk++;$sg++;

				}elsif($ytero[$teroid] and $k_yakusyoku_id{$fk_id}[3] eq $f_id){
$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$jk++;$shit[$teroid]=1;

				}
		}

		if($shit[7] < 1 and $sg < 1 and ($jfs>129 or $jfl>129)){
$teroid=7;
							$e_id=$k_yakusyoku_id{$fk_id}[7];
										if($p_kunino{$e_id} ne $p_kunino{$f_id}){
							$ytero[$teroid] = 0;
											if($p_id{$e_id} eq ""){
							$k_yakusyoku_id{$fk_id}[7]="";
											}
										}
				if($k_yakusyoku_id{$fk_id}[7] ne $f_id and ($ytero[$teroid] < 1 or $k_yakusyoku_id{$fk_id}[7] eq "")){
						if($k_yakusyoku_id{$fk_id}[7] eq ""){
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が$KANBU[$teroid]に任命される。");

	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$KANBU[$teroid]に任命される。");
						}else{
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が新たな$KANBU[$teroid]に任命される。");
	$ttid = "blog/$p_id{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}$KANBU[$teroid]の任を解かれる。");
	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$k_p_k_a{$p_kunino{$f_id}}の新たな$KANBU[$teroid]に任命される。");
						}
		$d_id = $k_yakusyoku_id{$fk_id}[7];
		$k_yakusyoku_id{$fk_id}[7]=$f_id;
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","");
	if($k_yakusyoku_id{$fk_id}[4] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[4] = "";
	}elsif($k_yakusyoku_id{$fk_id}[5] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[5] = "";
	}elsif($k_yakusyoku_id{$fk_id}[6] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[6] = "";
	}elsif($k_yakusyoku_id{$fk_id}[10] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[10] = "";
	}elsif($k_yakusyoku_id{$fk_id}[8] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[8] = "";
	}elsif($k_yakusyoku_id{$fk_id}[9] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[9] = "";
	}elsif($k_yakusyoku_id{$fk_id}[11] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[11] = "";
	}elsif($k_yakusyoku_id{$fk_id}[12] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[12] = "";
	}elsif($k_yakusyoku_id{$fk_id}[13] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[13] = "";
	}elsif($k_yakusyoku_id{$fk_id}[14] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[14] = "";
	}elsif($k_yakusyoku_id{$fk_id}[19] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[19] = "";
	}elsif($k_yakusyoku_id{$fk_id}[20] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[20] = "";
	}elsif($k_yakusyoku_id{$fk_id}[21] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[21] = "";
	}elsif($k_yakusyoku_id{$fk_id}[22] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[22] = "";
	}elsif($k_yakusyoku_id{$fk_id}[23] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[23] = "";
	}elsif($k_yakusyoku_id{$fk_id}[24] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[24] = "";
	}elsif($k_yakusyoku_id{$fk_id}[25] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[25] = "";
	}elsif($k_yakusyoku_id{$fk_id}[26] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[26] = "";
	}elsif($k_yakusyoku_id{$fk_id}[27] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[27] = "";
	}
		$d_id = $f_id;
	&KUNI_KAKUDUKE("$d_id","$fk_id","");	
$nseikou18[$teroid] =0;$ntuu19[$teroid] =0;
$nhit[$teroid] = 0;$shit[$teroid]=1;

$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;

				}elsif($ytero[$teroid] and $k_yakusyoku_id{$fk_id}[7] eq $f_id){
$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;$shit[$teroid]=1;

				}
		}
		if($shit[4] < 1 and $sk < 1 and $jfi>129){
$teroid=4;
							$e_id=$k_yakusyoku_id{$fk_id}[4];
										if($p_kunino{$e_id} ne $p_kunino{$f_id}){
							$ytero[$teroid] = 0;
											if($p_id{$e_id} eq ""){
							$k_yakusyoku_id{$fk_id}[4]="";
											}
										}
				if($k_yakusyoku_id{$fk_id}[4] ne $f_id and ($ytero[$teroid] < 1 or $k_yakusyoku_id{$fk_id}[4] eq "")){
						if($k_yakusyoku_id{$fk_id}[4] eq ""){
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が$KANBU[$teroid]に任命される。");

	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$KANBU[$teroid]に任命される。");
						}else{
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が新たな$KANBU[$teroid]に任命される。");
	$ttid = "blog/$p_id{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}$KANBU[$teroid]の任を解かれる。");
	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$k_p_k_a{$p_kunino{$f_id}}の新たな$KANBU[$teroid]に任命される。");
						}
		$d_id = $k_yakusyoku_id{$fk_id}[4];
		$k_yakusyoku_id{$fk_id}[4]=$f_id;
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","");
	if($k_yakusyoku_id{$fk_id}[5] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[5] = "";
	}elsif($k_yakusyoku_id{$fk_id}[6] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[6] = "";
	}elsif($k_yakusyoku_id{$fk_id}[7] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[7] = "";
	}elsif($k_yakusyoku_id{$fk_id}[10] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[10] = "";
	}elsif($k_yakusyoku_id{$fk_id}[8] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[8] = "";
	}elsif($k_yakusyoku_id{$fk_id}[9] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[9] = "";
	}elsif($k_yakusyoku_id{$fk_id}[11] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[11] = "";
	}elsif($k_yakusyoku_id{$fk_id}[12] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[12] = "";
	}elsif($k_yakusyoku_id{$fk_id}[13] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[13] = "";
	}elsif($k_yakusyoku_id{$fk_id}[14] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[14] = "";
	}elsif($k_yakusyoku_id{$fk_id}[19] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[19] = "";
	}elsif($k_yakusyoku_id{$fk_id}[20] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[20] = "";
	}elsif($k_yakusyoku_id{$fk_id}[21] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[21] = "";
	}elsif($k_yakusyoku_id{$fk_id}[22] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[22] = "";
	}elsif($k_yakusyoku_id{$fk_id}[23] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[23] = "";
	}elsif($k_yakusyoku_id{$fk_id}[24] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[24] = "";
	}elsif($k_yakusyoku_id{$fk_id}[25] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[25] = "";
	}elsif($k_yakusyoku_id{$fk_id}[26] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[26] = "";
	}elsif($k_yakusyoku_id{$fk_id}[27] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[27] = "";
	}
		$d_id = $f_id;
	&KUNI_KAKUDUKE("$d_id","$fk_id","");	
$nseikou18[$teroid] =0;$ntuu19[$teroid] =0;
$nhit[$teroid] = 0;$shit[$teroid]=1;

$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;

				}elsif($ytero[$teroid] and $k_yakusyoku_id{$fk_id}[4] eq $f_id){
$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;$shit[$teroid]=1;

				}
		}
		if($shit[5] < 1 and $sk < 1 and $jfi>129){
$teroid=5;
							$e_id=$k_yakusyoku_id{$fk_id}[5];
										if($p_kunino{$e_id} ne $p_kunino{$f_id}){
							$ytero[$teroid] = 0;
											if($p_id{$e_id} eq ""){
							$k_yakusyoku_id{$fk_id}[5]="";
											}
										}
				if($k_yakusyoku_id{$fk_id}[5] ne $f_id and ($ytero[$teroid] < 1 or $k_yakusyoku_id{$fk_id}[5] eq "")){
						if($k_yakusyoku_id{$fk_id}[5] eq ""){
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が$KANBU[$teroid]に任命される。");

	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$KANBU[$teroid]に任命される。");
						}else{
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が新たな$KANBU[$teroid]に任命される。");
	$ttid = "blog/$p_id{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}$KANBU[$teroid]の任を解かれる。");
	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$k_p_k_a{$p_kunino{$f_id}}の新たな$KANBU[$teroid]に任命される。");
						}
		$d_id = $k_yakusyoku_id{$fk_id}[5];
		$k_yakusyoku_id{$fk_id}[5]=$f_id;
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","");
	if($k_yakusyoku_id{$fk_id}[4] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[4] = "";
	}elsif($k_yakusyoku_id{$fk_id}[6] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[6] = "";
	}elsif($k_yakusyoku_id{$fk_id}[7] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[7] = "";
	}elsif($k_yakusyoku_id{$fk_id}[10] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[10] = "";
	}elsif($k_yakusyoku_id{$fk_id}[8] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[8] = "";
	}elsif($k_yakusyoku_id{$fk_id}[9] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[9] = "";
	}elsif($k_yakusyoku_id{$fk_id}[11] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[11] = "";
	}elsif($k_yakusyoku_id{$fk_id}[12] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[12] = "";
	}elsif($k_yakusyoku_id{$fk_id}[13] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[13] = "";
	}elsif($k_yakusyoku_id{$fk_id}[14] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[14] = "";
	}elsif($k_yakusyoku_id{$fk_id}[19] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[19] = "";
	}elsif($k_yakusyoku_id{$fk_id}[20] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[20] = "";
	}elsif($k_yakusyoku_id{$fk_id}[21] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[21] = "";
	}elsif($k_yakusyoku_id{$fk_id}[22] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[22] = "";
	}elsif($k_yakusyoku_id{$fk_id}[23] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[23] = "";
	}elsif($k_yakusyoku_id{$fk_id}[24] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[24] = "";
	}elsif($k_yakusyoku_id{$fk_id}[25] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[25] = "";
	}elsif($k_yakusyoku_id{$fk_id}[26] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[26] = "";
	}elsif($k_yakusyoku_id{$fk_id}[27] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[27] = "";
	}
		$d_id = $f_id;
	&KUNI_KAKUDUKE("$d_id","$fk_id","");	
$nseikou18[$teroid] =0;$ntuu19[$teroid] =0;
$nhit[$teroid] = 0;$shit[$teroid]=1;

$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;

				}elsif($ytero[$teroid] and $k_yakusyoku_id{$fk_id}[5] eq $f_id){
$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;$shit[$teroid]=1;

				}
		}
		if($shit[6] < 1 and $sk < 1 and $jfi>129){
$teroid=6;
							$e_id=$k_yakusyoku_id{$fk_id}[6];
										if($p_kunino{$e_id} ne $p_kunino{$f_id}){
							$ytero[$teroid] = 0;
											if($p_id{$e_id} eq ""){
							$k_yakusyoku_id{$fk_id}[6]="";
											}
										}
				if($k_yakusyoku_id{$fk_id}[6] ne $f_id and ($ytero[$teroid] < 1 or $k_yakusyoku_id{$fk_id}[6] eq "")){
						if($k_yakusyoku_id{$fk_id}[6] eq ""){
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が$KANBU[$teroid]に任命される。");

	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$KANBU[$teroid]に任命される。");
						}else{
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が新たな$KANBU[$teroid]に任命される。");
	$ttid = "blog/$p_id{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}$KANBU[$teroid]の任を解かれる。");
	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$k_p_k_a{$p_kunino{$f_id}}の新たな$KANBU[$teroid]に任命される。");
							}
		$d_id = $k_yakusyoku_id{$fk_id}[6];
		$k_yakusyoku_id{$fk_id}[6]=$f_id;
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","");
	if($k_yakusyoku_id{$fk_id}[4] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[4] = "";
	}elsif($k_yakusyoku_id{$fk_id}[5] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[5] = "";
	}elsif($k_yakusyoku_id{$fk_id}[7] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[7] = "";
	}elsif($k_yakusyoku_id{$fk_id}[10] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[10] = "";
	}elsif($k_yakusyoku_id{$fk_id}[8] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[8] = "";
	}elsif($k_yakusyoku_id{$fk_id}[9] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[9] = "";
	}elsif($k_yakusyoku_id{$fk_id}[11] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[11] = "";
	}elsif($k_yakusyoku_id{$fk_id}[12] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[12] = "";
	}elsif($k_yakusyoku_id{$fk_id}[13] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[13] = "";
	}elsif($k_yakusyoku_id{$fk_id}[14] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[14] = "";
	}elsif($k_yakusyoku_id{$fk_id}[19] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[19] = "";
	}elsif($k_yakusyoku_id{$fk_id}[20] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[20] = "";
	}elsif($k_yakusyoku_id{$fk_id}[21] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[21] = "";
	}elsif($k_yakusyoku_id{$fk_id}[22] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[22] = "";
	}elsif($k_yakusyoku_id{$fk_id}[23] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[23] = "";
	}elsif($k_yakusyoku_id{$fk_id}[24] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[24] = "";
	}elsif($k_yakusyoku_id{$fk_id}[25] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[25] = "";
	}elsif($k_yakusyoku_id{$fk_id}[26] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[26] = "";
	}elsif($k_yakusyoku_id{$fk_id}[27] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[27] = "";
	}
		$d_id = $f_id;
	&KUNI_KAKUDUKE("$d_id","$fk_id","");
$nseikou18[$teroid] =0;$ntuu19[$teroid] =0;
$nhit[$teroid] = 0;$shit[$teroid]=1;

$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;

				}elsif($ytero[$teroid] and $k_yakusyoku_id{$fk_id}[6] eq $f_id){
$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;$shit[$teroid]=1;

				}
		}
		if($shit[8] < 1 and $sg < 1 and ($jfs>129 or $jfl>129)){
$teroid=8;
							$e_id=$k_yakusyoku_id{$fk_id}[8];
										if($p_kunino{$e_id} ne $p_kunino{$f_id}){
							$ytero[$teroid] = 0;
											if($p_id{$e_id} eq ""){
							$k_yakusyoku_id{$fk_id}[8]="";
											}
										}
				if($k_yakusyoku_id{$fk_id}[8] ne $f_id and ($ytero[$teroid] < 1 or $k_yakusyoku_id{$fk_id}[8] eq "")){
						if($k_yakusyoku_id{$fk_id}[8] eq ""){
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が$KANBU[$teroid]に任命される。");

	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$KANBU[$teroid]に任命される。");
						}else{
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が新たな$KANBU[$teroid]に任命される。");
	$ttid = "blog/$p_id{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}$KANBU[$teroid]の任を解かれる。");
	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$k_p_k_a{$p_kunino{$f_id}}の新たな$KANBU[$teroid]に任命される。");
						}
		$d_id = $k_yakusyoku_id{$fk_id}[8];
		$k_yakusyoku_id{$fk_id}[8]=$f_id;
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","");
	if($k_yakusyoku_id{$fk_id}[4] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[4] = "";
	}elsif($k_yakusyoku_id{$fk_id}[5] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[5] = "";
	}elsif($k_yakusyoku_id{$fk_id}[6] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[6] = "";
	}elsif($k_yakusyoku_id{$fk_id}[7] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[7] = "";
	}elsif($k_yakusyoku_id{$fk_id}[10] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[10] = "";
	}elsif($k_yakusyoku_id{$fk_id}[9] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[9] = "";
	}elsif($k_yakusyoku_id{$fk_id}[11] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[11] = "";
	}elsif($k_yakusyoku_id{$fk_id}[12] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[12] = "";
	}elsif($k_yakusyoku_id{$fk_id}[13] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[13] = "";
	}elsif($k_yakusyoku_id{$fk_id}[14] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[14] = "";
	}elsif($k_yakusyoku_id{$fk_id}[19] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[19] = "";
	}elsif($k_yakusyoku_id{$fk_id}[20] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[20] = "";
	}elsif($k_yakusyoku_id{$fk_id}[21] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[21] = "";
	}elsif($k_yakusyoku_id{$fk_id}[22] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[22] = "";
	}elsif($k_yakusyoku_id{$fk_id}[23] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[23] = "";
	}elsif($k_yakusyoku_id{$fk_id}[24] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[24] = "";
	}elsif($k_yakusyoku_id{$fk_id}[25] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[25] = "";
	}elsif($k_yakusyoku_id{$fk_id}[26] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[26] = "";
	}elsif($k_yakusyoku_id{$fk_id}[27] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[27] = "";
	}
		$d_id = $f_id;
	&KUNI_KAKUDUKE("$d_id","$fk_id","");	
$nseikou18[$teroid] =0;$ntuu19[$teroid] =0;
$nhit[$teroid] = 0;$shit[$teroid]=1;

$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;

				}elsif($ytero[$teroid] and $k_yakusyoku_id{$fk_id}[8] eq $f_id){
$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;$shit[$teroid]=1;

				}
		}
		if($shit[9] < 1 and $sg < 1 and ($jfs>129 or $jfl>129)){
$teroid=9;
							$e_id=$k_yakusyoku_id{$fk_id}[9];
										if($p_kunino{$e_id} ne $p_kunino{$f_id}){
							$ytero[$teroid] = 0;
											if($p_id{$e_id} eq ""){
							$k_yakusyoku_id{$fk_id}[9]="";
											}
										}
				if($k_yakusyoku_id{$fk_id}[9] ne $f_id and ($ytero[$teroid] < 1 or $k_yakusyoku_id{$fk_id}[9] eq "")){
						if($k_yakusyoku_id{$fk_id}[9] eq ""){
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が$KANBU[$teroid]に任命される。");

	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$KANBU[$teroid]に任命される。");
						}else{
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が新たな$KANBU[$teroid]に任命される。");
	$ttid = "blog/$p_id{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}$KANBU[$teroid]の任を解かれる。");
	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$k_p_k_a{$p_kunino{$f_id}}の新たな$KANBU[$teroid]に任命される。");
						}
		$d_id = $k_yakusyoku_id{$fk_id}[9];
		$k_yakusyoku_id{$fk_id}[9]=$f_id;
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","");
	if($k_yakusyoku_id{$fk_id}[4] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[4] = "";
	}elsif($k_yakusyoku_id{$fk_id}[5] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[5] = "";
	}elsif($k_yakusyoku_id{$fk_id}[6] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[6] = "";
	}elsif($k_yakusyoku_id{$fk_id}[7] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[7] = "";
	}elsif($k_yakusyoku_id{$fk_id}[10] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[10] = "";
	}elsif($k_yakusyoku_id{$fk_id}[8] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[8] = "";
	}elsif($k_yakusyoku_id{$fk_id}[11] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[11] = "";
	}elsif($k_yakusyoku_id{$fk_id}[12] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[12] = "";
	}elsif($k_yakusyoku_id{$fk_id}[13] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[13] = "";
	}elsif($k_yakusyoku_id{$fk_id}[14] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[14] = "";
	}elsif($k_yakusyoku_id{$fk_id}[19] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[19] = "";
	}elsif($k_yakusyoku_id{$fk_id}[20] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[20] = "";
	}elsif($k_yakusyoku_id{$fk_id}[21] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[21] = "";
	}elsif($k_yakusyoku_id{$fk_id}[22] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[22] = "";
	}elsif($k_yakusyoku_id{$fk_id}[23] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[23] = "";
	}elsif($k_yakusyoku_id{$fk_id}[24] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[24] = "";
	}elsif($k_yakusyoku_id{$fk_id}[25] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[25] = "";
	}elsif($k_yakusyoku_id{$fk_id}[26] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[26] = "";
	}elsif($k_yakusyoku_id{$fk_id}[27] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[27] = "";
	}
		$d_id = $f_id;
	&KUNI_KAKUDUKE("$d_id","$fk_id","");	
$nseikou18[$teroid] =0;$ntuu19[$teroid] =0;
$nhit[$teroid] = 0;$shit[$teroid]=1;

$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;

				}elsif($ytero[$teroid] and $k_yakusyoku_id{$fk_id}[9] eq $f_id){
$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;$shit[$teroid]=1;

				}
		}
		if($shit[10] < 1 and $sg < 1 and ($jfs>129 or $jfl>129)){
$teroid=10;
							$e_id=$k_yakusyoku_id{$fk_id}[10];
										if($p_kunino{$e_id} ne $p_kunino{$f_id}){
							$ytero[$teroid] = 0;
											if($p_id{$e_id} eq ""){
							$k_yakusyoku_id{$fk_id}[10]="";
											}
										}
				if($k_yakusyoku_id{$fk_id}[10] ne $f_id and ($ytero[$teroid] < 1 or $k_yakusyoku_id{$fk_id}[10] eq "")){
						if($k_yakusyoku_id{$fk_id}[10] eq ""){
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が$KANBU[$teroid]に任命される。");

	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$KANBU[$teroid]に任命される。");
						}else{
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が新たな$KANBU[$teroid]に任命される。");
	$ttid = "blog/$p_id{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}$KANBU[$teroid]の任を解かれる。");
	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$k_p_k_a{$p_kunino{$f_id}}の新たな$KANBU[$teroid]に任命される。");
						}
		$d_id = $k_yakusyoku_id{$fk_id}[10];
		$k_yakusyoku_id{$fk_id}[10]=$f_id;
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","");
	if($k_yakusyoku_id{$fk_id}[4] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[4] = "";
	}elsif($k_yakusyoku_id{$fk_id}[5] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[5] = "";
	}elsif($k_yakusyoku_id{$fk_id}[6] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[6] = "";
	}elsif($k_yakusyoku_id{$fk_id}[7] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[7] = "";
	}elsif($k_yakusyoku_id{$fk_id}[8] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[8] = "";
	}elsif($k_yakusyoku_id{$fk_id}[9] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[9] = "";
	}elsif($k_yakusyoku_id{$fk_id}[11] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[11] = "";
	}elsif($k_yakusyoku_id{$fk_id}[12] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[12] = "";
	}elsif($k_yakusyoku_id{$fk_id}[13] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[13] = "";
	}elsif($k_yakusyoku_id{$fk_id}[14] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[14] = "";
	}elsif($k_yakusyoku_id{$fk_id}[19] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[19] = "";
	}elsif($k_yakusyoku_id{$fk_id}[20] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[20] = "";
	}elsif($k_yakusyoku_id{$fk_id}[21] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[21] = "";
	}elsif($k_yakusyoku_id{$fk_id}[22] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[22] = "";
	}elsif($k_yakusyoku_id{$fk_id}[23] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[23] = "";
	}elsif($k_yakusyoku_id{$fk_id}[24] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[24] = "";
	}elsif($k_yakusyoku_id{$fk_id}[25] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[25] = "";
	}elsif($k_yakusyoku_id{$fk_id}[26] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[26] = "";
	}elsif($k_yakusyoku_id{$fk_id}[27] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[27] = "";
	}
		$d_id = $f_id;
	&KUNI_KAKUDUKE("$d_id","$fk_id","");	
$nseikou18[$teroid] =0;$ntuu19[$teroid] =0;
$nhit[$teroid] = 0;$shit[$teroid]=1;

$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;

				}elsif($ytero[$teroid] and $k_yakusyoku_id{$fk_id}[10] eq $f_id){
$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;$shit[$teroid]=1;

				}
		}
		if($shit[11] < 1 and $sg < 1 and ($jfs>129 or $jfl>129)){
$teroid=11;
							$e_id=$k_yakusyoku_id{$fk_id}[11];
										if($p_kunino{$e_id} ne $p_kunino{$f_id}){
							$ytero[$teroid] = 0;
											if($p_id{$e_id} eq ""){
							$k_yakusyoku_id{$fk_id}[11]="";
											}
										}
				if($k_yakusyoku_id{$fk_id}[11] ne $f_id and ($ytero[$teroid] < 1 or $k_yakusyoku_id{$fk_id}[11] eq "")){
						if($k_yakusyoku_id{$fk_id}[11] eq ""){
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が$KANBU[$teroid]に任命される。");

	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$KANBU[$teroid]に任命される。");
						}else{
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が新たな$KANBU[$teroid]に任命される。");
	$ttid = "blog/$p_id{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}$KANBU[$teroid]の任を解かれる。");
	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$k_p_k_a{$p_kunino{$f_id}}の新たな$KANBU[$teroid]に任命される。");
						}
		$d_id = $k_yakusyoku_id{$fk_id}[11];
		$k_yakusyoku_id{$fk_id}[11]=$f_id;
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","");
	if($k_yakusyoku_id{$fk_id}[4] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[4] = "";
	}elsif($k_yakusyoku_id{$fk_id}[5] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[5] = "";
	}elsif($k_yakusyoku_id{$fk_id}[6] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[6] = "";
	}elsif($k_yakusyoku_id{$fk_id}[7] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[7] = "";
	}elsif($k_yakusyoku_id{$fk_id}[10] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[10] = "";
	}elsif($k_yakusyoku_id{$fk_id}[8] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[8] = "";
	}elsif($k_yakusyoku_id{$fk_id}[9] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[9] = "";
	}elsif($k_yakusyoku_id{$fk_id}[12] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[12] = "";
	}elsif($k_yakusyoku_id{$fk_id}[13] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[13] = "";
	}elsif($k_yakusyoku_id{$fk_id}[14] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[14] = "";
	}elsif($k_yakusyoku_id{$fk_id}[19] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[19] = "";
	}elsif($k_yakusyoku_id{$fk_id}[20] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[20] = "";
	}elsif($k_yakusyoku_id{$fk_id}[21] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[21] = "";
	}elsif($k_yakusyoku_id{$fk_id}[22] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[22] = "";
	}elsif($k_yakusyoku_id{$fk_id}[23] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[23] = "";
	}elsif($k_yakusyoku_id{$fk_id}[24] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[24] = "";
	}elsif($k_yakusyoku_id{$fk_id}[25] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[25] = "";
	}elsif($k_yakusyoku_id{$fk_id}[26] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[26] = "";
	}elsif($k_yakusyoku_id{$fk_id}[27] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[27] = "";
	}
		$d_id = $f_id;
	&KUNI_KAKUDUKE("$d_id","$fk_id","");	
$nseikou18[$teroid] =0;$ntuu19[$teroid] =0;
$nhit[$teroid] = 0;$shit[$teroid]=1;

$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;

				}elsif($ytero[$teroid] and $k_yakusyoku_id{$fk_id}[11] eq $f_id){
$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;$shit[$teroid]=1;

				}
		}
		if($shit[12] < 1 and $sg < 1 and ($jfs>129 or $jfl>129)){
$teroid=12;
							$e_id=$k_yakusyoku_id{$fk_id}[12];
										if($p_kunino{$e_id} ne $p_kunino{$f_id}){
							$ytero[$teroid] = 0;
											if($p_id{$e_id} eq ""){
							$k_yakusyoku_id{$fk_id}[12]="";
											}
										}
				if($k_yakusyoku_id{$fk_id}[12] ne $f_id and ($ytero[$teroid] < 1 or $k_yakusyoku_id{$fk_id}[12] eq "")){
						if($k_yakusyoku_id{$fk_id}[12] eq ""){
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が$KANBU[$teroid]に任命される。");

	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$KANBU[$teroid]に任命される。");
						}else{
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が新たな$KANBU[$teroid]に任命される。");
	$ttid = "blog/$p_id{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}$KANBU[$teroid]の任を解かれる。");
	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$k_p_k_a{$p_kunino{$f_id}}の新たな$KANBU[$teroid]に任命される。");
						}
		$d_id = $k_yakusyoku_id{$fk_id}[12];
		$k_yakusyoku_id{$fk_id}[12]=$f_id;
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","");
	if($k_yakusyoku_id{$fk_id}[4] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[4] = "";
	}elsif($k_yakusyoku_id{$fk_id}[5] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[5] = "";
	}elsif($k_yakusyoku_id{$fk_id}[6] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[6] = "";
	}elsif($k_yakusyoku_id{$fk_id}[7] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[7] = "";
	}elsif($k_yakusyoku_id{$fk_id}[10] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[10] = "";
	}elsif($k_yakusyoku_id{$fk_id}[8] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[8] = "";
	}elsif($k_yakusyoku_id{$fk_id}[9] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[9] = "";
	}elsif($k_yakusyoku_id{$fk_id}[11] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[11] = "";
	}elsif($k_yakusyoku_id{$fk_id}[13] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[13] = "";
	}elsif($k_yakusyoku_id{$fk_id}[14] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[14] = "";
	}elsif($k_yakusyoku_id{$fk_id}[19] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[19] = "";
	}elsif($k_yakusyoku_id{$fk_id}[20] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[20] = "";
	}elsif($k_yakusyoku_id{$fk_id}[21] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[21] = "";
	}elsif($k_yakusyoku_id{$fk_id}[22] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[22] = "";
	}elsif($k_yakusyoku_id{$fk_id}[23] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[23] = "";
	}elsif($k_yakusyoku_id{$fk_id}[24] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[24] = "";
	}elsif($k_yakusyoku_id{$fk_id}[25] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[25] = "";
	}elsif($k_yakusyoku_id{$fk_id}[26] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[26] = "";
	}elsif($k_yakusyoku_id{$fk_id}[27] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[27] = "";
	}
		$d_id = $f_id;
	&KUNI_KAKUDUKE("$d_id","$fk_id","");	
$nseikou18[$teroid] =0;$ntuu19[$teroid] =0;
$nhit[$teroid] = 0;$shit[$teroid]=1;

$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;

				}elsif($ytero[$teroid] and $k_yakusyoku_id{$fk_id}[12] eq $f_id){
$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;$shit[$teroid]=1;

				}
		}
		if($shit[13] < 1 and $sg < 1 and ($jfs>129 or $jfl>129)){
$teroid=13;
							$e_id=$k_yakusyoku_id{$fk_id}[13];
										if($p_kunino{$e_id} ne $p_kunino{$f_id}){
							$ytero[$teroid] = 0;
											if($p_id{$e_id} eq ""){
							$k_yakusyoku_id{$fk_id}[13]="";
											}
										}
				if($k_yakusyoku_id{$fk_id}[13] ne $f_id and ($ytero[$teroid] < 1 or $k_yakusyoku_id{$fk_id}[13] eq "")){
						if($k_yakusyoku_id{$fk_id}[13] eq ""){
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が$KANBU[$teroid]に任命される。");

	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$KANBU[$teroid]に任命される。");
						}else{
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が新たな$KANBU[$teroid]に任命される。");
	$ttid = "blog/$p_id{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}$KANBU[$teroid]の任を解かれる。");
	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$k_p_k_a{$p_kunino{$f_id}}の新たな$KANBU[$teroid]に任命される。");
						}
		$d_id = $k_yakusyoku_id{$fk_id}[13];
		$k_yakusyoku_id{$fk_id}[13]=$f_id;
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","");
	if($k_yakusyoku_id{$fk_id}[4] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[4] = "";
	}elsif($k_yakusyoku_id{$fk_id}[5] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[5] = "";
	}elsif($k_yakusyoku_id{$fk_id}[6] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[6] = "";
	}elsif($k_yakusyoku_id{$fk_id}[7] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[7] = "";
	}elsif($k_yakusyoku_id{$fk_id}[10] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[10] = "";
	}elsif($k_yakusyoku_id{$fk_id}[8] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[8] = "";
	}elsif($k_yakusyoku_id{$fk_id}[9] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[9] = "";
	}elsif($k_yakusyoku_id{$fk_id}[11] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[11] = "";
	}elsif($k_yakusyoku_id{$fk_id}[12] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[12] = "";
	}elsif($k_yakusyoku_id{$fk_id}[14] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[14] = "";
	}elsif($k_yakusyoku_id{$fk_id}[19] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[19] = "";
	}elsif($k_yakusyoku_id{$fk_id}[20] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[20] = "";
	}elsif($k_yakusyoku_id{$fk_id}[21] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[21] = "";
	}elsif($k_yakusyoku_id{$fk_id}[22] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[22] = "";
	}elsif($k_yakusyoku_id{$fk_id}[23] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[23] = "";
	}elsif($k_yakusyoku_id{$fk_id}[24] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[24] = "";
	}elsif($k_yakusyoku_id{$fk_id}[25] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[25] = "";
	}elsif($k_yakusyoku_id{$fk_id}[26] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[26] = "";
	}elsif($k_yakusyoku_id{$fk_id}[27] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[27] = "";
	}
		$d_id = $f_id;
	&KUNI_KAKUDUKE("$d_id","$fk_id","");	
$nseikou18[$teroid] =0;$ntuu19[$teroid] =0;
$nhit[$teroid] = 0;$shit[$teroid]=1;

$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;

				}elsif($ytero[$teroid] and $k_yakusyoku_id{$fk_id}[13] eq $f_id){
$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;$shit[$teroid]=1;

				}
		}
		if($shit[14] < 1 and $sg < 1 and ($jfs>129 or $jfl>129)){
$teroid=14;
							$e_id=$k_yakusyoku_id{$fk_id}[14];
										if($p_kunino{$e_id} ne $p_kunino{$f_id}){
							$ytero[$teroid] = 0;
											if($p_id{$e_id} eq ""){
							$k_yakusyoku_id{$fk_id}[14]="";
											}
										}
				if($k_yakusyoku_id{$fk_id}[14] ne $f_id and ($ytero[$teroid] < 1 or $k_yakusyoku_id{$fk_id}[14] eq "")){
						if($k_yakusyoku_id{$fk_id}[14] eq ""){
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が$KANBU[$teroid]に任命される。");

	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$KANBU[$teroid]に任命される。");
						}else{
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が新たな$KANBU[$teroid]に任命される。");
	$ttid = "blog/$p_id{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}$KANBU[$teroid]の任を解かれる。");
	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$k_p_k_a{$p_kunino{$f_id}}の新たな$KANBU[$teroid]に任命される。");
						}
		$d_id = $k_yakusyoku_id{$fk_id}[14];
		$k_yakusyoku_id{$fk_id}[14]=$f_id;
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","");
	if($k_yakusyoku_id{$fk_id}[4] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[4] = "";
	}elsif($k_yakusyoku_id{$fk_id}[5] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[5] = "";
	}elsif($k_yakusyoku_id{$fk_id}[6] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[6] = "";
	}elsif($k_yakusyoku_id{$fk_id}[7] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[7] = "";
	}elsif($k_yakusyoku_id{$fk_id}[10] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[10] = "";
	}elsif($k_yakusyoku_id{$fk_id}[8] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[8] = "";
	}elsif($k_yakusyoku_id{$fk_id}[9] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[9] = "";
	}elsif($k_yakusyoku_id{$fk_id}[11] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[11] = "";
	}elsif($k_yakusyoku_id{$fk_id}[12] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[12] = "";
	}elsif($k_yakusyoku_id{$fk_id}[13] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[13] = "";
	}elsif($k_yakusyoku_id{$fk_id}[19] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[19] = "";
	}elsif($k_yakusyoku_id{$fk_id}[20] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[20] = "";
	}elsif($k_yakusyoku_id{$fk_id}[21] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[21] = "";
	}elsif($k_yakusyoku_id{$fk_id}[22] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[22] = "";
	}elsif($k_yakusyoku_id{$fk_id}[23] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[23] = "";
	}elsif($k_yakusyoku_id{$fk_id}[24] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[24] = "";
	}elsif($k_yakusyoku_id{$fk_id}[25] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[25] = "";
	}elsif($k_yakusyoku_id{$fk_id}[26] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[26] = "";
	}elsif($k_yakusyoku_id{$fk_id}[27] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[27] = "";
	}
		$d_id = $f_id;
	&KUNI_KAKUDUKE("$d_id","$fk_id","");	
$nseikou18[$teroid] =0;$ntuu19[$teroid] =0;
$nhit[$teroid] = 0;$shit[$teroid]=1;

$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;

				}elsif($ytero[$teroid] and $k_yakusyoku_id{$fk_id}[14] eq $f_id){
$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;$shit[$teroid]=1;

				}
		}
		if($shit[19] < 1 and $sg < 1){
$teroid=19;
							$e_id=$k_yakusyoku_id{$fk_id}[19];
										if($p_kunino{$e_id} ne $p_kunino{$f_id}){
							$ytero[$teroid] = 0;
											if($p_id{$e_id} eq ""){
							$k_yakusyoku_id{$fk_id}[19]="";
											}
										}
				if($k_yakusyoku_id{$fk_id}[19] ne $f_id and ($ytero[$teroid] < 1 or $k_yakusyoku_id{$fk_id}[19] eq "")){
						if($k_yakusyoku_id{$fk_id}[19] eq ""){
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が$KANBU[$teroid]に任命される。");

	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$KANBU[$teroid]に任命される。");
						}else{
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が新たな$KANBU[$teroid]に任命される。");
	$ttid = "blog/$p_id{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}$KANBU[$teroid]の任を解かれる。");
	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$k_p_k_a{$p_kunino{$f_id}}の新たな$KANBU[$teroid]に任命される。");
						}
		$d_id = $k_yakusyoku_id{$fk_id}[19];
		$k_yakusyoku_id{$fk_id}[19]=$f_id;
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","");
	if($k_yakusyoku_id{$fk_id}[4] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[4] = "";
	}elsif($k_yakusyoku_id{$fk_id}[5] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[5] = "";
	}elsif($k_yakusyoku_id{$fk_id}[6] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[6] = "";
	}elsif($k_yakusyoku_id{$fk_id}[7] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[7] = "";
	}elsif($k_yakusyoku_id{$fk_id}[10] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[10] = "";
	}elsif($k_yakusyoku_id{$fk_id}[8] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[8] = "";
	}elsif($k_yakusyoku_id{$fk_id}[9] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[9] = "";
	}elsif($k_yakusyoku_id{$fk_id}[11] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[11] = "";
	}elsif($k_yakusyoku_id{$fk_id}[12] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[12] = "";
	}elsif($k_yakusyoku_id{$fk_id}[13] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[13] = "";
	}elsif($k_yakusyoku_id{$fk_id}[14] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[14] = "";
	}elsif($k_yakusyoku_id{$fk_id}[20] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[20] = "";
	}elsif($k_yakusyoku_id{$fk_id}[21] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[21] = "";
	}elsif($k_yakusyoku_id{$fk_id}[22] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[22] = "";
	}elsif($k_yakusyoku_id{$fk_id}[23] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[23] = "";
	}elsif($k_yakusyoku_id{$fk_id}[24] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[24] = "";
	}elsif($k_yakusyoku_id{$fk_id}[25] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[25] = "";
	}elsif($k_yakusyoku_id{$fk_id}[26] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[26] = "";
	}elsif($k_yakusyoku_id{$fk_id}[27] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[27] = "";
	}
		$d_id = $f_id;
	&KUNI_KAKUDUKE("$d_id","$fk_id","");	
$nseikou18[$teroid] =0;$ntuu19[$teroid] =0;
$nhit[$teroid] = 0;$shit[$teroid]=1;

$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;

				}elsif($ytero[$teroid] and $k_yakusyoku_id{$fk_id}[19] eq $f_id){
$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;$shit[$teroid]=1;

				}
		}
		if($shit[20] < 1 and $sg < 1){
$teroid=20;
							$e_id=$k_yakusyoku_id{$fk_id}[20];
										if($p_kunino{$e_id} ne $p_kunino{$f_id}){
							$ytero[$teroid] = 0;
											if($p_id{$e_id} eq ""){
							$k_yakusyoku_id{$fk_id}[20]="";
											}
										}
				if($k_yakusyoku_id{$fk_id}[20] ne $f_id and ($ytero[$teroid] < 1 or $k_yakusyoku_id{$fk_id}[20] eq "")){
						if($k_yakusyoku_id{$fk_id}[20] eq ""){
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が$KANBU[$teroid]に任命される。");

	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$KANBU[$teroid]に任命される。");
						}else{
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が新たな$KANBU[$teroid]に任命される。");
	$ttid = "blog/$p_id{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}$KANBU[$teroid]の任を解かれる。");
	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$k_p_k_a{$p_kunino{$f_id}}の新たな$KANBU[$teroid]に任命される。");
						}
		$d_id = $k_yakusyoku_id{$fk_id}[20];
		$k_yakusyoku_id{$fk_id}[20]=$f_id;
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","");
	if($k_yakusyoku_id{$fk_id}[4] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[4] = "";
	}elsif($k_yakusyoku_id{$fk_id}[5] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[5] = "";
	}elsif($k_yakusyoku_id{$fk_id}[6] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[6] = "";
	}elsif($k_yakusyoku_id{$fk_id}[7] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[7] = "";
	}elsif($k_yakusyoku_id{$fk_id}[10] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[10] = "";
	}elsif($k_yakusyoku_id{$fk_id}[8] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[8] = "";
	}elsif($k_yakusyoku_id{$fk_id}[9] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[9] = "";
	}elsif($k_yakusyoku_id{$fk_id}[11] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[11] = "";
	}elsif($k_yakusyoku_id{$fk_id}[12] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[12] = "";
	}elsif($k_yakusyoku_id{$fk_id}[13] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[13] = "";
	}elsif($k_yakusyoku_id{$fk_id}[14] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[14] = "";
	}elsif($k_yakusyoku_id{$fk_id}[19] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[19] = "";
	}elsif($k_yakusyoku_id{$fk_id}[21] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[21] = "";
	}elsif($k_yakusyoku_id{$fk_id}[22] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[22] = "";
	}elsif($k_yakusyoku_id{$fk_id}[23] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[23] = "";
	}elsif($k_yakusyoku_id{$fk_id}[24] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[24] = "";
	}elsif($k_yakusyoku_id{$fk_id}[25] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[25] = "";
	}elsif($k_yakusyoku_id{$fk_id}[26] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[26] = "";
	}elsif($k_yakusyoku_id{$fk_id}[27] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[27] = "";
	}
		$d_id = $f_id;
	&KUNI_KAKUDUKE("$d_id","$fk_id","");	
$nseikou18[$teroid] =0;$ntuu19[$teroid] =0;
$nhit[$teroid] = 0;$shit[$teroid]=1;

$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;

				}elsif($ytero[$teroid] and $k_yakusyoku_id{$fk_id}[20] eq $f_id){
$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;$shit[$teroid]=1;

				}
		}
		if($shit[21] < 1 and $sg < 1){
$teroid=21;
							$e_id=$k_yakusyoku_id{$fk_id}[21];
										if($p_kunino{$e_id} ne $p_kunino{$f_id}){
							$ytero[$teroid] = 0;
											if($p_id{$e_id} eq ""){
							$k_yakusyoku_id{$fk_id}[21]="";
											}
										}
				if($k_yakusyoku_id{$fk_id}[21] ne $f_id and ($ytero[$teroid] < 1 or $k_yakusyoku_id{$fk_id}[21] eq "")){
						if($k_yakusyoku_id{$fk_id}[21] eq ""){
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が$KANBU[$teroid]に任命される。");

	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$KANBU[$teroid]に任命される。");
						}else{
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が新たな$KANBU[$teroid]に任命される。");
	$ttid = "blog/$p_id{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}$KANBU[$teroid]の任を解かれる。");
	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$k_p_k_a{$p_kunino{$f_id}}の新たな$KANBU[$teroid]に任命される。");
						}
		$d_id = $k_yakusyoku_id{$fk_id}[21];
		$k_yakusyoku_id{$fk_id}[21]=$f_id;
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","");
	if($k_yakusyoku_id{$fk_id}[4] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[4] = "";
	}elsif($k_yakusyoku_id{$fk_id}[5] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[5] = "";
	}elsif($k_yakusyoku_id{$fk_id}[6] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[6] = "";
	}elsif($k_yakusyoku_id{$fk_id}[7] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[7] = "";
	}elsif($k_yakusyoku_id{$fk_id}[10] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[10] = "";
	}elsif($k_yakusyoku_id{$fk_id}[8] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[8] = "";
	}elsif($k_yakusyoku_id{$fk_id}[9] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[9] = "";
	}elsif($k_yakusyoku_id{$fk_id}[11] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[11] = "";
	}elsif($k_yakusyoku_id{$fk_id}[12] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[12] = "";
	}elsif($k_yakusyoku_id{$fk_id}[13] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[13] = "";
	}elsif($k_yakusyoku_id{$fk_id}[14] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[14] = "";
	}elsif($k_yakusyoku_id{$fk_id}[19] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[19] = "";
	}elsif($k_yakusyoku_id{$fk_id}[20] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[20] = "";
	}elsif($k_yakusyoku_id{$fk_id}[22] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[22] = "";
	}elsif($k_yakusyoku_id{$fk_id}[23] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[23] = "";
	}elsif($k_yakusyoku_id{$fk_id}[24] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[24] = "";
	}elsif($k_yakusyoku_id{$fk_id}[25] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[25] = "";
	}elsif($k_yakusyoku_id{$fk_id}[26] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[26] = "";
	}elsif($k_yakusyoku_id{$fk_id}[27] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[27] = "";
	}
		$d_id = $f_id;
	&KUNI_KAKUDUKE("$d_id","$fk_id","");	
$nseikou18[$teroid] =0;$ntuu19[$teroid] =0;
$nhit[$teroid] = 0;$shit[$teroid]=1;

$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;

				}elsif($ytero[$teroid] and $k_yakusyoku_id{$fk_id}[21] eq $f_id){
$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;$shit[$teroid]=1;

				}
		}
		if($shit[22] < 1 and $sg < 1){
$teroid=22;
							$e_id=$k_yakusyoku_id{$fk_id}[22];
										if($p_kunino{$e_id} ne $p_kunino{$f_id}){
							$ytero[$teroid] = 0;
											if($p_id{$e_id} eq ""){
							$k_yakusyoku_id{$fk_id}[22]="";
											}
										}
				if($k_yakusyoku_id{$fk_id}[22] ne $f_id and ($ytero[$teroid] < 1 or $k_yakusyoku_id{$fk_id}[22] eq "")){
						if($k_yakusyoku_id{$fk_id}[22] eq ""){
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が$KANBU[$teroid]に任命される。");

	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$KANBU[$teroid]に任命される。");
						}else{
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が新たな$KANBU[$teroid]に任命される。");
	$ttid = "blog/$p_id{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}$KANBU[$teroid]の任を解かれる。");
	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$k_p_k_a{$p_kunino{$f_id}}の新たな$KANBU[$teroid]に任命される。");
						}
		$d_id = $k_yakusyoku_id{$fk_id}[22];
		$k_yakusyoku_id{$fk_id}[22]=$f_id;
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","");
	if($k_yakusyoku_id{$fk_id}[4] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[4] = "";
	}elsif($k_yakusyoku_id{$fk_id}[5] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[5] = "";
	}elsif($k_yakusyoku_id{$fk_id}[6] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[6] = "";
	}elsif($k_yakusyoku_id{$fk_id}[7] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[7] = "";
	}elsif($k_yakusyoku_id{$fk_id}[10] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[10] = "";
	}elsif($k_yakusyoku_id{$fk_id}[8] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[8] = "";
	}elsif($k_yakusyoku_id{$fk_id}[9] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[9] = "";
	}elsif($k_yakusyoku_id{$fk_id}[11] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[11] = "";
	}elsif($k_yakusyoku_id{$fk_id}[12] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[12] = "";
	}elsif($k_yakusyoku_id{$fk_id}[13] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[13] = "";
	}elsif($k_yakusyoku_id{$fk_id}[14] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[14] = "";
	}elsif($k_yakusyoku_id{$fk_id}[19] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[19] = "";
	}elsif($k_yakusyoku_id{$fk_id}[20] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[20] = "";
	}elsif($k_yakusyoku_id{$fk_id}[21] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[21] = "";
	}elsif($k_yakusyoku_id{$fk_id}[23] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[23] = "";
	}elsif($k_yakusyoku_id{$fk_id}[24] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[24] = "";
	}elsif($k_yakusyoku_id{$fk_id}[25] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[25] = "";
	}elsif($k_yakusyoku_id{$fk_id}[26] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[26] = "";
	}elsif($k_yakusyoku_id{$fk_id}[27] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[27] = "";
	}
		$d_id = $f_id;
	&KUNI_KAKUDUKE("$d_id","$fk_id","");	
$nseikou18[$teroid] =0;$ntuu19[$teroid] =0;
$nhit[$teroid] = 0;$shit[$teroid]=1;

$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;

				}elsif($ytero[$teroid] and $k_yakusyoku_id{$fk_id}[22] eq $f_id){
$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;$shit[$teroid]=1;

				}
		}
		if($shit[23] < 1 and $sg < 1){
$teroid=23;
							$e_id=$k_yakusyoku_id{$fk_id}[23];
										if($p_kunino{$e_id} ne $p_kunino{$f_id}){
							$ytero[$teroid] = 0;
											if($p_id{$e_id} eq ""){
							$k_yakusyoku_id{$fk_id}[23]="";
											}
										}
				if($k_yakusyoku_id{$fk_id}[23] ne $f_id and ($ytero[$teroid] < 1 or $k_yakusyoku_id{$fk_id}[23] eq "")){
						if($k_yakusyoku_id{$fk_id}[23] eq ""){
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が$KANBU[$teroid]に任命される。");

	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$KANBU[$teroid]に任命される。");
						}else{
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が新たな$KANBU[$teroid]に任命される。");
	$ttid = "blog/$p_id{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}$KANBU[$teroid]の任を解かれる。");
	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$k_p_k_a{$p_kunino{$f_id}}の新たな$KANBU[$teroid]に任命される。");
						}
		$d_id = $k_yakusyoku_id{$fk_id}[23];
		$k_yakusyoku_id{$fk_id}[23]=$f_id;
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","");
	if($k_yakusyoku_id{$fk_id}[4] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[4] = "";
	}elsif($k_yakusyoku_id{$fk_id}[5] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[5] = "";
	}elsif($k_yakusyoku_id{$fk_id}[6] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[6] = "";
	}elsif($k_yakusyoku_id{$fk_id}[7] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[7] = "";
	}elsif($k_yakusyoku_id{$fk_id}[10] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[10] = "";
	}elsif($k_yakusyoku_id{$fk_id}[8] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[8] = "";
	}elsif($k_yakusyoku_id{$fk_id}[9] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[9] = "";
	}elsif($k_yakusyoku_id{$fk_id}[11] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[11] = "";
	}elsif($k_yakusyoku_id{$fk_id}[12] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[12] = "";
	}elsif($k_yakusyoku_id{$fk_id}[13] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[13] = "";
	}elsif($k_yakusyoku_id{$fk_id}[14] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[14] = "";
	}elsif($k_yakusyoku_id{$fk_id}[19] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[19] = "";
	}elsif($k_yakusyoku_id{$fk_id}[20] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[20] = "";
	}elsif($k_yakusyoku_id{$fk_id}[21] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[21] = "";
	}elsif($k_yakusyoku_id{$fk_id}[22] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[22] = "";
	}elsif($k_yakusyoku_id{$fk_id}[24] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[24] = "";
	}elsif($k_yakusyoku_id{$fk_id}[25] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[25] = "";
	}elsif($k_yakusyoku_id{$fk_id}[26] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[26] = "";
	}elsif($k_yakusyoku_id{$fk_id}[27] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[27] = "";
	}
		$d_id = $f_id;
	&KUNI_KAKUDUKE("$d_id","$fk_id","");	
$nseikou18[$teroid] =0;$ntuu19[$teroid] =0;
$nhit[$teroid] = 0;$shit[$teroid]=1;

$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;

				}elsif($ytero[$teroid] and $k_yakusyoku_id{$fk_id}[23] eq $f_id){
$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;$shit[$teroid]=1;

				}
		}
		if($shit[24] < 1 and $sg < 1){
$teroid=24;
							$e_id=$k_yakusyoku_id{$fk_id}[24];
										if($p_kunino{$e_id} ne $p_kunino{$f_id}){
							$ytero[$teroid] = 0;
											if($p_id{$e_id} eq ""){
							$k_yakusyoku_id{$fk_id}[24]="";
											}
										}
				if($k_yakusyoku_id{$fk_id}[24] ne $f_id and ($ytero[$teroid] < 1 or $k_yakusyoku_id{$fk_id}[24] eq "")){
						if($k_yakusyoku_id{$fk_id}[24] eq ""){
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が$KANBU[$teroid]に任命される。");

	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$KANBU[$teroid]に任命される。");
						}else{
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が新たな$KANBU[$teroid]に任命される。");
	$ttid = "blog/$p_id{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}$KANBU[$teroid]の任を解かれる。");
	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$k_p_k_a{$p_kunino{$f_id}}の新たな$KANBU[$teroid]に任命される。");
						}
		$d_id = $k_yakusyoku_id{$fk_id}[24];
		$k_yakusyoku_id{$fk_id}[24]=$f_id;
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","");
		$d_id = $f_id;
	if($k_yakusyoku_id{$fk_id}[4] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[4] = "";
	}elsif($k_yakusyoku_id{$fk_id}[5] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[5] = "";
	}elsif($k_yakusyoku_id{$fk_id}[6] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[6] = "";
	}elsif($k_yakusyoku_id{$fk_id}[7] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[7] = "";
	}elsif($k_yakusyoku_id{$fk_id}[10] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[10] = "";
	}elsif($k_yakusyoku_id{$fk_id}[8] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[8] = "";
	}elsif($k_yakusyoku_id{$fk_id}[9] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[9] = "";
	}elsif($k_yakusyoku_id{$fk_id}[11] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[11] = "";
	}elsif($k_yakusyoku_id{$fk_id}[12] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[12] = "";
	}elsif($k_yakusyoku_id{$fk_id}[13] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[13] = "";
	}elsif($k_yakusyoku_id{$fk_id}[14] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[14] = "";
	}elsif($k_yakusyoku_id{$fk_id}[19] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[19] = "";
	}elsif($k_yakusyoku_id{$fk_id}[20] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[20] = "";
	}elsif($k_yakusyoku_id{$fk_id}[21] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[21] = "";
	}elsif($k_yakusyoku_id{$fk_id}[22] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[22] = "";
	}elsif($k_yakusyoku_id{$fk_id}[23] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[23] = "";
	}elsif($k_yakusyoku_id{$fk_id}[25] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[25] = "";
	}elsif($k_yakusyoku_id{$fk_id}[26] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[26] = "";
	}elsif($k_yakusyoku_id{$fk_id}[27] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[27] = "";
	}
	&KUNI_KAKUDUKE("$d_id","$fk_id","");	
$nseikou18[$teroid] =0;$ntuu19[$teroid] =0;
$nhit[$teroid] = 0;$shit[$teroid]=1;

$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;

				}elsif($ytero[$teroid] and $k_yakusyoku_id{$fk_id}[24] eq $f_id){
$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;$shit[$teroid]=1;

				}
		}
		if($shit[25] < 1 and $sg < 1){
$teroid=25;
							$e_id=$k_yakusyoku_id{$fk_id}[25];
										if($p_kunino{$e_id} ne $p_kunino{$f_id}){
							$ytero[$teroid] = 0;
											if($p_id{$e_id} eq ""){
							$k_yakusyoku_id{$fk_id}[25]="";
											}
										}
				if($k_yakusyoku_id{$fk_id}[25] ne $f_id and ($ytero[$teroid] < 1 or $k_yakusyoku_id{$fk_id}[25] eq "")){
						if($k_yakusyoku_id{$fk_id}[25] eq ""){
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が$KANBU[$teroid]に任命される。");

	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$KANBU[$teroid]に任命される。");
						}else{
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が新たな$KANBU[$teroid]に任命される。");
	$ttid = "blog/$p_id{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}$KANBU[$teroid]の任を解かれる。");
	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$k_p_k_a{$p_kunino{$f_id}}の新たな$KANBU[$teroid]に任命される。");
						}
		$d_id = $k_yakusyoku_id{$fk_id}[25];
		$k_yakusyoku_id{$fk_id}[25]=$f_id;
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","");
	if($k_yakusyoku_id{$fk_id}[4] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[4] = "";
	}elsif($k_yakusyoku_id{$fk_id}[5] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[5] = "";
	}elsif($k_yakusyoku_id{$fk_id}[6] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[6] = "";
	}elsif($k_yakusyoku_id{$fk_id}[7] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[7] = "";
	}elsif($k_yakusyoku_id{$fk_id}[10] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[10] = "";
	}elsif($k_yakusyoku_id{$fk_id}[8] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[8] = "";
	}elsif($k_yakusyoku_id{$fk_id}[9] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[9] = "";
	}elsif($k_yakusyoku_id{$fk_id}[11] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[11] = "";
	}elsif($k_yakusyoku_id{$fk_id}[12] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[12] = "";
	}elsif($k_yakusyoku_id{$fk_id}[13] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[13] = "";
	}elsif($k_yakusyoku_id{$fk_id}[14] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[14] = "";
	}elsif($k_yakusyoku_id{$fk_id}[19] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[19] = "";
	}elsif($k_yakusyoku_id{$fk_id}[20] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[20] = "";
	}elsif($k_yakusyoku_id{$fk_id}[21] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[21] = "";
	}elsif($k_yakusyoku_id{$fk_id}[22] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[22] = "";
	}elsif($k_yakusyoku_id{$fk_id}[23] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[23] = "";
	}elsif($k_yakusyoku_id{$fk_id}[24] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[24] = "";
	}elsif($k_yakusyoku_id{$fk_id}[26] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[26] = "";
	}elsif($k_yakusyoku_id{$fk_id}[27] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[27] = "";
	}
		$d_id = $f_id;
	&KUNI_KAKUDUKE("$d_id","$fk_id","");	
$nseikou18[$teroid] =0;$ntuu19[$teroid] =0;
$nhit[$teroid] = 0;$shit[$teroid]=1;

$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;

				}elsif($ytero[$teroid] and $k_yakusyoku_id{$fk_id}[25] eq $f_id){
$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;$shit[$teroid]=1;

				}
		}
		if($shit[26] < 1 and $sg < 1){
$teroid=26;
							$e_id=$k_yakusyoku_id{$fk_id}[26];
										if($p_kunino{$e_id} ne $p_kunino{$f_id}){
							$ytero[$teroid] = 0;
											if($p_id{$e_id} eq ""){
							$k_yakusyoku_id{$fk_id}[26]="";
											}
										}
				if($k_yakusyoku_id{$fk_id}[26] ne $f_id and ($ytero[$teroid] < 1 or $k_yakusyoku_id{$fk_id}[26] eq "")){
						if($k_yakusyoku_id{$fk_id}[26] eq ""){
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が$KANBU[$teroid]に任命される。");

	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$KANBU[$teroid]に任命される。");
						}else{
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が新たな$KANBU[$teroid]に任命される。");
	$ttid = "blog/$p_id{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}$KANBU[$teroid]の任を解かれる。");
	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$k_p_k_a{$p_kunino{$f_id}}の新たな$KANBU[$teroid]に任命される。");
						}
		$d_id = $k_yakusyoku_id{$fk_id}[26];
		$k_yakusyoku_id{$fk_id}[26]=$f_id;
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","");
	if($k_yakusyoku_id{$fk_id}[4] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[4] = "";
	}elsif($k_yakusyoku_id{$fk_id}[5] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[5] = "";
	}elsif($k_yakusyoku_id{$fk_id}[6] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[6] = "";
	}elsif($k_yakusyoku_id{$fk_id}[7] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[7] = "";
	}elsif($k_yakusyoku_id{$fk_id}[10] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[10] = "";
	}elsif($k_yakusyoku_id{$fk_id}[8] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[8] = "";
	}elsif($k_yakusyoku_id{$fk_id}[9] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[9] = "";
	}elsif($k_yakusyoku_id{$fk_id}[11] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[11] = "";
	}elsif($k_yakusyoku_id{$fk_id}[12] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[12] = "";
	}elsif($k_yakusyoku_id{$fk_id}[13] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[13] = "";
	}elsif($k_yakusyoku_id{$fk_id}[14] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[14] = "";
	}elsif($k_yakusyoku_id{$fk_id}[19] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[19] = "";
	}elsif($k_yakusyoku_id{$fk_id}[20] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[20] = "";
	}elsif($k_yakusyoku_id{$fk_id}[21] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[21] = "";
	}elsif($k_yakusyoku_id{$fk_id}[22] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[22] = "";
	}elsif($k_yakusyoku_id{$fk_id}[23] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[23] = "";
	}elsif($k_yakusyoku_id{$fk_id}[24] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[24] = "";
	}elsif($k_yakusyoku_id{$fk_id}[25] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[25] = "";
	}elsif($k_yakusyoku_id{$fk_id}[27] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[27] = "";
	}
		$d_id = $f_id;
	&KUNI_KAKUDUKE("$d_id","$fk_id","");	
$nseikou18[$teroid] =0;$ntuu19[$teroid] =0;
$nhit[$teroid] = 0;$shit[$teroid]=1;

$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;

				}elsif($ytero[$teroid] and $k_yakusyoku_id{$fk_id}[26] eq $f_id){
$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;$shit[$teroid]=1;

				}
		}
		if($shit[27] < 1 and $sg < 1){
$teroid=27;
							$e_id=$k_yakusyoku_id{$fk_id}[27];
										if($p_kunino{$e_id} ne $p_kunino{$f_id}){
							$ytero[$teroid] = 0;
											if($p_id{$e_id} eq ""){
							$k_yakusyoku_id{$fk_id}[27]="";
											}
										}
				if($k_yakusyoku_id{$fk_id}[27] ne $f_id and ($ytero[$teroid] < 1 or $k_yakusyoku_id{$fk_id}[27] eq "")){
						if($k_yakusyoku_id{$fk_id}[27] eq ""){
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が$KANBU[$teroid]に任命される。");

	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$KANBU[$teroid]に任命される。");
						}else{
	$ttid = "klog/$p_kunino{$f_id}";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$t_name[$p_taizai_iti{$f_id}]の$p_p_b_a{$f_id}が新たな$KANBU[$teroid]に任命される。");
	$ttid = "blog/$p_id{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}$KANBU[$teroid]の任を解かれる。");
	$ttid = "blog/$f_id";
	&PRLOG("\[$old_date\]$p_p_b_a{$p_id{$e_id}}の後任として、$k_p_k_a{$p_kunino{$f_id}}の新たな$KANBU[$teroid]に任命される。");
						}
		$d_id = $k_yakusyoku_id{$fk_id}[27];
		$k_yakusyoku_id{$fk_id}[27]=$f_id;
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","");
	if($k_yakusyoku_id{$fk_id}[4] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[4] = "";
	}elsif($k_yakusyoku_id{$fk_id}[5] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[5] = "";
	}elsif($k_yakusyoku_id{$fk_id}[6] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[6] = "";
	}elsif($k_yakusyoku_id{$fk_id}[7] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[7] = "";
	}elsif($k_yakusyoku_id{$fk_id}[10] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[10] = "";
	}elsif($k_yakusyoku_id{$fk_id}[8] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[8] = "";
	}elsif($k_yakusyoku_id{$fk_id}[9] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[9] = "";
	}elsif($k_yakusyoku_id{$fk_id}[11] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[11] = "";
	}elsif($k_yakusyoku_id{$fk_id}[12] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[12] = "";
	}elsif($k_yakusyoku_id{$fk_id}[13] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[13] = "";
	}elsif($k_yakusyoku_id{$fk_id}[14] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[14] = "";
	}elsif($k_yakusyoku_id{$fk_id}[19] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[19] = "";
	}elsif($k_yakusyoku_id{$fk_id}[20] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[20] = "";
	}elsif($k_yakusyoku_id{$fk_id}[21] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[21] = "";
	}elsif($k_yakusyoku_id{$fk_id}[22] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[22] = "";
	}elsif($k_yakusyoku_id{$fk_id}[23] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[23] = "";
	}elsif($k_yakusyoku_id{$fk_id}[24] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[24] = "";
	}elsif($k_yakusyoku_id{$fk_id}[25] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[25] = "";
	}elsif($k_yakusyoku_id{$fk_id}[26] eq "$f_id"){
		$k_yakusyoku_id{$fk_id}[26] = "";
	}
		$d_id = $f_id;
	&KUNI_KAKUDUKE("$d_id","$fk_id","");	
$nseikou18[$teroid] =0;$ntuu19[$teroid] =0;
$nhit[$teroid] = 0;$shit[$teroid]=1;

$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;

				}elsif($ytero[$teroid] and $k_yakusyoku_id{$fk_id}[27] eq $f_id){
$kannamae[$teroid] = $p_name{$f_id};
$kanid[$teroid] = $f_id;
$sk++;$sg++;$shit[$teroid]=1;

				}
		}
		if($shit[3] and $shit[6] and $shit[27]){last;}
	}

		}

##########進言的確判定###########
$i=0;
	while ($i < 27) {
$i++;
$nhit[$i] = 0;
	&BAG_LOG3("進言的確判定$i");
		if($k_kouryaku_mokuhyou{$fk_id}[0] eq "1"){
			if($nhyou2[$i] eq $k_kouryaku_mokuhyou{$fk_id}[0] and $k_mokuhyou_tosi{$fk_id}[0] eq $nkout7[$i]){
$nhit[$i] = 2;
			}elsif($nhyou2[$i] or $sainpc){
$nhit[$i] = 1;
			}
		}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "2"){
			if($nhyou2[$i] eq $k_kouryaku_mokuhyou{$fk_id}[0] and $k_mokuhyou_tosi{$fk_id}[0] eq $nkout7[$i] and $nkatuk8[$i] eq $k_katujyou_aite{$fk_id}[0] and $nkatut9[$i] eq $k_katujyou_tosi{$fk_id}[0]){
$nhit[$i] = 2;
			}elsif($nhyou2[$i] or $sainpc){
$nhit[$i] = 1;
			}
		}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "3"){
			if($nhyou2[$i] eq $k_kouryaku_mokuhyou{$fk_id}[0]){
$nhit[$i] = 2;
			}elsif($nhyou2[$i] or $sainpc){
$nhit[$i] = 1;
			}
		}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "4"){
			if($nhyou2[$i] eq $k_kouryaku_mokuhyou{$fk_id}[0] and $nkyuuk11[$i] eq $k_kyuusai_aite{$fk_id}[0]){
$nhit[$i] = 2;
			}elsif($nhyou2[$i] or $sainpc){
$nhit[$i] = 1;
			}
		}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "11"){
			if($nhyou2[$i] eq $k_kouryaku_mokuhyou{$fk_id}[0] and $nkyuuk11[$i] eq $k_kyuusai_aite{$fk_id}[0]){
$nhit[$i] = 2;
			}elsif($nhyou2[$i] or $sainpc){
$nhit[$i] = 1;
			}
		}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "12"){
			if($nhyou2[$i] eq $k_kouryaku_mokuhyou{$fk_id}[0] and $k_mokuhyou_tosi{$fk_id}[0] eq $nkout7[$i]){
$nhit[$i] = 2;
			}elsif($nhyou2[$i] or $sainpc){
$nhit[$i] = 1;
			}
		}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "13"){
			if($nhyou2[$i] eq $k_kouryaku_mokuhyou{$fk_id}[0]){
$nhit[$i] = 2;
			}elsif($nhyou2[$i] or $sainpc){
$nhit[$i] = 1;
			}
		}elsif($k_kouryaku_mokuhyou{$fk_id}[0] eq "14"){
			if($nhyou2[$i] eq $k_kouryaku_mokuhyou{$fk_id}[0] and $nkyuuk11[$i] eq $k_kyuusai_aite{$fk_id}[0]){
$nhit[$i] = 2;
			}elsif($nhyou2[$i] or $sainpc){
$nhit[$i] = 1;
			}
		}

		if(!$ntuu19[$i]){
$nhit[$i] = 1;
		}
			if($k_yakusyoku_id{$fk_id}[$i]){
$kouryakuw[$i] = 61;
			}else{
$kouryakuw[$i] = 0;
$kanid[$i] = 0;
			}
@new_charak=();
	unshift(@new_charak,"<>0<>61<>61<>$ntt5[$i]<>$kannamae[$i]<><>0<><>0<>0<>$nzei12[$i]<>$kanid[$i]<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");

@new_charak2=();
	unshift(@new_charak2,"<>$kouryakuw[$i]<>61<>61<>$ntt5[$i]<>$kannamae[$i]<><>0<><>0<>0<>$nzei12[$i]<>$kanid[$i]<>$ndb14[$i]<>$ndb15[$i]<>$ndb16[$i]<>$ndb17[$i]<>$nseikou18[$i]<>$ntuu19[$i]<>$nhit[$i]<>\n");


	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i.cgi");
	print OUT @new_charak;
	close(OUT);

		if($sainpc < 1){

	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i 2.cgi");
	print OUT @new_charak2;
	close(OUT);
	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i 3.cgi");
	print OUT @new_charak2;
	close(OUT);
		}elsif($keika_nen % 10 == 3){
	open(OUT,">./w_db/kuni/ctop$k_kunino{$fk_id} npc$i 3.cgi");
	print OUT @new_charak2;
	close(OUT);
		}

	}

	&BAG_LOG3("$k_kouryaku_mokuhyou{$fk_id}[0]");
##########進言的確判定###########
		if($k_kouryaku_mokuhyou{$fk_id}[0] > 0){

		if(!$k_kunino{$k_kousen_aite_k{$fk_id}[0]} or $k_kokka_keitai{$k_kousen_aite_k{$fk_id}[0]}){
		$k_kousen_aite_k{$fk_id}[0] = 0;
		}
		if(!$k_kunino{$k_kousen_aite_k{$fk_id}[1]} or $k_kokka_keitai{$k_kousen_aite_k{$fk_id}[1]}){
		$k_kousen_aite_k{$fk_id}[1] = 0;
		}
		if(!$k_kunino{$k_kousen_aite_k{$fk_id}[2]} or $k_kokka_keitai{$k_kousen_aite_k{$fk_id}[2]}){
		$k_kousen_aite_k{$fk_id}[2] = 0;
		}
		if(!$k_kunino{$k_kousen_aite_k{$fk_id}[3]} or $k_kokka_keitai{$k_kousen_aite_k{$fk_id}[3]}){
		$k_kousen_aite_k{$fk_id}[3] = 0;
		}
		if(!$k_kunino{$k_kousen_aite_k{$fk_id}[4]} or $k_kokka_keitai{$k_kousen_aite_k{$fk_id}[4]}){
		$k_kousen_aite_k{$fk_id}[4] = 0;
		}
		if(!$k_kunino{$k_kousen_aite_k{$fk_id}[5]} or $k_kokka_keitai{$k_kousen_aite_k{$fk_id}[5]}){
		$k_kousen_aite_k{$fk_id}[5] = 0;
		}
		if(!$k_kunino{$k_kousen_aite_k{$fk_id}[6]} or $k_kokka_keitai{$k_kousen_aite_k{$fk_id}[6]}){
		$k_kousen_aite_k{$fk_id}[6] = 0;
		}
		if(!$k_kunino{$k_kousen_aite_k{$fk_id}[7]} or $k_kokka_keitai{$k_kousen_aite_k{$fk_id}[7]}){
		$k_kousen_aite_k{$fk_id}[7] = 0;
		}
		if(!$k_kunino{$k_kousen_aite_k{$fk_id}[8]} or $k_kokka_keitai{$k_kousen_aite_k{$fk_id}[8]}){
		$k_kousen_aite_k{$fk_id}[8] = 0;
		}
		if(!$k_kunino{$k_kousen_aite_k{$fk_id}[9]} or $k_kokka_keitai{$k_kousen_aite_k{$fk_id}[9]}){
		$k_kousen_aite_k{$fk_id}[9] = 0;
		}
	

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
		}

	&BAG_LOG3("停戦$k_kouryaku_mokuhyou{$fk_id}[0]/$k_teisen_aite{$fk_id}[0]");
##########停戦###########
		if($k_kouryaku_mokuhyou{$fk_id}[0] eq "12" or $k_kouryaku_mokuhyou{$fk_id}[0] eq "13" or $k_kouryaku_mokuhyou{$fk_id}[0] eq "14"){

								if($k_teisen_aite{$fk_id}[0] eq "$k_kousen_aite_k{$fk_id}[0]"){
		$k_kousen_aite_k{$fk_id}[0] = 0;
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_tensi_name{$fk_id}</span></a>の意向により$k_p_k_a{$k_teisen_aite{$fk_id}[0]}に対する攻撃許可が取り消されました。");}
								elsif($k_teisen_aite{$fk_id}[0] eq "$k_kousen_aite_k{$fk_id}[1]"){
		$k_kousen_aite_k{$fk_id}[1] = 0;
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_tensi_name{$fk_id}</span></a>の意向により$k_p_k_a{$k_teisen_aite{$fk_id}[1]}に対する攻撃許可が取り消されました。");}
								elsif($k_teisen_aite{$fk_id}[0] eq "$k_kousen_aite_k{$fk_id}[2]"){
		$k_kousen_aite_k{$fk_id}[2] = 0;
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_tensi_name{$fk_id}</span></a>の意向により$k_p_k_a{$k_teisen_aite{$fk_id}[2]}に対する攻撃許可が取り消されました。");}
								elsif($k_teisen_aite{$fk_id}[0] eq "$k_kousen_aite_k{$fk_id}[3]"){
		$k_kousen_aite_k{$fk_id}[3] = 0;
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_tensi_name{$fk_id}</span></a>の意向により$k_p_k_a{$k_teisen_aite{$fk_id}[3]}に対する攻撃許可が取り消されました。");}
								elsif($k_teisen_aite{$fk_id}[0] eq "$k_kousen_aite_k{$fk_id}[4]"){
		$k_kousen_aite_k{$fk_id}[4] = 0;
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_tensi_name{$fk_id}</span></a>の意向により$k_p_k_a{$k_teisen_aite{$fk_id}[4]}に対する攻撃許可が取り消されました。");}
								elsif($k_teisen_aite{$fk_id}[0] eq "$k_kousen_aite_k{$fk_id}[5]"){
		$k_kousen_aite_k{$fk_id}[5] = 0;
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_tensi_name{$fk_id}</span></a>の意向により$k_p_k_a{$k_teisen_aite{$fk_id}[5]}に対する攻撃許可が取り消されました。");}
								elsif($k_teisen_aite{$fk_id}[0] eq "$k_kousen_aite_k{$fk_id}[6]"){
		$k_kousen_aite_k{$fk_id}[6] = 0;
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_tensi_name{$fk_id}</span></a>の意向により$k_p_k_a{$k_teisen_aite{$fk_id}[6]}に対する攻撃許可が取り消されました。");}
								elsif($k_teisen_aite{$fk_id}[0] eq "$k_kousen_aite_k{$fk_id}[7]"){
		$k_kousen_aite_k{$fk_id}[7] = 0;
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_tensi_name{$fk_id}</span></a>の意向により$k_p_k_a{$k_teisen_aite{$fk_id}[7]}に対する攻撃許可が取り消されました。");}
								elsif($k_teisen_aite{$fk_id}[0] eq "$k_kousen_aite_k{$fk_id}[8]"){
		$k_kousen_aite_k{$fk_id}[8] = 0;
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_tensi_name{$fk_id}</span></a>の意向により$k_p_k_a{$k_teisen_aite{$fk_id}[8]}に対する攻撃許可が取り消されました。");}
								elsif($k_teisen_aite{$fk_id}[0] eq "$k_kousen_aite_k{$fk_id}[9]"){
		$k_kousen_aite_k{$fk_id}[9] = 0;
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_tensi_name{$fk_id}</span></a>の意向により$k_p_k_a{$k_teisen_aite{$fk_id}[9]}に対する攻撃許可が取り消されました。");}


	

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

		}else{
			if($saihanw < 1){
$k_teisen_aite{$fk_id}[0] = 0;
			}
		}
##########停戦###########

	&BAG_LOG3("布告$k_kouryaku_mokuhyou{$fk_id}[0],$zvhit2,$dk_id,$fk_id");
##########布告###########
		if($k_kouryaku_mokuhyou{$fk_id}[0] eq "2" or $k_kouryaku_mokuhyou{$fk_id}[0] eq "1" or $k_kouryaku_mokuhyou{$fk_id}[0] eq "12"){
							$zvhit=0;
							$zvhit2=0;
							
							
$dk_id =$k_mokuhyou_kuni{$fk_id}[0];

		$zvhit2=0;
		&KOUSEN_AITE_HIT("$zvhit2","$dk_id","$fk_id");
		$zvhit2=$kousen_aite_hit;


		if($zvhit2 < 1 and $k_kunino{$dk_id}){
								if($k_kunino{$dk_id} ne $k_kousen_aite_k{$fk_id}[0] and $k_kunino{$k_kousen_aite_k{$fk_id}[0]} < 1){
		$k_kousen_aite_k{$fk_id}[0] = $dk_id;
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_tensi_name{$fk_id}</span></a>の意向により$k_p_k_a{$k_kunino{$dk_id}}に対する攻撃許可が下されました。");}
								elsif($k_kunino{$dk_id} ne $k_kousen_aite_k{$fk_id}[1] and $k_kunino{$k_kousen_aite_k{$fk_id}[1]} < 1){
		$k_kousen_aite_k{$fk_id}[1] = $dk_id;
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_tensi_name{$fk_id}</span></a>の意向により$k_p_k_a{$k_kunino{$dk_id}}に対する攻撃許可が下されました。");}
								elsif($k_kunino{$dk_id} ne $k_kousen_aite_k{$fk_id}[2] and $k_kunino{$k_kousen_aite_k{$fk_id}[2]} < 1){
		$k_kousen_aite_k{$fk_id}[2] = $dk_id;
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_tensi_name{$fk_id}</span></a>の意向により$k_p_k_a{$k_kunino{$dk_id}}に対する攻撃許可が下されました。");}
								elsif($k_kunino{$dk_id} ne $k_kousen_aite_k{$fk_id}[3] and $k_kunino{$k_kousen_aite_k{$fk_id}[3]} < 1){
		$k_kousen_aite_k{$fk_id}[3] = $dk_id;
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_tensi_name{$fk_id}</span></a>の意向により$k_p_k_a{$k_kunino{$dk_id}}に対する攻撃許可が下されました。");}
								elsif($k_kunino{$dk_id} ne $k_kousen_aite_k{$fk_id}[4] and $k_kunino{$k_kousen_aite_k{$fk_id}[4]} < 1){
		$k_kousen_aite_k{$fk_id}[4] = $dk_id;
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_tensi_name{$fk_id}</span></a>の意向により$k_p_k_a{$k_kunino{$dk_id}}に対する攻撃許可が下されました。");}
								elsif($k_kunino{$dk_id} ne $k_kousen_aite_k{$fk_id}[5] and $k_kunino{$k_kousen_aite_k{$fk_id}[5]} < 1){
		$k_kousen_aite_k{$fk_id}[5] = $dk_id;
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_tensi_name{$fk_id}</span></a>の意向により$k_p_k_a{$k_kunino{$dk_id}}に対する攻撃許可が下されました。");}
								elsif($k_kunino{$dk_id} ne $k_kousen_aite_k{$fk_id}[6] and $k_kunino{$k_kousen_aite_k{$fk_id}[6]} < 1){
		$k_kousen_aite_k{$fk_id}[6] = $dk_id;
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_tensi_name{$fk_id}</span></a>の意向により$k_p_k_a{$k_kunino{$dk_id}}に対する攻撃許可が下されました。");}
								elsif($k_kunino{$dk_id} ne $k_kousen_aite_k{$fk_id}[7] and $k_kunino{$k_kousen_aite_k{$fk_id}[7]} < 1){
		$k_kousen_aite_k{$fk_id}[7] = $dk_id;
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_tensi_name{$fk_id}</span></a>の意向により$k_p_k_a{$k_kunino{$dk_id}}に対する攻撃許可が下されました。");}
								elsif($k_kunino{$dk_id} ne $k_kousen_aite_k{$fk_id}[8] and $k_kunino{$k_kousen_aite_k{$fk_id}[8]} < 1){
		$k_kousen_aite_k{$fk_id}[8] = $dk_id;
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_tensi_name{$fk_id}</span></a>の意向により$k_p_k_a{$k_kunino{$dk_id}}に対する攻撃許可が下されました。");}
								elsif($k_kunino{$dk_id} ne $k_kousen_aite_k{$fk_id}[9] and $k_kunino{$k_kousen_aite_k{$fk_id}[9]} < 1){
		$k_kousen_aite_k{$fk_id}[9] = $dk_id;
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_kunino{$fk_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_tensi_name{$fk_id}</span></a>の意向により$k_p_k_a{$k_kunino{$dk_id}}に対する攻撃許可が下されました。");}


	

		}


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

		}
##########布告###########

	

	}

	&BAG_LOG("評定END\n");
	&BAG_LOG3("評定END");

	&BAG_LOG("定期削除$fk_id\n");
	&BAG_LOG3("定期削除kaisi");

	opendir(DFR,"./ip_db/ip");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i){
@fileinfo = stat("./ip_db/ip/$file") ;
$filesize = $fileinfo[9];

			if($filesize + 2073600 < $tt and $filesize){
							unlink("./ip_db/ip/$file");
			}
		}
	}
	closedir(DFR);

	opendir(DFR,"./ip_db/tajyuul");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i){
@fileinfo = stat("./ip_db/tajyuul/$file") ;
$filesize = $fileinfo[9];

			if($filesize + 2073600 < $tt and $filesize){
							unlink("./ip_db/tajyuul/$file");
			}
		}
	}
	closedir(DFR);
	
	opendir(DFR,"./ip_db/giwaku/");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i){
			open(page,"./ip_db/giwaku/$file");
			@page = <page>;
			close(page);
		$ktms4 = 0;
		$f_id = "";
	($ktms4,$f_id) = split(/<>/,$page[0]);
			if(-e "./p_db/p/$f_id.cgi"){
							unlink("./ip_db/giwaku/$f_id.cgi");
			}elsif($ktms4 + 2073600 < $tt and $ktms4){
							unlink("./ip_db/giwaku/$f_id.cgi");
			$apontmj = $apontm + 86400 - $times;

	&BAG_LOG3("定期削除$f_id\n");
rename ("./p_db/touketu/$f_id.cgi", "./p_db/bl/$f_id.cgi");

		$fk_id = $p_kunino{$f_id};
							unlink("./p_db/touketu/$f_id.cgi");
							unlink("./p_db/my_log/$f_id.cgi");
							unlink("./p_db/cd/$f_id.cgi");
							unlink("./p_db/co/$f_id.cgi");
							unlink("./pr/b/$f_id.cgi");
							unlink("./pr/blog/$f_id.cgi");
			unlink("./p_db/tt/$f_id.cgi");


	&KUNI_KAKUDUKE("$f_id","$fk_id","$fk_id");
$p_kuni_yakusyoku{$w_id} = 0;


	&TT_GET;
	 	&M2AP_LOG("[凍結ID抹消]$f_id：$p_name{$f_id}は削除されました。");

			}
		}
	}
	closedir(DFR);

	&BAG_LOG3("定期削除END\n");
		}

#   NPC    #

	&BAG_LOG("金支給$fk_id\n");

	@cex_total3=();

	foreach(@k_no_all_l){
		$ceno=$_;
	unshift(@cex_total3,"$ceno<>$cex_total2[$ceno]<>\n");
	}
				open(OUT,">./w_db/kyuuex.cgi");
				print OUT @cex_total3;
				close(OUT);
	open(IN,"./w_db/kyuuex.cgi");
	@cex_total0 = <IN>;
	close(IN);

		$testkyuu = 0;
	foreach(@cex_total0){
		($exid,$exkyuu)=split(/<>/);
		$cex_total[$exid] = int($exkyuu);
		$testkyuu += $exkyuu;
	}

	if($testkyuu < 1){
		foreach(@p_db_all_l){
			$f_id = $_;
				$cex_total[$p_kunino{$f_id}]+=$p_kunkou{$f_id};
		}
	}

$p_db_no = 0;

	foreach(@p_db_all_l){
			$f_id = $_;
	&BAG_LOG("支給$f_id\n");
$p_tuusan_nensuu{$f_id} ++;
$p_nenrei{$f_id} ++;
if($p_kunino{$f_id}){
$p_kuni_sikan_nensuu{$f_id} ++;
}
if($p_habatuno{$f_id}){
$p_habatu_sikan_nensuu{$f_id} ++;
}
if($p_guildno{$f_id}){
$p_guild_sikan_nensuu{$f_id} ++;
}
if($p_gundanno{$f_id}){
$p_gundan_sikan_nensuu{$f_id} ++;
}
if($p_butaino{$f_id}){
$p_butai_sikan_nensuu{$f_id} ++;
}
if($p_ptno{$f_id}){
$p_pt_sikan_nensuu{$f_id} ++;
}
				if($p_tuusan_nensuu{$f_id} < 16 and ($p_tuusan_nensuu{$f_id} eq "10" or $p_tuusan_nensuu{$f_id} eq "15")){
		$ktms4 = 0;
	open(IN,"./p_db/tt/ktms4$f_id.cgi");
	@KTM = <IN>;
	close(IN);
	($ktms4,$ktms4w,$tmtmit,$tmtmw1,$tmtmw2,$tmtmw3) = split(/<>/,$KTM[0]);
		$kadd = (96 * $kousin_kankaku) + $ktms4;
				if($kadd < $tt and $ktms4){
	@NEW_CD_DB = ();
		$i = 0;
		while($i < $MAX_CD){
			push(@NEW_CD_DB,"0<><>休暇をとる<>$tt<><><><>\n");
			$i++;
		}
	open(OUT,">./p_db/cd/$f_id.cgi");
	print OUT @NEW_CD_DB;
	close(OUT);
	@NEW_CD_DB = ();
			push(@NEW_CD_DB,"$tt<>$f_id<><><><>\n");
	open(OUT,">./ip_db/giwaku/$f_id.cgi");
	print OUT @NEW_CD_DB;
	close(OUT);
	$p_mikoudou_t{$f_id} = $TOUKETU_T - 1 - int(86400 / ($kousin_kankaku + 1));
	$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【<span class=\"cFF0000\">登録直後のID放置</span>】初期登録後、しばらくアクセスが確認されませんでした。セキュリティ確保のためコマンド入力を初期化します。お手数ですが再度コマンド入力をお願いします。");
				}
				}

				if($p_kuni_sikan_nensuu{$f_id} % 10 == 9){
$p_exgiri{$f_id} += 1;
						if($p_kuni_sikan_nensuu{$f_id} % 20 == 19 and $p_exyabou{$f_id} > 80){
$p_exyabou{$f_id} -= 1;
						}elsif($p_kuni_sikan_nensuu{$f_id} % 40 == 39 and $p_exyabou{$f_id} > 50){
$p_exyabou{$f_id} -= 1;
						}elsif($p_kuni_sikan_nensuu{$f_id} % 70 == 69 and $p_exyabou{$f_id} > 20){
$p_exyabou{$f_id} -= 1;
						}elsif($p_kuni_sikan_nensuu{$f_id} % 300 == 299){
$p_exyabou{$f_id} -= 1;
					if($p_exyabou{$f_id} < 1){
$p_exyabou{$f_id} = 1;
					}
						}
				}


	$fk_id = $p_kunino{$f_id};
		if($k_kunino{$fk_id}){
	$kadd2c = "";
					$kadd = 0;
					if($cex_total[$p_kunino{$f_id}]){
					$kadd  = int($k_kin_syuunyuu_sougaku_w{$fk_id} * $p_kunkou{$f_id} / $cex_total[$p_kunino{$f_id}]);
			if($jfi>59 and $jfl>59 and $jfs>59){
					$kadd  = int($kadd * 1.4);
			if($jfi>89 and $jfl>89 and $jfs>89){
					$kadd  = int($kadd * 1.3);
			}
			}
			if($k_kokkyou{$p_kunino{$f_id}} eq "4"){
	if($k_kokkyou_keika_nen{$p_kunino{$f_id}} > 5){
	$kadd2 = int($k_kome_syuunyuu_sougaku_w{$fk_id} * 0.3 * $p_kunkou{$f_id} / $cex_total[$p_kunino{$f_id}]);
	$kadd2c = "米<span class=\"cFF0000\">$kadd2</span>";
					$p_syoji_kome{$f_id} += $kadd2;
	}
			}
					}
					$p_syakui{$f_id} = int($p_neutral_meisei{$f_id} / $SYAKUI_P);
						if($p_syakui{$f_id} > 19){$p_syakui{$f_id} = 20;
						$max_sal = "「∞」";
						$max_salc = $max_sal;
						}else{
						$max_sal = int(($p_syakui{$f_id} + 1) * 250000);
						$max_salc = "「$max_sal」";
						}
					if($p_syoji_kin{$f_id} + $p_syoji_kome{$f_id} > $max_sal and $p_syakui{$f_id} < 20 and $kadd){
	$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【<span class=\"cFF0000\">給料支給不能</span>】$LANK[$p_syakui{$f_id}]の総資産上限値、$max_salcを上回っているため受け取れません。国庫の方に納入致しました。");

							$k_kokko_sougaku{$p_kunino{$f_id}} += $kadd;

		$fk_id = $p_kunino{$f_id};
#										if($k_yakusyoku_id{$fk_id}[26] and $k_yakusyoku_id{$fk_id}[26] ne $f_id){							

#	$w_id=$p_id{$k_yakusyoku_id{$fk_id}[26]};&P_LOG_W("$p_name{$f_id}に支給出来なかった給料分として、金$kaddが国庫に送り届けられました。");
#										}
$kadd=0;	
					}
					$kbl_ex_fol= ($p_neutral_meisei{$f_id} % $SYAKUI_P)+$p_kunkou{$f_id};
					$p_kuni_kouken{$f_id} += $p_kunkou{$f_id};
					$p_neutral_meisei{$f_id} += $p_kunkou{$f_id};
					if($kbl_ex_fol >= $SYAKUI_P){
						$p_syakui{$f_id} = int($p_neutral_meisei{$f_id} / $SYAKUI_P);
						if($p_syakui{$f_id} > 20){$p_syakui{$f_id} = 20;
						$max_sal = "「∞」";
						$max_salc = $max_sal;
						}elsif($p_syakui{$f_id} eq "20"){$p_syakui{$f_id} = 20;
						$max_sal = "「∞」";
						$max_salc = $max_sal;
						$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【<span class=\"cFF0000\">爵位昇進</span>】爵位が$LANK[$p_syakui{$f_id}]に昇格！総資産のMAX値が<span class=\"cFF0000\"> $max_salc </span>になりました。");
						}else{
						$max_sal = int(($p_syakui{$f_id} + 1) * 250000);
						$max_salc = "「$max_sal」";
						$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【<span class=\"cFF0000\">爵位昇進</span>】爵位が$LANK[$p_syakui{$f_id}]に昇格！総資産のMAX値が<span class=\"cFF0000\"> $max_salc </span>になりました。");
						}
							$p_ex_buryoku{$f_id}+= int(rand(10));
							$p_ex_tiryoku{$f_id}+= int(rand(10));
							$p_ex_tousotu{$f_id}+= int(rand(10));

					}
					$p_kunkou{$f_id} = 0;
					if($kadd and $k_kunino{$p_kunino{$f_id}}){
					$p_syoji_kin{$f_id} += $kadd;
					$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$k_name_d[$p_kunino{$f_id}]より、給与として金<span class=\"cFF0000\">$kadd</span>$kadd2cが支給されました。");

					}
		}

$p_kuni_yakusyoku{$f_id}=int($p_kuni_yakusyoku{$f_id});
		if($p_kuni_yakusyoku{$f_id} and $k_yakusyoku_id{$fk_id}[$p_kuni_yakusyoku{$f_id}] ne $f_id){
	&KUNI_KAKUDUKE("$f_id","$fk_id","");
		}
$p_db_no ++;
	}

	&BAG_LOG("支給OK\n");
		}elsif($tuki_genzai eq "7"){
	&BAG_LOG("7月処理\n");
	&BAG_LOG("給料\n");
					&KYUURYOU;
	@cex_total3=();

	foreach(@k_no_all_l){
		$ceno=$_;
	unshift(@cex_total3,"$ceno<>$cex_total2[$ceno]<>\n");
	}
				open(OUT,">./w_db/kyuuex.cgi");
				print OUT @cex_total3;
				close(OUT);
	open(IN,"./w_db/kyuuex.cgi");
	@cex_total0 = <IN>;
	close(IN);

		$testkyuu = 0;
	foreach(@cex_total0){
		($exid,$exkyuu)=split(/<>/);
		$cex_total[$exid] = "$exkyuu";
				if($cex_total[$exid] eq ""){
$cex_total[$exid] = 0;
				}
		$testkyuu += $exkyuu;
	}

	if($testkyuu < 1){
		foreach(@p_db_all_l){
			$f_id = $_;
				$cex_total[$p_kunino{$f_id}]+=$p_kunkou{$f_id};
		}
	}

require "./$mpg_r/sub_db/neko$KEITAI_T.pl";

$p_db_no = 0;

	foreach(@p_db_all_l){
			$f_id = $_;
				
	&BAG_LOG("米支給$f_id\n");
	$fk_id = $p_kunino{$f_id};
					$kadd = 0;
		if($k_kunino{$fk_id}){
					if($cex_total[$p_kunino{$f_id}]){
						$kadd  = int($k_kome_syuunyuu_sougaku_w{$fk_id} * $p_kunkou{$f_id} / $cex_total[$p_kunino{$f_id}]);
			if($jfi>59 and $jfl>59 and $jfs>59){
					$kadd  = int($kadd * 1.4);
			if($jfi>89 and $jfl>89 and $jfs>89){
					$kadd  = int($kadd * 1.3);
			}
			}
			if($k_kokkyou{$p_kunino{$f_id}} eq "13"){
	if($k_kokkyou_keika_nen{$p_kunino{$f_id}} > 5){
					$kadd  = int($kadd * 1.25);
	}
			}
					}
					$p_syakui{$f_id} = int($p_neutral_meisei{$f_id} / $SYAKUI_P);
						if($p_syakui{$f_id} > 19){$p_syakui{$f_id} = 20;
						$max_sal = "「∞」";
						$max_salc = $max_sal;
						}else{
						$max_sal = int(($p_syakui{$f_id} + 1) * 250000);
						$max_salc = "「$max_sal」";
						}
					if($p_syoji_kin{$f_id} + $p_syoji_kome{$f_id} > $max_sal and $p_syakui{$f_id} < 20 and $kadd){
	$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【<span class=\"cFF0000\">給料支給不能</span>】$LANK[$p_syakui{$f_id}]の総資産上限値、$max_salcを上回っているため受け取れません。国庫の方に納入致しました。");

							$k_kokko_sougaku{$p_kunino{$f_id}} += $kadd;

		$fk_id = $p_kunino{$f_id};
$kadd=0;
#										if($k_yakusyoku_id{$fk_id}[26] and $k_yakusyoku_id{$fk_id}[26] ne $f_id){							

#	$w_id=$p_id{$k_yakusyoku_id{$fk_id}[26]};&P_LOG_W("$p_name{$f_id}に支給出来なかった給料分として、金$kaddが国庫に送り届けられました。");
#										}
					}
					$p_syoji_kome{$f_id} += $kadd;
					$kbl_ex_fol= ($p_neutral_meisei{$f_id} % $SYAKUI_P)+$p_kunkou{$f_id};
					$p_kuni_kouken{$f_id} += $p_kunkou{$f_id};
					$p_neutral_meisei{$f_id} += $p_kunkou{$f_id};
					if($kbl_ex_fol >= $SYAKUI_P){
						$p_syakui{$f_id} = int($p_neutral_meisei{$f_id} / $SYAKUI_P);
						if($p_syakui{$f_id} > 20){$p_syakui{$f_id} = 20;
						$max_sal = "「∞」";
						$max_salc = $max_sal;
						}elsif($p_syakui{$f_id} eq "20"){$p_syakui{$f_id} = 20;
						$max_sal = "「∞」";
						$max_salc = $max_sal;
						$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【<span class=\"cFF0000\">爵位昇進</span>】爵位が$LANK[$p_syakui{$f_id}]に昇格！総資産のMAX値が<span class=\"cFF0000\"> $max_salc </span>になりました。");
						}else{
						$max_sal = int(($p_syakui{$f_id} + 1) * 250000);
						$max_salc = "「$max_sal」";
						$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【<span class=\"cFF0000\">爵位昇進</span>】爵位が$LANK[$p_syakui{$f_id}]に昇格！総資産のMAX値が<span class=\"cFF0000\"> $max_salc </span>になりました。");
						}
							$p_ex_buryoku{$f_id}+= int(rand(10));
							$p_ex_tiryoku{$f_id}+= int(rand(10));
							$p_ex_tousotu{$f_id}+= int(rand(10));

					}
					$p_kunkou{$f_id} = 0;
					if($kadd){
					$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$k_name_d[$p_kunino{$f_id}]より、給与として米<span class=\"cFF0000\">$kadd</span>が支給されました。");

					}
		}
					

	&NEKONYANB;


$p_db_no ++;
	}

			if($nekonyanhit){
			&M2AP_LOG('<span class=\"c0000FF\">【猫々娘々】</span>多重疑惑者掃討作戦完了なのら～ ヽ（´ー`)J ');

			}

			&M2AP_LOG("$nen_genzai年$tuki_genzai月:<span class=\"cFF8C00\">【収穫期】</span>各武将に給与が支払われました。");
			$b_hit = 1;
$i = 0;
	while ($i<$tosi_kazu) {
							$ft_id = $i;
			if($t_tian_ti{$ft_id} < 50){
				$t_tian_ti{$ft_id} += 1;
			}
$i ++;
	}
		}
	&BAG_LOG("米支給OK\n");
			if($ino ne "99"){
		$ihit=0;
	&BAG_LOG("イベント$ino\n");
#90
		@IBENTOWT=();
		if(!int(rand(12)) or $ino){
			$ihit=1;
			if(!$ino){
			$ino = int(rand(9));
			}
			if($ino eq "0" and $tuki_genzai < 7 and $tuki_genzai > 4){
$TIBENTOM[0] = '倭';
$TIBENTOM[1] = '荊州北部';
$TIBENTOM[2] = '荊州南部';
$TIBENTOM[3] = '司州';
$TIBENTOM[4] = '予州';
$TIBENTOM[5] = '益州北部';
$TIBENTOM[6] = '益州南部';
$TIBENTOM[7] = '揚州北部';
$TIBENTOM[8] = '揚州南部';
$TIBENTOM[9] = '冀州';
$TIBENTOM[10] = '青州';
$TIBENTOM[11] = '徐州';
$TIBENTOM[12] = '幽州東部';
$TIBENTOM[13] = '幽州西部';
$TIBENTOM[14] = '并州';
$TIBENTOM[15] = '涼州南東部';
$TIBENTOM[16] = '涼州北西部';
$TIBENTOM[17] = '亠兌州';
$TIBENTOM[18] = '交州東部';
$TIBENTOM[19] = '交州西部';
$zc = @TIBENTOM;
			$tibento = int(rand($zc));
$TIBENTOMNO[0] = '22<>78<><><><><><><><><><><><><><>';
$TIBENTOMNO[1] = '16<>25<>26<>32<><><><><><><><><><><><>';
$TIBENTOMNO[2] = '38<>40<>41<>37<><><><><><><><><><><><>';
$TIBENTOMNO[3] = '10<>9<>5<>61<>62<><><><><><><><><><><>';
$TIBENTOMNO[4] = '11<>42<>47<>48<><><><><><><><><><><><>';
$TIBENTOMNO[5] = '70<>55<>59<>15<>21<>20<>23<>24<>31<><><><><><><>';
$TIBENTOMNO[6] = '76<>65<>64<>30<>67<>54<>53<>75<><><><><><><><>';
$TIBENTOMNO[7] = '17<>29<>35<>27<>33<><><><><><><><><><><>';
$TIBENTOMNO[8] = '28<>44<>49<>71<><><><><><><><><><><><>';
$TIBENTOMNO[9] = '3<>6<>82<><><><><><><><><><><><><>';
$TIBENTOMNO[10] = '7<>8<>77<>43<><><><><><><><><><><><>';
$TIBENTOMNO[11] = '68<>14<>18<>73<><><><><><><><><><><><>';
$TIBENTOMNO[12] = '0<>52<>79<><><><><><><><><><><><><>';
$TIBENTOMNO[13] = '34<>50<>51<><><><><><><><><><><><><>';
$TIBENTOMNO[14] = '2<>58<>60<><><><><><><><><><><><><>';
$TIBENTOMNO[15] = '39<>4<>81<>56<><><><><><><><><><><><>';
$TIBENTOMNO[16] = '1<>46<>83<><><><><><><><><><><><><>';
$TIBENTOMNO[17] = '12<>13<>72<><><><><><><><><><><><><>';
$TIBENTOMNO[18] = '45<>63<>66<>74<><><><><><><><><><><><>';
$TIBENTOMNO[19] = '80<>19<>36<>57<>69<><><><><><><><><><><>';
					@iz = ();
($iz[0],$iz[1],$iz[2],$iz[3],$iz[4],$iz[5],$iz[6],$iz[7],$iz[8],$iz[9],$zi[10],$iz[11],$iz[12],$iz[13],$iz[14])=split(/<>/,$TIBENTOMNO[$tibento]);
					@IBENTOWT = @iz;
$ibenttiku0 = "$TIBENTOM[$tibento]で、イナゴの大群が発生しました。農作物に大きな被害が出ている模様です。。";
			}elsif($ino eq "1" and $tuki_genzai < 10 and $tuki_genzai > 2){
$TIBENTOM[0] = '長江下流域';
#呉、建業、廬江、広陵、寿春
$TIBENTOM[1] = '長江中・下流域';
#呉、建業、廬江、広陵、寿春、柴桑、江夏、長沙
$TIBENTOM[2] = '長江中流域';
#柴桑、江夏、長沙
$TIBENTOM[3] = '長江上・中流域';
#柴桑、江夏、長沙、江陵、白帝、江州
$TIBENTOM[4] = '黄河下流域';
#南皮、へいげん、ぎょう、ちんりゅう
$TIBENTOM[5] = '黄河中・下流域';
#南皮、へいげん、ぎょう、ちんりゅう、さいか、らくよう、こうのう、かわとう、ちょうあん
$TIBENTOM[6] = '黄河中流域';
#さいか、らくよう、こうのう、かわとう、ちょうあん
$TIBENTOM[7] = '遼河流域';
#襄平
$TIBENTOM[8] = '淮河流域';
#汝南、寿春、広陵
$zc = @TIBENTOM;
			$tibento = int(rand($zc));
$TIBENTOMNO[0] = '35<>27<>29<>17<>18<><><><><><><><><><><>';
$TIBENTOMNO[1] = '38<>40<>41<>37<>26<>33<>38<><><><><><><><><>';
$TIBENTOMNO[2] = '26<>33<>38<><><><><><><><><><><><><>';
$TIBENTOMNO[3] = '26<>33<>38<>24<>31<>32<><><><><><><><><><>';
$TIBENTOMNO[4] = '3<>6<>8<>12<><><><><><><><><><><><>';
$TIBENTOMNO[5] = '3<>6<>8<>12<>5<>9<>10<>58<>61<><><><><><><>';
$TIBENTOMNO[6] = '5<>9<>10<>58<>61<><><><><><><><><><><>';
$TIBENTOMNO[7] = '0<><><><><><><><><><><><><><><>';
$TIBENTOMNO[8] = '47<>17<>18<><><><><><><><><><><><><>';
$TIBENTOMNO[9] = '<><><><><><><><><><><><><><><>';
$TIBENTOMNO[10] = '<><><><><><><><><><><><><><><>';
$TIBENTOMNO[11] = '<><><><><><><><><><><><><><><>';
$TIBENTOMNO[12] = '<><><><><><><><><><><><><><><>';
$TIBENTOMNO[13] = '<><><><><><><><><><><><><><><>';
$TIBENTOMNO[14] = '<><><><><><><><><><><><><><><>';
$TIBENTOMNO[15] = '<><><><><><><><><><><><><><><>';
$TIBENTOMNO[16] = '<><><><><><><><><><><><><><><>';
$TIBENTOMNO[17] = '<><><><><><><><><><><><><><><>';
$TIBENTOMNO[18] = '<><><><><><><><><><><><><><><>';
$TIBENTOMNO[19] = '<><><><><><><><><><><><><><><>';
					@iz = ();
$ibenttiku0 = "度重なる長雨の影響で、$TIBENTOM[$tibento]において洪水が発生しました！各地で甚大な被害が出ている模様です。。";
			if($housakuhit){
$housakuhit -= 1;
							$ft_id = $housakuhit;
			$tibento = 99;
$TIBENTOM[99] = $t_name[$housakuhit];
$TIBENTOMNO[99] = "$housakuhit<>$t_setuzoku_saki{$ft_id}[0]<>$t_setuzoku_saki{$ft_id}[1]<>$t_setuzoku_saki{$ft_id}[2]<>$t_setuzoku_saki{$ft_id}[3]<>$t_setuzoku_saki{$ft_id}[4]<>$t_setuzoku_saki{$ft_id}[5]<>$t_setuzoku_saki{$ft_id}[6]<>$t_setuzoku_saki{$ft_id}[7]<><><><><><><>";

					@iz = ();
$ibenttiku0 = "$t_name[$housakuhit]上空に悪しき暗雲がたちこめるとともに、大地に叩きつけるような激しい豪雨が降り注ぎ、周辺都市に大洪水が発生しました！！各地で甚大な被害が出ている模様です。。";
			}
($iz[0],$iz[1],$iz[2],$iz[3],$iz[4],$iz[5],$iz[6],$iz[7],$iz[8],$iz[9],$zi[10],$iz[11],$iz[12],$iz[13],$iz[14])=split(/<>/,$TIBENTOMNO[$tibento]);
					@IBENTOWT = @iz;
			}elsif($ino eq "2"){
$zc = $tosi_kazu;
			$tibento = int(rand($zc));
							$ft_id = $tibento;
					$t_setuzoku_saki{$ft_id}[10] = $tibento;
					@IBENTOWT = @{$t_setuzoku_saki{$ft_id}};
$ibenttiku0 = "$t_name[$tibento]周辺で悪しき疫病が発生しました。民が次々に倒れている模様です。。";
			}elsif($ino eq "3" and $tuki_genzai < 7 and $tuki_genzai > 3){
$TIBENTOM[0] = '倭';
#わ
$TIBENTOM[1] = '荊州北部';
#宛、シンヤ、じょうよう、こうりょう、こうか、じょうよう、えいあん
$TIBENTOM[2] = '荊州南部';
#ちょうさ、ぶりょう、れいりょう、けいよう
$TIBENTOM[3] = '司州';
$TIBENTOM[4] = '予州';
$TIBENTOM[5] = '益州北部';
$TIBENTOM[6] = '益州南部';
$TIBENTOM[7] = '揚州北部';
$TIBENTOM[8] = '揚州南部';
$TIBENTOM[9] = '冀州';
$TIBENTOM[10] = '青州';
$TIBENTOM[11] = '徐州';
$TIBENTOM[12] = '幽州東部';
$TIBENTOM[13] = '幽州西部';
$TIBENTOM[14] = '并州';
$TIBENTOM[15] = '涼州南東部';
$TIBENTOM[16] = '涼州北西部';
$TIBENTOM[17] = '亠兌州';
$TIBENTOM[18] = '交州東部';
$TIBENTOM[19] = '交州西部';
$zc = @TIBENTOM;
			$tibento = int(rand($zc));
$TIBENTOMNO[0] = '22<>78<><><><><><><><><><><><><><>';
$TIBENTOMNO[1] = '16<>25<>26<>32<><><><><><><><><><><><>';
$TIBENTOMNO[2] = '38<>40<>41<>37<><><><><><><><><><><><>';
$TIBENTOMNO[3] = '10<>9<>5<>61<>62<><><><><><><><><><><>';
$TIBENTOMNO[4] = '11<>42<>47<>48<><><><><><><><><><><><>';
$TIBENTOMNO[5] = '70<>55<>59<>15<>21<>20<>23<>24<>31<><><><><><><>';
$TIBENTOMNO[6] = '76<>65<>64<>30<>67<>54<>53<>75<><><><><><><><>';
$TIBENTOMNO[7] = '17<>29<>35<>27<>33<><><><><><><><><><><>';
$TIBENTOMNO[8] = '28<>44<>49<>71<><><><><><><><><><><><>';
$TIBENTOMNO[9] = '3<>6<>82<><><><><><><><><><><><><>';
$TIBENTOMNO[10] = '7<>8<>77<>43<><><><><><><><><><><><>';
$TIBENTOMNO[11] = '68<>14<>18<>73<><><><><><><><><><><><>';
$TIBENTOMNO[12] = '0<>52<>79<><><><><><><><><><><><><>';
$TIBENTOMNO[13] = '34<>50<>51<><><><><><><><><><><><><>';
$TIBENTOMNO[14] = '2<>58<>60<><><><><><><><><><><><><>';
$TIBENTOMNO[15] = '39<>4<>81<>56<><><><><><><><><><><><>';
$TIBENTOMNO[16] = '1<>46<>83<><><><><><><><><><><><><>';
$TIBENTOMNO[17] = '12<>13<>72<><><><><><><><><><><><><>';
$TIBENTOMNO[18] = '45<>63<>66<>74<><><><><><><><><><><><>';
$TIBENTOMNO[19] = '80<>19<>36<>57<>69<><><><><><><><><><><>';
					@iz = ();
$ibenttiku0 = "$TIBENTOM[$tibento]では、好天が続き農作物がスクスクと育っています。来期は豊作となりそうです。";
			if($housakuhit){
$housakuhit -= 1;
							$ft_id = $housakuhit;
			$tibento = 99;
$TIBENTOM[99] = $t_name[$housakuhit];
$TIBENTOMNO[99] = "$housakuhit<>$t_setuzoku_saki{$ft_id}[0]<>$t_setuzoku_saki{$ft_id}[1]<>$t_setuzoku_saki{$ft_id}[2]<>$t_setuzoku_saki{$ft_id}[3]<>$t_setuzoku_saki{$ft_id}[4]<>$t_setuzoku_saki{$ft_id}[5]<>$t_setuzoku_saki{$ft_id}[6]<>$t_setuzoku_saki{$ft_id}[7]<><><><><><><>";
					@iz = ();
$ibenttiku0 = "$TIBENTOM[$tibento]では、木花咲耶姫の加護により好天が続き農作物がスクスクと育っています。来期は豊作となりそうです。";
			}
($iz[0],$iz[1],$iz[2],$iz[3],$iz[4],$iz[5],$iz[6],$iz[7],$iz[8],$iz[9],$zi[10],$iz[11],$iz[12],$iz[13],$iz[14])=split(/<>/,$TIBENTOMNO[$tibento]);
					@IBENTOWT = @iz;
			}elsif($ino eq "4"){
$tibento5 = 0;
$TIBENTOM5[0] = '';
$TIBENTOM5[10] = '';
$TIBENTOM5[20] = '';
$TIBENTOM[0] = '倭';
#わ
$TIBENTOM[1] = '荊州北部';
#宛、シンヤ、じょうよう、こうりょう、こうか、じょうよう、えいあん
$TIBENTOM[2] = '荊州南部';
#ちょうさ、ぶりょう、れいりょう、けいよう
$TIBENTOM[3] = '司州';
$TIBENTOM[4] = '予州';
$TIBENTOM[5] = '益州北部';
$TIBENTOM[6] = '益州南部';
$TIBENTOM[7] = '揚州北部';
$TIBENTOM[8] = '揚州南部';
$TIBENTOM[9] = '冀州';
$TIBENTOM[10] = '青州';
$TIBENTOM[11] = '徐州';
$TIBENTOM[12] = '幽州東部';
$TIBENTOM[13] = '幽州西部';
$TIBENTOM[14] = '并州';
$TIBENTOM[15] = '涼州南東部';
$TIBENTOM[16] = '涼州北西部';
$TIBENTOM[17] = '亠兌州';
$TIBENTOM[18] = '交州東部';
$TIBENTOM[19] = '交州西部';
$zc = @TIBENTOM;
			$tibento = int(rand($zc));

$TIBENTOMNO[0] = '22<>78<><><><><><><><><><><><><><>';
$TIBENTOMNO[1] = '16<>25<>26<>32<><><><><><><><><><><><>';
$TIBENTOMNO[2] = '38<>40<>41<>37<><><><><><><><><><><><>';
$TIBENTOMNO[3] = '10<>9<>5<>61<>62<><><><><><><><><><><>';
$TIBENTOMNO[4] = '11<>42<>47<>48<><><><><><><><><><><><>';
$TIBENTOMNO[5] = '70<>55<>59<>15<>21<>20<>23<>24<>31<><><><><><><>';
$TIBENTOMNO[6] = '76<>65<>64<>30<>67<>54<>53<>75<><><><><><><><>';
$TIBENTOMNO[7] = '17<>29<>35<>27<>33<><><><><><><><><><><>';
$TIBENTOMNO[8] = '28<>44<>49<>71<><><><><><><><><><><><>';
$TIBENTOMNO[9] = '3<>6<>82<><><><><><><><><><><><><>';
$TIBENTOMNO[10] = '7<>8<>77<>43<><><><><><><><><><><><>';
$TIBENTOMNO[11] = '68<>14<>18<>73<><><><><><><><><><><><>';
$TIBENTOMNO[12] = '0<>52<>79<><><><><><><><><><><><><>';
$TIBENTOMNO[13] = '34<>50<>51<><><><><><><><><><><><><>';
$TIBENTOMNO[14] = '2<>58<>60<><><><><><><><><><><><><>';
$TIBENTOMNO[15] = '39<>4<>81<>56<><><><><><><><><><><><>';
$TIBENTOMNO[16] = '1<>46<>83<><><><><><><><><><><><><>';
$TIBENTOMNO[17] = '12<>13<>72<><><><><><><><><><><><><>';
$TIBENTOMNO[18] = '45<>63<>66<>74<><><><><><><><><><><><>';
$TIBENTOMNO[19] = '80<>19<>36<>57<>69<><><><><><><><><><><>';

$TIBENTOM3[0] = '震源の深さはごく浅く、';
$TIBENTOM3[1] = '震源の深さは10km、';
$TIBENTOM3[2] = '震源の深さは20km、';
$TIBENTOM3[3] = '震源の深さは30km、';
$TIBENTOM3[4] = '震源の深さは40km、';
$TIBENTOM3[5] = '震源の深さは50km、';
$TIBENTOM3[6] = '震源の深さは60km、';
$zc = @TIBENTOM3;
			$tibento3 = int(rand($zc));
$TIBENTOM4[0] = '地震の規模はM5.3と推定されます。';
$TIBENTOM4[1] = '地震の規模はM5.6と推定されます。';
$TIBENTOM4[2] = '地震の規模はM5.9と推定されます。';
$TIBENTOM4[3] = '地震の規模はM6.2と推定されます。';
$TIBENTOM4[4] = '地震の規模はM6.5と推定されます。';
$TIBENTOM4[5] = '地震の規模はM6.8と推定されます。';
$TIBENTOM4[6] = '地震の規模はM7.1と推定されます。';
$TIBENTOM4[7] = '地震の規模はM7.3と推定されます。';
$zc = @TIBENTOM4;
			$tibento4 = int(rand($zc))+$tibento3;
		if($tibento4 > 7){
			$tibento4 = 7;
		}
$TIBENTOM5[1] = '<br />・この地震の影響で浅間山が噴火した模様です。。多くの街が溶岩に飲み込まれてしまいました。。';
$TIBENTOM5[2] = '<br />・この地震の影響で磐梯山が噴火した模様です。。降灰により付近の農村に大きな被害が出ています。。';
$TIBENTOM5[3] = '<br />・この地震の影響で富士山が噴火した模様です。。降灰により付近の農村に大きな被害が出ています。。';
$TIBENTOM5[4] = '<br />・この地震の影響で三宅島が噴火した模様です。。降灰により付近の農村に大きな被害が出ています。。';
$TIBENTOM5[5] = '<br />・この地震の影響で十勝岳が噴火した模様です。。降灰により付近の農村に大きな被害が出ています。。';
$TIBENTOM5[6] = '<br />・この地震の影響で桜島が噴火した模様です。。降灰により付近の農村に大きな被害が出ています。。';
$TIBENTOM5[7] = '<br />・この地震の影響で阿蘇山が噴火した模様です。。降灰により付近の農村に大きな被害が出ています。。';
$TIBENTOM5[11] = '<br />・この地震の影響で黄河河川敷が決壊し、更に大きな被害が出ている模様です。';
$TIBENTOM5[12] = '<br />・この地震の影響で長江河川敷が決壊し、更に大きな被害が出ている模様です。';
$TIBENTOM5[13] = '<br />・この地震の影響で洞庭湖の堤防が決壊し、更に大きな被害が出ている模様です。';
$TIBENTOM5[14] = '<br />・この地震の影響で長江・洛水の合流地点が決壊し、更に大きな被害が出ている模様です。';
$TIBENTOM5[15] = '<br />・この地震の影響で鄱陽湖の堤防が決壊し、更に大きな被害が出ている模様です。';
$TIBENTOM5[16] = '<br />・この地震の影響で淮河河川敷が決壊し、更に大きな被害が出ている模様です。';
$TIBENTOM5[17] = '<br />・この地震の影響で遼河河川敷が決壊し、更に大きな被害が出ている模様です。';
$TIBENTOM5[17] = '<br />・この地震の影響で弋居の鉄鋼脈鉱山に大きな被害が出た模様です。';
$TIBENTOM5[21] = '<br />・この地震の影響で沿岸付近を高さ３ｍの津波が襲った模様です。';
$TIBENTOM5[22] = '<br />・この地震の影響で沿岸付近を高さ５ｍの津波が襲った模様です。';
$TIBENTOM5[23] = '<br />・この地震の影響で沿岸付近を高さ１０ｍの津波が襲った模様です。';
$TIBENTOM5[24] = '<br />・この地震の影響で沿岸付近を高さ２０ｍの津波が襲った模様です。。多くの街が海に飲み込まれてしまいました。。';
$TIBENTOM5[25] = '<br />・この地震の影響で沿岸付近を高さ３０ｍの津波が襲った模様です。。多くの街が海に飲み込まれてしまいました。。';
	if($tibento == 0){
$TIBENTOM2[0] = '震源地は紀伊半島沖、';
$TIBENTOM2[1] = '震源地は南海沖、';
$TIBENTOM2[2] = '震源地は東海沖、';
$TIBENTOM2[3] = '震源地は東南海沖、';
$TIBENTOM2[4] = '震源地は十勝沖、';
$TIBENTOM2[5] = '震源地は房総半島沖、';
$TIBENTOM2[6] = '震源地は本州内陸部、';
$TIBENTOM2[7] = '震源地は九州内陸部、';
$zc = @TIBENTOM2;
			$tibento2 = int(rand($zc));
		if($tibento2 < 6 and !int(rand(3))){
			$tibento5 = int(rand(6));
			$tibento5 = "2$tibento5";
		}elsif($tibento2 == 6 and !int(rand(3))){
			$tibento5 = int(rand(4));
		}elsif($tibento2 == 2 and !int(rand(3))){
			$tibento5 = int(rand(2))+3;
		}elsif($tibento2 == 7 and !int(rand(3))){
			$tibento5 = int(rand(2))+6;
		}
			if($tibento5 and $tibento5 < 10 and $k_kokkyou{$p_kunino{$f_id}} eq "12"){
	if($k_kokkyou_keika_nen{$p_kunino{$f_id}} > 10){
			$tibento5 = 0;
	}
			}
	}elsif($tibento == 1){
$TIBENTOM2[0] = '震源地は南陽郡宛、';
$TIBENTOM2[1] = '震源地は南陽郡新野、';
$TIBENTOM2[2] = '震源地は南陽郡、';
$TIBENTOM2[3] = '震源地は江夏郡竟陵、';
$TIBENTOM2[4] = '震源地は南郡夷陵、';
$TIBENTOM2[5] = '震源地は南郡襄陽、';
$TIBENTOM2[6] = '震源地は南郡江陵、';
$zc = @TIBENTOM2;
			$tibento2 = int(rand($zc));
		if($tibento2 > 2 and !int(rand(3))){
			$tibento5 = 12;
		}
	}elsif($tibento == 2){
$TIBENTOM2[0] = '震源地は武陵郡漢寿、';
$TIBENTOM2[1] = '震源地は長沙郡臨湘、';
$TIBENTOM2[2] = '震源地は桂陽郡耒陽、';
$TIBENTOM2[3] = '震源地は零陵郡烝陽、';
$zc = @TIBENTOM2;
			$tibento2 = int(rand($zc));
		if($tibento2 < 3 and !int(rand(3))){
			$tibento5 = int(rand(2))+2;
			$tibento5 = "1$tibento5";
		}
	}elsif($tibento == 3){
$TIBENTOM2[0] = '震源地は河東郡楊、';
$TIBENTOM2[1] = '震源地は扶風郡陳倉、';
$TIBENTOM2[2] = '震源地は河南尹洛陽、';
$TIBENTOM2[3] = '震源地は河内郡朝歌、';
$TIBENTOM2[4] = '震源地は弘農郡盧氏、';
$TIBENTOM2[5] = '震源地は京兆尹長安、';
$TIBENTOM2[6] = '震源地は馮翊郡池陽、';
$TIBENTOM2[7] = '震源地は漢安郡陳倉、';
$TIBENTOM2[8] = '震源地は新平郡漆、';
$zc = @TIBENTOM2;
			$tibento2 = int(rand($zc));
		if(!int(rand(3))){
			$tibento5 = 11;
		}
	}elsif($tibento == 4){
$TIBENTOM2[0] = '震源地は沛国公丘、';
$TIBENTOM2[1] = '震源地は梁国寧陵、';
$TIBENTOM2[2] = '震源地は言焦国言焦、';
$TIBENTOM2[3] = '震源地は潁川郡舞陽、';
$TIBENTOM2[4] = '震源地は汝南郡宋、';
$TIBENTOM2[5] = '震源地は陽安郡朗陵、';
$TIBENTOM2[6] = '震源地は陳国陽夏、';
$TIBENTOM2[7] = '震源地は魯国薛、';
$zc = @TIBENTOM2;
			$tibento2 = int(rand($zc));
	}elsif($tibento == 5){
$TIBENTOM2[0] = '震源地は漢中郡西城、';
$TIBENTOM2[1] = '震源地は上庸郡北巫、';
$TIBENTOM2[2] = '震源地は巴郡江州、';
$TIBENTOM2[3] = '震源地は広漢郡梓潼、';
$TIBENTOM2[4] = '震源地は蜀郡成都、';
$TIBENTOM2[5] = '震源地は牛建為郡江陽、';
$zc = @TIBENTOM2;
			$tibento2 = int(rand($zc));
		if($tibento2 == 5 and !int(rand(3))){
			$tibento5 = 14;
		}elsif($tibento2 == 2 and !int(rand(3))){
			$tibento5 = 12;
		}
	}elsif($tibento == 6){
$TIBENTOM2[0] = '震源地は牂牁郡漏江、';
$TIBENTOM2[1] = '震源地は越巂郡霊関道、';
$TIBENTOM2[2] = '震源地は益州郡建伶、';
$TIBENTOM2[3] = '震源地は永昌郡不韋、';
$TIBENTOM2[4] = '震源地は雲南郡雲南、';
$zc = @TIBENTOM2;
			$tibento2 = int(rand($zc));
	}elsif($tibento == 7){
$TIBENTOM2[0] = '震源地は九江郡寿春、';
$TIBENTOM2[1] = '震源地は九江郡合肥、';
$TIBENTOM2[2] = '震源地は丹陽郡秣陵、';
$TIBENTOM2[3] = '震源地は廬江郡潜、';
$TIBENTOM2[4] = '震源地は予章郡柴桑、';
$TIBENTOM2[5] = '震源地は東シナ海沖、';
$zc = @TIBENTOM2;
			$tibento2 = int(rand($zc));
		if($tibento2 < 5 and !int(rand(3))){
			$tibento5 = 12;
		}elsif($tibento2 == 4 and !int(rand(3))){
			$tibento5 = 15;
		}elsif($tibento2 == 5 and !int(rand(3))){
			$tibento5 = int(rand(6));
			$tibento5 = "2$tibento5";
		}
	}elsif($tibento == 8){
$TIBENTOM2[0] = '震源地は会稽郡山陰、';
$TIBENTOM2[1] = '震源地は呉郡富春、';
$TIBENTOM2[2] = '震源地は会稽郡東侯官、';
$TIBENTOM2[3] = '震源地は呉郡呉、';
$TIBENTOM2[4] = '震源地は美麗島内陸部、';
$TIBENTOM2[5] = '震源地は美麗島海峡沖、';
$zc = @TIBENTOM2;
			$tibento2 = int(rand($zc));
		if($tibento2 > 1 and !int(rand(3))){
			$tibento5 = int(rand(6));
			$tibento5 = "2$tibento5";
		}
	}elsif($tibento == 9){
$TIBENTOM2[0] = '震源地は魏郡鄴、';
$TIBENTOM2[1] = '震源地は勃海郡南皮、';
$TIBENTOM2[2] = '震源地は清河国広川、';
$TIBENTOM2[3] = '震源地は鉅鹿郡任、';
$TIBENTOM2[4] = '震源地は常山国真定、';
$TIBENTOM2[5] = '震源地は中山国北平、';
$TIBENTOM2[6] = '震源地は安平国信都、';
$TIBENTOM2[7] = '震源地は河間国鄚、';
$TIBENTOM2[8] = '震源地は趙国易陽、';
$zc = @TIBENTOM2;
			$tibento2 = int(rand($zc));
		if($tibento2 < 3 and !int(rand(3))){
			$tibento5 = 11;
		}
	}elsif($tibento == 10){
$TIBENTOM2[0] = '震源地は済南国東平陵、';
$TIBENTOM2[1] = '震源地は平原郡高唐、';
$TIBENTOM2[2] = '震源地は楽安国臨済、';
$TIBENTOM2[3] = '震源地は北海国平寿、';
$TIBENTOM2[4] = '震源地は斉国般陽、';
$TIBENTOM2[5] = '震源地は東莱郡長広、';
$TIBENTOM2[6] = '震源地は黄海沖、';
$zc = @TIBENTOM2;
			$tibento2 = int(rand($zc));
		if($tibento2 < 3 and !int(rand(3))){
			$tibento5 = 11;
		}elsif($tibento2 > 4 and !int(rand(3))){
			$tibento5 = int(rand(6));
			$tibento5 = "2$tibento5";
		}
	}elsif($tibento == 11){
$TIBENTOM2[0] = '震源地は黄海沖、';
$TIBENTOM2[1] = '震源地は東海郡陰平、';
$TIBENTOM2[2] = '震源地は琅邪国開陽、';
$TIBENTOM2[3] = '震源地は城陽郡城陽、';
$TIBENTOM2[4] = '震源地は広陵郡海西、';
$TIBENTOM2[5] = '震源地は下邳国淮陰、';
$TIBENTOM2[6] = '震源地は彭城国武原、';
$zc = @TIBENTOM2;
			$tibento2 = int(rand($zc));
		if($tibento2 > 3 and $tibento2 ne "6" and !int(rand(3))){
			$tibento5 = 16;
		}elsif($tibento2 < 5 and !int(rand(3))){
			$tibento5 = int(rand(6));
			$tibento5 = "2$tibento5";
		}
	}elsif($tibento == 12){
$TIBENTOM2[0] = '震源地は渤海沖、';
$TIBENTOM2[1] = '震源地は西朝鮮湾沖、';
$TIBENTOM2[2] = '震源地は楽浪郡朝鮮、';
$TIBENTOM2[3] = '震源地は遼西郡令支、';
$TIBENTOM2[4] = '震源地は遼東郡襄平、';
$TIBENTOM2[5] = '震源地は玄菟郡遼陽、';
$zc = @TIBENTOM2;
			$tibento2 = int(rand($zc));
		if($tibento2 > 3 and !int(rand(3))){
			$tibento5 = 17;
		}elsif($tibento2 < 5 and !int(rand(3))){
			$tibento5 = int(rand(6));
			$tibento5 = "2$tibento5";
		}
	}elsif($tibento == 13){
$TIBENTOM2[0] = '震源地は右北平郡徐無、';
$TIBENTOM2[1] = '震源地は漁陽郡狐奴、';
$TIBENTOM2[2] = '震源地は上谷郡下落、';
$TIBENTOM2[3] = '震源地は代郡東安陽、';
$TIBENTOM2[4] = '震源地は広陽郡薊、';
$TIBENTOM2[5] = '震源地は涿郡故安、';
$zc = @TIBENTOM2;
			$tibento2 = int(rand($zc));
	}elsif($tibento == 14){
$TIBENTOM2[0] = '震源地は上党郡壺関、';
$TIBENTOM2[1] = '震源地は太原郡晋陽、';
$TIBENTOM2[2] = '震源地は上郡膚施、';
$TIBENTOM2[3] = '震源地は西河郡離石、';
$TIBENTOM2[4] = '震源地は五原郡九原、';
$TIBENTOM2[5] = '震源地は雲中郡雲中、';
$TIBENTOM2[6] = '震源地は定襄郡中陵、';
$TIBENTOM2[7] = '震源地は雁門郡陰館、';
$TIBENTOM2[8] = '震源地は朔方郡臨戎、';
$zc = @TIBENTOM2;
			$tibento2 = int(rand($zc));
	}elsif($tibento == 15){
$TIBENTOM2[0] = '震源地は隴西郡狄道、';
$TIBENTOM2[1] = '震源地は漢陽郡街泉亭、';
$TIBENTOM2[2] = '震源地は安定郡臨涇、';
$TIBENTOM2[3] = '震源地は武都郡下弁、';
$TIBENTOM2[4] = '震源地は北地郡弋居、';
$zc = @TIBENTOM2;
			$tibento2 = int(rand($zc));
		if($tibento2 == 4 and !int(rand(3))){
			$tibento5 = 18;
		}
	}elsif($tibento == 16){
$TIBENTOM2[0] = '震源地は張掖郡昭武、';
$TIBENTOM2[1] = '震源地は酒泉郡会水、';
$TIBENTOM2[2] = '震源地は敦煌郡冥安、';
$TIBENTOM2[3] = '震源地は金城郡臨羌、';
$TIBENTOM2[4] = '震源地は西平郡西平、';
$TIBENTOM2[5] = '震源地は武威郡祖厲、';
$zc = @TIBENTOM2;
			$tibento2 = int(rand($zc));
	}elsif($tibento == 17){
$TIBENTOM2[0] = '震源地は陳留郡酸棗、';
$TIBENTOM2[1] = '震源地は東郡濮陽、';
$TIBENTOM2[2] = '震源地は東平国寿張、';
$TIBENTOM2[3] = '震源地は任城国亢父、';
$TIBENTOM2[4] = '震源地は泰山郡鉅平、';
$TIBENTOM2[5] = '震源地は済北国蛇丘、';
$TIBENTOM2[6] = '震源地は山陽郡鉅野、';
$TIBENTOM2[7] = '震源地は済陰郡定陶、';
$zc = @TIBENTOM2;
			$tibento2 = int(rand($zc));
	}elsif($tibento == 18){
$TIBENTOM2[0] = '震源地は九江郡寿春、';
$TIBENTOM2[1] = '震源地は九江郡合肥、';
$TIBENTOM2[2] = '震源地は丹陽郡秣陵、';
$TIBENTOM2[3] = '震源地は廬江郡潜、';
$TIBENTOM2[4] = '震源地は予章郡柴桑、';
$TIBENTOM2[5] = '震源地は東シナ海沖、';
$zc = @TIBENTOM2;
			$tibento2 = int(rand($zc));
		if($tibento2 < 5 and !int(rand(3))){
			$tibento5 = 12;
		}elsif($tibento2 == 4 and !int(rand(3))){
			$tibento5 = 15;
		}elsif($tibento2 == 5 and !int(rand(3))){
			$tibento5 = int(rand(6));
			$tibento5 = "2$tibento5";
		}
	}elsif($tibento == 19){
$TIBENTOM2[0] = '震源地は九江郡寿春、';
$TIBENTOM2[1] = '震源地は九江郡合肥、';
$TIBENTOM2[2] = '震源地は丹陽郡秣陵、';
$TIBENTOM2[3] = '震源地は廬江郡潜、';
$TIBENTOM2[4] = '震源地は予章郡柴桑、';
$TIBENTOM2[5] = '震源地は東シナ海沖、';
$zc = @TIBENTOM2;
			$tibento2 = int(rand($zc));
		if($tibento2 < 5 and !int(rand(3))){
			$tibento5 = 12;
		}elsif($tibento2 == 4 and !int(rand(3))){
			$tibento5 = 15;
		}elsif($tibento2 == 5 and !int(rand(3))){
			$tibento5 = int(rand(6));
			$tibento5 = "2$tibento5";
		}
	}
					@iz = ();
$ibenttiku0 = "$TIBENTOM[$tibento]で大地震が発生しました！各地で甚大な被害が出ている模様です。。<br />・$TIBENTOM2[$tibento2]$TIBENTOM3[$tibento3]$TIBENTOM4[$tibento4]$TIBENTOM5[0]";
			if($housakuhit){
$housakuhit -= 1;
							$ft_id = $housakuhit;
			$tibento = 99;
$TIBENTOM[99] = $t_name[$housakuhit];
$TIBENTOMNO[99] = "$housakuhit<>$t_setuzoku_saki{$ft_id}[0]<>$t_setuzoku_saki{$ft_id}[1]<>$t_setuzoku_saki{$ft_id}[2]<>$t_setuzoku_saki{$ft_id}[3]<>$t_setuzoku_saki{$ft_id}[4]<>$t_setuzoku_saki{$ft_id}[5]<>$t_setuzoku_saki{$ft_id}[6]<>$t_setuzoku_saki{$ft_id}[7]<><><><><><><>";

					@iz = ();
$ibenttiku0 = "天地を揺るがす轟音と伴に$t_name[$housakuhit]の地中奥深くに相柳が現れ、大地を深く切り刻み、周辺都市に大地震が発生しました！！各地で甚大な被害が出ている模様です。。";
			}
($iz[0],$iz[1],$iz[2],$iz[3],$iz[4],$iz[5],$iz[6],$iz[7],$iz[8],$iz[9],$zi[10],$iz[11],$iz[12],$iz[13],$iz[14])=split(/<>/,$TIBENTOMNO[$tibento]);
					@IBENTOWT = @iz;
			}elsif($ino eq "5"){
$zc = $tosi_kazu;
			$tibento = int(rand($zc));
							$ft_id = $tibento;
					$t_setuzoku_saki{$ft_id}[10] = $tibento;
					@IBENTOWT = @{$t_setuzoku_saki{$ft_id}};
$ibenttiku0 = "$t_name[$tibento]近辺の都市では、好景気が続き街の商店が賑わっています！";
			}elsif($ino eq "6" and ($tuki_genzai > 10 or $tuki_genzai < 2)){
$TIBENTOM[0] = '倭の山間部';
$TIBENTOM[1] = '幽州東部の山間部';
$TIBENTOM[2] = '幽州西部の山間部';
$TIBENTOM[3] = '并州の山間部';
$TIBENTOM[4] = '涼州南東部の山間部';
$TIBENTOM[5] = '涼州北西部の山間部';
$zc = @TIBENTOM;
			$tibento = int(rand($zc));
$TIBENTOMNO[0] = '22<><><><><><><><><><><><><><><>';
$TIBENTOMNO[1] = '0<>52<>79<><><><><><><><><><><><><>';
$TIBENTOMNO[2] = '34<>50<>51<><><><><><><><><><><><><>';
$TIBENTOMNO[3] = '2<>58<>60<><><><><><><><><><><><><>';
$TIBENTOMNO[4] = '39<>4<>81<>56<><><><><><><><><><><><>';
$TIBENTOMNO[5] = '1<>46<>83<><><><><><><><><><><><><>';
					@iz = ();
($iz[0],$iz[1],$iz[2],$iz[3],$iz[4],$iz[5],$iz[6],$iz[7],$iz[8],$iz[9],$zi[10],$iz[11],$iz[12],$iz[13],$iz[14])=split(/<>/,$TIBENTOMNO[$tibento]);
					@IBENTOWT = @iz;
$ibenttiku0 = "$TIBENTOM[$tibento]では、近年稀に見る大雪が降り農作物に悪影響が出ている模様です。来期の収穫が心配されます。";

			}elsif($ino eq "7" and ($tuki_genzai < 7 and $tuki_genzai > 4)){
$zc = $tosi_kazu;
			$tibento = int(rand($zc));

$ibenttiku0 = "$t_name[$tibento]近辺の都市では、炎天下が続き農作物に悪影響が出ている模様です。来期の収穫が心配されます。";
			if($housakuhit){
$housakuhit -= 1;
							$ft_id = $housakuhit;
			$tibento = $housakuhit;
$TIBENTOM[99] = $t_name[$housakuhit];
$TIBENTOMNO[99] = "$housakuhit<>$t_setuzoku_saki{$ft_id}[0]<>$t_setuzoku_saki{$ft_id}[1]<>$t_setuzoku_saki{$ft_id}[2]<>$t_setuzoku_saki{$ft_id}[3]<>$t_setuzoku_saki{$ft_id}[4]<>$t_setuzoku_saki{$ft_id}[5]<>$t_setuzoku_saki{$ft_id}[6]<>$t_setuzoku_saki{$ft_id}[7]<><><><><><><>";

					@iz = ();
$ibenttiku0 = "$t_name[$housakuhit]上空天高く、一陣の風と伴に女魃が現れると、辺り一面は天地を焼け焦がす程の光と熱とで覆い尽くされる！！周辺都市で大旱魃が発生しました！！各地で甚大な被害が出ている模様です。。";
			}

							$ft_id = $tibento;
					$t_setuzoku_saki{$ft_id}[10] = $tibento;
					@IBENTOWT = @{$t_setuzoku_saki{$ft_id}};
			}elsif($ino eq "8" and ($tuki_genzai < 11 and $tuki_genzai > 4)){
$TIBENTOM[0] = '倭';
$TIBENTOM[1] = '琉球';
$TIBENTOM[2] = '美麗島';
$TIBENTOM[3] = '南海';
$TIBENTOM[4] = '海南島';
$TIBENTOM[5] = '日南';
$TIBENTOM[6] = '扶南';
$TIBENTOM[7] = '琉球付近を通過し漢陽';
$zc = @TIBENTOM;
			$tibento = int(rand($zc));
$TIBENTOMNO[0] = '22<><><><><><><><><><><><><><><>';
$TIBENTOMNO[1] = '22<>78<><><><><><><><><><><><><><>';
$TIBENTOMNO[2] = '78<>71<>49<>35<><><><><><><><><><><><>';
$TIBENTOMNO[3] = '71<>49<>63<>44<><><><><><><><><><><><>';
$TIBENTOMNO[4] = '74<>45<>63<>66<><><><><><><><><><><><>';
$TIBENTOMNO[5] = '36<>69<>74<>19<><><><><><><><><><><><>';
$TIBENTOMNO[6] = '69<>57<>36<><><><><><><><><><><><><>';
$TIBENTOMNO[7] = '79<>78<>22<><><><><><><><><><><><><>';

					@iz = ();
($iz[0],$iz[1],$iz[2],$iz[3],$iz[4],$iz[5],$iz[6],$iz[7],$iz[8],$iz[9],$zi[10],$iz[11],$iz[12],$iz[13],$iz[14])=split(/<>/,$TIBENTOMNO[$tibento]);
					@IBENTOWT = @iz;
$ibenttiku0 = "近年稀に見る巨大な台風が$TIBENTOM[$tibento]に直撃し、周辺都市で壊滅的な被害が出ている模様です。";
			}else{
			$ihit=0;
			}
		}
			}

	&BAG_LOG("イベントEnd\n");
					$zokuh = 0;
			if($ihit){
$ibenttiku2 = "";
		foreach(@IBENTOWT){

if($_ ne ""){
							$ft_id = $_;
	&BAG_LOG("イベント都市処理$ft_id\n");

$i = $_;

$ibenttiku2 .= "$t_name{$ft_id} ";
					$kadd = 0;

###########
				if($ino eq "0"){
$ibenttiku1 = 'イナゴ被災';
			if($k_kokkyou{$t_kunino{$ft_id}} eq "14"){
	if($k_kokkyou_keika_nen{$t_kunino{$ft_id}} > 10){
		if(!$kadd1){
$ibenttiku3 = "<br />・$KOKKYOU[$k_kokkyou{$t_kunino{$ft_id}}]の加護を受けた都市⇒";
		}
$ibenttiku3 .= "$t_name{$ft_id} ";
					$kadd ++;
					$kadd1 ++;
	}
			}
	if(!$kadd){
					$t_nougyou_ti{$ft_id} = int($t_nougyou_ti{$ft_id} * 0.6);
					$saigaiadd = int($t_nougyou_max{$ft_id} * 0.001);
					$t_nougyou_max{$ft_id} -= $saigaiadd * 100;
				$t_kome_souba{$ft_id} -= int(rand(10))/200;
				$t_tian_ti{$ft_id} -= 10;
			if($t_tian_ti{$ft_id} < 0){
				$t_tian_ti{$ft_id} = 0;
			}
	}
				}elsif($ino eq "1"){
$ibenttiku1 = '洪水被災';
			if($k_kokkyou{$t_kunino{$ft_id}} eq "2"){
	if($k_kokkyou_keika_nen{$t_kunino{$ft_id}} > 5){
		if(!$kadd1){
$ibenttiku3 = "<br />・$KOKKYOU[$k_kokkyou{$t_kunino{$ft_id}}]の加護を受けた都市⇒";
		}
$ibenttiku3 .= "$t_name{$ft_id} ";
					$kadd ++;
					$kadd1 ++;
	}
			}
			if($k_kokkyou{$t_kunino{$ft_id}} eq "12"){
	if($k_kokkyou_keika_nen{$t_kunino{$ft_id}} > 10){
		if(!$kadd2){
$ibenttiku4 = "<br />・$KOKKYOU[$k_kokkyou{$t_kunino{$ft_id}}]の加護を受けた都市⇒";
		}
$ibenttiku4 .= "$t_name{$ft_id} ";
					$kadd ++;
					$kadd2 ++;
	}
			}
	if(!$kadd){
				$t_kome_souba{$ft_id} -= int(rand(10))/200;
					$t_nougyou_ti{$ft_id} = int($t_nougyou_ti{$ft_id} * 0.7);
					$saigaiadd = int($t_nougyou_max{$ft_id} * 0.001);
					$t_nougyou_max{$ft_id} -= $saigaiadd * 100;
					$t_syougyou_ti{$ft_id} = int($t_syougyou_ti{$ft_id} * 0.8);
					$t_siro_bouei_ti{$ft_id} = int($t_siro_bouei_ti{$ft_id} * 0.9);
					$t_siro_taikyuu_ti{$ft_id} = int($t_siro_taikyuu_ti{$ft_id} * 0.8);
					$t_ryoumin_suu{$ft_id} = int($t_ryoumin_suu{$ft_id} * 0.9);
				$t_tian_ti{$ft_id} -= 5;
			if($t_tian_ti{$ft_id} < 0){
				$t_tian_ti{$ft_id} = 0;
			}
	}
				}elsif($ino eq "2"){
$ibenttiku1 = '疫病被災';
			if($k_kokkyou{$t_kunino{$ft_id}} eq "3"){
	if($k_kokkyou_keika_nen{$t_kunino{$ft_id}} > 10){
		if(!$kadd1){
$ibenttiku3 = "<br />・$KOKKYOU[$k_kokkyou{$t_kunino{$ft_id}}]の加護を受けた都市⇒";
		}
$ibenttiku3 .= "$t_name{$ft_id} ";
					$kadd ++;
					$kadd1 ++;
	}
			}
	if(!$kadd){
				$t_kome_souba{$ft_id} -= int(rand(10))/200;
					$t_ryoumin_suu{$ft_id} = int($t_ryoumin_suu{$ft_id} * 0.6);
					$t_syougyou_ti{$ft_id} = int($t_syougyou_ti{$ft_id} * 0.7);
					$saigaiadd = int($t_syougyou_max{$ft_id} * 0.001);
					$t_syougyou_max{$ft_id} -= $saigaiadd * 100;
	}
				}elsif($ino eq "3"){
$ibenttiku1 = '豊作発生';
					$t_nougyou_max{$ft_id} += 1000;
					$t_nougyou_ti{$ft_id} = int($t_nougyou_ti{$ft_id} * 1.5);
					if($t_nougyou_ti{$ft_id} > $t_nougyou_max{$ft_id}){$t_nougyou_ti{$ft_id}=$t_nougyou_max{$ft_id};}
				$t_kome_souba{$ft_id} += int(rand(10))/200;
				}elsif($ino eq "4"){
$ibenttiku1 = '地震被災';
			if($k_kokkyou{$t_kunino{$ft_id}} eq "2"){
	if($k_kokkyou_keika_nen{$t_kunino{$ft_id}} > 10){
		if(!$kadd1){
$ibenttiku3 = "<br />・$KOKKYOU[$k_kokkyou{$t_kunino{$ft_id}}]の加護を受けた都市⇒";
		}
$ibenttiku3 .= "$t_name{$ft_id} ";
					$kadd ++;
					$kadd1 ++;
	}
			}
	if(!$kadd){
				$t_kome_souba{$ft_id} -= int(rand(10))/200;
					$t_nougyou_ti{$ft_id} = int($t_nougyou_ti{$ft_id} * 0.9);
					$t_syougyou_ti{$ft_id} = int($t_syougyou_ti{$ft_id} * 0.7);
					$saigaiadd = int($t_syougyou_max{$ft_id} * 0.001);
					$t_syougyou_max{$ft_id} -= $saigaiadd * 100;
					$t_siro_bouei_ti{$ft_id} = int($t_siro_bouei_ti{$ft_id} * 0.7);
					$saigaiadd = int($t_siro_bouei_max{$ft_id} * 0.001);
					$t_siro_bouei_max{$ft_id} -= $saigaiadd * 100;
					$t_siro_taikyuu_ti{$ft_id} = int($t_siro_taikyuu_ti{$ft_id} * 0.5);
					$t_ryoumin_suu{$ft_id} = int($t_ryoumin_suu{$ft_id} * 0.8);
				$t_tian_ti{$ft_id} -= 10;
			if($t_tian_ti{$ft_id} < 0){
				$t_tian_ti{$ft_id} = 0;
			}
	}
				}elsif($ino eq "5"){
$ibenttiku1 = '好景気発生';
					$t_syougyou_max{$ft_id} += 1000;
					$t_syougyou_ti{$ft_id} = int($t_syougyou_ti{$ft_id} * 1.5);
					if($t_syougyou_ti{$ft_id} > $t_syougyou_max{$ft_id}){$t_syougyou_ti{$ft_id}=$t_syougyou_max{$ft_id};}
					$t_ryoumin_suu{$ft_id} = int($t_ryoumin_suu{$ft_id} * 1.2);
				$t_kome_souba{$ft_id} -= int(rand(10))/200;
				}elsif($ino eq "6"){
$ibenttiku1 = '大雪被災';
					$t_nougyou_ti{$ft_id} = int($t_nougyou_ti{$ft_id} * 0.6);
					$saigaiadd = int($t_nougyou_max{$ft_id} * 0.001);
					$t_nougyou_max{$ft_id} -= $saigaiadd * 100;
				$t_kome_souba{$ft_id} -= int(rand(10))/200;
				}elsif($ino eq "7"){
$ibenttiku1 = '旱魃被災';
			if($k_kokkyou{$t_kunino{$ft_id}} eq "7"){
	if($k_kokkyou_keika_nen{$t_kunino{$ft_id}} > 5){
		if(!$kadd1){
$ibenttiku3 = "<br />・$KOKKYOU[$k_kokkyou{$t_kunino{$ft_id}}]の加護を受けた都市⇒";
		}
$ibenttiku3 .= "$t_name{$ft_id} ";
					$kadd ++;
					$kadd1 ++;
	}
			}
	if(!$kadd){
					$t_nougyou_ti{$ft_id} = int($t_nougyou_ti{$ft_id} * 0.6);
					$saigaiadd = int($t_nougyou_max{$ft_id} * 0.001);
					$t_nougyou_max{$ft_id} -= $saigaiadd * 100;
				$t_kome_souba{$ft_id} -= int(rand(10))/200;
				$t_tian_ti{$ft_id} -= 5;
			if($t_tian_ti{$ft_id} < 0){
				$t_tian_ti{$ft_id} = 0;
			}
	}
				}elsif($ino eq "8"){
$ibenttiku1 = '台風被災';
				$t_kome_souba{$ft_id} -= int(rand(10))/200;
					$t_nougyou_ti{$ft_id} = int($t_nougyou_ti{$ft_id} * 0.7);
					$saigaiadd = int($t_nougyou_max{$ft_id} * 0.001);
					$t_nougyou_max{$ft_id} -= $saigaiadd * 100;
					$t_syougyou_ti{$ft_id} = int($t_syougyou_ti{$ft_id} * 0.8);
					$t_siro_bouei_ti{$ft_id} = int($t_siro_bouei_ti{$ft_id} * 0.9);
					$t_siro_taikyuu_ti{$ft_id} = int($t_siro_taikyuu_ti{$ft_id} * 0.8);
					$t_ryoumin_suu{$ft_id} = int($t_ryoumin_suu{$ft_id} * 0.9);
				$t_tian_ti{$ft_id} -= 5;
			if($t_tian_ti{$ft_id} < 0){
				$t_tian_ti{$ft_id} = 0;
			}
				}elsif($ino eq "99"){
$ibenttiku1 = '賊の被害を受けた';
			if($k_kokkyou{$t_kunino{$ft_id}} eq "10"){
	if($k_kokkyou_keika_nen{$t_kunino{$ft_id}} > 5){
		if(!$kadd1){
$ibenttiku3 = "<br />・$KOKKYOU[$k_kokkyou{$t_kunino{$ft_id}}]の加護を受けた都市⇒";
		}
$ibenttiku3 .= "$t_name{$ft_id} ";
					$kadd ++;
					$kadd1 ++;
	}
			}
	if(!$kadd){
###########
				$t_tian_ti{$ft_id} -= 10;
			if($t_tian_ti{$ft_id} < 0){
				$t_tian_ti{$ft_id} = 0;
			}
				$t_kome_souba{$ft_id} -= int(rand(10))/200;
					$t_siro_bouei_ti{$ft_id} -= 99;
					if($t_siro_bouei_ti{$ft_id} < 1){$t_siro_bouei_ti{$ft_id}=0;
		$fk_id = $t_kunino{$ft_id};
												$k_name_di = $k_name{$fk_id};
									$ttid = "klog/$t_kunino{$ft_id}";
									&PRLOG("\[$old_date\]賊に$t_name{$ft_id}を奪われる。。");
											if($town_get[$t_kunino{$ft_id}] <= 1){
												$hit0i = 0;

													if($k_kunino{$t_kunino{$ft_id}}){
												$hit0i = 1;
													}
											if($hit0i == 1){
$k_kunino{$t_kunino{$ft_id}}=0;
$k_name{$t_kunino{$ft_id}}='無所属';
$k_iro_d{$t_kunino{$ft_id}}=0;
$k_kokui{$t_kunino{$ft_id}}=0;
									$ttid = "klog/$t_kunino{$ft_id}";
									&PRLOG("\[$old_date\]$k_name_diは賊に城を乗っ取られ滅亡しました。。");
												&MAP_LOG2("<span class=\"cFF0000\">【滅亡】</span>\[$old_date\]$k_name_diは賊に城を乗っ取られ滅亡しました。。");
												&M2AP_LOG("<span class=\"cFF0000\">【滅亡】</span>\[$old_date\]$k_name_diは賊に城を乗っ取られ滅亡しました。。");
												
	foreach(@p_db_all_l){
			$e_id = $_;
			if($p_kunino{$e_id} eq $fk_id){
		$ttid = "blog/$p_id{$e_id}";
		&PRLOG("\[$old_date\]仕官先の$k_p_k_a{$fk_id}が滅亡してしまい、放浪の旅に出る。。");
	&KUNI_KAKUDUKE("$e_id","$p_kunino{$e_id}","$p_kunino{$e_id}");
		$p_kuni_yakusyoku{$e_id} = 0;
			}

	}
									$e_id = 0;
											}


											}else{
			if($i eq $k_outo{$fk_id}){
		$zc = 0;
		$zhit = 0;
		$hit = 0;
	while ($zc<$tosi_kazu) {
							$dt_id = $zc;
			if($t_kunino{$ft_id} eq $t_kunino{$dt_id} and $t_hanei{$dt_id} * $t_ryoumin_suu{$dt_id} > $zhit){
		$zhit = $t_hanei{$dt_id} * $t_ryoumin_suu{$dt_id};
		$hit = $zc;
			}
		$zc ++;
	}
	$ttid = "klog/$t_kunino{$ft_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$t_kunino{$ft_id}}は賊に王都$t_name[$k_outo{$fk_id}]を落とされました。。天子$k_tensi_name{$t_kunino{$ft_id}}は$t_name[$hit]を新しい王都として定め反撃の期を伺う模様です。");
	&MAP_LOG2("<span class=\"cFF0000\">【王都陥落】</span>\[$old_date\]$k_p_k_a{$t_kunino{$ft_id}}は賊に王都$t_name[$k_outo{$fk_id}]を落とされました。。天子$k_tensi_name{$t_kunino{$ft_id}}は$t_name[$hit]を新しい王都として定め反撃の期を伺う模様です。");
	&M2AP_LOG("<span class=\"cFF0000\">【王都陥落】</span>\[$old_date\]$k_p_k_a{$t_kunino{$ft_id}}は賊に王都$t_name[$k_outo{$fk_id}]を落とされました。。天子$k_tensi_name{$t_kunino{$ft_id}}は$t_name[$hit]を新しい王都として定め反撃の期を伺う模様です。");

		$k_outo{$fk_id} = $hit;
		$k_kokui{$fk_id} -= 5;
			if($k_kokui{$fk_id} < 0){
		$k_kokui{$fk_id} = 0;
			}
	

			}
											}
												$t_siro_bouei_ti{$ft_id} = 300;
												$t_siro_taikyuu_ti{$ft_id} = 999;
												$t_tian_ti{$ft_id} = 70;
												$zokuh = 1;
												&RIKAUNTO;
											&MAP_LOG2("<span class=\"c0000FF\">【空白地化】</span>\[$old_date\]賊が城を支配し、$k_p_k_a{$t_kunino{$ft_id}}領 $t_name{$ft_id} は空白地となりました。");
											&M2AP_LOG("<span class=\"c0000FF\">【空白地化】</span>\[$old_date\]賊が城を支配し、$k_p_k_a{$t_kunino{$ft_id}}領 $t_name{$ft_id} は空白地となりました。");
												$t_kunino{$ft_id} = 0;
										}
###########
	}
###########
				}
}
		}
				&M2AP_LOG("<span class=\"cFF0000\">【イベント】</span>\[$old_date\]$ibenttiku0<br />・$ibenttiku1都市 ⇒ $ibenttiku2$ibenttiku3$ibenttiku4");
				&MAP_LOG3("<span class=\"cFF0000\">【イベント】</span>\[$old_date\]$ibenttiku0<br />・$ibenttiku1都市 ⇒ $ibenttiku2$ibenttiku3$ibenttiku4");
			}

		if($b_hit){

	&BAG_LOG("相場変動\n");
		# 相場変動
$i = 0;
	while ($i<$tosi_kazu) {
							$ft_id = $i;

			if(int(rand(2))){
				$t_kome_souba{$ft_id} += int(rand(10))/200;
				if($t_kome_souba{$ft_id} > 1.1){
					$t_kome_souba{$ft_id} = 1.1;
				}
			}else{
				$t_kome_souba{$ft_id} -= int(rand(10))/200;
				if($t_kome_souba{$ft_id} < 0.9){
					$t_kome_souba{$ft_id} = 0.9;
				}
			}

		if($t_kome_souba{$ft_id} > 1.05){
			if(int(rand(3))){
				$t_kome_souba{$ft_id} -= int(rand(5)+1)/200;
			}
		}elsif($t_kome_souba{$ft_id} < 0.95){
			if(int(rand(3))){
				$t_kome_souba{$ft_id} += int(rand(5)+1)/200;
			}
		}
$MINHENDOU1[0] = '2';
$MINHENDOU1[1] = '2';
$MINHENDOU1[2] = '2';
$MINHENDOU1[3] = '2';
$MINHENDOU1[4] = '3';
$MINHENDOU1[5] = '3';
$MINHENDOU1[6] = '4';
$MINHENDOU1[7] = '4';
$MINHENDOU1[8] = '5';
$MINHENDOU1[9] = '6';
$MINHENDOU1[999] = '6';

$MINHENDOU2[0] = '80';
$MINHENDOU2[1] = '160';
$MINHENDOU2[2] = '160';
$MINHENDOU2[3] = '240';
$MINHENDOU2[4] = '240';
$MINHENDOU2[5] = '360';
$MINHENDOU2[6] = '360';
$MINHENDOU2[7] = '400';
$MINHENDOU2[8] = '400';
$MINHENDOU2[9] = '400';
$MINHENDOU2[999] = '400';
			if($t_tian_ti{$ft_id} >= 50){
				$ryoumin_add3 = 80;
			if($town_get[$t_kunino{$ft_id}] < $MINHENDOU1[$kousinjyoutai]){
				$ryoumin_add3 = $MINHENDOU2[$kousinjyoutai] + int(rand($MINHENDOU2[$kousinjyoutai]));
			}

			if($k_kokusaku{$t_kunino{$ft_id}} eq "5"){
				$wnumadd = 1;
			}else{
				$wnumadd = 0.6;
			}
				$wjinkou = int($t_kyojyuuiki{$ft_id} * 5000);
				$wtami_add = int($ryoumin_add3 * ($t_tian_ti{$ft_id} - 50)*$wnumadd);
				if($wtami_add < 500){$wtami_add=500;}
				if($t_ryoumin_suu{$ft_id} > $wjinkou){$wtami_add = int($wtami_add / 2);}
				if($t_ryoumin_suu{$ft_id} > 100000 and $t_ryoumin_suu{$ft_id} < $wjinkou){$wtami_add +=  int(rand($wtami_add));}
				if(700000 <= $wjinkou){$wtami_add +=  int(rand($wtami_add / 5));}
				elsif(1000000 <= $wjinkou){$wtami_add +=  int(rand($wtami_add * 0.3));}
				$t_ryoumin_suu{$ft_id} += $wtami_add;
			}else{
				$t_ryoumin_suu{$ft_id} -= int(80 * (50 - $t_tian_ti{$ft_id}));
				if($t_ryoumin_suu{$ft_id} < 0){$t_ryoumin_suu{$ft_id}=0;}
			}

$t_gijyutu_ti{$ft_id} -= 5;
				if($t_gijyutu_ti{$ft_id} < 0){$t_gijyutu_ti{$ft_id}=0;}

$i ++;
		}
	if($zokuh eq "1"){
												&MAPS;
	}
		}
	&BAG_LOG("月次処理\n");
opendir(DFR,"./p_db/touketu");
@cfs = (readdir(DFR));
closedir(DFR);

$sousu3 = $#cfs -2 +$sousu1;
	&RANK1;
	&RANK0;
	
	
		$outyou_URL="<a href=\"../$rekimaprid\">$outyou</a>";
		$p2old_date_URL="\[<a href=\"./$pmaprid\">$pold_date</a>\]←";
		$fold_dat_URL="→\[<a href=\"./$fmaprid\">$fold_date</a>\]";
		$mapseisei_in_URL="./mapr/tuki/map2.html";
	&MAPSR;
	&TRMAP_SEISEI;
	}



	if($kousinjyoutai eq "999" and !$tenkahit){
require "$mpg_r/rese.pl";
	&BAG_LOG("天下\n");
	&RESET_TOUITU;
	splice(@M2L,200);
	open(OUT,">./w_db/map_log.cgi");
	print OUT @M2L;
	close(OUT);
	&RANKD;
	}else{
#	&MAPS;
	&BAG_LOG("ランクD\n");

	open(IN,"./w_db/add_map_log.cgi");
	@ADD_M2L = <IN>;
	close(IN);
	unlink(IN,"./w_db/add_map_log.cgi");
@ADD_M2L = reverse(@ADD_M2L);
@M2L = (@ADD_M2L,@M2L);
	splice(@M2L,200);
	open(OUT,">./w_db/map_log.cgi");
	print OUT @M2L;
	close(OUT);
	&RANKD;
	}


#	&MAPS;

    &F_LOCK("item");
#####################

foreach $f_id ( keys %add_item_lsousa ) {
@{"add_item_ldelid$f_id"} = sort {$a <=> $b} @{"add_item_ldelid$f_id"};
$add_i_dsl{$f_id} = int($add_i_dsl{$f_id});
	foreach(@{"add_item_ldelid$f_id"}){
											$i=$_ - $add_i_dsl{$f_id};
splice(@{"add_item_list$f_id"} , $i, 1);
$add_i_dsl{$f_id} ++;
	}
	splice(@{"add_item_list$f_id"},100);

		open(OUT,">./p_db/it/$f_id.cgi");
		print OUT @{"add_item_list$f_id"};
		close(OUT);
	open(IN,"./p_db/tt/ktms4$f_id.cgi");
	@KTM = <IN>;
	close(IN);
	($ktms4{$f_id},$ktms4w{$f_id},$tmtmit{$f_id},$tmtmw1{$f_id},$tmtmw2{$f_id},$tmtmw3{$f_id}) = split(/<>/,$KTM[0]);

			$tmtmit{$f_id} = time();
	@KTM=();
	unshift(@KTM,"$ktms4{$f_id}<>$ktms4w{$f_id}<>$tmtmit{$f_id}<>$tmtmw1{$f_id}<>$tmtmw2{$f_id}<>$tmtmw3{$f_id}<>\n");
	open(OUT,">./p_db/tt/ktms4$f_id.cgi");
	print OUT @KTM;
	close(OUT);

		@{"add_item_ldelid$f_id"}=();
delete $add_item_lsousa{$f_id};
}

	&UNLOCK_FILE("item");


###############blファイナル
#&IMG_CSS_T_SEISEI;

$p_db_no = 0;

	foreach(@p_db_all_l){
$f_id = $_;

#$w_id=$f_id;
#&IMG_CSS_SEISEI();
	&BAG_LOG("キャラセーブ$f_id\n");
				&P_SAVE_FS;
####
$p_db_no ++;
	}


		$thit = 0;
		$t2hit = 0;
	while ($thit<$tosi_kazu) {

	&BAG_LOG("都市セーブ$thit\n");
			if($t_yomikaki{$thit} ne ""){
$t2hit = $thit;
	&T_W1_SAVE("tosi_db","$thit","$thit");
			}
$thit ++;
	}
	&T_W2_SAVE("tosi_db","$t2hit","$t2hit");

		
		$thit = 1;
		$t2hit = 1;
	foreach(@k_no_all_l){
		$thit=int($_);
		$fk_id=$thit;
unlink ("./w_db/butai_l/k$fk_id.cgi");
unlink ("./w_db/gundan_l/k$fk_id.cgi");
unlink ("./w_db/pt_l/k$fk_id.cgi");
unlink ("./w_db/habatu_l/k$fk_id.cgi");
unlink ("./w_db/kuni_l/l$fk_id.cgi");
	&BAG_LOG("国セーブ$thit\n");
$k_busyou_suu{$thit}=int($cbl[$k_kunino{$thit}]);
		if($k_yomikaki{$thit} ne ""){
$t2hit = $thit;
	&K_W1_SAVE("kuni_db","$thit","$thit");
		}
	}
	&K_W2_SAVE("kuni_db","$t2hit","$t2hit");


		$thit = 1;
		$t2hit = 1;
	while ($thit <= $butai_kazu_d) {
		$fbutai_id=$thit;
unlink ("./w_db/butai_l/l$fbutai_id.cgi");
	&BAG_LOG("部隊セーブ$thit\n");

			if($butai_yomikaki{$thit} ne ""){
						if(!$butai_busyou_suu{$thit}){
$butai_no{$thit}=0;
$butai_kunino{$thit}=0;
$butai_habatuno{$thit}=0;
						}
$t2hit = $thit;
	&BUTAI_W1_SAVE("butai_db","$thit","$thit");
			}
$thit ++;
	}
	&BUTAI_W2_SAVE("butai_db","$t2hit","$t2hit");

		$thit = 1;
		$t2hit = 1;
	while ($thit <= $gundan_kazu_d) {
		$fgundan_id=$thit;
unlink ("./w_db/gundan_l/l$fgundan_id.cgi");
	&BAG_LOG("軍団セーブ$thit\n");
			if($gundan_yomikaki{$thit} ne ""){
						if(!$gundan_busyou_suu{$thit}){
$gundan_no{$thit}=0;
$gundan_kunino{$thit}=0;
$gundan_habatuno{$thit}=0;
						}
$t2hit = $thit;
	&GUNDAN_W1_SAVE("gundan_db","$thit","$thit");
			}
$thit ++;
	}
	&GUNDAN_W2_SAVE("gundan_db","$t2hit","$t2hit");

#	open(OUT,">./seiseityuu.html");
#	print OUT $tosi_s_eisei{0};
#	close(OUT);

################
		@{"butai_l"}=();
foreach $key ( keys %butai_l ) {
#			if($butai_l{$key}){
		open(OUT,">./w_db/butai_l/l$key.cgi");
		print OUT @{$butai_l{$key}};
		close(OUT);
#			}
}
################
		@{"gundan_l"}=();
foreach $key ( keys %gundan_l ) {
#			if($gundan_l{$key}){
		open(OUT,">./w_db/gundan_l/l$key.cgi");
		print OUT @{$gundan_l{$key}};
		close(OUT);
#			}
}
################
		@{"kuni_l"}=();
foreach $key ( keys %kuni_l ) {
#			if($kuni_l{$key}){
		open(OUT,">./w_db/kuni_l/l$key.cgi");
		print OUT @{$kuni_l{$key}};
		close(OUT);
#			}
}
################

foreach $key ( keys %butai_k ) {
		open(OUT,">./w_db/butai_l/k$key.cgi");
		print OUT @{$butai_k{$key}};
		close(OUT);
}
foreach $key ( keys %butai_h ) {
		open(OUT,">./w_db/butai_l/h$key.cgi");
		print OUT @{$butai_h{$key}};
		close(OUT);
}
foreach $key ( keys %gundan_k ) {
		open(OUT,">./w_db/gundan_l/k$key.cgi");
		print OUT @{$gundan_k{$key}};
		close(OUT);
}
foreach $key ( keys %gundan_h ) {
		open(OUT,">./w_db/gundan_l/h$key.cgi");
		print OUT @{$gundan_h{$key}};
		close(OUT);
}

################
delete $p_add_log_f{""};
foreach $key ( keys %p_add_log_f ) {
	&P_LOG_FS;
}

################
	if($tukikurikosi){
	&APLINK;
			if($tuki_genzai % 2){
		open(OUT,">./w_db/kwb2.cgi");
		print OUT @N_K_DB_L_D;
		close(OUT);
		open(OUT,">./w_db/twb2.cgi");
		print OUT @N_T_DB_L;
		close(OUT);
		open(OUT,">./w_db/butaiwb2.cgi");
		print OUT @N_BUTAI_DB_L;
		close(OUT);
		open(OUT,">./w_db/gundanwb2.cgi");
		print OUT @N_GUNDAN_DB_L;
		close(OUT);
		open(OUT,">./w_db/p_wb2.cgi");
		print OUT @CL_DATA;
		close(OUT);
			}else{
		open(OUT,">./w_db/kwb.cgi");
		print OUT @N_K_DB_L_D;
		close(OUT);
		open(OUT,">./w_db/twb.cgi");
		print OUT @N_T_DB_L;
		close(OUT);
		open(OUT,">./w_db/butaiwb.cgi");
		print OUT @N_BUTAI_DB_L;
		close(OUT);
		open(OUT,">./w_db/gundanwb.cgi");
		print OUT @N_GUNDAN_DB_L;
		close(OUT);
		open(OUT,">./w_db/p_wb.cgi");
		print OUT @CL_DATA;
		close(OUT);
			}
	if($tuki_genzai eq "11"){
	&BAG_LOG("１１セーブ$thit\n");
mkdir("./w_db/r_tosi_db", 0755);
		open(OUT,">./w_db/r_tosi_db/t_db_l_tosi_db$keika_nen.cgi");
		print OUT @N_T_DB_L;
		close(OUT);
mkdir("./w_db/r_kuni_db", 0755);
		open(OUT,">./w_db/r_kuni_db/k_db_d_l_kuni_db$keika_nen.cgi");
		print OUT @N_K_DB_L_D;
		close(OUT);
mkdir("./w_db/r_p_db", 0755);
		open(OUT,">./w_db/r_p_db/p_db_l_p_db$keika_nen.cgi");
		print OUT @CL_DATA;
		close(OUT);
mkdir("./w_db/r_butai_db", 0755);
		open(OUT,">./w_db/r_butai_db/butai_db_l_butai_db$keika_nen.cgi");
		print OUT @N_BUTAI_DB_L;
		close(OUT);
mkdir("./w_db/r_gundan_db", 0755);
		open(OUT,">./w_db/r_gundan_db/gundan_db_l_gundan_db$keika_nen.cgi");
		print OUT @N_GUNDAN_DB_L;
		close(OUT);
#mkdir("./w_db/r_habatu_db", 0755);
#		open(OUT,">./w_db/r_habatu_db/habatu_db_l_habatu_db$keika_nen.cgi");
#		print OUT @N_HABATU_DB_L;
#		close(OUT);
#mkdir("./w_db/r_p_it_db", 0755);
#		open(OUT,">./w_db/r_p_it_db/p_it_db_l_p_it_db$keika_nen.cgi");
#		print OUT @CL_DATA;
#		close(OUT);
	}
		open(OUT,">./w_db/jikan_jiku_main_bk.cgi");
		print OUT @JJM;
		close(OUT);

	}
	&BAG_LOG("END\n");
							unlink("./bagu.txt");
		open(OUT,">./w_db/jikan_jiku_main.cgi");
		print OUT @JJM;
		close(OUT);
		$ft_id = 45;
	&T_OPEN("syoki_tosi","$ft_id","$ft_id");
$t_tiiki_hei_syu{$ft_id}[2] = 25;
	&T_N_SAVE("syoki_tosi","$ft_id","$ft_id");


#		if($add_cg_css_open){
#		open(OUT,">./$menck.js");
#		print OUT @add_cg_css_l;
#		close(OUT);
#		}

########Ver1.13
			if($kuni_news_f){
	&KUNITORI_NEWS;
			}
########

	&KOUSIN_UNLOCK;
			if($lockfiledtenka_f_l_d){
rmdir("$lockfiledtenka");
			}
}

################
sub HOKYUUSEN {
	foreach(@{$t_setuzoku_saki{$ft_id}}){
$zcc = $_;
		if($zcc ne ""){
							$et_id = "s-$zcc";

							$dt_id = $zcc;
			if($t_kunino{$et_id} eq $fk_id and !$t_kunino{$dt_id}){
$t_kunino{$dt_id} = $t_kunino{$et_id};
	&HOKYUUSEN;
			}
		}
	}


}
################
sub HOKYUUSEN {
$zcno++;

$zcc2="z$zcno";
@{$zcc2} = @{$t_setuzoku_saki{$ft_id}};
	foreach(@{$zcc2}){
$zcc = $_;
		if($zcc ne ""){
							$ft_id = "s-$zcc";

							$dt_id = $zcc;
			if($t_kunino{$ft_id} eq $fk_id and !$t_kunino{$dt_id}){
$t_kunino{$dt_id} = $t_kunino{$ft_id};
	&HOKYUUSEN;
			}
		}
	}


}
################
sub KATUJYOUSYORI {

							$et_id = $k_katujyou_tosi{$fk_id}[0];

							$ek_id = $t_kunino{$et_id};
			$chit=0;
	foreach(@{$t_setuzoku_saki{$et_id}}){
							$dt_id = $_;
		if($t_kunino{$dt_id} eq $k_katujyou_aite{$fk_id}[0]){
			$chit=1;
		}
	}
						if($town_get[$k_kunino{$fk_id}]<2){
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]自国の領土数２以上が条件です。予定されていた領地割譲は中止されました。");
						}elsif($town_get[$k_katujyou_aite{$fk_id}[0]]<1){
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]譲渡相手国：$k_p_k_a{$k_katujyou_aite{$fk_id}[0]}は滅亡しています。予定されていた領地割譲は中止されました。");
						}elsif($chit==0){
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]譲渡相手国：$k_p_k_a{$k_katujyou_aite{$fk_id}[0]}は、譲渡予定地：$t_name{$et_id}に隣接していません。予定されていた領地割譲は中止されました。");
						}elsif($k_kunino{$fk_id} ne $k_kunino{$ek_id}){
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]$t_name{$et_id}は自都市ではありません。予定されていた領地割譲は中止されました。");
						}elsif($et_id eq $k_outo{$fk_id}){
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]$t_name{$et_id}は我が国の王都です。予定されていた領地割譲は中止されました。");
						}else{
							$t_kunino{$et_id} = $k_katujyou_aite{$fk_id}[0];
$town_get[$k_katujyou_aite{$fk_id}[0]]++;
$town_get[$k_kunino{$fk_id}] -= 1;
									$ttid = "klog/$k_katujyou_aite{$fk_id}[0]";
									&PRLOG("\[$old_date\]$k_p_k_a{$k_kunino{$fk_id}}から$t_name{$et_id}を譲り受ける。");
									$ttid = "klog/$k_kunino{$fk_id}";
									&PRLOG("\[$old_date\]天子 $k_tensi_name{$fk_id}の意向により、$k_p_k_a{$k_katujyou_aite{$fk_id}[0]}に$t_name{$et_id}を譲る。");
										&M2AP_LOG("<span class=\"c0000FF\">【領地割譲】</span>$k_p_k_a{$k_kunino{$fk_id}}は$k_p_k_a{$k_katujyou_aite{$fk_id}[0]}に$t_name{$et_id}を譲りました。");
										&MAP_LOG2("<span class=\"c0000FF\">【領地割譲】</span>$k_p_k_a{$k_kunino{$fk_id}}は$k_p_k_a{$k_katujyou_aite{$fk_id}[0]}に$t_name{$et_id}を譲りました。");

												&RIKAUNTO;
												&MAPS;
		unlink("./w_db/mati/tyouheihit$et_id.cgi");
						}

}
################


sub IMG_CSS_T_SEISEI {

opendir(DFR,"./$mpg_r/sub_db/d_cg");
	while($fi_id = readdir(DFR)){
		if(length($fi_id)>3){
	($add_fid,$add_mime) = split(/\./,$fi_id);
$w_id=$add_fid;
$p_img{$w_id}="$IMG{0}/$add_fid";
$p_img_f{$w_id}="$p_img_kakutyou{$add_mime}";
$p_img_m{$w_id}="$p_img_mime{$add_mime}";
&IMG_CSS_SEISEI();

		}
	}
closedir(DFR);

}
1;