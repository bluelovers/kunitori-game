
sub BAG_LOG {

#		open(OUT,">>./bagu.txt");
#		print OUT "$_[0]";
#		close(OUT);
#print "$_[0]\n";
}

sub BAG_LOG2 {

#	($sec,$min,$hour,$mday,$mon,$year,$wday,$yday) = localtime(time);
#		open(OUT,">>./bagu2.txt");
#		print OUT "$min $sec $_[0]";
#		close(OUT);
#print "$_[0]\n";
}

sub BAG_LOG3 {

#	($sec,$min,$hour,$mday,$mon,$year,$wday,$yday) = localtime(time);
#		open(OUT,">>./bagu3.txt");
#		print OUT "//$min $sec $_[0]";
#		close(OUT);
#print "$_[0]\n";
}
sub P_LOG_W {
	$p_add_log_f{$w_id}=1;
	unshift(@{"P_LOG_N$w_id"},"$_[0]$tt_date\n");
}


sub P_LOG_FS {
	open(IN,"./p_db/my_log/$key.cgi");
	@F_LOG = <IN>;
	close(IN);
@F_LOG = (@{"P_LOG_N$key"}, @F_LOG);
	splice(@F_LOG,200);

	open(OUT,">./p_db/my_log/$key.cgi");
	print OUT @F_LOG;
	close(OUT);
	@{"P_LOG_N$w_id"} = ();
}

sub BLPL{

$listdf_i[0] ="";
$listdf_i[1] ="z";
$listdf_i[2] ="z";

require "./$mpg_r/sub_db/itg2.pl";
		$ocnid = "";
		$tenkahit = 0;

	if($kousinjyoutai eq "999"){
###念のため再宣言
		$lockfiledtenka = $lockfiled;
		$lockfiledtenka .= "tenka";
###
	if (-e "$lockfiledtenka") {
		$m_tttenka = (stat("$lockfiledtenka"))[9];
		if ($m_tttenka and $m_tttenka < $tt - 3600) { rmdir("$lockfiledtenka"); }
	}
	if (-e "$lockfiledtenka") {
	&HEADER;
	print "<hr /><span class=\"fs4\">(´・ω・`)</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>繰越更新処理中なのら～</strong></span>\n";
	print "<br /><br /><hr />\n</div></body></html>\n";
	exit;
	}
mkdir("$lockfiledtenka", 0755);
	}
	
	&KOUSIN_LOCK;

#if (!-e "./bagu.txt") {
#rename ("./bagu.txt", "./bagu/bagu$tt.txt");
#unlink("./bagu.txt");
#}


	open(IN,"./w_db/map_log.cgi");
	@M2L = <IN>;
	close(IN);
	&BAG_LOG("スタート\n");
$JYUSSYU_TANREN[0] = '騎乗';
$JYUSSYU_TANREN[1] = '射撃';
$JYUSSYU_TANREN[2] = '武術';
$JYUSSYU_TANREN[3] = '呪術';
$JYUSSYU_TANREN[4] = '諜報';
$JYUSSYU_TANREN[5] = '重機';
$JYUSSYU_TANREN[6] = '調教';
$JYUSSYU_TANREN[7] = '人望';
$JYUSSYU_TANREN[8] = '政治';
$JYUSSYU_TANREN[9] = '商才';

$SANSYU_TANREN[1] = '武(強)＋率(弱)';
$SANSYU_TANREN[2] = '知(強)＋率(弱)';
$SANSYU_TANREN[3] = '率(強)＋武(弱)';
$SANSYU_TANREN[12] = '武(強)＋知(弱)';
$SANSYU_TANREN[22] = '知(強)＋武(弱)';
$SANSYU_TANREN[32] = '率(強)＋知(弱)';

$JYUUNIGETU[0] = '微明';
$JYUUNIGETU[1] = '阿魁';
$JYUUNIGETU[2] = '従魁';
$JYUUNIGETU[3] = '傳迭';
$JYUUNIGETU[4] = '小吉';
$JYUUNIGETU[5] = '勝先';
$JYUUNIGETU[6] = '太一';
$JYUUNIGETU[7] = '天岡';
$JYUUNIGETU[8] = '大衡';
$JYUUNIGETU[9] = '功曹';
$JYUUNIGETU[10] = '大吉';
$JYUUNIGETU[11] = '神后';

$JYUUNITEN[0] = '青龍';
$JYUUNITEN[1] = '勾陳';
$JYUUNITEN[2] = '六合';
$JYUUNITEN[3] = '朱雀';
$JYUUNITEN[4] = '騰蛇';
$JYUUNITEN[5] = '貴人';
$JYUUNITEN[6] = '天后';
$JYUUNITEN[7] = '大陰';
$JYUUNITEN[8] = '玄武';
$JYUUNITEN[9] = '大裳';
$JYUUNITEN[10] = '白虎';
$JYUUNITEN[11] = '天空';

require "$mpg_r/sub_db/1.pl";

#######################
		if(-e "./w_db/allc_kuni_db.pl"){
require "./w_db/all_kuni_db.pl";

		}else{ 
require "./w_db/all2_kuni_db.pl";
		}
		if(-e "./w_db/allc_tosi_db.pl"){
require "./w_db/all_tosi_db.pl";

		}else{ 
require "./w_db/all2_tosi_db.pl";
		}

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
#########
		$add_hit = 0;
opendir(DFR,"./w_db/kuni_db");
	while($fk_id = readdir(DFR)){
		if($fk_id =~ /\.cgi/i){
$fk_id =~ s/\.cgi//;
			if($fk_id){
	&K_READ("kuni_db","$fk_id","$fk_id");
#$k_busyou_kazei{$fk_id} =~ s/％//g;
	&BAG_LOG("国$fk_id\n");
#				if($k_id{$fk_id} ne $fk_id){
#					if($k_kunino{$fk_id}){
#$k_kunino{$fk_id} = $fk_id;
#					}
#$k_id{$fk_id} = $fk_id;
#				}
					if($keika_nen<100 and $fk_id eq "1"){
$k_kokusaku{$fk_id} = 10;
					}
			if($k_yomikaki{$fk_id} eq ""){

				if(!$add_hit){
	open(IN,"./w_db/k_db_d_l_kuni_db.cgi");
	@NEKONEKO = <IN>;
	close(IN);
	foreach(@NEKONEKO){
		($dk_id)=split(/,/);
		$k_db_view[0]=$_;
	&K_VIEW("kuni_db","$dk_id","b-$dk_id");

	}
				if($k_yomikaki{"b-$fk_id"} eq ""){
	open(IN,"./w_db/kwb.cgi");
	@NEKONEKO = <IN>;
	close(IN);
	foreach(@NEKONEKO){
		($dk_id)=split(/,/);
		$k_db_view[0]=$_;
	&K_VIEW("k_db","$dk_id","b-$dk_id");

	}
				}
				if($k_yomikaki{"b-$fk_id"} eq ""){
	open(IN,"./w_db/kwb2.cgi");
	@NEKONEKO = <IN>;
	close(IN);
	foreach(@NEKONEKO){
		($dk_id)=split(/,/);
		$k_db_view[0]=$_;
	&K_VIEW("k_db","$dk_id","b-$dk_id");

	}
				}
		$add_hit =1;
				}

											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>緊急事態発生みたい！ヽ(ゝ_ヾ)/ 致命的バグ発生中！");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>故障箇所⇒国データファイルの破損。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>発生原因⇒突然の停電orPCフリーズによる強制終了で、更新中の都市データがハードディスクドライブにきちんと保存されなかった。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>自動で応急処置開始するです！");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>データファイル$fk_idを緊急修復開始！バックアップ用都市データ呼び出し中・・・");

				if($k_yomikaki{"b-$fk_id"} ne ""){
	&K_SAVE("kuni_db","$fk_id","b-$fk_id");

	&K_READ("kuni_db","$fk_id","$fk_id");
$e_id = "b-$fk_id";
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>呼び出し成功！");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>データファイル$fk_idは$k_name_d{$e_id}かな？ ま、いいや。。データファイル$fk_idに$k_name{$e_id}を上書き中・・・");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>（´ー`)つ『新データ』。ID:$fk_idの修復作業を完了したのら～。");

				}else{
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>呼び出し失敗・・。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>このまま放置すると連鎖でバグが発生する危険があるのら！ 修復不能とみなし、時間を停止させるですよ。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>更新処理停止完了！ 応急処置完了したのら～。");

    print "フェイズfk_id(･д･) $fk_id\n";
	exit;
				}
			}
			}else{
    print "フェイズ1１(･д･) $fk_id\n";
			}
		}
	}
closedir(DFR);

$k_p_k_a{0} = "無所属 ";
##########
	open(IN,"./w_db/kuni_kazu.cgi");
	$kuni_kazu = <IN>;
	close(IN);


				$k_kunino{"0"}=0;
				$k_kokka_keitai{"0"}=2;
###########


	$sougouno1 = int(($keika_nen+2) * 4)+150;
	$buryokuno1 = int(($keika_nen+2) * 2.4)+100;
	$tiryokuno1 = int(($keika_nen+2) * 2.4)+100;
	$tousotuno1 = int(($keika_nen+2) * 2.4)+100;
	$jyussyuno1 = int(($keika_nen+2) / 4)+650;
	@TMTM = ();
	open(IN,"./w_db/no1.cgi");
	@TMTM = <IN>;
	close(IN);
	($sougouno1,$buryokuno1,$tiryokuno1,$tousotuno1,$jyussyuno1) = split(/<>/,$TMTM[0]);

	if(!$sougouno1){
	$sougouno1 = int(($keika_nen+2) * 4)+150;
	}
	if($jyussyuno1<300){
	$jyussyuno1 = 500;
	}
require "./$mpg_r/sub_db/sen.pl";
require "./$mpg_r/sub_db/tikei.pl";
require "./$mpg_r/sub_db/tw.pl";
	$tosinokazu = $tosi_kazu;

	if(-e "./p_db/p/.cgi"){
#											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>緊急事態発生みたい！ヽ(ゝ_ヾ)/ 空白ファイルが置いてあるよ！");
#											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>故障箇所⇒メインデータ格納庫に空白ファイル発生。");
#											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>発生原因⇒不明。");
#											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>自動で応急処置開始するです！");
		unlink("./p_db/p/.cgi");
#											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>該当データを削除。修復作業を完了したのら～");
	}



	$mtthit=0;

	if($date > $m_tt + $kousin_kankaku * 11124){
	$mtthit=1;
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>緊急事態発生みたい！ヽ(ゝ_ヾ)/ 時間軸がおかしいよ！");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>故障箇所⇒現実時間に対するゲーム内時間軸の大幅な遅れ。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>発生原因⇒回線切れorPCフリーズで、一定時間更新が止まっていた。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>自動で応急処置開始するです！");
	$m_tt=$date;
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
	$m_tt += 86400;

splice( @JJM, 0, 1, "$keika_nen<>$tuki_genzai<>$m_tt<>$kousinjyoutai<>$tenkakaisuu<>$outyou<>$seibento1<>$seibento2<>$syuminzoku<>$msyuto<>$kaisinen<>$zenkaisinen<>$touitunen<>$sinkouminzoku1<>$sinkouminzoku2<>$zentensimei<><><><><>\n");
		open(OUT,">./w_db/jikan_jiku_main.cgi");
		print OUT @JJM;
		close(OUT);
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>（´ー`)つ『新データ』。正常に作業完了したのら～");
	}



opendir(DFR,"./$mpg_r/sub_db/it");
	while($fi_id = readdir(DFR)){
		if($fi_id =~ /\.cgi/i){
$fi_id =~ s/\.cgi//;
#			if(!$item_name{$fi_id}){
	&I_READ("it","$fi_id","$fi_id");
#			}
		}
	}
closedir(DFR);

#########
#######################


	open(IN,"./w_db/tosi_kazu.cgi");
	$tosi_kazu9 = <IN>;
	close(IN);

	if($tosi_kazu < 84 and $tosi_kazu9 < 84){
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>緊急事態発生みたい！ヽ(ゝ_ヾ)/ 都市データがおかしいよ！");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>故障箇所⇒都市データ消滅。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>発生原因⇒不明。");

###########
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>このまま放置すると連鎖でバグが発生する危険があるのら！ 修復不能とみなし、時間を停止させるですよ。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>更新処理停止完了！ 応急処置完了したのら～。");
    print "フェイズ都市データ(･д･) 都市データ\n";

###########

											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>自動で応急処置開始するです！");
	open(IN,"./w_db/twb.cgi");
	@NEKONEKO = <IN>;
	close(IN);
		open(OUT,">./neko.txt");
		print OUT $tt_date;
		close(OUT);
	$twbkchek = @NEKONEKO;
	if($twbkchek < 84){
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>～ヽ(ゝ_ヾ)/ はぅ・・修復に失敗したのら～！");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>故障箇所⇒都市データバックアップ消滅。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>危険Lv⇒MAX。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>データ救出、第二段階発動！自動で応急処置開始するです！");
	open(IN,"./w_db/twb2.cgi");
	@NEKONEKO = <IN>;
	close(IN);
		open(OUT,">./neko2.txt");
		print OUT $tt_date;
		close(OUT);
	$twbkchek = @NEKONEKO;
	}
	if($twbkchek < 84){
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>～ヽ(ゝ_ヾ)/ ・・修復失敗。もう私では対処しきれないのら～。大至急管理人さんに報告してほしいのら～。");
	exit;
	}
	if($twbkchek eq "84"){
	foreach(@NEKONEKO){
		($dt_id)=split(/,/);
		$t_db_view[0]=$_;
	&T_VIEW("tosi_db","$dt_id","b-$dt_id");
				if($t_yomikaki{"b-$dt_id"}){
	&T_SAVE("tosi_db","$dt_id","b-$dt_id");
	&T_READ("tosi_db","$dt_id","$dt_id");
				}
	}
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>(´・ω・`)つ『新データ』。多分・・正常に作業完了したけど重大なバグ過ぎて少し自信がないのら～。管理人さんに報告してほしいのら～。");
	}
	}

#########
		$add_hit =0;
opendir(DFR,"./w_db/tosi_db");
	while($ft_id = readdir(DFR)){
		if($ft_id =~ /\.cgi/i){
$ft_id =~ s/\.cgi//;
			if($ft_id ne ""){
	&T_READ("tosi_db","$ft_id","$ft_id");
	&BAG_LOG("町$ft_id\n");
$t_zokuno{$ft_id} = int($t_zokuno{$ft_id});


					if($t_zoku_bouei_max{$ft_id} < 101){
$t_zoku_bouei_max{$ft_id} = $t_zoku_bouei_max{$ft_id}*100;
					}
			if($t_yomikaki{$ft_id} eq ""){
#				if(!$add_hit){
	open(IN,"./w_db/t_db_l_tosi_db.cgi");
	@NEKONEKO = <IN>;
	close(IN);
	foreach(@NEKONEKO){
		($dt_id)=split(/,/);
		$t_db_view[0]=$_;
	&T_VIEW("tosi_db","$dt_id","b-$dt_id");

	}
			
				if($t_yomikaki{"b-$ft_id"} eq ""){
	open(IN,"./w_db/twb.cgi");
	@NEKONEKO = <IN>;
	close(IN);
	foreach(@NEKONEKO){
		($dt_id)=split(/,/);
		$t_db_view[0]=$_;
	&T_VIEW("tosi_db","$dt_id","b-$dt_id");

	}
				}
				if($t_yomikaki{"b-$ft_id"} eq ""){
	open(IN,"./w_db/twb2.cgi");
	@NEKONEKO = <IN>;
	close(IN);
	foreach(@NEKONEKO){
		($dt_id)=split(/,/);
		$t_db_view[0]=$_;
	&T_VIEW("tosi_db","$dt_id","b-$dt_id");

	}
					
		
				}
		
#		$add_hit =1;
#				}
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>緊急事態発生みたい！ヽ(ゝ_ヾ)/ 致命的バグ発生中！");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>故障箇所⇒都市データファイルの破損。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>発生原因⇒突然の停電orPCフリーズによる強制終了で、更新中の都市データがハードディスクドライブにきちんと保存されなかった。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>自動で応急処置開始するです！");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>データファイル$ft_idを緊急修復開始！バックアップ用都市データ呼び出し中・・・");

				if($t_yomikaki{"b-$ft_id"} ne ""){
	&T_SAVE("tosi_db","$ft_id","b-$ft_id");

	&T_READ("tosi_db","$ft_id","$ft_id");
$e_id = "b-$ft_id";
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>呼び出し成功！");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>データファイル$ft_idは$t_name{$e_id}かな？ ま、いいや。。データファイル$ft_idに$t_name{$e_id}を上書き中・・・");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>（´ー`)つ『新データ』。ID:$ft_idの修復作業を完了したのら～。");

				}else{
				
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>呼び出し失敗・・。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>このまま放置すると連鎖でバグが発生する危険があるのら！ 修復不能とみなし、時間を停止させるですよ。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>更新処理停止完了！ 応急処置完了したのら～。");

    print "フェイズft_id(･д･) $ft_id\n";
	exit;
				}
			}

			}else{
    print "フェイズ4１(･д･) $ft_id\n";
			}
		}
	}
closedir(DFR);
##########






		$list_kuni_all = "";
$k_name_d[0] = "無所属";
	@BUSYOU=();
	foreach(@k_no_all_l){
		$fk_id=$_;
$list_kuni_all .= "<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_id{$fk_id}\" target=\"_blank\"><span class=\"c404000\">$k_name_d[$fk_id]</a> ";
#都市表示更新処理開始

	}



		if($tosi_kazu < 84){
	$tosi_kazu = 84;

		}
	$tosinokazu2 = $tosinokazu -1;

#######################
		if(-e "./w_db/allc_butai_db.pl"){
require "./w_db/all_butai_db.pl";

		}else{ 
require "./w_db/all2_butai_db.pl";
		}
#########
		$add_hit = 0;
opendir(DFR,"./w_db/butai_db");
	while($fbutai_id = readdir(DFR)){
		if($fbutai_id =~ /\.cgi/i){
$fbutai_id =~ s/\.cgi//;
			if($fbutai_id){
	&BUTAI_READ("butai_db","$fbutai_id","$fbutai_id");
	&BAG_LOG("部隊$fbutai_id\n");
#			if(!$butai_no{$fbutai_id}){
#				$butai_kunino{$fbutai_id} = 0;
#			}
			if($butai_yomikaki{$fbutai_id} eq ""){

#				if(!$add_hit){
	open(IN,"./w_db/butai_db_l_butai_db.cgi");
	@NEKONEKO = <IN>;
	close(IN);
	foreach(@NEKONEKO){
		($dbutai_id)=split(/,/);
		$butai_db_view[0]=$_;
	&BUTAI_VIEW("butai_db","$dbutai_id","b-$dbutai_id");

	}
			
				if($butai_yomikaki{"b-$fbutai_id"} eq ""){
	open(IN,"./w_db/butaiwb.cgi");
	@NEKONEKO = <IN>;
	close(IN);
	foreach(@NEKONEKO){
		($dbutai_id)=split(/,/);
		$butai_db_view[0]=$_;
	&BUTAI_VIEW("butai_db","$dbutai_id","b-$dbutai_id");

	}
				}
				if($butai_yomikaki{"b-$fbutai_id"} eq ""){
	open(IN,"./w_db/butaiwb2.cgi");
	@NEKONEKO = <IN>;
	close(IN);
	foreach(@NEKONEKO){
		($dbutai_id)=split(/,/);
		$butai_db_view[0]=$_;
	&BUTAI_VIEW("butai_db","$dbutai_id","b-$dbutai_id");

	}
				}
#		$add_hit =1;
#				}

											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>緊急事態発生みたい！ヽ(ゝ_ヾ)/ 致命的バグ発生中！");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>故障箇所⇒部隊データファイルの破損。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>発生原因⇒突然の停電orPCフリーズによる強制終了で、更新中の都市データがハードディスクドライブにきちんと保存されなかった。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>自動で応急処置開始するです！");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>データファイル$fbutai_idを緊急修復開始！バックアップ用部隊データ呼び出し中・・・");

				if($fbutai_id eq "1" and !$butai_yomikaki{"b-$fbutai_id"}){
$butai_kunino{1} = 0;
$butai_habatuno{1} = 0;
$butai_yomikaki{1} = 0;
	&BUTAI_N_SAVE("butai_db","1","1");
				}

				if($butai_yomikaki{"b-$fbutai_id"} ne ""){
	&BUTAI_SAVE("butai_db","$fbutai_id","b-$fbutai_id");

	&BUTAI_READ("butai_db","$fbutai_id","$fbutai_id");
$e_id = "b-$fbutai_id";
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>呼び出し成功！");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>データファイル$fbutai_idは$butai_name{$e_id}かな？ ま、いいや。。データファイル$fk_idに$butai_name{$e_id}を上書き中・・・");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>（´ー`)つ『新データ』。ID:$fbutai_idの修復作業を完了したのら～。");

				}else{
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>呼び出し失敗・・。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>このまま放置すると連鎖でバグが発生する危険があるのら！ 修復不能とみなし、時間を停止させるですよ。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>更新処理停止完了！ 応急処置完了したのら～。");
    print "フェイズfbutai_id(･д･) $fbutai_id\n";

	exit;
				}
			}
			}else{
    print "フェイズbutai１(･д･) $fbutai_id\n";
			}
	push(@{"butai_k$butai_kunino{$fbutai_id}"},"$fbutai_id\n");
	push(@{"butai_h$butai_habatuno{$fbutai_id}"},"$fbutai_id\n");
	$butai_k{$butai_kunino{$fbutai_id}} = "butai_k$butai_kunino{$fbutai_id}";
	$butai_h{$butai_habatuno{$fbutai_id}} = "butai_h$butai_habatuno{$fbutai_id}";
		}
	}
closedir(DFR);



#######################
		if(-e "./w_db/allc_gundan_db.pl"){
require "./w_db/all_gundan_db.pl";

		}else{ 
require "./w_db/all2_gundan_db.pl";
		}
#########
		$add_hit = 0;
opendir(DFR,"./w_db/gundan_db");
	while($fgundan_id = readdir(DFR)){
		if($fgundan_id =~ /\.cgi/i){
$fgundan_id =~ s/\.cgi//;
			if($fgundan_id){
	&GUNDAN_READ("gundan_db","$fgundan_id","$fgundan_id");
	&BAG_LOG("軍団$fgundan_id\n");
#			if(!$gundan_no{$fgundan_id}){
#				$gundan_kunino{$fgundan_id} = 0;
#			}
			if($gundan_yomikaki{$fgundan_id} eq ""){

#				if(!$add_hit){
	open(IN,"./w_db/gundan_db_l_gundan_db.cgi");
	@NEKONEKO = <IN>;
	close(IN);
	foreach(@NEKONEKO){
		($dgundan_id)=split(/,/);
		$gundan_db_view[0]=$_;
	&GUNDAN_VIEW("gundan_db","$dgundan_id","b-$dgundan_id");

	}
				if($gundan_yomikaki{"b-$fgundan_id"} eq ""){
	open(IN,"./w_db/gundanwb.cgi");
	@NEKONEKO = <IN>;
	close(IN);
	foreach(@NEKONEKO){
		($dgundan_id)=split(/,/);
		$gundan_db_view[0]=$_;
	&GUNDAN_VIEW("gundan_db","$dgundan_id","b-$dgundan_id");

	}
				}
				if($gundan_yomikaki{"b-$fgundan_id"} eq ""){
	open(IN,"./w_db/gundanwb2.cgi");
	@NEKONEKO = <IN>;
	close(IN);
	foreach(@NEKONEKO){
		($dgundan_id)=split(/,/);
		$gundan_db_view[0]=$_;
	&GUNDAN_VIEW("gundan_db","$dgundan_id","b-$dgundan_id");

	}
				}
#		$add_hit =1;
#				}

											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>緊急事態発生みたい！ヽ(ゝ_ヾ)/ 致命的バグ発生中！");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>故障箇所⇒部隊データファイルの破損。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>発生原因⇒突然の停電orPCフリーズによる強制終了で、更新中の都市データがハードディスクドライブにきちんと保存されなかった。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>自動で応急処置開始するです！");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>データファイル$fgundan_idを緊急修復開始！バックアップ用部隊データ呼び出し中・・・");


				if($gundan_yomikaki{"b-$fgundan_id"} ne ""){
	&GUNDAN_SAVE("gundan_db","$fgundan_id","b-$fgundan_id");

	&GUNDAN_READ("gundan_db","$fgundan_id","$fgundan_id");
$e_id = "b-$fgundan_id";
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>呼び出し成功！");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>データファイル$fgundan_idは$gundan_name{$e_id}かな？ ま、いいや。。データファイル$fk_idに$gundan_name{$e_id}を上書き中・・・");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>（´ー`)つ『新データ』。ID:$fgundan_idの修復作業を完了したのら～。");

				}else{
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>呼び出し失敗・・。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>このまま放置すると連鎖でバグが発生する危険があるのら！ 修復不能とみなし、時間を停止させるですよ。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>更新処理停止完了！ 応急処置完了したのら～。");

    print "フェイズfgundan_id(･д･) $fgundan_id\n";
	exit;
				}
			}
			}else{
    print "フェイズgundan１(･д･) $fgundan_id\n";
			}
	push(@{"gundan_k$gundan_kunino{$fgundan_id}"},"$fgundan_id\n");
	push(@{"gundan_h$gundan_habatuno{$fgundan_id}"},"$fgundan_id\n");
	$gundan_k{$gundan_kunino{$fgundan_id}} = "gundan_k$gundan_kunino{$fgundan_id}";
	$gundan_h{$gundan_habatuno{$fgundan_id}} = "gundan_h$gundan_habatuno{$fgundan_id}";
		}
	}
closedir(DFR);



mkdir("./cg", 0755);
#######################
###################
	$kup_date=0;
	$thit=0;
	@charano=();
	@CL_DATA=();

%butai_busyou_suu=();
%gundan_busyou_suu=();

@p_db_all_l = ();
	@db_kousin_l=();
		$add_hit =0;
opendir(DFR,"./p_db/p");
	while($f_id = readdir(DFR)){
		if($f_id =~ /\.cgi/i){
$f_id2 = $f_id;
$f_id =~ s/\.cgi//;
#$f_id =~ tr/A-Z/a-z/;
#			if($f_id){
	&P_READ("p","$f_id","$f_id");
	&BIJYOU_READ("$f_id");
	&HIJYOU_READ("$f_id");
	
$p_gundanzokusei{$f_id} =int($p_gundanzokusei{$f_id});
$p_yomikaki{$f_id} = 0;

#	&BAG_LOG("キャラ$f_id\n");
#$p_taizai_iti{$f_id} =~ s/z//g;
$p_yomikaki{$f_id} =0;
			if($p_jikan{$f_id} - $kousin_kankaku * 5 > $m_tt or $mtthit == 1){
			if($m_tt < $tt / 10){
	open(IN,"./w_db/jikan_jiku_main_bk.cgi");
	@JJM = <IN>;
	close(IN);

	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$nen_genzai=$keika_nen+$KAISI_NEN;
		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$pmaprid = sprintf("%05d\-%04d\-%02d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear, $pmmonth);
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$ryymaprid = sprintf("%05d\-%04d", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$ypmaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear-1);

	$pold_date = $old_date;
	$old_date = "<a href=\"./mapr/$yymaprid\">$old_date</a>";
			if($m_tt < $tt / 10){
				$m_tt = $tt - $kousin_kankaku * 2 - int(rand($kousin_kankaku-1)+1);
			}
			}
				$p_jikan{$f_id} = $m_tt - $kousin_kankaku * 2 - int(rand($kousin_kankaku-1)+1);
			}
#			if($p_jikan{$f_id} < $m_tt / 100){
#				$p_jikan{$f_id} = $m_tt - $kousin_kankaku * 2 - int(rand($kousin_kankaku-1)+1);
#			}
#		if($p_heisisuu{$f_id} =~ m/[^0-9]/ or $p_heisisuu{$f_id} < 0 or $p_kunren{$f_id} > $p_sougou{$f_id} or  $p_sousisan{$f_id} > 409707144009){
#		$p_yomikaki{$f_id} = 1;
#			unlink("./p_db/p/$f_id2.cgi");
#		}
$fk_id = $p_kunino{$f_id};
		if($k_kunino{$fk_id} eq ""){
$p_kunino{$f_id} = 0;
		}

		$p_kunizokusei{$f_id} = int($k_kokka_keitai{$k_kunino{$fk_id}});
###更新開始
			if(!$p_yomikaki{$f_id} and $p_jikan{$f_id} < $tt and $p_jikan{$f_id} < $m_tt and $p_yomikaki{$f_id} eq "0" and $p_sougou{$f_id}){
	push(@p_db_kousin_l2,"$f_id");
			}
				$cbl[$p_kunino{$f_id}]++;
#	push(@p_db_all_l,"$f_id");
	push(@{"butai_l$p_butaino{$f_id}"},"$f_id<>$p_name{$f_id}<>$butai_kunino{$p_kunino{$f_id}}<>\n");

	push(@{"gundan_l$p_gundanno{$f_id}"},"$f_id<>$p_name{$f_id}<>$gundan_kunino{$p_kunino{$f_id}}<>\n");
	push(@{"kuni_l$k_kunino{$p_kunino{$f_id}}"},"$f_id<>$p_name{$f_id}<>$p_habatuno{$f_id}<>$p_mikoudou_t{$f_id}<>$p_sousisan{$f_id}<>$p_tyuusei{$f_id}<>\n");

	$butai_l{$p_butaino{$f_id}} = "butai_l$p_butaino{$f_id}";
	$gundan_l{$p_gundanno{$f_id}} = "gundan_l$p_gundanno{$f_id}";
	$kuni_l{$k_kunino{$p_kunino{$f_id}}} = "kuni_l$k_kunino{$p_kunino{$f_id}}";

#	&KUNI_KAKUDUKE("$f_id","$p_kunino{$f_id}","");
####ランキング収集用CL
$p_10syu_sougou{$f_id} = $p_kijyou{$f_id}+$p_syageki{$f_id}+$p_bujyutu{$f_id}+$p_jyujyutu{$f_id}+$p_tyouhou{$f_id}+$p_jyuukisouda{$f_id}+$p_tyoukyou{$f_id}+$p_jinbou{$f_id}+$p_seiji{$f_id}+$p_sinyou{$f_id};

#			if(!-e "./cg/$f_id.html"){
#$w_id=$f_id;
#&IMG_CSS_SEISEI();
#			}


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

								if($p_heisisuu{$f_id}<0){
$p_heisisuu{$f_id} = 0;
								}
%add_p=();
$add_p{$gundan_kunino{$p_gundanno{$f_id}}} = $p_gundanno{$f_id};
$p_gundanno{$f_id} = int($add_p{$p_kunino{$f_id}});
%add_p=();
$add_p{$butai_kunino{$p_butaino{$f_id}}} = $p_butaino{$f_id};
$p_butaino{$f_id} = int($add_p{$p_kunino{$f_id}});

								if($p_neutral_meisei{$f_id}<$p_kuni_kouken{$f_id}){
$p_neutral_meisei{$f_id} = int($p_kuni_kouken{$f_id});
								}
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
#								if($p_cg_sabano{$f_id} eq ""){
#$p_cg_sabano{$f_id}= 0;
								#if($p_cgno_d{$f_id}>$KYARA_IMG_MAX{$p_cg_sabano{$f_id}}){
#$p_cgno_d{$f_id}= 0;
#								}
#								}
$add_icon = $p_cgno_d{$f_id};
$add_icon_d1 = "192.168.";
$add_icon_d2 = "127.0.0.";
$add_icon_d3 = "kunitori.com/";
	if ($add_icon =~ /$add_icon_d1/i or $add_icon =~ /$add_icon_d2/i or $add_icon =~ /$add_icon_d3/i) {
$p_cgno_d{$f_id} = "";
	&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>$p_name{$f_id}は画像に不正な値を入れているようです。");
	}
@{$p_cgno{$f_id}} = ();
$charanow=int($p_cgno_d{$f_id})+ (1000 * int($p_cg_sabano{$f_id}));
$charano[$charanow] ++;
#			}
		}
	}
closedir(DFR);
	foreach(@k_no_all_l){
		$fk_id=int($_);
$k_busyou_suu{$fk_id}=int($cbl[$k_kunino{$fk_id}]);
	}

@p_db_all_l = sort { $p_neutral_meisei{$b} <=> $p_neutral_meisei{$a} or $a cmp $b} keys %p_neutral_meisei;

	foreach(@p_db_all_l){
				$f_id = $_;
		&DEF_N;
			if($p_yomikaki{$f_id} eq "" or !$p_sougou{$f_id}){

#				if(!$add_hit){
				if(-e "./w_db/busyoulb.cgi"){
	open(IN,"./w_db/busyoulb.cgi");
	@NEKONEKO = <IN>;
	close(IN);
				}else{
	open(IN,"./w_db/busyoul.cgi");
	@NEKONEKO = <IN>;
	close(IN);
				}
	foreach(@NEKONEKO){
		($d_id)=split(/,/);
				if($d_id){
		$p_db_view[0]=$_;
	&P_VIEW("p","$d_id","b-$d_id");
				}

	}
	
				if($p_yomikaki{"b-$f_id"} eq "" or !$p_sougou{"b-$f_id"}){
	open(IN,"./w_db/p_wb.cgi");
	@NEKONEKO = <IN>;
	close(IN);
	foreach(@NEKONEKO){
		($d_id)=split(/,/);
				if($d_id){
		$p_db_view[0]=$_;
	&P_VIEW("p","$d_id","b-$d_id");
				}

	}
				}
				if($p_yomikaki{"b-$f_id"} eq "" or !$p_sougou{"b-$f_id"}){
	open(IN,"./w_db/p_wb2.cgi");
	@NEKONEKO = <IN>;
	close(IN);
	foreach(@NEKONEKO){
		($d_id)=split(/,/);
				if($d_id){
		$p_db_view[0]=$_;
	&P_VIEW("p","$d_id","b-$d_id");
				}

	}
				}
	
#		$add_hit =1;
#				}
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>緊急事態発生みたい！ヽ(ゝ_ヾ)/ 致命的バグ発生中！");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>故障箇所⇒武将データファイルの破損。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>発生原因⇒突然の停電orPCフリーズによる強制終了で、更新中の武将データがハードディスクドライブにきちんと保存されなかった。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>自動で応急処置開始するです！");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>データファイル$f_idを緊急修復開始！バックアップ用武将データ呼び出し中・・・");

				if($p_yomikaki{"b-$f_id"} ne "" and $p_sougou{"b-$f_id"}){
	&P_SAVE("p","$f_id","b-$f_id");

	&P_READ("p","$f_id","$f_id");
$e_id = "b-$f_id";
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>呼び出し成功！");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>データファイル$f_idは$p_name{$e_id}さんかな？ ま、いいや。。データファイル$f_idに$p_name{$e_id}を上書き中・・・");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>（´ー`)つ『新データ』。ID:$f_idの修復作業を完了したのら～。");

				}else{
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>呼び出し失敗・・。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>このまま放置すると連鎖でバグが発生する危険があるのら！ 修復不能とみなし、データファイル$f_idを削除します。");
											&M2AP_LOG("<span class=\"c0000FF\">【猫々娘々】</span>予備データ保管庫に破損データファイル$f_idを格納。 $f_idを削除完了！ 修復作業完了したのら～。");

unlink ("./p_db/bl/$f_id.cgi");
rename ("./p_db/p/$f_id.cgi", "./p_db/bl/$f_id.cgi");
unlink ("./p_db/p/$f_id.cgi");
$p_yomikaki{$f_id} = 1;
				$p_jikan{$f_id} = $m_tt +1;
next;
				}
			}else{
	push(@p_db_all_l2,"$f_id");
			}
	}

@p_db_all_l = @p_db_all_l2;
@p_db_kousin_l = shuffle(@p_db_kousin_l2);

#############


$sousu9 = @p_db_kousin_l;
$sousu1 = @p_db_all_l;
$sousu2 = int($sousu1/30);

$hitd = 0;

#####################

		@{"butai_l0"}=();
		@{"gundan_l0"}=();
		@{"pt_l0"}=();
#######################

require "./$mpg_r/act_l.pl";

    &F_LOCK("item");
	open(IN,"./w_db/okusyon.cgi");
	@OCD = <IN>;
	close(IN);
&ACT_L;

#####################

foreach $f_id ( keys %add_item_lsousa ) {
@{"add_item_ldelid$f_id"} = sort {$a <=> $b} @{"add_item_ldelid$f_id"};
$add_i_dsl{$f_id} = 0;
	foreach(@{"add_item_ldelid$f_id"}){
											$i=$_ - $add_i_dsl{$f_id};
splice(@{"add_item_list$f_id"} , $i, 1);
$add_i_dsl{$f_id} ++;
	}
	splice(@{"add_item_list$f_id"},100);

		if(!int(rand(10))){
	@tmp = map {(split /<>/)[1]} @{"add_item_list$f_id"};
	@{"add_item_list$f_id"} = @{"add_item_list$f_id"}[sort {$tmp[$b] <=> $tmp[$a]} 0 .. $#tmp];
	@tmp = map {(split /<>/)[2]} @{"add_item_list$f_id"};
	@{"add_item_list$f_id"} = @{"add_item_list$f_id"}[sort {$tmp[$b] <=> $tmp[$a]} 0 .. $#tmp];
		}

	@tmp = map {(split /<>/)[0]} @{"add_item_list$f_id"};
	@{"add_item_list$f_id"} = @{"add_item_list$f_id"}[sort {$tmp[$b] <=> $tmp[$a]} 0 .. $#tmp];

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
				&P_SAVE("p","$f_id","$f_id");
}
#####################

		if ($m_tt < $tt or $kousinjyoutai eq "999") {

$add_ocd_max = @OCD;
$add_ocd = 0;
$add_ocd2 = 0;
	while($add_ocd < $add_ocd_max){
$ocino = 0;
		($ocno,$ocino,$ocgaku,$octt,$ocnid,$ocnname,$ocnkuni,$ocsid,$ocsname,$ocskuni,$ococent)=split(/<>/,$OCD[$add_ocd2]);
		if (($octt + 172800 < $tt and $ocino) or $kousinjyoutai eq "999") {

	$w_id=$ocnid;&P_LOG_W("$nen_genzai年$tuki_genzai月:<span class=\"cFF0000\">$gitem[$ocino]（+ $ococent）</span>が競売会場より送られてきました。");

		$ochit = 1;
		$f_id = $ocnid;
		$kitw = $ocino;

		&ITEM_IN;

		open(OUT,">./p_db/it/$f_id.cgi");
		print OUT @{"add_item_list$f_id"};
		close(OUT);
		
		if ($ocnid ne $ocsid) {
		$ocgaku3 = int($ocgaku * 0.8);

		$f_id = $ocnid;

#		if($p_houbif{$f_id}[0] < 1){
#$p_houbif{$f_id}[0] = 0;
#		}	
#$p_houbif{$f_id}[0] += int($ocgaku3 / 1000);
#		if($p_houbif{$f_id}[0] > 2400){
#$p_houbif{$f_id}[0] = 2400;
#		}	

								$p_ex_sinyou{$f_id}++;
									$ttid = "blog/$ocnid";
									&PRLOG("\[$old_date\]$ocsnameの出品した<span class=\"cFF0000\">$gitem[$ocino]（+$ococent）</span>を金$ocgakuで落札。");

		$e_id = $ocsid;

#		if($p_houbif{$e_id}[0] < 1){
#$p_houbif{$e_id}[0] = 0;
#		}	
#$p_houbif{$e_id}[0] += int($ocgaku3 / 5000);
#		if($p_houbif{$e_id}[0] > 2400){
#$p_houbif{$e_id}[0] = 2400;
#		}	
		$p_syoji_kin{$e_id} = $p_syoji_kin{$e_id} + $ocgaku3;

					$add_b_torihiki{$e_id} = int($item_seinou{$p_syomotu{$e_id}} + int(rand(($p_sinyou{$e_id} * 2) + $p_jinbou{$e_id} + ($p_syakousei{$e_id} * 2) + ($p_kioku{$e_id} * 2) + $p_exluck{$e_id} + $p_yousi{$e_id} + $p_kotobadakumi{$e_id})*0.1));
					$add_naisei += $add_b_torihiki{$e_id};
									$kadd3 = "";
								if(int(rand($add_naisei)) >= 10){
									$kadd4 = int(rand(5) +5) * 0.01;
									$kadd4 = int($ocgaku * $kadd4);
									$p_syoji_kin{$f_id} += $kadd4;
									$kadd3 = "更に、おまけとして$kadd4の金を競売会場から貰い受けました。";
								$p_ex_sinyou{$f_id}++;
								}
		if ($p_id{$e_id}) {
	$w_id=$ocsid;&P_LOG_W("$nen_genzai年$tuki_genzai月:<span class=\"cFF0000\">$gitem[$ocino]（+$ococent）</span>が金$ocgakuで売れました。競売会場より手数料を引いた金$ocgaku3が送られてきました。$kadd3");


									$ttid = "blog/$ocsid";
									&PRLOG("\[$old_date\]<span class=\"cFF0000\">$gitem[$ocino]（+$ococent）</span>を競売に出し、金$ocgakuで$ocnnameに売却。$kadd3");
		}

		}
############途中で強制終了対策の仮セーブ（更新処理の不具合が０の場合外してもOK）
$key = $f_id;
	&P_LOG_FS;
$key = $e_id;
	&P_LOG_FS;
				&P_SAVE_FS;
		$f_id = $e_id;
				&P_SAVE_FS;
############
splice( @OCD, $add_ocd2, 1);
$add_ocd2 -=1;
		}elsif(!$ocino){
splice( @OCD, $add_ocd2, 1);
$add_ocd2 -=1;
		}
$add_ocd2 ++;
$add_ocd ++;

	}
		$ocnid = "";
###########
		}

		if ($ochit) {

	@tmp = map {(split /<>/)[3]} @OCD;
	@OCD = @OCD[sort {$tmp[$b] <=> $tmp[$a]} 0 .. $#tmp];
		open(OUT,">./w_db/okusyon.cgi");
		print OUT @OCD;
		close(OUT);

		$ocdc = '$ocdc = \'';

		$ocdcl = '$ocdcl = \'';

$add_ocd = 0;
	foreach(@OCD){
		($o3cno,$o3cino,$o3cgaku,$o3ctt,$o3cnid,$o3cnname,$o3cnkuni,$o3csid,$o3csname,$o3cskuni,$o3cent)=split(/<>/);
			($q3sec,$q3min,$q3hour,$q3day) = localtime($o3ctt);
		$o3cgaku2 = int($o3cgaku * 1.2);
		$ocdc .= "<tr class=\"bgcFFFFFF\"><td class=\"txth\">$gitem[$o3cino]（+$o3cent）</td><td>$o3cgaku</td><td>$q3day日/$q3hour時/$q3min分</td><td>$o3cnname（$o3cnkuni）</td><td>$o3csname（$o3cskuni）</td><td>金$o3cgaku2で入札<input type=checkbox name=\".no.\" value=$add_ocd></td>
";

$add_ocd ++;
	}
		$ocdc .= '\';';
		$ocdcl .= '\';1;';
		open(OUT,">./w_db/okusyon\.pl");
		print OUT "$ocdc$ocdcl";
		close(OUT);
		}
	&UNLOCK_FILE("item");


###########

		@{"kuni_l"}=();


	foreach(@p_db_kousin_l){
$f_id = $_;


#			if($p_jikan{$f_id} < $tt and $p_jikan{$f_id} < $m_tt){
				$kktthit=0;
	while($kktthit<6){
#	&BAG_LOG("$kktthit更新$f_id\n");
			if($p_jikan{$f_id} < $tt and $p_jikan{$f_id} < $m_tt){
				$thit=1;
		$fk_id = $p_kunino{$f_id};
		$p_taizai_iti{$f_id} = int($p_taizai_iti{$f_id});
		$p_kunizokusei{$f_id} = int($k_kokka_keitai{$k_kunino{$fk_id}});
		$p_kunino{$f_id} = int($p_kunino{$f_id});
		$p_sougou{$f_id} = $p_tousotu{$f_id} + $p_tiryoku{$f_id} + $p_buryoku{$f_id};
								$jfl = int($p_tousotu{$f_id} * 300 / $p_sougou{$f_id});
								$jfs = int($p_buryoku{$f_id} * 300 / $p_sougou{$f_id});
								$jfi = int($p_tiryoku{$f_id} * 300 / $p_sougou{$f_id});

							$kexaddw=0;

							$ft_id = $p_taizai_iti{$f_id};

							$p_hei_siki{$f_id}=abs($p_hei_siki{$f_id});

				open(IN,"./p_db/cd/$f_id.cgi");
				@CD_DB = <IN>;
				close(IN);
#						if(length($CD_DB[0]) > 600){
#	&M2AP_LOG("<span class=\"cFF0000\">【不正者発見？】</span>$f_id");
#				next;
#						}
				($cd_id,$cd_no,$cd_name,$cd_op0,$cd_op1,$cd_op2,$cd_op3) = split(/<>/,$CD_DB[0]);

	&BAG_LOG("$kktthit更新$f_id ,$cd_id,$cd_no,$cd_name,$cd_op0,$cd_op1,$cd_op2,$cd_op3\n");

						if($k_syuminzoku{$fk_id} eq $p_minzoku{$f_id}){
				$p_kunkou{$f_id} += 5;
						}
				$datef1 = 0;
				$datef1 -= int($kousin_kankaku * $k_kokui{$fk_id} / 500);
				$datef1 -= int($kousin_kankaku * ($p_tairyoku{$f_id} - 100) * 2 / 500);
				$p_kousin_s{$f_id} = $kousin_kankaku + $datef1;
				$p_b_kousin_s{$f_id} = int($p_kousin_s{$f_id} * 30 / (10 + $p_b_idou_sokudo{$f_id}));
				$p_h_kousin_s{$f_id} = int($p_kousin_s{$f_id} * 30 / (10 + $p_h_idou_sokudo{$f_id}));

				$add_kousin_s{$f_id} = $p_kousin_s{$f_id};


		if($p_tairyoku{$f_id} != 100){
		if($p_tairyoku{$f_id} < 100){
			$dadd = $p_tairyoku{$f_id};
				$p_tairyoku{$f_id} += 10;
			if($p_tairyoku{$f_id} > 100){
				$p_tairyoku{$f_id} = 100;
			}
	$w_id=$f_id;&P_LOG_W("<span class=\"c0000FF\">【体力回復】</span>$p_name{$f_id}の健康状態が回復しました。$dadd⇒$p_tairyoku{$f_id}");
		}else{
				$p_tairyoku{$f_id} -= 5;
			if($p_tairyoku{$f_id} < 100){
				$p_tairyoku{$f_id} = 100;
			}
		}
		}
		if($p_busyou_hp{$f_id} < $p_tairyoku{$f_id} and $p_busyou_hp{$f_id} < 100){
			$dadd = $p_busyou_hp{$f_id};
				$p_busyou_hp{$f_id} += 10;
			if($p_busyou_hp{$f_id} > 100){
				$p_busyou_hp{$f_id} = 100;
			}
$w_id=$f_id;&P_LOG_W("<span class=\"c0000FF\">【HP回復】</span>負傷していた$p_name{$f_id}のHPが回復しました。$dadd⇒$p_busyou_hp{$f_id}");
		}
$p_b_hirou{$f_id} = int($p_b_hirou{$f_id} * 0.95);
#$p_b_hirou{$f_id} -= 1;
#		if($p_b_hirou{$f_id} < 1){
#$p_b_hirou{$f_id} = 0;
#		}
$p_h_hirou{$f_id} = int($p_h_hirou{$f_id} * 0.95);
#$p_h_hirou{$f_id} -= 1;
#		if($p_h_hirou{$f_id} < 1){
#$p_h_hirou{$f_id} = 0;
#		}
		if($p_bjijyou{$f_id}[0]){
		$add_pi=0;
	foreach(@p_bjijyou{$f_id}){
		if($_){
$p_bjijyouc{$f_id}[$add_pi] -= 1;
		if(!$p_bjijyouc{$f_id}[$add_pi]){
$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$p_name{$f_id}の$SYOUIJYOU[$p_bjijyou{$f_id}[$add_pi]]状態が解けました。");
$p_bjijyouc{$f_id}[$add_pi] = 0;$p_bjijyou{$f_id}[$add_pi] = 0;
		}
		}
		$add_pi++;
	}
		}
		if($p_hjijyou{$f_id}[0]){
		$add_pi=0;
	foreach(@p_hjijyou{$f_id}){
		if($_){
$p_hjijyouc{$f_id}[$add_pi] -= 1;
		if(!$p_hjijyouc{$f_id}[$add_pi]){
$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$p_name{$f_id}の$SOL_TYPE[$p_heisyu{$f_id}]部隊の$SYOUIJYOU[$p_hjijyou{$f_id}[$add_pi]]状態が解けました。");
$p_hjijyouc{$f_id}[$add_pi] = 0;$p_hjijyou{$f_id}[$add_pi] = 0;
		}
		}
		$add_pi++;
	}
		}

$p_houbif{$f_id}[0] -= 1;
	$p_sousisan{$f_id} = $p_syoji_kome{$f_id} + $p_syoji_kin{$f_id};

				splice(@CD_DB,0,1);
				push(@CD_DB,"<><>- 未入力 -<><><><><>\n");

				open(OUT,">./p_db/cd/$f_id.cgi");
				print OUT @CD_DB;
				close(OUT);

$apon2=0;
#	open(IN,"./ip_db/jyuu/$f_id.cgi");
#	@CN_DATAJ = <IN>;
#	close(IN);
#	($apon2) = split(/<>/,$CN_DATAJ[0]);
#
#										$tuki_genzaijy = "";
#if($apon2 == 1){
#										$tuki_genzaijy = "重複登録？ヽ(｀Д´)ノ同じ接続元から複数のIDを操作している痕跡があります。回線再接続＆コマンド入力再設定をお試し下さい。<br />";
#
#}



			if($p_heisyu{$f_id} eq "97"){
										$p_heisisuu{$f_id} += int(($p_heisisuu_max{$f_id} - $p_heisisuu{$f_id}) * 0.2);
			}
########3国家
			if($k_kunino{$p_kunino{$f_id}}){

		if($p_kunkou{$f_id} > 60){
$atted = int($p_kunkou{$f_id} / 10) * 0.001;
		if($atted > 0.1){
$atted = 0.1;
		}
$kadd = int($k_kokko_sougaku{$p_kunino{$f_id}} * $atted);
			if($p_sousisan{$f_id} < $kadd and $p_houbif{$f_id}[0] < 1 and $p_kuni_sikan_nensuu{$f_id} > 50){
$k_kokko_sougaku{$p_kunino{$f_id}} -= $kadd;
$p_syoji_kin{$f_id} += $kadd;
$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:天子：$k_tensi_name{$p_kunino{$f_id}}より褒美として金$kaddが下賜されました。");

			}
		}

			if($k_kokusaku{$p_kunino{$f_id}} eq "1"){
							$solp = $SOL_PRICE[$p_heisyu{$f_id}];

							$solp += 40;

										$p_heisisuu{$f_id} += int((rand(700)+ $p_heisisuu_max{$f_id} - $p_heisisuu{$f_id})/($solp+1));

								if($p_heisisuu{$f_id} > $p_heisisuu_max{$f_id}){
									$p_heisisuu{$f_id} = $p_heisisuu_max{$f_id};
								}
										$t_nougyou_ti{$ft_id} -= int(rand($t_nougyou_ti{$ft_id} *0.005));
										$t_syougyou_ti{$ft_id} -= int(rand($t_syougyou_ti{$ft_id} *0.005));
			}elsif($k_kokusaku{$p_kunino{$f_id}} eq "4"){
										$t_nougyou_ti{$ft_id} += int(rand(($t_nougyou_max{$ft_id} - $t_nougyou_ti{$ft_id}) *0.05));
										$t_syougyou_ti{$ft_id} += int(rand(($t_syougyou_max{$ft_id} - $t_syougyou_ti{$ft_id}) *0.05));
										$t_gijyutu_ti{$ft_id} += int(rand(( $t_gijyutu_max{$ft_id} - $t_gijyutu_ti{$ft_id}) *0.03));
			}elsif($k_kokusaku{$p_kunino{$f_id}} eq "3"){
										$t_tian_ti{$ft_id} += int((100 - rand($t_tian_ti{$ft_id})) *0.2);
										$t_ryoumin_suu{$ft_id} += int(rand(10));
			}

			}
########3

					$cddb = 1;
($cddb,$cddbkuni,$cddbzoku,$cddb1,$cddb2)=split(/<>/,$CDDB{"$cd_id"});
					if($t_kunino{$ft_id} eq $p_kunino{$f_id}){
					$cddb = $cddbkuni;
					}elsif($p_kunizokusei{$f_id} and ($k_outo{$k_kunino{$fk_id}} eq $p_taizai_iti{$f_id} or $cd_id eq "hosyuu" or $cd_id eq "bouei")){
					$cddb = $cddbzoku;
					}elsif($k_kunino{$fk_id}){
#自領外
					$cddb = $cddb1;
					}
				if(!$cddb){
									$add_naisei = 0;
									if($k_kokusaku{$p_kunino{$f_id}} eq "2"){
									$add_naisei += int(rand(10));
									}
									

#################集合
			if($gundan_yakusyoku_id{$p_gundanno{$f_id}}[1] eq $f_id and $p_gunsirei{$f_id}[0] eq "1"){

						if($gundan_no{$p_gundanno{$f_id}} and $gundan_kunino{$p_gundanno{$f_id}} eq $k_kunino{$p_kunino{$f_id}}){


							foreach(@{$gundan_l{$p_gundanno{$f_id}}}){
								($unit_id,$unit_name)=split(/<>/);	
		$e_id=$unit_id;
								if($p_id{$e_id} and $f_id ne $e_id and $p_kunino{$p_id{$e_id}} eq $p_kunino{$f_id}){

									if(!$p_gunsirei{$p_id{$e_id}}[0] and $p_taizai_iti{$p_id{$e_id}} ne $p_taizai_iti{$f_id}){						
									$p_taizai_iti{$p_id{$e_id}} = $p_taizai_iti{$f_id};

	$w_id=$p_id{$e_id};&P_LOG_W("$nen_genzai年$tuki_genzai月:$unit_name軍団は軍団長の命令により$t_name[$p_taizai_iti{$f_id}]に集合させられました。");
$p_tairyoku{$e_id} -= 30;
			if($k_kokkyou{$p_kunino{$e_id}} eq "5"){
	if($k_kokkyou_keika_nen{$p_kunino{$e_id}} > 5){
$p_tairyoku{$e_id} += 30;
	}
			}
$p_b_hirou{$e_id} += 20;

	if($p_tairyoku{$e_id} < 0){
$p_tairyoku{$e_id} = 0;
	}
										
									}
								}
							}
	$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$uunit_namet軍団を$t_name[$p_taizai_iti{$f_id}]に集合させました。");
						}
			}
#################
					if($apon2){
									&NURUPO;
					}elsif($p_bjijyou_w{$f_id}[1]){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$SYOUIJYOU[1]状態で身動きが取れません。。（残り$p_bjijyouc{$f_id}[$p_bjijyou_no{$f_id}[1]]ターン）");
									&NURUPO;
					}elsif($kousinjyoutai ne "999" and $cd_id){
						
						&{"CD_ID$cd_id"}();
						
					}else{
									&NURUPO;
					}

				}elsif($t_kunino{$ft_id} eq $p_kunino{$f_id}){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:実行できないコマンドが入力されています。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
				}elsif($t_zokuno{$ft_id} eq $p_kunino{$f_id}){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:実行できないコマンドが入力されています。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
				}else{
					$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:自国ではありません。");

						if(!$k_kunino{$fk_id}){
									&JYUNSATU;
						}
#_/_/_/_/_/撤収拡張_/_/_/_/_/_/_/#
#						if($p_mikoudou_t{$f_id} < 1){
							if($town_get[$p_kunino{$f_id}] and $k_kunino{$fk_id}){
#_/_/_/_/_/撤収拡張_/_/_/_/_/_/_/#
									$ztssaki = "";
									$hit = 0;
									$add_tname2 = "";
									$add_tname3 = "";
	foreach(@{$t_setuzoku_saki{$ft_id}}){
		if($_ ne ""){
							$dt_id = $_;
			if($t_kunino{$dt_id} eq $p_kunino{$f_id}){
									$ztssaki = "$_";
									$add_tname2 = "$t_name{$_}";
									$add_tname3 = "隣接都市";
									$hit = 1;
			}
		}
	}
					if($hit eq "0"){
	$ztsc = 0;
	while ($ztsc<$tosi_kazu) {
							$dt_id = $ztsc;
		if($t_kunino{$dt_id} eq $p_kunino{$f_id}){
									$ztssaki = "$ztsc";
									$add_tname2 = "$t_name{$ztssaki}";
									$add_tname3 = "（撤退可\能な隣接都市がありません）";
									$hit = 1;
		}
		$ztsc ++;
	}

						if($hit eq "0"){
									$ztssaki = $k_outo{$p_kunino{$f_id}};
									$add_tname2 = "$t_name{$ztssaki}";
									$add_tname3 = "（撤退可\能な隣接都市がありません）";
						}
					}
					$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}は他国の都市になっています。$p_name{$f_id}は自国領内$add_tname3の$add_tname2に撤収しました。（撤収システムの影響を受けないコマンド⇒移動・自己鍛錬・ID凍結申請・凍結延長申請・仕官・下野・休暇をとる）");
							$p_taizai_iti{$f_id} = int($ztssaki);
							$p_ex_tousotu{$f_id}++;
							$p_ex_tousotu{$f_id}+= int(rand(2));
								$p_kunkou{$f_id} += 20;

#_/_/_/_/_/撤収拡張_/_/_/_/_/_/_/#
							}
#						}
#_/_/_/_/_/撤収拡張_/_/_/_/_/_/_/#
					
				}



				$riceg = $p_heisisuu{$f_id};

		if($p_heisyu{$f_id} eq "33"){
	$riceg = int(rand($p_heisisuu{$f_id} * 1));
				$p_syoji_kome{$f_id} += $riceg;
		}else{
				if($p_heisyu{$f_id} > 89){
				$riceg = int($p_heisisuu{$f_id} * 4);
				}elsif($p_heisyu{$f_id} > 19){
				$riceg = int($p_heisisuu{$f_id} * 2);
				}elsif($p_heisyu{$f_id} > 9){
				$riceg = int($p_heisisuu{$f_id} * 1);
				}
			if($jfl>129){
				$riceg = int($riceg * 0.5);
			if($jfl>159){
				$riceg = int($riceg * 0.8);
			}
			}
				$p_syoji_kome{$f_id} -= $riceg;
		}


				if($p_syoji_kome{$f_id} < 0){
					$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:<span class=\"cFF0000\">【脱走】</span>:米を支払えず兵が脱走しました！");
					$p_heisisuu{$f_id} = 0;
					$p_syoji_kome{$f_id} = 0;
				}


#				$nouryoku_up = int($p_ex_buryoku{$f_id}*0.1) + int($p_ex_tiryoku{$f_id}*0.1) + int($p_ex_tousotu{$f_id}*0.1) + int($p_ex_jinbou{$f_id}*0.1) + int($p_ex_kijyou{$f_id}*0.1) + int($p_ex_syageki{$f_id}*0.1) + int($p_ex_bujyutu{$f_id}*0.1) + int($p_ex_jyujyutu{$f_id}*0.1) + int($p_ex_tyouhou{$f_id}*0.1) + int($p_ex_jyuukisouda{$f_id}*0.1) + int($p_ex_tyoukyou{$f_id}*0.1) + int($p_ex_seiji{$f_id}*0.1) + int($p_ex_sinyou{$f_id}*0.1);
#			if($nouryoku_up){
				if($p_ex_buryoku{$f_id} >= 10){
					$add_5= int($p_ex_buryoku{$f_id} /10);
					$p_buryoku{$f_id}+=$add_5;
					$p_ex_buryoku{$f_id}-=10 * $add_5;
					
					$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:<span class=\"c0000FF\">【上昇】</span>:$p_name{$f_id}の武力が$add_5上がった！");
				}
				if($p_ex_tiryoku{$f_id} >= 10){
					$add_6= int($p_ex_tiryoku{$f_id} /10);
					$p_tiryoku{$f_id}+=$add_6;
					$p_ex_tiryoku{$f_id}-=10 * $add_6;
					$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:<span class=\"c0000FF\">【上昇】</span>:$p_name{$f_id}の知力が$add_6上がった！");
				}
				if($p_ex_tousotu{$f_id} >= 10){
					$add_7= int($p_ex_tousotu{$f_id} /10);
					$p_tousotu{$f_id}+=$add_7;
					$p_ex_tousotu{$f_id}-=10 * $add_7;
					$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:<span class=\"c0000FF\">【上昇】</span>:$p_name{$f_id}の統率力が$add_7上がった！");
				}
				if($p_ex_jinbou{$f_id} >= 10){
					$add_8= int($p_ex_jinbou{$f_id} /10);
					$p_jinbou{$f_id}+=$add_8;
					$p_ex_jinbou{$f_id}-=10 * $add_8;
					$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:<span class=\"c0000FF\">【上昇】</span>:$p_name{$f_id}の人望が$add_8上がった！");
				}

				if($p_ex_kijyou{$f_id} >= 10){
					$add_8= int($p_ex_kijyou{$f_id} /10);
					$p_kijyou{$f_id}+=$add_8;
					$p_ex_kijyou{$f_id}-=10 * $add_8;
					$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:<span class=\"c0000FF\">【上昇】</span>:$p_name{$f_id}の騎乗能力が$add_8上がった！");
				}
				if($p_ex_syageki{$f_id} >= 10){
					$add_8= int($p_ex_syageki{$f_id} /10);
					$p_syageki{$f_id}+=$add_8;
					$p_ex_syageki{$f_id}-=10 * $add_8;
					$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:<span class=\"c0000FF\">【上昇】</span>:$p_name{$f_id}の射撃能力が$add_8上がった！");
				}
				if($p_ex_bujyutu{$f_id} >= 10){
					$add_8= int($p_ex_bujyutu{$f_id} /10);
					$p_bujyutu{$f_id}+=$add_8;
					$p_ex_bujyutu{$f_id}-=10 * $add_8;
					$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:<span class=\"c0000FF\">【上昇】</span>:$p_name{$f_id}の武術が$add_8上がった！");
				}
				if($p_ex_jyujyutu{$f_id} >= 10){
					$add_8= int($p_ex_jyujyutu{$f_id} /10);
					$p_jyujyutu{$f_id}+=$add_8;
					$p_ex_jyujyutu{$f_id}-=10 * $add_8;
					$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:<span class=\"c0000FF\">【上昇】</span>:$p_name{$f_id}の呪術能力が$add_8上がった！");
				}
				if($p_ex_tyouhou{$f_id} >= 10){
					$add_8 = int($p_ex_tyouhou{$f_id} /10);
					$p_tyouhou{$f_id}+=$add_8;
					$p_ex_tyouhou{$f_id}-=10 * $add_8;
					$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:<span class=\"c0000FF\">【上昇】</span>:$p_name{$f_id}の諜報能力が$add_8上がった！");
				}
				if($p_ex_jyuukisouda{$f_id} >= 10){
					$add_8= int($p_ex_jyuukisouda{$f_id} /10);
					$p_jyuukisouda{$f_id}+=$add_8;
					$p_ex_jyuukisouda{$f_id}-=10 * $add_8;
					$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:<span class=\"c0000FF\">【上昇】</span>:$p_name{$f_id}の重機操舵が$add_8上がった！");
				}
				if($p_ex_tyoukyou{$f_id} >= 10){
					$add_8= int($p_ex_tyoukyou{$f_id} /10);
					$p_tyoukyou{$f_id}+=$add_8;
					$p_ex_tyoukyou{$f_id}-=10 * $add_8;
					$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:<span class=\"c0000FF\">【上昇】</span>:$p_name{$f_id}の調教技術が$add_8上がった！");
				}
				if($p_ex_seiji{$f_id} >= 10){
					$add_8= int($p_ex_seiji{$f_id} /10);
					$p_seiji{$f_id}+=$add_8;
					$p_ex_seiji{$f_id}-=10 * $add_8;
					$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:<span class=\"c0000FF\">【上昇】</span>:$p_name{$f_id}の政治力が$add_8上がった！");
				}
				if($p_ex_sinyou{$f_id} >= 10){
					$add_8= int($p_ex_sinyou{$f_id} /10);
					$p_sinyou{$f_id}+=$add_8;
					$p_ex_sinyou{$f_id}-=10 * $add_8;
					$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:<span class=\"c0000FF\">【上昇】</span>:$p_name{$f_id}の商才が$add_8上がった！");
				}
#			}
$p_jikan{$f_id} += $add_kousin_s{$f_id};
			($qsec,$qmin,$qhour,$qday) = localtime($p_jikan{$f_id});
				&KTS2;

		$p_taizai_iti{$f_id} = int($p_taizai_iti{$f_id});
		$p_kunino{$f_id} = int($p_kunino{$f_id});



			}else{
 $kktthit += 100;
			}
 $kktthit++;
	}
#			}
			$p_sougou{$f_id} = $p_buryoku{$f_id}+$p_tiryoku{$f_id}+$p_tousotu{$f_id};
	}

	&BAG_LOG("ファイナル\n");
###############blファイナル


	foreach(@p_db_all_l){
			$f_id = $_;

####おまけ処理（更新内容保管）
							$ft_id = $p_taizai_iti{$f_id};
		if($p_kunino{$f_id} eq $t_kunino{$ft_id}){
			$listtz[$p_taizai_iti{$f_id}] .= "$p_name{$f_id} ";
			$listtzno[$p_taizai_iti{$f_id}] ++;
		}elsif($t_zokuno{$ft_id} eq $p_kunino{$f_id}){
			$listtzzno[$p_taizai_iti{$f_id}] ++;
		}else{
			$listtzxno[$p_taizai_iti{$f_id}] ++;
		}
			$listtzdno[$p_taizai_iti{$f_id}] ++;

		if($p_yomikaki{$f_id} eq "0"){
				&P_SW("p","$f_id","$f_id");
			push(@CL_DATA,"@NEW_D");
		}
####
	}

###############

#	@tmp = map {(split /,/)[186]} @CL_DATA;
#	@CL_DATA = @CL_DATA[sort {$tmp[$b] <=> $tmp[$a]} 0 .. $#tmp];

###############


		if($tenkahit){
		$m_tt += 259200;
		$kousinjyoutai= 999;
splice( @JJM, 0, 1, "$keika_nen<>$tuki_genzai<>$m_tt<>$kousinjyoutai<>$tenkakaisuu<>$outyou<>$seibento1<>$seibento2<>$syuminzoku<>$msyuto<>$kaisinen<>$zenkaisinen<>$touitunen<>$sinkouminzoku1<>$sinkouminzoku2<>$zentensimei<><><><><>\n");

	foreach(@p_db_all_l){
			$f_id = $_;
$p_jikan{$f_id} = $m_tt + 3600;

	}
		}

}


########


sub M2AP_LOG {
$_[1] = $_[0]; 
$_[1] =~ s/<(.*?)>//g;
	unshift(@M2L,"$_[0]$tt_date<>$tt<>$tt_rss<>$_[1]<>$URI/?.m.=map2<>$_[2]<>$_[3]<>\n");
}

sub LOG2BL {

	$w_id=$p_id{$kbp_id[$ki]};&P_LOG_W("$_[0]");
	$w_id=$p_id{$ebp_id[$ei]};&P_LOG_W("$_[0]");

}

sub K1LOGBL {

	&IMG_B_CG_SAKUSEI("$p_img{$kbp_id[$ki]}$p_cgno{$kbp_id[$ki]}[$img_op_add{$kbp_id[$ki]}]$p_img_f{$kbp_id[$ki]}","$img_wide","$img_height","$p_img_m{$kbp_id[$ki]}","b$kbp_id[$ki]\_$kbp_logf[$ki]","$kbp_2id[$ki]","$img_op_add{$kbp_id[$ki]}","","","","","","");
#<tr><td colspan=\"13\">$logfc</td></tr>
		$mapseiseiblm .= "
<tr>$logfc<td colspan=\"13\">$logfc</td></tr>
<tr>
<td class=\"txtr\" colspan=\"2\">
<a href=\"#$kbp_id[$ki]-$count\">$img_sakusei_kekka</a>
</td>
<td colspan=\"11\">
$_[0]
</td>
</tr>";
$logfc="";
}
sub K_K1LOGBL {

	&IMG_B_CG_SAKUSEI("$p_img{$kbp_id[$ki_k]}$p_cgno{$kbp_id[$ki_k]}[$img_op_add{$kbp_id[$ki_k]}]$p_img_f{$kbp_id[$ki_k]}","$img_wide","$img_height","$p_img_m{$kbp_id[$ki_k]}","b$kbp_id[$ki_k]\_$kbp_logf[$ki_k]","$kbp_2id[$ki_k]","$img_op_add{$kbp_id[$ki_k]}","","","","","","");
		$mapseiseiblm .= "
<tr>$logfc<td colspan=\"13\">$logfc</td></tr>
<tr>
<td class=\"txtr\" colspan=\"2\">
<a href=\"#$kbp_id[$ki_k]-$count\">$img_sakusei_kekka</a>
</td>
<td colspan=\"11\">
$_[0]
</td>
</tr>";
$logfc="";
}
sub K2LOGBL {

	&IMG_B_CG_SAKUSEI("$p_img{$kbp_id[$ki_d]}$p_cgno{$kbp_id[$ki_d]}[$img_op_add{$kbp_id[$ki_d]}]$p_img_f{$kbp_id[$ki_d]}","$img_wide","$img_height","$p_img_m{$kbp_id[$ki_d]}","b$kbp_id[$ki_d]\_$kbp_logf[$ki_d]","$kbp_2id[$ki_d]","$img_op_add{$kbp_id[$ki_d]}","","","","","","");
		$mapseiseiblm .= "
<tr>$logfc<td colspan=\"13\">$logfc</td></tr>
<tr>
<td class=\"txtr\" colspan=\"2\"><a href=\"#$kbp_id[$ki_d]-$count\">$img_sakusei_kekka</a>";
	&IMG_B_CG_SAKUSEI("$p_img{$kbp_id[$ki]}$p_cgno{$kbp_id[$ki]}[$img_op_add{$kbp_id[$ki]}]$p_img_f{$kbp_id[$ki]}","$img_wide","$img_height","$p_img_m{$kbp_id[$ki]}","b$kbp_id[$ki]\_$kbp_logf[$ki]","$kbp_2id[$ki]","$img_op_add{$kbp_id[$ki]}","","","","","","");
		$mapseiseiblm .= "
<a href=\"#$kbp_id[$ki]-$count\">$img_sakusei_kekka</a>
</td>
<td colspan=\"11\">
$_[0]
</td>
</tr>";

$logfc="";
}

sub E1LOGBL {

	&IMG_B_CG_SAKUSEI("$p_img{$ebp_id[$ei]}$p_cgno{$ebp_id[$ei]}[$img_op_add{$ebp_id[$ei]}]$p_img_f{$ebp_id[$ei]}","$img_wide","$img_height","$p_img_m{$ebp_id[$ei]}","b$ebp_id[$ei]\_$ebp_logf[$ei]","$ebp_2id[$ei]","$img_op_add{$ebp_id[$ei]}","","","","","","");
		$mapseiseiblm .= "
<tr>$logfc<td colspan=\"13\">$logfc</td></tr>
<tr>
<td colspan=\"11\" class=\"txtr\">
$_[0]
</td>
<td colspan=\"2\"><a href=\"#$ebp_id[$ei]-$count\">$img_sakusei_kekka</a>
</td>
</tr>";
$logfc="";

}
sub K_E1LOGBL {

	&IMG_B_CG_SAKUSEI("$p_img{$ebp_id[$ei_k]}$p_cgno{$ebp_id[$ei_k]}[$img_op_add{$ebp_id[$ei_k]}]$p_img_f{$ebp_id[$ei_k]}","$img_wide","$img_height","$p_img_m{$ebp_id[$ei_k]}","b$ebp_id[$ei_k]\_$ebp_logf[$ei_k]","$ebp_2id[$ei_k]","$img_op_add{$ebp_id[$ei_k]}","","","","","","");
		$mapseiseiblm .= "
<tr>$logfc<td colspan=\"13\">$logfc</td></tr>
<tr>
<td colspan=\"11\" class=\"txtr\">
$_[0]
</td>
<td colspan=\"2\"><a href=\"#$ebp_id[$ei_k]-$count\">$img_sakusei_kekka</a>
</td>
</tr>";
$logfc="";

}
sub KD_K1LOGBL {

	&IMG_B_CG_SAKUSEI("$p_img{$kbp_id[$ki_k]}$p_cgno{$kbp_id[$ki_k]}[$img_op_add{$kbp_id[$ki_k]}]$p_img_f{$kbp_id[$ki_k]}","$img_wide","$img_height","$p_img_m{$kbp_id[$ki_k]}","b$kbp_id[$ki_k]\_$kbp_logf[$ki_k]","$kbp_2id[$ki]","$img_op_add{$kbp_id[$ki_k]}","","","","","","");
		$mapseiseiblm .= "
<tr>$logfc<td colspan=\"13\">$logfc</td></tr>
<tr>
<td colspan=\"2\" class=\"txtr\">
<a href=\"#$kbp_id[$ki_k]-$count\">$img_sakusei_kekka</a>";
	&IMG_B_CG_SAKUSEI("$p_img{$ebp_id[$addi]}$p_cgno{$ebp_id[$addi]}[$img_op_add{$ebp_id[$addi]}]$p_img_f{$ebp_id[$addi]}","$img_wide","$img_height","$p_img_m{$ebp_id[$addi]}","b$ebp_id[$addi]\_$ebp_logf[$addi]","$ebp_2id[$addi]","$img_op_add{$ebp_id[$addi]}","","","","","","");
		$mapseiseiblm .= "
</td>
<td colspan=\"9\">
$_[0]
</td>
<td colspan=\"2\"><a href=\"#$ebp_id[$addi]-$count\">$img_sakusei_kekka</a>
</td>
</tr>";
$logfc="";

}
sub KD_E1LOGBL {

	&IMG_B_CG_SAKUSEI("$p_img{$kbp_id[$addi]}$p_cgno{$kbp_id[$addi]}[$img_op_add{$kbp_id[$addi]}]$p_img_f{$kbp_id[$addi]}","$img_wide","$img_height","$p_img_m{$kbp_id[$addi]}","b$kbp_id[$addi]\_$kbp_logf[$addi]","$kbp_2id[$addi]","$img_op_add{$kbp_id[$addi]}");
		$mapseiseiblm .= "
<tr>$logfc<td colspan=\"13\">$logfc</td></tr>
<tr>
<td colspan=\"2\" class=\"txtr\">
<a href=\"#$kbp_id[$addi]-$count\">$img_sakusei_kekka</a>";
	&IMG_B_CG_SAKUSEI("$p_img{$ebp_id[$ei_k]}$p_cgno{$ebp_id[$ei_k]}[$img_op_add{$ebp_id[$ei_k]}]$p_img_f{$ebp_id[$ei_k]}","$img_wide","$img_height","$p_img_m{$ebp_id[$ei_k]}","b$ebp_id[$ei_k]\_$ebp_logf[$ei_k]","$ebp_2id[$ei_k]","$img_op_add{$ebp_id[$ei_k]}","","","","","","");
		$mapseiseiblm .= "
</td>
<td colspan=\"9\">
$_[0]
</td>
<td colspan=\"2\"><a href=\"#$ebp_id[$ei_k]-$count\">$img_sakusei_kekka</a>
</td>
</tr>";
$logfc="";

}
sub KE1LOGBL {

	&IMG_B_CG_SAKUSEI("$p_img{$kbp_id[$ki]}$p_cgno{$kbp_id[$ki]}[$img_op_add{$kbp_id[$ki]}]$p_img_f{$kbp_id[$ki]}","$img_wide","$img_height","$p_img_m{$kbp_id[$ki]}","b$kbp_id[$ki]\_$kbp_logf[$ki]","$kbp_2id[$ki]","$img_op_add{$kbp_id[$ki]}","","","","","","");
		$mapseiseiblm .= "
<tr>$logfc<td colspan=\"13\">$logfc</td></tr>
<tr>
<td class=\"txtr\" colspan=\"2\">
<a href=\"#$kbp_id[$ki]-$count\">$img_sakusei_kekka</a>";

	&IMG_B_CG_SAKUSEI("$p_img{$ebp_id[$ei]}$p_cgno{$ebp_id[$ei]}[$img_op_add{$ebp_id[$ei]}]$p_img_f{$ebp_id[$ei]}","$img_wide","$img_height","$p_img_m{$ebp_id[$ei]}","b$ebp_id[$ei]\_$ebp_logf[$ei]","$ebp_2id[$ei]","$img_op_add{$ebp_id[$ei]}","","","","","","");
		$mapseiseiblm .= "
</td>
<td colspan=\"9\">
$_[0]
</td>
<td colspan=\"2\"><a href=\"#$ebp_id[$ei]-$count\">$img_sakusei_kekka</a>
</td>
</tr>";
$logfc="";

}
sub E2LOGBL {

	&IMG_B_CG_SAKUSEI("$p_img{$ebp_id[$ei]}$p_cgno{$ebp_id[$ei]}[$img_op_add{$ebp_id[$ei]}]$p_img_f{$ebp_id[$ei]}","$img_wide","$img_height","$p_img_m{$ebp_id[$ei]}","b$ebp_id[$ei]\_$ebp_logf[$ei]","$ebp_2id[$ei]","$img_op_add{$ebp_id[$ei]}","","","","","","");
		$mapseiseiblm .= "
<tr>$logfc<td colspan=\"13\">$logfc</td></tr>
<tr>
<td colspan=\"11\" class=\"txtr\">
$_[0]
</td>
<td colspan=\"2\"><a href=\"#$ebp_id[$ei]-$count\">$img_sakusei_kekka</a>";
	&IMG_B_CG_SAKUSEI("$p_img{$ebp_id[$ei_d]}$p_cgno{$ebp_id[$ei_d]}[$img_op_add{$ebp_id[$ei_d]}]$p_img_f{$ebp_id[$ei_d]}","$img_wide","$img_height","$p_img_m{$ebp_id[$ei_d]}","b$ebp_id[$ei_d]\_$ebp_logf[$ei_d]","$ebp_2id[$ei_d]","$img_op_add{$ebp_id[$ei_d]}","","","","","","");
		$mapseiseiblm .= "
<a href=\"#$ebp_id[$ei_d]-$count\">$img_sakusei_kekka</a>
</td>
</tr>";
$logfc="";

}




sub K_KYUUKETU_SOSEI {
									if($p_heisyu{$kbp_id[$ki]} eq "93" and $battle_end < 1 and $p_heisyu{$ebp_id[$ei]} ne "12" and $kbp_yuuhk[$ki] < 1){
										$p_heisisuu{$kbp_id[$ki]} += $kbp_add_kyuuketu[$ki];
							if($p_heisisuu{$kbp_id[$ki]} > $kbp_solmax[$ki]){
								$p_heisisuu{$kbp_id[$ki]} = $kbp_solmax[$ki];
							}
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:血を吸われた死者が蘇り$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊に編入した！！ ↑\(+$kbp_dmg[$ki]\)");
									}

}
sub E_KYUUKETU_SOSEI {
									if($p_heisyu{$ebp_id[$ei]} eq "93" and $p_heisyu{$kbp_id[$ki]} ne "12" and $kbp_yuuhe[$ki] < 1){
										$p_heisisuu{$ebp_id[$ei]} += $ebp_add_kyuuketu[$ei];
							if($p_heisisuu{$ebp_id[$ei]} > $ebp_solmax[$ei]){
								$p_heisisuu{$ebp_id[$ei]} = $ebp_solmax[$ei];
							}
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:血を吸われた死者が蘇り$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊に編入した！！ ↑\(+$ebp_dmg[$ei]\)");
									}
}
sub STLOGBL {
	$ebp_dmgc[$ei] = sprintf("(%+d)", 0- $ebp_dmg[$ei] - $kbp_sub_dmg[$ki]);
	$kbp_dmgc[$ki] = sprintf("(%+d)", 0- $kbp_dmg[$ki] - $ebp_sub_dmg[$ei]);
		$mapseiseiblm .= "
<tr>$logfc<td colspan=\"13\">$logfc</td></tr>
<tr>
<td class=\"txtr\"><a href=\"#$kbp_id[$ki]-$count\">$p_name{$kbp_id[$ki]}</a></td><td colspan=\"2\" class=\"txtr\">$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]</td><td class=\"txtr\">AP$kbp_apadd[$ki]</td><td class=\"txtr\">AC$kbp_acadd[$ki]</td><td class=\"txtr\"><span class=\"cFF0000\">$ebp_dmgc[$ei]</span>$p_heisisuu{$kbp_id[$ki]}</td>
<td class=\"txtc\">Vs</td>
<td>$p_heisisuu{$ebp_id[$ei]}<span class=\"cFF0000\">$kbp_dmgc[$ki]</span></td><td>AC$ebp_acadd[$ei]</td><td>AP$ebp_apadd[$ei]</td><td colspan=\"2\">$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]</td><td><a href=\"#$ebp_id[$ei]-$count\">$p_name{$ebp_id[$ei]}</a></td>

</tr>";
$logfc="";

}

sub KWBLOGBL {

		$mapseiseiblm .= "
<tr>$logfc<td colspan=\"13\">$logfc</td></tr>
<tr>
<td colspan=\"13\">
$_[0]
</td>
</tr>";
$logfc="";

}
sub EWBLOGBL {

		$mapseiseiblm .= "
<tr>$logfc<td colspan=\"13\">$logfc</td></tr>
<tr>
<td colspan=\"13\" class=\"txtr\">
$_[0]
</td>
</tr>";
$logfc="";

}
sub WBLOGBL {

		$mapseiseiblm .= "
<tr>$logfc<td colspan=\"13\">$logfc</td></tr>
<tr>
<td colspan=\"13\">
$_[0]
</td>
</tr>";
$logfc="";

}

########


sub KYUURYOU {

	@cex_total3=();
	@ksalhs=();

	%k_kin_syuunyuu_sougaku=();
	%k_kome_syuunyuu_sougaku=();

		$thit = 0;
	while ($thit<$tosi_kazu) {
							$dt_id = $thit;

									
									if($t_syougyou_ti{$dt_id} > 10000){
									$add_syo = int(($t_syougyou_ti{$dt_id} - 1000) * 0.001)+790;
									}elsif($t_syougyou_ti{$dt_id} > 2000){
									$add_syo = int(($t_syougyou_ti{$dt_id} - 1000) * 0.01)+710;
									}elsif($t_syougyou_ti{$dt_id} > 1000){
									$add_syo = int(($t_syougyou_ti{$dt_id} - 1000) * 0.1)+610;
									}elsif($t_syougyou_ti{$dt_id} > 300){
									$add_syo = int(($t_syougyou_ti{$dt_id} - 300) * 0.3)+400;
									}else{
									$add_syo = int($t_syougyou_ti{$dt_id} * 0.5)+250;
									}



									if($t_nougyou_ti{$dt_id} > 10000){
									$add_nou = int(($t_nougyou_ti{$dt_id} - 1000) * 0.001)+790;
									}elsif($t_nougyou_ti{$dt_id} > 2000){
									$add_nou = int(($t_nougyou_ti{$dt_id} - 1000) * 0.01)+710;
									}elsif($t_nougyou_ti{$dt_id} > 1000){
									$add_nou = int(($t_nougyou_ti{$dt_id} - 1000) * 0.1)+610;
									}elsif($t_nougyou_ti{$dt_id} > 300){
									$add_nou = int(($t_nougyou_ti{$dt_id} - 300) * 0.3)+400;
									}else{
									$add_nou = int($t_nougyou_ti{$dt_id} * 0.5)+250;
									}


									if($t_ryoumin_suu{$dt_id} > 50000){
									$add_ryoumin = int(($t_ryoumin_suu{$dt_id} - 50000) * 0.1)+30000;
									}elsif($t_ryoumin_suu{$dt_id} > 10000){
									$add_ryoumin = int(($t_ryoumin_suu{$dt_id} - 10000) * 0.5)+10000;
									}elsif($t_ryoumin_suu{$dt_id} < 7000){
									$add_ryoumin = 7000;
									}else{
									$add_ryoumin = $t_ryoumin_suu{$dt_id};
									}

									if($ksalhs[$t_kunino{$dt_id}] > 3){
				$add_nou -= 150;
				$add_syo -= 150;
									}
									if($ksalhs[$t_kunino{$dt_id}] > 14){
				$add_nou -= 250;
				$add_syo -= 250;
									}
	$ksalhs[$t_kunino{$dt_id}]++;
				$k_kin_syuunyuu_sougaku{$t_kunino{$dt_id}} += int($add_syo * ($sousu2+20) * $add_ryoumin / 20000);
				$k_kome_syuunyuu_sougaku{$t_kunino{$dt_id}} += int($add_nou * ($sousu2+20) * $add_ryoumin / 20000);

		$thit ++;
	}


	foreach(@k_no_all_l){
		$ceno=int($_);
							$k_kin_syuunyuu_sougaku{$ceno} = int($k_kin_syuunyuu_sougaku{$ceno})+10;
							$k_kome_syuunyuu_sougaku{$ceno} = int($k_kome_syuunyuu_sougaku{$ceno})+10;
							$ceexkin = int($k_kin_syuunyuu_sougaku{$ceno} * ($k_busyou_kazei{$ceno} + 10)/ 100);
							$ceexkome = int($k_kome_syuunyuu_sougaku{$ceno} * ($k_busyou_kazei{$ceno} + 10)/ 100);
			if($tuki_genzai eq "1"){
							$k_kokko_sougaku{$ceno} += $ceexkin;
			}elsif($tuki_genzai eq "7"){
							$k_kokko_sougaku{$ceno} += $ceexkome;
			}
							$k_kin_syuunyuu_sougaku_w{$ceno} = $k_kin_syuunyuu_sougaku{$ceno} - $ceexkin;
							$k_kome_syuunyuu_sougaku_w{$ceno} = $k_kome_syuunyuu_sougaku{$ceno} - $ceexkome;

	}

}

########
sub NURUPO
{


						$p_mikoudou_t{$f_id}++;
						if($p_mikoudou_t{$f_id} >= $TOUKETU_T){
	&KUNI_KAKUDUKE("$f_id","$fk_id","$fk_id");
$p_kuni_yakusyoku{$w_id} = 0;
					if($apon2 == 1){
							$add_4 = $p_syoji_kin{$f_id} + $p_syoji_kome{$f_id};

							$k_kokko_sougaku{$p_kunino{$f_id}} += $add_4;

						$p_yomikaki{$f_id} = 1;
							unlink("./p_db/p/$f_id.cgi");
							unlink("./p_db/my_log/$f_id.cgi");
							unlink("./p_db/cd/$f_id.cgi");
							unlink("./p_db/co/$f_id.cgi");
							unlink("./pr/b/$f_id.cgi");
							unlink("./pr/blog/$f_id.cgi");
			unlink("./p_db/tt/$f_id.cgi");
	&BL_SAVE("bl","$f_id","$f_id");
										if($k_yakusyoku_id{$fk_id}[26] and $k_yakusyoku_id{$fk_id}[26] ne $f_id){									

	$w_id=$p_id{$k_yakusyoku_id{$fk_id}[26]};&P_LOG_W("放置削除された$p_name{$f_id}からの遺品として、金$add_4が国庫に送り届けられました。");
										}
							&M2AP_LOG("《 重複放置 》負荷軽減のため$p_name{$f_id}を削除。");
					}else{

					if($p_tuusan_nensuu{$f_id} < 50){
	@NEW_CD_DB = ();
			push(@NEW_CD_DB,"$tt<>$f_id<><><><>\n");
	open(OUT,">./ip_db/giwaku/$f_id.cgi");
	print OUT @NEW_CD_DB;
	close(OUT);
					}
						$p_yomikaki{$f_id} = 2;
	@NEW_DATA=();
						$p_mikoudou_t{$f_id} = 0;


	&TOUKETU_SAVE("touketu","$f_id","$f_id");

							&M2AP_LOG("《 ID凍結 》長期間アクセスが無かったため、$p_name{$f_id}のIDは凍結処理されました。");
					}
 $kktthit += 100;
					last;
						}

$kadd1 = $p_b_hirou{$f_id};
$kadd2 = $p_tairyoku{$f_id};
$kadd3 = $p_busyou_hp{$f_id};
$kadd4 = $p_busyou_mp{$f_id};
$kadd5 = $p_busyou_sp{$f_id};
$p_b_hirou{$f_id} = 0;
					if($p_tairyoku{$f_id} < 100){
$p_tairyoku{$f_id} = 100;
					}
					if($p_busyou_hp{$f_id} < 100){
$p_busyou_hp{$f_id} = 100;
					}
					if($p_busyou_mp{$f_id} < 100){
$p_busyou_mp{$f_id} = 100;
					}
					if($p_busyou_sp{$f_id} < 100){
$p_busyou_sp{$f_id} = 100;
					}
						$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$tuki_genzaijy自宅にて休養しました。将疲：$kadd1⇒$p_b_hirou{$f_id}。体力：$kadd2⇒$p_tairyoku{$f_id}。HP：$kadd3⇒$p_busyou_hp{$f_id}。MP：$kadd4⇒$p_busyou_mp{$f_id}。SP：$kadd5⇒$p_busyou_sp{$f_id}。");



}
########

sub CAUNTA
{
							$add_kousen_hit=0;
							$add_caunta_cd_w{$cd_id}=$cd_id;
							$add_caunta_cd_w{"ryuugen2"} = '流言工作';
							$add_caunta_cd_w{"yakiuti2"} = '焼き討ち';
							$add_caunta_cd_w{"kabeb2"} = '城壁破壊';
							$add_caunta_cd_w{"sendou2"} = '住民扇動';
							$add_caunta_cd_w{"sensou2"} = '侵攻';

							if($k_kunino{$ek_id} and $k_kunino{$fk_id} and !$p_kunizokusei{$f_id} and $k_kunino{$fk_id} ne $k_kunino{$ek_id}){
									$cauntacome = "$k_name_d[$k_kunino{$fk_id}]軍 $p_p_b_a{$f_id}の突然の急襲（$add_caunta_cd_w{$cd_id}）に対し、$k_name{$ek_id}天子 $k_tensi_name{$k_kunino{$ek_id}}は、$k_p_k_a{$fk_id}に対する反撃許可を下しました！！";
								if($k_kokka_keitai{$k_kunino{$ek_id}}){
									$cauntacome = "$t_name[$k_outo{$fk_id}]を支配する$k_name_d[$k_kunino{$fk_id}]軍と交戦状態に入る。";
								}
								if($k_kunino{$fk_id} ne "$k_kousen_aite_k{$ek_id}[0]" and (!$k_kunino{$k_kousen_aite_k{$ek_id}[0]} or $k_kokka_keitai{$k_kousen_aite_k{$ek_id}[0]})){
		$k_kousen_aite_k{$ek_id}[0] = $k_kunino{$fk_id};
									$ttid = "klog/$k_kunino{$ek_id}";
									&PRLOG("\[$old_date\]$cauntacome");
								}elsif($k_kunino{$fk_id} ne "$k_kousen_aite_k{$ek_id}[1]" and (!$k_kunino{$k_kousen_aite_k{$ek_id}[1]} or $k_kokka_keitai{$k_kousen_aite_k{$ek_id}[1]})){
		$k_kousen_aite_k{$ek_id}[1] = $k_kunino{$fk_id};
									$ttid = "klog/$k_kunino{$ek_id}";
									&PRLOG("\[$old_date\]$cauntacome");
								}elsif($k_kunino{$fk_id} ne "$k_kousen_aite_k{$ek_id}[2]" and (!$k_kunino{$k_kousen_aite_k{$ek_id}[2]} or $k_kokka_keitai{$k_kousen_aite_k{$ek_id}[2]})){
		$k_kousen_aite_k{$ek_id}[2] = $k_kunino{$fk_id};
									$ttid = "klog/$k_kunino{$ek_id}";
									&PRLOG("\[$old_date\]$cauntacome");
								}elsif($k_kunino{$fk_id} ne "$k_kousen_aite_k{$ek_id}[3]" and (!$k_kunino{$k_kousen_aite_k{$ek_id}[3]} or $k_kokka_keitai{$k_kousen_aite_k{$ek_id}[3]})){
		$k_kousen_aite_k{$ek_id}[3] = $k_kunino{$fk_id};
									$ttid = "klog/$k_kunino{$ek_id}";
									&PRLOG("\[$old_date\]$cauntacome");
								}elsif($k_kunino{$fk_id} ne "$k_kousen_aite_k{$ek_id}[4]" and (!$k_kunino{$k_kousen_aite_k{$ek_id}[4]} or $k_kokka_keitai{$k_kousen_aite_k{$ek_id}[4]})){
		$k_kousen_aite_k{$ek_id}[4] = $k_kunino{$fk_id};
									$ttid = "klog/$k_kunino{$ek_id}";
									&PRLOG("\[$old_date\]$cauntacome");
								}elsif($k_kunino{$fk_id} ne "$k_kousen_aite_k{$ek_id}[5]" and (!$k_kunino{$k_kousen_aite_k{$ek_id}[5]} or $k_kokka_keitai{$k_kousen_aite_k{$ek_id}[5]})){
		$k_kousen_aite_k{$ek_id}[5] = $k_kunino{$fk_id};
									$ttid = "klog/$k_kunino{$ek_id}";
									&PRLOG("\[$old_date\]$cauntacome");
								}elsif($k_kunino{$fk_id} ne "$k_kousen_aite_k{$ek_id}[6]" and (!$k_kunino{$k_kousen_aite_k{$ek_id}[6]} or $k_kokka_keitai{$k_kousen_aite_k{$ek_id}[6]})){
		$k_kousen_aite_k{$ek_id}[6] = $k_kunino{$fk_id};
									$ttid = "klog/$k_kunino{$ek_id}";
									&PRLOG("\[$old_date\]$cauntacome");
								}elsif($k_kunino{$fk_id} ne "$k_kousen_aite_k{$ek_id}[7]" and (!$k_kunino{$k_kousen_aite_k{$ek_id}[7]} or $k_kokka_keitai{$k_kousen_aite_k{$ek_id}[7]})){
		$k_kousen_aite_k{$ek_id}[7] = $k_kunino{$fk_id};
									$ttid = "klog/$k_kunino{$ek_id}";
									&PRLOG("\[$old_date\]$cauntacome");
								}elsif($k_kunino{$fk_id} ne "$k_kousen_aite_k{$ek_id}[8]" and (!$k_kunino{$k_kousen_aite_k{$ek_id}[8]} or $k_kokka_keitai{$k_kousen_aite_k{$ek_id}[8]})){
		$k_kousen_aite_k{$ek_id}[8] = $k_kunino{$fk_id};
									$ttid = "klog/$k_kunino{$ek_id}";
									&PRLOG("\[$old_date\]$cauntacome");
								}elsif($k_kunino{$fk_id} ne "$k_kousen_aite_k{$ek_id}[9]" and (!$k_kunino{$k_kousen_aite_k{$ek_id}[9]} or $k_kokka_keitai{$k_kousen_aite_k{$ek_id}[9]})){
		$k_kousen_aite_k{$ek_id}[9] = $k_kunino{$fk_id};
									$ttid = "klog/$k_kunino{$ek_id}";
									&PRLOG("\[$old_date\]$cauntacome");
								}

							$add_f=$fk_id;
							$add_e=$ek_id;
							$fk_id=$add_e;
							$ek_id=$add_f;

							$add_kousen_hit=0;
	$k_kousen_aite_name{$fk_id} = "";
		$k_name_d[0] = "";
	foreach(@{$k_kousen_aite_k{$fk_id}}){
							$add_no=int($_);
							$add_no=$k_kunino{$add_no};
		if($add_no){
	$k_kousen_aite_name{$fk_id} .= "『$k_p_k_a{$add_no}』";
		}
							$add_kousen_hit+=$add_no;
	}
		$k_name_d[0] = "無所属";

		if($add_kousen_hit < 1){
			$k_kousen_aite_name{$fk_id} = "無し";
		}
						if($k_kokusaku{$k_kunino{$fk_id}} eq "10"){
	$k_kousen_aite_name{$fk_id} = "全ての国";
						}

							}elsif($k_kunino{$fk_id} eq $k_kunino{$ek_id}){
							&M2AP_LOG("なんかエラーが出てますよ。ほうちしているとたいへんきけんです。右記のコードのバグ報告お願いします。えらーこーど$cd_id,$cd_no,$cd_name,$cd_op1,$cd_op2,$cd_op3。");
							}
							$fk_id=$add_f;
							$ek_id=$add_e;

}

########
sub ITEM_IN {

		if(!$add_item_open{$f_id}){
	open(IN,"./p_db/it/$f_id.cgi");
	@{"add_item_list$f_id"} = <IN>;
	close(IN);
		$add_item_open{$f_id} = 1;
		}

$ocent = 0;
		if ($ocnid) {
$ocent = int($ococent);
		}

	push(@{"add_item_list$f_id"},"$kitw<>$tt<>$ocent<>\n");
		$add_item_lsousa{$f_id} = 1;
}

########
sub R_JYUNSATU
{
		if ($k_kunino{$fk_id}) {
&JYUNSATU;
		}else{
&NURUPO;
		}
}
########
sub JYUNSATU
{
							$ft_id = $p_taizai_iti{$f_id};
$bi = "";
									

							$jff = int(rand(50));

		$kfsf = 0;
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
	open(IN,"./p_db/co/$f_id.cgi");
	@F_LOG2K = <IN>;
	close(IN);
	($hnof,$khy) = split(/<>/,$F_LOG2K[0]);
	($hnof,$khc) = split(/<>/,$F_LOG2K[1]);
	($hnof,$khi) = split(/<>/,$F_LOG2K[2]);
	($hnof,$kh1) = split(/<>/,$F_LOG2K[3]);
	($hnof,$kh2) = split(/<>/,$F_LOG2K[4]);
	($hnof,$kh3) = split(/<>/,$F_LOG2K[5]);
	($hnof,$kyj) = split(/<>/,$F_LOG2K[6]);
	($hnof,$ksj) = split(/<>/,$F_LOG2K[7]);
	($hnof,$kgj) = split(/<>/,$F_LOG2K[8]);
	($hnof,$ktr) = split(/<>/,$F_LOG2K[9]);
	($hnof,$kmg) = split(/<>/,$F_LOG2K[10]);
	($hnof,$ksk) = split(/<>/,$F_LOG2K[11]);
	($kf12,$ksn1) = split(/<>/,$F_LOG2K[12]);
	($kf13,$ksn2) = split(/<>/,$F_LOG2K[13]);
	($kf14,$ksn3) = split(/<>/,$F_LOG2K[14]);
	($kf15,$ksn4) = split(/<>/,$F_LOG2K[15]);
	($kf16,$ksnp) = split(/<>/,$F_LOG2K[16]);
	($hnof,$khk) = split(/<>/,$F_LOG2K[17]);

	if(!$p_kunizokusei{$f_id} or !$k_kunino{$p_kunino{$f_id}}){
			if($jfl>159 or ($jfl>129 and $jfs>129)){
			$p_ex_tousotu{$f_id}++;
						if($jff<25){
							$zsigotoadd = int( ($p_tousotu{$f_id}-(0.5 * ($tousotuno1 - 100))) /30 + rand( $p_tousotu{$f_id} - (0.5 * ($tousotuno1 - 100)) ) / 20 + rand(4));
						if($zsigotoadd < 3){
							$zsigotoadd = 3;
						}
							$t_tian_ti{$ft_id} += $zsigotoadd;
							$zsigotoaddp = int($zsigotoadd*$t_tian_ti{$ft_id}/100)* 50;
							$t_ryoumin_suu{$ft_id} += $zsigotoaddp;
							if($t_tian_ti{$ft_id} > 100){
								$t_tian_ti{$ft_id} = 100;
							}else{
							$p_ex_tousotu{$f_id}+= int(rand(3));
							}
							$p_ex_tousotu{$f_id}+= int(rand(2));
$p_ex_karumalc{$f_id} += 0;
$p_ex_karumald{$f_id} += 1;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【指揮官型/巡察】：街を見回りました。$p_name{$f_id}の姿を見て民は喜んでいるようです。$t_name{$ft_id}の治安が$zsigotoadd上がり人口が$zsigotoaddp増えました。");
						}elsif($jff<34){
							$zsigotoadd = 3 + int(rand(3));
							$t_gijyutu_ti{$ft_id} += $zsigotoadd;
							if($t_gijyutu_ti{$ft_id} > $t_gijyutu_max{$ft_id}){
							$t_gijyutu_ti{$ft_id} -= $zsigotoadd;
							$zsigotoadd = $zsigotoadd * 5;
							$p_syoji_kin{$f_id} += $zsigotoadd;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【指揮官型/巡察】：軍備強化のため兵器工房で働きました。謝礼として考工令より金$zsigotoaddを受け取りました。");
							}else{
							$p_ex_tousotu{$f_id}+= int(rand(2));
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【指揮官型/巡察】：軍備強化のため兵器工房で働きました。$t_name{$ft_id}の技術が$zsigotoadd上がりました。");

							}

						}elsif($jff<43){
							$zsigotoadd = 3 + int(rand(3));
							$t_syougyou_ti{$ft_id} += $zsigotoadd;
							if($t_syougyou_ti{$ft_id} > $t_syougyou_max{$ft_id}){
							$t_syougyou_ti{$ft_id} -= $zsigotoadd;
							$zsigotoadd = $zsigotoadd * 5;
							$p_syoji_kin{$f_id} += $zsigotoadd;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【指揮官型/巡察】：街の発展のため道を整備しました。謝礼として商人より金$zsigotoaddを受け取りました。");
							}else{
							$p_ex_tousotu{$f_id}+= int(rand(2));
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【指揮官型/巡察】：街の発展のため道を整備しました。$t_name{$ft_id}の商業が$zsigotoadd上がりました。");
							}
						}elsif($jff>=43){
							$p_ex_tousotu{$f_id}+= int(rand(5));
							$zsigotoadd = int( ($p_tousotu{$f_id}-(0.5 * ($tousotuno1 - 100))) /30 + rand( $p_tousotu{$f_id}-(0.5 * ($tousotuno1 - 100)) ) / 20 + rand(4)) * 100;
						if($zsigotoadd < 150){
							$zsigotoadd = 150;
						}
							$p_syoji_kome{$f_id} += $zsigotoadd;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【指揮官型/巡察】：街を見回りました。民から貢物として米$zsigotoaddを受け取りました。");
									if(1 > int(rand(20))){
							$kitw = int(rand(10));
							$kitw = "8$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の民から貢物として<span class=\"cFF0000\">$gitem[$kitw]</span>を貰い受ける。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:よく見ると、貢物の中に<span class=\"cFF0000\">$gitem[$kitw]</span>が入っていました。");
									}
						}
			}elsif($jfs>159 or ($jfi>129 and $jfs>129)){
			$p_ex_buryoku{$f_id}++;
						if($jff<10){
							$zsigotoadd = 3 + int(rand(3));
							$t_gijyutu_ti{$ft_id} += $zsigotoadd;
							if($t_gijyutu_ti{$ft_id} > $t_gijyutu_max{$ft_id}){
							$t_gijyutu_ti{$ft_id} -= $zsigotoadd;
							$zsigotoadd = $zsigotoadd * 5;
							$p_syoji_kin{$f_id} += $zsigotoadd;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【武官型/巡察】：軍備強化のため兵器工房で働きました。謝礼として考工令より金$zsigotoaddを受け取りました。");
							}else{
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【武官型/巡察】：軍備強化のため兵器工房で働きました。$t_name{$ft_id}の技術が$zsigotoadd上がりました。");
							$p_ex_buryoku{$f_id}+= int(rand(2));
							}

						}elsif($jff<20){
							$zsigotoadd = 3 + int(rand(3));
							$t_nougyou_ti{$ft_id} += $zsigotoadd;
							if($t_nougyou_ti{$ft_id} > $t_nougyou_max{$ft_id}){
							$t_nougyou_ti{$ft_id} -= $zsigotoadd;
							$zsigotoadd = $zsigotoadd * 5;
							$p_syoji_kome{$f_id} += $zsigotoadd;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【武官型/巡察】：民と共に畑を耕しました。謝礼として領民より米$zsigotoaddを受け取りました。");
							}else{
							$p_ex_buryoku{$f_id}+= int(rand(2));
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【武官型/巡察】：民と共に畑を耕しました。$t_name{$ft_id}の農業が$zsigotoadd上がりました。");
							}
						}elsif($jff<35 and $p_heisyu{$f_id} ne "9" and $t_tian_ti{$ft_id} <100){$khcc = "";
							$zsigotoaddp = 1 + int(rand(3));
							$t_tian_ti{$ft_id} += $zsigotoaddp;
							if($t_tian_ti{$ft_id} > 100){
								$t_tian_ti{$ft_id} = 100;
							}else{
							$p_ex_buryoku{$f_id}+= int(rand(2));
								if($jff>24){
							$zsigotoadd = int( ($p_buryoku{$f_id}-(0.5 * ($tousotuno1 - 100))) /30 + rand($p_buryoku{$f_id}-(0.5 * ($tousotuno1 - 100)) ) / 20 + rand(4)) * 100;
						if($zsigotoadd < 150){
							$zsigotoadd = 150;
						}
							$p_syoji_kin{$f_id} += $zsigotoadd;
$p_ex_karumalc{$f_id} += 1;
$p_ex_karumald{$f_id} += 0;
								$khcc = "<br />賊は金を蓄えていました！ $p_name{$f_id}は賊から金$zsigotoaddを巻き上げました！！";
								}
							}
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【武官型/巡察】：街の衛兵を率いて近隣に出没する山賊を退治しました。$t_name{$ft_id}の治安が$zsigotoaddp上がりました。$khcc");
						}else{

#_/_/_/_/_/連戦拡張_/_/_/_/_/_/_/#

######################
										$add_i_id = $f_id;
							$bpi_name{$add_i_id}[2] = "";
										if($p_migite{$add_i_id}%1000){
							$bpi_name{$add_i_id}[0] = $item_name{$p_migite{$add_i_id}};
							$bpi_dmg{$add_i_id}[0] = $item_seinou{$p_migite{$add_i_id}};
							$bpi_dmg{$add_i_id}[0] += $p_migite_lv{$add_i_id};

							$bpi_name{$add_i_id}[2] .= $item_name{$p_migite{$add_i_id}};
							$bpi_dmg{$add_i_id}[2] = int($item_seinou{$p_migite{$add_i_id}}*0.6);
							$bpi_dmg{$add_i_id}[2] += $p_migite_lv{$add_i_id};
										}else{
							$bpi_name{$add_i_id}[0] = $item_name{$p_hidarite{$add_i_id}};
							$bpi_dmg{$add_i_id}[0] = int($item_seinou{$p_hidarite{$add_i_id}}*0.5);
							$bpi_dmg{$add_i_id}[0] += $p_hidarite_lv{$add_i_id};

							$bpi_dmg{$add_i_id}[2] = int($item_seinou{$p_hidarite{$add_i_id}}*0.4*$item_2hf{$p_hidarite{$add_i_id}});
							$bpi_dmg{$add_i_id}[2] += $p_hidarite_lv{$add_i_id};
										}
										if($p_hidarite{$add_i_id}%1000){
							$bpi_name{$add_i_id}[1] = $item_name{$p_hidarite{$add_i_id}};
							$bpi_dmg{$add_i_id}[1] = $item_seinou{$p_hidarite{$add_i_id}};
							$bpi_dmg{$add_i_id}[1] += $p_hidarite_lv{$add_i_id};

										if($p_hidarite{$add_i_id}%1000){
							$bpi_name{$add_i_id}[2] .= '＆';
										}
							$bpi_name{$add_i_id}[2] .= $item_name{$p_hidarite{$add_i_id}};
							$bpi_dmg{$add_i_id}[2] += int($item_seinou{$p_hidarite{$add_i_id}}*0.6);
							$bpi_dmg{$add_i_id}[2] += $p_hidarite_lv{$add_i_id};
										}else{
							$bpi_name{$add_i_id}[1] = $item_name{$p_migite{$add_i_id}};
							$bpi_dmg{$add_i_id}[1] = int($item_seinou{$p_migite{$add_i_id}}*0.5);
							$bpi_dmg{$add_i_id}[1] += $p_migite_lv{$add_i_id};

							$bpi_dmg{$add_i_id}[2] += int($item_seinou{$p_migite{$add_i_id}}*0.4*$item_2hf{$p_migite{$add_i_id}});
							$bpi_dmg{$add_i_id}[2] += $p_migite_lv{$add_i_id};
										}
##############################

							$jffit = int(rand(50));
							$e_id = 0;

						if($jffit<20){$p_name{$e_id} = "ツキノワグマ";$add_9 = "熊";$p_buryoku{$e_id} = 100 + int(0.70 * ($buryokuno1 - 100)) - 20 + int(rand(10));$item_name{$p_migite{$e_id}} = "巨大な爪";
$add_10 = "$item_name{$p_migite{$e_id}}を天高く振りかざし$p_name{$f_id}に向かって振り下ろす！！";
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【武官型/巡察】：街を見回りました。$t_name{$ft_id}の民は山に出没する熊に困り果てているようです。話を聞いた$p_name{$f_id}は腕試しも兼ねて熊退治に出かけました。");
								$ikc = "ガルル・・";$eexi = 2;
						if($jffit<10){$p_name{$e_id} = "ヒグマ";
						}
						if($jffit<1 and $tuki_genzai eq "1"){$p_name{$e_id} = "大熊猫";$item_name{$p_migite{$e_id}} = "ムクムクお手て";
$add_10 = "$item_name{$p_migite{$e_id}}を天高く振りかざし$p_name{$f_id}に向かって振り下ろす！！";
$p_buryoku{$e_id} = 100 + int(0.99 * ($buryokuno1 - 100)) + 75 + int(rand(10));
						}
							if($p_buryoku{$f_id} - 50 > $p_buryoku{$e_id}){$p_buryoku{$e_id} = $p_buryoku{$f_id} - 50;
							}
						}elsif($jffit<35){$p_name{$e_id} = "猛虎";$add_9 = "虎";$p_buryoku{$e_id} = 100 + int(0.75 * ($buryokuno1 - 100)) - 1 + int(rand(10));$item_name{$p_migite{$e_id}} = "鋭い爪";
$add_10 = "$item_name{$p_migite{$e_id}}を天高く振りかざし$p_name{$f_id}に向かって振り下ろす！！";
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【武官型/巡察】：街を見回りました。$t_name{$ft_id}の民は山に出没する虎に困り果てているようです。話を聞いた$p_name{$f_id}は腕試しも兼ねて虎狩りに出かけました。");
								$ikc = "グルル・・";$eexi = 3;
							if($p_buryoku{$f_id} - 40 > $p_buryoku{$e_id}){$p_buryoku{$e_id} = $p_buryoku{$f_id} - 40;
							}
						if($jffit<25){$p_name{$e_id} = "大虎";$p_buryoku{$e_id} -= 5;
						}elsif($jffit<28){$p_name{$e_id} = "老虎";$p_buryoku{$e_id} -= 15;
						}
						}elsif($jffit<45 and $tuki_genzai > 6 and $tuki_genzai < 10){$p_name{$e_id} = "白虎";$add_9 = "虎";$p_buryoku{$e_id} = 100 + int(0.9 * ($buryokuno1 - 100)) + 75 + int(rand(10));$item_name{$p_migite{$e_id}} = "白銀の爪";
$add_10 = "$item_name{$p_migite{$e_id}}を天高く振りかざし$p_name{$f_id}に向かって振り下ろす！！";
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【武官型/巡察】：街を見回りました。$t_name{$ft_id}の民は山に出没する虎に困り果てているようです。話を聞いた$p_name{$f_id}は腕試しも兼ねて虎狩りに出かけました。");
								$ikc = "ガルル・・";$eexi = 7;
							if($p_buryoku{$f_id} - 15 > $p_buryoku{$e_id}){$p_buryoku{$e_id} = $p_buryoku{$f_id} - 15;
							}
						}elsif($jffit<50){$p_name{$e_id} = "大蛇";$add_9 = "大蛇";$p_buryoku{$e_id} = 100 + int(0.65 * ($buryokuno1 - 100)) - 40 + int(rand(10));$item_name{$p_migite{$e_id}} = "毒の牙";
$add_10 = "巨大な鎌首を持ち上げて$p_name{$f_id}に襲い掛かる！！";
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【武官型/巡察】：街を見回りました。$t_name{$ft_id}の民は山に出没する大蛇に困り果てているようです。話を聞いた$p_name{$f_id}は腕試しも兼ねて大蛇狩りに出かけました。");
								$ikc = "シャー・・";$eexi = 1;
							if($p_buryoku{$f_id} - 70 > $p_buryoku{$e_id}){$p_buryoku{$e_id} = $p_buryoku{$f_id} - 70;
							}
						}
										

											$ikuhit=0;
											$ikuhitkh=0;
										$ikur = int(rand(5));
										$add_11 = $p_buryoku{$f_id}+200;
										$ikus = $add_11-$p_buryoku{$e_id};

										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$count</span>:とある山の奥深く・・$p_name{$f_id}（武力$p_buryoku{$f_id}）は$p_name{$e_id}（武力？）と鉢合わせて一騎討ちへと突入した！！");

										if($p_busyou_hp{$f_id} < $p_tairyoku{$f_id}){
								$p_busyou_hp{$f_id} = int($p_tairyoku{$f_id}-(($p_tairyoku{$f_id} - $p_busyou_hp{$f_id})/4));
										}
										$add_11hp = $p_busyou_hp{$f_id};
										$add_12hp = 100;

										$ikut = 0;
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">開始！！</span>:$p_name{$f_id}（武力$p_buryoku{$f_id}）HP：$add_11hp● VS ●HP：$add_12hp（武力$p_buryoku{$e_id}）$p_name{$e_id}");

										$add_11d = int(rand($ikus/10))+ int($ikus/10);
										$add_12d = int(rand((400-$ikus)/10))+ int((400-$ikus)/10);

										$ikurh = int(rand(5));$kwwname = "";



									if($ikurh == 0){
										$add_i_hit = int(rand(3));
										$add_11d += int(rand($bpi_dmg{$f_id}[$add_i_hit]+10));
									if($add_11d > 60){$add_11d = 100;$kwwname = "<br />あまりの速さに$p_name{$e_id}は$bpi_name{$f_id}[$add_i_hit]を避けきれない！！$p_name{$e_id}は一撃の下に斬り倒された！！";}

										$khcc1= "$p_name{$f_id}は初撃から必殺技を繰り出した！！";
										if($kh1 ne ""){$khcc1= "$kh1";
										}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$khcc1</span>:$p_name{$f_id}の渾身の一撃！！<br />$bpi_name{$f_id}[$add_i_hit]を天高く振りかざし$p_name{$e_id}に向かって振り下ろす！！$kwwname");
									}elsif($ikurh == 1){
										$add_12d += int(rand($item_seinou{$p_migite{$e_id}}+10));
									if($add_12d > 60){$add_12d = 100;$kwwname = "<br />あまりの速さに$p_name{$f_id}は$item_name{$p_migite{$e_id}}を避けきれない！！$p_name{$f_id}は一撃の下になぎ倒された！！";}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$e_id}は初撃から必殺技を繰り出した！！</span>:$p_name{$e_id}の渾身の一撃！！$add_10$kwwname");
									}elsif($ikurh == 2){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">壱合目！！</span>:$p_name{$f_id}は三連撃を繰り出していく。<br />一方の$p_name{$e_id}はそれを紙一重でかわしつつカウンターを仕掛ける！！");
									}elsif($ikurh == 3){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">壱合目！！</span>:$p_name{$e_id}は素早い動きで$p_name{$f_id}の背後へと回り込む<br />。一方の$p_name{$f_id}は背中でそれをやり過ごし振り向きざまにカウンターの一撃を叩き込む！！");
									}elsif($ikurh == 4){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">壱合目！！</span>:$p_name{$f_id}と$p_name{$e_id}は真っ向から対峙しほぼ同時に必殺の一撃を解き放つ！！");
										}

									if($add_12d <= 0){$add_12d = 1;
									}
									if($add_11d <= 0){$add_11d = 1;
									}
										$add_11hp -= $add_12d;
										$add_12hp -= $add_11d;
									if($add_12hp <= 0 and $add_11hp <= 0){$add_12hp = 1;$add_11hp = 1;
									}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">壱合目！！</span>:$p_name{$f_id}（武力$p_buryoku{$f_id}）HP：$add_11hp● VS ●HP：$add_12hp（武力$p_buryoku{$e_id}）$p_name{$e_id}");

									if($add_12hp <= 0){
											$ikuhit=1;
											$ikuhitkh=1;
										$p_ex_buryoku{$f_id} += $eexi+2;
							$ryoumin_add2 = $eexi * 100+300;
							$t_ryoumin_suu{$ft_id} += $ryoumin_add2;
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}を討ち取った！！</span>:$khi<br />$add_9退治の評判は隣国まで知れ渡り$t_name{$ft_id}の人口が$ryoumin_add2増えました！！");
									if($p_name{$e_id} eq "白虎"){
									if($p_pet_type{$f_id}[0] ne "1"){
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の山にて一閃の下に白虎をなぎ倒す。 使用武器:$item_name{$p_migite{$f_id}} 以後、神獣：白虎を従えるようになる。");
										$w_id=$f_id;&P_LOG_W("$p_name{$e_id}は仲間になりたそうな目でこちらを見つめています。<br />$p_name{$f_id}は白虎を従えた。$p_name{$f_id}の部隊に神獣：白虎が加わりました！！！");
$p_pet_type{$f_id}[0] = 1;
$p_pet_name{$f_id}[0] = $jyuu[$p_pet_type{$f_id}[0]];
									}else{
							$kitw = int(rand(2))+1;
							$kitw = "7$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の山にて白虎をなぎ倒し<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:戦利品として<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の山にて一閃の下に白虎をなぎ倒す。 使用武器:$item_name{$p_migite{$f_id}}");
									}
											&M2AP_LOG("<span class=\"c0000FF\">【白虎退治】</span>$p_p_b_a{$f_id}は一閃の下に$p_name{$e_id}を討ち取りました！ 使用武器:$item_name{$p_migite{$f_id}}");
									}elsif($add_9 eq "熊"){
	if(1 > int(rand(25))){
							$kitw = int(rand(2))+3;
							$kitw = "7$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の山にて$p_name{$e_id}を一撃の下になぎ倒し<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:戦利品として<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
	}
									}elsif($add_9 eq "大蛇"){
	if(1 > int(rand(50))){
							$kitw = int(rand(2))+5;
							$kitw = "7$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の山にて$p_name{$e_id}を一撃の下になぎ倒し<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:戦利品として<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
	}
									}elsif(1 > int(rand(20))){
							$kitw = int(rand(1));
							$kitw = "7$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の山にて$p_name{$e_id}を一撃の下になぎ倒し<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:戦利品として<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
									}
									}elsif($add_11hp <= 0){
											$ikuhit=1;
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}になぎ倒された。。</span>:$p_name{$f_id}は命からがら山から逃げ帰った。");
										}



									if($ikuhit < 1){

										$add_11d = int(rand($ikus/10))+ int($ikus/10);
										$add_12d = int(rand((400-$ikus)/10))+ int((400-$ikus)/10);

										$ikurh = int(rand(5));

									if($ikurh == 0){
										$add_i_hit = int(rand(3));
										$add_11d += int(rand($bpi_dmg{$f_id}[$add_i_hit]+10));
										$khcc1= "この一撃で決めてやる！！";
										if($kh2 ne ""){$khcc1= "$kh2";
										}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$khcc1</span>:$p_name{$f_id}の渾身の一撃！！<br />$bpi_name{$f_id}[$add_i_hit]が風を斬り裂き$p_name{$e_id}の喉笛めがけて襲い掛かる！！");
									}elsif($ikurh == 1){
										$add_12d += int(rand($item_seinou{$p_migite{$e_id}}+10));
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$ikc</span>:$p_name{$e_id}の渾身の一撃！！$item_name{$p_migite{$e_id}}が風を斬り裂き$p_name{$f_id}の喉笛めがけて襲い掛かる！！");
									}elsif($ikurh == 2){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">弐合目！！</span>:$p_name{$f_id}は三連撃を繰り出していく。<br />一方の$p_name{$e_id}はそれを紙一重でかわしつつカウンターを仕掛ける！！");
									}elsif($ikurh == 3){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">弐合目！！</span>:$p_name{$e_id}は素早い動きで$p_name{$f_id}の背後へと回り込む。<br />一方の$p_name{$f_id}は背中でそれをやり過ごし振り向きざまにカウンターの一撃を叩き込む！！");
									}elsif($ikurh == 4){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">弐合目！！</span>:$p_name{$f_id}と$p_name{$e_id}は真っ向から対峙しほぼ同時に必殺の一撃を解き放つ！！");
										}

									if($add_12d <= 0){$add_12d = 1;
									}
									if($add_11d <= 0){$add_11d = 1;
									}
										$add_11hp -= $add_12d;
										$add_12hp -= $add_11d;
									if($add_12hp <= 0 and $add_11hp <= 0){$add_12hp = 1;$add_11hp = 1;
									}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">弐合目！！</span>:$p_name{$f_id}（武力$p_buryoku{$f_id}）HP：$add_11hp● VS ●HP：$add_12hp（武力$p_buryoku{$e_id}）$p_name{$e_id}");

									if($add_12hp <= 0){
											$ikuhit=1;
											$ikuhitkh=1;
										$p_ex_buryoku{$f_id} += $eexi+1;
							$ryoumin_add2 = $eexi * 100+150;
							$t_ryoumin_suu{$ft_id} += $ryoumin_add2;
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}を討ち取った！！</span>:$khi<br />$add_9退治の評判は隣国まで知れ渡り$t_name{$ft_id}の人口が$ryoumin_add2増えました！！");
									if($p_name{$e_id} eq "白虎"){
									if($p_pet_type{$f_id}[0] ne "1"){
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の山にて白虎をなぎ倒す。 使用武器:$bpi_name{$f_id}[$add_i_hit] 以後、神獣：白虎を従えるようになる。");
										$w_id=$f_id;&P_LOG_W("$p_name{$e_id}は仲間になりたそうな目でこちらを見つめています。<br />$p_name{$f_id}は白虎を従えた。$p_name{$f_id}の部隊に神獣：白虎が加わりました！！！");
$p_pet_type{$f_id}[0] = 1;
$p_pet_name{$f_id}[0] = $jyuu[$p_pet_type{$f_id}[0]];
									}elsif(1 > int(rand(3))){
							$kitw = int(rand(2))+1;
							$kitw = "7$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の山にて白虎をなぎ倒し<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:戦利品として<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
									}else{
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の山にて白虎をなぎ倒しました。");
									}
											&M2AP_LOG("<span class=\"c0000FF\">【白虎退治】</span>$p_p_b_a{$f_id}は圧倒的な力を持って$p_name{$e_id}を討ち取りました！");
									}
									}elsif($add_11hp <= 0){
											$ikuhit=1;
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}になぎ倒された。。</span>:$p_name{$f_id}は命からがら山から逃げ帰った。");
										}
										}


									if($ikuhit < 1){

										$add_11d = int(rand($ikus/10))+ int($ikus/10);
										$add_12d = int(rand((400-$ikus)/10))+ int((400-$ikus)/10);

										$ikurh = int(rand(5));

									if($ikurh == 0){
										$add_i_hit = int(rand(3));
										$add_11d += int(rand($bpi_dmg{$f_id}[$add_i_hit]+10));
										$khcc1= "これで・・終わりだ！！";
										if($kh3 ne ""){$khcc1= "$kh3";
										}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$khcc1</span>:$p_name{$f_id}の渾身の一撃！！<br />$bpi_name{$f_id}[$add_i_hit]が風を斬り裂き$p_name{$e_id}の喉笛めがけて襲い掛かる！！");
									if($p_syomotu{$f_id} eq "2013"){
										$add_i_hit = int(rand(3));
										$add_11d += int(rand($bpi_dmg{$f_id}[$add_i_hit]+10));
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">相手が悪かったな・・</span>:$p_name{$f_id}の二の太刀！！$bpi_name{$f_id}[$add_i_hit]が$p_name{$e_id}のわき腹を軽く貫く！！");
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">さらばだ！！</span>:$p_name{$f_id}の三の太刀！！$bpi_name{$f_id}[$add_i_hit]が容赦なく$p_name{$e_id}の体を斬り刻む！！");
									}

									}elsif($ikurh == 1){
										$add_12d += int(rand($item_seinou{$p_migite{$e_id}}+10));
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$ikc</span>:$p_name{$e_id}の渾身の一撃！！$item_name{$p_migite{$e_id}}が風を斬り裂き$p_name{$f_id}の喉笛めがけて襲い掛かる！！");
									}elsif($ikurh == 2){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">参合目！！</span>:$p_name{$f_id}は三連撃を繰り出していく。<br />一方の$p_name{$e_id}はそれを紙一重でかわしつつカウンターを仕掛ける！！");
									}elsif($ikurh == 3){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">参合目！！</span>:$p_name{$e_id}は素早い動きで$p_name{$f_id}の背後へと回り込む。<br />一方の$p_name{$f_id}は背中でそれをやり過ごし振り向きざまにカウンターの一撃を叩き込む！！");
									}elsif($ikurh == 4){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">参合目！！</span>:$p_name{$f_id}と$p_name{$e_id}は真っ向から対峙しほぼ同時に必殺の一撃を解き放つ！！");
										}

									if($add_12d <= 0){$add_12d = 1;
									}
									if($add_11d <= 0){$add_11d = 1;
									}

										$add_11hp -= $add_12d;
										$add_12hp -= $add_11d;
									if($add_12hp <= 0 and $add_11hp <= 0){$add_12hp = 1;$add_11hp = 1;
									}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">参合目！！</span>:$p_name{$f_id}（武力$p_buryoku{$f_id}）HP：$add_11hp● VS ●HP：$add_12hp（武力$p_buryoku{$e_id}）$p_name{$e_id}");

									if($add_12hp <= 0){
											$ikuhit=1;
										$p_ex_buryoku{$f_id} += $eexi;
							$ryoumin_add2 = $eexi * 100+50;
							$t_ryoumin_suu{$ft_id} += $ryoumin_add2;
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}を討ち取った！！</span>:$khi<br />$add_9退治の評判は隣国まで知れ渡り$t_name{$ft_id}の人口が$ryoumin_add2増えました！！");
									if($p_name{$e_id} eq "白虎"){
									if($p_pet_type{$f_id}[0] ne "1"){
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の山にて激闘の末、白虎をなぎ倒す。 使用武器:$bpi_name{$f_id}[$add_i_hit] 以後、神獣：白虎を従えるようになる。");
										$w_id=$f_id;&P_LOG_W("$p_name{$e_id}は仲間になりたそうな目でこちらを見つめています。<br />$p_name{$f_id}は白虎を従えた。$p_name{$f_id}の部隊に神獣：白虎が加わりました！！！");
$p_pet_type{$f_id}[0] = 1;
$p_pet_name{$f_id}[0] = $jyuu[$p_pet_type{$f_id}[0]];
									}elsif(1 > int(rand(7))){
							$kitw = int(rand(2))+1;
							$kitw = "7$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の山にて白虎をなぎ倒し<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:戦利品として<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
									}else{
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の山にて激闘の末、白虎をなぎ倒しました。");
									}
											&M2AP_LOG("<span class=\"c0000FF\">【白虎退治】</span>$p_p_b_a{$f_id}は激闘の末$p_name{$e_id}を討ち取りました！");
									}
									}elsif($add_11hp <= 0){
											$ikuhit=1;
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}になぎ倒された。。</span>:$p_name{$f_id}は命からがら山から逃げ帰った。");
									}else{
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">引き分け</span>:$p_name{$f_id}と$p_name{$e_id}の勝負は決着がつかなかった。。");
										}
										}



						$p_busyou_hp{$f_id} = $add_11hp;
							if($p_busyou_hp{$f_id} < $p_tairyoku{$f_id}){
								if($p_busyou_hp{$f_id} < 1){$p_busyou_hp{$f_id} = 0;
								}
								$p_busyou_hp{$f_id} = int($p_tairyoku{$f_id}-(($p_tairyoku{$f_id} - $p_busyou_hp{$f_id})/4));
							}
#_/_/_/_/_/連戦拡張_/_/_/_/_/_/_/#

									if($ikuhitkh==1){

							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【武官型/巡察】：手早く狩りを済ませて街に戻ってみると今度は吸血姫が出没するという\噂\が流れています。話を聞いた$p_name{$f_id}は\噂\を\頼\りに吸血姫退治に出かけました。");

							$jffit = int(rand(50));


						if($jffit<7){$p_name{$e_id} = "妖文姜";$p_buryoku{$e_id} = 100 + int(0.85 * ($buryokuno1 - 100)) + 15 + int(rand(10));$item_name{$p_migite{$e_id}} = "念動力";
								$ikc = "ふふ・・妾にかなうと思うてか？ 汝、$p_name{$f_id}・・冥府魔道の理に従いて諸王へ捧げる贄となれ！";$eexi = 1;$ikc1 = "左手を天高く振りかざし$p_name{$f_id}に向かって振り下ろす！！途端に悪夢のような衝撃波が$p_name{$f_id}に襲いかかる！！";$ikc2 = "$item_name{$p_migite{$e_id}}が時空をゆがめ$p_name{$f_id}の体を遥か彼方へと弾き飛ばす！！";
						}elsif($jffit<14){$p_name{$e_id} = "妖夏姫";$p_buryoku{$e_id} = 100 + int(0.85 * ($buryokuno1 - 100)) + 10 + int(rand(10));$item_name{$p_migite{$e_id}} = "血塗られた短剣";
								$ikc = "もう終わり・・ですか？ならば塵となりて現世を漂うがようがよい！";$eexi = 1;$ikc1 = "$item_name{$p_migite{$e_id}}を天高く振りかざし$p_name{$f_id}に向かって振り下ろす！！";$ikc2 = "$item_name{$p_migite{$e_id}}が風をひき裂き$p_name{$f_id}の首筋めがけて襲い掛かる！！";
						}elsif($jffit<21){$p_name{$e_id} = "妖哀姜";$p_buryoku{$e_id} = 100 + int(0.85 * ($buryokuno1 - 100)) + 20 + int(rand(10));$item_name{$p_migite{$e_id}} = "念動力";
								$ikc = "さようなら・・もう会うことも無いでしょう・・";$eexi = 1;$ikc1 = "左手を天高く振りかざし$p_name{$f_id}に向かって振り下ろす！！途端に悪夢のような衝撃波が$p_name{$f_id}に襲いかかる！！";$ikc2 = "$item_name{$p_migite{$e_id}}が時空をゆがめ$p_name{$f_id}の体を遥か彼方へと弾き飛ばす！！";
						}elsif($jffit<28){$p_name{$e_id} = "妖驪姫";$p_buryoku{$e_id} = 100 + int(0.85 * ($buryokuno1 - 100)) + 15 + int(rand(10));$item_name{$p_migite{$e_id}} = "念動力";
								$ikc = "私に逆らう者には死の悲劇が訪れる・・・そう、申生のように・・・。遊びの時間は終わりです・・眠りなさい・・永遠に・・";$eexi = 1;$ikc1 = "左手を天高く振りかざし$p_name{$f_id}に向かって振り下ろす！！途端に悪夢のような衝撃波が$p_name{$f_id}に襲いかかる！！";$ikc2 = "$item_name{$p_migite{$e_id}}が時空をゆがめ$p_name{$f_id}の体を遥か彼方へと弾き飛ばす！！";
						}elsif($jffit<35){$p_name{$e_id} = "妖西施";$p_buryoku{$e_id} = 100 + int(0.85 * ($buryokuno1 - 100)) + 15 + int(rand(10));$item_name{$p_migite{$e_id}} = "等身大の大槌";
								$ikc = "やはりこの程度か・・。夫差に比べれば赤子も同然。あの世で己の非力さを悔いるが良い！";$eexi = 1;$ikc1 = "$item_name{$p_migite{$e_id}}を天高く振りかざし$p_name{$f_id}に向かって振り下ろす！！";$ikc2 = "$item_name{$p_migite{$e_id}}が風をひき裂き$p_name{$f_id}の脳天めがけて襲い掛かる！！";
						}elsif($jffit<42){$p_name{$e_id} = "妖褒姒";$p_buryoku{$e_id} = 100 + int(0.85 * ($buryokuno1 - 100)) + 20 + int(rand(10));$item_name{$p_migite{$e_id}} = "念動力";
								$ikc = "私の微笑みは死への誘い。お遊びは終わりです。あの世で己の非力さを悔いなさい・・。";$eexi = 1;$ikc1 = "左手を天高く振りかざし$p_name{$f_id}に向かって振り下ろす！！途端に悪夢のような衝撃波が$p_name{$f_id}に襲いかかる！！";$ikc2 = "妖褒姒が優しく微笑むと、周囲の闇・・深遠なる虚空より無数の刃が生み出され、$p_name{$f_id}の体めがけて襲い掛かる！！";
						}elsif($jffit<50){$p_name{$e_id} = "妖妹喜";$p_buryoku{$e_id} = 100 + int(0.85 * ($buryokuno1 - 100)) + 20 + int(rand(10));$item_name{$p_migite{$e_id}} = "柳葉刀";
								$ikc = "下賎の者が図に乗りおってからに・・貴様如きに梃子摺ったとあらば桀王様に申し訳が立たぬ。<br />遊びは終わりじゃ。妾に眠る真なる力、とくと見るが良い！";$eexi = 1;$ikc1 = "$item_name{$p_migite{$e_id}}を下段に構えると、左に体転しながら右足を一歩進め、$p_name{$f_id}めがけ逆袈裟状に斬り上げる！！";$ikc2 = "$p_name{$e_id}は己の剣に念を込めると、目前の虚空を数回凪ぐ。それより生み出されし無数の剣圧は、漆黒の鎌鼬となりて$p_name{$f_id}の体を縦横無尽に切り刻む！！";
						}

							if($p_buryoku{$f_id} - 25 > $p_buryoku{$e_id}){$p_buryoku{$e_id} = $p_buryoku{$f_id} - 25;
							}
											$ikuhit=0;
											$ikuhitkh=0;
										$ikur = int(rand(5));
										$add_11 = $p_buryoku{$f_id}+200;
										$ikus = $add_11-$p_buryoku{$e_id};

										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$count</span>:とある街角・・$p_name{$f_id}（武力$p_buryoku{$f_id}）は$p_name{$e_id}（武力？）と鉢合わせて一騎討ちへと突入した！！");

										$add_11hp = $p_busyou_hp{$f_id};
										$add_12hp = 100;
										$ikut = 0;
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">開始！！</span>:$p_name{$f_id}（武力$p_buryoku{$f_id}）HP：$add_11hp● VS ●HP：$add_12hp（武力$p_buryoku{$e_id}）$p_name{$e_id}");





										$add_11d = int(rand($ikus/10))+ int($ikus/10);
										$add_12d = int(rand((400-$ikus)/10))+ int((400-$ikus)/10);

										$ikurh = int(rand(5));$kwwname = "";

									if($ikurh == 0){
										$add_i_hit = int(rand(3));
										$add_11d += int(rand($bpi_dmg{$f_id}[$add_i_hit]+10));
									if($add_11d > 60){$add_11d = 100;$kwwname = "<br />あまりの速さに$p_name{$e_id}は$bpi_name{$f_id}[$add_i_hit]を避けきれない！！$p_name{$e_id}は一撃の下に斬り倒された！！";}

										$khcc1= "$p_name{$f_id}は初撃から必殺技を繰り出した！！";
										if($kh1 ne ""){$khcc1= "$kh1";
										}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$khcc1</span>:$p_name{$f_id}の渾身の一撃！！<br />$bpi_name{$f_id}[$add_i_hit]を天高く振りかざし$p_name{$e_id}に向かって振り下ろす！！$kwwname");
									}elsif($ikurh == 1){
										$add_12d += int(rand($item_seinou{$p_migite{$e_id}}+70));
									if($add_12d > 60){$add_12d = 100;$kwwname = "<br />あまりの速さに$p_name{$f_id}は$item_name{$p_migite{$e_id}}を避けきれない！！$p_name{$f_id}は一撃の下になぎ倒された！！";}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$e_id}は初撃から必殺技を繰り出した！！</span>:$p_name{$e_id}の渾身の一撃！！$ikc1 $kwwname");
									}elsif($ikurh == 2){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">壱合目！！</span>:$p_name{$f_id}は三連撃を繰り出していく。<br />一方の$p_name{$e_id}はそれを紙一重でかわしつつカウンターを仕掛ける！！");
									}elsif($ikurh == 3){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">壱合目！！</span>:$p_name{$e_id}は素早い動きで$p_name{$f_id}の背後へと回り込む。<br />一方の$p_name{$f_id}は背中でそれをやり過ごし振り向きざまにカウンターの一撃を叩き込む！！");
									}elsif($ikurh == 4){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">壱合目！！</span>:$p_name{$f_id}と$p_name{$e_id}はほぼ同時に必殺の一撃を解き放つ！！");
										}

									if($add_12d <= 0){$add_12d = 1;
									}
									if($add_11d <= 0){$add_11d = 1;
									}
										$add_11hp -= $add_12d;
										$add_12hp -= $add_11d;
									if($add_12hp <= 0 and $add_11hp <= 0){$add_12hp = 1;$add_11hp = 1;
									}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">壱合目！！</span>:$p_name{$f_id}（武力$p_buryoku{$f_id}）HP：$add_11hp● VS ●HP：$add_12hp（武力$p_buryoku{$e_id}）$p_name{$e_id}");

									if($add_12hp <= 0){
											$ikuhit=1;
											$ikuhitkh=1;
										$p_ex_buryoku{$f_id} += $eexi+2;
									if($p_heisyu{$f_id} ne "93"){
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の街にて一閃の下に吸血姫 $p_name{$e_id}を討ち取る。 使用武器:$bpi_name{$f_id}[$add_i_hit] 以後、吸血姫を従えるようになる。");
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}を討ち取った！！</span>:$khi<br />$p_name{$e_id}は仲間になりたそうな目でこちらを見つめています。<br />$p_name{$f_id}は深く考えずに吸血姫を採用した。。$p_name{$f_id}の部隊は吸血姫部隊になりました！！");
								$p_heisyu{$f_id} = 93;
									}else{

							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の街にて一閃の下に吸血姫 $p_name{$e_id}を討ち取りました。");
									if(1 > int(rand(3))){
							$kitw = int(rand(1))+7;
							$kitw = "7$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の街にて一閃の下に吸血姫 $p_name{$e_id}を討ち取り<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:戦利品として<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
									}
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の街にて一閃の下に吸血姫 $p_name{$e_id}を討ち取る。 使用武器:$bpi_name{$f_id}[$add_i_hit]");
									}
											&M2AP_LOG("<span class=\"c0000FF\">【吸血姫退治】</span>$p_p_b_a{$f_id}は一閃の下に吸血姫 $p_name{$e_id}を討ち取りました！ 使用武器:$bpi_name{$f_id}[$add_i_hit]");

									}elsif($add_11hp <= 0){
											$ikuhit=1;
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}になぎ倒された。。</span>:$p_name{$f_id}は命からがら城へ逃げ帰った。");
										}



									if($ikuhit < 1){

										$add_11d = int(rand($ikus/10))+ int($ikus/10);
										$add_12d = int(rand((400-$ikus)/10))+ int((400-$ikus)/10);

										$ikurh = int(rand(5));

									if($ikurh == 0){
										$add_i_hit = int(rand(3));
										$add_11d += int(rand($bpi_dmg{$f_id}[$add_i_hit]+10));
										$khcc1= "この一撃で決めてやる！！";
										if($kh2 ne ""){$khcc1= "$kh2";
										}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$khcc1</span>:$p_name{$f_id}の渾身の一撃！！<br />$bpi_name{$f_id}[$add_i_hit]が風を斬り裂き$p_name{$e_id}の喉笛めがけて襲い掛かる！！");
									}elsif($ikurh == 1){
										$add_12d += int(rand($item_seinou{$p_migite{$e_id}}+70));
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$ikc</span>:$p_name{$e_id}の渾身の一撃！！$ikc2");
									}elsif($ikurh == 2){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">弐合目！！</span>:$p_name{$f_id}は三連撃を繰り出していく。<br />一方の$p_name{$e_id}はそれを紙一重でかわしつつカウンターを仕掛ける！！");
									}elsif($ikurh == 3){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">弐合目！！</span>:$p_name{$e_id}は素早い動きで$p_name{$f_id}の背後へと回り込む。<br />一方の$p_name{$f_id}は背中でそれをやり過ごし振り向きざまにカウンターの一撃を叩き込む！！");
									}elsif($ikurh == 4){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">弐合目！！</span>:$p_name{$f_id}と$p_name{$e_id}はほぼ同時に必殺の一撃を解き放つ！！");
										}

									if($add_12d <= 0){$add_12d = 1;
									}
									if($add_11d <= 0){$add_11d = 1;
									}
										$add_11hp -= $add_12d;
										$add_12hp -= $add_11d;
									if($add_12hp <= 0 and $add_11hp <= 0){$add_12hp = 1;$add_11hp = 1;
									}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">弐合目！！</span>:$p_name{$f_id}（武力$p_buryoku{$f_id}）HP：$add_11hp● VS ●HP：$add_12hp（武力$p_buryoku{$e_id}）$p_name{$e_id}");

									if($add_12hp <= 0){
											$ikuhit=1;
											$ikuhitkh=1;
										$p_ex_buryoku{$f_id} += $eexi+1;
									if($p_heisyu{$f_id} ne "93"){
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の街にて吸血姫 $p_name{$e_id}を討ち取る。 使用武器:$bpi_name{$f_id}[$add_i_hit] 以後、吸血姫を従えるようになる。");
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}を討ち取った！！</span>:$khi<br />$p_name{$e_id}は仲間になりたそうな目でこちらを見つめています。<br />$p_name{$f_id}は深く考えずに吸血姫を採用した。。$p_name{$f_id}の部隊は吸血姫部隊になりました！！");
								$p_heisyu{$f_id} = 93;
									}else{
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の街にて吸血姫 $p_name{$e_id}を討ち取りました。");
									if(1 > int(rand(7))){
							$kitw = int(rand(1))+7;
							$kitw = "7$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の街にて吸血姫 $p_name{$e_id}を討ち取り<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:戦利品として<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
									}
									}

											&M2AP_LOG("<span class=\"c0000FF\">【吸血姫退治】</span>$p_p_b_a{$f_id}は圧倒的な力を持って吸血姫 $p_name{$e_id}を討ち取りました！");

									}elsif($add_11hp <= 0){
											$ikuhit=1;
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}になぎ倒された。。</span>:$p_name{$f_id}は命からがら城へ逃げ帰った。");
										}
										}


									if($ikuhit < 1){

										$add_11d = int(rand($ikus/10))+ int($ikus/10);
										$add_12d = int(rand((400-$ikus)/10))+ int((400-$ikus)/10);

										$ikurh = int(rand(5));

									if($ikurh == 0){
										$add_i_hit = int(rand(3));
										$add_11d += int(rand($bpi_dmg{$f_id}[$add_i_hit]+10));
										$khcc1= "これで・・終わりだ！！";
										if($kh3 ne ""){$khcc1= "$kh3";
										}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$khcc1</span>:$p_name{$f_id}の渾身の一撃！！<br />$bpi_name{$f_id}[$add_i_hit]が風を斬り裂き$p_name{$e_id}の喉笛めがけて襲い掛かる！！");
									if($p_syomotu{$f_id} eq "2013"){
										$add_i_hit = int(rand(3));
										$add_11d += int(rand($bpi_dmg{$f_id}[$add_i_hit]+10));
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">相手が悪かったな・・</span>:$p_name{$f_id}の二の太刀！！$bpi_name{$f_id}[$add_i_hit]が$p_name{$e_id}のわき腹を軽く貫く！！");
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">さらばだ！！</span>:$p_name{$f_id}の三の太刀！！$bpi_name{$f_id}[$add_i_hit]が容赦なく$p_name{$e_id}の体を斬り刻む！！");
									}

									}elsif($ikurh == 1){
										$add_12d += int(rand($item_seinou{$p_migite{$e_id}}+70));
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$ikc</span>:$p_name{$e_id}の渾身の一撃！！$ikc2");
									}elsif($ikurh == 2){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">参合目！！</span>:$p_name{$f_id}は三連撃を繰り出していく。<br />一方の$p_name{$e_id}はそれを紙一重でかわしつつカウンターを仕掛ける！！");
									}elsif($ikurh == 3){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">参合目！！</span>:$p_name{$e_id}は素早い動きで$p_name{$f_id}の背後へと回り込む。<br />一方の$p_name{$f_id}は背中でそれをやり過ごし振り向きざまにカウンターの一撃を叩き込む！！");
									}elsif($ikurh == 4){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">参合目！！</span>:$p_name{$f_id}と$p_name{$e_id}はほぼ同時に必殺の一撃を解き放つ！！");
										}


									if($add_12d <= 0){$add_12d = 1;
									}
									if($add_11d <= 0){$add_11d = 1;
									}
										$add_11hp -= $add_12d;
										$add_12hp -= $add_11d;
									if($add_12hp <= 0 and $add_11hp <= 0){$add_12hp = 1;$add_11hp = 1;
									}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">参合目！！</span>:$p_name{$f_id}（武力$p_buryoku{$f_id}）HP：$add_11hp● VS ●HP：$add_12hp（武力$p_buryoku{$e_id}）$p_name{$e_id}");

									if($add_12hp <= 0){
											$ikuhit=1;
										$p_ex_buryoku{$f_id} += $eexi;
									if($p_heisyu{$f_id} ne "93"){
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の街にて激闘の末、吸血姫 $p_name{$e_id}を討ち取る。 使用武器:$bpi_name{$f_id}[$add_i_hit] 以後、吸血姫を従えるようになる。");
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}を討ち取った！！</span>:$khi<br />$p_name{$e_id}は仲間になりたそうな目でこちらを見つめています。<br />$p_name{$f_id}は深く考えずに吸血姫を採用した。。$p_name{$f_id}の部隊は吸血姫部隊になりました！！");
								$p_heisyu{$f_id} = 93;
									}else{
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の街にて激闘の末、吸血姫 $p_name{$e_id}を討ち取りました。");
									if(1 > int(rand(15))){
							$kitw = int(rand(1))+7;
							$kitw = "7$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の街にて激闘の末、吸血姫 $p_name{$e_id}を討ち取り<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:戦利品として<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
									}
									}

											&M2AP_LOG("<span class=\"c0000FF\">【吸血姫退治】</span>$p_p_b_a{$f_id}は激闘の末、吸血姫 $p_name{$e_id}を討ち取りました！");

									}elsif($add_11hp <= 0){
											$ikuhit=1;
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}になぎ倒された。。</span>:$p_name{$f_id}は命からがら城へ逃げ帰った。");
									}else{
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">引き分け</span>:$p_name{$f_id}と吸血姫 $p_name{$e_id}の勝負は決着がつかなかった。。");
										}
										}

						$p_busyou_hp{$f_id} = $add_11hp;
							if($p_busyou_hp{$f_id} < $p_tairyoku{$f_id}){
								if($p_busyou_hp{$f_id} < 1){$p_busyou_hp{$f_id} = 0;
								}
								$p_busyou_hp{$f_id} = int($p_tairyoku{$f_id}-(($p_tairyoku{$f_id} - $p_busyou_hp{$f_id})/4));
							}

									}


#_/_/_/_/_/連戦拡張_/_/_/_/_/_/_/#
						}

			}elsif($jfi>159 or ($jfi>129 and $jfl>129)){
							$jffint = int(rand(50));
			$p_ex_tiryoku{$f_id}++;
							$zsigotoadd = int((($p_tiryoku{$f_id}+$add_naisei)/30 + rand($p_tiryoku{$f_id}+$add_naisei) / 20 + rand(4)) * 150 / $p_sougou{$f_id});
						if($jff<10 and $jffint < $zsigotoadd * 3 and $t_siro_bouei_ti{$ft_id} >= $t_siro_bouei_max{$ft_id} and $t_siro_taikyuu_ti{$ft_id} >= $t_siro_taikyuu_max{$ft_id} and $t_gijyutu_ti{$ft_id} >= $t_gijyutu_max{$ft_id}){
										$p_ex_tiryoku{$f_id}+=9;
						$p_kunkou{$f_id} += 40;
								$t_siro_bouei_max{$ft_id} += 100;
								$t_siro_bouei_ti{$ft_id} -= 100;
								$t_siro_taikyuu_ti{$ft_id} -= 99;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の城を改修＆増築する。");
										$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【文官型/巡察】：更なる防衛力強化のため城を改修＆増築しました。$t_name{$ft_id}の防衛力最大値が100上昇しました。");
										&M2AP_LOG("$p_p_b_a{$f_id}は更なる防衛力強化のため城を改修＆増築しました。$t_name{$ft_id}の防衛力最大値が100上昇しました。");
						}elsif($jff<20){
							$zsigotoadd = int( ($p_tousotu{$f_id}-(1.3 * ($keika_nen+1))) /30 + rand( ($p_tousotu{$f_id}-(1.3 * ($keika_nen+1))) ) / 20 + rand(4));
						if($zsigotoadd < 1){
							$zsigotoadd = 1;
						}
							$t_tian_ti{$ft_id} += $zsigotoadd;
							$zsigotoaddp = int($zsigotoadd*$t_tian_ti{$ft_id}/100)* 50;
							$t_ryoumin_suu{$ft_id} += $zsigotoaddp;
							if($t_tian_ti{$ft_id} > 100){
								$t_tian_ti{$ft_id} = 100;
							}else{
							$p_ex_tousotu{$f_id}+= int(rand(2));
							}
							$p_ex_tiryoku{$f_id}+= int(rand(2));
$p_ex_karumalc{$f_id} += 0;
$p_ex_karumald{$f_id} += 1;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【文官型/巡察】：街を見回りました。$p_name{$f_id}の姿を見て民は喜んでいるようです。$t_name{$ft_id}の治安が$zsigotoadd上がり人口が$zsigotoaddp増えました。");
						}elsif($jff<35){
									if($jffint < $zsigotoadd * 3 and $t_syougyou_ti{$ft_id} >= $t_syougyou_max{$ft_id} and $tuki_genzai > 6){
							$add_up = 100;
							$addmaxc = "";
			if($k_kokkyou{$p_kunino{$f_id}} eq "3"){
	if($k_kokkyou_keika_nen{$p_kunino{$f_id}} > 15){
							$addmaxc = "（$KOKKYOU[$k_kokkyou{$p_kunino{$f_id}}]ボーナス）";
							$add_up = 200;
	}
			}
										$p_ex_tiryoku{$f_id}+=7;
						$p_kunkou{$f_id} += 20;
								$t_syougyou_max{$ft_id} += $add_up;
								$t_syougyou_ti{$ft_id} -= $add_up;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}に新しい市場を設置する。");
										$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【文官型/巡察】：更なる商業の発展のため新しい市場を設置しました。$t_name{$ft_id}の商業最大値が$add_up上昇しました。$addmaxc");
										&M2AP_LOG("$p_p_b_a{$f_id}は更なる商業の発展のため新しい市場を設置しました。$t_name{$ft_id}の商業最大値が$add_up上昇しました。$addmaxc");
									}elsif($t_syougyou_ti{$ft_id} < $t_syougyou_max{$ft_id}){
								$bi = "$nen_genzai年$tuki_genzai月:【文官型/巡察】：街を見回りました。街に悪徳商人が蔓延り商人達が困っているようです。$p_name{$f_id}は不正の取締りを始めました。<br />";
										if($jffint < $zsigotoadd * 3){
										$p_ex_tiryoku{$f_id}++;
						$p_kunkou{$f_id} += 10;
								$zsigotoadd = $zsigotoadd * 3 + 20;
								$t_syougyou_ti{$ft_id} += $zsigotoadd;
$p_ex_karumalc{$f_id} += 1;
$p_ex_karumald{$f_id} += 0;
										$w_id=$f_id;&P_LOG_W("$bi悪徳商人の追放に成功し$t_name{$ft_id}の商業が$zsigotoadd上昇しました。");
										}else{
										$w_id=$f_id;&P_LOG_W("$bi相手の方が一枚上手で悪徳商人に雲隠れされてしまいました。");
										}
							if($t_syougyou_ti{$ft_id} > $t_syougyou_max{$ft_id}){
								$t_syougyou_ti{$ft_id} = $t_syougyou_max{$ft_id};
							}
									}else{
						$p_kunkou{$f_id} -= 10;
				$kkcr = int(rand(240));

							if($kkcr > 230){
							$p_ex_tiryoku{$f_id}+= int(rand(10));
								$bi = "<br />どうやら釣り糸に何か引っかかったようです・・・<br />・<br />・<br />・<br />・<br />・<br />・<br />・<br />";
							}
						$p_kunkou{$f_id} -= 10;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【文官型/巡察】：$t_name{$ft_id}の街は平和そのものです。民とともに釣りを楽しみました。");
			if($kkcr > 230 and 1 > int(rand(10))){
							$kitw = int(rand(1));
							$kitw = "6$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]とある水辺にて、<span class=\"cFF0000\">$gitem[$kitw]</span>を釣り上げる。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:釣り竿をそっと引き上げてみると、古ぼけた<span class=\"cFF0000\">$gitem[$kitw]</span>が掛かっていました。");
			}elsif(1 > int(rand(30))){
							$kitw = int(rand(9))+1;
							$kitw = "6$kitw";
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}のとある水辺にて、巨大な<span class=\"cFF0000\">$gitem[$kitw]</span>を釣り上げる。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:とある水辺にて、巨大な<span class=\"cFF0000\">$gitem[$kitw]</span>を釣り上げました。");
			}
									}
						}elsif($jff<50){
									if($jffint < $zsigotoadd * 3 and $t_nougyou_ti{$ft_id} >= $t_nougyou_max{$ft_id} and $tuki_genzai < 7){
							$addmaxc = "";
							$add_up = 100;
			if($k_kokkyou{$p_kunino{$f_id}} eq "3"){
	if($k_kokkyou_keika_nen{$p_kunino{$f_id}} > 5){
							$addmaxc = "（$KOKKYOU[$k_kokkyou{$p_kunino{$f_id}}]ボーナス）";
							$add_up = 200;
	}
			}
										$p_ex_tiryoku{$f_id}+=7;
						$p_kunkou{$f_id} += 20;
								$t_nougyou_max{$ft_id} += $add_up;
								$t_nougyou_ti{$ft_id} -= $add_up;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の農地を拡張する。");
										$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【文官型/巡察】：民の意見を参考に野山を切り開き新しい農地を開拓しました。$t_name{$ft_id}の農業最大値が$add_up上昇しました。$addmaxc");
										&M2AP_LOG("$p_p_b_a{$f_id}は民の意見を参考に野山を切り開き新しい農地を開拓しました。$t_name{$ft_id}の農業最大値が$add_up上昇しました。$addmaxc");
									}elsif($t_nougyou_ti{$ft_id} < $t_nougyou_max{$ft_id}){
								$bi = "$nen_genzai年$tuki_genzai月:【文官型/巡察】：街を見回りました。$t_name{$ft_id}では雨が長いこと降らずに領民達が困っているようです。$p_name{$f_id}は雨乞いの儀式を始めました。<br />";
										if($jffint < $zsigotoadd * 3){
										$p_ex_tiryoku{$f_id} += 1;
						$p_kunkou{$f_id} += 10;
								$zsigotoadd = $zsigotoadd * 3 + 20;
								$t_nougyou_ti{$ft_id} += $zsigotoadd;
$p_ex_karumalc{$f_id} += 0;
$p_ex_karumald{$f_id} += 1;
										$w_id=$f_id;&P_LOG_W("$bi三日三晩祈り続けるとポツリポツリと雨が降りだして農地が潤いました。$t_name{$ft_id}の農業が$zsigotoadd上昇しました。");
									if($p_pet_type{$f_id}[0] ne "3" and $town_get[$p_kunino{$f_id}] == 1 and $t_tian_ti{$ft_id} == 77 - $tuki_genzai and int(rand(3)) < 1){
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の街で青龍の巻物を発見。部隊に神獣：青龍が加わる。");
										$w_id=$f_id;&P_LOG_W("$p_name{$f_id}はとある納屋で青龍の巻物を発見した！！<br />$p_name{$f_id}は青龍を従えることに成功した。$p_name{$f_id}の部隊に神獣：青龍が加わりました！！！");
										&M2AP_LOG("$p_p_b_a{$f_id}は青龍の巻物を発見しました！！");
$p_pet_type{$f_id}[0] = 3;
$p_pet_name{$f_id}[0] = $jyuu[$p_pet_type{$f_id}[0]];
									}
										}else{
										$w_id=$f_id;&P_LOG_W("$bi祈りは天に届かなかったのか雨はいっこうに降る気配がありません。領民達の苦悩はしばらく続きそうです。");
										}
							if($t_nougyou_ti{$ft_id} > $t_nougyou_max{$ft_id}){
								$t_nougyou_ti{$ft_id} = $t_nougyou_max{$ft_id};
							}
									}else{
						$p_kunkou{$f_id} -= 10;
				$kkcr = int(rand(240));

						$p_kunkou{$f_id} -= 10;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【文官型/巡察】：$t_name{$ft_id}の街は平和そのものです。民とともに釣りを楽しみました。");
			if($kkcr > 230 and 1 > int(rand(10))){
							$kitw = int(rand(1));
							$kitw = "6$kitw";
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]とある水辺にて、<span class=\"cFF0000\">$gitem[$kitw]</span>を釣り上げる。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:釣り竿をそっと引き上げてみると、古ぼけた<span class=\"cFF0000\">$gitem[$kitw]</span>が掛かっていました。");
			}elsif(1 > int(rand(30))){
							$kitw = int(rand(9))+1;
							$kitw = "6$kitw";
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}のとある水辺にて、巨大な<span class=\"cFF0000\">$gitem[$kitw]</span>を釣り上げる。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:とある水辺にて、巨大な<span class=\"cFF0000\">$gitem[$kitw]</span>を釣り上げました。");
			}
									}
						}

			}else{
			$p_ex_tousotu{$f_id}++;
						if($jff<15){

			if($jfi>59 and $jfl>59 and $jfs>59 and int(rand(3)) < 1){
							$p_ex_tiryoku{$f_id}+= int(rand(2));
							$p_ex_buryoku{$f_id}+= int(rand(2));
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【万\能型/巡察】：$t_name{$ft_id}の山に篭り、精神統一しました。体中に気力がみなぎり、体力が限界値まで上昇しました。");
							$p_tairyoku{$f_id}=150;
			}elsif($jfi>89 and $jfl>89 and $jfs>89 and int(rand(3)) < 1){
							$p_ex_tiryoku{$f_id}+= int(rand(2));
							$p_ex_buryoku{$f_id}+= int(rand(2));
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【万\能型/巡察】：$t_name{$ft_id}の山に篭り、精神統一しました。体中に気力がみなぎり、体力が限界値まで上昇しました。");
							$p_tairyoku{$f_id}=150;
			}else{
							$zsigotoadd = int( ($p_tousotu{$f_id}-(1.3 * ($keika_nen+1))) /30 + rand( ($p_tousotu{$f_id}-(1.3 * ($keika_nen+1))) ) / 20 + rand(4));
						if($zsigotoadd < 1){
							$zsigotoadd = 1;
						}
							$t_tian_ti{$ft_id} += $zsigotoadd;
							$zsigotoaddp = int($zsigotoadd*$t_tian_ti{$ft_id}/100)* 50;
							$t_ryoumin_suu{$ft_id} += $zsigotoaddp;
							if($t_tian_ti{$ft_id} > 100){
								$t_tian_ti{$ft_id} = 100;
							}else{
							$p_ex_tiryoku{$f_id}+= int(rand(2));
							}
							$p_ex_buryoku{$f_id}+= int(rand(2));
$p_ex_karumalc{$f_id} += 0;
$p_ex_karumald{$f_id} += 1;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【万\能型/巡察】：街を見回りました。$p_name{$f_id}の姿を見て民は喜んでいるようです。$t_name{$ft_id}の治安が$zsigotoadd上がり人口が$zsigotoaddp増えました。");
			}
						}elsif($jff<45 and $p_kunren{$f_id} < $p_tousotu{$f_id} + $p_tiryoku{$f_id} + $p_buryoku{$f_id} and $p_heisisuu{$f_id} > 0){
							$zsigotoadd = 5 + int(rand($p_sougou{$f_id})/7);
							$p_kunren{$f_id} += $zsigotoadd;
							if($p_kunren{$f_id} > $p_tousotu{$f_id} + $p_tiryoku{$f_id} + $p_buryoku{$f_id}){
								$p_kunren{$f_id} = $p_tousotu{$f_id} + $p_tiryoku{$f_id} + $p_buryoku{$f_id};
							}else{
							$p_ex_tiryoku{$f_id}+= int(rand(2));
							$p_ex_buryoku{$f_id}+= int(rand(2));
$p_ex_karumalc{$f_id} += 1;
$p_ex_karumald{$f_id} += 0;
							}
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【万\能型/巡察】：鍛錬を怠けている兵士達に実践的な戦術を指南しました。部隊の訓練度が$zsigotoadd上がりました。");

						}elsif($jff<30){
							$zsigotoadd = 5 + int(rand(5));
							$t_nougyou_ti{$ft_id} += $zsigotoadd;
							if($t_nougyou_ti{$ft_id} > $t_nougyou_max{$ft_id}){
							$t_nougyou_ti{$ft_id} -= $zsigotoadd;
							$zsigotoadd = $zsigotoadd * 5;
							$p_syoji_kome{$f_id} += $zsigotoadd;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【万\能型/巡察】：民と共に畑を耕しました。謝礼として領民より米$zsigotoaddを受け取りました。");
							}else{
							$p_ex_buryoku{$f_id}+= int(rand(2));
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【万\能型/巡察】：民と共に畑を耕しました。$t_name{$ft_id}の農業が$zsigotoadd上がりました。");
							}
						}elsif($jff<45){
							$zsigotoadd = 5 + int(rand(5));
							$t_syougyou_ti{$ft_id} += $zsigotoadd;
							if($t_syougyou_ti{$ft_id} > $t_syougyou_max{$ft_id}){
							$t_syougyou_ti{$ft_id} -= $zsigotoadd;
							$zsigotoadd = $zsigotoadd * 5;
							$p_syoji_kin{$f_id} += $zsigotoadd;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【万\能型/巡察】：街の発展のため道を整備しました。謝礼として商人より金$zsigotoaddを受け取りました。");
							}else{
							$p_ex_tiryoku{$f_id}+= int(rand(2));
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【万\能型/巡察】：街の発展のため道を整備しました。$t_name{$ft_id}の商業が$zsigotoadd上がりました。");
							}
						}elsif($jff>=45){
							$p_ex_tousotu{$f_id}+= int(rand(5));
							$zsigotoadd = int( ($p_tousotu{$f_id}-(1.3 * ($keika_nen+1))) /30 + rand( ($p_tousotu{$f_id}-(1.3 * ($keika_nen+1))) ) / 20 + rand(4)) * 100;
						if($zsigotoadd < 150){
							$zsigotoadd = 150;
						}
							$p_syoji_kome{$f_id} += $zsigotoadd;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【万\能型/巡察】：街を見回りました。民から貢物として米$zsigotoaddを受け取りました。");
									if(1 > int(rand(20))){
							$kitw = int(rand(10));
							$kitw = "8$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の民から貢物として<span class=\"cFF0000\">$gitem[$kitw]</span>を貰い受ける。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:よく見ると、貢物の中に<span class=\"cFF0000\">$gitem[$kitw]</span>が入っていました。");
									}
						}
			}
	}else{
##########便利屋家業

			if($jfl>159 or ($jfl>129 and $jfs>129)){
			$p_ex_tousotu{$f_id}++;
						if($jff<25 and $t_zoku_bouei_ti{$ft_id} < $t_zoku_bouei_max{$ft_id}){
							$zsigotoadd = int( ($p_tousotu{$f_id}-(0.5 * ($tousotuno1 - 100))) /45 + rand( $p_tousotu{$f_id} - (0.5 * ($tousotuno1 - 100)) ) / 30 + rand(2));
						if($zsigotoadd < 1){
							$zsigotoadd = 1;
						}
							$t_tian_ti{$ft_id} -= $zsigotoadd;
							$zsigotoaddp = int($zsigotoadd*(3+int(5)));
							$t_zoku_bouei_ti{$ft_id} += $zsigotoaddp;
							if($t_tian_ti{$ft_id} < 0){
								$t_tian_ti{$ft_id} = 0;
							}else{
							$p_ex_tousotu{$f_id}+= int(rand(2));
							}
							if($t_zoku_bouei_ti{$ft_id} > $t_zoku_bouei_max{$ft_id}){
								$t_zoku_bouei_ti{$ft_id} = $t_zoku_bouei_max{$ft_id};
							}else{
							$p_ex_tousotu{$f_id}+= int(rand(2));
							}
$p_ex_karumalc{$f_id} -= 1;
$p_ex_karumald{$f_id} += 0;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【指揮官型/巡察】：街にて反乱軍を募りました。$p_name{$f_id}の話に聞き入った民が城主に対して疑念を抱き始めた模様です。治安が$zsigotoadd悪化し$t_name{$ft_id}の賊防衛力が$zsigotoaddp上がりました。");
						}elsif($jff<34){
							$zsigotoadd = 3 + int(rand(3));
							$t_tian_ti{$ft_id} += $zsigotoadd;
							if($t_tian_ti{$ft_id} > $t_tian_max{$ft_id}){
							$t_tian_ti{$ft_id} -= $zsigotoadd;
							$zsigotoaddp = $zsigotoadd * 50;
							$p_syoji_kin{$f_id} += $zsigotoaddp;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【指揮官型/巡察】：資金調達のため賭博場の用心棒を請け負いました。謝礼として民より金$zsigotoaddpを受け取りました。");
							}else{
							$zsigotoaddp = $zsigotoadd * 30;
							$p_syoji_kin{$f_id} += $zsigotoaddp;
							$p_ex_tousotu{$f_id}+= int(rand(2));
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【指揮官型/巡察】：商人の用心棒として、傘下の賊を率いて街のごろつきを成敗しました。$t_name{$ft_id}の治安が$zsigotoadd上がり、謝礼として民より金$zsigotoaddpを受け取りました。");

							}

						}elsif($jff<43){
							$zsigotoadd = 1 + int(rand(3));
							$t_tian_ti{$ft_id} -= $zsigotoadd;
							if($t_tian_ti{$ft_id} < 0){
							$t_gijyutu_ti{$ft_id} += $zsigotoadd;
							$zsigotoaddp = $zsigotoadd * 500;
							$p_syoji_kin{$f_id} += $zsigotoaddp;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【指揮官型/巡察】：資金調達のため闇商人の護衛を請け負いました。謝礼として闇商人より金$zsigotoaddpを受け取りました。");
							}else{
							$zsigotoaddp = $zsigotoadd * 100;
							$p_syoji_kin{$f_id} += $zsigotoaddp;
							$p_ex_tousotu{$f_id}+= int(rand(2));
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【武官型/巡察】：資金調達のため賭博場の用心棒を請け負いました。$t_name{$ft_id}の治安が$zsigotoadd悪化し、謝礼として金$zsigotoaddpを受け取りました。");

							}

						}elsif($jff>=43){
							$p_ex_tousotu{$f_id}+= int(rand(5));
							$zsigotoadd = int( ($p_tousotu{$f_id}-(0.5 * ($tousotuno1 - 100))) /30 + rand( $p_tousotu{$f_id}-(0.5 * ($tousotuno1 - 100)) ) / 20 + rand(4)) * 100;
						if($zsigotoadd < 150){
							$zsigotoadd = 150;
						}
							$p_syoji_kome{$f_id} += $zsigotoadd;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【指揮官型/巡察】：街を見回りました。民から貢物として米$zsigotoaddを受け取りました。");
									if(1 > int(rand(20))){
							$kitw = int(rand(10));
							$kitw = "8$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の民から貢物として<span class=\"cFF0000\">$gitem[$kitw]</span>を貰い受ける。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:よく見ると、貢物の中に<span class=\"cFF0000\">$gitem[$kitw]</span>が入っていました。");
									}
						}
			}elsif($jfs>159 or ($jfi>129 and $jfs>129)){
			$p_ex_buryoku{$f_id}++;
						if($jff<10){
							$zsigotoadd = 3 + int(rand(3));
							$t_tian_ti{$ft_id} += $zsigotoadd;
							if($t_tian_ti{$ft_id} > $t_tian_max{$ft_id}){
							$t_tian_ti{$ft_id} -= $zsigotoadd;
							$zsigotoaddp = $zsigotoadd * 50;
							$p_syoji_kin{$f_id} += $zsigotoaddp;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【武官型/巡察】：資金調達のため賭博場の用心棒を請け負いました。謝礼として民より金$zsigotoaddpを受け取りました。");
							}else{
							$zsigotoaddp = $zsigotoadd * 30;
							$p_syoji_kin{$f_id} += $zsigotoaddp;
							$p_ex_buryoku{$f_id}+= int(rand(2));
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【武官型/巡察】：酒場の用心棒として、傘下の賊を率いて街のごろつきを成敗しました。$t_name{$ft_id}の治安が$zsigotoadd上がり、謝礼として民より金$zsigotoaddpを受け取りました。");

							}

						}elsif($jff<20){
							$zsigotoadd = 1 + int(rand(3));
							$t_tian_ti{$ft_id} -= $zsigotoadd;
							if($t_tian_ti{$ft_id} < 0){
							$t_gijyutu_ti{$ft_id} += $zsigotoadd;
							$zsigotoaddp = $zsigotoadd * 500;
							$p_syoji_kin{$f_id} += $zsigotoaddp;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【武官型/巡察】：資金調達のため闇商人の護衛を請け負いました。謝礼として闇商人より金$zsigotoaddpを受け取りました。");
							}else{
							$zsigotoaddp = $zsigotoadd * 100;
							$p_syoji_kin{$f_id} += $zsigotoaddp;
							$p_ex_buryoku{$f_id}+= int(rand(2));
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【武官型/巡察】：資金調達のため賭博場の用心棒を請け負いました。$t_name{$ft_id}の治安が$zsigotoadd悪化し、謝礼として金$zsigotoaddpを受け取りました。");

							}
						}elsif($jff<35 and $t_tian_ti{$ft_id} <100){$khcc = "";
							$zsigotoaddp = int( ($p_buryoku{$f_id}-(0.5 * ($tousotuno1 - 100))) /30 + rand($p_buryoku{$f_id}-(0.5 * ($tousotuno1 - 100)) ) / 20 + rand(4)) ;
						if($zsigotoaddp < 2){
							$zsigotoaddp = 2;
						}
							$t_siro_bouei_ti{$ft_id} -= $zsigotoaddp;
							if($t_siro_bouei_ti{$ft_id} < 1){
								$t_siro_bouei_ti{$ft_id} = 1;
							}else{
							$p_ex_buryoku{$f_id}+= int(rand(2));
								if($jff>24){
							$zsigotoadd = 20*$zsigotoaddp;
							$p_syoji_kin{$f_id} += $zsigotoadd;
$p_ex_karumalc{$f_id} -= 1;
$p_ex_karumald{$f_id} += 0;
								$khcc = "<br />城壁衛兵部隊は金を蓄えていました！ $p_name{$f_id}は城壁衛兵部隊から金$zsigotoaddを巻き上げました！！";
								}
							}
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【武官型/巡察】：賊兵を率いて城の衛兵の宿舎を襲いました。$t_name{$ft_id}の城の防衛力が$zsigotoaddp下がりました。$khcc");
						}else{

#_/_/_/_/_/連戦拡張_/_/_/_/_/_/_/#

######################
										$add_i_id = $f_id;
							$bpi_name{$add_i_id}[2] = "";
										if($p_migite{$add_i_id}%1000){
							$bpi_name{$add_i_id}[0] = $item_name{$p_migite{$add_i_id}};
							$bpi_dmg{$add_i_id}[0] = $item_seinou{$p_migite{$add_i_id}};
							$bpi_dmg{$add_i_id}[0] += $p_migite_lv{$add_i_id};

							$bpi_name{$add_i_id}[2] .= $item_name{$p_migite{$add_i_id}};
							$bpi_dmg{$add_i_id}[2] = int($item_seinou{$p_migite{$add_i_id}}*0.6);
							$bpi_dmg{$add_i_id}[2] += $p_migite_lv{$add_i_id};
										}else{
							$bpi_name{$add_i_id}[0] = $item_name{$p_hidarite{$add_i_id}};
							$bpi_dmg{$add_i_id}[0] = int($item_seinou{$p_hidarite{$add_i_id}}*0.5);
							$bpi_dmg{$add_i_id}[0] += $p_hidarite_lv{$add_i_id};

							$bpi_dmg{$add_i_id}[2] = int($item_seinou{$p_hidarite{$add_i_id}}*0.4*$item_2hf{$p_hidarite{$add_i_id}});
							$bpi_dmg{$add_i_id}[2] += $p_hidarite_lv{$add_i_id};
										}
										if($p_hidarite{$add_i_id}%1000){
							$bpi_name{$add_i_id}[1] = $item_name{$p_hidarite{$add_i_id}};
							$bpi_dmg{$add_i_id}[1] = $item_seinou{$p_hidarite{$add_i_id}};
							$bpi_dmg{$add_i_id}[1] += $p_hidarite_lv{$add_i_id};

										if($p_hidarite{$add_i_id}%1000){
							$bpi_name{$add_i_id}[2] .= '＆';
										}
							$bpi_name{$add_i_id}[2] .= $item_name{$p_hidarite{$add_i_id}};
							$bpi_dmg{$add_i_id}[2] += int($item_seinou{$p_hidarite{$add_i_id}}*0.6);
							$bpi_dmg{$add_i_id}[2] += $p_hidarite_lv{$add_i_id};
										}else{
							$bpi_name{$add_i_id}[1] = $item_name{$p_migite{$add_i_id}};
							$bpi_dmg{$add_i_id}[1] = int($item_seinou{$p_migite{$add_i_id}}*0.5);
							$bpi_dmg{$add_i_id}[1] += $p_migite_lv{$add_i_id};

							$bpi_dmg{$add_i_id}[2] += int($item_seinou{$p_migite{$add_i_id}}*0.4*$item_2hf{$p_migite{$add_i_id}});
							$bpi_dmg{$add_i_id}[2] += $p_migite_lv{$add_i_id};
										}
##############################

							$jffit = int(rand(50));
							$e_id = 0;

						if($jffit<20){$p_name{$e_id} = "ツキノワグマ";$add_9 = "熊";$p_buryoku{$e_id} = 100 + int(0.70 * ($buryokuno1 - 100)) - 20 + int(rand(10));$item_name{$p_migite{$e_id}} = "巨大な爪";
$add_10 = "$item_name{$p_migite{$e_id}}を天高く振りかざし$p_name{$f_id}に向かって振り下ろす！！";
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【武官型/巡察】：街を見回りました。$t_name{$ft_id}の民は山に出没する熊に困り果てているようです。話を聞いた$p_name{$f_id}は腕試しも兼ねて熊退治に出かけました。");
								$ikc = "ガルル・・";$eexi = 2;
						if($jffit<10){$p_name{$e_id} = "ヒグマ";
						}
						if($jffit<1 and $tuki_genzai eq "1"){$p_name{$e_id} = "大熊猫";$item_name{$p_migite{$e_id}} = "ムクムクお手て";
$add_10 = "$item_name{$p_migite{$e_id}}を天高く振りかざし$p_name{$f_id}に向かって振り下ろす！！";
$p_buryoku{$e_id} = 100 + int(0.99 * ($buryokuno1 - 100)) + 75 + int(rand(10));
						}
							if($p_buryoku{$f_id} - 50 > $p_buryoku{$e_id}){$p_buryoku{$e_id} = $p_buryoku{$f_id} - 50;
							}
						}elsif($jffit<35){$p_name{$e_id} = "猛虎";$add_9 = "虎";$p_buryoku{$e_id} = 100 + int(0.75 * ($buryokuno1 - 100)) - 1 + int(rand(10));$item_name{$p_migite{$e_id}} = "鋭い爪";
$add_10 = "$item_name{$p_migite{$e_id}}を天高く振りかざし$p_name{$f_id}に向かって振り下ろす！！";
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【武官型/巡察】：街を見回りました。$t_name{$ft_id}の民は山に出没する虎に困り果てているようです。話を聞いた$p_name{$f_id}は腕試しも兼ねて虎狩りに出かけました。");
								$ikc = "グルル・・";$eexi = 3;
							if($p_buryoku{$f_id} - 40 > $p_buryoku{$e_id}){$p_buryoku{$e_id} = $p_buryoku{$f_id} - 40;
							}
						if($jffit<25){$p_name{$e_id} = "大虎";$p_buryoku{$e_id} -= 5;
						}elsif($jffit<28){$p_name{$e_id} = "老虎";$p_buryoku{$e_id} -= 15;
						}
						}elsif($jffit<45 and $tuki_genzai > 6 and $tuki_genzai < 10){$p_name{$e_id} = "白虎";$add_9 = "虎";$p_buryoku{$e_id} = 100 + int(0.9 * ($buryokuno1 - 100)) + 75 + int(rand(10));$item_name{$p_migite{$e_id}} = "白銀の爪";
$add_10 = "$item_name{$p_migite{$e_id}}を天高く振りかざし$p_name{$f_id}に向かって振り下ろす！！";
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【武官型/巡察】：街を見回りました。$t_name{$ft_id}の民は山に出没する虎に困り果てているようです。話を聞いた$p_name{$f_id}は腕試しも兼ねて虎狩りに出かけました。");
								$ikc = "ガルル・・";$eexi = 7;
							if($p_buryoku{$f_id} - 15 > $p_buryoku{$e_id}){$p_buryoku{$e_id} = $p_buryoku{$f_id} - 15;
							}
						}elsif($jffit<50){$p_name{$e_id} = "大蛇";$add_9 = "大蛇";$p_buryoku{$e_id} = 100 + int(0.65 * ($buryokuno1 - 100)) - 40 + int(rand(10));$item_name{$p_migite{$e_id}} = "毒の牙";
$add_10 = "巨大な鎌首を持ち上げて$p_name{$f_id}に襲い掛かる！！";
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【武官型/巡察】：街を見回りました。$t_name{$ft_id}の民は山に出没する大蛇に困り果てているようです。話を聞いた$p_name{$f_id}は腕試しも兼ねて大蛇狩りに出かけました。");
								$ikc = "シャー・・";$eexi = 1;
							if($p_buryoku{$f_id} - 70 > $p_buryoku{$e_id}){$p_buryoku{$e_id} = $p_buryoku{$f_id} - 70;
							}
						}
										

											$ikuhit=0;
											$ikuhitkh=0;
										$ikur = int(rand(5));
										$add_11 = $p_buryoku{$f_id}+200;
										$ikus = $add_11-$p_buryoku{$e_id};

										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$count</span>:とある山の奥深く・・$p_name{$f_id}（武力$p_buryoku{$f_id}）は$p_name{$e_id}（武力？）と鉢合わせて一騎討ちへと突入した！！");

										if($p_busyou_hp{$f_id} < $p_tairyoku{$f_id}){
								$p_busyou_hp{$f_id} = int($p_tairyoku{$f_id}-(($p_tairyoku{$f_id} - $p_busyou_hp{$f_id})/4));
										}
										$add_11hp = $p_busyou_hp{$f_id};
										$add_12hp = 100;

										$ikut = 0;
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">開始！！</span>:$p_name{$f_id}（武力$p_buryoku{$f_id}）HP：$add_11hp● VS ●HP：$add_12hp（武力$p_buryoku{$e_id}）$p_name{$e_id}");

										$add_11d = int(rand($ikus/10))+ int($ikus/10);
										$add_12d = int(rand((400-$ikus)/10))+ int((400-$ikus)/10);

										$ikurh = int(rand(5));$kwwname = "";



									if($ikurh == 0){
										$add_i_hit = int(rand(3));
										$add_11d += int(rand($bpi_dmg{$f_id}[$add_i_hit]+10));
									if($add_11d > 60){$add_11d = 100;$kwwname = "<br />あまりの速さに$p_name{$e_id}は$bpi_name{$f_id}[$add_i_hit]を避けきれない！！$p_name{$e_id}は一撃の下に斬り倒された！！";}

										$khcc1= "$p_name{$f_id}は初撃から必殺技を繰り出した！！";
										if($kh1 ne ""){$khcc1= "$kh1";
										}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$khcc1</span>:$p_name{$f_id}の渾身の一撃！！<br />$bpi_name{$f_id}[$add_i_hit]を天高く振りかざし$p_name{$e_id}に向かって振り下ろす！！$kwwname");
									}elsif($ikurh == 1){
										$add_12d += int(rand($item_seinou{$p_migite{$e_id}}+10));
									if($add_12d > 60){$add_12d = 100;$kwwname = "<br />あまりの速さに$p_name{$f_id}は$item_name{$p_migite{$e_id}}を避けきれない！！$p_name{$f_id}は一撃の下になぎ倒された！！";}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$e_id}は初撃から必殺技を繰り出した！！</span>:$p_name{$e_id}の渾身の一撃！！$add_10$kwwname");
									}elsif($ikurh == 2){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">壱合目！！</span>:$p_name{$f_id}は三連撃を繰り出していく。<br />一方の$p_name{$e_id}はそれを紙一重でかわしつつカウンターを仕掛ける！！");
									}elsif($ikurh == 3){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">壱合目！！</span>:$p_name{$e_id}は素早い動きで$p_name{$f_id}の背後へと回り込む<br />。一方の$p_name{$f_id}は背中でそれをやり過ごし振り向きざまにカウンターの一撃を叩き込む！！");
									}elsif($ikurh == 4){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">壱合目！！</span>:$p_name{$f_id}と$p_name{$e_id}は真っ向から対峙しほぼ同時に必殺の一撃を解き放つ！！");
										}

									if($add_12d <= 0){$add_12d = 1;
									}
									if($add_11d <= 0){$add_11d = 1;
									}
										$add_11hp -= $add_12d;
										$add_12hp -= $add_11d;
									if($add_12hp <= 0 and $add_11hp <= 0){$add_12hp = 1;$add_11hp = 1;
									}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">壱合目！！</span>:$p_name{$f_id}（武力$p_buryoku{$f_id}）HP：$add_11hp● VS ●HP：$add_12hp（武力$p_buryoku{$e_id}）$p_name{$e_id}");

									if($add_12hp <= 0){
											$ikuhit=1;
											$ikuhitkh=1;
										$p_ex_buryoku{$f_id} += $eexi+2;
							$ryoumin_add2 = $eexi * 100+300;
							$t_ryoumin_suu{$ft_id} += $ryoumin_add2;
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}を討ち取った！！</span>:$khi<br />$add_9退治の評判は隣国まで知れ渡り$t_name{$ft_id}の人口が$ryoumin_add2増えました！！");
									if($p_name{$e_id} eq "白虎"){
									if($p_pet_type{$f_id}[0] ne "1"){
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の山にて一閃の下に白虎をなぎ倒す。 使用武器:$item_name{$p_migite{$f_id}} 以後、神獣：白虎を従えるようになる。");
										$w_id=$f_id;&P_LOG_W("$p_name{$e_id}は仲間になりたそうな目でこちらを見つめています。<br />$p_name{$f_id}は白虎を従えた。$p_name{$f_id}の部隊に神獣：白虎が加わりました！！！");
$p_pet_type{$f_id}[0] = 1;
$p_pet_name{$f_id}[0] = $jyuu[$p_pet_type{$f_id}[0]];
									}else{
							$kitw = int(rand(2))+1;
							$kitw = "7$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の山にて白虎をなぎ倒し<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:戦利品として<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の山にて一閃の下に白虎をなぎ倒す。 使用武器:$item_name{$p_migite{$f_id}}");
									}
											&M2AP_LOG("<span class=\"c0000FF\">【白虎退治】</span>$p_p_b_a{$f_id}は一閃の下に$p_name{$e_id}を討ち取りました！ 使用武器:$item_name{$p_migite{$f_id}}");
									}elsif($add_9 eq "熊"){
	if(1 > int(rand(25))){
							$kitw = int(rand(2))+3;
							$kitw = "7$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の山にて$p_name{$e_id}を一撃の下になぎ倒し<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:戦利品として<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
	}
									}elsif($add_9 eq "大蛇"){
	if(1 > int(rand(50))){
							$kitw = int(rand(2))+5;
							$kitw = "7$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の山にて$p_name{$e_id}を一撃の下になぎ倒し<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:戦利品として<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
	}
									}elsif(1 > int(rand(20))){
							$kitw = int(rand(1));
							$kitw = "7$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の山にて$p_name{$e_id}を一撃の下になぎ倒し<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:戦利品として<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
									}
									}elsif($add_11hp <= 0){
											$ikuhit=1;
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}になぎ倒された。。</span>:$p_name{$f_id}は命からがら山から逃げ帰った。");
										}



									if($ikuhit < 1){

										$add_11d = int(rand($ikus/10))+ int($ikus/10);
										$add_12d = int(rand((400-$ikus)/10))+ int((400-$ikus)/10);

										$ikurh = int(rand(5));

									if($ikurh == 0){
										$add_i_hit = int(rand(3));
										$add_11d += int(rand($bpi_dmg{$f_id}[$add_i_hit]+10));
										$khcc1= "この一撃で決めてやる！！";
										if($kh2 ne ""){$khcc1= "$kh2";
										}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$khcc1</span>:$p_name{$f_id}の渾身の一撃！！<br />$bpi_name{$f_id}[$add_i_hit]が風を斬り裂き$p_name{$e_id}の喉笛めがけて襲い掛かる！！");
									}elsif($ikurh == 1){
										$add_12d += int(rand($item_seinou{$p_migite{$e_id}}+10));
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$ikc</span>:$p_name{$e_id}の渾身の一撃！！$item_name{$p_migite{$e_id}}が風を斬り裂き$p_name{$f_id}の喉笛めがけて襲い掛かる！！");
									}elsif($ikurh == 2){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">弐合目！！</span>:$p_name{$f_id}は三連撃を繰り出していく。<br />一方の$p_name{$e_id}はそれを紙一重でかわしつつカウンターを仕掛ける！！");
									}elsif($ikurh == 3){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">弐合目！！</span>:$p_name{$e_id}は素早い動きで$p_name{$f_id}の背後へと回り込む。<br />一方の$p_name{$f_id}は背中でそれをやり過ごし振り向きざまにカウンターの一撃を叩き込む！！");
									}elsif($ikurh == 4){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">弐合目！！</span>:$p_name{$f_id}と$p_name{$e_id}は真っ向から対峙しほぼ同時に必殺の一撃を解き放つ！！");
										}

									if($add_12d <= 0){$add_12d = 1;
									}
									if($add_11d <= 0){$add_11d = 1;
									}
										$add_11hp -= $add_12d;
										$add_12hp -= $add_11d;
									if($add_12hp <= 0 and $add_11hp <= 0){$add_12hp = 1;$add_11hp = 1;
									}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">弐合目！！</span>:$p_name{$f_id}（武力$p_buryoku{$f_id}）HP：$add_11hp● VS ●HP：$add_12hp（武力$p_buryoku{$e_id}）$p_name{$e_id}");

									if($add_12hp <= 0){
											$ikuhit=1;
											$ikuhitkh=1;
										$p_ex_buryoku{$f_id} += $eexi+1;
							$ryoumin_add2 = $eexi * 100+150;
							$t_ryoumin_suu{$ft_id} += $ryoumin_add2;
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}を討ち取った！！</span>:$khi<br />$add_9退治の評判は隣国まで知れ渡り$t_name{$ft_id}の人口が$ryoumin_add2増えました！！");
									if($p_name{$e_id} eq "白虎"){
									if($p_pet_type{$f_id}[0] ne "1"){
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の山にて白虎をなぎ倒す。 使用武器:$bpi_name{$f_id}[$add_i_hit] 以後、神獣：白虎を従えるようになる。");
										$w_id=$f_id;&P_LOG_W("$p_name{$e_id}は仲間になりたそうな目でこちらを見つめています。<br />$p_name{$f_id}は白虎を従えた。$p_name{$f_id}の部隊に神獣：白虎が加わりました！！！");
$p_pet_type{$f_id}[0] = 1;
$p_pet_name{$f_id}[0] = $jyuu[$p_pet_type{$f_id}[0]];
									}elsif(1 > int(rand(3))){
							$kitw = int(rand(2))+1;
							$kitw = "7$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の山にて白虎をなぎ倒し<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:戦利品として<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
									}else{
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の山にて白虎をなぎ倒しました。");
									}
											&M2AP_LOG("<span class=\"c0000FF\">【白虎退治】</span>$p_p_b_a{$f_id}は圧倒的な力を持って$p_name{$e_id}を討ち取りました！");
									}
									}elsif($add_11hp <= 0){
											$ikuhit=1;
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}になぎ倒された。。</span>:$p_name{$f_id}は命からがら山から逃げ帰った。");
										}
										}


									if($ikuhit < 1){

										$add_11d = int(rand($ikus/10))+ int($ikus/10);
										$add_12d = int(rand((400-$ikus)/10))+ int((400-$ikus)/10);

										$ikurh = int(rand(5));

									if($ikurh == 0){
										$add_i_hit = int(rand(3));
										$add_11d += int(rand($bpi_dmg{$f_id}[$add_i_hit]+10));
										$khcc1= "これで・・終わりだ！！";
										if($kh3 ne ""){$khcc1= "$kh3";
										}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$khcc1</span>:$p_name{$f_id}の渾身の一撃！！<br />$bpi_name{$f_id}[$add_i_hit]が風を斬り裂き$p_name{$e_id}の喉笛めがけて襲い掛かる！！");
									if($p_syomotu{$f_id} eq "2013"){
										$add_i_hit = int(rand(3));
										$add_11d += int(rand($bpi_dmg{$f_id}[$add_i_hit]+10));
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">相手が悪かったな・・</span>:$p_name{$f_id}の二の太刀！！$bpi_name{$f_id}[$add_i_hit]が$p_name{$e_id}のわき腹を軽く貫く！！");
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">さらばだ！！</span>:$p_name{$f_id}の三の太刀！！$bpi_name{$f_id}[$add_i_hit]が容赦なく$p_name{$e_id}の体を斬り刻む！！");
									}

									}elsif($ikurh == 1){
										$add_12d += int(rand($item_seinou{$p_migite{$e_id}}+10));
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$ikc</span>:$p_name{$e_id}の渾身の一撃！！$item_name{$p_migite{$e_id}}が風を斬り裂き$p_name{$f_id}の喉笛めがけて襲い掛かる！！");
									}elsif($ikurh == 2){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">参合目！！</span>:$p_name{$f_id}は三連撃を繰り出していく。<br />一方の$p_name{$e_id}はそれを紙一重でかわしつつカウンターを仕掛ける！！");
									}elsif($ikurh == 3){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">参合目！！</span>:$p_name{$e_id}は素早い動きで$p_name{$f_id}の背後へと回り込む。<br />一方の$p_name{$f_id}は背中でそれをやり過ごし振り向きざまにカウンターの一撃を叩き込む！！");
									}elsif($ikurh == 4){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">参合目！！</span>:$p_name{$f_id}と$p_name{$e_id}は真っ向から対峙しほぼ同時に必殺の一撃を解き放つ！！");
										}

									if($add_12d <= 0){$add_12d = 1;
									}
									if($add_11d <= 0){$add_11d = 1;
									}

										$add_11hp -= $add_12d;
										$add_12hp -= $add_11d;
									if($add_12hp <= 0 and $add_11hp <= 0){$add_12hp = 1;$add_11hp = 1;
									}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">参合目！！</span>:$p_name{$f_id}（武力$p_buryoku{$f_id}）HP：$add_11hp● VS ●HP：$add_12hp（武力$p_buryoku{$e_id}）$p_name{$e_id}");

									if($add_12hp <= 0){
											$ikuhit=1;
										$p_ex_buryoku{$f_id} += $eexi;
							$ryoumin_add2 = $eexi * 100+50;
							$t_ryoumin_suu{$ft_id} += $ryoumin_add2;
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}を討ち取った！！</span>:$khi<br />$add_9退治の評判は隣国まで知れ渡り$t_name{$ft_id}の人口が$ryoumin_add2増えました！！");
									if($p_name{$e_id} eq "白虎"){
									if($p_pet_type{$f_id}[0] ne "1"){
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の山にて激闘の末、白虎をなぎ倒す。 使用武器:$bpi_name{$f_id}[$add_i_hit] 以後、神獣：白虎を従えるようになる。");
										$w_id=$f_id;&P_LOG_W("$p_name{$e_id}は仲間になりたそうな目でこちらを見つめています。<br />$p_name{$f_id}は白虎を従えた。$p_name{$f_id}の部隊に神獣：白虎が加わりました！！！");
$p_pet_type{$f_id}[0] = 1;
$p_pet_name{$f_id}[0] = $jyuu[$p_pet_type{$f_id}[0]];
									}elsif(1 > int(rand(7))){
							$kitw = int(rand(2))+1;
							$kitw = "7$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の山にて白虎をなぎ倒し<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:戦利品として<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
									}else{
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の山にて激闘の末、白虎をなぎ倒しました。");
									}
											&M2AP_LOG("<span class=\"c0000FF\">【白虎退治】</span>$p_p_b_a{$f_id}は激闘の末$p_name{$e_id}を討ち取りました！");
									}
									}elsif($add_11hp <= 0){
											$ikuhit=1;
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}になぎ倒された。。</span>:$p_name{$f_id}は命からがら山から逃げ帰った。");
									}else{
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">引き分け</span>:$p_name{$f_id}と$p_name{$e_id}の勝負は決着がつかなかった。。");
										}
										}



						$p_busyou_hp{$f_id} = $add_11hp;
							if($p_busyou_hp{$f_id} < $p_tairyoku{$f_id}){
								if($p_busyou_hp{$f_id} < 1){$p_busyou_hp{$f_id} = 0;
								}
								$p_busyou_hp{$f_id} = int($p_tairyoku{$f_id}-(($p_tairyoku{$f_id} - $p_busyou_hp{$f_id})/4));
							}
#_/_/_/_/_/連戦拡張_/_/_/_/_/_/_/#

									if($ikuhitkh==1){

							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【武官型/巡察】：手早く狩りを済ませて街に戻ってみると今度は吸血姫が出没するという\噂\が流れています。話を聞いた$p_name{$f_id}は\噂\を\頼\りに吸血姫退治に出かけました。");

							$jffit = int(rand(50));


						if($jffit<7){$p_name{$e_id} = "妖文姜";$p_buryoku{$e_id} = 100 + int(0.85 * ($buryokuno1 - 100)) + 15 + int(rand(10));$item_name{$p_migite{$e_id}} = "念動力";
								$ikc = "ふふ・・妾にかなうと思うてか？ 汝、$p_name{$f_id}・・冥府魔道の理に従いて諸王へ捧げる贄となれ！";$eexi = 1;$ikc1 = "左手を天高く振りかざし$p_name{$f_id}に向かって振り下ろす！！途端に悪夢のような衝撃波が$p_name{$f_id}に襲いかかる！！";$ikc2 = "$item_name{$p_migite{$e_id}}が時空をゆがめ$p_name{$f_id}の体を遥か彼方へと弾き飛ばす！！";
						}elsif($jffit<14){$p_name{$e_id} = "妖夏姫";$p_buryoku{$e_id} = 100 + int(0.85 * ($buryokuno1 - 100)) + 10 + int(rand(10));$item_name{$p_migite{$e_id}} = "血塗られた短剣";
								$ikc = "もう終わり・・ですか？ならば塵となりて現世を漂うがようがよい！";$eexi = 1;$ikc1 = "$item_name{$p_migite{$e_id}}を天高く振りかざし$p_name{$f_id}に向かって振り下ろす！！";$ikc2 = "$item_name{$p_migite{$e_id}}が風をひき裂き$p_name{$f_id}の首筋めがけて襲い掛かる！！";
						}elsif($jffit<21){$p_name{$e_id} = "妖哀姜";$p_buryoku{$e_id} = 100 + int(0.85 * ($buryokuno1 - 100)) + 20 + int(rand(10));$item_name{$p_migite{$e_id}} = "念動力";
								$ikc = "さようなら・・もう会うことも無いでしょう・・";$eexi = 1;$ikc1 = "左手を天高く振りかざし$p_name{$f_id}に向かって振り下ろす！！途端に悪夢のような衝撃波が$p_name{$f_id}に襲いかかる！！";$ikc2 = "$item_name{$p_migite{$e_id}}が時空をゆがめ$p_name{$f_id}の体を遥か彼方へと弾き飛ばす！！";
						}elsif($jffit<28){$p_name{$e_id} = "妖驪姫";$p_buryoku{$e_id} = 100 + int(0.85 * ($buryokuno1 - 100)) + 15 + int(rand(10));$item_name{$p_migite{$e_id}} = "念動力";
								$ikc = "私に逆らう者には死の悲劇が訪れる・・・そう、申生のように・・・。遊びの時間は終わりです・・眠りなさい・・永遠に・・";$eexi = 1;$ikc1 = "左手を天高く振りかざし$p_name{$f_id}に向かって振り下ろす！！途端に悪夢のような衝撃波が$p_name{$f_id}に襲いかかる！！";$ikc2 = "$item_name{$p_migite{$e_id}}が時空をゆがめ$p_name{$f_id}の体を遥か彼方へと弾き飛ばす！！";
						}elsif($jffit<35){$p_name{$e_id} = "妖西施";$p_buryoku{$e_id} = 100 + int(0.85 * ($buryokuno1 - 100)) + 15 + int(rand(10));$item_name{$p_migite{$e_id}} = "等身大の大槌";
								$ikc = "やはりこの程度か・・。夫差に比べれば赤子も同然。あの世で己の非力さを悔いるが良い！";$eexi = 1;$ikc1 = "$item_name{$p_migite{$e_id}}を天高く振りかざし$p_name{$f_id}に向かって振り下ろす！！";$ikc2 = "$item_name{$p_migite{$e_id}}が風をひき裂き$p_name{$f_id}の脳天めがけて襲い掛かる！！";
						}elsif($jffit<42){$p_name{$e_id} = "妖褒姒";$p_buryoku{$e_id} = 100 + int(0.85 * ($buryokuno1 - 100)) + 20 + int(rand(10));$item_name{$p_migite{$e_id}} = "念動力";
								$ikc = "私の微笑みは死への誘い。お遊びは終わりです。あの世で己の非力さを悔いなさい・・。";$eexi = 1;$ikc1 = "左手を天高く振りかざし$p_name{$f_id}に向かって振り下ろす！！途端に悪夢のような衝撃波が$p_name{$f_id}に襲いかかる！！";$ikc2 = "妖褒姒が優しく微笑むと、周囲の闇・・深遠なる虚空より無数の刃が生み出され、$p_name{$f_id}の体めがけて襲い掛かる！！";
						}elsif($jffit<50){$p_name{$e_id} = "妖妹喜";$p_buryoku{$e_id} = 100 + int(0.85 * ($buryokuno1 - 100)) + 20 + int(rand(10));$item_name{$p_migite{$e_id}} = "柳葉刀";
								$ikc = "下賎の者が図に乗りおってからに・・貴様如きに梃子摺ったとあらば桀王様に申し訳が立たぬ。<br />遊びは終わりじゃ。妾に眠る真なる力、とくと見るが良い！";$eexi = 1;$ikc1 = "$item_name{$p_migite{$e_id}}を下段に構えると、左に体転しながら右足を一歩進め、$p_name{$f_id}めがけ逆袈裟状に斬り上げる！！";$ikc2 = "$p_name{$e_id}は己の剣に念を込めると、目前の虚空を数回凪ぐ。それより生み出されし無数の剣圧は、漆黒の鎌鼬となりて$p_name{$f_id}の体を縦横無尽に切り刻む！！";
						}

							if($p_buryoku{$f_id} - 25 > $p_buryoku{$e_id}){$p_buryoku{$e_id} = $p_buryoku{$f_id} - 25;
							}
											$ikuhit=0;
											$ikuhitkh=0;
										$ikur = int(rand(5));
										$add_11 = $p_buryoku{$f_id}+200;
										$ikus = $add_11-$p_buryoku{$e_id};

										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$count</span>:とある街角・・$p_name{$f_id}（武力$p_buryoku{$f_id}）は$p_name{$e_id}（武力？）と鉢合わせて一騎討ちへと突入した！！");

										$add_11hp = $p_busyou_hp{$f_id};
										$add_12hp = 100;
										$ikut = 0;
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">開始！！</span>:$p_name{$f_id}（武力$p_buryoku{$f_id}）HP：$add_11hp● VS ●HP：$add_12hp（武力$p_buryoku{$e_id}）$p_name{$e_id}");





										$add_11d = int(rand($ikus/10))+ int($ikus/10);
										$add_12d = int(rand((400-$ikus)/10))+ int((400-$ikus)/10);

										$ikurh = int(rand(5));$kwwname = "";

									if($ikurh == 0){
										$add_i_hit = int(rand(3));
										$add_11d += int(rand($bpi_dmg{$f_id}[$add_i_hit]+10));
									if($add_11d > 60){$add_11d = 100;$kwwname = "<br />あまりの速さに$p_name{$e_id}は$bpi_name{$f_id}[$add_i_hit]を避けきれない！！$p_name{$e_id}は一撃の下に斬り倒された！！";}

										$khcc1= "$p_name{$f_id}は初撃から必殺技を繰り出した！！";
										if($kh1 ne ""){$khcc1= "$kh1";
										}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$khcc1</span>:$p_name{$f_id}の渾身の一撃！！<br />$bpi_name{$f_id}[$add_i_hit]を天高く振りかざし$p_name{$e_id}に向かって振り下ろす！！$kwwname");
									}elsif($ikurh == 1){
										$add_12d += int(rand($item_seinou{$p_migite{$e_id}}+70));
									if($add_12d > 60){$add_12d = 100;$kwwname = "<br />あまりの速さに$p_name{$f_id}は$item_name{$p_migite{$e_id}}を避けきれない！！$p_name{$f_id}は一撃の下になぎ倒された！！";}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$e_id}は初撃から必殺技を繰り出した！！</span>:$p_name{$e_id}の渾身の一撃！！$ikc1 $kwwname");
									}elsif($ikurh == 2){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">壱合目！！</span>:$p_name{$f_id}は三連撃を繰り出していく。<br />一方の$p_name{$e_id}はそれを紙一重でかわしつつカウンターを仕掛ける！！");
									}elsif($ikurh == 3){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">壱合目！！</span>:$p_name{$e_id}は素早い動きで$p_name{$f_id}の背後へと回り込む。<br />一方の$p_name{$f_id}は背中でそれをやり過ごし振り向きざまにカウンターの一撃を叩き込む！！");
									}elsif($ikurh == 4){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">壱合目！！</span>:$p_name{$f_id}と$p_name{$e_id}はほぼ同時に必殺の一撃を解き放つ！！");
										}

									if($add_12d <= 0){$add_12d = 1;
									}
									if($add_11d <= 0){$add_11d = 1;
									}
										$add_11hp -= $add_12d;
										$add_12hp -= $add_11d;
									if($add_12hp <= 0 and $add_11hp <= 0){$add_12hp = 1;$add_11hp = 1;
									}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">壱合目！！</span>:$p_name{$f_id}（武力$p_buryoku{$f_id}）HP：$add_11hp● VS ●HP：$add_12hp（武力$p_buryoku{$e_id}）$p_name{$e_id}");

									if($add_12hp <= 0){
											$ikuhit=1;
											$ikuhitkh=1;
										$p_ex_buryoku{$f_id} += $eexi+2;
									if($p_heisyu{$f_id} ne "93"){
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の街にて一閃の下に吸血姫 $p_name{$e_id}を討ち取る。 使用武器:$bpi_name{$f_id}[$add_i_hit] 以後、吸血姫を従えるようになる。");
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}を討ち取った！！</span>:$khi<br />$p_name{$e_id}は仲間になりたそうな目でこちらを見つめています。<br />$p_name{$f_id}は深く考えずに吸血姫を採用した。。$p_name{$f_id}の部隊は吸血姫部隊になりました！！");
								$p_heisyu{$f_id} = 93;
									}else{

							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の街にて一閃の下に吸血姫 $p_name{$e_id}を討ち取りました。");
									if(1 > int(rand(3))){
							$kitw = int(rand(1))+7;
							$kitw = "7$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の街にて一閃の下に吸血姫 $p_name{$e_id}を討ち取り<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:戦利品として<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
									}
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の街にて一閃の下に吸血姫 $p_name{$e_id}を討ち取る。 使用武器:$bpi_name{$f_id}[$add_i_hit]");
									}
											&M2AP_LOG("<span class=\"c0000FF\">【吸血姫退治】</span>$p_p_b_a{$f_id}は一閃の下に吸血姫 $p_name{$e_id}を討ち取りました！ 使用武器:$bpi_name{$f_id}[$add_i_hit]");

									}elsif($add_11hp <= 0){
											$ikuhit=1;
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}になぎ倒された。。</span>:$p_name{$f_id}は命からがら城へ逃げ帰った。");
										}



									if($ikuhit < 1){

										$add_11d = int(rand($ikus/10))+ int($ikus/10);
										$add_12d = int(rand((400-$ikus)/10))+ int((400-$ikus)/10);

										$ikurh = int(rand(5));

									if($ikurh == 0){
										$add_i_hit = int(rand(3));
										$add_11d += int(rand($bpi_dmg{$f_id}[$add_i_hit]+10));
										$khcc1= "この一撃で決めてやる！！";
										if($kh2 ne ""){$khcc1= "$kh2";
										}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$khcc1</span>:$p_name{$f_id}の渾身の一撃！！<br />$bpi_name{$f_id}[$add_i_hit]が風を斬り裂き$p_name{$e_id}の喉笛めがけて襲い掛かる！！");
									}elsif($ikurh == 1){
										$add_12d += int(rand($item_seinou{$p_migite{$e_id}}+70));
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$ikc</span>:$p_name{$e_id}の渾身の一撃！！$ikc2");
									}elsif($ikurh == 2){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">弐合目！！</span>:$p_name{$f_id}は三連撃を繰り出していく。<br />一方の$p_name{$e_id}はそれを紙一重でかわしつつカウンターを仕掛ける！！");
									}elsif($ikurh == 3){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">弐合目！！</span>:$p_name{$e_id}は素早い動きで$p_name{$f_id}の背後へと回り込む。<br />一方の$p_name{$f_id}は背中でそれをやり過ごし振り向きざまにカウンターの一撃を叩き込む！！");
									}elsif($ikurh == 4){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">弐合目！！</span>:$p_name{$f_id}と$p_name{$e_id}はほぼ同時に必殺の一撃を解き放つ！！");
										}

									if($add_12d <= 0){$add_12d = 1;
									}
									if($add_11d <= 0){$add_11d = 1;
									}
										$add_11hp -= $add_12d;
										$add_12hp -= $add_11d;
									if($add_12hp <= 0 and $add_11hp <= 0){$add_12hp = 1;$add_11hp = 1;
									}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">弐合目！！</span>:$p_name{$f_id}（武力$p_buryoku{$f_id}）HP：$add_11hp● VS ●HP：$add_12hp（武力$p_buryoku{$e_id}）$p_name{$e_id}");

									if($add_12hp <= 0){
											$ikuhit=1;
											$ikuhitkh=1;
										$p_ex_buryoku{$f_id} += $eexi+1;
									if($p_heisyu{$f_id} ne "93"){
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の街にて吸血姫 $p_name{$e_id}を討ち取る。 使用武器:$bpi_name{$f_id}[$add_i_hit] 以後、吸血姫を従えるようになる。");
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}を討ち取った！！</span>:$khi<br />$p_name{$e_id}は仲間になりたそうな目でこちらを見つめています。<br />$p_name{$f_id}は深く考えずに吸血姫を採用した。。$p_name{$f_id}の部隊は吸血姫部隊になりました！！");
								$p_heisyu{$f_id} = 93;
									}else{
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の街にて吸血姫 $p_name{$e_id}を討ち取りました。");
									if(1 > int(rand(7))){
							$kitw = int(rand(1))+7;
							$kitw = "7$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の街にて吸血姫 $p_name{$e_id}を討ち取り<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:戦利品として<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
									}
									}

											&M2AP_LOG("<span class=\"c0000FF\">【吸血姫退治】</span>$p_p_b_a{$f_id}は圧倒的な力を持って吸血姫 $p_name{$e_id}を討ち取りました！");

									}elsif($add_11hp <= 0){
											$ikuhit=1;
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}になぎ倒された。。</span>:$p_name{$f_id}は命からがら城へ逃げ帰った。");
										}
										}


									if($ikuhit < 1){

										$add_11d = int(rand($ikus/10))+ int($ikus/10);
										$add_12d = int(rand((400-$ikus)/10))+ int((400-$ikus)/10);

										$ikurh = int(rand(5));

									if($ikurh == 0){
										$add_i_hit = int(rand(3));
										$add_11d += int(rand($bpi_dmg{$f_id}[$add_i_hit]+10));
										$khcc1= "これで・・終わりだ！！";
										if($kh3 ne ""){$khcc1= "$kh3";
										}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$khcc1</span>:$p_name{$f_id}の渾身の一撃！！<br />$bpi_name{$f_id}[$add_i_hit]が風を斬り裂き$p_name{$e_id}の喉笛めがけて襲い掛かる！！");
									if($p_syomotu{$f_id} eq "2013"){
										$add_i_hit = int(rand(3));
										$add_11d += int(rand($bpi_dmg{$f_id}[$add_i_hit]+10));
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">相手が悪かったな・・</span>:$p_name{$f_id}の二の太刀！！$bpi_name{$f_id}[$add_i_hit]が$p_name{$e_id}のわき腹を軽く貫く！！");
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">さらばだ！！</span>:$p_name{$f_id}の三の太刀！！$bpi_name{$f_id}[$add_i_hit]が容赦なく$p_name{$e_id}の体を斬り刻む！！");
									}

									}elsif($ikurh == 1){
										$add_12d += int(rand($item_seinou{$p_migite{$e_id}}+70));
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$ikc</span>:$p_name{$e_id}の渾身の一撃！！$ikc2");
									}elsif($ikurh == 2){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">参合目！！</span>:$p_name{$f_id}は三連撃を繰り出していく。<br />一方の$p_name{$e_id}はそれを紙一重でかわしつつカウンターを仕掛ける！！");
									}elsif($ikurh == 3){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">参合目！！</span>:$p_name{$e_id}は素早い動きで$p_name{$f_id}の背後へと回り込む。<br />一方の$p_name{$f_id}は背中でそれをやり過ごし振り向きざまにカウンターの一撃を叩き込む！！");
									}elsif($ikurh == 4){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">参合目！！</span>:$p_name{$f_id}と$p_name{$e_id}はほぼ同時に必殺の一撃を解き放つ！！");
										}


									if($add_12d <= 0){$add_12d = 1;
									}
									if($add_11d <= 0){$add_11d = 1;
									}
										$add_11hp -= $add_12d;
										$add_12hp -= $add_11d;
									if($add_12hp <= 0 and $add_11hp <= 0){$add_12hp = 1;$add_11hp = 1;
									}
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">参合目！！</span>:$p_name{$f_id}（武力$p_buryoku{$f_id}）HP：$add_11hp● VS ●HP：$add_12hp（武力$p_buryoku{$e_id}）$p_name{$e_id}");

									if($add_12hp <= 0){
											$ikuhit=1;
										$p_ex_buryoku{$f_id} += $eexi;
									if($p_heisyu{$f_id} ne "93"){
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の街にて激闘の末、吸血姫 $p_name{$e_id}を討ち取る。 使用武器:$bpi_name{$f_id}[$add_i_hit] 以後、吸血姫を従えるようになる。");
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}を討ち取った！！</span>:$khi<br />$p_name{$e_id}は仲間になりたそうな目でこちらを見つめています。<br />$p_name{$f_id}は深く考えずに吸血姫を採用した。。$p_name{$f_id}の部隊は吸血姫部隊になりました！！");
								$p_heisyu{$f_id} = 93;
									}else{
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の街にて激闘の末、吸血姫 $p_name{$e_id}を討ち取りました。");
									if(1 > int(rand(15))){
							$kitw = int(rand(1))+7;
							$kitw = "7$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の街にて激闘の末、吸血姫 $p_name{$e_id}を討ち取り<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:戦利品として<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
									}
									}

											&M2AP_LOG("<span class=\"c0000FF\">【吸血姫退治】</span>$p_p_b_a{$f_id}は激闘の末、吸血姫 $p_name{$e_id}を討ち取りました！");

									}elsif($add_11hp <= 0){
											$ikuhit=1;
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">$p_name{$f_id}は$p_name{$e_id}になぎ倒された。。</span>:$p_name{$f_id}は命からがら城へ逃げ帰った。");
									}else{
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">引き分け</span>:$p_name{$f_id}と吸血姫 $p_name{$e_id}の勝負は決着がつかなかった。。");
										}
										}

						$p_busyou_hp{$f_id} = $add_11hp;
							if($p_busyou_hp{$f_id} < $p_tairyoku{$f_id}){
								if($p_busyou_hp{$f_id} < 1){$p_busyou_hp{$f_id} = 0;
								}
								$p_busyou_hp{$f_id} = int($p_tairyoku{$f_id}-(($p_tairyoku{$f_id} - $p_busyou_hp{$f_id})/4));
							}

									}


#_/_/_/_/_/連戦拡張_/_/_/_/_/_/_/#
						}

			}elsif($jfi>159 or ($jfi>129 and $jfl>129)){
							$jffint = int(rand(50));
			$p_ex_tiryoku{$f_id}++;
							$zsigotoadd = int((($p_tiryoku{$f_id}+$add_naisei)/30 + rand($p_tiryoku{$f_id}+$add_naisei) / 20 + rand(4)) * 150 / $p_sougou{$f_id});
						if($jff<15 and $jffint < $zsigotoadd * 3 and $t_zoku_bouei_ti{$ft_id} >= $t_zoku_bouei_max{$ft_id} and $t_zoku_taikyuu_ti{$ft_id} >= $t_zoku_taikyuu_max{$ft_id}){
										$p_ex_tiryoku{$f_id}+=2;
						$p_kunkou{$f_id} += 40;
								$t_zoku_bouei_max{$ft_id} += 100;
								$t_zoku_bouei_ti{$ft_id} -= 100;
								$t_zoku_taikyuu_ti{$ft_id} -= 99;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の賊砦を改修＆増築する。");
										$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【文官型/巡察】：更なる防衛力強化のため賊砦を改修＆増築しました。$t_name{$ft_id}の賊砦防衛力最大値が100上昇しました。");
										&M2AP_LOG("$p_p_b_a{$f_id}は更なる防衛力強化のため賊砦を改修＆増築しました。$t_name{$ft_id}の賊砦防衛力最大値が100上昇しました。");
						}elsif($jff<30 and $t_zoku_taikyuu_ti{$ft_id} < $t_zoku_taikyuu_max{$ft_id}){
							$zsigotoadd = int( ($p_tiryoku{$f_id}-(0.5 * ($tiryokuno1 - 100))) /45 + rand( $p_tiryoku{$f_id} - (0.5 * ($tiryokuno1 - 100)) ) / 30 + rand(2));
						if($zsigotoadd < 1){
							$zsigotoadd = 1;
						}
							$t_tian_ti{$ft_id} -= $zsigotoadd;
							$zsigotoaddp = int($zsigotoadd*(3+int(5)));
							$t_zoku_taikyuu_ti{$ft_id} += $zsigotoaddp;
							if($t_tian_ti{$ft_id} < 0){
								$t_tian_ti{$ft_id} = 0;
							}else{
							$p_ex_tiryoku{$f_id}+= int(rand(2));
							}
							if($t_zoku_taikyuu_ti{$ft_id} > $t_zoku_taikyuu_max{$ft_id}){
								$t_zoku_taikyuu_ti{$ft_id} = $t_zoku_taikyuu_max{$ft_id};
							}else{
							$p_ex_tiryoku{$f_id}+= int(rand(2));
							}
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【文官型/巡察】：闇商人と取引し、賊砦の耐久性能を向上させました。治安が$zsigotoadd悪化し$t_name{$ft_id}の賊砦耐久が$zsigotoaddp上がりました。");

						}elsif($jff<45){
							$zsigotoadd = 1 + int(rand(3));
							$t_tian_ti{$ft_id} -= $zsigotoadd;
							if($t_tian_ti{$ft_id} < 0){
							$t_gijyutu_ti{$ft_id} += $zsigotoadd;
							$zsigotoaddp = $zsigotoadd * 500;
							$p_syoji_kin{$f_id} += $zsigotoaddp;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【文官型/巡察】：闇商人の参謀として、取引がうまくいくよう裏取引で根回ししました。謝礼として闇商人より金$zsigotoaddpを受け取りました。");
							}else{
							$zsigotoaddp = $zsigotoadd * 100;
							$p_syoji_kin{$f_id} += $zsigotoaddp;
							$p_ex_tiryoku{$f_id}+= int(rand(2));
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【文官型/巡察】：商人の参謀として、取引がうまくいくよう裏取引で根回ししました。$t_name{$ft_id}の治安が$zsigotoadd悪化し、謝礼として金$zsigotoaddpを受け取りました。");

							}
						}else{
						$p_kunkou{$f_id} -= 10;
				$kkcr = int(rand(240));

							if($kkcr > 230){
							$p_ex_tiryoku{$f_id}+= int(rand(10));
								$bi = "<br />どうやら釣り糸に何か引っかかったようです・・・<br />・<br />・<br />・<br />・<br />・<br />・<br />・<br />";
							}
						$p_kunkou{$f_id} -= 10;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【文官型/巡察】：$t_name{$ft_id}の街は平和そのものです。民とともに釣りを楽しみました。");
			if($kkcr > 230 and 1 > int(rand(10))){
							$kitw = int(rand(1));
							$kitw = "6$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]とある水辺にて、<span class=\"cFF0000\">$gitem[$kitw]</span>を釣り上げる。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:釣り竿をそっと引き上げてみると、古ぼけた<span class=\"cFF0000\">$gitem[$kitw]</span>が掛かっていました。");
			}elsif(1 > int(rand(30))){
							$kitw = int(rand(9))+1;
							$kitw = "6$kitw";
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}のとある水辺にて、巨大な<span class=\"cFF0000\">$gitem[$kitw]</span>を釣り上げる。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:とある水辺にて、巨大な<span class=\"cFF0000\">$gitem[$kitw]</span>を釣り上げました。");
			}
						}

			}else{
			$p_ex_tousotu{$f_id}++;
						if($jff<15){

			if($jfi>59 and $jfl>59 and $jfs>59 and int(rand(3)) < 1){
							$p_ex_tiryoku{$f_id}+= int(rand(2));
							$p_ex_buryoku{$f_id}+= int(rand(2));
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【万\能型/巡察】：$t_name{$ft_id}の山に篭り、精神統一しました。体中に気力がみなぎり、体力が限界値まで上昇しました。");
							$p_tairyoku{$f_id}=150;
			}elsif($jfi>89 and $jfl>89 and $jfs>89 and int(rand(3)) < 1){
							$p_ex_tiryoku{$f_id}+= int(rand(2));
							$p_ex_buryoku{$f_id}+= int(rand(2));
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【万\能型/巡察】：$t_name{$ft_id}の山に篭り、精神統一しました。体中に気力がみなぎり、体力が限界値まで上昇しました。");
							$p_tairyoku{$f_id}=150;
			}else{
							$p_ex_tousotu{$f_id}+= int(rand(5));
							$zsigotoadd = int( ($p_tousotu{$f_id}-(1.3 * ($keika_nen+1))) /30 + rand( ($p_tousotu{$f_id}-(1.3 * ($keika_nen+1))) ) / 20 + rand(4)) * 100;
						if($zsigotoadd < 150){
							$zsigotoadd = 150;
						}
							$p_syoji_kome{$f_id} += $zsigotoadd;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【万\能型/巡察】：街を見回りました。民から貢物として米$zsigotoaddを受け取りました。");
									if(1 > int(rand(20))){
							$kitw = int(rand(10));
							$kitw = "8$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の民から貢物として<span class=\"cFF0000\">$gitem[$kitw]</span>を貰い受ける。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:よく見ると、貢物の中に<span class=\"cFF0000\">$gitem[$kitw]</span>が入っていました。");
									}
			}
						}elsif($jff<45 and $p_kunren{$f_id} < $p_tousotu{$f_id} + $p_tiryoku{$f_id} + $p_buryoku{$f_id} and $p_heisisuu{$f_id} > 0){
							$zsigotoadd = 5 + int(rand($p_sougou{$f_id})/7);
							$p_kunren{$f_id} += $zsigotoadd;
							if($p_kunren{$f_id} > $p_tousotu{$f_id} + $p_tiryoku{$f_id} + $p_buryoku{$f_id}){
								$p_kunren{$f_id} = $p_tousotu{$f_id} + $p_tiryoku{$f_id} + $p_buryoku{$f_id};
							}else{
							$p_ex_tiryoku{$f_id}+= int(rand(2));
							$p_ex_buryoku{$f_id}+= int(rand(2));
$p_ex_karumalc{$f_id} += 1;
$p_ex_karumald{$f_id} += 0;
							}
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【万\能型/巡察】：鍛錬を怠けている兵士達に実践的な戦術を指南しました。部隊の訓練度が$zsigotoadd上がりました。");

						}elsif($jff<30){
							$zsigotoadd = 3 + int(rand(3));
							$t_tian_ti{$ft_id} += $zsigotoadd;
							if($t_tian_ti{$ft_id} > $t_tian_max{$ft_id}){
							$t_tian_ti{$ft_id} -= $zsigotoadd;
							$zsigotoaddp = $zsigotoadd * 50;
							$p_syoji_kin{$f_id} += $zsigotoaddp;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【万\能型/巡察】：資金調達のため賭博場の用心棒を請け負いました。謝礼として民より金$zsigotoaddpを受け取りました。");
							}else{
							$zsigotoaddp = $zsigotoadd * 30;
							$p_syoji_kin{$f_id} += $zsigotoaddp;
							$p_ex_buryoku{$f_id}+= int(rand(2));
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【万\能型/巡察】：商人の用心棒として、傘下の賊を率いて街のごろつきを成敗しました。$t_name{$ft_id}の治安が$zsigotoadd上がり、謝礼として民より金$zsigotoaddpを受け取りました。");

							}

						}elsif($jff<45){
							$zsigotoadd = 1 + int(rand(3));
							$t_tian_ti{$ft_id} -= $zsigotoadd;
							if($t_tian_ti{$ft_id} < 0){
							$t_gijyutu_ti{$ft_id} += $zsigotoadd;
							$zsigotoaddp = $zsigotoadd * 500;
							$p_syoji_kin{$f_id} += $zsigotoaddp;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【万\能型/巡察】：資金調達のため闇商人の護衛を請け負いました。謝礼として闇商人より金$zsigotoaddpを受け取りました。");
							}else{
							$zsigotoaddp = $zsigotoadd * 100;
							$p_syoji_kin{$f_id} += $zsigotoaddp;
							$p_ex_tiryoku{$f_id}+= int(rand(2));
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【万\能型/巡察】：資金調達のため賭博場の用心棒を請け負いました。$t_name{$ft_id}の治安が$zsigotoadd悪化し、謝礼として金$zsigotoaddpを受け取りました。");

							}
						}else{
							$p_ex_tousotu{$f_id}+= int(rand(5));
							$zsigotoadd = int( ($p_tousotu{$f_id}-(1.3 * ($keika_nen+1))) /30 + rand( ($p_tousotu{$f_id}-(1.3 * ($keika_nen+1))) ) / 20 + rand(4)) * 100;
						if($zsigotoadd < 150){
							$zsigotoadd = 150;
						}
							$p_syoji_kome{$f_id} += $zsigotoadd;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【万\能型/巡察】：街を見回りました。民から貢物として米$zsigotoaddを受け取りました。");
									if(1 > int(rand(20))){
							$kitw = int(rand(10));
							$kitw = "8$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の民から貢物として<span class=\"cFF0000\">$gitem[$kitw]</span>を貰い受ける。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:よく見ると、貢物の中に<span class=\"cFF0000\">$gitem[$kitw]</span>が入っていました。");
									}
						}
			}
#############
	}


							if($t_tian_ti{$ft_id} < 0){
								$t_tian_ti{$ft_id} = 0;
							}elsif($t_tian_ti{$ft_id} > 100){
								$t_tian_ti{$ft_id} = 100;
							}

						$p_kunkou{$f_id} += 30;
						
					$p_kunino{0}= 0;
					$p_p_b_a{0}=$p_name{0};
					$p_buryoku{0}=1;
					$p_tiryoku{0}=1;
					$p_tousotu{0}=1;

}


########

sub DEF_M {
		if ($defadddbdb8) {
		$add_id="$defaddid<";
@{"DEF_L_d_$defadddbdb9\_$defadddbdb8"} = grep( !/^$add_id/,@{"DEF_L_d_$defadddbdb9\_$defadddbdb8"} );
$def_kazu{"d_$defadddbdb9\_$defadddbdb8"} -=1;

		}
	push(@{"DEF_L_d_$defadditi\_$defaddpos"},"$defaddid<>$defaddname<>$defadditi<>$defaddpos<>$defaddcon<>$defaddhei<><><><>\n");
$def_kazu{"d_$defadditi\_$defaddpos"} ++;


}

sub DEF_N {
		$p_syubi_tosi{$f_id}=int($p_syubi_tosi{$f_id});
		$p_syubi_eria{$f_id}=int($p_syubi_eria{$f_id});
	push(@{"DEF_L_d_$p_syubi_tosi{$f_id}\_$p_syubi_eria{$f_id}"},"$p_id{$f_id}<>$p_name{$f_id}<>$p_syubi_tosi{$f_id}<>$p_syubi_eria{$f_id}<>$p_kunino{$f_id}<>$p_heisyu{$f_id}<><><><>\n");
$def_kazu{"d_$p_syubi_tosi{$f_id}\_$p_syubi_eria{$f_id}"} ++;
}
########

sub DEF_D {
		if ($defadddbdb8) {
		$add_id="$defaddid<";
@{"DEF_L_d_$defadddbdb9\_$defadddbdb8"} = grep( !/^$add_id/,@{"DEF_L_d_$defadddbdb9\_$defadddbdb8"} );
$def_kazu{"d_$defadddbdb9\_$defadddbdb8"} -=1;

		}
}

############

#######################
sub CD_IDkaikon {

						$p_mikoudou_t{$f_id}=0;
							$addmaxc = "";
							$addmax = $t_nougyou_max{$ft_id};
						if($p_syoji_kin{$f_id}<50){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:資金不足で実行できませんでした。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif($t_nougyou_ti{$ft_id} >= $addmax and int(rand($jfi)) > 10){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:これ以上農業値は上昇しないようです。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}else{
					$add_b_kaikon{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_seiji{$f_id} * 2) + $p_jinbou{$f_id} + ($p_doubutu_tekisei{$f_id} * 2) + ($p_hatumei{$f_id} * 2) + $p_nintai{$f_id} + $p_seisin{$f_id} + $p_sinkousin{$f_id})*0.1));
					$add_naisei += $add_b_kaikon{$f_id};
							$zsigotoadd = int(($p_tiryoku{$f_id}+$add_naisei + rand(40))/14 + rand($p_tiryoku{$f_id}+$add_naisei) / 20);

						if($k_yakusyoku_id{$fk_id}[5] eq $f_id or $k_yakusyoku_id{$fk_id}[26] eq $f_id){
							$zsigotoadd += 6;
						}

							$atted = $t_nougyou_ti{$ft_id};
							$hann = "";
							$maxhann = "";
							$t_nougyou_ti{$ft_id} += $zsigotoadd;
							$p_syoji_kin{$f_id} -= 50;
							if($t_nougyou_ti{$ft_id} > $addmax){
								$t_nougyou_ti{$ft_id} = $addmax;
								if($atted < $addmax){$zsigotoadd = $addmax - $atted;
							$p_ex_tiryoku{$f_id}+= int(rand(3))+1;
							$maxhann = "MAX値に到達しました！";
								}else{
							$maxhann = "効果はありませんでした";$zsigotoadd = 0;
									if($jfi>129){
							$p_ex_tiryoku{$f_id}+= int(rand(2));
									}
								}
							}else{

$p_ex_karumalc{$f_id} += 0;
$p_ex_karumald{$f_id} += 0;
$p_gogyou_ka{$f_id} += 2;
$p_gogyou_sui{$f_id} -= 3;
$p_gogyou_moku{$f_id} += 0;
$p_gogyou_kin{$f_id} += 0;
$p_gogyou_do{$f_id} += 1;
							$p_ex_tiryoku{$f_id}+= int(rand(3));
							$p_ex_buryoku{$f_id}+= int(rand(2));
								$wadd = 24 + int($t_nougyou_ti{$ft_id} * 50 / $t_nougyou_max{$ft_id});
			if($t_nougyou_ti{$ft_id} < int($t_nougyou_max{$ft_id} / 2) and 1 > int(rand(5))){
								$zsigotoaddm = $zsigotoadd * 100;
							$p_syoji_kome{$f_id} += $zsigotoaddm;
							$hann = "農地開拓の謝礼として領民から米$zsigotoaddmを受け取りました。";
			}elsif($jfi>129 and int(rand($wadd)) < 1){
								$wadd = $zsigotoadd + $item_seinou{$p_syomotu{$f_id}};
							@DEF_LISTW=();
							open(IN,"./w_db/mati/g$p_taizai_iti{$f_id}.cgi");
							@DEF_LISTW = <IN>;
							close(IN);

							unshift(@DEF_LISTW,"$f_id<>$p_name{$f_id}<>1<>$wadd<>$p_kunino{$f_id}<>0<>\n");
							open(OUT,">./w_db/mati/g$p_taizai_iti{$f_id}.cgi");
							print OUT @DEF_LISTW;
							close(OUT);
							$hann = "来るべき戦に備え、農地の片隅に落とし穴の罠を仕掛けました。";
							$p_ex_tiryoku{$f_id}+= int(rand(5))+7;
							$p_kunkou{$f_id} += 15;
			}elsif(1 > int(rand(120))){
							$kitw = int(rand(10));
							$kitw = "3$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}にて農作業の最中に<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:農作業の最中に<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
			}

							}
							$p_kunkou{$f_id} += 30;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の農業を<span class=\"cFF0000\">+$zsigotoadd</span>開発しました。$atted⇒$t_nougyou_ti{$ft_id}/$addmax$addmaxc。$maxhann$hann");
							$p_ex_tiryoku{$f_id}++;
						}
}

#######################
sub CD_IDsyougyou {
						$p_mikoudou_t{$f_id}=0;
							$addmaxc = "";
							$addmax = $t_syougyou_max{$ft_id};
						if($p_syoji_kin{$f_id}<50){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:資金不足で実行できませんでした。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif($t_syougyou_ti{$ft_id} >= $addmax and int(rand($jfi)) > 10){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:これ以上商業値は上昇しないようです。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}else{
					$add_b_syougyou{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_seiji{$f_id} * 2) + $p_sinyou{$f_id} + ($p_kyouyou{$f_id} * 2) + ($p_syakousei{$f_id} * 2) + $p_kotobadakumi{$f_id} + $p_excalm{$f_id} + $p_exluck{$f_id})*0.1));
					$add_naisei += $add_b_kaikon{$f_id};
							$zsigotoadd = int(($p_tiryoku{$f_id}+$add_naisei + rand(40))/14 + rand($p_tiryoku{$f_id}+$add_naisei) / 20);
						if($k_yakusyoku_id{$fk_id}[5] eq $f_id or $k_yakusyoku_id{$fk_id}[26] eq $f_id){
							$zsigotoadd += 6;
						}
							$hann = "";
							$maxhann = "";
							$atted = $t_syougyou_ti{$ft_id};
							$t_syougyou_ti{$ft_id} += $zsigotoadd;
							$p_syoji_kin{$f_id} -= 50;
							if($t_syougyou_ti{$ft_id} > $addmax){
								$t_syougyou_ti{$ft_id} = $addmax;
								if($atted < $addmax){$zsigotoadd = $addmax - $atted;
							$p_ex_tiryoku{$f_id}+= int(rand(3))+1;
							$maxhann = "MAX値に到達しました！";
								}else{
							$maxhann = "効果はありませんでした";$zsigotoadd = 0;
									if($jfi>129){
							$p_ex_tiryoku{$f_id}+= int(rand(2));
									}
								}
							}else{

$p_ex_karumalc{$f_id} += 0;
$p_ex_karumald{$f_id} += 0;
$p_gogyou_ka{$f_id} -= 3;
$p_gogyou_sui{$f_id} += 1;
$p_gogyou_moku{$f_id} += 0;
$p_gogyou_kin{$f_id} += 2;
$p_gogyou_do{$f_id} += 0;
							$p_ex_tiryoku{$f_id}+= int(rand(3));
							$p_ex_tousotu{$f_id}+= int(rand(2));
								$wadd = 24 + int($t_syougyou_ti{$ft_id} * 50 / $t_syougyou_max{$ft_id});
			if($t_syougyou_ti{$ft_id} < int($t_syougyou_max{$ft_id} / 2) and 1 > int(rand(5))){
								$zsigotoaddm = $zsigotoadd * 100;
							$p_syoji_kin{$f_id} += $zsigotoaddm;
							$hann = "商業発展の謝礼として商人から金$zsigotoaddmを受け取りました。";
			}elsif($jfi>129 and int(rand($wadd)) < 1){
								$wadd = $zsigotoadd + $item_seinou{$p_syomotu{$f_id}};
							@DEF_LISTW=();
							open(IN,"./w_db/mati/g$p_taizai_iti{$f_id}.cgi");
							@DEF_LISTW = <IN>;
							close(IN);

							unshift(@DEF_LISTW,"$f_id<>$p_name{$f_id}<>1<>$wadd<>$p_kunino{$f_id}<>0<>\n");
							open(OUT,">./w_db/mati/g$p_taizai_iti{$f_id}.cgi");
							print OUT @DEF_LISTW;
							close(OUT);
							$hann = "来るべき戦に備え、街の片隅に落とし穴の罠を仕掛けました。";
							$p_ex_tiryoku{$f_id}+= int(rand(5))+7;
							$p_kunkou{$f_id} += 15;
			}elsif(1 > int(rand(120))){
							$kitw = int(rand(10));
							$kitw = "4$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}にて商人から<span class=\"cFF0000\">$gitem[$kitw]</span>を貰い受ける。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:とある商人から<span class=\"cFF0000\">$gitem[$kitw]</span>を貰い受けました。");
			}

							}
							$p_kunkou{$f_id} += 30;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の商業を<span class=\"cFF0000\">+$zsigotoadd</span>発展させました。$atted⇒$t_syougyou_ti{$ft_id}/$addmax$addmaxc。$maxhann$hann");
							$p_ex_tiryoku{$f_id}++;
						}
}
#######################
sub CD_IDbouei {
						$p_mikoudou_t{$f_id}=0;
						if($p_syoji_kin{$f_id}<50){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:資金不足で実行できませんでした。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif($p_kunizokusei{$f_id} and $t_zoku_bouei_ti{$ft_id} >= $t_zoku_bouei_max{$ft_id} and int(rand($jfi)) > 10){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:これ以上賊砦の防衛力は上昇しないようです。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif(!$p_kunizokusei{$f_id} and $t_siro_bouei_ti{$ft_id} >= $t_siro_bouei_max{$ft_id} and int(rand($jfi)) > 10){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:これ以上防衛力は上昇しないようです。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}else{
					$add_b_koyou{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_tyoukyou{$f_id} * 2) + $p_jinbou{$f_id} + ($p_ihuu{$f_id} * 2) + ($p_syakousei{$f_id} * 2) + $p_karisuma{$f_id} + $p_yousi{$f_id} + $p_kotobadakumi{$f_id})*0.1));
					$add_naisei += $add_b_koyou{$f_id};
							$zsigotoadd = int((($p_sougou{$f_id}+$add_naisei + rand(40))/14 + rand($p_sougou{$f_id}+$add_naisei) / 20) * 0.7);
						if($k_yakusyoku_id{$fk_id}[6] eq $f_id or $k_yakusyoku_id{$fk_id}[15] eq $f_id or $k_yakusyoku_id{$fk_id}[20] eq $f_id or $k_yakusyoku_id{$fk_id}[21] eq $f_id){
							$zsigotoadd += 6;
						}
							$hann = "";
							$maxhann = "";
						if($p_kunizokusei{$f_id}){
							$atted = $t_zoku_bouei_ti{$ft_id};
							$attedmax = $t_zoku_bouei_max{$ft_id};
						}else{
							$atted = $t_siro_bouei_ti{$ft_id};
							$attedmax = $t_siro_bouei_max{$ft_id};
						}
							$attedw= $atted +$zsigotoadd;
							$p_syoji_kin{$f_id} -= 50;
							if($attedw > $attedmax){
								$attedw = $attedmax;
								if($atted < $attedmax){$zsigotoadd = $attedmax - $atted;
							$kexaddw+= int(rand(3))+1;
							$maxhann = "MAX値に到達しました！";
								}else{
							$maxhann = "効果はありませんでした";$zsigotoadd = 0;
									if($jfi>129){
							$kexaddw+= int(rand(2));
									}
								}
							}else{
$p_ex_karumalc{$f_id} += 1;
$p_ex_karumald{$f_id} += 0;
$p_gogyou_ka{$f_id} += 0;
$p_gogyou_sui{$f_id} += 0;
$p_gogyou_moku{$f_id} += 0;
$p_gogyou_kin{$f_id} += 0;
$p_gogyou_do{$f_id} += 0;
							$kexaddw+= int(rand(3));
							$p_kunkou{$f_id} += 30;
								$wadd = 24 + int($attedw * 50 / $attedmax);
			if($jfi>129 and int(rand($wadd)) < 1 and !$p_kunizokusei{$f_id}){
								$wadd = $zsigotoadd + $item_seinou{$p_syomotu{$f_id}};
							@DEF_LISTW=();
							open(IN,"./w_db/mati/s$p_taizai_iti{$f_id}.cgi");
							@DEF_LISTW = <IN>;
							close(IN);

							unshift(@DEF_LISTW,"$f_id<>$p_name{$f_id}<>1<>$wadd<>$p_kunino{$f_id}<>0<>\n");
							open(OUT,">./w_db/mati/s$p_taizai_iti{$f_id}.cgi");
							print OUT @DEF_LISTW;
							close(OUT);
							$hann = "来るべき戦に備え、城の片隅に落とし穴の罠を仕掛けました。";
							$kexaddw+= int(rand(5))+7;
							$p_kunkou{$f_id} += 15;
			}elsif(1 > int(rand(120))){
							$kitw = int(rand(9));
							$kitw = "1$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}にて防衛力強化の作業中に<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:防衛力強化の作業中に<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
			}
							}
							$p_kunkou{$f_id} += 30;
							$zokucome = "";
						if($p_kunizokusei{$f_id}){
									if(!int(rand(5))){
									$add_1 = $zsigotoadd * 30;
									$p_syoji_kin{$f_id} += $add_1;
							$hann = "<br />天子「$k_tensi_name{$p_kunino{$f_id}}」より、褒美として金<span class=\"cFF0000\">+$add_1</span>が手渡されました。";
									}
							$t_zoku_bouei_ti{$ft_id} = $attedw;
							$zokucome = "（賊砦）";
						}else{
							$t_siro_bouei_ti{$ft_id} = $attedw;
						}
							$kexaddw++;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}$zokucomeの防衛力を<span class=\"cFF0000\">+$zsigotoadd</span>強化しました。$atted⇒$attedw/$attedmax。$maxhann$hann");
			if($jfi>159 or ($jfi>129 and $jfl>129)){
							$p_ex_tiryoku{$f_id}+= $kexaddw;
			}elsif($jfs>159 or ($jfi>129 and $jfs>129)){
							$p_ex_buryoku{$f_id}+= $kexaddw;
			}elsif($jfl>159 or ($jfl>129 and $jfs>129)){
							$p_ex_tousotu{$f_id}+= $kexaddw;
			}else{
							$kexaddw= int(rand($kexaddw+1));
							$p_ex_tousotu{$f_id}+= $kexaddw;
							$p_ex_buryoku{$f_id}+= $kexaddw;
							$p_ex_tiryoku{$f_id}+= $kexaddw;
			}
						}
}


#######################
sub CD_IDhodokosi {
						$p_mikoudou_t{$f_id}=0;
						if($p_syoji_kome{$f_id}<50){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:米不足で実行できませんでした。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif($t_tian_ti{$ft_id} >= 100 and int(rand($p_jinbou{$f_id})) > 10){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:これ以上治安は上昇しないようです。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}else{
					$add_b_bohei{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_jinbou{$f_id} * 2) + $p_sinyou{$f_id} + ($p_ihuu{$f_id} * 2) + ($p_syakousei{$f_id} * 2) + $p_karisuma{$f_id} + $p_yousi{$f_id} + $p_kotobadakumi{$f_id})*0.1));
					$add_naisei += $add_b_bohei{$f_id};
							$zsigotoadd = int(($p_jinbou{$f_id} * 0.5 + $add_naisei + rand(40))/14 + rand($p_jinbou{$f_id}+$add_naisei) / 20);
						if($k_yakusyoku_id{$fk_id}[5] eq $f_id){
							$zsigotoadd += 3;
						}

							$hann = "";
							$maxhann = "";
							$atted = $t_tian_ti{$ft_id};


							if($t_tian_ti{$ft_id} < 100){
							$p_ex_tousotu{$f_id}++;
							}
							$t_tian_ti{$ft_id} += $zsigotoadd;
							$p_syoji_kome{$f_id} -= 50;
							if($t_tian_ti{$ft_id} > 100){
								$t_tian_ti{$ft_id} = 100;

								if($atted < 100){$zsigotoadd = 100 - $atted;
							$maxhann = "MAX値に到達しました！";
									if($jfl>129){
							$p_ex_tousotu{$f_id}+= int(rand(2));
									}
								}else{
							$maxhann = "効果はありませんでした";$zsigotoadd = 0;
								}


							}else{
$p_ex_karumalc{$f_id} += 0;
$p_ex_karumald{$f_id} += 5;
$p_gogyou_ka{$f_id} += 0;
$p_gogyou_sui{$f_id} += 0;
$p_gogyou_moku{$f_id} -= 3;
$p_gogyou_kin{$f_id} += 1;
$p_gogyou_do{$f_id} += 2;
							$p_ex_tousotu{$f_id}+= int(rand(3));
							$p_ex_tiryoku{$f_id}+= int(rand(2));
							}
							$p_kunkou{$f_id} += 30;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の治安が<span class=\"cFF0000\">+$zsigotoadd</span>上がりました。$atted⇒$t_tian_ti{$ft_id}/100。$maxhann$hann");
							$p_ex_jinbou{$f_id}++;
						}

}

#######################
sub CD_IDkhodokosi {
						$p_mikoudou_t{$f_id}=0;
						if($p_syoji_kome{$f_id}<5000){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:米不足で実行できませんでした。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif($t_tian_ti{$ft_id} >= 100 and int(rand($p_jinbou{$f_id})) > 10){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:これ以上治安は上昇しないようです。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}else{
							$zsigotoadd = 30;
						if($k_yakusyoku_id{$fk_id}[5] eq $f_id){
							$zsigotoadd += 9;
						}
							$hann = "";
							$maxhann = "";
							$atted = $t_tian_ti{$ft_id};

							if($t_tian_ti{$ft_id} < 80){
							$p_ex_tousotu{$f_id}++;
							$p_ex_tousotu{$f_id}+= int(rand(2));
							$p_ex_tiryoku{$f_id}+= int(rand(2));
							$p_kunkou{$f_id} += 30;
							}
							$t_tian_ti{$ft_id} += $zsigotoadd;
							$p_syoji_kome{$f_id} -= 5000;
							if($t_tian_ti{$ft_id} > 100){
								$t_tian_ti{$ft_id} = 100;

								if($atted < 100){$zsigotoadd = 100 - $atted;
							$maxhann = "MAX値に到達しました！";
									if($jfl>129){
							$p_ex_tousotu{$f_id}+= int(rand(2));
									}
								}else{
							$maxhann = "効果はありませんでした";$zsigotoadd = 0;
								}

							}else{
$p_ex_karumalc{$f_id} += 0;
$p_ex_karumald{$f_id} += 15;
$p_gogyou_ka{$f_id} += 0;
$p_gogyou_sui{$f_id} += 0;
$p_gogyou_moku{$f_id} -= 9;
$p_gogyou_kin{$f_id} += 3;
$p_gogyou_do{$f_id} += 6;
							$p_ex_tousotu{$f_id}+= int(rand(10));
							$p_kunkou{$f_id} += 40;
							$p_ex_jinbou{$f_id} += 2;
							}
							$p_kunkou{$f_id} += 30;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の治安が<span class=\"cFF0000\">+$zsigotoadd</span>上がりました。$atted⇒$t_tian_ti{$ft_id}/100。$maxhann$hann");
							$p_ex_jinbou{$f_id} += 2;
						}
}

#######################
sub CD_IDtyouhei2 {

							$cd_op2d = $cd_op2;
						$p_mikoudou_t{$f_id}=0;
		if($cd_op2 < 0 and abs($cd_op2) > $p_heisisuu{$f_id}){
$cd_op2 = 0 - $p_heisisuu{$f_id};
		}
	if($p_hjijyou_w{$f_id}[1] and $cd_op1 ne $p_heisyu{$f_id}){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$p_name{$f_id}の$SOL_TYPE[$p_heisyu{$f_id}]部隊は$HEIIJYOU[1]状態なため兵種を変えることができません。。（残り$p_hjijyouc{$f_id}[$p_hjijyou_no{$f_id}[1]]ターン）");
									&NURUPO;
	}elsif($cd_op2 < 0){
							$comnum = abs(int($cd_op2));
							$solw = $p_heisisuu{$f_id};
								if($comnum > $solw){
							$comnum = $solw;
								}
							$t_ryoumin_suu{$ft_id} += $comnum;
							$solpw = $SOL_PRICE[$cd_op1];
								$a_mes1 = "";

								if($p_heisisuu{$f_id}){
									$wadd = int($comnum * $SOL_PRICE[$p_heisyu{$f_id}] * 0.5);
								$a_mes1 = "$SOL_TYPE[$p_heisyu{$f_id}] $comnumを金$waddで売却し、";

							$p_syoji_kin{$f_id} += $wadd;
							$p_heisisuu{$f_id} -= $comnum;
								}
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$a_mes1$SOL_TYPE[$p_heisyu{$f_id}]を<span class=\"cFF0000\">$comnum</span>解雇しました。 $solw⇒$p_heisisuu{$f_id}。領民が$comnum増加しました。");
							$p_ex_buryoku{$f_id}++;
							if(abs($cd_op2) > int($p_tousotu{$f_id} / 2)){
							$p_ex_buryoku{$f_id}+=1;
							}
	}else{
################

			$thadd = 0;
		$cd_op0z=$p_taizai_iti{$f_id};
	if(!$p_kunizokusei{$f_id} and $k_kunino{$fk_id}){

	if($p_kunino{$f_id} eq $t_kunino{$ft_id}){
		if(!-e "./w_db/mati/tyouheihit$cd_op0z.cgi"){

################


		$tyohit3=0;
		
		&KOUSEN_AITE_KOKUSAKU_HIT("$toyhit3","10","$fk_id");
		$toyhit3=$kousen_aite_hit;
		if(!$tyohit3 and $cd_op0z ne $k_kouhou_tyouhei{$fk_id}[0] and $cd_op0z ne $k_kouhou_tyouhei{$fk_id}[1] and $cd_op0z ne $k_kouhou_tyouhei{$fk_id}[2] and $cd_op0z ne $k_kouhou_tyouhei{$fk_id}[3] and $cd_op0z ne $k_kouhou_tyouhei{$fk_id}[4]){



		$tyohit1=0;
		$tyohit2=0;
	foreach(@{$t_setuzoku_saki{$ft_id}}){
		if("$_" ne ""){
							$dt_id = $_;
			if($p_kunino{$f_id} eq $t_kunino{$dt_id}){
		$tyohit1=1;
			}else{
		&KOUSEN_AITE_HIT("$tyohit2","$t_kunino{$dt_id}","$fk_id");
		$tyohit2=$kousen_aite_hit;
		$tyohit_add{$k_kokusaku{$fk_id}}=$tyohit2;
		$tyohit_add{10}=1;
		$tyohit2=$tyohit_add{$k_kokusaku{$k_kunino{$fk_id}}};
			}
		
		}
	}
			if($tyohit2 == 0){
			if($tyohit1 == 1){
			$thadd = 1;
		open(OUT,">./w_db/mati/tyouheihit$cd_op0z.cgi");
		print OUT $thadd;
		close(OUT);
			}
			}
		}

			if(!$thadd){
			$thadd = 0;
		open(OUT,">./w_db/mati/tyouheihit$cd_op0z.cgi");
		print OUT $thadd;
		close(OUT);
			}
################

		}else{
	open(IN,"./w_db/mati/tyouheihit$cd_op0z.cgi");
	$thadd = <IN>;
	close(IN);
		}

	}else{
			$thadd = 2;
	}
	}else{
			$thadd = 0;
	}
################

########
	if($thadd){
		if($thadd eq "1"){
		$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【徴兵】：$t_name{$ft_id}は交戦相手国に隣接していません。隣接自都市が存在します。この後方都市での徴兵は許可されていません。替わりにその場で巡察を行いました。");
		&R_JYUNSATU;
		}else{
		$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【徴兵】：$t_name{$ft_id}は他国の領土です。この都市での徴兵は許可されていません。替わりにその場で巡察を行いました。");
		&R_JYUNSATU;
		}
	}else{
########

$gijyutuw_add = $t_gijyutu_ti{$ft_id};
$add_siyuu_bc = "";
		if($p_kunizokusei{$f_id}){
$gijyutuw_add = 500;
		}elsif($k_kokkyou{$p_kunino{$f_id}} eq "9"){
	if($k_kokkyou_keika_nen{$p_kunino{$f_id}} > 5){
$gijyutuw_add = 999;
$add_siyuu_bc = "（$KOKKYOU[$k_kokkyou{$p_kunino{$f_id}}]ボーナス・技術Max換算）";
	}
		}


	$t_tiiki_hei_syu{$ft_id}[10]=$SOL_MINZOKU[$p_minzoku{$f_id}];
if($k_kokkyou{$fk_id} eq "1"){
	if($k_kokkyou_keika_nen{$fk_id} > 10){
	$t_tiiki_hei_syu{$ft_id}[11]=48;
	}
}elsif($k_kokkyou{$fk_id} eq "4"){
	if($k_kokkyou_keika_nen{$fk_id} > 10){
	$t_tiiki_hei_syu{$ft_id}[11]=25;
	}
}elsif($k_kokkyou{$fk_id} eq "7"){
	if($k_kokkyou_keika_nen{$fk_id} > 10){
	$t_tiiki_hei_syu{$ft_id}[11]=83;
	}
}elsif($k_kokkyou{$fk_id} eq "9"){
	if($k_kokkyou_keika_nen{$fk_id} > 10){
	$t_tiiki_hei_syu{$ft_id}[11]=96;
	}
}elsif($k_kokkyou{$fk_id} eq "10"){
	if($k_kokkyou_keika_nen{$fk_id} > 10){
	$t_tiiki_hei_syu{$ft_id}[11]=82;
	}
}elsif($k_kokkyou{$fk_id} eq "11"){
	if($k_kokkyou_keika_nen{$fk_id} > 5){
	$t_tiiki_hei_syu{$ft_id}[11]=81;
	}
}elsif($k_kokkyou{$fk_id} eq "12"){
	if($k_kokkyou_keika_nen{$fk_id} > 5){
	$t_tiiki_hei_syu{$ft_id}[11]=49;
	}
}elsif($k_kokkyou{$fk_id} eq "13"){
	if($k_kokkyou_keika_nen{$fk_id} > 5){
	$t_tiiki_hei_syu{$ft_id}[11]=33;
	}
}

if(($p_heisyu{$f_id} eq "14" and $p_heisisuu{$f_id} < 1) or $p_heisyu{$f_id} eq "95"){
	$t_tiiki_hei_syu{$ft_id}[12]=95;
}
	$hit = 0;

	if($SOL_TYPE[$cd_op1] and $gijyutuw_add >= $SOL_TEC[$cd_op1]){ 
		if($cd_op1 >= 21){ 
	foreach(@{$t_tiiki_hei_syu{$ft_id}}){
		if($cd_op1 eq "$_"){ 
	$hit = 1;
		}
	}
		}else{
	$hit = 1;
		}

	}

	if($cd_op1 eq "95"){
		if($p_heisyu{$f_id} eq "95" and $p_heisisuu{$f_id} > 5){
$cd_op2 = int($cd_op2*0.5);
$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【徴兵】$SOL_TYPE[$cd_op1]徴兵の布令を出しましたが反応は少なく半数しか集まりませんでした。");
		}else{
$cd_op2 = int(rand($cd_op2))+1;
$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【徴兵】$SOL_TYPE[$cd_op1]徴兵の布令を出しましたが反応は少なく少量しか集まりませんでした。");
		}
	}

							$zbpri = $t_tian_ti{$ft_id};
				$kkcr = int(rand(240));

							$solpw = $SOL_PRICE[$cd_op1];
						if($kkcr < 1 and $t_tian_ti{$ft_id} > 96){
								$cd_op1 = 91;
							$solpw = 1;
						}elsif($kkcr < 1 and $t_gijyutu_ti{$ft_id} > 970){
								$cd_op1 = 92;
							$solpw = 1;
						}elsif($kkcr < 3 and $t_tian_ti{$ft_id} < 20){
								$cd_op1 = 93;
							$solpw = 1;
						}elsif($kkcr < 1 and $p_heisyu{$f_id} eq "14" and $p_heisisuu{$f_id} < 1){
								$cd_op1 = 94;
							$solpw = 1;
						}
	$get_sol[0] = $p_tousotu{$f_id} + int($p_sougou{$f_id}*0.1);
	$get_sol[1] = int($p_tiryoku{$f_id}*0.5) + int($p_sougou{$f_id}*0.1);
	$get_sol[2] = $p_buryoku{$f_id} + int($p_sougou{$f_id}*0.1);
									$p_heisisuu_max{$f_id} = $get_sol[$SOL_MAXT[$cd_op1]];

								if($p_heisyu{$f_id} eq $cd_op1){
								if($cd_op2 + $p_heisisuu{$f_id} > $p_heisisuu_max{$f_id}){
									$cd_op2 = $p_heisisuu_max{$f_id} - $p_heisisuu{$f_id};
								}
								}else{
								if($cd_op2 > $p_heisisuu_max{$f_id}){
									$cd_op2 = $p_heisisuu_max{$f_id};
								}
								}


	if($p_heisisuu_max{$f_id} <= $p_heisisuu{$f_id} and $cd_op1 eq $p_heisyu{$f_id}){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【徴兵】：兵士数が最大です。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
	}elsif($p_syoji_kin{$f_id} < $cd_op2 * $SOL_PRICE[$cd_op1]){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【徴兵】：所持金がたりません。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
	}elsif($t_ryoumin_suu{$ft_id} < $cd_op2 * 10){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【徴兵】：領民がたりません。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
	}elsif(!$hit){$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【徴兵】：$t_name{$ft_id}（技術現在値$t_gijyutu_ti{$ft_id}）では$SOL_TYPE[$cd_op1]を雇えませんでした。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
	}else{

								$hit = 0;
			if($k_kokkyou{$t_kunino{$ft_id}} eq "10"){
	if($k_kokkyou_keika_nen{$t_kunino{$ft_id}} > 5){
								$hit = 1;
	}
			}
								$a_mes1 = "";
								$wadd = 0;
							$solw = $p_heisisuu{$f_id};
							if($p_heisyu{$f_id} eq $cd_op1){
	if($t_tian_ti{$ft_id} == 100 and $cd_op1 == 9 and !$p_kunizokusei{$f_id} and !$hit){
									$cd_op2 =  int($cd_op2 / 2);$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【徴兵】：$t_name{$ft_id}は治安が良すぎです。治安$t_tian_ti{$ft_id}。$SOL_TYPE[$cd_op1]は半分しか集まりませんでした。"); 
	}
								$p_heisisuu{$f_id} += $cd_op2;
							}else{
								
								if($p_heisisuu{$f_id}){
									$wadd = int($p_heisisuu{$f_id} * $SOL_PRICE[$p_heisyu{$f_id}] * 0.5);
								$a_mes1 = "$SOL_TYPE[$p_heisyu{$f_id}] $p_heisisuu{$f_id}を金$waddで売却し、";
									$p_heisisuu{$f_id} = 0;
									$solw = 0;
								}
	if($t_tian_ti{$ft_id} == 100 and $cd_op1 == 9 and !$p_kunizokusei{$f_id} and !$hit){
									$cd_op2 =  int($cd_op2 / 2);$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【徴兵】：$t_name{$ft_id}は治安が良すぎです。治安$t_tian_ti{$ft_id}。$SOL_TYPE[$cd_op1]は半分しか集まりませんでした。"); 
	}
								$p_heisisuu{$f_id} = $cd_op2;
$p_ex_karumalc{$f_id} -= 5;
$p_ex_karumald{$f_id} += 0;
							}
								$cd_op2h = int($cd_op2 / 2);
							$p_h_hirou{$f_id} += int((0 - $p_h_hirou{$f_id}) * ($cd_op2 + 1) / $p_heisisuu_max{$f_id});
							$p_hei_siki{$f_id} += int((50 - $p_hei_siki{$f_id}) * ($cd_op2h + 1) / $p_heisisuu_max{$f_id});

							$p_kunren{$f_id} -= int(100 * $cd_op2 / $p_heisisuu_max{$f_id});
							if($p_kunren{$f_id} < 0){
								$p_kunren{$f_id} = 0;
							}

							$p_heisyu{$f_id} = $cd_op1;
							$p_syoji_kin{$f_id} -= $cd_op2 * $solpw;
							$p_syoji_kin{$f_id} += $wadd;
#				if($k_kokusaku{$p_kunino{$f_id}} eq "1"){
							$p_syoji_kin{$f_id} += int($cd_op2 * $solpw * 0.2);
#				}

					$add_b_koyou{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_tyoukyou{$f_id} * 2) + $p_jinbou{$f_id} + ($p_ihuu{$f_id} * 2) + ($p_syakousei{$f_id} * 2) + $p_karisuma{$f_id} + $p_yousi{$f_id} + $p_kotobadakumi{$f_id})*0.1));
					$add_b_teimu{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_tyoukyou{$f_id} * 2)+ $p_jyujyutu{$f_id} + ($p_doubutu_tekisei{$f_id} * 2) + ($p_ihuu{$f_id} * 2) + $p_karisuma{$f_id} + $p_seisin{$f_id} + $p_syuutyuu{$f_id})*0.1));
					$add_naisei2[$SOL_ZOKUSEIT[$p_heisyu{$f_id}]] = $add_b_koyou{$f_id};
					$add_naisei2[9] = int(($add_b_koyou{$f_id} + $add_b_teimu{$f_id})*0.5);
					$add_naisei2[10] = int(($add_b_koyou{$f_id} + $add_b_teimu{$f_id})*0.5);
					$add_naisei2[21] = int(($add_b_koyou{$f_id} + $add_b_teimu{$f_id})*0.5);
					$add_naisei += $add_naisei2[$SOL_ZOKUSEIT[$p_heisyu{$f_id}]];
							$cd_op2w = int($cd_op2 * 200 / $sougouno1) - int(rand($add_naisei));
					if($cd_op2w < 0){
							$cd_op2w = 0;
					}
							$comnum = int(rand($cd_op2w * 2));
				if(!$p_kunizokusei{$f_id}){
					if($t_ryoumin_suu{$ft_id} > 700000){
							$comnum = $cd_op2w * 120 + int(rand($cd_op2w * 60));
					}elsif($t_ryoumin_suu{$ft_id} > 100000){
							$comnum = $cd_op2w * 90 + int(rand($cd_op2w * 20));
					}elsif($t_ryoumin_suu{$ft_id} > 50000){
							$comnum = $cd_op2w * 20 + int(rand($cd_op2w * 10));
					}elsif($t_ryoumin_suu{$ft_id} > 30000){
							$comnum = $cd_op2w * 8 + int(rand($cd_op2w * 4));
					}elsif($t_ryoumin_suu{$ft_id} > 10000){
							$comnum = $cd_op2w * 4 + int(rand($cd_op2w * 2));
					}
				}
							$t_ryoumin_suu{$ft_id} -= $cd_op2 + $comnum;

							$add_tian_b = 0;
			if($jfl>159 or ($jfl>129 and $jfs>129)){
							if($p_kunren{$f_id} < 50){
								$p_kunren{$f_id} = 50;
							}
							$add_tian_b = int($cd_op2w / 24);
			}
								$a_mes2 = "";
					if($cd_op2w){
							$t_tian_ti{$ft_id} += $add_tian_b;
	if(!$p_kunizokusei{$f_id}){
							$p_kunkou{$f_id} += 20;
							$t_tian_ti{$ft_id} -= int($cd_op2w / 12)+1;
							if($cd_op2w > 99){
							$t_tian_ti{$ft_id} += int($cd_op2w / 100);
							}
									if(int(rand($town_get[$p_kunino{$f_id}] + 10)) < 3 and $t_tian_ti{$ft_id} > 59){
								$a_mes2 = "領民達は徴兵を快く承諾しました。";
							$t_ryoumin_suu{$ft_id} += $cd_op2 + $comnum;
							$comnum = 0;
							$t_ryoumin_suu{$ft_id} -= $cd_op2 + $comnum;
							$t_tian_ti{$ft_id} = $zbpri;
									}else{
								$a_mes2 = "領民が$comnum逃亡し";
									}
	}else{
							$p_kunkou{$f_id} += 20;
							$zokuadd = int($cd_op2w / 12)+1;
							if($cd_op2w > 99){
							$zokuadd -= int($cd_op2w / 100);
							}
								$a_mes2 = "$t_name{$ft_id}の商業と農業が$zokuadd低下。";
							$t_nougyou_ti{$ft_id} -= $zokuadd;
							$t_syougyou_ti{$ft_id} -= $zokuadd;
							if($t_nougyou_ti{$ft_id} < 0){
							$t_nougyou_ti{$ft_id} = 0;
							}
							if($t_syougyou_ti{$ft_id} < 0){
							$t_syougyou_ti{$ft_id} = 0;
							}
	}
					}else{
								$a_mes2 = "領民達は徴兵を快く承諾しました。";
					}

							if($zbpri < 50){
$p_ex_karumalc{$f_id} -= 5;
$p_ex_karumald{$f_id} += 0;
							}
$p_ex_karumalc{$f_id} += 1;
$p_ex_karumald{$f_id} -= 10;
			if($t_tian_ti{$ft_id} < 99 and $k_kokkyou{$t_kunino{$ft_id}} eq "14"){
	if($k_kokkyou_keika_nen{$t_kunino{$ft_id}} > 10){
								$t_tian_ti{$ft_id} = $zbpri;
	}
			}
							$zbpri = $zbpri - $t_tian_ti{$ft_id};
							if($t_tian_ti{$ft_id} < 0){
								$t_tian_ti{$ft_id} = 0;
							}
							if($t_tian_ti{$ft_id} > 100){
								$t_tian_ti{$ft_id} = 100;
							}
							if($t_ryoumin_suu{$ft_id} < 2){
								$t_ryoumin_suu{$ft_id} = 2;
								$t_tian_ti{$ft_id} = 100;
							}
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$a_mes1$SOL_TYPE[$p_heisyu{$f_id}]を<span class=\"cFF0000\">$cd_op2</span>徴兵しました。$a_mes3$SOL_TYPE[$p_heisyu{$f_id}] $solw⇒$p_heisisuu{$f_id}。$a_mes2治安が$zbpri減少しました。$add_siyuu_bc");
							$p_ex_buryoku{$f_id}++;
							if($cd_op2 > int($p_tousotu{$f_id} / 2)){
							$p_ex_buryoku{$f_id}+=1;
							}
						}
########
	}
########
	}
}
#######################
sub CD_IDkunren {
						$p_mikoudou_t{$f_id}=0;
$zaddwmax=100;
						if($p_buryoku{$f_id} > $zaddwmax){
$zaddwmax=$p_buryoku{$f_id};
						}
						if($p_kunren{$f_id} >= $zaddwmax){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【訓練】：訓練度が最大です。訓練を中止し、替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif($p_hjijyou_w{$f_id}[1]){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$p_name{$f_id}の$SOL_TYPE[$p_heisyu{$f_id}]部隊は$HEIIJYOU[1]状態なため訓練を行うことができません。。（残り$p_hjijyouc{$f_id}[$p_hjijyou_no{$f_id}[1]]ターン）");
									&NURUPO;
						}elsif(!$p_heisisuu{$f_id}){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:兵数が0なため訓練を行うことができません。。替わりにその場で巡察を行いました。");
									&NURUPO;
						}else{
							$atted = $p_kunren{$f_id};

					$add_b_youhei{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_tyoukyou{$f_id} * 2) + $p_jinbou{$f_id} + ($p_ihuu{$f_id} * 2) + ($p_kihaku{$f_id} * 2) + $p_karisuma{$f_id} + $p_syuutyuu{$f_id} + $p_exbrave{$f_id})*0.1));
					$add_b_tyoujyuu{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_tyoukyou{$f_id} * 2)+ $p_jyujyutu{$f_id} + ($p_doubutu_tekisei{$f_id} * 2) + ($p_kikensatti{$f_id} * 2) + $p_karisuma{$f_id} + $p_syuutyuu{$f_id} + $p_exbrave{$f_id})*0.1));
					$add_naisei2[$SOL_ZOKUSEIT[$p_heisyu{$f_id}]] = $add_b_youhei{$f_id};
					$add_naisei2[9] = $add_b_tyoujyuu{$f_id};
					$add_naisei2[10] = $add_b_tyoujyuu{$f_id};
					$add_naisei2[21] = $add_b_tyoujyuu{$f_id};
					$add_naisei += $add_naisei2[$SOL_ZOKUSEIT[$p_heisyu{$f_id}]];
						$zsigotoadd = int((($p_tousotu{$f_id} + $add_naisei) /7 + rand(($p_tousotu{$f_id} + $add_naisei) /20)) * $p_heisisuu_max{$f_id} / $p_heisisuu{$f_id})+ int(rand(3))+3;

						if($k_yakusyoku_id{$fk_id}[15] eq $f_id or $k_yakusyoku_id{$fk_id}[7] eq $f_id or $k_yakusyoku_id{$fk_id}[10] eq $f_id or $k_yakusyoku_id{$fk_id}[8] eq $f_id or $k_yakusyoku_id{$fk_id}[9] eq $f_id or $k_yakusyoku_id{$fk_id}[11] eq $f_id or $k_yakusyoku_id{$fk_id}[12] eq $f_id or $k_yakusyoku_id{$fk_id}[13] eq $f_id or $k_yakusyoku_id{$fk_id}[14] eq $f_id){
							$zsigotoadd = int(($zsigotoadd + 5) * 1.5);
						}

						$p_kunren{$f_id} += $zsigotoadd;

						if($p_kunren{$f_id} > $zaddwmax){
							$p_kunren{$f_id} = $zaddwmax;
						}
						$p_kunkou{$f_id} += 40;

$p_ex_karumalc{$f_id} += 2;
$p_ex_karumald{$f_id} += 0;
							$zaddw = $p_kunren{$f_id} - $atted;
						$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:兵士の訓練度が<span class=\"cFF0000\">+$zaddw</span>上昇しました。$atted⇒$p_kunren{$f_id}/$zaddwmax。");
			if($jfs>129 and $jfi>129){
						$p_ex_buryoku{$f_id}++;
							$p_ex_buryoku{$f_id}+= int(rand(3));
			}else{
						$p_ex_tousotu{$f_id}++;
							$p_ex_tousotu{$f_id}+= int(rand(3));
			}
						

						}
}
#######################
sub CD_IDsakujyo {
						$p_mikoudou_t{$f_id} = $TOUKETU_T - 5;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【ID凍結】：凍結ターンの残りが5に設定されました。以後、「休暇をとる」を5回連続実行するとID凍結となります。");

}
#######################
sub CD_IDentyou {
#									if("$k_kokui{$fk_id}" ne "$f_id"){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【凍結延長】：凍結ターンの残りが大幅に増加しました。");
						$p_mikoudou_t{$f_id} = 0 - ($TOUKETU_T * 5);
#									}else{
#							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【凍結延長エラー】：君主の地位にあるため、凍結ターンの延長に失敗しました。誰かに王位を継承してください。");
#									}

}
#######################
sub CD_IDmkunren {

						$p_mikoudou_t{$f_id}=0;

$zaddwmax=100;
						if($p_buryoku{$f_id} > $zaddwmax){
$zaddwmax=$p_buryoku{$f_id};
						}

						if($p_kunren{$f_id} >= $zaddwmax){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【猛訓練】：訓練度が最大です。猛訓練を中止し、替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
			if($jfs>129 and $jfi>129){
						$p_ex_buryoku{$f_id}++;
			}else{
						$p_ex_tousotu{$f_id}++;
			}
						}elsif(($p_syoji_kome{$f_id} < 5000 and $jfs <= 159 and ($jfi<=129 or $jfs<=129)) or $p_syoji_kome{$f_id} < 1000){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:米不足で実行できませんでした。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif($p_hjijyou_w{$f_id}[1]){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$p_name{$f_id}の$SOL_TYPE[$p_heisyu{$f_id}]部隊は$HEIIJYOU[1]状態なため猛訓練を行うことができません。。（残り$p_hjijyouc{$f_id}[$p_hjijyou_no{$f_id}[1]]ターン）");
									&NURUPO;
						}else{

							$atted = $p_kunren{$f_id};
						$zsigotoadd = $zaddwmax;

#						if($k_yakusyoku_id{$fk_id}[7] eq $f_id or $k_yakusyoku_id{$fk_id}[10] eq $f_id or $k_yakusyoku_id{$fk_id}[8] eq $f_id or $k_yakusyoku_id{$fk_id}[9] eq $f_id or $k_yakusyoku_id{$fk_id}[11] eq $f_id or $k_yakusyoku_id{$fk_id}[12] eq $f_id or $k_yakusyoku_id{$fk_id}[13] eq $f_id or $k_yakusyoku_id{$fk_id}[14] eq $f_id){
#							$zsigotoadd = 1500;
#						}


						$p_kunren{$f_id} += $zsigotoadd;

							$p_syoji_kome{$f_id} -= 5000;
			if($jfs>159 or ($jfi>129 and $jfs>129)){
							$p_syoji_kome{$f_id} += 4000;
			}

						if($p_kunren{$f_id} > $zaddwmax){
							$p_kunren{$f_id} = $zaddwmax;
						}
						$p_kunkou{$f_id} += 50;

$p_ex_karumalc{$f_id} += 0;
$p_ex_karumald{$f_id} -= 1;
							$zaddw = $p_kunren{$f_id} - $atted;
						$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:兵士の訓練度が<span class=\"cFF0000\">+$zaddw</span>上昇しました。$atted⇒$p_kunren{$f_id}/$zaddwmax。");
			if($jfs>129 and $jfi>129){
						$p_ex_buryoku{$f_id} += 2;
			}else{
						$p_ex_tousotu{$f_id} += 2;
			}
						

						}
}
#######################
sub CD_IDgeya {

						$p_mikoudou_t{$f_id}=0;
						if($p_kunino{$f_id} < 1){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:在野武将は下野できません。");
						}elsif($k_kokusaku{$p_kunino{$f_id}} eq "9"){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:鎖国体制を敷いているため関所の監視が厳しく下野できません…。暇な時間を利用して巡察を行いました");
									&R_JYUNSATU;
						}elsif($k_yakusyoku_id{$fk_id}[15] eq $f_id){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:執金吾は下野できません。役職を誰かに継承させてください。");
						}else{


	open(IN,"./w_db/k_sikan_kyozetu.cgi");
	@B_LIST = <IN>;
	close(IN);

	$hit=0;
	$i=0;
	while($i - $hit <= $#B_LIST){
	$ii=$i - $hit;
		($kyozetu_id,$kyozetu_kunino,$kyozetu_name,$kyozetu_tt) = split(/<>/,$B_LIST[$ii]);
		if(($kyozetu_id eq $p_id{$f_id} and $kyozetu_kunino eq $fk_id) or $kyozetu_tt + 7776000 < $tt){
splice( @B_LIST, $ii, 1);
			$hit++;
		}
	$i++;
	}

		unshift(@B_LIST,"$p_id{$f_id}<>$fk_id<>$p_name{$f_id}<>$tt<>\n");


	open(OUT,">./w_db/k_sikan_kyozetu.cgi");
	print OUT @B_LIST;
	close(OUT);

$p_exgiri{$f_id} -= 3;
$p_ex_karumalc{$f_id} += 10;

						$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$p_p_b_a{$f_id}は$k_name_d[$p_kunino{$f_id}]を去り在野武将となりました。");
											&M2AP_LOG("<span class=\"cFF0000\">【下野】</span>$p_p_b_a{$f_id}は$k_name_d[$p_kunino{$f_id}]を去り在野武将となりました。");
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$k_name_d[$p_kunino{$f_id}]を去り放浪する。");

	&KUNI_KAKUDUKE("$f_id","$p_kunino{$f_id}","$p_kunino{$f_id}");
		$p_kuni_yakusyoku{$f_id} = 0;
						$p_kunino{$f_id} = 0;
						}

}
#######################
sub CD_IDgbosyuu {

						$p_mikoudou_t{$f_id}=0;

						if($t_ryoumin_suu{$ft_id} < 1000){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【義勇兵募集】：領民がたりません。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif($p_heisisuu{$f_id} >= $p_heisisuu_max{$f_id}){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【義勇兵募集】：これ以上集められません。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif($t_tian_ti{$ft_id} < 50){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【義勇兵募集】：治安が低いせいか義勇兵は集まりそうにありません。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}else{

							$solw = $p_heisisuu{$f_id};

							$solp = $SOL_PRICE[$p_heisyu{$f_id}];

							$solp += 40;
							$solp2 = int(rand($solp) * ($tousotuno1)* 0.01 * 0.05);

					$add_b_bohei{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_jinbou{$f_id} * 2) + $p_sinyou{$f_id} + ($p_ihuu{$f_id} * 2) + ($p_syakousei{$f_id} * 2) + $p_karisuma{$f_id} + $p_yousi{$f_id} + $p_kotobadakumi{$f_id})*0.1));
					$add_b_teimu{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_tyoukyou{$f_id} * 2)+ $p_jyujyutu{$f_id} + ($p_doubutu_tekisei{$f_id} * 2) + ($p_ihuu{$f_id} * 2) + $p_karisuma{$f_id} + $p_seisin{$f_id} + $p_syuutyuu{$f_id})*0.1));
					$add_naisei2[$SOL_ZOKUSEIT[$p_heisyu{$f_id}]] = $add_b_bohei{$f_id};
					$add_naisei2[9] = $add_b_teimu{$f_id};
					$add_naisei2[10] = $add_b_teimu{$f_id};
					$add_naisei2[21] = $add_b_teimu{$f_id};
					$add_naisei += $add_naisei2[$SOL_ZOKUSEIT[$p_heisyu{$f_id}]];
							$zsigotoadd = int(rand(int((($p_tousotu{$f_id}+$add_naisei + rand(40))/14 + rand(($p_tousotu{$f_id}+$add_naisei)) / 20)*1)));
						if($k_yakusyoku_id{$fk_id}[15] eq $f_id or $k_yakusyoku_id{$fk_id}[1] eq $f_id or $k_yakusyoku_id{$fk_id}[2] eq $f_id or $k_yakusyoku_id{$fk_id}[3] eq $f_id){
							$zsigotoadd += int(rand(6));
						}

							if($solp2 < $zsigotoadd){
								$cd_op2 = int(rand($p_heisisuu_max{$f_id}/2))+1;

								if($p_heisisuu{$f_id} + $cd_op2 > $p_heisisuu_max{$f_id}){
									$cd_op2 = $p_heisisuu_max{$f_id} - $p_heisisuu{$f_id};
								}
								$p_heisisuu{$f_id} += $cd_op2;
							$p_ex_tousotu{$f_id}+= int(rand(2));
$p_ex_karumalc{$f_id} += 0;
$p_ex_karumald{$f_id} += 1;
						$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:何処からともなく義勇兵が加わり兵士数が<span class=\"cFF0000\">$cd_op2</span>増加しました。$SOL_TYPE[$p_heisyu{$f_id}] $solw⇒$p_heisisuu{$f_id}。");

			unless($jfl>159 or ($jfl>129 and $jfs>129)){
							$p_kunren{$f_id} -= int(100 * $cd_op2 / $p_heisisuu_max{$f_id});
			}
							if($p_kunren{$f_id} < 0 ){
								$p_kunren{$f_id} = 0;
							}

								$cd_op2h = int($cd_op2 / 2);
							$p_h_hirou{$f_id} += int((0 - $p_h_hirou{$f_id}) * ($cd_op2 + 1) / $p_heisisuu_max{$f_id});
							$p_hei_siki{$f_id} += int((50 - $p_hei_siki{$f_id}) * ($cd_op2h + 1) / $p_heisisuu_max{$f_id});

							}else{
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:義勇兵を募りましたが誰も集まりませんでした。$solw⇒$p_heisisuu{$f_id}。");
							}



							$p_ex_tousotu{$f_id}+= int(rand(2));

#							if($t_ryoumin_suu{$ft_id} > 700000){
#							$t_ryoumin_suu{$ft_id} -= $cd_op2 * 150;
#					}elsif($t_ryoumin_suu{$ft_id} > 100000){
#							$t_ryoumin_suu{$ft_id} -= $cd_op2 * 100;
#					}elsif($t_ryoumin_suu{$ft_id} > 50000){
#							$t_ryoumin_suu{$ft_id} -= $cd_op2 * 25;
#					}elsif($t_ryoumin_suu{$ft_id} > 30000){
#							$t_ryoumin_suu{$ft_id} -= $cd_op2 * 10;
#					}elsif($t_ryoumin_suu{$ft_id} > 10000){
#							$t_ryoumin_suu{$ft_id} -= $cd_op2 * 5;
#					}elsif($t_ryoumin_suu{$ft_id} <= 10000){
#							$t_ryoumin_suu{$ft_id} -= $cd_op2 * 3;
#					}
$t_ryoumin_suu{$ft_id} -= $cd_op2;
							if($t_ryoumin_suu{$ft_id} < 2){
								$t_ryoumin_suu{$ft_id} = 2;
								$t_tian_ti{$ft_id} = 100;
							}
						$p_kunkou{$f_id} += 25;
						$p_ex_tousotu{$f_id}++;
							$p_ex_tousotu{$f_id}+= int(rand(2));
						

						}


}
#######################
sub CD_IDgsyousyuu {
						$p_mikoudou_t{$f_id}=0;

						if($p_heisisuu{$f_id} >= $p_heisisuu_max{$f_id}){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【義勇兵召集】：これ以上集められません。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif($p_syoji_kin{$f_id} < 10000){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【義勇兵召集】：所持金がたりません。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}else{
						$p_syoji_kin{$f_id} -= 10000;

							$solw = $p_heisisuu{$f_id};


							$solp = $SOL_PRICE[$p_heisyu{$f_id}];

							$solp += 20;
							$solp2 = int(rand($solp) * $tousotuno1 * 0.01 * 0.05)+1;

					$add_b_bohei{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_jinbou{$f_id} * 2) + $p_sinyou{$f_id} + ($p_ihuu{$f_id} * 2) + ($p_syakousei{$f_id} * 2) + $p_karisuma{$f_id} + $p_yousi{$f_id} + $p_kotobadakumi{$f_id})*0.1));
					$add_b_teimu{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_tyoukyou{$f_id} * 2)+ $p_jyujyutu{$f_id} + ($p_doubutu_tekisei{$f_id} * 2) + ($p_ihuu{$f_id} * 2) + $p_karisuma{$f_id} + $p_seisin{$f_id} + $p_syuutyuu{$f_id})*0.1));
					$add_naisei2[$SOL_ZOKUSEIT[$p_heisyu{$f_id}]] = $add_b_bohei{$f_id};
					$add_naisei2[9] = $add_b_teimu{$f_id};
					$add_naisei2[10] = $add_b_teimu{$f_id};
					$add_naisei2[21] = $add_b_teimu{$f_id};
					$add_naisei += $add_naisei2[$SOL_ZOKUSEIT[$p_heisyu{$f_id}]];
							$zsigotoadd = int(rand(int((($p_tousotu{$f_id}+$add_naisei + rand(40))/14 + rand(($p_tousotu{$f_id}+$add_naisei)) / 20)*1)));
						if($k_yakusyoku_id{$fk_id}[15] eq $f_id or $k_yakusyoku_id{$fk_id}[1] eq $f_id or $k_yakusyoku_id{$fk_id}[2] eq $f_id or $k_yakusyoku_id{$fk_id}[3] eq $f_id){
							$zsigotoadd += int(rand(6));
						}
							$zsigotoadd += 10;
								$cd_op2 = int(25 * $zsigotoadd / $solp2)+1;

								if($p_heisisuu{$f_id} + $cd_op2 > $p_heisisuu_max{$f_id}){
									$cd_op2 = $p_heisisuu_max{$f_id} - $p_heisisuu{$f_id};
								}
								$p_heisisuu{$f_id} += $cd_op2;
$p_ex_karumalc{$f_id} += 0;
$p_ex_karumald{$f_id} -= 1;
						$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:何処からともなく義勇兵が加わり兵士数が<span class=\"cFF0000\">$cd_op2</span>増加しました。$SOL_TYPE[$p_heisyu{$f_id}] $solw⇒$p_heisisuu{$f_id}。");

			unless($jfl>159 or ($jfl>129 and $jfs>129)){
							$p_kunren{$f_id} -= int(100 * $cd_op2 / $p_heisisuu_max{$f_id});
			}
							if($p_kunren{$f_id} < 0 ){
								$p_kunren{$f_id} = 0;
							}

								$cd_op2h = int($cd_op2 / 2);
							$p_h_hirou{$f_id} += int((0 - $p_h_hirou{$f_id}) * ($cd_op2 + 1) / $p_heisisuu_max{$f_id});
							$p_hei_siki{$f_id} += int((50 - $p_hei_siki{$f_id}) * ($cd_op2h + 1) / $p_heisisuu_max{$f_id});


						$p_kunkou{$f_id} += 60;
						$p_ex_tousotu{$f_id}+=3;
						

						}

}
#######################
sub CD_IDjyunsatu {
						$p_mikoudou_t{$f_id}=0;


						if($p_heisisuu{$f_id} < 0){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【巡察】：これ以上集められません。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}else{

									&JYUNSATU;
						}

}
#######################
sub CD_IDsyubi {

						$p_mikoudou_t{$f_id}=0;
						if($p_heisisuu{$f_id} eq "0" or $p_heisisuu{$f_id} eq ""){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:兵０では守備につけません。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif($p_hjijyou_w{$f_id}[1]){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$p_name{$f_id}の$SOL_TYPE[$p_heisyu{$f_id}]部隊は$HEIIJYOU[1]状態なため守備につくことができません。。（残り$p_hjijyouc{$f_id}[$p_hjijyou_no{$f_id}[1]]ターン）");
									&NURUPO;
						}elsif($k_kokusaku{$p_kunino{$f_id}} eq "7"){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:国策：神風特攻を布いている為、守備につけません。攻撃は最大の防御。守らずに攻め続けてください。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}else{

	if($cd_op1 == 0){
		$rh = int(rand(14));
	if($rh == 0){
		$cd_op1 = 11;
	}elsif($rh == 1){
		$cd_op1 = 12;
	}elsif($rh == 2){
		$cd_op1 = 13;
	}elsif($rh == 3){
		$cd_op1 = 21;
	}elsif($rh == 4){
		$cd_op1 = 22;
	}elsif($rh == 5){
		$cd_op1 = 23;
	}elsif($rh == 6){
		$cd_op1 = 24;
	}elsif($rh == 7){
		$cd_op1 = 1;
	}elsif($rh == 8){
		$cd_op1 = 2;
	}elsif($rh == 9){
		$cd_op1 = 3;
	}elsif($rh == 10){
		$cd_op1 = 4;
	}elsif($rh == 11){
		$cd_op1 = 5;
	}elsif($rh == 12){
		$cd_op1 = 6;
	}elsif($rh == 13){
		$cd_op1 = 20;
	}
	}
	if($p_kunizokusei{$f_id}){
$cd_op1 = 999;
	}
						$defaddpos = "$cd_op1";
						$defadditi = "$p_taizai_iti{$f_id}";
						$defaddid = "$f_id";
						$defaddname = "$p_name{$f_id}";
						$defaddcon = "$p_kunino{$f_id}";
						$defaddhei = "$p_heisyu{$f_id}";
						$defadddbdb8 = "$p_syubi_eria{$f_id}";
						$defadddbdb9 = "$p_syubi_tosi{$f_id}";
						&DEF_M;
$kdbdb1 = "$t_name[$p_taizai_iti{$f_id}] $senno[$cd_op1] ";
$p_syubi_tosi{$f_id} = $p_taizai_iti{$f_id};
$p_syubi_eria{$f_id} = $cd_op1;

								if($p_syubi_tosi{$f_id} ne $p_taizai_iti{$f_id} or $p_syubi_eria{$f_id} ne $cd_op1){
							$p_ex_buryoku{$f_id}+= int(rand(2));
$p_ex_karumalc{$f_id} += 3;
$p_ex_karumald{$f_id} += 3;
								}

							$p_kunkou{$f_id} += 40;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の守備につきました。『$cd_name』");
							$p_ex_buryoku{$f_id}++;
						}

}

#######################
sub CD_IDenpous2 {

						$p_mikoudou_t{$f_id}=0;
							$ft_id = $cd_op2;

						$zhit=0;
						foreach(@{$t_setuzoku_saki{$ft_id}}){
							if($_ eq $p_taizai_iti{$f_id}){
								$zhit=1;
							}
						}
							$add_2 = 15000;
									$hirouw = 20;
							$kkyuuhit = 0;
						if($zhit){
							$add_2 = int($add_2 / 2);
									$hirouw = 10;
						}
						if($t_kunino{$ft_id} eq $p_kunino{$f_id} or $t_kunino{$ft_id} eq $k_kyuusai_aite{$p_kunino{$f_id}}[0]){
							$add_2 = int($add_2 / 5);
							$kkyuuhit = 1;
						}
							$add_3 = $p_syoji_kome{$f_id} - $add_2;
		$senhit3=0;
		&KOUSEN_AITE_HIT("$senhit3","$t_kunino{$ft_id}","$fk_id");
		$senhit3=$kousen_aite_hit;
						if($p_heisisuu{$f_id} eq "0" or $p_heisisuu{$f_id} eq ""){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:兵０では守備につけません。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif($k_kokusaku{$t_kunino{$ft_id}} eq "7"){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}では国策：神風特攻を布いている為、守備につけません。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif($k_kokusaku{$t_kunino{$ft_id}} eq "9" and $t_kunino{$ft_id} ne $p_kunino{$f_id}){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$k_name_d[$t_kunino[$ft_id]]では国策：鎖国を布いている為、守備につけません。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif($k_kokusaku{$p_kunino{$f_id}} eq "9" and $t_kunino{$ft_id} ne $p_kunino{$f_id}){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$k_name_d[$p_kunino{$f_id}]では国策：鎖国を布いている為、国外の都市の守備につけません。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif($senhit3){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:交戦相手国の守備にはつけません。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif($add_3 < 1){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:資金不足で実行できませんでした。（貴方の所持米$p_syoji_kome{$f_id}・遠方守備にかかるコスト$add_2）替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif($p_hjijyou_w{$f_id}[1]){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$p_name{$f_id}の$SOL_TYPE[$p_heisyu{$f_id}]部隊は$HEIIJYOU[1]状態なため遠方守備を行うことができません。。（残り$p_hjijyouc{$f_id}[$p_hjijyou_no{$f_id}[1]]ターン）");
									&NURUPO;
						}elsif($cd_op2 == $p_taizai_iti{$f_id}){

	if($cd_op1 == 0){
		$rh = int(rand(14));
	if($rh == 0){
		$cd_op1 = 11;
	}elsif($rh == 1){
		$cd_op1 = 12;
	}elsif($rh == 2){
		$cd_op1 = 13;
	}elsif($rh == 3){
		$cd_op1 = 21;
	}elsif($rh == 4){
		$cd_op1 = 22;
	}elsif($rh == 5){
		$cd_op1 = 23;
	}elsif($rh == 6){
		$cd_op1 = 24;
	}elsif($rh == 7){
		$cd_op1 = 1;
	}elsif($rh == 8){
		$cd_op1 = 2;
	}elsif($rh == 9){
		$cd_op1 = 3;
	}elsif($rh == 10){
		$cd_op1 = 4;
	}elsif($rh == 11){
		$cd_op1 = 5;
	}elsif($rh == 12){
		$cd_op1 = 6;
	}elsif($rh == 13){
		$cd_op1 = 20;
	}
	}
	if($p_kunizokusei{$f_id}){
$cd_op1 = 999;
	}
						$defaddpos = "$cd_op1";
						$defadditi = "$p_taizai_iti{$f_id}";
						$defaddid = "$f_id";
						$defaddname = "$p_name{$f_id}";
						$defaddcon = "$p_kunino{$f_id}";
						$defaddhei = "$p_heisyu{$f_id}";
						$defadddbdb8 = "$p_syubi_eria{$f_id}";
						$defadddbdb9 = "$p_syubi_tosi{$f_id}";
						&DEF_M;
$kdbdb1 = "$t_name[$p_taizai_iti{$f_id}] $senno[$cd_op1] ";
$p_syubi_tosi{$f_id} = $p_taizai_iti{$f_id};
$p_syubi_eria{$f_id} = $cd_op1;

								if($p_syubi_tosi{$f_id} ne $p_taizai_iti{$f_id} or $p_syubi_eria{$f_id} ne $cd_op1){
							$p_ex_buryoku{$f_id}+= int(rand(2));
$p_ex_karumalc{$f_id} += 3;
$p_ex_karumald{$f_id} += 3;
								}
							$p_kunkou{$f_id} += 40;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:赴任先が自分の所在地だったため通常通り$t_name[$p_taizai_iti{$f_id}]の守備につきました。『$cd_name』");
							$p_ex_buryoku{$f_id}++;
						}else{

	if($cd_op1 == 0){
		$rh = int(rand(7));
	if($rh == 0){
		$cd_op1 = 11;
	}elsif($rh == 1){
		$cd_op1 = 12;
	}elsif($rh == 2){
		$cd_op1 = 13;
	}elsif($rh == 3){
		$cd_op1 = 21;
	}elsif($rh == 4){
		$cd_op1 = 22;
	}elsif($rh == 5){
		$cd_op1 = 23;
	}elsif($rh == 6){
		$cd_op1 = 24;
	}
	}
							$p_syoji_kome{$f_id} -= $add_2;


						$defaddpos = "$cd_op1";
						$defadditi = "$cd_op2";
						$defaddid = "$f_id";
						$defaddname = "$p_name{$f_id}";
						$defaddcon = "$p_kunino{$f_id}";
						$defaddhei = "$p_heisyu{$f_id}";
						$defadddbdb8 = "$p_syubi_eria{$f_id}";
						$defadddbdb9 = "$p_syubi_tosi{$f_id}";
						&DEF_M;
$kdbdb1 = "$t_name[$cd_op2] $senno[$cd_op1] ";
$p_syubi_tosi{$f_id} = $cd_op2;
$p_syubi_eria{$f_id} = $cd_op1;
								if($p_syubi_tosi{$f_id} ne $cd_op2 or $p_syubi_eria{$f_id} ne $cd_op1){
							$p_ex_buryoku{$f_id}+= int(rand(3));
							if($kkyuuhit == 1){
$p_ex_karumalc{$f_id} += 5;
$p_ex_karumald{$f_id} += 10;
							}else{
$p_ex_karumalc{$f_id} -= 5;
$p_ex_karumald{$f_id} += 10;
							}
								}
							$p_kunkou{$f_id} += 60;
									$p_h_hirou{$f_id} += $hirouw;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:米を$add_2消費し、部隊を強行移動させて$t_name[$cd_op2]の守備につきました。『$cd_name』");
									&M2AP_LOG("$p_p_b_a{$f_id}の部隊は遠方より強行移動し$t_name[$cd_op2]の守備に着任しました。");
							$p_ex_buryoku{$f_id}++;
						}


}

#######################
sub CD_IDmittei2 {

							$ft_id = $cd_op2;
						$p_mikoudou_t{$f_id}=0;
						if($p_syoji_kin{$f_id}<100){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:資金不足で実行できませんでした。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif($k_kokusaku{$t_kunino{$ft_id}} eq "9"){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:敵は鎖国体制を布いている模様で関所の監視が厳しく敵国に進入できません。暇な時間を利用して巡察を行いました");
									&R_JYUNSATU;
						}elsif($t_kunino{$ft_id} eq $p_kunino{$f_id}){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:密偵を送る先が自都市です。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}else{

							$p_syoji_kin{$f_id} -= 100;
									
						$zhit=0;
						foreach(@{$t_setuzoku_saki{$ft_id}}){
							if($_ eq $p_taizai_iti{$f_id}){
								$zhit=1;
							}
						}
						if($zhit){
							$mitteih = 2;
						}else{
							$mitteih = 5;
						}

					$add_b_keiryaku{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_tyouhou{$f_id} * 2)+ $p_jyujyutu{$f_id} + ($p_kikensatti{$f_id} * 2) + ($p_yoti{$f_id} * 2) + $p_syuutyuu{$f_id} + $p_excalm{$f_id} + $p_kotobadakumi{$f_id})*0.1));
					$add_naisei += $add_b_keiryaku{$f_id};
							$zsigotoadd = int(rand(int((($p_tiryoku{$f_id}+$add_naisei + rand(40))/14 + rand($p_tiryoku{$f_id}+$add_naisei) / 20)*0.4)));

						if($k_yakusyoku_id{$fk_id}[4] eq $f_id){
							$zsigotoadd += int(rand(6));
						}
						if($p_syomotu{$f_id} eq "2012"){
							$zsigotoadd += int(rand(10));
						}

							if($zsigotoadd < 1){
									&M2AP_LOG("$p_p_b_a{$f_id}の間者が$t_name{$ft_id}にて偵察活動をしている模様です。");
							}else{
							$p_ex_tiryoku{$f_id}+= int(rand(2));
							}

							if($zsigotoadd < $mitteih and $t_tian_ti{$ft_id} > 29){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の情報収集は徒労に終わりました。");
						}else{

							@sbs2 = ();
							$sbs = 0;
							$deffile = 1;
	while($deffile < 30){
									foreach(@{"DEF_L_d_$cd_op2\_$deffile"}){
										($mdid,$mdname,$md_tosi,$md_eria,$md_kuni,$mdheisyu) = split(/<>/);
							$sbs++;$sbs2[$SOL_ZOKUSEIT[$mdheisyu]]++;
									}
$deffile++;
	}

			$a_mes2 = "";
							$i = 0;
									foreach(@SOL_ZOKUSEIC){
							if($sbs2[$i]){
$a_mes2 .= "「$_ / $sbs2[$i]」";
							}
							$i++;
									}

							$p_ex_tiryoku{$f_id}+= int(rand(2));
							@DEF_LISTW=();
							open(IN,"./w_db/mati/g$cd_op2.cgi");
							@DEF_LISTW = <IN>;
							close(IN);

							$atted += int(rand($p_syuutyuu{$f_id} + $p_excalm{$f_id}) * 0.1)+$zsigotoadd;
							$kaijyor = int($atted * 0.2)+1;
											$pphit=0;
											$pphit2=0;
											@NEWDEFL=();
											foreach(@DEF_LISTW){
												($d_id,,$dtown_id,$dtown_flg,,$dheisyu,$dmasuta,$dsikikei,$dsubdb1) = split(/<>/);
												if($t_kunino{$ft_id} eq $p_kunino{$d_id} and int(rand($kaijyor))> int(rand($dtown_flg)) ){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">【罠破壊】</span>:$t_name{$ft_id}の郊外にて$p_p_b_a{$d_id}が造ったと思われる落とし穴を発見！！今後の憂いを断つため、これを破壊しました！！");

	$w_id=$p_id{$d_id};&P_LOG_W("$nen_genzai年$tuki_genzai月:<span class=\"cFF0000\">【罠破壊】</span>$t_name{$ft_id}の郊外に仕掛けておいた落とし穴が何者かの手によって破壊された模様です！！");
							$p_kunkou{$f_id} += 15;
							$p_ex_tiryoku{$f_id}+= int(rand(2));
												}elsif("$t_kunino{$ft_id}" eq "$p_kunino{$d_id}"){
											$pphit2=1;
													$pphit ++;
													push(@NEWDEFL,"$_");
												}else{
											$pphit2=1;
													push(@NEWDEFL,"$_");
												}
											}
											open(OUT,">./w_db/mati/g$cd_op2.cgi");
											print OUT @NEWDEFL;
											close(OUT);
												if($pphit2==0){
							unlink("./w_db/mati/g$cd_op2.cgi");
												}
											$pphit2=0;
							@DEF_LISTW=();
							open(IN,"./w_db/mati/s$cd_op2.cgi");
							@DEF_LISTW = <IN>;
							close(IN);
											@NEWDEFL=();
											foreach(@DEF_LISTW){
												($d_id,,$dtown_id,$dtown_flg,,$dheisyu,$dmasuta,$dsikikei,$dsubdb1) = split(/<>/);
												if("$t_kunino{$ft_id}" eq "$p_kunino{$d_id}" and int(rand($kaijyor))> int(rand($dtown_flg)) ){
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">【罠破壊】</span>:$t_name{$ft_id}の城にて$p_p_b_a{$d_id}が造ったと思われる落とし穴を発見！！今後の憂いを断つため、これを破壊しました！！");
	$w_id=$p_id{$d_id};&P_LOG_W("$nen_genzai年$tuki_genzai月:<span class=\"cFF0000\">【罠破壊】</span>$t_name{$ft_id}の城に仕掛けておいた落とし穴が何者かの手によって破壊された模様です！！");
							$p_kunkou{$f_id} += 15;
							$p_ex_tiryoku{$f_id}+= int(rand(2));
												}elsif("$t_kunino{$ft_id}" eq "$p_kunino{$d_id}"){
											$pphit2=1;
													$pphit ++;
													push(@NEWDEFL,"$_");
												}else{
											$pphit2=1;
													push(@NEWDEFL,"$_");
												}
											}
											open(OUT,">./w_db/mati/s$cd_op2.cgi");
											print OUT @NEWDEFL;
											close(OUT);
												if($pphit2==0){
							unlink("./w_db/mati/s$cd_op2.cgi");
												}
											$pphit2=0;
							@DEF_LISTW=();
							open(IN,"./w_db/mati/k$cd_op2.cgi");
							@DEF_LISTW = <IN>;
							close(IN);
											$pphit2=0;
											@NEWDEFL=();
											foreach(@DEF_LISTW){
												($d_id,,$dtown_id,$dtown_flg,,$dheisyu,$dmasuta,$dsikikei,$dsubdb1) = split(/<>/);
												if("$t_kunino{$ft_id}" eq "$p_kunino{$d_id}" and int(rand($kaijyor))> int(rand($dtown_flg)) ){
													$pphit ++;
										$w_id=$f_id;&P_LOG_W("<span class=\"cFF0000\">【罠破壊】</span>:$t_name{$ft_id}にて$p_p_b_a{$d_id}が造ったと思われる偽の砦を発見！！今後の憂いを断つため、これを破壊しました！！");

	$w_id=$p_id{$d_id};&P_LOG_W("$nen_genzai年$tuki_genzai月:<span class=\"cFF0000\">【罠破壊】</span>$t_name{$ft_id}に仕掛けておいた偽の砦が何者かの手によって破壊された模様です！！");
							$p_kunkou{$f_id} += 15;
							$p_ex_tiryoku{$f_id}+= int(rand(2));
												}elsif("$t_kunino{$ft_id}" eq "$p_kunino{$d_id}"){
											$pphit2=1;
													$pphit ++;
													push(@NEWDEFL,"$_");
												}else{
											$pphit2=1;
													push(@NEWDEFL,"$_");
												}
											}
											open(OUT,">./w_db/mati/k$cd_op2.cgi");
											print OUT @NEWDEFL;
											close(OUT);
												if($pphit2==0){
							unlink("./w_db/mati/k$cd_op2.cgi");
												}


$p_ex_karumalc{$f_id} += 1;
$p_ex_karumald{$f_id} -= 1;
$p_gogyou_ka{$f_id} -= 3;
$p_gogyou_sui{$f_id} += 1;
$p_gogyou_moku{$f_id} += 0;
$p_gogyou_kin{$f_id} += 2;
$p_gogyou_do{$f_id} += 0;
							$p_kunkou{$f_id} += 15;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:間者より：$t_name{$ft_id}⇒領民$t_ryoumin_suu{$ft_id}人。治安$t_tian_ti{$ft_id}。農業$t_nougyou_ti{$ft_id}。商業$t_syougyou_ti{$ft_id}。城壁$t_siro_bouei_ti{$ft_id}。城壁耐久$t_siro_taikyuu_ti{$ft_id}。技術$t_gijyutu_ti{$ft_id}。守備武将数$sbs名。罠の数$pphit。$a_mes2。");
							}



							$p_kunkou{$f_id} += 10;
							$p_ex_tiryoku{$f_id}++;
						}

}


#######################
sub CD_IDryuugen2 {

						$p_mikoudou_t{$f_id}=0;
							$ft_id = $cd_op2;
						$zhit=0;
	foreach(@{$t_setuzoku_saki{$ft_id}}){
		if("$_" ne ""){
							$dt_id = $_;
			if($t_kunino{$dt_id} ne $t_kunino{$ft_id}){
						$zhit=1;
			}
		}
	}
		$senhit3=0;
		&KOUSEN_AITE_HIT("$senhit3","$t_kunino{$ft_id}","$fk_id");
		$senhit3=$kousen_aite_hit;
		$tyohit_add{$k_kokusaku{$fk_id}}=$senhit3;
		$tyohit_add{10}=1;
		$senhit3=$tyohit_add{$k_kokusaku{$k_kunino{$fk_id}}};
						if($t_kunino{$ft_id} eq $p_kunino{$f_id}){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:自国には仕掛けられません。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:暇な時間を利用して巡察を行いました。");
									&R_JYUNSATU;
						}elsif($k_kokusaku{$t_kunino{$ft_id}} eq "9"){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:敵は鎖国体制を布いている模様で関所の監視が厳しく敵国に進入できません。暇な時間を利用して巡察を行いました");
									&R_JYUNSATU;
						}elsif(!$senhit3){
								$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$k_name_d[$t_kunino[$ft_id]]に対しての攻撃許可が下りませんでした。司令部で交戦設定が必要です。（攻撃的な計略を仕掛ける場合は君主・上公・三公の指示を仰いでください）");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:暇な時間を利用して巡察を行いました。");
									&R_JYUNSATU;
						}elsif(!-e "./$mpg_r/sub_db/td/$p_taizai_iti{$f_id}.$cd_op2.pl" and $cd_op2 ne $p_taizai_iti{$f_id} and (($k_kokusaku{$k_kunino{$fk_id}} ne "10" and $k_kokusaku{$t_kunino{$ft_id}} ne "10") or $k_kokusaku{$t_kunino{$ft_id}} eq "9")){
						$zhit="$t_name{$ft_id}には隣接していません。";
				if($k_kokusaku{$t_kunino{$ft_id}} eq "9"){
						$zhit="$k_name_d[$t_kunino[$ft_id]]は鎖国体制を敷いているため遠方攻撃が通じません。";
				}
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$zhit替わりにその場で巡察を行いました。");
									&R_JYUNSATU;
						}elsif(!$zhit){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}は敵国の後方都市で計略を仕掛けられません。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}else{

						if($p_syoji_kin{$f_id}<100){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:資金不足で実行できませんでした。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}else{
								$zkagenti = 1;
							if($p_kunizokusei{$f_id}){
								$zkagenti = 60;
							}
									

					$add_b_keiryaku{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_tyouhou{$f_id} * 2)+ $p_jyujyutu{$f_id} + ($p_kikensatti{$f_id} * 2) + ($p_yoti{$f_id} * 2) + $p_syuutyuu{$f_id} + $p_excalm{$f_id} + $p_kotobadakumi{$f_id})*0.1));
					$add_naisei += $add_b_keiryaku{$f_id};
							$zsigotoadd = int(rand(int((($p_tiryoku{$f_id}+$add_naisei + rand(40))/14 + rand($p_tiryoku{$f_id}+$add_naisei) / 20)*0.5)));

						if($k_yakusyoku_id{$fk_id}[4] eq $f_id){
							$zsigotoadd += int(rand(6));
						}


							if($zsigotoadd < 1){
									&M2AP_LOG("$p_p_b_a{$f_id}は$t_name{$ft_id}への計略（流言工作）に失敗しました！");

$ek_id=$k_kunino{$t_kunino{$ft_id}};
		$senhit3=0;
		&KOUSEN_AITE_HIT("$senhit3","$k_kunino{$fk_id}","$ek_id");
		$senhit3=$kousen_aite_hit;
		$tyohit_add{$k_kokusaku{$fk_id}}=$senhit3;
		$tyohit_add{10}=1;
		$senhit3=$tyohit_add{$k_kokusaku{$k_kunino{$fk_id}}};
												if($k_kunino{$fk_id} and $ek_id and !$senhit3){
											&CAUNTA;
												}
							}else{
							$p_ex_tiryoku{$f_id}+= int(rand(2));
						if($t_tian_ti{$ft_id} >= 20){
							$p_ex_tiryoku{$f_id}+= int(rand(3));
						}
							}
							if($zsigotoadd > 6){
							$zsigotoadd = 6 + int(rand($zsigotoadd-6)/2);
							}
							if($t_tian_ti{$ft_id} < $zkagenti){
								$zsigotoadd = 0;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の治安はこれ以上低下しません。");
							}

							$t_tian_ti{$ft_id} -= $zsigotoadd;
							$p_syoji_kin{$f_id} -= 100;

							if($t_tian_ti{$ft_id} < $zkagenti){
								$t_tian_ti{$ft_id} = $zkagenti;
							}else{
							$p_kunkou{$f_id} += 10;
$p_ex_karumalc{$f_id} += 0;
$p_ex_karumald{$f_id} -= 2;
$p_gogyou_ka{$f_id} += 0;
$p_gogyou_sui{$f_id} += 2;
$p_gogyou_moku{$f_id} += 1;
$p_gogyou_kin{$f_id} += 0;
$p_gogyou_do{$f_id} -= 3;
							}

							$p_kunkou{$f_id} += 30;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の治安を<span class=\"cFF0000\">+$zsigotoadd</span>低下させました。");
							$p_ex_tiryoku{$f_id}++;
						}

						}

}

#######################
sub CD_IDyakiuti2 {

						$p_mikoudou_t{$f_id}=0;
							$ft_id = $cd_op2;
						$zhit=0;
	foreach(@{$t_setuzoku_saki{$ft_id}}){
		if("$_" ne ""){
							$dt_id = $_;
			if($t_kunino{$dt_id} ne $t_kunino{$ft_id}){
						$zhit=1;
			}
		}
	}
		$senhit3=0;
		&KOUSEN_AITE_HIT("$senhit3","$t_kunino{$ft_id}","$fk_id");
		$senhit3=$kousen_aite_hit;
		$tyohit_add{$k_kokusaku{$fk_id}}=$senhit3;
		$tyohit_add{10}=1;
		$senhit3=$tyohit_add{$k_kokusaku{$k_kunino{$fk_id}}};
						if($t_kunino{$ft_id} eq $p_kunino{$f_id}){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:自国には仕掛けられません。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:暇な時間を利用して巡察を行いました。");
									&R_JYUNSATU;
						}elsif($k_kokusaku{$t_kunino{$ft_id}} eq "9"){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:敵は鎖国体制を布いている模様で関所の監視が厳しく敵国に進入できません。暇な時間を利用して巡察を行いました");
									&R_JYUNSATU;
						}elsif(!$senhit3){
								$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$k_name_d[$t_kunino[$ft_id]]に対しての攻撃許可が下りませんでした。司令部で交戦設定が必要です。（攻撃的な計略を仕掛ける場合は君主・上公・三公の指示を仰いでください）");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:暇な時間を利用して巡察を行いました。");
									&R_JYUNSATU;
						}elsif(!-e "./$mpg_r/sub_db/td/$p_taizai_iti{$f_id}.$cd_op2.pl" and $cd_op2 ne $p_taizai_iti{$f_id} and (($k_kokusaku{$k_kunino{$fk_id}} ne "10" and $k_kokusaku{$t_kunino{$ft_id}} ne "10") or $k_kokusaku{$t_kunino{$ft_id}} eq "9")){
						$zhit="$t_name{$ft_id}には隣接していません。";
				if($k_kokusaku{$t_kunino{$ft_id}} eq "9"){
						$zhit="$k_name_d[$t_kunino[$ft_id]]は鎖国体制を敷いているため遠方攻撃が通じません。";
				}
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$zhit替わりにその場で巡察を行いました。");
									&R_JYUNSATU;
						}elsif(!$zhit){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}は敵国の後方都市で計略を仕掛けられません。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}else{

						if($p_syoji_kin{$f_id}<100){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:資金不足で実行できませんでした。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}else{
								$zkagenti = 1;
							if($p_kunizokusei{$f_id}){
								$zkagenti = 60;
							}
							
					$add_b_keiryaku{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_tyouhou{$f_id} * 2)+ $p_jyujyutu{$f_id} + ($p_kikensatti{$f_id} * 2) + ($p_yoti{$f_id} * 2) + $p_syuutyuu{$f_id} + $p_excalm{$f_id} + $p_kotobadakumi{$f_id})*0.1));
					$add_naisei += $add_b_keiryaku{$f_id};		
							$zsigotoadd = int(rand(int((($p_buryoku{$f_id}+$item_seinou{$p_migite{$f_id}} + rand(40))/14 + rand(($p_buryoku{$f_id}+$item_seinou{$p_migite{$f_id}})) / 20)*3)));

						if($k_yakusyoku_id{$fk_id}[4] eq $f_id){
							$zsigotoadd += int(rand(10));
						}
			if($k_kokkyou{$t_kunino{$ft_id}} eq "3"){
	if($k_kokkyou_keika_nen{$t_kunino{$ft_id}} > 10){
							$zsigotoadd += int(rand(10));
	}
			}

							if($zsigotoadd < 1){
									&M2AP_LOG("$p_p_b_a{$f_id}は$t_name{$ft_id}への計略（焼き討ち）に失敗しました！");

$ek_id=$k_kunino{$t_kunino{$ft_id}};
		$senhit3=0;
		&KOUSEN_AITE_HIT("$senhit3","$k_kunino{$fk_id}","$ek_id");
		$senhit3=$kousen_aite_hit;
		$tyohit_add{$k_kokusaku{$fk_id}}=$senhit3;
		$tyohit_add{10}=1;
		$senhit3=$tyohit_add{$k_kokusaku{$k_kunino{$fk_id}}};
												if($k_kunino{$fk_id} and $ek_id and !$senhit3){
											&CAUNTA;
												}
							}else{
							$p_ex_buryoku{$f_id}+= int(rand(2));
						if($t_nougyou_ti{$ft_id} >= 100 and $t_syougyou_ti{$ft_id} >= 100 and $t_gijyutu_ti{$ft_id} >= 100){
							$p_ex_tousotu{$f_id}+= int(rand(3));
$p_ex_karumalc{$f_id} += 0;
$p_ex_karumald{$f_id} -= 2;
$p_gogyou_ka{$f_id} += 2;
$p_gogyou_sui{$f_id} -= 3;
$p_gogyou_moku{$f_id} += 0;
$p_gogyou_kin{$f_id} += 0;
$p_gogyou_do{$f_id} += 1;
						}
							}


							$han = int(rand(4));
						if($han<1){
							if($t_nougyou_ti{$ft_id} < 1){
								$zsigotoadd = 0;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の農業は０でした。");
							}

							$hann = "農業";
							$t_nougyou_ti{$ft_id} -= $zsigotoadd;
							if($t_nougyou_ti{$ft_id} < 1){
								$t_nougyou_ti{$ft_id} = 0;
							}else{
							$p_kunkou{$f_id} += 10;
							}
						}elsif($han<2){
							if($t_gijyutu_ti{$ft_id} < 1){
								$zsigotoadd = 0;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の技術は０でした。");
							}
							$hann = "技術";
							$t_gijyutu_ti{$ft_id} -= $zsigotoadd;
							if($t_gijyutu_ti{$ft_id} < 1){
								$t_gijyutu_ti{$ft_id} = 0;
							}else{
							$p_kunkou{$f_id} += 20;
							}
						}elsif($han<3){
							if($t_tian_ti{$ft_id} < $zkagenti){
								$zsigotoadd = 0;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の治安はこれ以上低下しません。");
							}else{
								$zsigotoadd = 1;
							}
							$hann = "治安";
							$t_tian_ti{$ft_id} -= $zsigotoadd;
							if($t_tian_ti{$ft_id} < $zkagenti){
								$t_tian_ti{$ft_id} = $zkagenti;
							}else{
							$p_kunkou{$f_id} += 5;
							}
						}else{
							if($t_syougyou_ti{$ft_id} < 1){
								$zsigotoadd = 0;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の商業は０でした。");
							}
							$hann = "商業";
							$t_syougyou_ti{$ft_id} -= $zsigotoadd;
							if($t_syougyou_ti{$ft_id} < 1){
								$t_syougyou_ti{$ft_id} = 0;
							}else{
							$p_kunkou{$f_id} += 10;
							}
						}
							$p_syoji_kin{$f_id} -= 100;
							$p_kunkou{$f_id} += 30;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の$hannを<span class=\"cFF0000\">+$zsigotoadd</span>低下させました。");
							$p_ex_buryoku{$f_id}++;
						}

						}

}

#######################
sub CD_IDkabeb2 {

						$p_mikoudou_t{$f_id}=0;
							$ft_id = int($cd_op2);
						$zhit=0;
	foreach(@{$t_setuzoku_saki{$ft_id}}){
		if("$_" ne ""){
							$dt_id = $_;
			if($t_kunino{$dt_id} ne $t_kunino{$ft_id}){
						$zhit=1;
			}
		}
	}
		$senhit3=0;
		&KOUSEN_AITE_HIT("$senhit3","$t_kunino{$ft_id}","$fk_id");
		$senhit3=$kousen_aite_hit;
		$tyohit_add{$k_kokusaku{$fk_id}}=$senhit3;
		$tyohit_add{10}=1;
		$senhit3=$tyohit_add{$k_kokusaku{$k_kunino{$fk_id}}};
						if($t_kunino{$ft_id} eq $p_kunino{$f_id}){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:自国には仕掛けられません。暇な時間を利用して巡察を行いました。");
									&R_JYUNSATU;
						}elsif($k_kokusaku{$t_kunino{$ft_id}} eq "9"){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:敵は鎖国体制を布いている模様で関所の監視が厳しく敵国に進入できません。暇な時間を利用して巡察を行いました");
									&R_JYUNSATU;
						}elsif(!$senhit3){
								$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$k_name_d[$t_kunino[$ft_id]]に対しての攻撃許可が下りませんでした。司令部で交戦設定が必要です。（攻撃的な計略を仕掛ける場合は君主・上公・三公の指示を仰いでください）");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:暇な時間を利用して巡察を行いました。");
									&R_JYUNSATU;
						}elsif(!-e "./$mpg_r/sub_db/td/$p_taizai_iti{$f_id}.$cd_op2.pl" and $cd_op2 ne $p_taizai_iti{$f_id} and (($k_kokusaku{$k_kunino{$fk_id}} ne "10" and $k_kokusaku{$t_kunino{$ft_id}} ne "10") or $k_kokusaku{$t_kunino{$ft_id}} eq "9")){
						$zhit="$t_name{$ft_id}には隣接していません。";
				if($k_kokusaku{$t_kunino{$ft_id}} eq "9"){
						$zhit="$k_name_d[$t_kunino[$ft_id]]は鎖国体制を敷いているため遠方攻撃が通じません。";
				}
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$zhit替わりにその場で巡察を行いました。");
									&R_JYUNSATU;
						}elsif(!$zhit){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}は敵国の後方都市で計略を仕掛けられません。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}else{

						if($p_syoji_kin{$f_id}<100){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:資金不足で実行できませんでした。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}else{
							
					$add_b_keiryaku{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_tyouhou{$f_id} * 2)+ $p_jyujyutu{$f_id} + ($p_kikensatti{$f_id} * 2) + ($p_yoti{$f_id} * 2) + $p_syuutyuu{$f_id} + $p_excalm{$f_id} + $p_kotobadakumi{$f_id})*0.1));
					$add_naisei += $add_b_keiryaku{$f_id};		
							$zsigotoadd = int(rand(int((($p_tiryoku{$f_id}+$add_naisei + rand(40))/14 + rand($p_tiryoku{$f_id}+$add_naisei) / 20)*1.5)));

						if($k_yakusyoku_id{$fk_id}[4] eq $f_id){
							$zsigotoadd += int(rand(10));
						}

							$zsigotoadd = int($zsigotoadd * 2);
							if($zsigotoadd < 1){
									&M2AP_LOG("$p_p_b_a{$f_id}は$t_name{$ft_id}への計略（城壁破壊）に失敗しました！");

$ek_id=$k_kunino{$t_kunino{$ft_id}};
		$senhit3=0;
		&KOUSEN_AITE_HIT("$senhit3","$k_kunino{$fk_id}","$ek_id");
		$senhit3=$kousen_aite_hit;
		$tyohit_add{$k_kokusaku{$fk_id}}=$senhit3;
		$tyohit_add{10}=1;
		$senhit3=$tyohit_add{$k_kokusaku{$k_kunino{$fk_id}}};
												if($k_kunino{$fk_id} and $ek_id and !$senhit3){
											&CAUNTA;
												}
							}else{
							$p_ex_tiryoku{$f_id}+= int(rand(2));
						if($t_siro_taikyuu_ti{$ft_id} >= 100){
							$p_ex_tiryoku{$f_id}+= int(rand(3));
						}
							}
							if($t_siro_taikyuu_ti{$ft_id} < 1){
								$zsigotoadd = 0;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の城壁耐久は０でした。");
							}

							$t_siro_taikyuu_ti{$ft_id} -= $zsigotoadd;
							$p_syoji_kin{$f_id} -= 100;

							if($t_siro_taikyuu_ti{$ft_id} < 1){
								$t_siro_taikyuu_ti{$ft_id} = 0;
							}else{
							$p_kunkou{$f_id} += 10;
$p_ex_karumalc{$f_id} += 0;
$p_ex_karumald{$f_id} -= 2;
$p_gogyou_ka{$f_id} += 0;
$p_gogyou_sui{$f_id} += 0;
$p_gogyou_moku{$f_id} -= 3;
$p_gogyou_kin{$f_id} += 1;
$p_gogyou_do{$f_id} += 2;
							}
							$p_kunkou{$f_id} += 30;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の城壁耐久を<span class=\"cFF0000\">+$zsigotoadd</span>低下させました。");
							$p_ex_tiryoku{$f_id}++;
						}

						}
}
#######################
sub CD_IDsendou2 {

						$p_mikoudou_t{$f_id}=0;
							$ft_id = $cd_op2;
						$zhit=0;
	foreach(@{$t_setuzoku_saki{$ft_id}}){
		if("$_" ne ""){
							$dt_id = $_;
			if($t_kunino{$dt_id} ne $t_kunino{$ft_id}){
						$zhit=1;
			}
		}
	}
		$senhit3=0;
		&KOUSEN_AITE_HIT("$senhit3","$t_kunino{$ft_id}","$fk_id");
		$senhit3=$kousen_aite_hit;
		$tyohit_add{$k_kokusaku{$fk_id}}=$senhit3;
		$tyohit_add{10}=1;
		$senhit3=$tyohit_add{$k_kokusaku{$k_kunino{$fk_id}}};
						if($t_kunino{$ft_id} eq $p_kunino{$f_id}){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:自国には仕掛けられません。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:暇な時間を利用して巡察を行いました。");
									&R_JYUNSATU;
						}elsif(!$senhit3){
								$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$k_name_d[$t_kunino[$ft_id]]に対しての攻撃許可が下りませんでした。司令部で交戦設定が必要です。（攻撃的な計略を仕掛ける場合は君主・上公・三公の指示を仰いでください）");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:暇な時間を利用して巡察を行いました。");
									&R_JYUNSATU;
						}elsif(!-e "./$mpg_r/sub_db/td/$p_taizai_iti{$f_id}.$cd_op2.pl" and $cd_op2 ne $p_taizai_iti{$f_id} and (($k_kokusaku{$k_kunino{$fk_id}} ne "10" and $k_kokusaku{$t_kunino{$ft_id}} ne "10") or $k_kokusaku{$t_kunino{$ft_id}} eq "9")){
						$zhit="$t_name{$ft_id}には隣接していません。";
				if($k_kokusaku{$t_kunino{$ft_id}} eq "9"){
						$zhit="$k_name_d[$t_kunino[$ft_id]]は鎖国体制を敷いているため遠方攻撃が通じません。";
				}
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$zhit替わりにその場で巡察を行いました。");
									&R_JYUNSATU;
						}elsif(!$zhit){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}は敵国の後方都市で計略を仕掛けられません。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}else{

						if($p_syoji_kin{$f_id}<100){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:資金不足で実行できませんでした。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}else{
							
					$add_b_keiryaku{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_tyouhou{$f_id} * 2)+ $p_jyujyutu{$f_id} + ($p_kikensatti{$f_id} * 2) + ($p_yoti{$f_id} * 2) + $p_syuutyuu{$f_id} + $p_excalm{$f_id} + $p_kotobadakumi{$f_id})*0.1));
					$add_naisei += $add_b_keiryaku{$f_id};		
							$zsigotoadd = int(rand(int((($p_tousotu{$f_id}+$item_seinou{$p_syomotu{$f_id}} + rand(40))/14 + rand(($p_tousotu{$f_id}+$item_seinou{$p_syomotu{$f_id}})) / 20)*1)));

						if($k_yakusyoku_id{$fk_id}[4] eq $f_id){
							$zsigotoadd += int(rand(6));
						}

							if($zsigotoadd < 1){
									&M2AP_LOG("$p_p_b_a{$f_id}が$t_name{$ft_id}で何か良からぬことを企んでるようです。");
$ek_id=$k_kunino{$t_kunino{$ft_id}};
		$senhit3=0;
		&KOUSEN_AITE_HIT("$senhit3","$k_kunino{$fk_id}","$ek_id");
		$senhit3=$kousen_aite_hit;
		$tyohit_add{$k_kokusaku{$fk_id}}=$senhit3;
		$tyohit_add{10}=1;
		$senhit3=$tyohit_add{$k_kokusaku{$k_kunino{$fk_id}}};
												if($k_kunino{$fk_id} and $ek_id and !$senhit3){
											&CAUNTA;
												}
							}else{
							$p_ex_tousotu{$f_id}+= int(rand(2));
$p_ex_karumalc{$f_id} -= 1;
$p_ex_karumald{$f_id} -= 1;
$p_gogyou_ka{$f_id} += 1;
$p_gogyou_sui{$f_id} += 0;
$p_gogyou_moku{$f_id} += 2;
$p_gogyou_kin{$f_id} -= 3;
$p_gogyou_do{$f_id} += 0;
							}
							$tian_han = int($t_tian_ti{$ft_id} * 0.3)+3;

							if($zsigotoadd < $tian_han or $t_tian_ti{$ft_id} > 39){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の住民は説得に応じませんでした。");
						}else{
$p_ex_karumalc{$f_id} -= 2;
$p_ex_karumald{$f_id} -= 2;
$p_gogyou_ka{$f_id} += 2;
$p_gogyou_sui{$f_id} += 0;
$p_gogyou_moku{$f_id} += 4;
$p_gogyou_kin{$f_id} -= 6;
$p_gogyou_do{$f_id} += 0;
							$p_ex_tousotu{$f_id}+= int(rand(3));
							$p_kunkou{$f_id} += 30;
												$t_ryoumin_suu{$ft_id} = int($t_ryoumin_suu{$ft_id}*0.9);
							$t_siro_taikyuu_ti{$ft_id} = int($t_siro_taikyuu_ti{$ft_id} * 0.9);
							$t_siro_bouei_ti{$ft_id} = int($t_siro_bouei_ti{$ft_id} * 0.9);
							$t_gijyutu_ti{$ft_id} = int($t_gijyutu_ti{$ft_id} * 0.9);
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の住民を蜂起させる。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:治安の悪い$t_name{$ft_id}の住民を<span class=\"cFF0000\">蜂起</span>させました。");
									&M2AP_LOG("治安の悪さに耐えかねた$t_name{$ft_id}の住民が蜂起しました！");
							}

							$p_syoji_kin{$f_id} -= 100;

							$p_kunkou{$f_id} += 30;
							$p_ex_tousotu{$f_id}++;
						}

						}


}
#######################
sub CD_IDsensou2 {
	&BAG_LOG2("スタート\n");
						$p_mikoudou_t{$f_id}=0;
			$cd_op2 = int($cd_op2);
							$ft_id = $cd_op2;

						$zhit=0;
	foreach(@{$t_setuzoku_saki{$ft_id}}){
		if("$_" ne ""){
							$dt_id = $_;
			if($t_kunino{$dt_id} ne $t_kunino{$ft_id}){
						$zhit=1;
			}
		}
	}
						if($t_kunino{$ft_id} eq $p_kunino{$f_id} and int($cd_op1 / 10) ne "8" and !$p_kunizokusei{$f_id}){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:自国には攻められません。暇な時間を利用して巡察を行いました。");
									&R_JYUNSATU;
						}elsif($p_hjijyou_w{$f_id}[1]){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$p_name{$f_id}の$SOL_TYPE[$p_heisyu{$f_id}]部隊は$HEIIJYOU[1]状態なため攻め込むことができません。。（残り$p_hjijyou_no{$f_id}[1]ターン）");
									&NURUPO;
						}elsif($ft_id >= $tosi_kazu){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:自国には攻められません。暇な時間を利用して巡察を行いました。");
									&R_JYUNSATU;
						}elsif($t_kunino{$ft_id} eq $p_kunino{$f_id} and int($cd_op1 / 10) eq "9"){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:自国には攻められません。暇な時間を利用して巡察を行いました。");
									&R_JYUNSATU;
						}elsif($k_kokusaku{$p_kunino{$f_id}} eq "4" and int($cd_op1 / 10) ne "9" and int($cd_op1 / 10) ne "8"){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:国策「殖産興業」発動中は敵国に攻め込むことが出来ません。内政又は巡察に従事してください。暇な時間を利用して巡察を行いました。");
									&R_JYUNSATU;
						}elsif(int($cd_op1 / 10) eq "9" and $k_outo{$k_kunino{$fk_id}} ne $cd_op2 and $k_kunino{$t_kunino{$cd_op2}}){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:攻撃先目標$t_name{$cd_op2}が賊砦の支配域と異なります。替わりにその場で巡察を行いました。");
				if($k_kunino{$t_kunino{$cd_op2}} eq $k_kunino{$t_kunino{$k_outo{$k_kunino{$fk_id}}}}){

$bsirei[0]="/指令受入";
$bsirei[1]="/作戦固定";

	$setum{1}="城攻め";
	$setum{2}="野戦";
	$setum{3}="国境戦";
	$setum{4}="城包囲";
	$setum{5}="城壁戦";
	$setum{0}="通常";
	$setum{90}="城強襲";
	$setum{80}="賊討伐";
		$comey{2} = "勝";
		$comey{1} = "負";
		$comey{0} = "";
	$ahit=0;
	$hit=0;
	$i=0;
		foreach(@CD_DB){
			($cdw_id,$cdw_no,$cdw_name,$cdw_op0,$cdw_op1,$cdw_op2,$cdw_op3,$cdw_op4,$cdw_type1,$cdw_type2,$cdw_type3,$cdw_optts,$cdw_opttw,$cdw_ai,$cdw_r_f,$cdw_r_endno,$cdw_r_type,$cdw_r_ai) = split(/<>/);

				if($cdw_id eq "sensou2" and int($cdw_op1 / 10) eq "9" and $cdw_op2 eq $cd_op2){
					$ahit=1;
					
					$cdw_name = "$t_name{$k_outo{$k_kunino{$fk_id}}}へ出兵（城内＠$setum{$cdw_op1}$bsirei[$cdw_op3]）$comey{$cdw_optts}";
				splice(@CD_DB,$i - $hit,1,"$cdw_id<>$cdw_no<>$cdw_name<>$cdw_op0<>$cdw_op1<>$k_outo{$k_kunino{$fk_id}}<>$cdw_op3<>$cdw_op4<>$cdw_type1<>$cdw_type2<>$cdw_type3<>$cdw_optts<>$cdw_opttw<>$cdw_ai<>$cdw_r_f<>$cdw_r_endno<>$cdw_r_type<>$cdw_r_ai<>\n");

			$hit++;
				}
			$i++;
		}

	open(OUT,">./p_db/cd/$p_id{$f_id}.cgi");
	print OUT @CD_DB;
	close(OUT);
					if($ahit){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$k_p_k_a{$t_kunino{$k_outo{$k_kunino{$fk_id}}}}への攻撃継続のため、攻撃先目標$t_name{$cd_op2}を攻撃先目標$t_name{$k_outo{$k_kunino{$fk_id}}}へ修正しました。");
					}
				}
									&R_JYUNSATU;
						}elsif($p_kunizokusei{$f_id} and int($cd_op1 / 10) ne "9"){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:賊は「城を強襲」コマンド以外使用できません。");
									&R_JYUNSATU;
						}elsif(int($cd_op1 / 10) eq "8" and ($t_kunino{$ft_id} ne $p_kunino{$f_id} or !$t_zokuno{$ft_id})){
						$zhit="その地域にもう賊はいないようです。";
				if($t_kunino{$ft_id} ne $p_kunino{$f_id}){
						$zhit="他国領域の賊砦には攻め込めません。";
				}
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$zhit替わりにその場で巡察を行いました。");
				if($k_kunino{$p_kunino{$f_id}} eq $k_kunino{$t_kunino{$k_outo{$k_kunino{$cdw_op4}}}} and $k_kunino{$cdw_op4} and $k_kunino{$p_kunino{$f_id}}){

$bsirei[0]="/指令受入";
$bsirei[1]="/作戦固定";

	$setum{1}="城攻め";
	$setum{2}="野戦";
	$setum{3}="国境戦";
	$setum{4}="城包囲";
	$setum{5}="城壁戦";
	$setum{0}="通常";
	$setum{90}="城強襲";
	$setum{80}="賊討伐";
		$comey{2} = "勝";
		$comey{1} = "負";
		$comey{0} = "";
	$ahit=0;
	$hit=0;
	$i=0;
		foreach(@CD_DB){
			($cdw_id,$cdw_no,$cdw_name,$cdw_op0,$cdw_op1,$cdw_op2,$cdw_op3,$cdw_op4,$cdw_type1,$cdw_type2,$cdw_type3,$cdw_optts,$cdw_opttw,$cdw_ai,$cdw_r_f,$cdw_r_endno,$cdw_r_type,$cdw_r_ai) = split(/<>/);

				if($cdw_id eq "sensou2" and int($cdw_op1 / 10) eq "8" and $cdw_op2 eq $cd_op2){
					$ahit=1;
					
					$cdw_name = "$t_name{$k_outo{$k_kunino{$cdw_op4}}}へ出兵（賊砦拠点⇒賊砦＠$setum{$cdw_op1}$bsirei[$cdw_op3]）$comey{$cdw_optts}";
				splice(@CD_DB,$i - $hit,1,"$cdw_id<>$cdw_no<>$cdw_name<>$cdw_op0<>$cdw_op1<>$k_outo{$k_kunino{$cdw_op4}}<>$cdw_op3<>$cdw_op4<>$cdw_type1<>$cdw_type2<>$cdw_type3<>$cdw_optts<>$cdw_opttw<>$cdw_ai<>$cdw_r_f<>$cdw_r_endno<>$cdw_r_type<>$cdw_r_ai<>\n");

			$hit++;
				}
			$i++;
		}

	open(OUT,">./p_db/cd/$p_id{$f_id}.cgi");
	print OUT @CD_DB;
	close(OUT);
					if($ahit){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$k_p_k_a{$k_kunino{$cdw_op4}}の支配する賊砦への攻撃継続のため、攻撃先目標$t_name{$cd_op2}を攻撃先目標を$t_name{$k_outo{$k_kunino{$cdw_op4}}}へ修正しました。");
					}
				}
									&R_JYUNSATU;
						}elsif(!-e "./$mpg_r/sub_db/td/$p_taizai_iti{$f_id}.$cd_op2.pl" and $cd_op2 ne $p_taizai_iti{$f_id} and int($cd_op1 / 10) ne "8" and (($k_kokusaku{$k_kunino{$fk_id}} ne "10" and $k_kokusaku{$t_kunino{$ft_id}} ne "10") or !$t_kunino{$ft_id})){
						$zhit="$t_name{$ft_id}には隣接していません。";
				if(!$t_kunino{$ft_id}){
						$zhit="$k_name_d[$t_kunino[$ft_id]]は空白地です。遠方攻撃が通じません。";
				}
#				if($k_kokusaku{$t_kunino{$ft_id}} eq "9"){
#						$zhit="$k_name_d[$t_kunino[$ft_id]]は鎖国体制を敷いているため遠方攻撃が通じません。";
#				}
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$zhit替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif(!$zhit and int($cd_op1 / 10) ne "9" and int($cd_op1 / 10) ne "8"){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}は敵国の後方都市で直接攻め込むことが出来ません。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif($p_heisisuu{$f_id} < 1){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:兵士数が０で攻め込めません。暇な時間を利用して巡察を行いました。");
									&R_JYUNSATU;
						}else{
							$add_sen_hit=0;
	$sencon = $t_kunino{$ft_id};
		if(int($cd_op1 / 10) eq "8"){
	$sencon = $t_zokuno{$ft_id};
		}
								if($k_kunino{$sencon}){$add_sen_hit=1;}
$ek_id=int($k_kunino{$sencon});
		$senhit3=0;
		&KOUSEN_AITE_HIT("$senhit3","$k_kunino{$ek_id}","$fk_id");
		$senhit3=$kousen_aite_hit;
		$tyohit_add{$k_kokusaku{$fk_id}}=$senhit3;
		$tyohit_add{10}=1;
		$senhit3=$tyohit_add{$k_kokusaku{$k_kunino{$fk_id}}};
							if($add_sen_hit and $ek_id and $k_keika_t{$ek_id} < 72){
							$nokorit = 72 - $k_keika_t{$ek_id};
								$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$k_name{$ek_id}にはまだ攻められません。（残り$nokoritターン）");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:暇な時間を利用して巡察を行いました。");
									&R_JYUNSATU;
							}elsif(!$senhit3 and $k_kunino{$ek_id} and int($cd_op1 / 10) ne "9" and int($cd_op1 / 10) ne "8" and $k_kokusaku{$k_kunino{$fk_id}} ne "10" and $k_kokusaku{$k_kunino{$ek_id}} ne "10"){
								$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$k_name{$ek_id}に対しての攻撃許可が下りませんでした。司令部で交戦設定が必要です。（戦争したい場合は君主・上公・三公の指示を仰いでください）");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:暇な時間を利用して巡察を行いました。");
									&R_JYUNSATU;
							}else{
								if($k_keika_t{$fk_id} < 72){
#								if($k_keika_t{$fk_id} < 72 and $k_kokusaku{$k_kunino{$ek_id}} ne "10"){
							$nokorit = 72 - $k_keika_t{$fk_id};
									$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$k_name{$fk_id}はまだ攻められません。（残り$nokoritターン）");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:暇な時間を利用して巡察を行いました。");
									&R_JYUNSATU;
								}else{

				$ki = 0;
				$kbp_id[$ki] = $f_id;
	($ktotu1,$ktotu2,$ktotu3,$ktotu4,$ktotu41,$ktotu42)= split(/,/,$cd_no);

	if($ktotu1 eq "0"){
		$rh = int(rand(6));
		$ktotu2 = int($rh * 0.5) + 11;
		$ktotu1 = $rh + 1;
	}
	if($ktotu4 eq "0"){
		$add_r_ktotu41[21] = 24;
		$add_r_ktotu41[22] = 21;
		$add_r_ktotu41[23] = 22;
		$add_r_ktotu41[24] = 23;
		$add_r_ktotu42[21] = 22;
		$add_r_ktotu42[22] = 23;
		$add_r_ktotu42[23] = 24;
		$add_r_ktotu42[24] = 21;
		$rh = int(rand(4));
		$ktotu4 = $rh + 21;
		$ktotu41 = $add_r_ktotu41[$ktotu4];
		$ktotu42 = $add_r_ktotu42[$ktotu4];
	}
									$wincomelbs = "";
									$wincomelbs3 = "";
												if(int($cd_op1 / 10) eq "8"){
									$wincomelbs = "の賊砦";
									$wincomelbs3 = "賊砦";
												}
									&M2AP_LOG("<span class=\"c4B0082\">【侵攻】</span>$k_p_k_a{$fk_id}の$p_p_b_a{$f_id}は$t_name{$ft_id}$wincomelbsへ攻め込みました！");
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$nen_genzai年$tuki_genzai月:$k_name{$fk_id}の$p_name{$f_id}は$t_name{$ft_id}$wincomelbsへ攻め込みました！");

$p_ex_karumalc{$f_id} += 2;
$p_ex_karumald{$f_id} -= 2;
										$battle_end=0;
											$lbflag = 0;

		$senhit3=0;
		&KOUSEN_AITE_HIT("$senhit3","$k_kunino{$fk_id}","$ek_id");
		$senhit3=$kousen_aite_hit;
		$tyohit_add{$k_kokusaku{$fk_id}}=$senhit3;
		$tyohit_add{10}=1;
		$senhit3=$tyohit_add{$k_kokusaku{$k_kunino{$fk_id}}};
												if($k_kunino{$fk_id} and $ek_id and !$senhit3  and int($cd_op1 / 10) ne "9"){
#and $k_kokusaku{$t_kunino{$ft_id}} ne "10"
											&CAUNTA;
												}

											$totunyuu=0;
							@DEF_LISTW=();
							open(IN,"./w_db/mati/g$cd_op2.cgi");
							@DEF_LISTW = <IN>;
							close(IN);
											foreach(@DEF_LISTW){
												($d_id,,$dtown_id,$dtown_flg,,$dheisyu,$dmasuta,$dsikikei,$dsubdb1) = split(/<>/);
												if("$t_kunino{$ft_id}" eq "$p_kunino{$d_id}"){
											$totunyuu=1;last;
												}
											}
							@DEF_LISTW=();
							open(IN,"./w_db/mati/s$cd_op2.cgi");
							@DEF_LISTW = <IN>;
							close(IN);
											foreach(@DEF_LISTW){
												($d_id,,$dtown_id,$dtown_flg,,$dheisyu,$dmasuta,$dsikikei,$dsubdb1) = split(/<>/);
												if("$t_kunino{$ft_id}" eq "$p_kunino{$d_id}"){
											$totunyuu=1;last;
												}
											}
							@DEF_LISTW=();
							open(IN,"./w_db/mati/k$cd_op2.cgi");
							@DEF_LISTW = <IN>;
							close(IN);
											foreach(@DEF_LISTW){
												($d_id,,$dtown_id,$dtown_flg,,$dheisyu,$dmasuta,$dsikikei,$dsubdb1) = split(/<>/);
												if("$t_kunino{$ft_id}" eq "$p_kunino{$d_id}"){
											$totunyuu=1;last;
												}
											}
#_/_/_/_/_/連戦拡張_/_/_/_/_/_/_/#
									$sentouiti=0;
										$rupuhit = 6;
											if($p_h_kougun{$f_id} eq "4"){
										$rupuhit += 2;
											}


	&BAG_LOG2("連戦\n");
											$kinukakuhen= 0;

										$jff = 0;
										$sphd = 0;
											$krrk=0;
											$krrkmax =0;
											$krrkkai=0;
										for($krrk=0;$krrk<$rupuhit;$krrk++){

	&BAG_LOG2("krrk$krrk\n");
											@kbp_samon=();
											@ebp_samon=();
											$krrkkai++;
										if($krrk > 0 and $sph ne "2"){
										if($p_heisyu{$f_id} eq "14"){
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("侍女達はホウキ片手にやる気満々だ！！$p_name{$f_id}は次の獲物に狙いを定めた！！");
										}elsif($p_heisyu{$f_id} eq "92"){
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("仙娘達はやる気満々だ！！$p_name{$f_id}は次の獲物に狙いを定めた！！");
										}elsif($p_heisyu{$f_id} eq "15" or $p_heisyu{$f_id} eq "16" or $p_heisyu{$f_id} eq "39" or $p_heisyu{$f_id} eq "41"){
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$SOL_TYPE[$p_heisyu{$f_id}]の連続突撃発動！！$p_name{$f_id}は次の獲物に狙いを定めた！！");
										}elsif($p_heisyu{$f_id} eq "30"){
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("象は雄叫びを上げるとともに更に敵陣深く突進していく！！$p_name{$f_id}は次の獲物に狙いを定めた！！");
										}elsif($kinukakuhen){
											$kbp_samon[0]=11;
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("狗達は荒れ狂い、制御することが出来ない！！$p_name{$f_id}は狗達に導かれるまま次の獲物に狙いを定めた。");
										}elsif($kbp_ff[0] eq "4"){
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("スキル『連続突撃』発動！！$p_name{$f_id}は次の獲物に狙いを定めた！！");
#									&M2AP_LOG("$p_p_b_a{$f_id}の『連続突撃』発動！！");
										}elsif($p_h_kougun{$f_id} eq "6"){
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$p_name{$f_id}の部隊は散開しつつ敵拠点を包囲し、敵部隊の掃討作戦を開始した！！");
										}else{
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("国策：$KOKUSAKU[$k_kokusaku{$p_kunino{$f_id}}]『連続突撃』発動！！$p_name{$f_id}は次の獲物に狙いを定めた！！");
#									&M2AP_LOG("$k_name{$fk_id}の国策：$KOKUSAKU[$k_kokusaku{$p_kunino{$f_id}}]『連続突撃』発動！！！！");
										}
									if($p_h_kougun{$f_id} eq "5"){
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$p_name{$f_id}の部隊は兵力を一点に集中させ敵陣突破を図り、次の拠点へと突進していく！！");
									}

										}
#_/_/_/_/_/連戦拡張_/_/_/_/_/_/_/#

										$battle_endf=0;
										$boueizanc = "";

				$kex_add = 0;
									$sentouitibk=$sentouiti;
									$tikohn = 20;
									$slog_kz="";
									$slog_kz2="slog_tk";
										$p_b_idou_sokudo_hosei{$f_id} = 1;
									$ksenjt=0;
									$esenjt=0;
									$kyoujt=0;
									$eyoujt=0;
									$kgenjt=0;
									$egenjt=0;
									$ktiyujt=0;
									$etiyujt=0;
									$khadoku=0;
									$ehadoku=0;
									$kdoku=0;
									$edoku=0;
									$khusi=0;
									$ehusi=0;
									$knetu=0;
									$enetu=0;
									$katt_add3 = 0;
									$eatt_add3 = 0;
									$kheisin = 0;
									$eheisin = 0;
									$konmyou1add = 0;
									$eonmyou1add = 0;
									$konmyou1r = 48;
									$eonmyou1r = 48;
									$ktyakka = 0;
									$etyakka = 0;
									$khukou = 0;
									$ehukou = 0;
									$kkouhuku = 0;
									$ekouhuku = 0;
									$khusyoubou = 0;
									$ehusyoubou = 0;
									$ksikibou = 0;
									$esikibou = 0;
										$ksisihunjin = 0;
										$esisihunjin = 0;
										$ktankigake = 0;
										$etankigake = 0;
										$kkonranbou = 0;
										$ekonranbou = 0;
										$ktikeiryaku = 0;
										$etikeiryaku = 0;
										$khusyoukou = 0;
										$ehusyoukou = 0;

	$ef16 = "";$mfcomef = "";
										
										$mdid = "";
									$d_hit2=0;
									$d_hit3=0;
									$d_hit=0;
									$itten=0;
									$sph=0;
#_/_/_/_/_/賊_/_/_/_/_/_/_/#
										$battle_end=0;
			if(int($cd_op1 / 10) eq "9"){$md_eria=80;
			$defitidefo = $md_eria;
			}elsif(int($cd_op1 / 10) eq "8"){
									$slog_kz="z";
									$slog_kz2="slog_tz";
											if($itten == 0){
									$sentouiti=1;
									$sph=0;

									$w_def_id="d_$cd_op2\_999";
									$def_kazu{$w_def_id}=int($def_kazu{$w_def_id});
									$w_def_i=$def_kazu{$w_def_id}-1;
									while($w_def_i >= 0){
										($mdid,$mdname,$md_tosi,$md_eria,$md_kuni) = split(/<>/ ,${"DEF_L_$w_def_id"}[$w_def_i]);
										if($p_kunino{$f_id} ne $md_kuni and $p_heisisuu{$mdid} and !$p_hjijyou_w{$mdid}[1]){
			$defitidefo = $md_eria;
											$d_hit=1;$d_hit2=1;last;
										}
									$w_def_i--;
									}
									
										if($d_hit==1){
		$e_id=$mdid;

										if($p_heisyu{$f_id} eq "15" and $sphd == 0 and ($SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "1" or $SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "3" or $SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "11")){
										if(int(rand(2)) < 1){
										$sphd = 1;
									
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$p_name{$f_id}の$SOL_TYPE[$p_heisyu{$f_id}]は、迎撃に出ていた$p_p_b_a{$e_id}の$SOL_TYPE[$p_heisyu{$e_id}]部隊をかわして次の部隊に狙いを定めた！！");

	$w_id=$p_id{$e_id};&P_LOG_W("$nen_genzai年$tuki_genzai月:$p_p_b_a{$f_id}の$SOL_TYPE[$p_heisyu{$f_id}]は、迎撃に出ていた$p_name{$e_id}の$SOL_TYPE[$p_heisyu{$e_id}]部隊をいともあっさりとかわしきり、遥か後方へと駆け抜けていく！！");
										}
										}else{
									$tikohn = 10;
										}

										}

												if($sphd == 1){$d_hit=0;
									$w_def_id="d_$cd_op2\_999";
									$def_kazu{$w_def_id}=int($def_kazu{$w_def_id});
									$w_def_i=$def_kazu{$w_def_id}-1;
									while($w_def_i >= 0){
										($mdid,$mdname,$md_tosi,$md_eria,$md_kuni) = split(/<>/ ,${"DEF_L_$w_def_id"}[$w_def_i]);
										if($p_kunino{$f_id} ne $md_kuni and $p_heisisuu{$mdid} and !$p_hjijyou_w{$mdid}[1]){
		$e_id=$mdid;
								if($p_heisyu{$f_id} eq "15" and ($SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "1" or $SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "3" or $SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "11")){
								}else{
			$defitidefo = $md_eria;
											$d_hit=1;$d_hit2=1;last;
								}
										}
									$w_def_i--;
									}
												if($d_hit == 0){
									
												}
												}
											}
			}else{
#_/_/_/_/_/VS1_/_/_/_/_/_/_/#
										if(!$krrk){
									$sentouiti0=1;
									$sentouiti=0;
										}
										if($krrk and $p_h_kougun{$f_id} eq "5"){
								if($sentouiti > 0){
									$itten=1;
								}else{
									$itten=0;
								}
										}
											if($itten == 0){
									$sentouiti=1;
									if($sentouiti0 <= $sentouiti){
									$sph=0;

									$w_def_id="d_$cd_op2\_$ktotu1";
									$def_kazu{$w_def_id}=int($def_kazu{$w_def_id});
									$w_def_i=$def_kazu{$w_def_id}-1;
									while($w_def_i >= 0){
										($mdid,$mdname,$md_tosi,$md_eria,$md_kuni) = split(/<>/ ,${"DEF_L_$w_def_id"}[$w_def_i]);
										if($p_kunino{$f_id} ne $md_kuni and $p_heisisuu{$mdid} and !$p_hjijyou_w{$mdid}[1]){
			$defitidefo = $md_eria;
											$d_hit=1;$d_hit2=1;last;
										}
									$w_def_i--;
									}

									}
									
										if($d_hit==1){
		$e_id=$mdid;
										if($p_heisyu{$f_id} eq "15" and $sphd == 0 and ($SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "1" or $SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "3" or $SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "11")){
										if(int(rand(2)) < 1){
										$sphd = 1;
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$p_name{$f_id}の$SOL_TYPE[$p_heisyu{$f_id}]は、迎撃に出ていた$p_p_b_a{$e_id}の$SOL_TYPE[$p_heisyu{$e_id}]部隊をかわして次の部隊に狙いを定めた！！");									

	$w_id=$p_id{$e_id};&P_LOG_W("$nen_genzai年$tuki_genzai月:$p_p_b_a{$f_id}の$SOL_TYPE[$p_heisyu{$f_id}]は、迎撃に出ていた$p_name{$e_id}の$SOL_TYPE[$p_heisyu{$e_id}]部隊をいともあっさりとかわしきり、遥か後方へと駆け抜けていく！！");
										}
										}else{
									$tikohn = 10;
											if($cd_op1 eq "3"){
									$tikohn = 25;
											}elsif($cd_op1 eq "2"){
									$tikohn = 15;
											}
											if(1 == $md_eria){
									$katt_add3 += int(($tiko1[$p_heisyu{$f_id}] - 20) * $p_sougou{$f_id}/150);
									$eatt_add3 += int(($tiko1[$p_heisyu{$e_id}] - $tikohn) * ($p_tousotu{$e_id} + $p_tiryoku{$e_id} + $p_buryoku{$e_id})/150);
											}elsif(2 == $md_eria){
									$katt_add3 += int(($tiko2[$p_heisyu{$f_id}] - 20) * $p_sougou{$f_id}/150);
									$eatt_add3 += int(($tiko2[$p_heisyu{$e_id}] - $tikohn) * ($p_tousotu{$e_id} + $p_tiryoku{$e_id} + $p_buryoku{$e_id})/150);
											}elsif(3 == $md_eria){
									$katt_add3 += int(($tiko3[$p_heisyu{$f_id}] - 20) * $p_sougou{$f_id}/150);
									$eatt_add3 += int(($tiko3[$p_heisyu{$e_id}] - $tikohn) * ($p_tousotu{$e_id} + $p_tiryoku{$e_id} + $p_buryoku{$e_id})/150);
											}elsif(4 == $md_eria){
									$katt_add3 += int(($tiko4[$p_heisyu{$f_id}] - 20) * $p_sougou{$f_id}/150);
									$eatt_add3 += int(($tiko4[$p_heisyu{$e_id}] - $tikohn) * ($p_tousotu{$e_id} + $p_tiryoku{$e_id} + $p_buryoku{$e_id})/150);
											}elsif(5 == $md_eria){
									$katt_add3 += int(($tiko5[$p_heisyu{$f_id}] - 20) * $p_sougou{$f_id}/150);
									$eatt_add3 += int(($tiko5[$p_heisyu{$e_id}] - $tikohn) * ($p_tousotu{$e_id} + $p_tiryoku{$e_id} + $p_buryoku{$e_id})/150);
											}elsif(6 == $md_eria){
									$katt_add3 += int(($tiko6[$p_heisyu{$f_id}] - 20) * $p_sougou{$f_id}/150);
									$eatt_add3 += int(($tiko6[$p_heisyu{$e_id}] - $tikohn) * ($p_tousotu{$e_id} + $p_tiryoku{$e_id} + $p_buryoku{$e_id})/150);
											}
										}

										}

												if($sphd == 1){$d_hit=0;

									$w_def_id="d_$cd_op2\_$ktotu1";
									$def_kazu{$w_def_id}=int($def_kazu{$w_def_id});
									$w_def_i=$def_kazu{$w_def_id}-1;
									while($w_def_i >= 0){
										($mdid,$mdname,$md_tosi,$md_eria,$md_kuni) = split(/<>/ ,${"DEF_L_$w_def_id"}[$w_def_i]);
										if($p_kunino{$f_id} ne $md_kuni and $p_heisisuu{$mdid} and !$p_hjijyou_w{$mdid}[1]){
		$e_id=$mdid;
								if($p_heisyu{$f_id} eq "15" and ($SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "1" or $SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "3" or $SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "11")){
								}else{
			$defitidefo = $md_eria;
											$d_hit=1;$d_hit2=1;last;
								}
										}
									$w_def_i--;
									}
												if($d_hit == 0){
									
												}
												}
											}
#_/_/_/_/_/VS2_/_/_/_/_/_/_/#
										if($krrk and $p_h_kougun{$f_id} eq "5"){
								if($sentouiti > 1){
									$itten=1;
								}else{
									$itten=0;
								}
										}
											if($d_hit == 0 and $itten == 0){
									$sentouiti=2;
										if(!$krrk){
									$sentouiti0=2;
										}
									$d_hit3=1;
									if($sentouiti0 <= $sentouiti){
									$sph=0;

									$w_def_id="d_$cd_op2\_$ktotu2";
									$def_kazu{$w_def_id}=int($def_kazu{$w_def_id});
									$w_def_i=$def_kazu{$w_def_id}-1;
									while($w_def_i >= 0){
										($mdid,$mdname,$md_tosi,$md_eria,$md_kuni) = split(/<>/ ,${"DEF_L_$w_def_id"}[$w_def_i]);
										if($p_kunino{$f_id} ne $md_kuni and $p_heisisuu{$mdid} and !$p_hjijyou_w{$mdid}[1]){
			$defitidefo = $md_eria;
											$d_hit=1;$d_hit2=1;last;
										}
									$w_def_i--;
									}

									}
									
										if($d_hit==1){
									$e_id=$mdid;

										if($p_heisyu{$f_id} eq "15" and $sphd == 0 and ($SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "1" or $SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "3" or $SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "11")){
										if(int(rand(2)) < 1){
										$sphd = 1;
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$p_name{$f_id}の$SOL_TYPE[$p_heisyu{$f_id}]は、迎撃に出ていた$p_p_b_a{$e_id}の$SOL_TYPE[$p_heisyu{$e_id}]部隊をかわして次の部隊に狙いを定めた！！");									

	$w_id=$p_id{$e_id};&P_LOG_W("$nen_genzai年$tuki_genzai月:$p_p_b_a{$f_id}の$SOL_TYPE[$p_heisyu{$f_id}]は、迎撃に出ていた$p_name{$e_id}の$SOL_TYPE[$p_heisyu{$e_id}]部隊をいともあっさりとかわしきり、遥か後方へと駆け抜けていく！！");
										}
										}else{
									$tikohn = 10;
											if($cd_op1 eq "2"){
									$tikohn = 15;
											}
											if(11 == $md_eria){
									$katt_add3 += int(($tiko11[$p_heisyu{$f_id}] - 20) * $p_sougou{$f_id}/150);
									$eatt_add3 += int(($tiko11[$p_heisyu{$e_id}] - $tikohn) * ($p_tousotu{$e_id} + $p_tiryoku{$e_id} + $p_buryoku{$e_id})/150);
											}elsif(12 == $md_eria){
									$katt_add3 += int(($tiko12[$p_heisyu{$f_id}] - 20) * $p_sougou{$f_id}/150);
									$eatt_add3 += int(($tiko12[$p_heisyu{$e_id}] - $tikohn) * ($p_tousotu{$e_id} + $p_tiryoku{$e_id} + $p_buryoku{$e_id})/150);
											}elsif(13 == $md_eria){
									$katt_add3 += int(($tiko13[$p_heisyu{$f_id}] - 20) * $p_sougou{$f_id}/150);
									$eatt_add3 += int(($tiko13[$p_heisyu{$e_id}] - $tikohn) * ($p_tousotu{$e_id} + $p_tiryoku{$e_id} + $p_buryoku{$e_id})/150);
											}
										}

										}

												if($sphd == 1){$d_hit=0;
									$w_def_id="d_$cd_op2\_$ktotu2";
									$def_kazu{$w_def_id}=int($def_kazu{$w_def_id});
									$w_def_i=$def_kazu{$w_def_id}-1;
									while($w_def_i >= 0){
										($mdid,$mdname,$md_tosi,$md_eria,$md_kuni) = split(/<>/ ,${"DEF_L_$w_def_id"}[$w_def_i]);
										if($p_kunino{$f_id} ne $md_kuni and $p_heisisuu{$mdid} and !$p_hjijyou_w{$mdid}[1]){
									$e_id=$mdid;

								if($p_heisyu{$f_id} eq "15" and ($SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "1" or $SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "3" or $SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "11")){
								}else{
			$defitidefo = $md_eria;
											$d_hit=1;$d_hit2=1;last;
										}
								}
									$w_def_i--;
									}
												if($d_hit == 0){
									
												}
												}
											}
#_/_/_/_/_/VS3_/_/_/_/_/_/_/#
										if($krrk and $p_h_kougun{$f_id} eq "5"){
								if($sentouiti > 2){
									$itten=1;
								}else{
									$itten=0;
								}
										}
											if($d_hit == 0 and $itten == 0){
									$sentouiti=3;
										if(!$krrk){
									$sentouiti0=3;
										}
									if($sentouiti0 <= $sentouiti){
									$sph=0;
									$w_def_id="d_$cd_op2\_$ktotu3";
									$def_kazu{$w_def_id}=int($def_kazu{$w_def_id});
									$w_def_i=$def_kazu{$w_def_id}-1;
									while($w_def_i >= 0){
										($mdid,$mdname,$md_tosi,$md_eria,$md_kuni) = split(/<>/ ,${"DEF_L_$w_def_id"}[$w_def_i]);
										if($p_kunino{$f_id} ne $md_kuni and $p_heisisuu{$mdid} and !$p_hjijyou_w{$mdid}[1]){
			$defitidefo = $md_eria;
											$d_hit=1;$d_hit2=1;last;
										}
									$w_def_i--;
									}

									}
									
										if($d_hit==1){
									$e_id=$mdid;


										if($p_heisyu{$f_id} eq "15" and $sphd == 0 and ($SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "1" or $SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "3" or $SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "11")){
										if(int(rand(2)) < 1){
										$sphd = 1;
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$p_name{$f_id}の$SOL_TYPE[$p_heisyu{$f_id}]は、迎撃に出ていた$p_p_b_a{$e_id}の$SOL_TYPE[$p_heisyu{$e_id}]部隊をかわして次の部隊に狙いを定めた！！");								

	$w_id=$p_id{$e_id};&P_LOG_W("$nen_genzai年$tuki_genzai月:$p_p_b_a{$f_id}の$SOL_TYPE[$p_heisyu{$f_id}]は、迎撃に出ていた$p_name{$e_id}の$SOL_TYPE[$p_heisyu{$e_id}]部隊をいともあっさりとかわしきり、遥か後方へと駆け抜けていく！！");
										}
										}else{
									$katt_add3 += int(5 * $p_sougou{$f_id}/150);
										}

										}

												if($sphd == 1){$d_hit=0;
									$w_def_id="d_$cd_op2\_$ktotu3";
									$def_kazu{$w_def_id}=int($def_kazu{$w_def_id});
									$w_def_i=$def_kazu{$w_def_id}-1;
									while($w_def_i >= 0){
										($mdid,$mdname,$md_tosi,$md_eria,$md_kuni) = split(/<>/ ,${"DEF_L_$w_def_id"}[$w_def_i]);
										if($p_kunino{$f_id} ne $md_kuni and $p_heisisuu{$mdid} and !$p_hjijyou_w{$mdid}[1]){
									$e_id=$mdid;

								if($p_heisyu{$f_id} eq "15" and ($SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "1" or $SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "3" or $SOL_ZOKUSEIT[$p_heisyu{$e_id}] eq "11")){
								}else{
			$defitidefo = $md_eria;
											$d_hit=1;$d_hit2=1;last;
								}
										}
									$w_def_i--;
									}
												if($d_hit == 0){
									
												}
												}
											}
#_/_/_/_/_/VSNIN_/_/_/_/_/_/_/#
										if($cd_op1 ne "5"){
										$dhnin = int(rand(6));
									if($cd_op1 == 1){
										$dhnin = int(rand(18));
									}
										$dhnins = 0;
									if($p_syomotu{$f_id} eq "2012" and $dhnin < 1 and $cd_op1 ne "2"){
										$dhnins = 1;
										if($totunyuu > 0){
										$dhnins = 0;
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("強行突破を試みたものの罠が張り巡らされているため、$p_name{$f_id}は敵部隊をかわすことが出来ない。");
										}
									}
									if($d_hit == 1 and $dhnins == 1){
											$d_hit=0;
									$katt_add3 = 0;
									$eatt_add3 = 0;
									$sentouiti0=4;
									&M2AP_LOG("&nbsp;&nbsp;&nbsp;<span class=\"cDA70D6\">◆</span>&nbsp;$p_p_b_a{$f_id}は得意の忍術を駆使し防衛戦をすり抜けて直接$t_name{$ft_id}の城へ攻撃を仕掛けました！！");
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$p_p_b_a{$f_id}は得意の忍術を駆使し防衛戦をすり抜けて直接$t_name{$ft_id}の城へ攻撃を仕掛けました！！");
									}
										}
#_/_/_/_/_/VS4_/_/_/_/_/_/_/#
										if($krrk and $p_h_kougun{$f_id} eq "5"){
								if($sentouiti > 3){
									$itten=1;
								}else{
									$itten=0;
								}
										}
											if($d_hit == 0 and $itten == 0){
									$sentouiti=4;
										if(!$krrk){
									$sentouiti0=4;
										}
									if($sentouiti0 <= $sentouiti){
									$sph=0;
									$w_def_id="d_$cd_op2\_$ktotu4";
									$def_kazu{$w_def_id}=int($def_kazu{$w_def_id});
									$w_def_i=$def_kazu{$w_def_id}-1;
									while($w_def_i >= 0){
										($mdid,$mdname,$md_tosi,$md_eria,$md_kuni) = split(/<>/ ,${"DEF_L_$w_def_id"}[$w_def_i]);
										if($p_kunino{$f_id} ne $md_kuni and $p_heisisuu{$mdid} and !$p_hjijyou_w{$mdid}[1]){
			$defitidefo = $md_eria;
											$d_hit=1;$d_hit2=0;last;
										}
									$w_def_i--;
									}

									}
									
										if($d_hit==1){
									$e_id=$mdid;
									$katt_add3 -= int(10 * $p_sougou{$f_id}/150);

										}

											}
#_/_/_/_/_/VS4_/_/_/_/_/_/_/#
										if($krrk and $p_h_kougun{$f_id} eq "5"){
								if($sentouiti > 3){
									$itten=1;
								}else{
									$itten=0;
								}
										}
											if($d_hit == 0 and $dhnins == 0 and $p_heisyu{$f_id} ne "11" and $p_syomotu{$f_id} ne "2012" and $itten == 0){
									$sph=0;
									$w_def_id="d_$cd_op2\_$ktotu41";
									$def_kazu{$w_def_id}=int($def_kazu{$w_def_id});
									$w_def_i=$def_kazu{$w_def_id}-1;
									while($w_def_i >= 0){
										($mdid,$mdname,$md_tosi,$md_eria,$md_kuni) = split(/<>/ ,${"DEF_L_$w_def_id"}[$w_def_i]);
										if($p_kunino{$f_id} ne $md_kuni and $p_heisisuu{$mdid} and !$p_hjijyou_w{$mdid}[1]){
			$defitidefo = $md_eria;
											$mfcomef="『$t_name{$ft_id}$senno[$md_eria]』を守備していた$mdnameは、$p_name{$f_id}の侵入に気づき『$t_name{$ft_id}$senno[$ktotu4]』の守備に入った！<br />";$md_eria=$ktotu4;$d_hit=1;$d_hit2=0;last;
										}
									$w_def_i--;
									}
										if($d_hit==0){
									$w_def_id="d_$cd_op2\_$ktotu42";
									$def_kazu{$w_def_id}=int($def_kazu{$w_def_id});
									$w_def_i=$def_kazu{$w_def_id}-1;
									while($w_def_i >= 0){
										($mdid,$mdname,$md_tosi,$md_eria,$md_kuni) = split(/<>/ ,${"DEF_L_$w_def_id"}[$w_def_i]);
										if($p_kunino{$f_id} ne $md_kuni and $p_heisisuu{$mdid} and !$p_hjijyou_w{$mdid}[1]){
			$defitidefo = $md_eria;
											$mfcomef="『$t_name{$ft_id}$senno[$md_eria]』を守備していた$mdnameは、$p_name{$f_id}の侵入に気づき『$t_name{$ft_id}$senno[$ktotu4]』の守備に入った！<br />";$md_eria=$ktotu4;$d_hit=1;$d_hit2=0;last;
										}
									$w_def_i--;
									}
										}
									
										if($d_hit==1){
									$e_id=$mdid;

									$katt_add3 += int(5 * $p_sougou{$f_id}/150);

										}

											}
#_/_/_/_/_/VSEND_/_/_/_/_/_/_/#

	&BAG_LOG2("VSEND\n");

									if($d_hit2==1 and $cd_op1 == 1 and $dhnins == 0){
										$sph = 1;
											$krrk+=100;
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$t_name{$ft_id}$senno[$md_eria]に敵迎撃部隊が待ち受けていたため、$p_name{$f_id}は途中で引き返した。");
									}elsif($d_hit2==0 and $cd_op1 == 2){
										$sph = 1;
											$krrk+=100;
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$t_name{$ft_id}には迎撃部隊が居ないようだ・・。$p_name{$f_id}は引き返した。");
									}elsif($d_hit==0 and $cd_op1 == 4){
										$sph = 1;
											$krrk+=100;
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$t_name{$ft_id}$senno[$ktotu4]には防衛部隊が居ないようだ・・。$p_name{$f_id}は敵城手前で引き返した。");
									}elsif($d_hit3==1 and $cd_op1 == 3){
										$sph = 1;
											$krrk+=100;
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$t_name{$ft_id}$senno[$md_eria]（国境付近）には敵防衛部隊が居ないようだ・・。$p_name{$f_id}は途中で引き返した。");
									}elsif($d_hit==1 and $cd_op1 == 5){
										$sph = 1;
											$krrk+=100;
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$t_name{$ft_id}$senno[$md_eria]に敵迎撃部隊が待ち受けていたため、$p_name{$f_id}は途中で引き返した。");
									}
									if($sentouiti0 < $sentouiti and $p_h_kougun{$f_id} eq "6" and $sph==0){
										$ktotu_pos[1] = $ktotu1;
										$ktotu_pos[2] = $ktotu2;
										$ktotu_pos[3] = $ktotu3;
										$ktotu_pos[4] = $ktotu4;
										$sph = 1;
											$krrk+=100;
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$t_name{$ft_id}$senno[$ktotu_pos[$sentouiti0]]には敵防衛部隊が居ないようだ・・。$p_name{$f_id}は途中で引き返した。");
									}
									if($d_hit==2){
										$sph = 2;
									}
#_/_/_/_/_/賊_/_/_/_/_/_/_/#
			}
#_/_/_/_/_/賊_/_/_/_/_/_/_/#

									if($sph==0){

#######################

	if($butai_no{$p_butaino{$f_id}}){
		$kbt_namae = $butai_name{$p_butaino{$f_id}};
	}else{
		$kbt_namae = $p_name{$f_id};
	}

					$count = 0;
		$mapseiseibls = "";
		$mapseiseiblt = "";
		$mapseiseiblp = "";
		$mapseiseiblm = "";
		$mapseiseible = "";
		$mapseiseiblt .= "
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/main.css\" />
<title>$GAME_TITLE$MEN_TITLE $outyou $yold_date</title>
<script language=\"javascript\" src=\"$CSS_URI/slog.js\"></script>
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/slog.css\" />
</head><body>$TAG_div_s{$doc_mode}

<a id=t></a>
<a href=\"$URI/?.m.=map2\" target=\"_top\">《 全体ログへ移動 》</a>\n<a href=\"$URI/\" target=\"_top\">《 ログイン画面に戻る 》</a>\n<a href=\"http://kunitori.com/\" target=\"_top\">《 国取.comへ移動 》</a><br /><br />
●\[$old_date\]: $p_p_b_a{$f_id}率いる$k_p_k_a{$p_kunino{$f_id}}の$kbt_namae部隊は$t_name{$ft_id}$wincomelbsへ攻め込みました！$tt_date<br />
";

		$mapseiseible .= "

<br /></div></body></html>";
#######################
				$ei = 0;
										$wincomelbs2="";
									if($d_hit == 1){
										$battle_end=0;


				$ebp_id[$ei] = $p_id{$e_id};

									if(!$wincomelbs){
										$wincomelbs2="$senno[$md_eria]";
									}
		$mapseiseiblt .= "<br /><br /><span class=\"fs4\"><i><a href=\"$URI/?.m.=$slog_kz2&amp;.id.=$cd_op2\" target=\"_blank\">$t_name{$ft_id}</a>$wincomelbs$wincomelbs2\-攻防戦</i></span><br /><br />";
		$slogt = "$t_name{$ft_id}$wincomelbs$wincomelbs2\-攻防戦";
		$ebt_namae = "$p_name{$e_id}";
									}else{
				$ebp_id[$ei] = 0;
				$e_id = 0;
	$p_id{$e_id} = 0;
									if(!$wincomelbs){
										$wincomelbs2="城";
									}
		$mapseiseiblt .= "<br /><br /><span class=\"fs4\"><i><a href=\"$URI/?.m.=$slog_kz2&amp;.id.=$cd_op2\" target=\"_blank\">$t_name{$ft_id}</a>$wincomelbs$wincomelbs2\-攻防戦</i></span><br /><br />";
		$slogt = "$t_name{$ft_id}$wincomelbs$wincomelbs2\-攻防戦";
					

										$p_b_hirou{$e_id} = 0;
										$p_h_hirou{$e_id} = 0;
										$p_hei_siki{$e_id} = 66;
										$p_b_kougun{$e_id} = 0;
										$p_h_kougun{$e_id} = 0;
										$p_jintousiki{$e_id} = 0;
										$p_jyoujihousin1{$e_id} = 0;
										$bouei_add_hosei = int($sougouno1/150);
			if(int($cd_op1 / 10) eq "9"){
										$p_heisyu{$e_id}=3;

									if($t_gijyutu_ti{$ft_id} >= 970 and $t_siro_taikyuu_ti{$ft_id} >= 800){$p_heisyu{$e_id} = 20;
									}elsif($t_gijyutu_ti{$ft_id} >= 900 and $t_siro_taikyuu_ti{$ft_id} >= 500){$p_heisyu{$e_id} = 19;
									}elsif($t_gijyutu_ti{$ft_id} >= 500 and $t_siro_taikyuu_ti{$ft_id} >= 200){$p_heisyu{$e_id} = 7;
									}
										$boueizanc = $t_siro_bouei_ti{$ft_id};
									if($t_siro_bouei_ti{$ft_id} > 1000 * $bouei_add_hosei){
									$bouei_add = int(($t_siro_bouei_ti{$ft_id} - 1000 * $bouei_add_hosei) * 0.2)+700 * $bouei_add_hosei;
									$bouei_addc = 0.8;
									}elsif($t_siro_bouei_ti{$ft_id} > 500 * $bouei_add_hosei){
									$bouei_add = int(($t_siro_bouei_ti{$ft_id} - 500 * $bouei_add_hosei) * 0.4)+500 * $bouei_add_hosei;
									$bouei_addc = 0.9;
									}else{
									$bouei_add = $t_siro_bouei_ti{$ft_id};
									$bouei_addc = 1.1;
									}
									$bouei_add2 = int($bouei_add * 30);
									$bouei_add2c = int($bouei_add * 30 * $bouei_addc);
									$bouei_add3 = int(rand($p_heisisuu{$f_id} * 6))+ int($p_heisisuu{$f_id} * 4 * ($krrk + 1) * ($krrk + 1));
									if($bouei_add3 > $bouei_add2c){
									$bouei_add3 = $bouei_add2c;
									}
									$bouei_add = $bouei_add3;
$md_eria = "980";
			$defitidefo = $md_eria;
											$lbflag = 1;
										$p_name{$e_id} = "城内衛兵";
										$k_kokka_keitai{0}=0;
											$p_bp2id{$e_id} = "siro_eihei";
											$p_img{$e_id} = "$IMG{0}/siro_eihei";
											$p_img_f{$e_id} = $p_img_kakutyou{0};
											$p_img_m{$e_id} = $p_img_mime{0};
$add = int(rand(8))+1;
		$ebt_namae = "城内衛兵第$add";
										$p_buryoku{$e_id} = int($t_siro_taikyuu_ti{$ft_id} * $p_sougou{$f_id}/7500)+ int($p_sougou{$f_id} * 0.15);
										$p_tiryoku{$e_id} = int($t_siro_taikyuu_ti{$ft_id} * $p_sougou{$f_id}/7500)+ int($p_sougou{$f_id} * 0.15);
										$p_tousotu{$e_id} = int($t_siro_taikyuu_ti{$ft_id} * $p_sougou{$f_id}/7500)+ int($p_sougou{$f_id} * 0.57);
										$p_jinbou{$e_id} = 70;
										$eatt_def2 = int($t_siro_taikyuu_ti{$ft_id} * $p_sougou{$f_id}/3000);
										$p_kunren{$e_id} = 50+ int($t_gijyutu_ti{$ft_id}/20);
										$p_kunino{$e_id} = $ek_id;
										$md_kuni = $ek_id;
										$battle_end=1;
			}elsif(int($cd_op1 / 10) eq "8"){
										$p_heisyu{$e_id}=9;

										$boueizanc = $t_zoku_bouei_ti{$ft_id};
									if($t_zoku_bouei_ti{$ft_id} > 1000 * $bouei_add_hosei){
									$bouei_add = int(($t_zoku_bouei_ti{$ft_id} - 1000 * $bouei_add_hosei) * 0.2)+700 * $bouei_add_hosei;
									$bouei_addc = 0.8;
									}elsif($t_zoku_bouei_ti{$ft_id} > 500 * $bouei_add_hosei){
									$bouei_add = int(($t_zoku_bouei_ti{$ft_id} - 500 * $bouei_add_hosei) * 0.4)+500 * $bouei_add_hosei;
									$bouei_addc = 0.9;
									}else{
									$bouei_add = $t_zoku_bouei_ti{$ft_id};
									$bouei_addc = 1.1;
									}
									$bouei_add2 = int($bouei_add * 30);
									$bouei_add2c = int($bouei_add * 30 * $bouei_addc);
									$bouei_add3 = int(rand($p_heisisuu{$f_id} * 6))+ int($p_heisisuu{$f_id} * 4 * ($krrk + 1) * ($krrk + 1));
									if($bouei_add3 > $bouei_add2c){
									$bouei_add3 = $bouei_add2c;
									}
									$bouei_add = $bouei_add3;
$md_eria = "990";
			$defitidefo = $md_eria;
											$lbflag = 1;
										$p_name{$e_id} = "賊砦防衛隊";
										$k_kokka_keitai{0}=1;
											$p_bp2id{$e_id} = "zoku_eihei";
											$p_img{$e_id} = "$IMG{0}/zoku_eihei";
											$p_img_f{$e_id} = $p_img_kakutyou{0};
											$p_img_m{$e_id} = $p_img_mime{0};
$add = int(rand(8))+1;
		$ebt_namae = "賊砦防衛隊第$add";
										$p_buryoku{$e_id} = int($t_zoku_taikyuu_ti{$ft_id} * $p_sougou{$f_id}/7500)+ int($p_sougou{$f_id} * 0.57);
										$p_tiryoku{$e_id} = int($t_zoku_taikyuu_ti{$ft_id} * $p_sougou{$f_id}/7500)+ int($p_sougou{$f_id} * 0.15);
										$p_tousotu{$e_id} = int($t_zoku_taikyuu_ti{$ft_id} * $p_sougou{$f_id}/7500)+ int($p_sougou{$f_id} * 0.15);
										$p_jinbou{$e_id} = 70;
										$eatt_def2 = int($t_zoku_taikyuu_ti{$ft_id} * $p_sougou{$f_id}/3000);
										$p_kunren{$e_id} = 50+ int($t_gijyutu_ti{$ft_id}/20);
										$p_kunino{$e_id} = $ek_id;
										$md_kuni = $ek_id;
										$battle_end=1;
			}else{
											$p_bp2id{$e_id} = "siro_eihei";
											$p_img{$e_id} = "$IMG{0}/siro_eihei";
											$p_img_f{$e_id} = $p_img_kakutyou{0};
											$p_img_m{$e_id} = $p_img_mime{0};

										$boueizanc = $t_siro_bouei_ti{$ft_id};
									if($t_siro_bouei_ti{$ft_id} > 1000 * $bouei_add_hosei){
									$bouei_add = int(($t_siro_bouei_ti{$ft_id} - 1000 * $bouei_add_hosei) * 0.2)+700 * $bouei_add_hosei;
									$bouei_addc = 0.6;
									}elsif($t_siro_bouei_ti{$ft_id} > 500 * $bouei_add_hosei){
									$bouei_add = int(($t_siro_bouei_ti{$ft_id} - 500 * $bouei_add_hosei) * 0.4)+500 * $bouei_add_hosei;
									$bouei_addc = 0.8;
									}else{
									$bouei_add = $t_siro_bouei_ti{$ft_id};
									$bouei_addc = 1.1;
									}

									$bouei_add2 = int($bouei_add * 1);
									$bouei_add2c = int($bouei_add * 1 * $bouei_addc);
									$bouei_add3 = int(rand($p_heisisuu{$f_id} * 6))+ int($p_heisisuu{$f_id} * 4 * ($krrk + 1) * ($krrk + 1));
									if($bouei_add3 > $bouei_add2c){
									$bouei_add3 = $bouei_add2c;
									}
									$bouei_add = $bouei_add3;

										$p_heisyu{$e_id}=3;

									if($t_gijyutu_ti{$ft_id} >= 970 and $t_siro_taikyuu_ti{$ft_id} >= 800){$p_heisyu{$e_id} = 20;
									}elsif($t_gijyutu_ti{$ft_id} >= 900 and $t_siro_taikyuu_ti{$ft_id} >= 500){$p_heisyu{$e_id} = 19;
									}elsif($t_gijyutu_ti{$ft_id} >= 500 and $t_siro_taikyuu_ti{$ft_id} >= 200){$p_heisyu{$e_id} = 7;
									}

				$kkcr = int(rand(240));


							if($kkcr < 1 and $t_tian_ti{$ft_id} > 96){
								$p_heisyu{$e_id} = 91;
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$t_name{$ft_id} /城壁に仙人が現れた！！");
						}elsif($kkcr < 1 and $t_gijyutu_ti{$ft_id} > 970){
								$p_heisyu{$e_id} = 92;
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$t_name{$ft_id} /城壁に仙娘が現れた！！");
						}
							if($kkcr < 3 and $t_tian_ti{$ft_id} < 20){
								$p_heisyu{$e_id} = 93;
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$t_name{$ft_id} /城壁に吸血姫が出没した！！");
						}


$kfvhit = "";
							if($kkcr > 220 + $town_get[$t_kunino{$ft_id}] and ($t_siro_taikyuu_ti{$ft_id} > 900 or $bouei_add < 150) and $t_tian_ti{$ft_id} > 96 and $tuki_genzai > 9){
	$ef16 = "2";$kfvhit = "玄武";
										$p_name{$e_id} = "玄武守護城壁";
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$t_name{$ft_id} /雪舞い降りる冬、城壁に玄武が現れた！！！");
						}elsif($kkcr > 220 + $town_get[$t_kunino{$ft_id}] and ($t_siro_taikyuu_ti{$ft_id} > 900 or $bouei_add < 150) and $t_tian_ti{$ft_id} > 96 and $tuki_genzai > 6){
	$ef16 = "1";$kfvhit = "白虎";
										$p_name{$e_id} = "白虎守護城壁";
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$t_name{$ft_id} /風舞い踊る秋、城壁に颯爽と白虎が現れた！！！");
						}elsif($kkcr > 220 + $town_get[$t_kunino{$ft_id}] and ($t_siro_taikyuu_ti{$ft_id} > 900 or $bouei_add < 150) and $t_tian_ti{$ft_id} > 96 and $tuki_genzai > 3){
	$ef16 = "4";$kfvhit = "朱雀";
										$p_name{$e_id} = "朱雀守護城壁";
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$t_name{$ft_id} /炎天下の夏、城壁上空に朱雀が舞い降りた！！！");
						}elsif($kkcr > 220 + $town_get[$t_kunino{$ft_id}] and ($t_siro_taikyuu_ti{$ft_id} > 900 or $bouei_add < 150) and $t_tian_ti{$ft_id} > 96 and $tuki_genzai > 0){
	$ef16 = "3";$kfvhit = "青龍";
										$p_name{$e_id} = "青龍守護城壁";
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$t_name{$ft_id} /桜舞い散る春、城壁上空に青龍が出現した！！！");
						}elsif($kkcr > 230 and $t_gijyutu_ti{$ft_id} > 970 and $t_tian_ti{$ft_id} > 96){
	$p_syomotu{$e_id} = "8";
										$p_name{$e_id} = "城壁＠華陀";
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$t_name{$ft_id} /城壁に華陀が現れた！！");
						}elsif($kkcr > 225 and $t_gijyutu_ti{$ft_id} > 970 and $t_tian_ti{$ft_id} > 96){
	$p_syomotu{$e_id} = "11";
										$p_name{$e_id} = "城壁＠アルハザード";
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$t_name{$ft_id} /城壁にアブドル・アルハザードが現れた！！！");
						}elsif($kkcr > 217 and $t_gijyutu_ti{$ft_id} > 970 and $t_tian_ti{$ft_id} > 96){
	$p_syomotu{$e_id} = "7";
										$p_name{$e_id} = "城壁＠左慈";
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$t_name{$ft_id} /城壁に左慈が現れた！！");
						}elsif($kkcr > 209 and $t_gijyutu_ti{$ft_id} > 970 and $t_tian_ti{$ft_id} > 96){
	$p_syomotu{$e_id} = "6";
										$p_name{$e_id} = "城壁＠南華老仙";
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$t_name{$ft_id} /城壁に南華老仙が現れた！！");
						}

$md_eria = "9$ktotu4";
			$defitidefo = $md_eria;
										$p_name{$e_id} = "城壁衛兵";
										$k_kokka_keitai{0}=0;
$add = int(rand(8))+1;
		$ebt_namae = "城壁衛兵第$add";
										$p_buryoku{$e_id} = int($t_siro_taikyuu_ti{$ft_id} * $p_sougou{$f_id}/7500)+ int($p_sougou{$f_id} * 0.15);
										$p_tiryoku{$e_id} = int($t_siro_taikyuu_ti{$ft_id} * $p_sougou{$f_id}/7500)+ int($p_sougou{$f_id} * 0.15);
										$p_tousotu{$e_id} = int($t_siro_taikyuu_ti{$ft_id} * $p_sougou{$f_id}/7500)+ int($p_sougou{$f_id} * 0.57);
										$p_jinbou{$e_id} = 70;
										$eatt_def2 = int($t_siro_taikyuu_ti{$ft_id} * $p_sougou{$f_id}/3000);
										$p_kunren{$e_id} = 50+ int($t_gijyutu_ti{$ft_id}/20);
										$p_kunino{$e_id} = $t_kunino{$ft_id};
			}

										$p_heisisuu{$e_id} = $bouei_add;

#									if($t_siro_taikyuu_ti{$ft_id} > $t_siro_taikyuu_max{$ft_id}){
#									$t_siro_taikyuu_ti{$ft_id} = $t_siro_taikyuu_max{$ft_id};
#									}
#									if($t_zoku_taikyuu_ti{$ft_id} > $t_zoku_taikyuu_max{$ft_id}){
#									$t_zoku_taikyuu_ti{$ft_id} = $t_zoku_taikyuu_max{$ft_id};
#									}
										$p_tairyoku{$e_id} = 100;
										$p_busyou_hp{$e_id} = 100;
										$p_busyou_mp{$e_id} = 100;
										$p_busyou_sp{$e_id} = 100;
										$p_heisisuu_syoki{$f_id} = $p_heisisuu{$f_id};
										$p_heisisuu_syoki{$e_id} = 100;
										$p_heisisuu_hukkatu{$f_id} = $p_heisisuu{$f_id};
										$p_heisisuu_hukkatu{$e_id} = $p_heisisuu{$e_id};
	$get_sol[0] = $p_tousotu{$e_id} + int(($p_buryoku{$e_id} + $p_tousotu{$e_id} + $p_tiryoku{$e_id})*0.1);
	$get_sol[1] = int($p_tiryoku{$e_id}*0.5) + int(($p_buryoku{$e_id} + $p_tousotu{$e_id} + $p_tiryoku{$e_id})*0.1);
	$get_sol[2] = $p_buryoku{$e_id} + int(($p_buryoku{$e_id} + $p_tousotu{$e_id} + $p_tiryoku{$e_id})*0.1);
									$p_heisisuu_max{$e_id} = $p_heisisuu{$e_id};

										$md_kuni = $ek_id;
										$p_kunino{$e_id} = $ek_id;
										$battle_end=1;
									}


										$md_kuni = int($md_kuni);

####################################
										$eriakazu = 0;
										$boueikazu = 0;
										$kouryakukazu = 0;

										@ERIA_LISTE = ();
										@ATC_LISTE = ();
										@DEF_LISTE = ();
		push(@ERIA_LISTE,"0<>0<>$p_kunino{$e_id}<>0<>$p_id{$e_id}<>$p_name{$e_id}<>0<>0<>0<>\n");
									$eria_id="";
										$addc = "";

									$w_def_id="d_$cd_op2\_$defitidefo";
									$w_def_i=0;
									$def_kazu{$w_def_id}=int($def_kazu{$w_def_id});
									while($w_def_i < $def_kazu{$w_def_id} and $mdid){
										($eria_id,$eria_name,$eria_town_id,$eria_town_flg,$eria_con) = split(/<>/ ,${"DEF_L_$w_def_id"}[$w_def_i]);
									$d_id=$eria_id;

										if($p_kunino{$f_id} ne $eria_con and $p_id{$e_id} ne $eria_id and $eria_id ne $f_id and $p_heisisuu{$d_id} and !$p_hjijyou_w{$d_id}[1] and $addc !~ /$p_id{$d_id}<>/){
		push(@ERIA_LISTE,"0<>0<>$eria_con<>0<>$eria_id<>$eria_name<>0<>0<>0<>\n");
										$addc .= "$p_id{$d_id}<>";
										}
									$w_def_i++;
									}
										$eriakazu = @ERIA_LISTE;

										$add = $eriakazu;
												if(!$d_hit or $add > 9){
										$add = 9;
												}
					$khit = 1;
		unshift(@ATC_LISTE,"0<>0<>$p_kunino{$f_id}<>0<>$f_id<>$p_name{$f_id}<>0<>0<>0<>\n");

									$dbutai_con="";
										$addc = "";
						foreach(@{$butai_l{$p_butaino{$f_id}}}){
		($dbutaiin_id,$dbutaiin_name)=split(/<>/);
									$d_id=$dbutaiin_id;
		if($p_id{$d_id} and $p_kunino{$d_id} eq $p_kunino{$f_id} and !$p_hjijyou_w{$d_id}[1] and $d_id ne $f_id and $khit < $add + 1){

									if($p_taizai_iti{$d_id} eq $p_taizai_iti{$f_id}){

	$dget_sol[0] = $p_tousotu{$d_id} + int(($p_buryoku{$d_id} + $p_tousotu{$d_id} + $p_tiryoku{$d_id})*0.1);
	$dget_sol[1] = int($p_tiryoku{$d_id}*0.5) + int(($p_buryoku{$d_id} + $p_tousotu{$d_id} + $p_tiryoku{$d_id})*0.1);
	$dget_sol[2] = $p_buryoku{$d_id} + int(($p_buryoku{$d_id} + $p_tousotu{$d_id} + $p_tiryoku{$d_id})*0.1);
									$p_heisisuu_max{$d_id} = $dget_sol[$SOL_MAXT[$p_heisyu{$d_id}]];

	@dbutaiaddl = ();
	$dbutaiaddl[0] = 1000;
	$dbutaiaddl[1] = 30;
	$dbutaiaddl[2] = 45;
	$dbutaiaddl[3] = 60;
	$dbutaiaddl[4] = 75;
	$dbutaiaddl[5] = 90;
	$dbutaiaddl[98] = 0;
	$dbutaiaddl[99] = 1;
$addhit1= $p_butaisirei{$d_id}[2] % 100;
$addhit2= int($p_butaisirei{$d_id}[2] / 100);
					if(!$addhit2){
$zaddwmax=100;
						if($p_buryoku{$d_id} > $zaddwmax){
$zaddwmax=$p_buryoku{$d_id};
						}
					}else{
$zaddwmax = $p_tousotu{$d_id} + $p_buryoku{$d_id} + $p_tiryoku{$d_id};
					}

									if(int($p_heisisuu{$d_id} * 100 / $p_heisisuu_max{$d_id}) >= $dbutaiaddl[$p_butaisirei{$d_id}[0]] and int($p_kunren{$d_id} * 100 / $zaddwmax) >= $dbutaiaddl[$addhit1] and $addc !~ /$dbutaiin_id<>/){

					$khit ++;
		push(@ATC_LISTE,"$dbutai_id<>$dbutai_name<>$p_kunino{$dbutai_id}<>$dbutai_reader<>$dbutaiin_id<>$dbutaiin_name<>$dbutaiin_chara<>$dbutai_mes<>$dbutai_flg<>\n");

										$addc .= "$dbutaiin_id<>";

									}

									}
		}
						}
										$kouryakukazu = @ATC_LISTE;

												if(!$d_hit){
									$e_id = 0;
										$boueikazu = $kouryakukazu;
										$eriakazu = $kouryakukazu;
									$bouei_add3 = int($bouei_add3 * $boueikazu);
									if($bouei_add3 > $bouei_add2c){
									$bouei_add3 = $bouei_add2c;
									$bouei_add = int($bouei_add3 / $boueikazu);
										$battle_endf=1;
									}
									if($bouei_add < 1){
									$bouei_add = 1;
									}
									$p_heisisuu{$e_id} = $bouei_add;
										$p_heisisuu_hukkatu{$e_id} = $p_heisisuu{$e_id};
										$p_heisisuu_syoki{$e_id} = 100;
									$p_heisisuu_max{$e_id} = $p_heisisuu{$e_id};
												}else{

										$add = $kouryakukazu;
												if($add > 9){
										$add = 9;
												}
					$khit = 0;
									$dbutai_con="";
						foreach(@ERIA_LISTE){
		($dbutai_id,$dbutai_name,$dbutai_con,$dbutai_reader,$dbutaiin_id,$dbutaiin_name,$dbutaiin_chara,$dbutai_mes,$dbutai_flg)=split(/<>/);
		if($khit < $add + 1){

					$khit ++;
		push(@DEF_LISTE,"$dbutai_id<>$dbutai_name<>$dbutai_con<>$dbutai_reader<>$dbutaiin_id<>$dbutaiin_name<>$dbutaiin_chara<>$dbutai_mes<>$dbutai_flg<>\n");

		}
						}

										$boueikazu = @DEF_LISTE;
												}


	&BAG_LOG2("LISTE\n");
##############################################

##########################
		$mapseiseiblm .= "
<a id=\"$count\"></a>
<table width=\"750\">
<tr>
<td width=\"15\" class=\"bgcFFF0F5\" onclick=\"javascript:void(slm(-1));\">↑</td>

<td width=\"720\">
<table cellspacing=\"2\" width=\"720\" border=\"2\">
<tr>
<td width=\"340\"></td><td width=\"20\"></td><td width=\"340\"></td>
</tr>
<tr>
<td class=\"txtc\" colspan=\"3\">
<table cellspacing=\"2\" width=\"700\" border=\"2\">
<tr>
<td width=\"270\" class=\"txtr\">　</td>
<td class=\"txth\" width=\"160\"><a href=\"#t\">↑</a>・<a href=\"$count\" onclick=\"javascript:void(slm(1));\">戦闘開始</a>・<a href=\"#2\">↓</a></td>
<td width=\"270\">　</td>
</tr>
</table>
</td>
</tr>
<tr>
<td class=\"txtc\" width=\"340\">$k_p_k_a{$p_kunino{$f_id}}：$t_name{$ft_id}$wincomelbs3攻略軍：$kbt_namae部隊
";
										$btwsyubifa = 0;
					$ki = 0;
					$ei = 0;
						while ($ki < $kouryakukazu) {

				$kbp_iku_hit[$ki]=0;
		($dbutai_id,$dbutai_name,$dbutai_con,$dbutai_reader,$dbutaiin_id,$dbutaiin_name,$dbutaiin_chara,$dbutai_mes,$dbutai_flg)=split(/<>/,$ATC_LISTE[$ki]);
										$kbp_bidouhosei[$ki] = 1;
									$kbp_senjt[$ki]=0;
									$kbp_youjt[$ki]=0;
									$kbp_genjt[$ki]=0;
									$kbp_tiyujt[$ki]=0;
									$kbp_hadoku[$ki]=0;
									$kbp_doku[$ki]=0;
									$kbp_husi[$ki]=0;
									$kbp_netu[$ki]=0;
									$kbp_att_add3[$ki] = 0;
									$kbp_heisin[$ki] = 0;
									$kbp_onmyou1add[$ki] = 0;
									$kbp_onmyou1r[$ki] = 48;
										if($p_heisyu{$kbp_id[$ki]} eq "81"){
									$kbp_onmyou1r[$ki] = int($kbp_onmyou1r[$ki] / 4);
										}
									$kbp_tyakka[$ki] = 0;
									$kbp_hukou[$ki] = 0;
									$kbp_kouhuku[$ki] = 0;
									$kbp_husyoubou[$ki] = 0;
									$kbp_sikibou[$ki] = 0;
										$kbp_sisihunjin[$ki] = 0;
										$kbp_tankigake[$ki] = 0;
										$kbp_konranbou[$ki] = 0;
										$kbp_tikeiryaku[$ki] = 0;
										$kbp_husyoukou[$ki] = 0;
				$kbp_heisenia[$ki] = 1;
				$kbp_heisenid[$ki] = 1;
										$kbp_dmg[$ki] = 0;
									$kbp_logf[$ki]=0;
	$kbp_f16[$ki] = "";
										$kbp_id[$ki] = $dbutaiin_id;


######################
										$add_i_id = $dbutaiin_id;
							$bpi_name{$add_i_id}[2] = "";
										if($p_migite{$add_i_id}%1000){
							$bpi_name{$add_i_id}[0] = $item_name{$p_migite{$add_i_id}};
							$bpi_dmg{$add_i_id}[0] = $item_seinou{$p_migite{$add_i_id}};
							$bpi_dmg{$add_i_id}[0] += $p_migite_lv{$add_i_id};

							$bpi_name{$add_i_id}[2] .= $item_name{$p_migite{$add_i_id}};
							$bpi_dmg{$add_i_id}[2] = int($item_seinou{$p_migite{$add_i_id}}*0.6);
							$bpi_dmg{$add_i_id}[2] += $p_migite_lv{$add_i_id};
										}else{
							$bpi_name{$add_i_id}[0] = $item_name{$p_hidarite{$add_i_id}};
							$bpi_dmg{$add_i_id}[0] = int($item_seinou{$p_hidarite{$add_i_id}}*0.5);
							$bpi_dmg{$add_i_id}[0] += $p_hidarite_lv{$add_i_id};

							$bpi_dmg{$add_i_id}[2] = int($item_seinou{$p_hidarite{$add_i_id}}*0.4*$item_2hf{$p_hidarite{$add_i_id}});
							$bpi_dmg{$add_i_id}[2] += $p_hidarite_lv{$add_i_id};
										}
										if($p_hidarite{$add_i_id}%1000){
							$bpi_name{$add_i_id}[1] = $item_name{$p_hidarite{$add_i_id}};
							$bpi_dmg{$add_i_id}[1] = $item_seinou{$p_hidarite{$add_i_id}};
							$bpi_dmg{$add_i_id}[1] += $p_hidarite_lv{$add_i_id};

										if($p_hidarite{$add_i_id}%1000){
							$bpi_name{$add_i_id}[2] .= '＆';
										}
							$bpi_name{$add_i_id}[2] .= $item_name{$p_hidarite{$add_i_id}};
							$bpi_dmg{$add_i_id}[2] += int($item_seinou{$p_hidarite{$add_i_id}}*0.6);
							$bpi_dmg{$add_i_id}[2] += $p_hidarite_lv{$add_i_id};
										}else{
							$bpi_name{$add_i_id}[1] = $item_name{$p_migite{$add_i_id}};
							$bpi_dmg{$add_i_id}[1] = int($item_seinou{$p_migite{$add_i_id}}*0.5);
							$bpi_dmg{$add_i_id}[1] += $p_migite_lv{$add_i_id};

							$bpi_dmg{$add_i_id}[2] += int($item_seinou{$p_migite{$add_i_id}}*0.4*$item_2hf{$p_migite{$add_i_id}});
							$bpi_dmg{$add_i_id}[2] += $p_migite_lv{$add_i_id};
										}
##############################

									$kbp_att_add2[$ki] = 0;





		$kbp_k_exka[$ki] = int(($p_gogyou_ka{$kbp_id[$ki]} + abs($p_gogyou_ka{$kbp_id[$ki]}) + 4000)*0.5);
		$kbp_k_exsui[$ki] = int(($p_gogyou_sui{$kbp_id[$ki]} + abs($p_gogyou_sui{$kbp_id[$ki]}) + 4000)*0.5);
		$kbp_k_exmoku[$ki] = int(($p_gogyou_moku{$kbp_id[$ki]} + abs($p_gogyou_moku{$kbp_id[$ki]}) + 4000)*0.5);
		$kbp_k_exkin[$ki] = int(($p_gogyou_kin{$kbp_id[$ki]} + abs($p_gogyou_kin{$kbp_id[$ki]}) + 4000)*0.5);
		$kbp_k_exdo[$ki] = int(($p_gogyou_do{$kbp_id[$ki]} + abs($p_gogyou_do{$kbp_id[$ki]}) + 4000)*0.5);

		$kbp_k_exka_f[$ki] = int($kbp_k_exka[$ki]/2000);
		$kbp_k_exsui_f[$ki] = int($kbp_k_exsui[$ki]/2000);
		$kbp_k_exmoku_f[$ki] = int($kbp_k_exmoku[$ki]/2000);
		$kbp_k_exkin_f[$ki] = int($kbp_k_exkin[$ki]/2000);
		$kbp_k_exdo_f[$ki] = int($kbp_k_exdo[$ki]/2000);

		$p_taizai_iti{$kbp_id[$ki]} = int($p_taizai_iti{$kbp_id[$ki]});
		$p_kunino{$kbp_id[$ki]} = int($p_kunino{$kbp_id[$ki]});
		$kbp_sougou[$ki] = ($p_tousotu{$kbp_id[$ki]} + $p_tiryoku{$kbp_id[$ki]} + $p_buryoku{$kbp_id[$ki]})+1;
								$kbp_fl[$ki] = int($p_tousotu{$kbp_id[$ki]} * 300 / $kbp_sougou[$ki]);
								$kbp_fs[$ki] = int($p_buryoku{$kbp_id[$ki]} * 300 / $kbp_sougou[$ki]);
								$kbp_fi[$ki] = int($p_tiryoku{$kbp_id[$ki]} * 300 / $kbp_sougou[$ki]);
								$kbp_keiryaku_ritu[$ki] = int(300 - $kbp_fi[$ki]);

		@add_kbp_jyuu_h=split(/,/,$SOL_ZOKUSEIC_JYUU[$SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}]]);

$kbp_add_jyuu[$ki]=0;
		$add_i = 0;
	while ($add_i<10) {
$kbp_add_jyuu[$ki]+=int($add_kbp_jyuu_h[$add_i] * ${$JYUSSYU_ID[$add_i]}{$kbp_id[$ki]} /50);
$add_i ++;
	}
			if($kbp_fl[$ki]>159){
							$kbp_ff[$ki] = 1;
			}elsif($kbp_fs[$ki]>159){
							$kbp_ff[$ki] = 2;
			}elsif($kbp_fi[$ki]>159){
							$kbp_ff[$ki] = 3;
			}elsif($kbp_fl[$ki] + $kbp_fs[$ki]>259){
							$kbp_ff[$ki] = 4;
			}elsif($kbp_fi[$ki] + $kbp_fs[$ki]>259){
							$kbp_ff[$ki] = 5;
			}elsif($kbp_fi[$ki] + $kbp_fl[$ki]>259){
							$kbp_ff[$ki] = 6;
			}else{
							$kbp_ff[$ki] = int(rand(7));
			}
$p_kuni_yakusyoku{$kbp_id[$ki]} = int($p_kuni_yakusyoku{$kbp_id[$ki]});
&{"BL_K_YAKUSYOKU_B_K$p_kuni_yakusyoku{$kbp_id[$ki]}"}();
									
										$kbp_solm[$ki] = $p_heisisuu{$kbp_id[$ki]};
										$kbp_solh[$ki] = $p_heisisuu{$kbp_id[$ki]};

	$get_sol[0] = $p_tousotu{$kbp_id[$ki]} + int(($p_buryoku{$kbp_id[$ki]} + $p_tousotu{$kbp_id[$ki]} + $p_tiryoku{$kbp_id[$ki]})*0.1);
	$get_sol[1] = int($p_tiryoku{$kbp_id[$ki]}*0.5) + int(($p_buryoku{$kbp_id[$ki]} + $p_tousotu{$kbp_id[$ki]} + $p_tiryoku{$kbp_id[$ki]})*0.1);
	$get_sol[2] = $p_buryoku{$kbp_id[$ki]} + int(($p_buryoku{$kbp_id[$ki]} + $p_tousotu{$kbp_id[$ki]} + $p_tiryoku{$kbp_id[$ki]})*0.1);
									$kbp_solmax[$ki] = $get_sol[$SOL_MAXT[$p_heisyu{$kbp_id[$ki]}]];


#									&LOG2BL("$nen_genzai年$tuki_genzai月:$mfcomef$k_name_d[$p_kunino{$kbp_id[$ki]}]の$p_name{$kbp_id[$ki]}は$p_p_b_a{$p_id{$e_id}}と戦闘しました！＠$t_name{$ft_id}$senno[$md_eria]");

#									&LOG2BL("Phase<span class=\"cFF0000\">0</span>:「$p_name{$kbp_id[$ki]}」$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]：\(-\)：$p_heisisuu{$kbp_id[$ki]}：攻《 Vs 》防：$p_heisisuu{$e_id}：\(-\)：$SOL_TYPE[$p_heisyu{$e_id}]「$p_name{$e_id}」");


											$kbp_2id[$ki]=$kbp_id[$ki];

											$kbp_fsf[$ki]=0;
											$kbp_solt[$ki]=$p_heisisuu{$kbp_id[$ki]};

	open(IN,"./p_db/co/$kbp_id[$ki].cgi");
	@F_LOG2K = <IN>;
	close(IN);

	$kbp_hy[$ki] = "";
	$kbp_hc[$ki] = "";
	$kbp_hi[$ki] = "";
	$kbp_h1[$ki] = "";
	$kbp_h2[$ki] = "";
	$kbp_h3[$ki] = "";
	$kbp_yj[$ki] = "";
	$kbp_sj[$ki] = "";
	$kbp_gj[$ki] = "";
	$kbp_tr[$ki] = "";
	$kbp_mg[$ki] = "";
	$kbp_sk[$ki] = "";
	$kbp_sn1[$ki] = "";
	$kbp_sn2[$ki] = "";
	$kbp_sn3[$ki] = "";
	$kbp_sn4[$ki] = "";
	$kbp_snp[$ki] = "";
	$kbp_hk[$ki] = "";
	$kbp_f16[$ki] = "";


	($hnof,$kbp_hy[$ki]) = split(/<>/,$F_LOG2K[0]);
	($hnof,$kbp_hc[$ki]) = split(/<>/,$F_LOG2K[1]);
	($hnof,$kbp_hi[$ki]) = split(/<>/,$F_LOG2K[2]);
	($hnof,$kbp_h1[$ki]) = split(/<>/,$F_LOG2K[3]);
	($hnof,$kbp_h2[$ki]) = split(/<>/,$F_LOG2K[4]);
	($hnof,$kbp_h3[$ki]) = split(/<>/,$F_LOG2K[5]);
	($hnof,$kbp_yj[$ki]) = split(/<>/,$F_LOG2K[6]);
	($hnof,$kbp_sj[$ki]) = split(/<>/,$F_LOG2K[7]);
	($hnof,$kbp_gj[$ki]) = split(/<>/,$F_LOG2K[8]);
	($hnof,$kbp_tr[$ki]) = split(/<>/,$F_LOG2K[9]);
	($hnof,$kbp_mg[$ki]) = split(/<>/,$F_LOG2K[10]);
	($hnof,$kbp_sk[$ki]) = split(/<>/,$F_LOG2K[11]);
	($kbp_f12[$ki],$kbp_sn1[$ki]) = split(/<>/,$F_LOG2K[12]);
	($kbp_f13[$ki],$kbp_sn2[$ki]) = split(/<>/,$F_LOG2K[13]);
	($kbp_f14[$ki],$kbp_sn3[$ki]) = split(/<>/,$F_LOG2K[14]);
	($kbp_f15[$ki],$kbp_sn4[$ki]) = split(/<>/,$F_LOG2K[15]);
	($kbp_f16[$ki],$kbp_snp[$ki]) = split(/<>/,$F_LOG2K[16]);
	($hnof,$kbp_hk[$ki]) = split(/<>/,$F_LOG2K[17]);

			if($p_pet_type{$kbp_id[$ki]}[0] eq ""){
$p_pet_type{$kbp_id[$ki]}[0] = int($kbp_f16[$ki]);
			}
			if($p_pet_type{$kbp_id[$ki]}[0]){
				if($p_pet_name{$kbp_id[$ki]}[0] ne $kbp_snp[$ki]){
$p_pet_name{$kbp_id[$ki]}[0] = $kbp_snp[$ki];
				}elsif(!$p_pet_name{$kbp_id[$ki]}[0]){
$p_pet_name{$kbp_id[$ki]}[0] = $jyuu[$p_pet_type{$kbp_id[$ki]}[0]];
				}
			}
	$kbp_f16[$ki] = $p_pet_type{$kbp_id[$ki]}[0];

	$kbp_f16v[$ki] = "";
	$kbp_f16v[$ki] = $kbp_f16[$ki];


										$kbp_wsol[$ki] = $p_heisisuu{$kbp_id[$ki]};
			if($k_kokkyou{$p_kunino{$kbp_id[$ki]}} eq "5"){
	if($k_kokkyou_keika_nen{$p_kunino{$kbp_id[$ki]}} > 5){
					$kbp_husyoubou[$ki]  = 1;
	}
			}elsif($k_kokkyou{$p_kunino{$kbp_id[$ki]}} eq "7"){
	if($k_kokkyou_keika_nen{$p_kunino{$kbp_id[$ki]}} > 5){
			if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "2" and ($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "4" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "9")){

				$kbp_heisenia[$ki] = int($kbp_heisenia[$ki] * 1.2 * 100)/100;
			}
	}
			}elsif($k_kokkyou{$p_kunino{$kbp_id[$ki]}} eq "3"){
	if($k_kokkyou_keika_nen{$p_kunino{$kbp_id[$ki]}} > 5){
			if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "11" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "12"){

				$kbp_heisenia[$ki] = int($kbp_heisenia[$ki] * 1.1 * 100)/100;
			}
	}
			}
									$kbp_sikikeitai[$ki] = $p_jintousiki{$kbp_id[$ki]};

									$kbp_shousin1[$ki] = $p_jyoujihousin1{$kbp_id[$ki]};
									if(!-e "./$mpg_r/sub_db/td/$p_taizai_iti{$kbp_id[$ki]}.$cd_op2.pl" and $p_taizai_iti{$kbp_id[$ki]} ne $cd_op2){
$kbp_sikikeitai[$ki] = 2;
									}
									if($kbp_sikikeitai[$ki] eq "2"){$kbp_shousin1[$ki] = 0;$kbp_iku_hit[$ki] = 1;}

									$kbp_husyoubou[$ki] += $SKHUSYOUBOU[$kbp_sikikeitai[$ki]] + $BHHUSYOUBOU[$kbp_shousin1[$ki]] + $BKHUSYOUBOU[$p_b_kougun{$kbp_id[$ki]}] + $HKHUSYOUBOU[$p_h_kougun{$kbp_id[$ki]}];

									if($kbp_shousin1[$ki] eq "1"){
										$kbp_tankigake[$ki] = 1;
										$kbp_husyoukou[$ki] += 1;
									}elsif($kbp_shousin1[$ki] eq "2"){
										$kbp_sisihunjin[$ki] = 1;
									}elsif($kbp_shousin1[$ki] eq "3"){
								$kbp_keiryaku_ritu[$ki] = int($kbp_keiryaku_ritu[$ki] * 0.5);
									}elsif($kbp_shousin1[$ki] eq "4"){
										$kbp_konranbou[$ki] += 1;
									}elsif($kbp_shousin1[$ki] eq "5"){
										$kbp_tikeiryaku[$ki] = 1;
									}

									if($k_kokusaku{$p_kunino{$kbp_id[$ki]}} eq "6"){
										$kbp_heisenid[$ki] += 0.1;
									}
									$kbp_ex_add[$ki]=0;
										$kbp_samon[$ki] = int($kbp_samon[$ki]);
										$kbp_clh2[$ki] = 0;
										
									if($SOL_TYPE[$p_heisyu{$kbp_id[$ki]}] eq ""){
									&M2AP_LOG("システム＠$p_p_b_a{$kbp_id[$ki]}が不正入力を行っているようです。管理人までお知らせ下さい。");
										$p_heisyu{$kbp_id[$ki]} = 0;
									}
									if($p_heisyu{$kbp_id[$ki]} eq "88" or $p_heisyu{$kbp_id[$ki]} eq "89"){
									&M2AP_LOG("システム＠$p_p_b_a{$kbp_id[$ki]}が不正入力を行っているようです。$p_heisyu{$kbp_id[$ki]} or $p_heisyu{$kbp_id[$ki]} はデフォルト配布版未実装です。実装済みな場合はbl.pl内を補正するよう管理人までお知らせ下さい。");
										$p_heisyu{$kbp_id[$ki]} = 0;
									}
									&SENTOU_SET;
################
		$kbp_solmrain[$ki] = int($p_heisisuu{$kbp_id[$ki]} * 100 / $kbp_solmax[$ki]);
			if($kbp_solmrain[$ki] < 1){
		$kbp_solmrain[$ki] = 1;
			}
		$kbp_solmrainc[$ki] = "<tr height=\"3\" class=\"bgc333333\"><td width=\"$kbp_solmrain[$ki]\%\" class=\"bgcFF0000\">";
			if($kbp_solmrain[$ki] > 100){
		$kbp_solmrain[$ki] = int($kbp_solmrain[$ki] -100)/10;
				if($kbp_solmrain[$ki] > 100){
			$kbp_solmrain[$ki] = 100;
				}
		$kbp_solmrainc[$ki] = "<tr height=\"3\" class=\"bgcFF0000\"><td width=\"$kbp_solmrain[$ki]\%\" class=\"bgcFFC0CB\">";
			}
################
		$kbp_hpmrain[$ki] = $p_busyou_hp{$kbp_id[$ki]};
			if($kbp_hpmrain[$ki] < 1){
		$kbp_hpmrain[$ki] = 1;
			}
		$kbp_hpmrainc[$ki] = "<tr height=\"3\" class=\"bgc333333\"><td width=\"$kbp_hpmrain[$ki]\%\" class=\"bgcFF0000\">";
			if($kbp_solmrain[$ki] > 100){
		$kbp_hpmrain[$ki] = int($kbp_hpmrain[$ki] -100)/10;
				if($kbp_hpmrain[$ki] > 100){
			$kbp_hpmrain[$ki] = 100;
				}
		$kbp_hpmrainc[$ki] = "<tr height=\"3\" class=\"bgcFF0000\"><td width=\"$kbp_hpmrain[$ki]\%\" class=\"bgcFFC0CB\">";
			}
################
		$kbp_mpmrain[$ki] = $p_busyou_mp{$kbp_id[$ki]};
			if($kbp_mpmrain[$ki] < 1){
		$kbp_mpmrain[$ki] = 1;
			}
		$kbp_mpmrainc[$ki] = "<tr height=\"3\" class=\"bgc333333\"><td width=\"$kbp_mpmrain[$ki]\%\" class=\"bgcFF0000\">";
			if($kbp_solmrain[$ki] > 100){
		$kbp_mpmrain[$ki] = int($kbp_mpmrain[$ki] -100)/10;
				if($kbp_mpmrain[$ki] > 100){
			$kbp_mpmrain[$ki] = 100;
				}
		$kbp_mpmrainc[$ki] = "<tr height=\"3\" class=\"bgcFF0000\"><td width=\"$kbp_mpmrain[$ki]\%\" class=\"bgcFFC0CB\">";
			}
################
		$kbp_spmrain[$ki] = $p_busyou_sp{$kbp_id[$ki]};
			if($kbp_spmrain[$ki] < 1){
		$kbp_spmrain[$ki] = 1;
			}
		$kbp_spmrainc[$ki] = "<tr height=\"3\" class=\"bgc333333\"><td width=\"$kbp_spmrain[$ki]\%\" class=\"bgcFF0000\">";
			if($kbp_solmrain[$ki] > 100){
		$kbp_spmrain[$ki] = int($kbp_spmrain[$ki] -100)/10;
				if($kbp_spmrain[$ki] > 100){
			$kbp_spmrain[$ki] = 100;
				}
		$kbp_spmrainc[$ki] = "<tr height=\"3\" class=\"bgcFF0000\"><td width=\"$kbp_spmrain[$ki]\%\" class=\"bgcFFC0CB\">";
			}
################
	$countb = $count - 1;
	$countf = $count + 1;
$kbp_logf[$ki]++;
	$img_op_add{$kbp_id[$ki]} = 1;
	&IMG_B_CG_SAKUSEI("$p_img{$kbp_id[$ki]}$p_cgno{$kbp_id[$ki]}[$img_op_add{$kbp_id[$ki]}]$p_img_f{$kbp_id[$ki]}","$img_wide_d","$img_height_d","$p_img_m{$kbp_id[$ki]}","b$kbp_id[$ki]\_$kbp_logf[$ki]","$kbp_2id[$ki]","$img_op_add{$kbp_id[$ki]}","","","","","","");
		$mapseiseiblm .= "<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>
<a id=\"$kbp_id[$ki]-$count\"></a>
<table cellspacing=\"2\" width=\"330\" border=\"2\">
<tr>
<td width=\"100\"></td><td width=\"40\"></td><td width=\"40\"></td><td width=\"40\"></td><td width=\"95\"></td>
</tr>
<tr>
<td rowspan=\"4\"><a href=\"#$kbp_id[$ki]-$countf\">$img_sakusei_kekka</a>
</td>
<td class=\"txtc\" colspan=\"3\">$p_p_b_a{$kbp_id[$ki]}</td>
<td class=\"txtc\">$BUHOUSIN[$kbp_shousin1[$ki]]</td>
</tr>

<tr>
<td class=\"txtc\" colspan=\"4\">$kbp_hk[$ki]</td>
</tr>

<tr>
<td class=\"txtc\">HP:$p_busyou_hp{$kbp_id[$ki]}
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$kbp_hpmrainc[$ki]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">MP:$p_busyou_mp{$kbp_id[$ki]}
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$kbp_mpmrainc[$ki]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">SP:$p_busyou_sp{$kbp_id[$ki]}
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$kbp_spmrainc[$ki]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">$b_st_w{$kbp_id[$ki]}</td>
</tr>

<tr>
<td class=\"txtc\" colspan=\"3\">$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}] $p_heisisuu{$kbp_id[$ki]}  (-)
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$kbp_solmrainc[$ki]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">$h_st_w{$kbp_id[$ki]}</td>
</tr>
</table>
";
	$img_op_add{$kbp_id[$ki]} = 2;
					$ki ++;
						}

####################################

		$mapseiseiblm .= "
</td>
<td class=\"txth\" width=\"20\"><a href=\"#$count\">Vs</a></td>
<td class=\"txtc\" width=\"340\">$k_p_k_a{$p_kunino{$e_id}}：$t_name{$ft_id}$wincomelbs3防衛軍：$ebt_namae部隊

";
					$ki = 0;
					$ei = 0;
						while ($ei < $boueikazu) {
				$ebp_iku_hit[$ei]=0;
		($dbutai_id,$dbutai_name,$dbutai_con,$dbutai_reader,$dbutaiin_id,$dbutaiin_name,$dbutaiin_chara,$dbutai_mes,$dbutai_flg)=split(/<>/,$DEF_LISTE[$ei]);
									$ebp_senjt[$ei]=0;
									$ebp_youjt[$ei]=0;
									$ebp_genjt[$ei]=0;
									$ebp_tiyujt[$ei]=0;
									$ebp_hadoku[$ei]=0;
									$ebp_doku[$ei]=0;
									$ebp_husi[$ei]=0;
									$ebp_netu[$ei]=0;
									$ebp_att_add3[$ei] = 0;
									$ebp_heisin[$ei] = 0;
									$ebp_onmyou1add[$ei] = 0;
									$ebp_onmyou1r[$ei] = 48;
										if($p_heisyu{$ebp_id[$ei]} eq "81"){
									$ebp_onmyou1r[$ei] = int($ebp_onmyou1r[$ei] / 4);
										}
									$ebp_tyakka[$ei] = 0;
									$ebp_hukou[$ei] = 0;
									$ebp_kouhuku[$ei] = 0;
									$ebp_husyoubou[$ei] = 0;
									$ebp_sikibou[$ei] = 0;
										$ebp_sisihunjin[$ei] = 0;
										$ebp_tankigake[$ei] = 0;
										$ebp_konranbou[$ei] = 0;
										$ebp_tikeiryaku[$ei] = 0;
										$ebp_husyoukou[$ei] = 0;
				$ebp_heisenia[$ei] = 1;
				$ebp_heisenid[$ei] = 1;

										$ebp_dmg[$ei] = 0;
									$ebp_logf[$ei]=0;
	$ebp_f16[$ei] = "";
										$ebp_id[$ei] = $dbutaiin_id;
######################
										$add_i_id = $dbutaiin_id;
							$bpi_name{$add_i_id}[2] = "";
										if($p_migite{$add_i_id}%1000){
							$bpi_name{$add_i_id}[0] = $item_name{$p_migite{$add_i_id}};
							$bpi_dmg{$add_i_id}[0] = $item_seinou{$p_migite{$add_i_id}};
							$bpi_dmg{$add_i_id}[0] += $p_migite_lv{$add_i_id};

							$bpi_name{$add_i_id}[2] .= $item_name{$p_migite{$add_i_id}};
							$bpi_dmg{$add_i_id}[2] = int($item_seinou{$p_migite{$add_i_id}}*0.6);
							$bpi_dmg{$add_i_id}[2] += $p_migite_lv{$add_i_id};
										}else{
							$bpi_name{$add_i_id}[0] = $item_name{$p_hidarite{$add_i_id}};
							$bpi_dmg{$add_i_id}[0] = int($item_seinou{$p_hidarite{$add_i_id}}*0.5);
							$bpi_dmg{$add_i_id}[0] += $p_hidarite_lv{$add_i_id};

							$bpi_dmg{$add_i_id}[2] = int($item_seinou{$p_hidarite{$add_i_id}}*0.4*$item_2hf{$p_hidarite{$add_i_id}});
							$bpi_dmg{$add_i_id}[2] += $p_hidarite_lv{$add_i_id};
										}
										if($p_hidarite{$add_i_id}%1000){
							$bpi_name{$add_i_id}[1] = $item_name{$p_hidarite{$add_i_id}};
							$bpi_dmg{$add_i_id}[1] = $item_seinou{$p_hidarite{$add_i_id}};
							$bpi_dmg{$add_i_id}[1] += $p_hidarite_lv{$add_i_id};

										if($p_hidarite{$add_i_id}%1000){
							$bpi_name{$add_i_id}[2] .= '＆';
										}
							$bpi_name{$add_i_id}[2] .= $item_name{$p_hidarite{$add_i_id}};
							$bpi_dmg{$add_i_id}[2] += int($item_seinou{$p_hidarite{$add_i_id}}*0.6);
							$bpi_dmg{$add_i_id}[2] += $p_hidarite_lv{$add_i_id};
										}else{
							$bpi_name{$add_i_id}[1] = $item_name{$p_migite{$add_i_id}};
							$bpi_dmg{$add_i_id}[1] = int($item_seinou{$p_migite{$add_i_id}}*0.5);
							$bpi_dmg{$add_i_id}[1] += $p_migite_lv{$add_i_id};

							$bpi_dmg{$add_i_id}[2] += int($item_seinou{$p_migite{$add_i_id}}*0.4*$item_2hf{$p_migite{$add_i_id}});
							$bpi_dmg{$add_i_id}[2] += $p_migite_lv{$add_i_id};
										}
##############################
									$ebp_att_add2[$ei] = 0;


		$ebp_k_exka[$ei] = int(($p_gogyou_ka{$ebp_id[$ei]} + abs($p_gogyou_ka{$ebp_id[$ei]}) + 4000)*0.5);
		$ebp_k_exsui[$ei] = int(($p_gogyou_sui{$ebp_id[$ei]} + abs($p_gogyou_sui{$ebp_id[$ei]}) + 4000)*0.5);
		$ebp_k_exmoku[$ei] = int(($p_gogyou_moku{$ebp_id[$ei]} + abs($p_gogyou_moku{$ebp_id[$ei]}) + 4000)*0.5);
		$ebp_k_exkin[$ei] = int(($p_gogyou_kin{$ebp_id[$ei]} + abs($p_gogyou_kin{$ebp_id[$ei]}) + 4000)*0.5);
		$ebp_k_exdo[$ei] = int(($p_gogyou_do{$ebp_id[$ei]} + abs($p_gogyou_do{$ebp_id[$ei]}) + 4000)*0.5);

		$ebp_k_exka_f[$ei] = int($ebp_k_exka[$ei]/2000);
		$ebp_k_exsui_f[$ei] = int($ebp_k_exsui[$ei]/2000);
		$ebp_k_exmoku_f[$ei] = int($ebp_k_exmoku[$ei]/2000);
		$ebp_k_exkin_f[$ei] = int($ebp_k_exkin[$ei]/2000);
		$ebp_k_exdo_f[$ei] = int($ebp_k_exdo[$ei]/2000);

								$ebp_sougou[$ei] = ($p_tousotu{$ebp_id[$ei]} + $p_tiryoku{$ebp_id[$ei]} + $p_buryoku{$ebp_id[$ei]})+1;

		@add_ebp_jyuu_h=split(/,/,$SOL_ZOKUSEIC_JYUU[$SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}]]);
$ebp_add_jyuu[$ei]=0;
		$add_i = 0;
	while ($add_i<10) {
$ebp_add_jyuu[$ei]+=int($add_ebp_jyuu_h[$add_i] * ${$JYUSSYU_ID[$add_i]}{$ebp_id[$ei]} /50);
$add_i ++;
	}
									if($d_hit == 1){
										$battle_end=0;
$ebp_att_def2[$ei] = int($t_tian_ti{$ft_id} * $kbp_sougou[$ki]/750) ;

$p_kuni_yakusyoku{$ebp_id[$ei]} = int($p_kuni_yakusyoku{$ebp_id[$ei]});
&{"BL_K_YAKUSYOKU_B_E$p_kuni_yakusyoku{$ebp_id[$ei]}"}();

#									&LOG2BL("$nen_genzai年$tuki_genzai月:$mfcomef$k_name_d[$p_kunino{$f_id}]の$p_p_b_a{$f_id}は$p_name{$ebp_id[$ei]}と戦闘しました！＠$t_name{$ft_id}$senno[$md_eria]");
#										&LOG2BL("Phase<span class=\"cFF0000\">0</span>:「$p_name{$f_id}」$SOL_TYPE[$p_heisyu{$f_id}]：\(-\)：$p_heisisuu{$f_id}：攻《 Vs 》防：$p_heisisuu{$ebp_id[$ei]}：\(-\)：$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]「$p_name{$ebp_id[$ei]}」");
									$ebp_2id[$ei]="$ebp_id[$ei]";
									}else{
										$addc = $ei +1;
									$ebp_id[$ei]="d_$slog_kz$cd_op2\_$addc";
									$ebp_2id[$ei]="$p_bp2id{$e_id}";
									$p_taizai_iti{$ebp_id[$ei]}=$cd_op2;

										$p_b_hirou{$ebp_id[$ei]} = 0;
										$p_h_hirou{$ebp_id[$ei]} = 0;
										$p_hei_siki{$ebp_id[$ei]} = 66;
										$p_b_kougun{$ebp_id[$ei]} = 0;
										$p_h_kougun{$ebp_id[$ei]} = 0;
										$p_jintousiki{$ebp_id[$ei]} = 0;
										$p_jyoujihousin1{$ebp_id[$ei]} = 0;

									$p_heisyu{$ebp_id[$ei]} = $p_heisyu{$e_id};
										$p_name{$ebp_id[$ei]} = "$p_name{$e_id}$addc";$p_p_b_a{$ebp_id[$ei]} = "$p_name{$e_id}$addc";
										$p_buryoku{$ebp_id[$ei]} = $p_buryoku{$e_id};
										$p_tiryoku{$ebp_id[$ei]} = $p_tiryoku{$e_id};
										$p_tousotu{$ebp_id[$ei]} = $p_tousotu{$e_id};
										$p_jinbou{$ebp_id[$ei]} = $p_jinbou{$e_id};
										$ebp_att_def2[$ei] = $eatt_def2;
										$p_kunren{$ebp_id[$ei]} = $p_kunren{$e_id};
										$p_kunino{$ebp_id[$ei]} = $p_kunino{$e_id};

										$p_heisisuu{$ebp_id[$ei]} = $bouei_add;


										$p_tairyoku{$ebp_id[$ei]} = $p_tairyoku{$e_id};
										$p_busyou_hp{$ebp_id[$ei]} = $p_busyou_hp{$e_id};
										$p_busyou_mp{$ebp_id[$ei]} = $p_busyou_mp{$e_id};
										$p_busyou_sp{$ebp_id[$ei]} = $p_busyou_sp{$e_id};
										$ebp_solm[$ei] = 100;
										$ebp_solh[$ei] = $p_heisisuu{$ebp_id[$ei]};
											$p_img{$ebp_id[$ei]} = $p_img{$e_id};
											$p_img_f{$ebp_id[$ei]} = $p_img_f{$e_id};
											$p_img_m{$ebp_id[$ei]} = $p_img_m{$e_id};
	&BIJYOU_READ("$ebp_id[$ei]");
	&HIJYOU_READ("$ebp_id[$ei]");

									}

									
								$ebp_sougou[$ei] = $p_tousotu{$ebp_id[$ei]} + $p_tiryoku{$ebp_id[$ei]} + $p_buryoku{$ebp_id[$ei]}+1;
								$ebp_fl[$ei] = int($p_tousotu{$ebp_id[$ei]} * 300 / ($ebp_sougou[$ei]));
								$ebp_fs[$ei] = int($p_buryoku{$ebp_id[$ei]} * 300 / ($ebp_sougou[$ei]));
								$ebp_fi[$ei] = int($p_tiryoku{$ebp_id[$ei]} * 300 / ($ebp_sougou[$ei]));
								$ebp_keiryaku_ritu[$ei] = int(300 - $ebp_fi[$ei]);

			if($ebp_fl[$ei]>159){
							$ebp_ff[$ei] = int(rand(2));
			}elsif($ebp_fs[$ei]>159){
							$ebp_ff[$ei] = 2;
			}elsif($ebp_fi[$ei]>159){
							$ebp_ff[$ei] = 3;
			}elsif($ebp_fl[$ei] + $ebp_fs[$ei]>259){
							$ebp_ff[$ei] = 4;
			}elsif($ebp_fi[$ei] + $ebp_fs[$ei]>259){
							$ebp_ff[$ei] = 5;
			}elsif($ebp_fi[$ei] + $ebp_fl[$ei]>259){
							$ebp_ff[$ei] = 6;
			}else{
							$ebp_ff[$ei] = int(rand(7));
			}
			if($battle_end == 1){
							$ebp_ff[$ei] = 100;
			}
										$ebp_solm[$ei] = $p_heisisuu{$ebp_id[$ei]};
										$ebp_solh[$ei] = $p_heisisuu{$ebp_id[$ei]};
	$get_sol[0] = $p_tousotu{$ebp_id[$ei]} + int(($p_buryoku{$ebp_id[$ei]} + $p_tousotu{$ebp_id[$ei]} + $p_tiryoku{$ebp_id[$ei]})*0.1);
	$get_sol[1] = int($p_tiryoku{$ebp_id[$ei]}*0.5) + int(($p_buryoku{$ebp_id[$ei]} + $p_tousotu{$ebp_id[$ei]} + $p_tiryoku{$ebp_id[$ei]})*0.1);
	$get_sol[2] = $p_buryoku{$ebp_id[$ei]} + int(($p_buryoku{$ebp_id[$ei]} + $p_tousotu{$ebp_id[$ei]} + $p_tiryoku{$ebp_id[$ei]})*0.1);
									$ebp_solmax[$ei] = $get_sol[$SOL_MAXT[$p_heisyu{$ebp_id[$ei]}]];


											$ebp_fsf[$ei]=0;
											$ebp_solt[$ei]=$p_heisisuu{$ebp_id[$ei]};

	$ebp_hy[$ei] = "";
	$ebp_hc[$ei] = "";
	$ebp_hi[$ei] = "";
	$ebp_h1[$ei] = "";
	$ebp_h2[$ei] = "";
	$ebp_h3[$ei] = "";
	$ebp_yj[$ei] = "";
	$ebp_sj[$ei] = "";
	$ebp_gj[$ei] = "";
	$ebp_tr[$ei] = "";
	$ebp_mg[$ei] = "";
	$ebp_sk[$ei] = "";
	$ebp_sn1[$ei] = "";
	$ebp_sn2[$ei] = "";
	$ebp_sn3[$ei] = "";
	$ebp_sn4[$ei] = "";
	$ebp_snp[$ei] = "";
	$ebp_hk[$ei] = "";
	$ebp_f16[$ei] = "";
									if($ebp_id[$ei]){
	open(IN,"./p_db/co/$ebp_id[$ei].cgi");
	@F_LOG2E = <IN>;
	close(IN);

	($hnof,$ebp_hy[$ei]) = split(/<>/,$F_LOG2E[0]);
	($hnof,$ebp_hc[$ei]) = split(/<>/,$F_LOG2E[1]);
	($hnof,$ebp_hi[$ei]) = split(/<>/,$F_LOG2E[2]);
	($hnof,$ebp_h1[$ei]) = split(/<>/,$F_LOG2E[3]);
	($hnof,$ebp_h2[$ei]) = split(/<>/,$F_LOG2E[4]);
	($hnof,$ebp_h3[$ei]) = split(/<>/,$F_LOG2E[5]);
	($hnof,$ebp_yj[$ei]) = split(/<>/,$F_LOG2E[6]);
	($hnof,$ebp_sj[$ei]) = split(/<>/,$F_LOG2E[7]);
	($hnof,$ebp_gj[$ei]) = split(/<>/,$F_LOG2E[8]);
	($hnof,$ebp_tr[$ei]) = split(/<>/,$F_LOG2E[9]);
	($hnof,$ebp_mg[$ei]) = split(/<>/,$F_LOG2E[10]);
	($hnof,$ebp_sk[$ei]) = split(/<>/,$F_LOG2E[11]);
	($ebp_f12[$ei],$ebp_sn1[$ei]) = split(/<>/,$F_LOG2E[12]);
	($ebp_f13[$ei],$ebp_sn2[$ei]) = split(/<>/,$F_LOG2E[13]);
	($ebp_f14[$ei],$ebp_sn3[$ei]) = split(/<>/,$F_LOG2E[14]);
	($ebp_f15[$ei],$ebp_sn4[$ei]) = split(/<>/,$F_LOG2E[15]);
	($ebp_f16[$ei],$ebp_snp[$ei]) = split(/<>/,$F_LOG2E[16]);
	($hnof,$ebp_hk[$ei]) = split(/<>/,$F_LOG2E[17]);

			if($ef16){
$p_pet_type{$ebp_id[$ei]}[0] = $ef16;
			}
			if($p_pet_type{$ebp_id[$ei]}[0] eq ""){
$p_pet_type{$ebp_id[$ei]}[0] = int($ebp_f16[$ei]);
			}
			if($p_pet_type{$ebp_id[$ei]}[0]){
				if($p_pet_name{$ebp_id[$ei]}[0] ne $ebp_snp[$ei]){
$p_pet_name{$ebp_id[$ei]}[0] = $ebp_snp[$ei];
				}elsif(!$p_pet_name{$ebp_id[$ei]}[0]){
$p_pet_name{$ebp_id[$ei]}[0] = $jyuu[$p_pet_type{$ebp_id[$ei]}[0]];
				}
			}
	$ebp_f16[$ei] = $p_pet_type{$ebp_id[$ei]}[0];

	$ebp_f16v[$ei] = "";
	$ebp_f16v[$ei] = $ebp_f16[$ei];

									}

										$ebp_wsol[$ei] = $p_heisisuu{$ebp_id[$ei]};
			if($k_kokkyou{$p_kunino{$ebp_id[$ei]}} eq "5"){
	if($k_kokkyou_keika_nen{$p_kunino{$ebp_id[$ei]}} > 5){
					$ebp_husyoubou[$ei]  = 1;
	}
			}elsif($k_kokkyou{$p_kunino{$ebp_id[$ei]}} eq "7"){
	if($k_kokkyou_keika_nen{$p_kunino{$ebp_id[$ei]}} > 5){
			if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "2" and ($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "4" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "9")){

				$ebp_heisenia[$ei] = int($ebp_heisenia[$ei] * 1.2 * 100)/100;
			}
	}
			}elsif($k_kokkyou{$p_kunino{$ebp_id[$ei]}} eq "3"){
	if($k_kokkyou_keika_nen{$p_kunino{$ebp_id[$ei]}} > 5){
			if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "11" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "12"){

				$ebp_heisenia[$ei] = int($ebp_heisenia[$ei] * 1.1 * 100)/100;
			}
	}
			}
									$ebp_sikikeitai[$ei] = $p_jintousiki{$ebp_id[$ei]};
									if($cd_op2 ne $p_taizai_iti{$ebp_id[$ei]}){$ebp_sikikeitai[$ei] = 2;}
									$ebp_shousin1[$ei] = $p_jyoujihousin1{$ebp_id[$ei]};
									if($ebp_sikikeitai[$ei] eq "2"){
					$ebp_shousin1[$ei] = 0;$ebp_iku_hit[$ei] = 1;
									}

									$ebp_husyoubou[$ei] += $SKHUSYOUBOU[$ebp_sikikeitai[$ei]] + $BHHUSYOUBOU[$ebp_shousin1[$ei]] + $BKHUSYOUBOU[$p_b_kougun{$ebp_id[$ei]}] + $HKHUSYOUBOU[$p_h_kougun{$ebp_id[$ei]}];

									if($ebp_shousin1[$ei] eq "1"){
										$ebp_tankigake[$ei] = 1;
										$ebp_husyoukou[$ei] += 1;
									}elsif($ebp_shousin1[$ei] eq "2"){
										$ebp_sisihunjin[$ei] = 1;
									}elsif($ebp_shousin1[$ei] eq "3"){
								$ebp_keiryaku_ritu[$ei] = int($ebp_keiryaku_ritu[$ei] * 0.5);
									}elsif($ebp_shousin1[$ei] eq "4"){
										$ebp_konranbou[$ei] += 1;
									}elsif($ebp_shousin1[$ei] eq "5"){
										$ebp_tikeiryaku[$ei] = 1;
									}

									$ebp_ex_add[$ei]=0;
										$ebp_samon[$ei] = int($ebp_samon[$ei]);
										$ebp_clh2[$ei] = 0;
									if($SOL_TYPE[$p_heisyu{$ebp_id[$ei]}] eq ""){
									&M2AP_LOG("システム＠$p_p_b_a{$ebp_id[$ei]}が不正入力を行っているようです。管理人までお知らせ下さい。");
										$p_heisyu{$ebp_id[$ei]} = 0;
									}
									if($p_heisyu{$ebp_id[$ei]} eq "88" or $p_heisyu{$ebp_id[$ei]} eq "89"){
									&M2AP_LOG("システム＠$p_p_b_a{$ebp_id[$ei]}が不正入力を行っているようです。$p_heisyu{$ebp_id[$ei]} or $p_heisyu{$ebp_id[$ei]} はデフォルト配布版未実装です。実装済みな場合はbl.pl内を補正するよう管理人までお知らせ下さい。");
										$p_heisyu{$ebp_id[$ei]} = 0;
									}
									&SENTOU_SET;


################
		$ebp_solmrain[$ei] = int($p_heisisuu{$ebp_id[$ei]} * 100 / $ebp_solmax[$ei]);
			if($ebp_solmrain[$ei] < 1){
		$ebp_solmrain[$ei] = 1;
			}
		$ebp_solmrainc[$ei] = "<tr height=\"3\" class=\"bgcDDA0DD\"><td width=\"$ebp_solmrain[$ei]\%\" class=\"bgc0000FF\">";
			if($ebp_solmrain[$ei] > 100){
		$ebp_solmrain[$ei] = int($ebp_solmrain[$ei] -100)/10;
				if($ebp_solmrain[$ei] > 100){
			$ebp_solmrain[$ei] = 100;
				}
		$ebp_solmrainc[$ei] = "<tr height=\"3\" class=\"bgc0000FF\"><td width=\"$ebp_solmrain[$ei]\%\" class=\"bgc87CEFA\">";
			}
################
		$ebp_hpmrain[$ei] = $p_busyou_hp{$ebp_id[$ei]};
			if($ebp_hpmrain[$ei] < 1){
		$ebp_hpmrain[$ei] = 1;
			}
		$ebp_hpmrainc[$ei] = "<tr height=\"3\" class=\"bgcDDA0DD\"><td width=\"$ebp_hpmrain[$ei]\%\" class=\"bgc0000FF\">";
			if($ebp_solmrain[$ei] > 100){
		$ebp_hpmrain[$ei] = int($ebp_hpmrain[$ei] -100)/10;
				if($ebp_hpmrain[$ei] > 100){
			$ebp_hpmrain[$ei] = 100;
				}
		$ebp_hpmrainc[$ei] = "<tr height=\"3\" class=\"bgc0000FF\"><td width=\"$ebp_hpmrain[$ei]\%\" class=\"bgc87CEFA\">";
			}
################
		$ebp_mpmrain[$ei] = $p_busyou_mp{$ebp_id[$ei]};
			if($ebp_mpmrain[$ei] < 1){
		$ebp_mpmrain[$ei] = 1;
			}
		$ebp_mpmrainc[$ei] = "<tr height=\"3\" class=\"bgcDDA0DD\"><td width=\"$ebp_mpmrain[$ei]\%\" class=\"bgc0000FF\">";
			if($ebp_solmrain[$ei] > 100){
		$ebp_mpmrain[$ei] = int($ebp_mpmrain[$ei] -100)/10;
				if($ebp_mpmrain[$ei] > 100){
			$ebp_mpmrain[$ei] = 100;
				}
		$ebp_mpmrainc[$ei] = "<tr height=\"3\" class=\"bgc0000FF\"><td width=\"$ebp_mpmrain[$ei]\%\" class=\"bgc87CEFA\">";
			}
################
		$ebp_spmrain[$ei] = $p_busyou_sp{$ebp_id[$ei]};
			if($ebp_spmrain[$ei] < 1){
		$ebp_spmrain[$ei] = 1;
			}
		$ebp_spmrainc[$ei] = "<tr height=\"3\" class=\"bgcDDA0DD\"><td width=\"$ebp_spmrain[$ei]\%\" class=\"bgc0000FF\">";
			if($ebp_solmrain[$ei] > 100){
		$ebp_spmrain[$ei] = int($ebp_spmrain[$ei] -100)/10;
				if($ebp_spmrain[$ei] > 100){
			$ebp_spmrain[$ei] = 100;
				}
		$ebp_spmrainc[$ei] = "<tr height=\"3\" class=\"bgc0000FF\"><td width=\"$ebp_spmrain[$ei]\%\" class=\"bgc87CEFA\">";
			}
################
$ebp_logf[$ei]++;
	$img_op_add{$ebp_id[$ei]} = 1;
	&IMG_B_CG_SAKUSEI("$p_img{$ebp_id[$ei]}$p_cgno{$ebp_id[$ei]}[$img_op_add{$ebp_id[$ei]}]$p_img_f{$ebp_id[$ei]}","$img_wide_d","$img_height_d","$p_img_m{$ebp_id[$ei]}","b$ebp_id[$ei]\_$ebp_logf[$ei]","$ebp_2id[$ei]","$img_op_add{$ebp_id[$ei]}","","","","","","");
		$mapseiseiblm .= "<a id=\"lf-$ebp_id[$ei]-$ebp_logf[$ei]\"></a>
<a id=\"$ebp_id[$ei]-$count\"></a>
<table cellspacing=\"2\" width=\"330\" border=\"2\">
<tr>
<td width=\"100\"></td><td width=\"40\"></td><td width=\"40\"></td><td width=\"40\"></td><td width=\"95\"></td>
</tr>
<tr>
<td rowspan=\"4\"><a href=\"#$ebp_id[$ei]-$countf\">$img_sakusei_kekka</a>
</td>
<td class=\"txtc\" colspan=\"3\">$p_p_b_a{$ebp_id[$ei]}</td>
<td class=\"txtc\">$BUHOUSIN[$ebp_shousin1[$ei]]</td>
</tr>

<tr>
<td class=\"txtc\" colspan=\"4\">$ebp_hk[$ei]</td>
</tr>

<tr>
<td class=\"txtc\">HP:$p_busyou_hp{$ebp_id[$ei]}
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$ebp_hpmrainc[$ei]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">MP:$p_busyou_mp{$ebp_id[$ei]}
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$ebp_mpmrainc[$ei]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">SP:$p_busyou_sp{$ebp_id[$ei]}
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$ebp_spmrainc[$ei]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">$b_st_w{$ebp_id[$ei]}</td>
</tr>

<tr>
<td class=\"txtc\" colspan=\"3\">$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}] $p_heisisuu{$ebp_id[$ei]}  (-)
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$ebp_solmrainc[$ei]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">$b_st_w{$ebp_id[$ei]}</td>
</tr>
</table>
";
	$img_op_add{$ebp_id[$ei]} = 2;
					$ei ++;
						}
##############


	&BAG_LOG2("SETE\n");
		$mapseiseiblm .= "
</td></tr>
</table>

</td>
<td width=\"15\" class=\"bgcFFF0F5\" onclick=\"javascript:void(slm(1));\">↓</td>
</tr>
<tr>
<td width=\"15\" class=\"bgcFFF0F5\" onclick=\"javascript:void(slm(-1));\">↑</td>

<a id=\"0-b\"></a>
<td width=\"720\">
<table cellspacing=\"2\" width=\"720\" border=\"2\">
<tr>
<td width=\"105\"></td><td width=\"45\"></td><td width=\"20\"></td><td width=\"35\"></td><td width=\"40\"></td><td width=\"85\"></td>
<td width=\"20\"></td>
<td width=\"85\"></td><td width=\"40\"></td><td width=\"35\"></td><td width=\"20\"></td><td width=\"45\"></td><td width=\"115\"></td>
</tr>
";

#		$mapseiseiblm .= $mapseiseibls;
#		$mapseiseibls = "";
					$ki = 0;
					$ei = 0;


										$btwsyubifa_all = 0;
									$win=0;
										$btw = 50;
								$wanaw = 1;
								$hukuheiw = 2;
							if($p_b_kougun{$kbp_id[$ki]} eq "3" or $p_h_kougun{$kbp_id[$ki]} eq "3"){
								$wanaw += 7;
								$hukuheiw += 5;
							}

					$ki = 0;
						while ($ki < $kouryakukazu) {
									if($kbp_hukou[$ki]){
										$samonh = int(rand(18 - $kbp_hukou[$ki] - ($p_heisisuu{$kbp_id[$ki]}*10/$kbp_solmax[$ki])));
										if($samonh < 1){
				$kbp_heisenia[$ki] = int($kbp_heisenia[$ki] * 0.8 * 100)/100;
										$kbp_att[$ki] = int($kbp_att[$ki] * 0.8);
				$ebp_heisenia[$ei] = int($ebp_heisenia[$ei] * 1.1 * 100)/100;
									$p_hei_siki{$kbp_id[$ki]} -= int(rand(2));
$kbp_logf[$ki]++;
$logfc="<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>";
										&KWBLOGBL("<span class=\"c0000FF\">【流行り病】</span>:$p_name{$kbp_id[$ki]}の部隊で悪しき病が流行しています。兵の間では祟りではないかという噂\が飛び交っている模様です。。");
										}elsif($samonh < 2 and !$battle_end){
				$kbp_heisenia[$ki] = int($kbp_heisenia[$ki] * 0.9 * 100)/100;
										$kbp_att[$ki] = int($kbp_att[$ki] * 0.9);
				$ebp_heisenia[$ei] = int($ebp_heisenia[$ei] * 1.03 * 100)/100;
					$kbp_add[$ki] = int($p_syoji_kome{$kbp_id[$ki]} * 0.05);
										if($kbp_add[$ki] > 6000){
					$kbp_add[$ki] = int(rand(1000))+5000;
										}
					$p_syoji_kome{$kbp_id[$ki]} -= $kbp_add[$ki];
									$p_hei_siki{$kbp_id[$ki]} -= int(rand(2));
$kbp_logf[$ki]++;
$logfc="<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>";
										&KWBLOGBL("<span class=\"c0000FF\">【小火発生】</span>:$p_name{$kbp_id[$ki]}の兵糧庫で原因不明の小火が発生し米$kbp_add[$ki]が焼け焦げてしまいました。出火元が特定できないため兵の間では祟りではないかという噂\が飛び交っている模様です。。");
										}elsif($samonh < 3 and !$battle_end and !$kbp_husyoubou[$ki] and ($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "13" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "17" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "18" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "6")){

				$kbp_heisenia[$ki] = int($kbp_heisenia[$ki] * 0.9 * 100)/100;
										$kbp_att[$ki] = int($kbp_att[$ki] * 0.9);
				$ebp_heisenia[$ei] = int($ebp_heisenia[$ei] * 1.03 * 100)/100;
				$p_tairyoku{$kbp_id[$ki]} = int($p_tairyoku{$kbp_id[$ki]} * (rand(3)+4) * 0.1);
									if($p_busyou_hp{$kbp_id[$ki]} > $p_tairyoku{$kbp_id[$ki]}){
				$p_busyou_hp{$kbp_id[$ki]} = $p_tairyoku{$kbp_id[$ki]};
									}
									$p_hei_siki{$kbp_id[$ki]} -= int(rand(2));

$kbp_logf[$ki]++;
$logfc="<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>";
										&KWBLOGBL("<span class=\"c0000FF\">【落馬】</span>:行軍中に$p_name{$kbp_id[$ki]}が落馬し大怪我を負いました。兵の間では祟りではないかという噂\が飛び交っている模様です。。");
										}
									}
					$ki ++;
						}
					$ei = 0;
						while ($ei < $boueikazu) {
									if($ebp_hukou[$ei]){
										$samonh = int(rand(18 - $ebp_hukou[$ei] - ($p_heisisuu{$ebp_id[$ei]}*10/$ebp_solmax[$ei])));
										if($samonh < 1){
				$kbp_heisenia[$ki] = int($kbp_heisenia[$ki] * 1.1 * 100)/100;
				$ebp_heisenia[$ei] = int($ebp_heisenia[$ei] * 0.8 * 100)/100;
										$ebp_att[$ei] = int($ebp_att[$ei] * 0.8);
									$p_hei_siki{$ebp_id[$ei]} -= int(rand(2));

$ebp_logf[$ei]++;
$logfc="<a id=\"lf-$ebp_id[$ei]-$ebp_logf[$ei]\"></a>";
										&EWBLOGBL("<span class=\"c0000FF\">【流行り病】</span>:$p_name{$ebp_id[$ei]}の部隊で悪しき病が流行しています。兵の間では祟りではないかという噂\が飛び交っている模様です。。");
										}elsif($samonh < 2 and !$battle_end){
				$kbp_heisenia[$ki] = int($kbp_heisenia[$ki] * 1.03 * 100)/100;
				$ebp_heisenia[$ei] = int($ebp_heisenia[$ei] * 0.9 * 100)/100;
										$ebp_att[$ei] = int($ebp_att[$ei] * 0.9);
					$kbp_add[$ki] = int($p_syoji_kome{$ebp_id[$ei]} * 0.05);
										if($kbp_add[$ki] > 6000){
					$kbp_add[$ki] = int(rand(1000))+5000;
										}
					$p_syoji_kome{$ebp_id[$ei]} -= $kbp_add[$ki];
									$p_hei_siki{$ebp_id[$ei]} -= int(rand(2));
$ebp_logf[$ei]++;
$logfc="<a id=\"lf-$ebp_id[$ei]-$ebp_logf[$ei]\"></a>";
										&EWBLOGBL("<span class=\"c0000FF\">【小火発生】</span>:$p_name{$ebp_id[$ei]}の兵糧庫で原因不明の小火が発生し米$kbp_add[$ki]が焼け焦げてしまいました。出火元が特定できないため兵の間では祟りではないかという噂\が飛び交っている模様です。。");
										}elsif($samonh < 3 and !$battle_end and !$ebp_husyoubou[$ei] and ($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "13" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "17" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "18" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "6")){

				$kbp_heisenia[$ki] = int($kbp_heisenia[$ki] * 1.03 * 100)/100;
				$ebp_heisenia[$ei] = int($ebp_heisenia[$ei] * 0.9 * 100)/100;
										$ebp_att[$ei] = int($ebp_att[$ei] * 0.9);
				$p_tairyoku{$ebp_id[$ei]} = int($p_tairyoku{$ebp_id[$ei]} * 0.9);
									if($p_busyou_hp{$ebp_id[$ei]} > $p_tairyoku{$ebp_id[$ei]}){
				$p_busyou_hp{$ebp_id[$ei]} = $p_tairyoku{$ebp_id[$ei]};
									}
									$p_hei_siki{$ebp_id[$ei]} -= int(rand(2));

$ebp_logf[$ei]++;
$logfc="<a id=\"lf-$ebp_id[$ei]-$ebp_logf[$ei]\"></a>";
										&EWBLOGBL("<span class=\"c0000FF\">【落馬】</span>:行軍中に$p_name{$ebp_id[$ei]}が落馬し大怪我を負いました。兵の間では祟りではないかという噂\が飛び交っている模様です。。");
										}
									}
					$ei ++;
						}

############罠
					$ki = 0;
					$ei = 0;
									if(!$k_kokka_keitai{$ek_id}){
									if($md_eria == 20 and int(rand(2)) < 1 and $ebp_att[$ei] < $p_heisisuu{$kbp_id[$ki]}){
							@DEF_LISTW=();
							open(IN,"./w_db/mati/g$cd_op2.cgi");
							@DEF_LISTW = <IN>;
							close(IN);
									if($cd_op1 == 2){
								$wanaw += 10;
									}
											$pphit=0;
											$ppid="";
											@NEWDEFL=();
											foreach(@DEF_LISTW){
												($d_id,,$dtown_id,$dtown_flg,,$dheisyu,$dmasuta,$dsikikei,$dsubdb1) = split(/<>/);
												if("$t_kunino{$ft_id}" eq "$p_kunino{$d_id}" and $pphit<1){
													$pphit=2;

									if(!int(rand($wanaw))){
							$zsigotoadd = int(rand(($p_tiryoku{$kbp_id[$ki]}+$item_seinou{$p_syomotu{$kbp_id[$ki]}} + rand(40))/14 + rand($p_tiryoku{$kbp_id[$ki]}+$item_seinou{$p_syomotu{$kbp_id[$ki]}}) / 20));

						if($p_syomotu{$kbp_id[$ki]} eq "2012"){
							$zsigotoadd += int(rand(20));
						}
							$zsigotoadd += int(rand($p_syuutyuu{$kbp_id[$ki]} + $p_excalm{$kbp_id[$ki]}) * 0.1);
								if(int(rand($zsigotoadd)) > int(rand($dtown_flg))){
$kbp_logf[$ki]++;
$logfc="<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>";
	$w_id=$p_id{$kbp_id[$ki]};&P_LOG_W("<span class=\"cFF0000\">【罠破壊】</span>:$t_name{$ft_id}の郊外にて$p_p_b_a{$d_id}が造ったと思われる落とし穴を発見！！今後の憂いを断つため、これを破壊しました！！");
										&K1LOGBL("<span class=\"cFF0000\">【罠破壊】</span>:$t_name{$ft_id}の郊外にて$p_p_b_a{$d_id}が造ったと思われる落とし穴を発見！！今後の憂いを断つため、これを破壊しました！！");

	$w_id=$p_id{$d_id};&P_LOG_W("$nen_genzai年$tuki_genzai月:<span class=\"cFF0000\">【罠破壊】</span>$t_name{$ft_id}の郊外に仕掛けておいた落とし穴が何者かの手によって破壊された模様です！！");
							$p_kunkou{$kbp_id[$ki]} += 15;
							$p_ex_tiryoku{$kbp_id[$ki]}+= int(rand(2));
								}
									}else{

										$btwws = $p_heisisuu{$kbp_id[$ki]};
										$btww = int($dtown_flg /5) + int(rand($dtown_flg) /2);
										$p_heisisuu{$kbp_id[$ki]} -= $btww;
												if($p_heisisuu{$kbp_id[$ki]}<1){
										$p_heisisuu{$kbp_id[$ki]} = 1;
										$btww = $btwws - $p_heisisuu{$kbp_id[$ki]};
												}
									$addc = "";
									if($kbp_sikibou[$ki]){
									}else{
										$kbp_att[$ki] = int($kbp_att[$ki] * 0.95);
				$kbp_heisenia[$ki] = int($kbp_heisenia[$ki] * 0.95 * 100)/100;
									$addc = "し、部隊の士気が微妙に低下";
									}
$kbp_logf[$ki]++;
$logfc="<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>";
	$w_id=$p_id{$kbp_id[$ki]};&P_LOG_W("<span class=\"cFF0000\">【落とし穴（野）】</span>:$p_name{$kbp_id[$ki]}は$p_p_b_a{$d_id}が設置した落とし穴にハマった！！兵士が$btww減少$addc！！");
										&K1LOGBL("<span class=\"cFF0000\">【落とし穴（野）】</span>:$p_name{$kbp_id[$ki]}は$p_p_b_a{$d_id}が設置した落とし穴にハマった！！兵士が$btww減少$addc！！");

	$w_id=$p_id{$d_id};&P_LOG_W("<span class=\"cFF0000\">【落とし穴（野）】</span>$t_name{$ft_id}防衛戦：仕掛けておいた落とし穴に$k_name{$fk_id}の$p_p_b_a{$kbp_id[$ki]}がまんまと引っかかった模様です！！『兵士が$btww減少$addc』");
									$ttid = "blog/$p_id{$d_id}";
									&PRLOG("\[$old_date\]$t_name{$ft_id}防衛戦（野）・落とし穴の計にて$p_p_b_a{$kbp_id[$ki]}を大混乱に陥れる。");
											$ppid="$p_id{$d_id}";
											&M2AP_LOG("<span class=\"c0000FF\">【落とし穴（野）】</span>$t_name{$ft_id}攻略戦：$p_name{$kbp_id[$ki]}の部隊は、$p_p_b_a{$d_id}の設置した落とし穴にハマり大混乱に陥りました。");
									}
												}elsif($ppid ne $p_id{$d_id}){
											$pphit2=1;
													push(@NEWDEFL,"$_");
												}
											}
											open(OUT,">./w_db/mati/g$cd_op2.cgi");
											print OUT @NEWDEFL;
											close(OUT);
												if($pphit2==0 and $pphit>0){
							unlink("./w_db/mati/g$cd_op2.cgi");
												}
									}elsif($md_eria > 20 and $md_eria < 26 and int(rand(2)) < 1 and $ebp_att[$ei] < $p_heisisuu{$kbp_id[$ki]}){
							@DEF_LISTW=();
							open(IN,"./w_db/mati/s$cd_op2.cgi");
							@DEF_LISTW = <IN>;
							close(IN);
									if($cd_op1 == 5){
								$wanaw += 10;
									}
											$pphit=0;
											$ppid="";
											@NEWDEFL=();
											foreach(@DEF_LISTW){
												($d_id,,$dtown_id,$dtown_flg,,$dheisyu,$dmasuta,$dsikikei,$dsubdb1) = split(/<>/);
												if("$t_kunino{$ft_id}" eq "$p_kunino{$d_id}" and $pphit<1){
													$pphit=2;

									if(!int(rand($wanaw))){
							$zsigotoadd = int(rand(($p_tiryoku{$kbp_id[$ki]}+$item_seinou{$p_syomotu{$kbp_id[$ki]}} + rand(40))/14 + rand($p_tiryoku{$kbp_id[$ki]}+$item_seinou{$p_syomotu{$kbp_id[$ki]}}) / 20));

						if($p_syomotu{$kbp_id[$ki]} eq "2012"){
							$zsigotoadd += int(rand(20));
						}
							$zsigotoadd += int(rand($p_syuutyuu{$kbp_id[$ki]} + $p_excalm{$kbp_id[$ki]}) * 0.1);
								if(int(rand($zsigotoadd)) > int(rand($dtown_flg))){
$kbp_logf[$ki]++;
$logfc="<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>";
	$w_id=$p_id{$kbp_id[$ki]};&P_LOG_W("<span class=\"cFF0000\">【罠破壊】</span>:$t_name{$ft_id}の城にて$p_p_b_a{$d_id}が造ったと思われる落とし穴を発見！！今後の憂いを断つため、これを破壊しました！！");
										&K1LOGBL("<span class=\"cFF0000\">【罠破壊】</span>:$t_name{$ft_id}の城にて$p_p_b_a{$d_id}が造ったと思われる落とし穴を発見！！今後の憂いを断つため、これを破壊しました！！");

	$w_id=$p_id{$d_id};&P_LOG_W("<span class=\"cFF0000\">【罠破壊】</span>$t_name{$ft_id}の城に仕掛けておいた落とし穴が何者かの手によって破壊された模様です！！");
							$p_kunkou{$kbp_id[$ki]} += 15;
							$p_ex_tiryoku{$kbp_id[$ki]}+= int(rand(2));
								}
									}else{

										$btwws = $p_heisisuu{$kbp_id[$ki]};
										$btww = int($dtown_flg /5) + int(rand($dtown_flg) /2);
										$p_heisisuu{$kbp_id[$ki]} -= $btww;
												if($p_heisisuu{$kbp_id[$ki]}<1){
										$p_heisisuu{$kbp_id[$ki]} = 1;
										$btww = $btwws - $p_heisisuu{$kbp_id[$ki]};
												}
									$addc = "";
									if($kbp_sikibou[$ki]){
									}else{
										$kbp_att[$ki] = int($kbp_att[$ki] * 0.95);
				$kbp_heisenia[$ki] = int($kbp_heisenia[$ki] * 0.95 * 100)/100;
									$addc = "し、部隊の士気が微妙に低下";
									}
$kbp_logf[$ki]++;
$logfc="<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>";
	$w_id=$p_id{$kbp_id[$ki]};&P_LOG_W("<span class=\"cFF0000\">【落とし穴（城）】</span>:$p_name{$kbp_id[$ki]}は$p_p_b_a{$d_id}が設置した落とし穴にハマった！！兵士が$btww減少$addc！！");
										&K1LOGBL("<span class=\"cFF0000\">【落とし穴（城）】</span>:$p_name{$kbp_id[$ki]}は$p_p_b_a{$d_id}が設置した落とし穴にハマった！！兵士が$btww減少$addc！！");

	$w_id=$p_id{$d_id};&P_LOG_W("<span class=\"cFF0000\">【落とし穴（城）】</span>$t_name{$ft_id}防衛戦：仕掛けておいた落とし穴に$k_name{$fk_id}の$p_p_b_a{$kbp_id[$ki]}がまんまと引っかかった模様です！！『兵士が$btww減少$addc』");
									$ttid = "blog/$p_id{$d_id}";
									&PRLOG("\[$old_date\]$t_name{$ft_id}防衛戦（城）・落とし穴の計にて$p_p_b_a{$kbp_id[$ki]}を大混乱に陥れる。");
											$ppid="$p_id{$d_id}";
											&M2AP_LOG("<span class=\"c0000FF\">【落とし穴（城）】</span>$t_name{$ft_id}攻略戦：$p_name{$kbp_id[$ki]}の部隊は、$p_p_b_a{$d_id}の設置した落とし穴にハマり大混乱に陥りました。");
									}
												}elsif($ppid ne $p_id{$d_id}){
											$pphit2=1;
													push(@NEWDEFL,"$_");
												}
											}
											open(OUT,">./w_db/mati/s$cd_op2.cgi");
											print OUT @NEWDEFL;
											close(OUT);
												if($pphit2==0 and $pphit>0){
							unlink("./w_db/mati/s$cd_op2.cgi");
												}
									}elsif($md_eria > 19 and int(rand(2)) < 1 and $ebp_att[$ei] < $p_heisisuu{$kbp_id[$ki]}){
							@DEF_LISTW=();
							open(IN,"./w_db/mati/k$cd_op2.cgi");
							@DEF_LISTW = <IN>;
							close(IN);
									if($cd_op1 == 2){
								$wanaw += 10;
									}
											$pphit=0;
											$ppid="";
											$pphit2=0;
											@NEWDEFL=();
											foreach(@DEF_LISTW){
												($d_id,,$dtown_id,$dtown_flg,,$dheisyu,$dmasuta,$dsikikei,$dsubdb1) = split(/<>/);
												if("$t_kunino{$ft_id}" eq "$p_kunino{$d_id}" and $pphit<1){
													$pphit=2;


									if(!int(rand($wanaw))){
							$zsigotoadd = int(rand(($p_tiryoku{$kbp_id[$ki]}+$item_seinou{$p_syomotu{$kbp_id[$ki]}} + rand(40))/14 + rand($p_tiryoku{$kbp_id[$ki]}+$item_seinou{$p_syomotu{$kbp_id[$ki]}}) / 20));

						if($p_syomotu{$kbp_id[$ki]} eq "2012"){
							$zsigotoadd += int(rand(20));
						}
							$zsigotoadd += int(rand($p_syuutyuu{$kbp_id[$ki]} + $p_excalm{$kbp_id[$ki]}) * 0.1);
								if(int(rand($zsigotoadd)) > int(rand($dtown_flg))){
$kbp_logf[$ki]++;
$logfc="<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>";
	$w_id=$p_id{$kbp_id[$ki]};&P_LOG_W("<span class=\"cFF0000\">【罠破壊】</span>:$t_name{$ft_id}にて$p_p_b_a{$d_id}が造ったと思われる偽の砦を発見！！今後の憂いを断つため、これを破壊しました！！");
										&K1LOGBL("<span class=\"cFF0000\">【罠破壊】</span>:$t_name{$ft_id}にて$p_p_b_a{$d_id}が造ったと思われる偽の砦を発見！！今後の憂いを断つため、これを破壊しました！！");

	$w_id=$p_id{$d_id};&P_LOG_W("<span class=\"cFF0000\">【罠破壊】</span>$t_name{$ft_id}に仕掛けておいた偽の砦が何者かの手によって破壊された模様です！！");
							$p_kunkou{$kbp_id[$ki]} += 15;
							$p_ex_tiryoku{$kbp_id[$ki]}+= int(rand(2));
								}
									}else{

										$btww = 20 + int(rand($dtown_flg)/2);
												if($btww>45){
										$btww = 45;
												}
									$addc = "";
									if($kbp_sikibou[$ki]){
									}else{
										$kbp_att[$ki] = int($kbp_att[$ki] * 0.8);
				$kbp_heisenia[$ki] = int($kbp_heisenia[$ki] * 0.8 * 100)/100;
									$addc = "し、部隊の士気が低下";
									}
$kbp_logf[$ki]++;
$logfc="<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>";
	$w_id=$p_id{$kbp_id[$ki]};&P_LOG_W("<span class=\"cFF0000\">【疑城の計】</span>:$p_name{$kbp_id[$ki]}は$p_p_b_a{$d_id}が造った偽の砦に気を取られている！！残りPhaseが$btww減少$addc！！");
										&K1LOGBL("<span class=\"cFF0000\">【疑城の計】</span>:$p_name{$kbp_id[$ki]}は$p_p_b_a{$d_id}が造った偽の砦に気を取られている！！残りPhaseが$btww減少$addc！！");

	$w_id=$p_id{$d_id};&P_LOG_W("<span class=\"cFF0000\">【疑城の計】</span>$t_name{$ft_id}防衛戦$senno[$kbp_totu1[$ki]]：仕掛けておいた偽の砦に$k_name{$fk_id}の$p_p_b_a{$kbp_id[$ki]}がまんまと引っかかった模様です！！『残りPhaseが$btww減少$addc』");
									$ttid = "blog/$p_id{$d_id}";
									&PRLOG("\[$old_date\]$t_name{$ft_id}防衛戦$senno[$kbp_totu1[$ki]]・疑城の計にて$p_p_b_a{$kbp_id[$ki]}を大混乱に陥れる。");
											$ppid="$p_id{$d_id}";
											&M2AP_LOG("<span class=\"c0000FF\">【疑城の計】</span>$t_name{$ft_id}攻略戦$senno[$kbp_totu1[$ki]]：$p_name{$kbp_id[$ki]}の部隊は、$p_p_b_a{$d_id}の築いた偽の砦に気を取られ大混乱に陥りました。");
										$btw = 50 - $btww;
									}

												}elsif($ppid ne $p_id{$d_id}){
											$pphit2=1;
													push(@NEWDEFL,"$_");
												}
											}
											open(OUT,">./w_db/mati/k$cd_op2.cgi");
											print OUT @NEWDEFL;
											close(OUT);
												if($pphit2==0 and $pphit>0){
							unlink("./w_db/mati/k$cd_op2.cgi");
												}
									}

									}
############
					$ki = 0;
					$ei = 0;
								if($battle_end){
									if($cd_op1 eq "5"){
										$btw = 10;
$kbp_logf[$ki]++;
$logfc="<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>";
	$w_id=$p_id{$kbp_id[$ki]};&P_LOG_W("<span class=\"c0000FF\">【城壁戦】</span>:$p_name{$kbp_id[$ki]}の部隊は慎重に進軍し城壁付近にたどり着きました。（残りPhase10固定）");
										&K1LOGBL("<span class=\"c0000FF\">【城壁戦】</span>:$p_name{$kbp_id[$ki]}の部隊は慎重に進軍し城壁付近にたどり着きました。（残りPhase10固定）");
									}
								}
					$ki = 0;
					$ei = 0;
					@kbl_senid = ();
					@ebl_senid = ();
					@kbl_senidds = ();
					@ebl_senidds = ();
					@kbl_senidts = ();
					@ebl_senidts = ();
						while ($ki < $kouryakukazu) {
										$kbl_senid[$ki]=$ki;
			if($p_butaisirei{$kbp_id[$ki]}[1] eq "1" and $ki){
										$kbl_senidds[$ki]=$ki;
			}elsif($p_butaisirei{$kbp_id[$ki]}[1] eq "3" and $ki){
										$kbl_senidts[$ki]=$ki;
			}
										$kbp_h_ko[$ki]=0;
										$kbp_b_ko[$ki]=0;
									if($kbp_shousin1[$ki] ne $p_jyoujihousin1{$kbp_id[$ki]}){

$kbp_logf[$ki]++;
$logfc="<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>";
	&KWBLOGBL("<span class=\"c0000FF\">【将不在】</span>:<a href=\"#$kbp_id[$ki]-$count\">$p_name{$kbp_id[$ki]}</a>の部隊は遠方攻撃を行っているため将：方針が静観となります。");

									}
									if($kbp_shousin1[$ki] eq "6"){
				$kbp_heisenia[$ki] = int($kbp_heisenia[$ki] * 1.05 * 100)/100;
									$p_hei_siki{$kbp_id[$ki]} += int(rand(2));
$kbp_logf[$ki]++;
$logfc="<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>";
	&KWBLOGBL("<span class=\"c0000FF\">【士気鼓舞】</span>:<a href=\"#$kbp_id[$ki]-$count\">$p_name{$kbp_id[$ki]}</a>の部隊は、合戦突入前に兵士を激励し士気を高めました。");
									}
				$kbp_heisin_c[$ki] = "兵信神符の効果で";
			if($k_kokkyou{$p_kunino{$kbp_id[$ki]}} eq "8"){
	if($k_kokkyou_keika_nen{$p_kunino{$kbp_id[$ki]}} > 10){
				$kbp_heisin_c[$ki] = "西王母の加護により";
				$kbp_heisin[$ki] = 3;
	}
			}
					$ki ++;
						}
					$ki = 0;
					$ei = 0;
										@ebp_btwsyubifa=();
						while ($ei < $boueikazu) {
										$ebl_senid[$ei]=$ei;
			if($p_butaisirei{$ebp_id[$ei]}[1] eq "1" and $ei){
										$ebl_senidds[$ei]=$ei;
			}elsif($p_butaisirei{$ebp_id[$ei]}[1] eq "3" and $ei){
										$ebl_senidts[$ei]=$ei;
			}
										$ebp_h_ko[$ei]=0;
										$ebp_b_ko[$ei]=0;
									if($ebp_shousin1[$ei] ne $p_jyoujihousin1{$ebp_id[$ei]}){

$ebp_logf[$ei]++;
$logfc="<a id=\"lf-$ebp_id[$ei]-$ebp_logf[$ei]\"></a>";
	&EWBLOGBL("<span class=\"c0000FF\">【将不在】</span>:<a href=\"#$ebp_id[$ei]-$count\">$p_name{$ebp_id[$ei]}</a>の部隊は遠方守備を行っているため「将：方針」が静観となります。");
									}
									if($ebp_shousin1[$ei] eq "6"){
				$ebp_heisenia[$ei] = int($ebp_heisenia[$ei] * 1.05 * 100)/100;
									$p_hei_siki{$ebp_id[$ei]} += int(rand(2));
$ebp_logf[$ei]++;
$logfc="<a id=\"lf-$ebp_id[$ei]-$ebp_logf[$ei]\"></a>";
	&EWBLOGBL("<span class=\"c0000FF\">【士気鼓舞】</span>:<a href=\"#$ebp_id[$ei]-$count\">$p_name{$ebp_id[$ei]}</a>の部隊は、合戦突入前に兵士を激励し士気を高めました。");
									}
				$ebp_heisin_c[$ei] = "兵信神符の効果で";
			if($k_kokkyou{$p_kunino{$ebp_id[$ei]}} eq "8"){
	if($k_kokkyou_keika_nen{$p_kunino{$ebp_id[$ei]}} > 10){
				$ebp_heisin_c[$ei] = "西王母の加護により";
				$ebp_heisin[$ei] = 3;
	}
			}
										$ki = int(rand($kouryakukazu));
									if($md_eria < 10 and $cd_op1 ne "2" and $cd_op1 ne "3" and $p_heisisuu{$kbp_id[$ki]} < $p_heisisuu{$ebp_id[$ei]} * 7 and $md_eria > 0){
										$kbp_clh2[$ki] += 2;
										$btwsyubifa = 1;
										$btwsyubifa_all = 1;
$kbp_logf[$ki]++;
$ebp_logf[$ei]++;
$logfc="<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>\n<a id=\"lf-$ebp_id[$ei]-$ebp_logf[$ei]\"></a>";
	$w_id=$p_id{$ebp_id[$ei]};&P_LOG_W("<span class=\"c0000FF\">【奇襲攻撃発動】</span>:$t_name{$ft_id}$senno[$md_eria]にて兵を伏せていた$p_name{$ebp_id[$ei]}の部隊は、目前を通過中の$p_name{$kbp_id[$ki]}の部隊に対し奇襲攻撃を仕掛けました！！<br />$p_name{$kbp_id[$ki]}の部隊は大混乱に陥り身動きが取れません！！");
										&KE1LOGBL("<span class=\"c0000FF\">【奇襲攻撃発動】</span><br />$t_name{$ft_id}$senno[$md_eria]にて兵を伏せていた$p_name{$ebp_id[$ei]}の部隊は、目前を通過中の$p_name{$kbp_id[$ki]}の部隊に対し奇襲攻撃を仕掛けました！！<br />$p_name{$kbp_id[$ki]}の部隊は大混乱に陥り身動きが取れません！！");

	$w_id=$p_id{$kbp_id[$ki]};&P_LOG_W("<span class=\"cFF0000\">【奇襲攻撃発動】</span>:$p_name{$kbp_id[$ki]}の部隊は$t_name{$ft_id}$senno[$md_eria]を通過中、$p_name{$ebp_id[$ei]}の部隊に奇襲攻撃を受けました！！<br />$p_name{$kbp_id[$ki]}の部隊は大混乱に陥り身動きが取れません！！");
									}elsif($md_eria < 10 and $cd_op1 eq "2" and int(rand($hukuheiw)) < 1 and $p_heisisuu{$kbp_id[$ki]} < $p_heisisuu{$ebp_id[$ei]} * 7 and $md_eria > 0){
										$kbp_clh2[$ki] += 2;
										$btwsyubifa = 1;
										$btwsyubifa_all = 1;
$kbp_logf[$ki]++;
$ebp_logf[$ei]++;
$logfc="<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>\n<a id=\"lf-$ebp_id[$ei]-$ebp_logf[$ei]\"></a>";
	$w_id=$p_id{$ebp_id[$ei]};&P_LOG_W("<span class=\"c0000FF\">【奇襲攻撃発動】</span>:$t_name{$ft_id}$senno[$md_eria]にて兵を伏せていた$p_name{$ebp_id[$ei]}の部隊は、目前を通過中の$p_name{$kbp_id[$ki]}の部隊に対し奇襲攻撃を仕掛けました！！<br />$p_name{$kbp_id[$ki]}の部隊は大混乱に陥り身動きが取れません！！");
										&KE1LOGBL("<span class=\"c0000FF\">【奇襲攻撃発動】</span><br />$t_name{$ft_id}$senno[$md_eria]にて兵を伏せていた$p_name{$ebp_id[$ei]}の部隊は、目前を通過中の$p_name{$kbp_id[$ki]}の部隊に対し奇襲攻撃を仕掛けました！！<br />$p_name{$kbp_id[$ki]}の部隊は大混乱に陥り身動きが取れません！！");

	$w_id=$p_id{$kbp_id[$ki]};&P_LOG_W("<span class=\"cFF0000\">【奇襲攻撃発動】</span>:$p_name{$kbp_id[$ki]}の部隊は$t_name{$ft_id}$senno[$md_eria]を通過中、$p_name{$ebp_id[$ei]}の部隊に奇襲攻撃を受けました！！<br />$p_name{$kbp_id[$ki]}の部隊は大混乱に陥り身動きが取れません！！");
									}elsif($ebp_ff[$ei] eq "1" or ($battle_end and $cd_op1 ne "5")){
										$btwsyubifa = 1;
										$ebp_btwsyubifa[$ei] = 1;
	$w_id=$p_id{$ebp_id[$ei]};&P_LOG_W("$p_name{$ebp_id[$ei]}のスキル『先制攻撃』発動！");
$ebp_logf[$ei]++;
$logfc="<a id=\"lf-$ebp_id[$ei]-$ebp_logf[$ei]\"></a>";
		&EWBLOGBL("<span class=\"c0000FF\">【先制攻撃】</span>:$p_name{$ebp_id[$ei]}の部隊に先制攻撃属性が付加されました！");
									}
					$ei ++;
						}
					$kouryakujissuu = @kbl_senid;
					$boueijissuu = @ebl_senid;
					$kouryakudsjissuu = @kbl_senidds;
					$boueidsjissuu = @ebl_senidds;
					$kouryakutsjissuu = @kbl_senidts;
					$boueitsjissuu = @ebl_senidts;
#############################
					$ki = 0;
					$ei = 0;

				$wkuriadd = 1;
				$wkuriadd2 = 0;
			if($k_kokusaku{$p_kunino{$kbp_id[$ki]}} eq "7"){
				$wkuriadd = 0.1;
				$wkuriadd2 = 3;
					$ki = 0;
						while ($ki < $kouryakukazu) {
				$kbp_heisenia[$ki] = int($kbp_heisenia[$ki] * 1.2 * 100)/100;
									$p_hei_siki{$kbp_id[$ki]} += int(rand(3))+1;
					$ki ++;
						}
					$ei = 0;
						while ($ei < $boueikazu) {
				$ebp_heisenia[$ei] = int($ebp_heisenia[$ei] * 0.8 * 100)/100;
					$ei ++;
						}
			}elsif($k_kokusaku{$p_kunino{$kbp_id[$ki]}} eq "8"){
				$wkuriadd = 0.5;
				$wkuriadd2 = 2;
					$ki = 0;
						while ($ki < $kouryakukazu) {
									$p_hei_siki{$kbp_id[$ki]} += int(rand(2));
					$ki ++;
						}
			}
					$ki = 0;
						while ($ki < $kouryakukazu) {
									if($kbp_kouhuku[$ki]){
										$samonh = int(rand(18 - int($p_heisisuu{$kbp_id[$ki]}*10/($kbp_solmax[$ki] + 1))));
										if($samonh < 5){
				$wkuriadd = $wkuriadd * 0.1;
$kbp_logf[$ki]++;
$logfc="<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>";
		&K1LOGBL("$p_name{$kbp_id[$ki]}は天に祈りを捧げ、自軍に吉羅を召還しました！<br />$kbt_namae部隊全体に幸運属性が付加されました！");
										}
									}
					$ki ++;
						}
					$ki = 0;
						while ($ki < $kouryakukazu) {
		$kbp_bsxx[$ki] = int(int(400 * $wkuriadd * $k_busyou_suu{$p_kunino{$kbp_id[$ki]}} / ($sousu2 + 1)) /($town_get[$p_kunino{$kbp_id[$ki]}] + $town_get[$md_kuni]+1))-$wkuriadd2;
					$ki ++;
						}
#########################
				$wkuriadd = 1;
				$wkuriadd2 = 0;
			if($k_kokusaku{$md_kuni} eq "8"){
				$wkuriadd = 0.4;
				$wkuriadd2 = 0;
					$ei = 0;
						while ($ei < $boueikazu) {
									$p_hei_siki{$ebp_id[$ei]} += int(rand(2));
					$ei ++;
						}
			}
					$ei = 0;
						while ($ei < $boueikazu) {
									if($ebp_kouhuku[$ei]){
										$samonh = int(rand(18 - int($p_heisisuu{$ebp_id[$ei]}*10/($ebp_solmax[$ei] + 1))));
										if($samonh < 5){
				$wkuriadd = $wkuriadd * 0.1;
$ebp_logf[$ei]++;
$logfc="<a id=\"lf-$ebp_id[$ei]-$ebp_logf[$ei]\"></a>";
		&E1LOGBL("$p_name{$ebp_id[$ei]}は天に祈りを捧げ、自軍に吉羅を召還しました！<br />$ebt_namae部隊全体に幸運属性が付加されました！");
										}
									}
					$ei ++;
						}
					$ei = 0;
						while ($ei < $boueikazu) {
		$ebp_bsxx[$ei] = int(int(400 * $wkuriadd * $k_busyou_suu{$p_kunino{$ebp_id[$ei]}} / ($sousu2 + 1)) /($town_get[$p_kunino{$kbp_id[$ki]}] + $town_get[$md_kuni]+1))-$wkuriadd2;

					$ei ++;
						}


					$ki = 0;
					$ei = 0;

									if($kinukakuhen){
$kbp_logf[$ki]++;
$logfc="<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>";
											&K1LOGBL("<span class=\"cDA70D6\">【戦慄】</span>・・$p_name{$f_id}の部隊の様子がおかしい。・・狗達は何か得体の知れない者にとり憑かれているようだ。");
									}

					$ki = 0;
						while ($ki < $kouryakukazu) {
										@hitkl=();
										@hitel=();
										$ei = int(rand($boueikazu));
									if($p_heisyu{$kbp_id[$ki]} eq "83" and $kbp_clh2[$ki] < 2){
									&SENTOU_SET;
										$kbp_dmg[$ki] += int(rand($kbp_att[$ki] * 0.5) + ($kbp_att[$ki] * 0.25))+1;

									if($p_heisisuu{$ebp_id[$ei]} < 1){
										$p_heisisuu{$ebp_id[$ei]} = 0;
									}
										$kbp_ex_add[$ki] += ($ebp_wsol[$ei] - $p_heisisuu{$ebp_id[$ei]});
										$hitel[$ei]=1;
$kbp_logf[$ki]++;
$ebp_logf[$ei]++;
$logfc="<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>\n<a id=\"lf-$ebp_id[$ei]-$ebp_logf[$ei]\"></a>";
										&K1LOGBL("<span class=\"c0000FF\">【先制射撃】</span>:・・斉射用意！！目標前方敵$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊。・・放てっ～～！！");

									if($p_heisyu{$ebp_id[$ei]} eq "83" and $ebp_clh2[$ei] < 2){
										$ebp_dmg[$ei] += int(rand($ebp_att[$ei] * 0.5) + ($ebp_att[$ei] * 0.25))+1;
										$p_heisisuu{$kbp_id[$ki]} -= $ebp_dmg[$ei];
									if($p_heisisuu{$kbp_id[$ki]} < 1){
										$p_heisisuu{$kbp_id[$ki]} = 0;
									}
										$ebp_ex_add[$ei] += ($kbp_wsol[$ki] - $p_heisisuu{$kbp_id[$ki]});
										&E1LOGBL("<span class=\"c0000FF\">【応射】</span>:怯むな！！応射用意！！目標前方敵$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊。・・放てっ～～！！");

									}else{
			if($boueidsjissuu and int($p_heisisuu{$ebp_id[$ei]} * 100 / $ebp_solmax[$ei]) < 40){
$add = int(rand($boueidsjissuu));
				if(int($ebl_senidds[$add]) ne $ei and int($ebl_senidds[$add])){
$ei_d=$ei;
$ei=int($ebl_senidds[$add]);
$ebp_logf[$ei]++;
$logfc.="<a id=\"lf-$ebp_id[$ei]-$ebp_logf[$ei]\"></a>";
	&E2LOGBL("<span class=\"c0000FF\">【かばう】</span>:$p_name{$ebp_id[$ei]}は残存兵力が少なくなっている$p_name{$ebp_id[$ei_d]}の部隊の護衛に就いた。");

				}
			}
									}
										$p_heisisuu{$ebp_id[$ei]} -= $kbp_dmg[$ki];
											&STLOGBL("");
									}
					$ki ++;
						}
					$ei = 0;
						while ($ei < $boueikazu) {
										$ki = int(rand($kouryakujissuu));
									if($p_heisyu{$ebp_id[$ei]} eq "83" and $ebp_clh2[$ei] < 2){
									&SENTOU_SET;
										$ebp_dmg[$ei] += int(rand($ebp_att[$ei] * 0.5) + ($ebp_att[$ei] * 0.25))+1;

									if($p_heisisuu{$kbp_id[$ki]} < 1){
										$p_heisisuu{$kbp_id[$ki]} = 0;
									}
										$ebp_ex_add[$ei] += ($kbp_wsol[$ki] - $p_heisisuu{$kbp_id[$ki]});
$kbp_logf[$ki]++;
$ebp_logf[$ei]++;
$logfc="<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>\n<a id=\"lf-$ebp_id[$ei]-$ebp_logf[$ei]\"></a>";
										&E1LOGBL("<span class=\"c0000FF\">【先制射撃】</span>:・・斉射用意！！目標前方敵$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊。・・放てっ～～！！");
# $p_name{$kbp_id[$ki]}：$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]\(-$ebp_dmg[$ei]↓\)：$p_heisisuu{$kbp_id[$ki]}
									if($p_heisyu{$kbp_id[$ki]} eq "83" and $kbp_clh2[$ki] < 2){
										$kbp_dmg[$ei] += int(rand($kbp_att[$ki] * 0.5) + ($kbp_att[$ki] * 0.25))+1;
										$p_heisisuu{$ebp_id[$ei]} -= $kbp_dmg[$ki];
									if($p_heisisuu{$ebp_id[$ei]} < 1){
										$p_heisisuu{$ebp_id[$ei]} = 0;
									}
										$kbp_ex_add[$ki] += ($ebp_wsol[$ei] - $p_heisisuu{$ebp_id[$ei]});
										&K1LOGBL("<span class=\"c0000FF\">【応射】</span>:怯むな！！応射用意！！目標前方敵$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊。・・放てっ～～！！");
# $p_name{$ebp_id[$ei]}：$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]\(-$kbp_dmg[$ki]↓\)：$p_heisisuu{$ebp_id[$ei]}

									}else{
			if($kouryakudsjissuu and int($p_heisisuu{$kbp_id[$ki]} * 100 / $kbp_solmax[$ki]) < 40){
$add = int(rand($kouryakudsjissuu));
				if(int($kbl_senidds[$add]) ne $ki and int($kbl_senidds[$add])){
$ki_d=$ki;
$ki=int($kbl_senidds[$add]);
$kbp_logf[$ki]++;
$logfc.="<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>";
	&K2LOGBL("<span class=\"c0000FF\">【かばう】</span>:$p_name{$kbp_id[$ki]}は残存兵力が少なくなっている$p_name{$kbp_id[$ki_d]}の部隊の護衛に就いた。");

				}
			}
									}
										$p_heisisuu{$kbp_id[$ki]} -= $ebp_dmg[$ei];
											&STLOGBL("");
									}
					$ei ++;
						}
					$ki = 0;
					$ei = 0;
		$mapseiseiblm .= "
</table>

</td>
<td width=\"15\" class=\"bgcFFF0F5\" onclick=\"javascript:void(slm(1));\">↓</td>
</tr>
</table>
<br />";
##########################
									if($battle_end == 1 and $cd_op1 ne "1"){
										$btwsyubifa = 1;
										$btwsyubifa_all = 1;
									}

	&BAG_LOG2("B\n");

									for($pcount=1;$pcount<=$btw;$pcount++){
	&BAG_LOG2("$pcount < $btw\n");
										$count = $pcount;
										if($kouryakujissuu < $boueijissuu){
										$btw2 = $boueijissuu;
										$atcfbl = 1;
										}elsif($count < 2 and $btwsyubifa){
										$atcfbl = 1;
											if($kouryakujissuu < $boueijissuu){
											$btw2 = $boueijissuu;
											}else{
											$btw2 = $kouryakujissuu;
											}
										}else{
										$btw2 = $kouryakujissuu;
										$atcfbl = 0;
										}

	$countb = $count - 1;
	$countf = $count + 1;
		$mapseiseiblm .= "
<a id=\"$count\"></a>
<table width=\"750\">
<tr>
<td width=\"15\" class=\"bgcFFF0F5\" onclick=\"javascript:void(slm(-1));\">↑</td>

<td width=\"720\">
<table cellspacing=\"2\" width=\"720\" border=\"2\">
<tr>
<td width=\"340\"></td><td width=\"20\"></td><td width=\"340\"></td>
</tr>
<tr>
<td class=\"txtc\" colspan=\"3\">
<table cellspacing=\"2\" width=\"700\" border=\"2\">
<tr>
<td width=\"270\" class=\"txtr\">　</td>
<td class=\"txth\" width=\"160\"><a href=\"#$countb\">↑</a>・<a href=\"#t\">Phase<span class=\"cFF0000\">$count</span></a>・<a href=\"#$countf\">↓</a></td>
<td width=\"270\">　</td>
</tr>
</table>
</td>
</tr>
<tr>
<td class=\"txtc\" width=\"340\">$k_p_k_a{$p_kunino{$f_id}}：$t_name{$ft_id}$wincomelbs3攻略軍：$kbt_namae部隊
";


					$ki = 0;
					$ei = 0;
						foreach(@kbl_senid){
					$ki = $_;
						if(!$kbp_h_ko[$ki]){
################
		$kbp_solmrain[$ki] = int($p_heisisuu{$kbp_id[$ki]} * 100 / $kbp_solmax[$ki]);
			if($kbp_solmrain[$ki] < 1){
		$kbp_solmrain[$ki] = 1;
			}
		$kbp_solmrainc[$ki] = "<tr height=\"3\" class=\"bgc333333\"><td width=\"$kbp_solmrain[$ki]\%\" class=\"bgcFF0000\">";
			if($kbp_solmrain[$ki] > 100){
		$kbp_solmrain[$ki] = int($kbp_solmrain[$ki] -100)/10;
				if($kbp_solmrain[$ki] > 100){
			$kbp_solmrain[$ki] = 100;
				}
		$kbp_solmrainc[$ki] = "<tr height=\"3\" class=\"bgcFF0000\"><td width=\"$kbp_solmrain[$ki]\%\" class=\"bgcFFC0CB\">";
			}
################
		$kbp_hpmrain[$ki] = $p_busyou_hp{$kbp_id[$ki]};
			if($kbp_hpmrain[$ki] < 1){
		$kbp_hpmrain[$ki] = 1;
			}
		$kbp_hpmrainc[$ki] = "<tr height=\"3\" class=\"bgc333333\"><td width=\"$kbp_hpmrain[$ki]\%\" class=\"bgcFF0000\">";
			if($kbp_solmrain[$ki] > 100){
		$kbp_hpmrain[$ki] = int($kbp_hpmrain[$ki] -100)/10;
				if($kbp_hpmrain[$ki] > 100){
			$kbp_hpmrain[$ki] = 100;
				}
		$kbp_hpmrainc[$ki] = "<tr height=\"3\" class=\"bgcFF0000\"><td width=\"$kbp_hpmrain[$ki]\%\" class=\"bgcFFC0CB\">";
			}
################
		$kbp_mpmrain[$ki] = $p_busyou_mp{$kbp_id[$ki]};
			if($kbp_mpmrain[$ki] < 1){
		$kbp_mpmrain[$ki] = 1;
			}
		$kbp_mpmrainc[$ki] = "<tr height=\"3\" class=\"bgc333333\"><td width=\"$kbp_mpmrain[$ki]\%\" class=\"bgcFF0000\">";
			if($kbp_solmrain[$ki] > 100){
		$kbp_mpmrain[$ki] = int($kbp_mpmrain[$ki] -100)/10;
				if($kbp_mpmrain[$ki] > 100){
			$kbp_mpmrain[$ki] = 100;
				}
		$kbp_mpmrainc[$ki] = "<tr height=\"3\" class=\"bgcFF0000\"><td width=\"$kbp_mpmrain[$ki]\%\" class=\"bgcFFC0CB\">";
			}
################
		$kbp_spmrain[$ki] = $p_busyou_sp{$kbp_id[$ki]};
			if($kbp_spmrain[$ki] < 1){
		$kbp_spmrain[$ki] = 1;
			}
		$kbp_spmrainc[$ki] = "<tr height=\"3\" class=\"bgc333333\"><td width=\"$kbp_spmrain[$ki]\%\" class=\"bgcFF0000\">";
			if($kbp_solmrain[$ki] > 100){
		$kbp_spmrain[$ki] = int($kbp_spmrain[$ki] -100)/10;
				if($kbp_spmrain[$ki] > 100){
			$kbp_spmrain[$ki] = 100;
				}
		$kbp_spmrainc[$ki] = "<tr height=\"3\" class=\"bgcFF0000\"><td width=\"$kbp_spmrain[$ki]\%\" class=\"bgcFFC0CB\">";
			}
################
	$b_st = $b_st_w{$kbp_id[$ki]};

	$h_st = $h_st_w{$kbp_id[$ki]};
	$img_op_add{$kbp_id[$ki]} = 2;
			if($kbp_clh2[$ki] > 0){
#				if($h_st eq "正常"){
	$h_st = "混乱";
#				}else{
#	$h_st .= " 混乱";
#				}
	$img_op_add{$kbp_id[$ki]} = 5;
			}
			if($kbp_doku[$ki]){
				if($h_st eq "正常"){
	$h_st = "毒";
				}else{
	$h_st .= " 毒";
				}
	$img_op_add{$kbp_id[$ki]} = 7;
			}
			if($kbp_netu[$ki]){
				if($h_st eq "正常"){
	$h_st = "炎上";
				}else{
	$h_st .= " 炎上";
				}
	$img_op_add{$kbp_id[$ki]} = 6;
			}

$kbp_logf[$ki]++;
											$kbp_soltg[$ki]=$p_heisisuu{$kbp_id[$ki]} - $kbp_solt[$ki];
											$kbp_solt[$ki] = $p_heisisuu{$kbp_id[$ki]};
	$kbp_soltgc[$ki] = sprintf("%+d", $kbp_soltg[$ki]);
	&IMG_B_CG_SAKUSEI("$p_img{$kbp_id[$ki]}$p_cgno{$kbp_id[$ki]}[$img_op_add{$kbp_id[$ki]}]$p_img_f{$kbp_id[$ki]}","$img_wide_d","$img_height_d","$p_img_m{$kbp_id[$ki]}","b$kbp_id[$ki]\_$kbp_logf[$ki]","$kbp_2id[$ki]","$img_op_add{$kbp_id[$ki]}","","","","","","");
		$mapseiseiblm .= "<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>
<a id=\"$kbp_id[$ki]-$count\"></a>
<table cellspacing=\"2\" width=\"330\" border=\"2\">
<tr>
<td width=\"100\"></td><td width=\"40\"></td><td width=\"40\"></td><td width=\"40\"></td><td width=\"95\"></td>
</tr>
<tr>
<td rowspan=\"4\">$img_sakusei_kekka</a>
</td>
<td class=\"txtc\" width=\"120\" colspan=\"3\">$p_p_b_a{$kbp_id[$ki]}</td>
<td class=\"txtc\">$BUHOUSIN[$kbp_shousin1[$ki]]</td>
</tr>

<tr>
<td class=\"txtc\" colspan=\"4\"></td>
</tr>

<tr>
<td class=\"txtc\">HP:$p_busyou_hp{$kbp_id[$ki]}
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$kbp_hpmrainc[$ki]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">MP:$p_busyou_mp{$kbp_id[$ki]}
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$kbp_mpmrainc[$ki]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">SP:$p_busyou_sp{$kbp_id[$ki]}
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$kbp_spmrainc[$ki]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">$b_st</td>
</tr>

<tr>
<td class=\"txtc\" colspan=\"3\">$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}] $p_heisisuu{$kbp_id[$ki]}  ($kbp_soltgc[$ki])
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$kbp_solmrainc[$ki]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">$h_st</td>
</tr>
</table>
";
						}
						}
		$mapseiseiblm .= "
</td>
<td class=\"txth\" width=\"20\"><a href=\"#$count\">Vs</a></td>
<td class=\"txtc\" width=\"340\">$k_p_k_a{$p_kunino{$e_id}}：$t_name{$ft_id}$wincomelbs3防衛軍：$ebt_namae部隊

";
						foreach(@ebl_senid){
					$ei = $_;
						if(!$ebp_h_ko[$ei]){
################
		$ebp_solmrain[$ei] = int($p_heisisuu{$ebp_id[$ei]} * 100 / $ebp_solmax[$ei]);
			if($ebp_solmrain[$ei] < 1){
		$ebp_solmrain[$ei] = 1;
			}
		$ebp_solmrainc[$ei] = "<tr height=\"3\" class=\"bgcDDA0DD\"><td width=\"$ebp_solmrain[$ei]\%\" class=\"bgc0000FF\">";
			if($ebp_solmrain[$ei] > 100){
		$ebp_solmrain[$ei] = int($ebp_solmrain[$ei] -100)/10;
				if($ebp_solmrain[$ei] > 100){
			$ebp_solmrain[$ei] = 100;
				}
		$ebp_solmrainc[$ei] = "<tr height=\"3\" class=\"bgc0000FF\"><td width=\"$ebp_solmrain[$ei]\%\" class=\"bgc87CEFA\">";
			}
################
		$ebp_hpmrain[$ei] = $p_busyou_hp{$ebp_id[$ei]};
			if($ebp_hpmrain[$ei] < 1){
		$ebp_hpmrain[$ei] = 1;
			}
		$ebp_hpmrainc[$ei] = "<tr height=\"3\" class=\"bgcDDA0DD\"><td width=\"$ebp_hpmrain[$ei]\%\" class=\"bgc0000FF\">";
			if($ebp_solmrain[$ei] > 100){
		$ebp_hpmrain[$ei] = int($ebp_hpmrain[$ei] -100)/10;
				if($ebp_hpmrain[$ei] > 100){
			$ebp_hpmrain[$ei] = 100;
				}
		$ebp_hpmrainc[$ei] = "<tr height=\"3\" class=\"bgc0000FF\"><td width=\"$ebp_hpmrain[$ei]\%\" class=\"bgc87CEFA\">";
			}
################
		$ebp_mpmrain[$ei] = $p_busyou_mp{$ebp_id[$ei]};
			if($ebp_mpmrain[$ei] < 1){
		$ebp_mpmrain[$ei] = 1;
			}
		$ebp_mpmrainc[$ei] = "<tr height=\"3\" class=\"bgcDDA0DD\"><td width=\"$ebp_mpmrain[$ei]\%\" class=\"bgc0000FF\">";
			if($ebp_solmrain[$ei] > 100){
		$ebp_mpmrain[$ei] = int($ebp_mpmrain[$ei] -100)/10;
				if($ebp_mpmrain[$ei] > 100){
			$ebp_mpmrain[$ei] = 100;
				}
		$ebp_mpmrainc[$ei] = "<tr height=\"3\" class=\"bgc0000FF\"><td width=\"$ebp_mpmrain[$ei]\%\" class=\"bgc87CEFA\">";
			}
################
		$ebp_spmrain[$ei] = $p_busyou_sp{$ebp_id[$ei]};
			if($ebp_spmrain[$ei] < 1){
		$ebp_spmrain[$ei] = 1;
			}
		$ebp_spmrainc[$ei] = "<tr height=\"3\" class=\"bgcDDA0DD\"><td width=\"$ebp_spmrain[$ei]\%\" class=\"bgc0000FF\">";
			if($ebp_solmrain[$ei] > 100){
		$ebp_spmrain[$ei] = int($ebp_spmrain[$ei] -100)/10;
				if($ebp_spmrain[$ei] > 100){
			$ebp_spmrain[$ei] = 100;
				}
		$ebp_spmrainc[$ei] = "<tr height=\"3\" class=\"bgc0000FF\"><td width=\"$ebp_spmrain[$ei]\%\" class=\"bgc87CEFA\">";
			}
################
	$b_st = $b_st_w{$ebp_id[$ei]};

	$h_st = $h_st_w{$ebp_id[$ei]};
	$img_op_add{$ebp_id[$ei]} = 2;
			if($ebp_clh2[$ei] > 0){
#				if($h_st eq "正常"){
	$h_st = "混乱";
#				}else{
#	$h_st .= " 混乱";
#				}
	$img_op_add{$ebp_id[$ei]} = 5;
			}
			if($ebp_doku[$ei] > 0){
				if($h_st eq "正常"){
	$h_st = "毒";
				}else{
	$h_st .= " 毒";
				}
	$img_op_add{$ebp_id[$ei]} = 7;
			}
			if($ebp_netu[$ei] > 0){
				if($h_st eq "正常"){
	$h_st = "炎上";
				}else{
	$h_st .= " 炎上";
				}
	$img_op_add{$ebp_id[$ei]} = 6;
			}
$ebp_logf[$ei]++;
											$ebp_soltg[$ei] = $p_heisisuu{$ebp_id[$ei]} - $ebp_solt[$ei];
											$ebp_solt[$ei] = $p_heisisuu{$ebp_id[$ei]};
	$ebp_soltgc[$ei] = sprintf("%+d", $ebp_soltg[$ei]);
	&IMG_B_CG_SAKUSEI("$p_img{$ebp_id[$ei]}$p_cgno{$ebp_id[$ei]}[$img_op_add{$ebp_id[$ei]}]$p_img_f{$ebp_id[$ei]}","$img_wide_d","$img_height_d","$p_img_m{$ebp_id[$ei]}","b$ebp_id[$ei]\_$ebp_logf[$ei]","$ebp_2id[$ei]","$img_op_add{$ebp_id[$ei]}","","","","","","");
		$mapseiseiblm .= "<a id=\"lf-$ebp_id[$ei]-$ebp_logf[$ei]\"></a>
<a id=\"$ebp_id[$ei]-$count\"></a>
<table cellspacing=\"2\" width=\"330\" border=\"2\">
<tr>
<td width=\"100\"></td><td width=\"40\"></td><td width=\"40\"></td><td width=\"40\"></td><td width=\"95\"></td>
</tr>
<tr>
<td rowspan=\"4\"><a href=\"#$ebp_id[$ei]-$countf\">$img_sakusei_kekka</a>
</td>
<td class=\"txtc\" width=\"120\" colspan=\"3\">$p_p_b_a{$ebp_id[$ei]}</td>
<td width=\"110\" class=\"txtc\">$BUHOUSIN[$ebp_shousin1[$ei]]</td>
</tr>

<tr>
<td class=\"txtc\" colspan=\"4\"></td>
</tr>

<tr>
<td class=\"txtc\">HP:$p_busyou_hp{$ebp_id[$ei]}
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$ebp_hpmrainc[$ei]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">MP:$p_busyou_mp{$ebp_id[$ei]}
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$ebp_mpmrainc[$ei]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">SP:$p_busyou_sp{$ebp_id[$ei]}
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$ebp_spmrainc[$ei]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">$b_st</td>
</tr>

<tr>
<td class=\"txtc\" colspan=\"3\">$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}] $p_heisisuu{$ebp_id[$ei]}  ($ebp_soltgc[$ei])
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$ebp_solmrainc[$ei]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">$h_st</td>
</tr>
</table>
";
						}
						}

		$mapseiseiblm .= "
</td></tr>
</table>

</td>
<td width=\"15\" class=\"bgcFFF0F5\" onclick=\"javascript:void(slm(1));\">↓</td>
</tr>
<tr>
<td width=\"15\" class=\"bgcFFF0F5\" onclick=\"javascript:void(slm(-1));\">↑</td>

<a id=\"$count-b\"></a>
<td width=\"720\">
<table cellspacing=\"2\" width=\"720\" border=\"2\">
<tr>
<td width=\"105\"></td><td width=\"45\"></td><td width=\"20\"></td><td width=\"35\"></td><td width=\"40\"></td><td width=\"85\"></td>
<td width=\"20\"></td>
<td width=\"85\"></td><td width=\"40\"></td><td width=\"35\"></td><td width=\"20\"></td><td width=\"45\"></td><td width=\"115\"></td>
</tr>
";
									for($pcount2=0;$pcount2<$btw2;$pcount2++){
	&BAG_LOG2("$pcount2 < $btw2\n");
										$count2 = $pcount2;
$ki_d=0;
$ei_d=0;
$ki_k=0;
$ei_k=0;
										if(!$atcfbl){
										$ki = $count2 % $kouryakujissuu;
										$ki = $kbl_senid[$ki];
										$ei = int(rand($boueijissuu));
										$ei = $ebl_senid[$ei];
#################
			if($p_butaisirei{$kbp_id[$ki]}[1] eq "2" and $p_heisisuu{$ebp_id[$ei_p]} and !int(rand(2)) and $count > 1 and !$ebp_h_ko[$ei_p]){
$ei=int($ei_p);
			}
$ki_p=$ki;
$ei_p=$ei;
$ki_k=$ki;
$ei_k=$ei;
			if($boueitsjissuu and !int(rand(2))){
$add = int(rand($boueitsjissuu));
				if(int($ebl_senidts[$add]) ne $ei and int($ebl_senidts[$add])){
$ei_d=$ei;
$ei=int($ebl_senidts[$add]);
	&KE1LOGBL("<span class=\"c0000FF\">【挑発】</span>:$p_name{$ebp_id[$ei]}は$p_name{$ebp_id[$ei_d]}に攻撃を仕掛けようとしている<br />$p_name{$kbp_id[$ki]}の部隊を挑発した。");
$ei_d=0;
				}
			}
$kbp_logf[$ki]++;
$ebp_logf[$ei]++;
$logfc="<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>\n<a id=\"lf-$ebp_id[$ei]-$ebp_logf[$ei]\"></a>";
			if(int($p_heisisuu{$ebp_id[$ei]} * 100 / ($ebp_solm[$ei]+1)) < 10){
$add = int(rand($boueidsjissuu));
				if(int($ebl_senidds[$add]) ne $ei and int($ebl_senidds[$add])){
$ei_d=$ei;
$ei=int($ebl_senidds[$add]);
$ebp_logf[$ei]++;
$logfc.="<a id=\"lf-$ebp_id[$ei]-$ebp_logf[$ei]\"></a>";
	&E2LOGBL("<span class=\"c0000FF\">【かばう】</span>:$p_name{$ebp_id[$ei]}は残存兵力が少なくなっている<br />$p_name{$ebp_id[$ei_d]}の部隊の護衛に就いた。");

				}
			}
										}else{
										$ei = $count2 % $boueijissuu;
										$ei = $ebl_senid[$ei];
										$ki = int(rand($kouryakujissuu));
										$ki = $kbl_senid[$ki];
############
			if($p_butaisirei{$ebp_id[$ei]}[1] eq "2" and $p_heisisuu{$kbp_id[$ki_p]} and !int(rand(2)) and $count > 1 and !$kbp_h_ko[$ki_p]){
$ki=int($ki_p);
			}
$ki_p=$ki;
$ei_p=$ei;
$ki_k=$ki;
$ei_k=$ei;
			if($kouryakutsjissuu and !int(rand(2))){
$add = int(rand($kouryakutsjissuu));
				if(int($kbl_senidts[$add]) ne $ki and int($kbl_senidts[$add])){
$ki_d=$ki;
$ki=int($kbl_senidts[$add]);
	&KE1LOGBL("<span class=\"c0000FF\">【挑発】</span>:$p_name{$kbp_id[$ki]}は$p_name{$kbp_id[$ki_d]}に攻撃を仕掛けようとしている<br />$p_name{$ebp_id[$ei]}の部隊を挑発した。");
$ki_d=0;
				}
			}
$kbp_logf[$ki]++;
$ebp_logf[$ei]++;
$logfc="<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>\n<a id=\"lf-$ebp_id[$ei]-$ebp_logf[$ei]\"></a>";
			if(int($p_heisisuu{$kbp_id[$ki]} * 100 / ($kbp_solm[$ki]+1)) < 10){
$add = int(rand($kouryakudsjissuu));
				if(int($kbl_senidds[$add]) ne $ki and int($kbl_senidds[$add])){
$ki_d=$ki;
$ki=int($kbl_senidds[$add]);
$kbp_logf[$ki]++;
$logfc.="<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>";
	&K2LOGBL("<span class=\"c0000FF\">【かばう】</span>:$p_name{$kbp_id[$ki]}は残存兵力が少なくなっている<br />$p_name{$kbp_id[$ki_d]}の部隊の護衛に就いた。");

				}
			}
										}
	&BAG_LOG2("SENTOU_SET\n");
									&SENTOU_SET;
	&BAG_LOG2("SENTOU_SETE\n");
										$kbp_husyoukouw[$ki] = 0;
										$ebp_husyoukouw[$ei] = 0;
										$kbp_sub_dmg[$ki] = 0;
										$ebp_sub_dmg[$ei] = 0;
										$kbp_dmg[$ki]=0;
										$ebp_dmg[$ei]=0;
										$kbp_att0[$ki] =$kbp_att[$ki];
										$ebp_att0[$ei] =$ebp_att[$ei];
										$kbp_wsol[$ki] = $p_heisisuu{$kbp_id[$ki]};
										$ebp_wsol[$ei] = $p_heisisuu{$ebp_id[$ei]};
										$kbp_clh[$ki] = int(rand($kbp_bsxx[$ki] +5));
										$ebp_clh[$ei] = int(rand($ebp_bsxx[$ei] +5));
									if($p_heisyu{$kbp_id[$ki]} eq "95" or $p_heisyu{$kbp_id[$ki]} eq "49"){
									if($kbp_clh[$ki] > 9){
										$kbp_clh[$ki] = 9;
									}
										$kbp_clh[$ki] = int(rand($kbp_clh[$ki]));
									}



############計略フェイズ###############

									if(int(rand($kbp_keiryaku_ritu[$ki_k])) < 30 and !$kbp_iku_hit[$ki_k]){
			if($md_eria eq "1"){
#山林
				if(int($kbp_k_exka_f[$ki] * rand($p_tiryoku{$kbp_id[$ki_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@ebl_senid){
										if(!$add and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exka[$ki_k])) < int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exka[$_] * 0.1)){
											if($p_tiryoku{$ebp_id[$_]} > $add){
										$add = $p_tiryoku{$ebp_id[$_]};
										$addc = $p_name{$ebp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki_k]}は風向きを確かめつつ、敵陣近くの山林一帯に火を放った！！");
									foreach(@ebl_senid){
										if($ei eq $_ or int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exka[$ki_k] * $p_syuutyuu{$kbp_id[$ki_k]})) > int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exka[$_] * $p_excalm{$ebp_id[$_]} * 0.1)){
										$ebp_netu[$_]++;
$ebp_logf[$_]++;
$logfc.="<a id=\"lf-$ebp_id[$_]-$ebp_logf[$_]\"></a>";
			&EWBLOGBL("$p_name{$ebp_id[$_]}の部隊は灼熱の炎に包まれる！！");
										}
									}
					}else{
$ebp_logf[$addi]++;
$logfc.="<a id=\"lf-$ebp_id[$addi]-$ebp_logf[$addi]\"></a>";
	&KD_K1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$kbp_id[$ki_k]}は風向きを確かめつつ、<br />敵陣近くの山林一帯に火を放とうとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}elsif(int($kbp_k_exdo_f[$ki] * rand($p_tiryoku{$kbp_id[$ki_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@ebl_senid){
										if(!$add and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exdo[$ki_k])) < int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exdo[$_] * 0.1)){
											if($p_tiryoku{$ebp_id[$_]} > $add){
										$add = $p_tiryoku{$ebp_id[$_]};
										$addc = $p_name{$ebp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki_k]}は敵を誘き寄せつつ、<br />山頂付近に仕掛けた岩を敵陣目掛けて突き落とした！！");

									foreach(@ebl_senid){
										if($ei eq $_ or int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exdo[$ki_k] * $p_syuutyuu{$kbp_id[$ki_k]})) > int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exdo[$_] * $p_excalm{$ebp_id[$_]} * 0.1)){
										$adddmg = int(($p_tiryoku{$kbp_id[$ki_k]} + rand($kbp_sougou[$ki_k]))/20);
											if($adddmg >= $p_heisisuu{$ebp_id[$_]}){
										$adddmg = $p_heisisuu{$ebp_id[$_]} -1;
											}
										$p_heisisuu{$ebp_id[$_]} -=$adddmg;
										$kbp_ex_add[$ki_k] += $adddmg;
										$ebp_sub_dmg[$_] += $adddmg;
$ebp_logf[$_]++;
$logfc.="<a id=\"lf-$ebp_id[$_]-$ebp_logf[$_]\"></a>";
			&EWBLOGBL("$p_name{$ebp_id[$_]}の部隊に$adddmgの追加ダメージ！！");
										}
									}
					}else{
$ebp_logf[$addi]++;
$logfc.="<a id=\"lf-$ebp_id[$addi]-$ebp_logf[$addi]\"></a>";
	&KD_K1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$kbp_id[$ki_k]}は敵を誘き寄せ、<br />落石の計を仕掛けようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}else{
				}
			}elsif($md_eria eq "2"){
#山道
				if(int($kbp_k_exka_f[$ki] * rand($p_tiryoku{$kbp_id[$ki_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@ebl_senid){
										if(!$add and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exka[$ki_k])) < int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exka[$_] * 0.1)){
											if($p_tiryoku{$ebp_id[$_]} > $add){
										$add = $p_tiryoku{$ebp_id[$_]};
										$addc = $p_name{$ebp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
										$ebp_clh2[$ei] += 2;
										$addc = $p_name{$ebp_id[$ei]};
	&K_K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki_k]}は山道脇に少数の兵を伏せ、<br />近くを通過しようとした敵兵に奇襲をかけた！！<br />$addcの部隊は大混乱に陥りました！！");
					}else{
$ebp_logf[$addi]++;
$logfc.="<a id=\"lf-$ebp_id[$addi]-$ebp_logf[$addi]\"></a>";
	&KD_K1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$kbp_id[$ki_k]}は山道脇に少数の兵を伏せ、<br />近くを通過しようとした敵兵に奇襲をかけようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}elsif(int($kbp_k_exdo_f[$ki] * rand($p_tiryoku{$kbp_id[$ki_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@ebl_senid){
										if(!$add and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exdo[$ki_k])) < int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exdo[$_] * 0.1)){
											if($p_tiryoku{$ebp_id[$_]} > $add){
										$add = $p_tiryoku{$ebp_id[$_]};
										$addc = $p_name{$ebp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki_k]}は敵を誘き寄せつつ、<br />山頂付近に仕掛けた岩を敵陣目掛けて突き落とした！！");
									foreach(@ebl_senid){
										if($ei eq $_ or int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exdo[$ki_k] * $p_syuutyuu{$kbp_id[$ki_k]})) > int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exdo[$_] * $p_excalm{$ebp_id[$_]} * 0.1)){
										$adddmg = int(($p_tiryoku{$kbp_id[$ki_k]} + rand($kbp_sougou[$ki_k]))/20);
											if($adddmg >= $p_heisisuu{$ebp_id[$_]}){
										$adddmg = $p_heisisuu{$ebp_id[$_]} -1;
											}
										$p_heisisuu{$ebp_id[$_]} -=$adddmg;
										$kbp_ex_add[$ki_k] += $adddmg;
										$ebp_sub_dmg[$_] += $adddmg;
$ebp_logf[$_]++;
$logfc.="<a id=\"lf-$ebp_id[$_]-$ebp_logf[$_]\"></a>";
			&EWBLOGBL("$p_name{$ebp_id[$_]}の部隊に$adddmgの追加ダメージ！！");
										}
									}
					}else{
$ebp_logf[$addi]++;
$logfc.="<a id=\"lf-$ebp_id[$addi]-$ebp_logf[$addi]\"></a>";
	&KD_K1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$kbp_id[$ki_k]}は敵を誘き寄せ、<br />落石の計を仕掛けようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}else{
				}
			}elsif($md_eria eq "3"){
#川原
				if(int($kbp_k_exsui_f[$ki] * rand($p_tiryoku{$kbp_id[$ki_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@ebl_senid){
										if(!$add and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exsui[$ki_k])) < int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exsui[$_] * 0.1)){
											if($p_tiryoku{$ebp_id[$_]} > $add){
										$add = $p_tiryoku{$ebp_id[$_]};
										$addc = $p_name{$ebp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki_k]}は川の上流をせき止め、<br />下流付近に陣を張っていた敵陣目掛けて水計を仕掛けた！！");
									foreach(@ebl_senid){
										if($ei eq $_ or int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exsui[$ki_k] * $p_syuutyuu{$kbp_id[$ki_k]})) > int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exsui[$_] * $p_excalm{$ebp_id[$_]} * 0.1)){

										$adddmg = int(($p_tiryoku{$kbp_id[$ki_k]} + rand($kbp_sougou[$ki_k]))/15);
											if($adddmg >= $p_heisisuu{$ebp_id[$_]}){
										$adddmg = $p_heisisuu{$ebp_id[$_]} -1;
											}
										$p_heisisuu{$ebp_id[$_]} -=$adddmg;
										$kbp_ex_add[$ki_k] += $adddmg;
										$ebp_sub_dmg[$_] += $adddmg;
$ebp_logf[$_]++;
$logfc.="<a id=\"lf-$ebp_id[$_]-$ebp_logf[$_]\"></a>";
			&EWBLOGBL("$p_name{$ebp_id[$_]}の部隊に$adddmgの追加ダメージ！！");
											if($ebp_netu[$_]){
										$ebp_netu[$_]=0;
			&EWBLOGBL("<span class=\"c0000FF\">【鎮火】</span>陣内が濁流に飲み込まれたことにより、<br />$p_name{$ebp_id[$_]}の部隊を覆い尽くしていた炎が完全に鎮火した模様です。");
											}
										}
									}
					}else{
$ebp_logf[$addi]++;
$logfc.="<a id=\"lf-$ebp_id[$addi]-$ebp_logf[$addi]\"></a>";
	&KD_K1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$kbp_id[$ki_k]}は川の上流をせき止め、<br />水計を仕掛けようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}elsif(int(rand($kbp_k_exmoku_f[$ki]+5)) > 4 and $kbp_netu[$ki] > 0){
										$kbp_netu[$ki] = 0;
	&K_K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki_k]}は近くを流れる川の水を利用し、<br />$p_name{$kbp_id[$ki]}の部隊に付いた火を完全に消し去りました！！");
				}else{
				}
			}elsif($md_eria eq "4"){
#草原
				if(int($kbp_k_exsui_f[$ki] * rand($p_tiryoku{$kbp_id[$ki_k]})) > int($sougouno1 * 0.3) and $#ebl_senid > 2){
										$add = 0;
										$addc = "";
									foreach(@ebl_senid){
										if(!$add and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exsui[$ki_k])) < int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exsui[$_] * 0.1)){
											if($p_tiryoku{$ebp_id[$_]} > $add){
										$add = $p_tiryoku{$ebp_id[$_]};
										$addc = $p_name{$ebp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
										$adddmg = 0;
										$addc = "";
									foreach(@ebl_senid){
										if($ei_k ne $_ and $ei ne $_ and !$adddmg){
										$add ++;
										$adddmg = int($ebp_apadd[$_] - $ebp_acadd[$ei])*2;
										if($adddmg < 1){
										$adddmg = 0;
										}
										$adddmg += int(rand(3))+3;
											if($adddmg >= $p_heisisuu{$ebp_id[$ei]}){
										$adddmg = $p_heisisuu{$ebp_id[$ei]} -1;
											}
										$p_heisisuu{$ebp_id[$ei]} -=$adddmg;
										$kbp_ex_add[$ki_k] += $adddmg;
										$ebp_sub_dmg[$ei] += $adddmg;
										$addc = $p_name{$ebp_id[$_]};
										$addi = $_;
										}
									}
										$addi = $_;
$ebp_logf[$addi]++;
$logfc.="<a id=\"lf-$ebp_id[$addi]-$ebp_logf[$addi]\"></a>";
	&K_K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki_k]}は敵陣に偽の情報を流し、<br />同士討ちさせることに成功しました！！<br />$addcの部隊が$p_name{$ebp_id[$ei]}の部隊に誤って攻撃を仕掛けた為、<br />$p_name{$ebp_id[$ei]}の部隊に$adddmgの追加ダメージ！！");
					}else{
$ebp_logf[$addi]++;
$logfc.="<a id=\"lf-$ebp_id[$addi]-$ebp_logf[$addi]\"></a>";
	&KD_K1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$kbp_id[$ki_k]}は敵陣に偽の情報を流し、<br />同士討ちさせようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}elsif(int($kbp_k_exmoku_f[$ki] * rand($p_tiryoku{$kbp_id[$ki_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@ebl_senid){
										if(!$add and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exmoku[$ki_k])) < int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exmoku[$_] * 0.1)){
											if($p_tiryoku{$ebp_id[$_]} > $add){
										$add = $p_tiryoku{$ebp_id[$_]};
										$addc = $p_name{$ebp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
										$ebp_clh2[$ei] += 2;
										$addc = $p_name{$ebp_id[$ei]};
	&K_K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki_k]}は草むらにこっそり穴を掘り、<br />迫り来る敵を落とし穴へと誘い込みました！！<br />$addcの部隊は大混乱に陥りました！！");
					}else{
$ebp_logf[$addi]++;
$logfc.="<a id=\"lf-$ebp_id[$addi]-$ebp_logf[$addi]\"></a>";
	&KD_K1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$kbp_id[$ki_k]}は草むらにこっそり穴を掘り、<br />敵兵を落とし穴に嵌めようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}else{
				}
			}elsif($md_eria eq "5"){
#林道
				if(int($kbp_k_exmoku_f[$ki] * rand($p_tiryoku{$kbp_id[$ki_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@ebl_senid){
										if(!$add and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exmoku[$ki_k])) < int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exmoku[$_] * 0.1)){
											if($p_tiryoku{$ebp_id[$_]} > $add){
										$add = $p_tiryoku{$ebp_id[$_]};
										$addc = $p_name{$ebp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
										$ebp_clh2[$ei] += 2;
										$addc = $p_name{$ebp_id[$ei]};
	&K_K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki_k]}は林道脇に少数の兵を伏せ、<br />近くを通過しようとした敵兵に奇襲をかけた！！<br />$addcの部隊は大混乱に陥りました！！");
					}else{
$ebp_logf[$addi]++;
$logfc.="<a id=\"lf-$ebp_id[$addi]-$ebp_logf[$addi]\"></a>";
	&KD_K1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$kbp_id[$ki_k]}は林道脇に少数の兵を伏せ、<br />近くを通過しようとした敵兵に奇襲をかけようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}elsif(int($kbp_k_exka_f[$ki] * rand($p_tiryoku{$kbp_id[$ki_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@ebl_senid){
										if(!$add and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exka[$ki_k])) < int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exka[$_] * 0.1)){
											if($p_tiryoku{$ebp_id[$_]} > $add){
										$add = $p_tiryoku{$ebp_id[$_]};
										$addc = $p_name{$ebp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki_k]}は風向きを確かめつつ、敵陣近くの林一帯に火を放った！！");
									foreach(@ebl_senid){
										if($ei eq $_ or int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exka[$ki_k] * $p_syuutyuu{$kbp_id[$ki_k]})) > int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exka[$_] * $p_excalm{$ebp_id[$_]} * 0.1)){
										$ebp_netu[$_]++;
$ebp_logf[$_]++;
$logfc.="<a id=\"lf-$ebp_id[$_]-$ebp_logf[$_]\"></a>";
			&EWBLOGBL("$p_name{$ebp_id[$_]}の部隊は灼熱の炎に包まれる！！");
										}
									}
					}else{
$ebp_logf[$addi]++;
$logfc.="<a id=\"lf-$ebp_id[$addi]-$ebp_logf[$addi]\"></a>";
	&KD_K1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$kbp_id[$ki_k]}は風向きを確かめつつ、<br />敵陣近くの林一帯に火を放とうとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}else{
				}
			}elsif($md_eria eq "6"){
#森林
				if(int($kbp_k_exmoku_f[$ki] * rand($p_tiryoku{$kbp_id[$ki_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@ebl_senid){
										if(!$add and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exmoku[$ki_k])) < int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exmoku[$_] * 0.1)){
											if($p_tiryoku{$ebp_id[$_]} > $add){
										$add = $p_tiryoku{$ebp_id[$_]};
										$addc = $p_name{$ebp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
										$ebp_clh2[$ei] += 2;
										$addc = $p_name{$ebp_id[$ei]};
	&K_K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki_k]}は森に少数の兵を伏せ、<br />近くを通過しようとした敵兵に奇襲をかけた！！<br />$addcの部隊は大混乱に陥りました！！");
					}else{
$ebp_logf[$addi]++;
$logfc.="<a id=\"lf-$ebp_id[$addi]-$ebp_logf[$addi]\"></a>";
	&KD_K1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$kbp_id[$ki_k]}は森に少数の兵を伏せ、<br />近くを通過しようとした敵兵に奇襲をかけようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}elsif(int($kbp_k_exka_f[$ki] * rand($p_tiryoku{$kbp_id[$ki_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@ebl_senid){
										if(!$add and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exka[$ki_k])) < int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exka[$_] * 0.1)){
											if($p_tiryoku{$ebp_id[$_]} > $add){
										$add = $p_tiryoku{$ebp_id[$_]};
										$addc = $p_name{$ebp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki_k]}は風向きを確かめつつ、敵陣近くの森林一帯に火を放った！！");
									foreach(@ebl_senid){
										if($ei eq $_ or int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exka[$ki_k] * $p_syuutyuu{$kbp_id[$ki_k]})) > int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exka[$_] * $p_excalm{$ebp_id[$_]} * 0.1)){
										$ebp_netu[$_]++;
$ebp_logf[$_]++;
$logfc.="<a id=\"lf-$ebp_id[$_]-$ebp_logf[$_]\"></a>";
			&EWBLOGBL("$p_name{$ebp_id[$_]}の部隊は灼熱の炎に包まれる！！");
										}
									}
					}else{
$ebp_logf[$addi]++;
$logfc.="<a id=\"lf-$ebp_id[$addi]-$ebp_logf[$addi]\"></a>";
	&KD_K1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$kbp_id[$ki_k]}は風向きを確かめつつ、<br />敵陣近くの森林一帯に火を放とうとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}else{
				}
			}elsif($md_eria eq "11"){
#山砦
				if(int($kbp_k_exka_f[$ki] * rand($p_tiryoku{$kbp_id[$ki_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@ebl_senid){
										if(!$add and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exka[$ki_k])) < int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exka[$_] * 0.1)){
											if($p_tiryoku{$ebp_id[$_]} > $add){
										$add = $p_tiryoku{$ebp_id[$_]};
										$addc = $p_name{$ebp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki_k]}は風向きを確かめつつ、砦に火を放った！！");
									foreach(@ebl_senid){
										if($ei eq $_ or int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exka[$ki_k] * $p_syuutyuu{$kbp_id[$ki_k]})) > int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exka[$_] * $p_excalm{$ebp_id[$_]} * 0.1)){
										$ebp_netu[$_]++;
$ebp_logf[$_]++;
$logfc.="<a id=\"lf-$ebp_id[$_]-$ebp_logf[$_]\"></a>";
			&EWBLOGBL("$p_name{$ebp_id[$_]}の部隊は灼熱の炎に包まれる！！");
										}
									}
					}else{
$ebp_logf[$addi]++;
$logfc.="<a id=\"lf-$ebp_id[$addi]-$ebp_logf[$addi]\"></a>";
	&KD_K1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$kbp_id[$ki_k]}は風向きを確かめつつ、<br />砦に火を放とうとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}elsif(int($kbp_k_exdo_f[$ki] * rand($p_tiryoku{$kbp_id[$ki_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@ebl_senid){
										if(!$add and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exdo[$ki_k])) < int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exdo[$_] * 0.1)){
											if($p_tiryoku{$ebp_id[$_]} > $add){
										$add = $p_tiryoku{$ebp_id[$_]};
										$addc = $p_name{$ebp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki_k]}は敵陣に偽りの情報を流し、敵軍の司令系統を麻痺させました！！");
									foreach(@ebl_senid){
										if($ei eq $_ or (!$ebp_konranbou[$ei] and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exdo[$ki_k] * (50 + $p_kotobadakumi{$kbp_id[$ki_k]}*2))) > int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exdo[$_] * ($p_excalm{$ebp_id[$_]} * 2 + 50 + $ebp_konranbou[$ei]*30) * 0.1))){
										$ebp_clh2[$_] += 1;
$ebp_logf[$_]++;
$logfc.="<a id=\"lf-$ebp_id[$_]-$ebp_logf[$_]\"></a>";
			&EWBLOGBL("$p_name{$ebp_id[$_]}の部隊は大混乱に陥っています！！");
										}
									}
					}else{
$ebp_logf[$addi]++;
$logfc.="<a id=\"lf-$ebp_id[$addi]-$ebp_logf[$addi]\"></a>";
	&KD_K1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$kbp_id[$ki_k]}は敵陣に偽りの情報を流し、<br />敵兵を混乱に陥れようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}else{
				}
			}elsif($md_eria eq "12"){
#平砦
				if(int($kbp_k_exsui_f[$ki] * rand($p_tiryoku{$kbp_id[$ki_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@ebl_senid){
										if(!$add and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exsui[$ki_k])) < int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exsui[$_] * 0.1)){
											if($p_tiryoku{$ebp_id[$_]} > $add){
										$add = $p_tiryoku{$ebp_id[$_]};
										$addc = $p_name{$ebp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki_k]}は敵陣に偽りの情報を流し、敵軍の司令系統を麻痺させました！！");
									foreach(@ebl_senid){
										if($ei eq $_ or (!$ebp_konranbou[$ei] and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exsui[$ki_k] * (50 + $p_kotobadakumi{$kbp_id[$ki_k]}*2))) > int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exsui[$_] * ($p_excalm{$ebp_id[$_]} * 2 + 50 + $ebp_konranbou[$ei]*30) * 0.1))){
										$ebp_clh2[$_] += 1;
$ebp_logf[$_]++;
$logfc.="<a id=\"lf-$ebp_id[$_]-$ebp_logf[$_]\"></a>";
			&EWBLOGBL("$p_name{$ebp_id[$_]}の部隊は大混乱に陥っています！！");
										}
									}
					}else{
$ebp_logf[$addi]++;
$logfc.="<a id=\"lf-$ebp_id[$addi]-$ebp_logf[$addi]\"></a>";
	&KD_K1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$kbp_id[$ki_k]}は敵陣に偽りの情報を流し、<br />敵兵を混乱に陥れようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}elsif(int($kbp_k_exmoku_f[$ki] * rand($p_tiryoku{$kbp_id[$ki_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@ebl_senid){
										if(!$add and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exmoku[$ki_k])) < int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exmoku[$_] * 0.1)){
											if($p_tiryoku{$ebp_id[$_]} > $add){
										$add = $p_tiryoku{$ebp_id[$_]};
										$addc = $p_name{$ebp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki_k]}は風向きを確かめつつ、砦に火を放った！！");
									foreach(@ebl_senid){
										if($ei eq $_ or int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exmoku[$ki_k] * $p_syuutyuu{$kbp_id[$ki_k]})) > int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exmoku[$_] * $p_excalm{$ebp_id[$_]} * 0.1)){
										$ebp_netu[$_]++;
$ebp_logf[$_]++;
$logfc.="<a id=\"lf-$ebp_id[$_]-$ebp_logf[$_]\"></a>";
			&EWBLOGBL("$p_name{$ebp_id[$_]}の部隊は灼熱の炎に包まれる！！");
										}
									}
					}else{
$ebp_logf[$addi]++;
$logfc.="<a id=\"lf-$ebp_id[$addi]-$ebp_logf[$addi]\"></a>";
	&KD_K1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$kbp_id[$ki_k]}は風向きを確かめつつ、<br />砦に火を放とうとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}else{
				}
			}elsif($md_eria eq "13"){
#森砦
				if(int($kbp_k_exmoku_f[$ki] * rand($p_tiryoku{$kbp_id[$ki_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@ebl_senid){
										if(!$add and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exmoku[$ki_k])) < int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exmoku[$_] * 0.1)){
											if($p_tiryoku{$ebp_id[$_]} > $add){
										$add = $p_tiryoku{$ebp_id[$_]};
										$addc = $p_name{$ebp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki_k]}は敵陣に偽りの情報を流し、敵軍の司令系統を麻痺させました！！");
									foreach(@ebl_senid){
										if($ei eq $_ or (!$ebp_konranbou[$ei] and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exmoku[$ki_k] * (50 + $p_kotobadakumi{$kbp_id[$ki_k]}*2))) > int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exmoku[$_] * ($p_excalm{$ebp_id[$_]} * 2 + 50 + $ebp_konranbou[$ei]*30) * 0.1))){
										$ebp_clh2[$_] += 1;
$ebp_logf[$_]++;
$logfc.="<a id=\"lf-$ebp_id[$_]-$ebp_logf[$_]\"></a>";
			&EWBLOGBL("$p_name{$ebp_id[$_]}の部隊は大混乱に陥っています！！");
										}
									}
					}else{
$ebp_logf[$addi]++;
$logfc.="<a id=\"lf-$ebp_id[$addi]-$ebp_logf[$addi]\"></a>";
	&KD_K1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$kbp_id[$ki_k]}は敵陣に偽りの情報を流し、<br />敵兵を混乱に陥れようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}elsif(int($kbp_k_exka_f[$ki] * rand($p_tiryoku{$kbp_id[$ki_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@ebl_senid){
										if(!$add and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exka[$ki_k])) < int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exka[$_] * 0.1)){
											if($p_tiryoku{$ebp_id[$_]} > $add){
										$add = $p_tiryoku{$ebp_id[$_]};
										$addc = $p_name{$ebp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki_k]}は風向きを確かめつつ、砦に火を放った！！");
									foreach(@ebl_senid){
										if($ei eq $_ or int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exka[$ki_k] * $p_syuutyuu{$kbp_id[$ki_k]})) > int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exka[$_] * $p_excalm{$ebp_id[$_]} * 0.1)){
										$ebp_netu[$_]++;
$ebp_logf[$_]++;
$logfc.="<a id=\"lf-$ebp_id[$_]-$ebp_logf[$_]\"></a>";
			&EWBLOGBL("$p_name{$ebp_id[$_]}の部隊は灼熱の炎に包まれる！！");
										}
									}
					}else{
$ebp_logf[$addi]++;
$logfc.="<a id=\"lf-$ebp_id[$addi]-$ebp_logf[$addi]\"></a>";
	&KD_K1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$kbp_id[$ki_k]}は風向きを確かめつつ、<br />砦に火を放とうとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}else{
				}
			}elsif($md_eria eq "20"){
#拠点
				if(int($kbp_k_exdo_f[$ki] * rand($p_tiryoku{$kbp_id[$ki_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@ebl_senid){
										if(!$add and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exdo[$ki_k])) < int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exdo[$_] * 0.1)){
											if($p_tiryoku{$ebp_id[$_]} > $add){
										$add = $p_tiryoku{$ebp_id[$_]};
										$addc = $p_name{$ebp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki_k]}は敵陣に偽りの情報を流し、敵軍の司令系統を麻痺させました！！");
									foreach(@ebl_senid){
										if($ei eq $_ or (!$ebp_konranbou[$ei] and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exdo[$ki_k] * (50 + $p_kotobadakumi{$kbp_id[$ki_k]}*2))) > int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exdo[$_] * ($p_excalm{$ebp_id[$_]} * 2 + 50 + $ebp_konranbou[$ei]*30) * 0.1))){
										$ebp_clh2[$_] += 1;
$ebp_logf[$_]++;
$logfc.="<a id=\"lf-$ebp_id[$_]-$ebp_logf[$_]\"></a>";
			&EWBLOGBL("$p_name{$ebp_id[$_]}の部隊は大混乱に陥っています！！");
										}
									}
					}else{
$ebp_logf[$addi]++;
$logfc.="<a id=\"lf-$ebp_id[$addi]-$ebp_logf[$addi]\"></a>";
	&KD_K1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$kbp_id[$ki_k]}は敵陣に偽りの情報を流し、<br />敵兵を混乱に陥れようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}elsif(int($kbp_k_exkin_f[$ki] * rand($p_tiryoku{$kbp_id[$ki_k]})) > int($sougouno1 * 0.3) and $#ebl_senid > 2){
										$add = 0;
										$addc = "";
									foreach(@ebl_senid){
										if(!$add and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exkin[$ki_k])) < int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exkin[$_] * 0.1)){
											if($p_tiryoku{$ebp_id[$_]} > $add){
										$add = $p_tiryoku{$ebp_id[$_]};
										$addc = $p_name{$ebp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
										$adddmg = 0;
										$addc = "";
									foreach(@ebl_senid){
										if($ei_k ne $_ and $ei ne $_ and !$adddmg){
										$add ++;
										$adddmg = int($ebp_apadd[$_] - $ebp_acadd[$ei])*2;
										if($adddmg < 1){
										$adddmg = 0;
										}
										$adddmg += int(rand(3))+3;
											if($adddmg >= $p_heisisuu{$ebp_id[$ei]}){
										$adddmg = $p_heisisuu{$ebp_id[$ei]} -1;
											}
										$p_heisisuu{$ebp_id[$ei]} -=$adddmg;
										$kbp_ex_add[$ki_k] += $adddmg;
										$ebp_sub_dmg[$ei] += $adddmg;
										$addc = $p_name{$ebp_id[$_]};
										$addi = $_;
										}
									}
$ebp_logf[$addi]++;
$logfc.="<a id=\"lf-$ebp_id[$addi]-$ebp_logf[$addi]\"></a>";
	&K_K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki_k]}は敵陣に偽の情報を流し、<br />同士討ちさせることに成功しました！！<br />$addcの部隊が$p_name{$ebp_id[$ei]}の部隊に誤って攻撃を仕掛けた為、<br />$p_name{$ebp_id[$ei]}の部隊に$adddmgの追加ダメージ！！");
					}else{
$ebp_logf[$addi]++;
$logfc.="<a id=\"lf-$ebp_id[$addi]-$ebp_logf[$addi]\"></a>";
	&KD_K1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$kbp_id[$ki_k]}は敵陣に偽の情報を流し、<br />同士討ちさせようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}else{
				}
			}else{
#城
				if(int($kbp_k_exkin_f[$ki] * rand($p_tiryoku{$kbp_id[$ki_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@ebl_senid){
										if(!$add and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exkin[$ki_k])) < int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exkin[$_] * 0.1)){
											if($p_tiryoku{$ebp_id[$_]} > $add){
										$add = $p_tiryoku{$ebp_id[$_]};
										$addc = $p_name{$ebp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki_k]}は敵陣に偽りの情報を流し、敵軍の司令系統を麻痺させました！！");
									foreach(@ebl_senid){
										if($ei eq $_ or (!$ebp_konranbou[$ei] and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exkin[$ki_k] * (50 + $p_kotobadakumi{$kbp_id[$ki_k]}*2))) > int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exkin[$_] * ($p_excalm{$ebp_id[$_]} * 2 + 50 + $ebp_konranbou[$ei]*30) * 0.1))){
										$ebp_clh2[$_] += 1;
$ebp_logf[$_]++;
$logfc.="<a id=\"lf-$ebp_id[$_]-$ebp_logf[$_]\"></a>";
			&EWBLOGBL("$p_name{$ebp_id[$_]}の部隊は大混乱に陥っています！！");
										}
									}
					}else{
$ebp_logf[$addi]++;
$logfc.="<a id=\"lf-$ebp_id[$addi]-$ebp_logf[$addi]\"></a>";
	&KD_K1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$kbp_id[$ki_k]}は敵陣に偽りの情報を流し、<br />敵兵を混乱に陥れようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}elsif(int($kbp_k_exsui_f[$ki] * rand($p_tiryoku{$kbp_id[$ki_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@ebl_senid){
										if(!$add and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exsui[$ki_k])) < int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exsui[$_] * 0.1)){
											if($p_tiryoku{$ebp_id[$_]} > $add){
										$add = $p_tiryoku{$ebp_id[$_]};
										$addc = $p_name{$ebp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki_k]}は敵城周辺の水路を隈なく封鎖し、<br />敵陣を渇水状態に陥れた！！");
									foreach(@ebl_senid){
										if($ei eq $_ or (!$ebp_sikibou[$_] and int(rand($p_tiryoku{$kbp_id[$ki_k]} * $kbp_k_exsui[$ki_k] * $p_syuutyuu{$kbp_id[$ki_k]})) > int($p_tiryoku{$ebp_id[$_]} * $ebp_k_exsui[$_] * $p_excalm{$ebp_id[$_]} * 0.1))){
										$ebp_att[$_] -= 5;
				$ebp_heisenia[$_] = int($ebp_heisenia[$_] * 0.85 * 100)/100;
$ebp_logf[$_]++;
$logfc.="<a id=\"lf-$ebp_id[$_]-$ebp_logf[$_]\"></a>";
			&EWBLOGBL("$p_name{$ebp_id[$_]}の部隊の士気が低下！！");
										}
									}
					}else{
$ebp_logf[$addi]++;
$logfc.="<a id=\"lf-$ebp_id[$addi]-$ebp_logf[$addi]\"></a>";
	&KD_K1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$kbp_id[$ki_k]}は敵城周辺の水路を封鎖し、<br />断水の計を仕掛けようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}else{
				}
			}
									}

###########################
									if(int(rand($ebp_keiryaku_ritu[$ei_k])) < 30 and !$ebp_iku_hit[$ei_k]){
			if($md_eria eq "1"){
#山林
				if(int($ebp_k_exka_f[$ei] * rand($p_tiryoku{$ebp_id[$ei_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@kbl_senid){
										if(!$add and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exka[$ei_k])) < int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exka[$_] * 0.1)){
											if($p_tiryoku{$kbp_id[$_]} > $add){
										$add = $p_tiryoku{$kbp_id[$_]};
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei_k]}は風向きを確かめつつ、敵陣近くの山林一帯に火を放った！！");
									foreach(@kbl_senid){
										if($ki eq $_ or int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exka[$ei_k] * $p_syuutyuu{$ebp_id[$ei_k]})) > int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exka[$_] * $p_excalm{$kbp_id[$_]} * 0.1)){
										$kbp_netu[$_]++;
$kbp_logf[$_]++;
$logfc.="<a id=\"lf-$kbp_id[$_]-$kbp_logf[$_]\"></a>";
			&KWBLOGBL("$p_name{$kbp_id[$_]}の部隊は灼熱の炎に包まれる！！");
										}
									}
					}else{
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&KD_E1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$ebp_id[$ei_k]}は風向きを確かめつつ、<br />敵陣近くの山林一帯に火を放とうとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}elsif(int($ebp_k_exdo_f[$ei] * rand($p_tiryoku{$ebp_id[$ei_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@kbl_senid){
										if(!$add and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exdo[$ei_k])) < int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exdo[$_] * 0.1)){
											if($p_tiryoku{$kbp_id[$_]} > $add){
										$add = $p_tiryoku{$kbp_id[$_]};
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei_k]}は敵を誘き寄せつつ、<br />山頂付近に仕掛けた岩を敵陣目掛けて突き落とした！！");

									foreach(@kbl_senid){
										if($ki eq $_ or int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exdo[$ei_k] * $p_syuutyuu{$ebp_id[$ei_k]})) > int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exdo[$_] * $p_excalm{$kbp_id[$_]} * 0.1)){
										$adddmg = int(($p_tiryoku{$ebp_id[$ei_k]} + rand($ebp_sougou[$ei_k]))/20);
											if($adddmg >= $p_heisisuu{$kbp_id[$_]}){
										$adddmg = $p_heisisuu{$kbp_id[$_]} -1;
											}
										$p_heisisuu{$kbp_id[$_]} -=$adddmg;
										$ebp_ex_add[$ei_k] += $adddmg;
										$kbp_sub_dmg[$_] += $adddmg;
$kbp_logf[$_]++;
$logfc.="<a id=\"lf-$kbp_id[$_]-$kbp_logf[$_]\"></a>";
			&KWBLOGBL("$p_name{$kbp_id[$_]}の部隊に$adddmgの追加ダメージ！！");
										}
									}
					}else{
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&KD_E1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$ebp_id[$ei_k]}は敵を誘き寄せ、<br />落石の計を仕掛けようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}else{
				}
			}elsif($md_eria eq "2"){
#山道
				if(int($ebp_k_exka_f[$ei] * rand($p_tiryoku{$ebp_id[$ei_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@kbl_senid){
										if(!$add and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exka[$ei_k])) < int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exka[$_] * 0.1)){
											if($p_tiryoku{$kbp_id[$_]} > $add){
										$add = $p_tiryoku{$kbp_id[$_]};
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
										$kbp_clh2[$ki] += 2;
										$addc = $p_name{$kbp_id[$ki]};
	&K_E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei_k]}は山道脇に少数の兵を伏せ、<br />近くを通過しようとした敵兵に奇襲をかけた！！<br />$addcの部隊は大混乱に陥りました！！");
					}else{
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&KD_E1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$ebp_id[$ei_k]}は山道脇に少数の兵を伏せ、<br />近くを通過しようとした敵兵に奇襲をかけようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}elsif(int($ebp_k_exdo_f[$ei] * rand($p_tiryoku{$ebp_id[$ei_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@kbl_senid){
										if(!$add and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exdo[$ei_k])) < int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exdo[$_] * 0.1)){
											if($p_tiryoku{$kbp_id[$_]} > $add){
										$add = $p_tiryoku{$kbp_id[$_]};
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei_k]}は敵を誘き寄せつつ、<br />山頂付近に仕掛けた岩を敵陣目掛けて突き落とした！！");
									foreach(@kbl_senid){
										if($ki eq $_ or int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exdo[$ei_k] * $p_syuutyuu{$ebp_id[$ei_k]})) > int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exdo[$_] * $p_excalm{$kbp_id[$_]} * 0.1)){
										$adddmg = int(($p_tiryoku{$ebp_id[$ei_k]} + rand($ebp_sougou[$ei_k]))/20);
											if($adddmg >= $p_heisisuu{$kbp_id[$_]}){
										$adddmg = $p_heisisuu{$kbp_id[$_]} -1;
											}
										$p_heisisuu{$kbp_id[$_]} -=$adddmg;
										$ebp_ex_add[$ei_k] += $adddmg;
										$kbp_sub_dmg[$_] += $adddmg;
$kbp_logf[$_]++;
$logfc.="<a id=\"lf-$kbp_id[$_]-$kbp_logf[$_]\"></a>";
			&KWBLOGBL("$p_name{$kbp_id[$_]}の部隊に$adddmgの追加ダメージ！！");
										}
									}
					}else{
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&KD_E1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$ebp_id[$ei_k]}は敵を誘き寄せ、<br />落石の計を仕掛けようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}else{
				}
			}elsif($md_eria eq "3"){
#川原
				if(int($ebp_k_exsui_f[$ei] * rand($p_tiryoku{$ebp_id[$ei_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@kbl_senid){
										if(!$add and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exsui[$ei_k])) < int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exsui[$_] * 0.1)){
											if($p_tiryoku{$kbp_id[$_]} > $add){
										$add = $p_tiryoku{$kbp_id[$_]};
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei_k]}は川の上流をせき止め、<br />下流付近に陣を張っていた敵陣目掛けて水計を仕掛けた！！");
									foreach(@kbl_senid){
										if($ki eq $_ or int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exsui[$ei_k] * $p_syuutyuu{$ebp_id[$ei_k]})) > int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exsui[$_] * $p_excalm{$kbp_id[$_]} * 0.1)){

										$adddmg = int(($p_tiryoku{$ebp_id[$ei_k]} + rand($ebp_sougou[$ei_k]))/15);
											if($adddmg >= $p_heisisuu{$kbp_id[$_]}){
										$adddmg = $p_heisisuu{$kbp_id[$_]} -1;
											}
										$p_heisisuu{$kbp_id[$_]} -=$adddmg;
										$ebp_ex_add[$ei_k] += $adddmg;
										$kbp_sub_dmg[$_] += $adddmg;
$kbp_logf[$_]++;
$logfc.="<a id=\"lf-$kbp_id[$_]-$kbp_logf[$_]\"></a>";
			&KWBLOGBL("$p_name{$kbp_id[$_]}の部隊に$adddmgの追加ダメージ！！");
											if($kbp_netu[$_]){
										$kbp_netu[$_]=0;
			&KWBLOGBL("<span class=\"c0000FF\">【鎮火】</span>陣内が濁流に飲み込まれたことにより、<br />$p_name{$kbp_id[$_]}の部隊を覆い尽くしていた炎が完全に鎮火した模様です。");
											}
										}
									}
					}else{
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&KD_E1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$ebp_id[$ei_k]}は川の上流をせき止め、<br />水計を仕掛けようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}elsif(int(rand($kbp_k_exmoku_f[$ki]+5)) > 4 and $ebp_netu[$ei] > 0){
										$ebp_netu[$ei] = 0;
	&K_E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei_k]}は近くを流れる川の水を利用し、<br />$p_name{$ebp_id[$ei]}の部隊に付いた火を完全に消し去りました！！");
				}else{
				}
			}elsif($md_eria eq "4"){
#草原
				if(int($ebp_k_exkin_f[$ei] * rand($p_tiryoku{$ebp_id[$ei_k]})) > int($sougouno1 * 0.3) and $#kbl_senid > 2){
										$add = 0;
										$addc = "";
									foreach(@kbl_senid){
										if(!$add and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exsui[$ei_k])) < int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exsui[$_] * 0.1)){
											if($p_tiryoku{$kbp_id[$_]} > $add){
										$add = $p_tiryoku{$kbp_id[$_]};
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
										$adddmg = 0;
										$addc = "";
									foreach(@kbl_senid){
										if($ki_k ne $_ and $ki ne $_ and !$adddmg){
										$add ++;
										$adddmg = int($kbp_apadd[$_] - $kbp_acadd[$ei])*2;
										if($adddmg < 1){
										$adddmg = 0;
										}
										$adddmg += int(rand(3))+3;
											if($adddmg >= $p_heisisuu{$kbp_id[$ki]}){
										$adddmg = $p_heisisuu{$kbp_id[$ki]} -1;
											}
										$p_heisisuu{$kbp_id[$ki]} -=$adddmg;
										$ebp_ex_add[$ei_k] += $adddmg;
										$kbp_sub_dmg[$ki] += $adddmg;
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
										}
									}
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&K_E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei_k]}は敵陣に偽の情報を流し、<br />同士討ちさせることに成功しました！！<br />$addcの部隊が$p_name{$kbp_id[$ki]}の部隊に誤って攻撃を仕掛けた為、<br />$p_name{$kbp_id[$ki]}の部隊に$adddmgの追加ダメージ！！");
					}else{
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&KD_E1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$ebp_id[$ei_k]}は敵陣に偽の情報を流し、<br />同士討ちさせようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}elsif(int($ebp_k_exmoku_f[$ei] * rand($p_tiryoku{$ebp_id[$ei_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@kbl_senid){
										if(!$add and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exmoku[$ei_k])) < int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exmoku[$_] * 0.1)){
											if($p_tiryoku{$kbp_id[$_]} > $add){
										$add = $p_tiryoku{$kbp_id[$_]};
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
										$kbp_clh2[$ki] += 2;
										$addc = $p_name{$kbp_id[$ki]};
	&K_E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei_k]}は草むらにこっそり穴を掘り、<br />迫り来る敵を落とし穴へと誘い込みました！！<br />$addcの部隊は大混乱に陥りました！！");
					}else{
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&KD_E1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$ebp_id[$ei_k]}は草むらにこっそり穴を掘り、<br />敵兵を落とし穴に嵌めようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}else{
				}
			}elsif($md_eria eq "5"){
#林道
				if(int($ebp_k_exmoku_f[$ei] * rand($p_tiryoku{$ebp_id[$ei_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@kbl_senid){
										if(!$add and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exmoku[$ei_k])) < int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exmoku[$_] * 0.1)){
											if($p_tiryoku{$kbp_id[$_]} > $add){
										$add = $p_tiryoku{$kbp_id[$_]};
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
										$kbp_clh2[$ki] += 2;
										$addc = $p_name{$kbp_id[$ki]};
	&K_E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei_k]}は林道脇に少数の兵を伏せ、<br />近くを通過しようとした敵兵に奇襲をかけた！！<br />$addcの部隊は大混乱に陥りました！！");
					}else{
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&KD_E1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$ebp_id[$ei_k]}は林道脇に少数の兵を伏せ、<br />近くを通過しようとした敵兵に奇襲をかけようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}elsif(int($ebp_k_exka_f[$ei] * rand($p_tiryoku{$ebp_id[$ei_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@kbl_senid){
										if(!$add and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exka[$ei_k])) < int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exka[$_] * 0.1)){
											if($p_tiryoku{$kbp_id[$_]} > $add){
										$add = $p_tiryoku{$kbp_id[$_]};
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei_k]}は風向きを確かめつつ、敵陣近くの林一帯に火を放った！！");
									foreach(@kbl_senid){
										if($ki eq $_ or int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exka[$ei_k] * $p_syuutyuu{$ebp_id[$ei_k]})) > int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exka[$_] * $p_excalm{$kbp_id[$_]} * 0.1)){
										$kbp_netu[$_]++;
$kbp_logf[$_]++;
$logfc.="<a id=\"lf-$kbp_id[$_]-$kbp_logf[$_]\"></a>";
			&KWBLOGBL("$p_name{$kbp_id[$_]}の部隊は灼熱の炎に包まれる！！");
										}
									}
					}else{
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&KD_E1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$ebp_id[$ei_k]}は風向きを確かめつつ、<br />敵陣近くの林一帯に火を放とうとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}else{
				}
			}elsif($md_eria eq "6"){
#森林
				if(int($ebp_k_exmoku_f[$ei] * rand($p_tiryoku{$ebp_id[$ei_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@kbl_senid){
										if(!$add and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exmoku[$ei_k])) < int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exmoku[$_] * 0.1)){
											if($p_tiryoku{$kbp_id[$_]} > $add){
										$add = $p_tiryoku{$kbp_id[$_]};
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
										$kbp_clh2[$ki] += 2;
										$addc = $p_name{$kbp_id[$ki]};
	&K_E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei_k]}は森に少数の兵を伏せ、<br />近くを通過しようとした敵兵に奇襲をかけた！！<br />$addcの部隊は大混乱に陥りました！！");
					}else{
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&KD_E1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$ebp_id[$ei_k]}は森に少数の兵を伏せ、<br />近くを通過しようとした敵兵に奇襲をかけようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}elsif(int($ebp_k_exka_f[$ei] * rand($p_tiryoku{$ebp_id[$ei_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@kbl_senid){
										if(!$add and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exka[$ei_k])) < int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exka[$_] * 0.1)){
											if($p_tiryoku{$kbp_id[$_]} > $add){
										$add = $p_tiryoku{$kbp_id[$_]};
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei_k]}は風向きを確かめつつ、敵陣近くの森林一帯に火を放った！！");
									foreach(@kbl_senid){
										if($ki eq $_ or int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exka[$ei_k] * $p_syuutyuu{$ebp_id[$ei_k]})) > int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exka[$_] * $p_excalm{$kbp_id[$_]} * 0.1)){
										$kbp_netu[$_]++;
$kbp_logf[$_]++;
$logfc.="<a id=\"lf-$kbp_id[$_]-$kbp_logf[$_]\"></a>";
			&KWBLOGBL("$p_name{$kbp_id[$_]}の部隊は灼熱の炎に包まれる！！");
										}
									}
					}else{
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&KD_E1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$ebp_id[$ei_k]}は風向きを確かめつつ、<br />敵陣近くの森林一帯に火を放とうとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}else{
				}
			}elsif($md_eria eq "11"){
#山砦
				if(int($ebp_k_exka_f[$ei] * rand($p_tiryoku{$ebp_id[$ei_k]})) > int($sougouno1 * 0.3) and $#kbl_senid > 2){
										$add = 0;
										$addc = "";
									foreach(@kbl_senid){
										if(!$add and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exka[$ei_k])) < int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exka[$_] * 0.1)){
											if($p_tiryoku{$kbp_id[$_]} > $add){
										$add = $p_tiryoku{$kbp_id[$_]};
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
										$adddmg = 0;
										$addc = "";
									foreach(@kbl_senid){
										if($ki_k ne $_ and $ki ne $_ and !$adddmg){
										$add ++;
										$adddmg = int($kbp_apadd[$_] - $kbp_acadd[$ei])*2;
										if($adddmg < 1){
										$adddmg = 0;
										}
										$adddmg += int(rand(3))+3;
											if($adddmg >= $p_heisisuu{$kbp_id[$ki]}){
										$adddmg = $p_heisisuu{$kbp_id[$ki]} -1;
											}
										$p_heisisuu{$kbp_id[$ki]} -=$adddmg;
										$ebp_ex_add[$ei_k] += $adddmg;
										$kbp_sub_dmg[$ki] += $adddmg;
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
										}
									}
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&K_E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei_k]}は敵陣に偽の情報を流し、<br />同士討ちさせることに成功しました！！<br />$addcの部隊が$p_name{$kbp_id[$ki]}の部隊に誤って攻撃を仕掛けた為、<br />$p_name{$kbp_id[$ki]}の部隊に$adddmgの追加ダメージ！！");
					}else{
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&KD_E1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$ebp_id[$ei_k]}は敵陣に偽の情報を流し、<br />同士討ちさせようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}elsif(int($ebp_k_exdo_f[$ei] * rand($p_tiryoku{$ebp_id[$ei_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@kbl_senid){
										if(!$add and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exdo[$ei_k])) < int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exdo[$_] * 0.1)){
											if($p_tiryoku{$kbp_id[$_]} > $add){
										$add = $p_tiryoku{$kbp_id[$_]};
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei_k]}は敵陣に偽りの情報を流し、敵軍の司令系統を麻痺させました！！");
									foreach(@kbl_senid){
										if($ki eq $_ or (!$kbp_konranbou[$ki] and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exdo[$ei_k] * (50 + $p_kotobadakumi{$ebp_id[$ei_k]}*2))) > int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exdo[$_] * ($p_excalm{$kbp_id[$_]} * 2 + 50 + $kbp_konranbou[$ki]*30) * 0.1))){
										$kbp_clh2[$_] += 1;
$kbp_logf[$_]++;
$logfc.="<a id=\"lf-$kbp_id[$_]-$kbp_logf[$_]\"></a>";
			&KWBLOGBL("$p_name{$kbp_id[$_]}の部隊は大混乱に陥っています！！");
										}
									}
					}else{
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&KD_E1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$ebp_id[$ei_k]}は敵陣に偽りの情報を流し、<br />敵兵を混乱に陥れようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}else{
				}
			}elsif($md_eria eq "12"){
#平砦
				if(int($ebp_k_exsui_f[$ei] * rand($p_tiryoku{$ebp_id[$ei_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@kbl_senid){
										if(!$add and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exsui[$ei_k])) < int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exsui[$_] * 0.1)){
											if($p_tiryoku{$kbp_id[$_]} > $add){
										$add = $p_tiryoku{$kbp_id[$_]};
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei_k]}は敵陣に偽りの情報を流し、敵軍の司令系統を麻痺させました！！");
									foreach(@kbl_senid){
										if($ki eq $_ or (!$kbp_konranbou[$ki] and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exsui[$ei_k] * (50 + $p_kotobadakumi{$ebp_id[$ei_k]}*2))) > int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exsui[$_] * ($p_excalm{$kbp_id[$_]} * 2 + 50 + $kbp_konranbou[$ki]*30) * 0.1))){
										$kbp_clh2[$_] += 1;
$kbp_logf[$_]++;
$logfc.="<a id=\"lf-$kbp_id[$_]-$kbp_logf[$_]\"></a>";
			&KWBLOGBL("$p_name{$kbp_id[$_]}の部隊は大混乱に陥っています！！");
										}
									}
					}else{
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&KD_E1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$ebp_id[$ei_k]}は敵陣に偽りの情報を流し、<br />敵兵を混乱に陥れようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}elsif(int($ebp_k_exmoku_f[$ei] * rand($p_tiryoku{$ebp_id[$ei_k]})) > int($sougouno1 * 0.3) and $#kbl_senid > 2){
										$add = 0;
										$addc = "";
									foreach(@kbl_senid){
										if(!$add and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exmoku[$ei_k])) < int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exmoku[$_] * 0.1)){
											if($p_tiryoku{$kbp_id[$_]} > $add){
										$add = $p_tiryoku{$kbp_id[$_]};
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
										$adddmg = 0;
										$addc = "";
									foreach(@kbl_senid){
										if($ki_k ne $_ and $ki ne $_ and !$adddmg){
										$add ++;
										$adddmg = int($kbp_apadd[$_] - $kbp_acadd[$ei])*2;
										if($adddmg < 1){
										$adddmg = 0;
										}
										$adddmg += int(rand(3))+3;
											if($adddmg >= $p_heisisuu{$kbp_id[$ki]}){
										$adddmg = $p_heisisuu{$kbp_id[$ki]} -1;
											}
										$p_heisisuu{$kbp_id[$ki]} -=$adddmg;
										$ebp_ex_add[$ei_k] += $adddmg;
										$kbp_sub_dmg[$ki] += $adddmg;
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
										}
									}
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&K_E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei_k]}は敵陣に偽の情報を流し、<br />同士討ちさせることに成功しました！！<br />$addcの部隊が$p_name{$kbp_id[$ki]}の部隊に誤って攻撃を仕掛けた為、<br />$p_name{$kbp_id[$ki]}の部隊に$adddmgの追加ダメージ！！");
					}else{
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&KD_E1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$ebp_id[$ei_k]}は敵陣に偽の情報を流し、<br />同士討ちさせようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}else{
				}
			}elsif($md_eria eq "13"){
#森砦
				if(int($ebp_k_exmoku_f[$ei] * rand($p_tiryoku{$ebp_id[$ei_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@kbl_senid){
										if(!$add and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exmoku[$ei_k])) < int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exmoku[$_] * 0.1)){
											if($p_tiryoku{$kbp_id[$_]} > $add){
										$add = $p_tiryoku{$kbp_id[$_]};
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei_k]}は敵陣に偽りの情報を流し、敵軍の司令系統を麻痺させました！！");
									foreach(@kbl_senid){
										if($ki eq $_ or (!$kbp_konranbou[$ki] and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exmoku[$ei_k] * (50 + $p_kotobadakumi{$ebp_id[$ei_k]}*2))) > int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exmoku[$_] * ($p_excalm{$kbp_id[$_]} * 2 + 50 + $kbp_konranbou[$ki]*30) * 0.1))){
										$kbp_clh2[$_] += 1;
$kbp_logf[$_]++;
$logfc.="<a id=\"lf-$kbp_id[$_]-$kbp_logf[$_]\"></a>";
			&KWBLOGBL("$p_name{$kbp_id[$_]}の部隊は大混乱に陥っています！！");
										}
									}
					}else{
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&KD_E1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$ebp_id[$ei_k]}は敵陣に偽りの情報を流し、<br />敵兵を混乱に陥れようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}elsif(int($ebp_k_exka_f[$ei] * rand($p_tiryoku{$ebp_id[$ei_k]})) > int($sougouno1 * 0.3) and $#kbl_senid > 2){
										$add = 0;
										$addc = "";
									foreach(@kbl_senid){
										if(!$add and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exka[$ei_k])) < int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exka[$_] * 0.1)){
											if($p_tiryoku{$kbp_id[$_]} > $add){
										$add = $p_tiryoku{$kbp_id[$_]};
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
										$adddmg = 0;
										$addc = "";
									foreach(@kbl_senid){
										if($ki_k ne $_ and $ki ne $_ and !$adddmg){
										$add ++;
										$adddmg = int($kbp_apadd[$_] - $kbp_acadd[$ei])*2;
										if($adddmg < 1){
										$adddmg = 0;
										}
										$adddmg += int(rand(3))+3;
											if($adddmg >= $p_heisisuu{$kbp_id[$ki]}){
										$adddmg = $p_heisisuu{$kbp_id[$ki]} -1;
											}
										$p_heisisuu{$kbp_id[$ki]} -=$adddmg;
										$ebp_ex_add[$ei_k] += $adddmg;
										$kbp_sub_dmg[$ki] += $adddmg;
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
										}
									}
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&K_E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei_k]}は敵陣に偽の情報を流し、<br />同士討ちさせることに成功しました！！<br />$addcの部隊が$p_name{$kbp_id[$ki]}の部隊に誤って攻撃を仕掛けた為、<br />$p_name{$kbp_id[$ki]}の部隊に$adddmgの追加ダメージ！！");
					}else{
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&KD_E1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$ebp_id[$ei_k]}は敵陣に偽の情報を流し、<br />同士討ちさせようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}else{
				}
			}elsif($md_eria eq "20"){
#拠点
				if(int($ebp_k_exdo_f[$ei] * rand($p_tiryoku{$ebp_id[$ei_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@kbl_senid){
										if(!$add and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exdo[$ei_k])) < int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exdo[$_] * 0.1)){
											if($p_tiryoku{$kbp_id[$_]} > $add){
										$add = $p_tiryoku{$kbp_id[$_]};
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei_k]}は敵陣に偽りの情報を流し、敵軍の司令系統を麻痺させました！！");
									foreach(@kbl_senid){
										if($ki eq $_ or (!$kbp_konranbou[$ki] and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exdo[$ei_k] * (50 + $p_kotobadakumi{$ebp_id[$ei_k]}*2))) > int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exdo[$_] * ($p_excalm{$kbp_id[$_]} * 2 + 50 + $kbp_konranbou[$ki]*30) * 0.1))){
										$kbp_clh2[$_] += 1;
$kbp_logf[$_]++;
$logfc.="<a id=\"lf-$kbp_id[$_]-$kbp_logf[$_]\"></a>";
			&KWBLOGBL("$p_name{$kbp_id[$_]}の部隊は大混乱に陥っています！！");
										}
									}
					}else{
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&KD_E1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$ebp_id[$ei_k]}は敵陣に偽りの情報を流し、<br />敵兵を混乱に陥れようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}elsif(int($ebp_k_exkin_f[$ei] * rand($p_tiryoku{$ebp_id[$ei_k]})) > int($sougouno1 * 0.3) and $#kbl_senid > 2){
										$add = 0;
										$addc = "";
									foreach(@kbl_senid){
										if(!$add and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exkin[$ei_k])) < int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exkin[$_] * 0.1)){
											if($p_tiryoku{$kbp_id[$_]} > $add){
										$add = $p_tiryoku{$kbp_id[$_]};
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
										$adddmg = 0;
										$addc = "";
									foreach(@kbl_senid){
										if($ki_k ne $_ and $ki ne $_ and !$adddmg){
										$add ++;
										$adddmg = int($kbp_apadd[$_] - $kbp_acadd[$ki])*2;
										if($adddmg < 1){
										$adddmg = 0;
										}
										$adddmg += int(rand(3))+3;
											if($adddmg >= $p_heisisuu{$kbp_id[$ki]}){
										$adddmg = $p_heisisuu{$kbp_id[$ki]} -1;
											}
										$p_heisisuu{$kbp_id[$ki]} -=$adddmg;
										$ebp_ex_add[$ei_k] += $adddmg;
										$kbp_sub_dmg[$ki] += $adddmg;
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
										}
									}
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&K_E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei_k]}は敵陣に偽の情報を流し、<br />同士討ちさせることに成功しました！！<br />$addcの部隊が$p_name{$kbp_id[$ki]}の部隊に誤って攻撃を仕掛けた為、<br />$p_name{$kbp_id[$ki]}の部隊に$adddmgの追加ダメージ！！");
					}else{
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&KD_E1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$ebp_id[$ei_k]}は敵陣に偽の情報を流し、<br />同士討ちさせようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}else{
				}
			}else{
#城
				if(int(rand($ebp_exmokin[$ei_k]+$p_tiryoku{$ebp_id[$ei_k]})) > int($sougouno1 * 0.3)){
										$add = 0;
										$addc = "";
									foreach(@kbl_senid){
										if(!$add and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exkin[$ei_k])) < int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exkin[$_] * 0.1)){
											if($p_tiryoku{$kbp_id[$_]} > $add){
										$add = $p_tiryoku{$kbp_id[$_]};
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
	&K_E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei_k]}は敵陣に偽りの情報を流し、敵軍の司令系統を麻痺させました！！");
									foreach(@kbl_senid){
										if($ki eq $_ or (!$kbp_konranbou[$ki] and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exkin[$ei_k] * (50 + $p_kotobadakumi{$ebp_id[$ei_k]}*2))) > int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exkin[$_] * ($p_excalm{$kbp_id[$_]} * 2 + 50 + $kbp_konranbou[$ki]*30) * 0.1))){
										$kbp_clh2[$_] += 1;
$kbp_logf[$_]++;
$logfc.="<a id=\"lf-$kbp_id[$_]-$kbp_logf[$_]\"></a>";
			&KWBLOGBL("$p_name{$kbp_id[$_]}の部隊は大混乱に陥っています！！");
										}
									}
					}else{
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&KD_E1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$ebp_id[$ei_k]}は敵陣に偽りの情報を流し、<br />敵兵を混乱に陥れようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}elsif(int($ebp_k_exsui_f[$ei] * rand($p_tiryoku{$ebp_id[$ei_k]})) > int($sougouno1 * 0.3) and $#kbl_senid > 2){
										$add = 0;
										$addc = "";
									foreach(@kbl_senid){
										if(!$add and int(rand($p_tiryoku{$ebp_id[$ei_k]} * $ebp_k_exsui[$ei_k])) < int($p_tiryoku{$kbp_id[$_]} * $kbp_k_exsui[$_] * 0.1)){
											if($p_tiryoku{$kbp_id[$_]} > $add){
										$add = $p_tiryoku{$kbp_id[$_]};
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
											}
										}
									}
					if(!$add){
										$adddmg = 0;
										$addc = "";
									foreach(@kbl_senid){
										if($ki_k ne $_ and $ki ne $_ and !$adddmg){
										$add ++;
										$adddmg = int($kbp_apadd[$_] - $kbp_acadd[$ei])*2;
										if($adddmg < 1){
										$adddmg = 0;
										}
										$adddmg += int(rand(3))+3;
											if($adddmg >= $p_heisisuu{$kbp_id[$ki]}){
										$adddmg = $p_heisisuu{$kbp_id[$ki]} -1;
											}
										$p_heisisuu{$kbp_id[$ki]} -=$adddmg;
										$ebp_ex_add[$ei_k] += $adddmg;
										$kbp_sub_dmg[$ki] += $adddmg;
										$addc = $p_name{$kbp_id[$_]};
										$addi = $_;
										}
									}
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&K_E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei_k]}は敵陣に偽の情報を流し、<br />同士討ちさせることに成功しました！！<br />$addcの部隊が$p_name{$kbp_id[$ki]}の部隊に誤って攻撃を仕掛けた為、<br />$p_name{$kbp_id[$ki]}の部隊に$adddmgの追加ダメージ！！");
					}else{
$kbp_logf[$addi]++;
$logfc.="<a id=\"lf-$kbp_id[$addi]-$kbp_logf[$addi]\"></a>";
	&KD_E1LOGBL("<span class=\"cFF0000\">【計略失敗】</span>$p_name{$ebp_id[$ei_k]}は敵陣に偽の情報を流し、<br />同士討ちさせようとしたものの<br />敵の知将 $addcに策を見抜かれてしまい、<br />計略は失敗に終わりました。。");
					}
				}else{
				}
			}
									}

##########################
	&BAG_LOG2("計略E\n");
		unless(($count < 2 and ($btwsyubifa_all or $ebp_btwsyubifa[$ei] or $p_heisisuu{$ebp_id[$ei]} > $p_heisisuu{$kbp_id[$ki]} * 10)) or $kbp_clh2[$ki] >= 2){

										$kbp_dmg[$ki] += int(rand($kbp_att[$ki] * 0.5) + ($kbp_att[$ki] * 0.25))+1;
										if($p_heisyu{$kbp_id[$ki]} eq "49" and !$battle_end and $kbp_clh[$ki] == 1 and !$kbp_f16v[$ki]){
						if($tuki_genzai > 9){
	$kbp_f16[$ki] = "2";
		&K1LOGBL("$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊は天に祈りをささげ、神獣：玄武を呼び寄せた！");
						}elsif($tuki_genzai > 6){
	$kbp_f16[$ki] = "1";
		&K1LOGBL("$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊は天に祈りをささげ、神獣：白虎を呼び寄せた！");
						}elsif($tuki_genzai > 3){
	$kbp_f16[$ki] = "4";
		&K1LOGBL("$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊は天に祈りをささげ、神獣：朱雀を呼び寄せた！");
						}elsif($tuki_genzai > 0){
	$kbp_f16[$ki] = "3";
		&K1LOGBL("$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊は天に祈りをささげ、神獣：青龍を呼び寄せた！");
						}
										}
							if($kbp_clh2[$ki] < 1){
								if($kbp_clh[$ki] == 0){$kbp_dmg[$ki]+= int(rand($kbp_att[$ki]))+1;
										$kbp_hcc[$ki]= "";
										if($kbp_hc[$ki] ne ""){$kbp_hcc[$ki]= "<br />";
										}
											&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$kbp_hc[$ki]$kbp_hcc[$ki]$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊はクリティカル攻撃を放った！！");

										if($kbp_ff[$ki] eq "5" and int(rand(2)) < 1 and $kbp_dmg[$ki] * 100 < $p_syoji_kome{$ebp_id[$ei]} and $ebp_att[$ei] > 4 and $ebp_clh2[$ei] < 1){$goudatu = $kbp_dmg[$ki] * 100;
$p_ex_karumalc{$kbp_id[$ki]} -= 1;
$p_ex_karumald{$kbp_id[$ki]} += 0;
										$p_syoji_kome{$kbp_id[$ki]} += $goudatu;$p_syoji_kome{$ebp_id[$ei]} -= $goudatu;
										$kbp_att[$ki] += 5;
				$kbp_heisenia[$ki] = int($kbp_heisenia[$ki] * 1.05 * 100)/100;
									$addc = "った";
									if($esikibou){
									}else{
									$addc = "り、士気が低下！！";
				$ebp_heisenia[$ei] = int($ebp_heisenia[$ei] * 0.95 * 100)/100;
									}
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊は<br />敵陣の兵糧庫に奇襲をかけ米$goudatuを奪い取った！！<br />$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊は混乱状態に陥$addc！！");
										$ebp_clh2[$ei] += 2;
							$p_ex_tiryoku{$kbp_id[$ki]}++;
										}
									if(($p_heisyu{$kbp_id[$ki]} eq "95" or $p_heisyu{$kbp_id[$ki]} eq "49") and int(rand(4)) < 1 and $ebp_clh2[$ei] < 1){
										if($p_heisyu{$ebp_id[$ei]} eq "12"){
											&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊は急いで体勢を立て直し、火を噴いて$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊の混乱攻撃を牽制する！！");
										}else{
										$ebp_clh2[$ei] += 2;
											&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊は混乱状態に陥った！！");
										}
									}
								}
							}


		}
										$kbp_add_clh2[$ki] = $kbp_clh2[$ki];
									if($kbp_clh2[$ki] > 0){
										$samonh = int(rand(200 - $p_excalm{$kbp_id[$ki]}));
										if($kbp_konranbou[$ki] > 1){
										$samonh = 0;
										}elsif($kbp_konranbou[$ki]){
										$samonh -= 100;
										}
										if($samonh < 30){
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の部隊は冷静さを取り戻し混乱状態から回復した！！");

										$kbp_clh2[$ki] = 0;
										}
										if($kbp_clh2[$ki] > 0){
										$ebp_dmg[$ei] += int($kbp_dmg[$ki]/3);$kbp_dmg[$ki]=0;
											&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊はピヨっていて身動きが取れない！！");
										$kbp_clh2[$ki] -= 1;
										}
									}elsif($p_busyou_hp{$kbp_id[$ki]} < 30 and !$kbp_konranbou[$ki] and !$kbp_clh2[$ki] and !int(rand(300 - $p_excalm{$kbp_id[$ki]} - $p_jiseisin{$kbp_id[$ki]})) ){
										$kbp_clh2[$ki] += 1;
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:指揮官が深手を負っている影響で、$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊は混乱に陥っています！！");
									}


										$ebp_add_clh2[$ei] = $ebp_clh2[$ei];

										if($ebp_ff[$ei] eq "100" and int(rand(15)) < 1){
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:城壁の兵士達は壁の上から岩を放り投げた！！<br />$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊に追加ダメージが発生！！");
										$ebp_dmg[$ei] += int(rand($p_heisisuu{$kbp_id[$ki]} * 0.3)+ ($p_heisisuu{$kbp_id[$ki]} * 0.2));
										}
										if($ebp_clh2[$ei] < 1){
										$ebp_dmg[$ei] += int(rand($ebp_att[$ei] * 0.5) + ($ebp_att[$ei] * 0.25))+1;
										if($ebp_clh[$ei] == 0){$ebp_dmg[$ei]+= int(rand($ebp_att[$ei]))+1;
										$ebp_hcc[$ei]= "";
										if($ebp_hc[$ei] ne ""){$ebp_hcc[$ei]= "<br />";
										}
											&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$ebp_hc[$ei]$ebp_hcc[$ei]$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊はクリティカル攻撃を放った！！");
										}
										}

									if($ebp_clh2[$ei] > 0){
										$samonh = int(rand(200 - $p_excalm{$ebp_id[$ei]}));
										if($ebp_konranbou[$ei] > 1){
										$samonh = 0;
										}elsif($ebp_konranbou[$ei]){
										$samonh -= 100;
										}
										if($samonh < 30){
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の部隊は冷静さを取り戻し混乱状態から回復した！！");

										$ebp_clh2[$ei] = 0;
										}
										if($ebp_clh2[$ei] > 0){
											if(!$kbp_add_clh2[$ki]){
										$kbp_dmg[$ki] += int($ebp_dmg[$ei]/3);$ebp_dmg[$ei]=0;
											}
											&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊はピヨっていて身動きが取れない！！");
										$ebp_clh2[$ei] -= 1;
										}
									}elsif($p_busyou_hp{$ebp_id[$ei]} < 30 and !$ebp_konranbou[$ei] and !$ebp_clh2[$ei] and !int(rand(300 - $p_excalm{$ebp_id[$ei]} - $p_jiseisin{$ebp_id[$ei]})) ){
										$ebp_clh2[$ei] += 1;
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:指揮官が深手を負っている影響で、$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊は混乱に陥っています！！");
									}

									if($kbp_doku[$ki]){
										$kbp_dokuw[$ki] = int(rand($kbp_doku[$ki] * $kbp_solm[$ki] * 0.03)) + $kbp_doku[$ki];
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の部隊は毒に侵されている。$kbp_dokuw[$ki]の追加ダメージを受けた！！");

										$ebp_dmg[$ei] += $kbp_dokuw[$ki];

										$kbp_dokuw2[$ki] = 30 -$kbp_doku[$ki];
										if(!int(rand($kbp_dokuw2[$ki]))){
										$kbp_doku[$ki] -= 1;
										&KWBLOGBL("<span class=\"c0000FF\">【毒性中和】</span>$p_name{$kbp_id[$ki]}の部隊に蔓延していた毒の効力が、少しばかり薄まってきた模様です。");
										}
									}

									if($ebp_doku[$ei]){
										$ebp_dokuw[$ei] = int(rand($ebp_doku[$ei] * $ebp_solm[$ei] * 0.03)) + $ebp_doku[$ei];
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の部隊は毒に侵されている。$ebp_dokuw[$ei]の追加ダメージを受けた！！");

										$kbp_dmg[$ki] += $ebp_dokuw[$ei];

										$ebp_dokuw2[$ki] = 30 -$ebp_doku[$ei];
										if($battle_end){
										$ebp_dokuw2[$ki] = int(rand(int($ebp_dokuw2[$ki]/6))+2);
										}
										if(!int(rand($ebp_dokuw2[$ki]))){
										$ebp_doku[$ei] -= 1;
										&EWBLOGBL("<span class=\"c0000FF\">【毒性中和】</span>$p_name{$ebp_id[$ei]}の部隊に蔓延していた毒の効力が、少しばかり薄まってきた模様です。");
										}
									}

									if(int(rand($kbp_hadoku[$ki])) eq "1"){
										$ebp_doku[$ei] ++;
										&EWBLOGBL("<span class=\"cDA70D6\">【被毒】</span>$p_name{$ebp_id[$ei]}の部隊は毒に侵された。。");
									}
									if(int(rand($ebp_hadoku[$ei])) eq "1"){
										$kbp_doku[$ki] ++;
										&KWBLOGBL("<span class=\"cDA70D6\">【被毒】</span>$p_name{$kbp_id[$ki]}の部隊は毒に侵された。。");
									}
									if($kbp_netu[$ki]){
										$kbp_dokuw[$ki] = int(rand($kbp_netu[$ki] * $kbp_solm[$ki] * 0.03)) + $kbp_netu[$ki];

										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の部隊は灼熱の炎に包まれている。<br />$kbp_dokuw[$ki]の追加ダメージを受けた！！");

										$ebp_dmg[$ei] += $kbp_dokuw[$ki];
									if(!int(rand(2)) and ($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "8" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "11" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "12" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "9" or $p_heisyu{$kbp_id[$ki]} eq "31")){
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊は炎に抵抗力が無い。取り巻く炎が更に強くなる！！");
										$kbp_netu[$ki] ++;
									}
									}
									if($ebp_netu[$ei]){
										$ebp_dokuw[$ei] = int(rand($ebp_netu[$ei] * $ebp_solm[$ei] * 0.03)) + $ebp_netu[$ei];

										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の部隊は灼熱の炎に包まれている。$ebp_dokuw[$ei]の追加ダメージを受けた！！");

										$kbp_dmg[$ki] += $ebp_dokuw[$ei];
									if(!int(rand(2)) and ($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "8" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "11" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "12" or $p_heisyu{$ebp_id[$ei]} eq "31")){
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊は炎に抵抗力が無い。取り巻く炎が更に強くなる！！");
										$ebp_netu[$ei] ++;
									}
									}
									if($kbp_tyakka[$ki] and !int(rand(5))){
									if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "8" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "11" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "12" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "9" or $battle_end){
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊は$p_name{$ebp_id[$ei]}の部隊に火を放った。<br />$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊は灼熱の炎に包まれた！！");
										$ebp_netu[$ei] ++;
									}
									}
									if($ebp_tyakka[$ei] and !int(rand(5))){
									if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "8" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "11" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "12" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "9" or $battle_end){
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊は$p_name{$kbp_id[$ki]}の部隊に火を放った。<br />$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊は灼熱の炎に包まれた！！");
										$kbp_netu[$ki] ++;
									}
									}
###############
						if(!$kbp_iku_hit[$ki]){

#####
								if($kbp_f16[$ki]){
									if($kbp_f16[$ki] eq "1" and $ebp_att[$ei] > 4){
										$samonh = int(rand(8));
										if($samonh < 2){
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の $p_pet_name{$kbp_id[$ki]}[0] は白銀の爪を携えて猛然と敵部隊に襲い掛かる！！<br />$p_name{$ebp_id[$ei]}の部隊に２の追加ダメージ！！");

										$kbp_dmg[$ki] += 2;
										}elsif($samonh < 3){
									$addc = "";
									if($ebp_sikibou[$ei]){
									}else{
										$ebp_att[$ei] -= 5;
				$ebp_heisenia[$ei] = int($ebp_heisenia[$ei] * 0.85 * 100)/100;
									$addc = "$p_name{$ebp_id[$ei]}の部隊の士気が低下！！";
									}
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の $p_pet_name{$kbp_id[$ki]}[0] は渾身の力を込め、天に向かって一吼えした！！<br />辺り一帯に雷鳴の如き咆哮が轟く！！$addc");

										}
									}
#####
									if($kbp_f16[$ki] eq "2"){
										$samonh = int(rand(12));
										if($samonh < 3){
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の$p_pet_name{$kbp_id[$ki]}[0]は自らの巨大な甲羅を盾にして主を守護する！！<br />$p_name{$kbp_id[$ki]}の部隊はダメージを食らわない！！");

										$ebp_dmg[$ei] = 0;
										}elsif($samonh < 4){
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の$p_pet_name{$kbp_id[$ki]}[0]は毒の吐息を吐いた！！<br />$p_name{$ebp_id[$ei]}の部隊は猛毒に侵された！！");
										$ebp_doku[$ei] ++;
										}
									}

									if($kbp_f16[$ki] eq "3" and $ebp_att[$ei] > 2 and $p_kunren{$ebp_id[$ei]} > 9){
										$samonh = int(rand(10));
										if($samonh < 1){
										$kbp_hcc[$ki]= "青龍";
										$srkami = int(rand($p_heisisuu{$ebp_id[$ei]})/2);
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の$p_pet_name{$kbp_id[$ki]}[0]は不吉な雨雲を呼び出して敵陣に雷を落とす！！<br />$p_name{$ebp_id[$ei]}の部隊に$srkamiの追加ダメージ！！");

										$kbp_dmg[$ki] += $srkami;
										}elsif($samonh < 2){
									$addc = "";
									if($ebp_sikibou[$ei]){
									}else{
										$ebp_att[$ei] -= 3;
				$ebp_heisenia[$ei] = int($ebp_heisenia[$ei] * 0.9 * 100)/100;
									$addc = "士気＆";
									}
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の$p_pet_name{$kbp_id[$ki]}[0]は天空を翔け抜け風を巻き起こし嵐を呼び寄せた！！<br />辺り一帯に黒い竜巻が吹き荒れる！！$p_name{$ebp_id[$ei]}の部隊の$addc訓練度が低下！！");

										$p_kunren{$ebp_id[$ei]} -= 10;
										}
									}
									if($kbp_f16[$ki] eq "4"){
										$samonh = int(rand(30));
										if($samonh < 4){
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の$p_pet_name{$kbp_id[$ki]}[0]は太陽のように光り輝き高温の風を巻き起こす！！<br />$p_name{$ebp_id[$ei]}の部隊は灼熱の炎に包まれた！！");
										$ebp_netu[$ei] ++;
										}elsif($samonh < 5){
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の$p_pet_name{$kbp_id[$ki]}[0]はゆったりと天を舞い転生の祈祷をささげた！！");
									$kbp_husi[$ki]=1;
										}
									}
								}
#####
									if($p_syomotu{$kbp_id[$ki]} eq "2011" and $battle_end < 1 and $kbp_samon[$ki] < 1){
										$samonh = int(rand(20));
										if($samonh < 7){
											$kbp_samon[$ki]=1;
										$kbp_hcc[$ki]= "";
										if($kbp_mg[$ki] ne ""){$kbp_hcc[$ki]= "<br />";
										}
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$kbp_mg[$ki]$kbp_hcc[$ki]$p_name{$kbp_id[$ki]}はネクロノミコンをさりげなく取り出し召喚魔法を唱え始めた！！<br />あたりに薄気味悪い瘴気が漂い始めると一筋の閃光と共にショゴスがあらわれた！！(　´_ゝ｀) ");
										}elsif($samonh < 8){
											$kbp_samon[$ki]=2;
										$kbp_hcc[$ki]= "";
										if($kbp_mg[$ki] ne ""){$kbp_hcc[$ki]= "<br />";
										}
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$kbp_mg[$ki]$kbp_hcc[$ki]$p_name{$kbp_id[$ki]}はネクロノミコンをさりげなく取り出し召喚魔法を唱え始めた！！<br />あたりに薄気味悪い瘴気が漂い始めると一筋の閃光と共にナイアラトテップがあらわれた！！(°∀°) ");
										}else{
										}
									}
#####
									if($p_heisyu{$kbp_id[$ki]} eq "46" and $kbp_samon[$ki] < 1){
										$samonh = int(rand(100));
										if($p_heisyu{$ebp_id[$ei]} eq "48"){
										$samonh = int(rand(30));
										}
										if($samonh < 1){
											$kbp_samon[$ki]=11;
										if($ki < 1){
											$kinukakuhen= 2;
										}
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:<span class=\"cDA70D6\">【神霊召喚】</span>南山の奥深くに眠りし五色の狗神よ・・瑤十八神将が僕、$p_name{$kbp_id[$ki]}の意に従いて、<br />我が敵$p_name{$ebp_id[$ei]}を共に打ち滅ぼさんことを！！ ・・来たれ「槃瓠」！！<br />黒い雲が天を覆い尽くし、雷鳴が辺り一帯に轟き荒ぶ。・・狗達に得体の知れない者がとり憑き制御不能になりました。");

										}
									}
#####
								if($kbp_samon[$ki]){
									if($kbp_samon[$ki] == 1){
										$samonh = int(rand(3));
										if($samonh < 2){
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の(　°∀°) ショゴスはさりげなく敵陣にもぐりこみ<br />カプリと敵兵士の足元に噛り付く！！<br />$p_name{$ebp_id[$ei]}の部隊に１の追加ダメージ！！");

										$kbp_dmg[$ki] += 1;

										}else{
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の(　´_ゝ｀) ショゴスは静かにあたりの様子を伺っている・・・");
										}
									}


									if($kbp_samon[$ki] == 2){
										$samonh = int(rand(5));
										if($samonh < 1){
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:虚無の虚空に漂いしナイアラトテップは不可思議な呪文を唱え始めた。");
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:ナイアラトテップの精神攻撃発動！！<br />$p_name{$ebp_id[$ei]}の周りを強烈な電磁波が包み込む！！");
										$ebp_att[$ei] = int(rand($ebp_att[$ei]));
				$ebp_heisenia[$ei] = int(rand($ebp_heisenia[$ei] * 1 * 100))/100;
									if($esikibou){
									}else{
										$ebp_att[$ei] = int(rand($ebp_att[$ei]));
				$ebp_heisenia[$ei] = int(rand($ebp_heisenia[$ei] * 1 * 100))/100;
									}
										}else{
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の(゜Д゜)ナイアラトテップは静かにあたりの様子を伺っている・・・");
										}
									}
									if($kbp_samon[$ki] == 11){
										$samonh = int(rand(7));
										if($samonh < 2){
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の狗達は五色の光に包まれ、稲妻の如き動きで敵兵に襲い掛かる！！");
										$kbp_dmg[$ki] += int((rand($kbp_att[$ki]+$ebp_att[$ei])+1) * 10);
										}else{
										$kbp_dmg[$ki] = 0;
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の狗達は地鳴りのような唸り声を上げ、じっとあたりの様子を伺っている・・・");
										}
									}
								}

#####
									if($p_syomotu{$kbp_id[$ki]} eq "2013"){
										$samonh = int(rand(5));
										if($samonh < 1){
										$kbp_hcc[$ki]= "";
										if($kbp_sk[$ki] ne ""){$kbp_hcc[$ki]= "<br />";
										}
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$kbp_sk[$ki]$kbp_hcc[$ki]$p_name{$kbp_id[$ki]}の部隊は五輪の書の効果で士気が上昇した！！");
										$kbp_att[$ki] += 3;
				$kbp_heisenia[$ki] = int($kbp_heisenia[$ki] * 1.05 * 100)/100;
										}
									}
									if($p_syomotu{$kbp_id[$ki]} eq "2008" and $ebp_dmg[$ei] > 19){
										$samonh = int(rand(4));
										if($samonh < 1){
										$kbp_hcc[$ki]= "";
										if($kbp_tr[$ki] ne ""){$kbp_hcc[$ki]= "<br />";
										}
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$kbp_tr[$ki]$kbp_hcc[$ki]$p_name{$kbp_id[$ki]}は青嚢書を使い兵士達を治療した！！ダメージを5％軽減した！！");

										$ebp_dmg[$ei] = int($ebp_dmg[$ei]*0.95);
										}
									}
									if($p_syomotu{$kbp_id[$ki]} eq "2006" and $ebp_att[$ei] > 4){
										$samonh = int(rand(10));
										if($samonh < 1){
										$kbp_hcc[$ki]= "";
										if($kbp_yj[$ki] ne ""){$kbp_hcc[$ki]= "<br />";
										}
									$addc = "";
									if($ebp_sikibou[$ei]){
									}else{
										$ebp_att[$ei] -= 5;
				$ebp_heisenia[$ei] = int($ebp_heisenia[$ei] * 0.85 * 100)/100;
									$addc = "$p_name{$ebp_id[$ei]}の士気が低下した！！";
									}
									$addc2 = "";
									if($p_syomotu{$kbp_id[$ki]} eq "2006"){
									$addc2 = "は太平要術の書を使い";
									}else{
									$addc2 = "の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]は";
									}
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$kbp_yj[$ki]$kbp_hcc[$ki]$p_name{$kbp_id[$ki]}$addc2[$ki]妖術を解き放った！！$addc");

										}
									}

									if($p_syomotu{$kbp_id[$ki]} eq "2007" and $p_kunren{$ebp_id[$ei]} > 24 and $battle_end < 1){
										$samonh = int(rand(10));
										if($samonh < 1){
										$kbp_hcc[$ki]= "";
										if($kbp_gj[$ki] ne ""){$kbp_hcc[$ki]= "<br />";
										}
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$kbp_gj[$ki]$kbp_hcc[$ki]$p_name{$kbp_id[$ki]}は遁甲天書を使い幻術を解き放った！！$p_name{$ebp_id[$ei]}の訓練度が低下した！！");
										$p_kunren{$ebp_id[$ei]} -= 25;
										}
									}
									if($kbp_senjt[$ki] and $ebp_dmg[$ei] > 9){
										$samonh = int(rand(3));
										if($samonh < 1){
										$kbp_hcc[$ki]= "";
										if($kbp_sj[$ki] ne ""){$kbp_hcc[$ki]= "<br />";
										}
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$kbp_sj[$ki]$kbp_hcc[$ki]$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]は仙術を使い兵士達を治療した！！ダメージを10％軽減した！！");

										$ebp_dmg[$ei] = int($ebp_dmg[$ei]*0.9);
										}
									}
									if($kbp_genjt[$ki] and $p_kunren{$ebp_id[$ei]} > 24 and $battle_end < 1){
										$samonh = int(rand(10));
										if($samonh < 1){
										$kbp_hcc[$ki]= "";
										if($kbp_gj[$ki] ne ""){$kbp_hcc[$ki]= "<br />";
										}
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$kbp_gj[$ki]$kbp_hcc[$ki]$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]は幻術を解き放った！！$p_name{$ebp_id[$ei]}の訓練度が低下した！！");
										$p_kunren{$ebp_id[$ei]} -= 25;
										}
									}

#####
									if($kbp_tankigake[$ki] and !$p_bjijyou_w{$kbp_id[$ki]}[1]){
										$samonh = int(rand(40 - $item_seinou{$p_norimono{$kbp_id[$ki]}}));
										if($samonh < 8){
										$add_i_hit = int(rand(3));
										$kbp_husyoukouw[$ki] = 80;
										$kbp_hcc[$ki]= "愛馬";
										if($kbp_sn1[$ki]){$kbp_hcc[$ki]= "$kbp_sn1[$ki]";
										}elsif($item_seinou{$p_norimono{$kbp_id[$ki]}} eq "107"){$kbp_hcc[$ki]= "$item_name{$p_norimono{$kbp_id[$ki]}}";
										}elsif($p_norimono{$kbp_id[$ki]} % 1000){$kbp_hcc[$ki]= "愛馬 $item_name{$p_norimono{$kbp_id[$ki]}}";
										}
										$dadd = int((rand($bpi_dmg{$kbp_id[$ki]}[$add_i_hit]) + int(10 * ($p_buryoku{$kbp_id[$ki]} + $kbp_sougou[$ki]) / ($p_buryoku{$ebp_id[$ei]} + $ebp_sougou[$ei]+1))) * $ebp_solm[$ei] * 0.002);
										$kbp_dmg[$ki] += $dadd;
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の単騎駆け！！<br />$bpi_name{$kbp_id[$ki]}[$add_i_hit]を構え、$kbp_hcc[$ki]と共に敵陣深く斬り込んでいく！！<br />$p_name{$ebp_id[$ei]}の部隊に$daddの追加ダメージ！！");

										}
									}
									if($kbp_husyoukou[$ki] and !$ebp_iku_hit[$ei] and !$ebp_husyoubou[$ei] and !$battle_end and !$p_bjijyou_w{$ebp_id[$ei]}[1] and !$p_bjijyou_w{$kbp_id[$ki]}[1]){
										$samonh = int(rand(100 - $kbp_husyoukouw[$ki])/$kbp_husyoukou[$ki]);
										if($samonh < 1){
										$dadd = $p_busyou_hp{$ebp_id[$ei]};
										$add_i_hit = int(rand(3));
										$kbp_strwd[$ki] += int(rand($bpi_dmg{$kbp_id[$ki]}[$add_i_hit]+10));
										$srkami = int((rand($bpi_dmg{$kbp_id[$ki]}[$add_i_hit]) + int(10 * ($p_buryoku{$kbp_id[$ki]} + $kbp_sougou[$ki]) / ($p_buryoku{$ebp_id[$ei]} + $ebp_sougou[$ei]+1)))* 0.9);
										$p_busyou_hp{$ebp_id[$ei]} -= $srkami;
										if($p_busyou_hp{$ebp_id[$ei]} < 1){
										$p_tairyoku{$ebp_id[$ei]} = int($p_tairyoku{$ebp_id[$ei]} * 0.7);
										$p_busyou_hp{$ebp_id[$ei]} = 0;
										$ebp_iku_hit[$ei] = 1;
	$img_op_add{$ebp_id[$ei]} = 4;
										&K1LOGBL("<span class=\"cDA70D6\">【不意打ち】</span>$p_name{$kbp_id[$ki]}は戦場にて$p_name{$ebp_id[$ei]}発見し、死角より攻撃を仕掛けた！！<br />敵陣奥深く、$bpi_name{$kbp_id[$ki]}[$add_i_hit]の刃が$p_name{$ebp_id[$ei]}に迫る！！$p_name{$ebp_id[$ei]}に$srkamiのダメージ（HP：$dadd⇒$p_busyou_hp{$ebp_id[$ei]}）<br />$p_name{$kbp_id[$ki]}は$p_name{$ebp_id[$ei]}を討ち取りました！！<br />突如指揮官を失った$p_name{$ebp_id[$ei]}の部隊は大混乱に陥っています！！");
	&M2AP_LOG("&nbsp;&nbsp;&nbsp;<span class=\"cDA70D6\">◆</span>【敵将撃破】$p_p_b_a{$kbp_id[$ki]}は戦場にて強引に$p_p_b_a{$ebp_id[$ei]}を討ち取りました！（使用武器:$bpi_name{$kbp_id[$ki]}[$add_i_hit]）<br />突如指揮官を失った$p_name{$ebp_id[$ei]}の部隊は大混乱に陥っています！！");
	$img_op_add{$kbp_id[$ki]} = 4;
										$ebp_clh2[$ei] += 2;
									$ttid = "blog/$ebp_id[$ei]";
									&PRLOG("\[$old_date\]$t_name{$ft_id}攻略戦・戦場にて$p_p_b_a{$kbp_id[$ki]}の攻撃を受け致命傷を負う。");
									$ttid = "blog/$kbp_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}防衛戦・戦場にて$p_p_b_a{$ebp_id[$ei]}を討ち取る。使用武器:$bpi_name{$kbp_id[$ki]}[$add_i_hit]");
										}else{
										&K1LOGBL("<span class=\"cDA70D6\">【不意打ち】</span>$p_name{$kbp_id[$ki]}は戦場にて$p_name{$ebp_id[$ei]}発見し、死角より攻撃を仕掛けた！！<br />敵陣奥深く、$bpi_name{$kbp_id[$ki]}[$add_i_hit]の刃が$p_name{$ebp_id[$ei]}に迫る！！$p_name{$ebp_id[$ei]}に$srkamiのダメージ（HP：$dadd⇒$p_busyou_hp{$ebp_id[$ei]}）");
										}

										}
									}
									if($ebp_onmyou1add[$ei] and $k_kokkyou{$p_kunino{$kbp_id[$ki]}} eq "11"){$ebp_onmyou1add[$ei] ++;
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}＜月夜に舞いし十二月将よ、<br />我が意に従いて彼の者$p_name{$ebp_id[$ei]}に冥府の裁きを与え給え。<br />来たれ$JYUUNIGETU[$ebp_onmyou1add[$ei]]！！");
										
	if($ebp_onmyou1add[$ei] == 11){$ebp_onmyou1add[$ei] =0;
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}＜開け異界の門！！<br />《 悪 》<br />《 鬼 》<br />《 封 》<br />《 滅 》");

		if(int(rand(2))){
		if(!$p_bjijyou_w{$ebp_id[$ei]}[1]){
		$p_bjijyou{$ebp_id[$ei]}[4]=1;
	&BIJYOU_READ("$ebp_id[$ei]");
		}
		$add = 2 + int(48 / ($kbp_onmyou1r[$ki]+1));
		$p_bjijyouc{$ebp_id[$ei]}[$p_hjijyou_no{$ebp_id[$ei]}[1]] = 1+int(rand($add));
$ebp_att[$ei] = int(rand($ebp_att[$ei]));
				$ebp_heisenia[$ei] = int(rand($ebp_heisenia[$ei] * 1 * 100))/100;
$ebp_shousin1[$ei] = 0;
	$img_op_add{$ebp_id[$ei]} = 8;
										$ebp_clh2[$ei] += 1;
										&WBLOGBL("Phase<span class=\"cFF0000\">$count</span>:異界より現われし蒼白の光が辺り一帯を包み込み、$p_name{$ebp_id[$ei]}は石化しました。。<br />突如指揮官を失った$p_name{$ebp_id[$ei]}の部隊は大混乱に陥っています！！");
	&M2AP_LOG("&nbsp;&nbsp;&nbsp;<span class=\"cDA70D6\">◆</span>【武将石化】異界より現われし蒼白の光が辺り一帯を包み込み、$p_name{$ebp_id[$ei]}の体は石化しました。。");
		}else{
			
		if(!$p_hjijyou_w{$ebp_id[$ei]}[1]){
		$p_hjijyou{$ebp_id[$ei]}[4]=1;
	&HIJYOU_READ("$ebp_id[$ei]");
		}
		$add = 2 + int(48 / ($kbp_onmyou1r[$ki]+1));
		$p_hjijyouc{$ebp_id[$ei]}[$p_hjijyou_no{$ebp_id[$ei]}[1]] = 1+int(rand($add));
	$img_op_add{$ebp_id[$ei]} = 4;
										&WBLOGBL("Phase<span class=\"cFF0000\">$count</span>:異界より現われし蒼白の光が辺り一帯を包み込み、$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊は石化しました。。");
	&M2AP_LOG("&nbsp;&nbsp;&nbsp;<span class=\"cDA70D6\">◆</span>【部隊石化】異界より現われし蒼白の光が辺り一帯を包み込み、$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊は石化しました。。");
		}
	}
									}
#金色の光が辺り一帯を包み込み
									if($k_kokkyou{$p_kunino{$kbp_id[$ki]}} eq "11" and !$ebp_onmyou1add[$ei] and !$p_bjijyou_w{$ebp_id[$ei]}[1] and !$p_hjijyou_w{$ebp_id[$ei]}[1]){
	if($k_kokkyou_keika_nen{$p_kunino{$kbp_id[$ki]}} > 10){
										$samonh = int(rand($kbp_onmyou1r[$ki]));
										if($samonh < 1){
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}＜急急如律令！！月夜に舞いし十二月将よ、<br />我が意に従いて彼の者$p_name{$ebp_id[$ei]}に冥府の裁きを与え給え。<br />来たれ$JYUUNIGETU[$ebp_onmyou1add[$ei]]！！");
										$ebp_onmyou1add[$ei] ++;
										}
	}
									}
#####
										if($kbp_ff[$ki] eq "6" and int(rand(15)) < 1){
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}は風向きを確かめつつ、仕掛けた罠に火を放った！！<br />$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊は灼熱の炎に包まれる！！");
										$ebp_netu[$ei] ++;
							$p_ex_tiryoku{$kbp_id[$ki]}++;
										}
									if($kbp_ff[$ki] eq "2" and $ebp_att[$ei] > 4 and int(rand(50)) < 1){
									$addc = "る";
									if($ebp_sikibou[$ei]){
									}else{
										$ebp_att[$ei] -= 5;
				$ebp_heisenia[$ei] = int($ebp_heisenia[$ei] * 0.85 * 100)/100;
									$addc = "り、兵士達はその場で凍りつき、震え慄く！！<br />$p_name{$ebp_id[$ei]}の部隊の士気が低下！！";
									}
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}は渾身の力を込め、敵兵に向かい一喝した！！<br />地も裂けんばかりの咆哮が辺り一帯に轟き渡$addc");

										$kbp_att[$ki] += 5;
				$kbp_heisenia[$ki] = int($kbp_heisenia[$ki] * 1.15 * 100)/100;
							$p_ex_buryoku{$kbp_id[$ki]}++;
									}
									if($kbp_ff[$ki] eq "3" and int(rand(10)) < 1 and $ebp_clh2[$ei] < 1){
										$ebp_clh2[$ei] += 2;
							$p_ex_tiryoku{$kbp_id[$ki]}++;
											&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}は$p_name{$ebp_id[$ei]}の部隊に対して偽の情報を流した！<br />$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊は混乱状態に陥った！！");
									}
#####
#####
#####
						}
###############
						if(!$ebp_iku_hit[$ei]){
#####
								if($ebp_f16[$ei]){
									if($ebp_f16[$ei] eq "1" and $kbp_att[$ki] > 4){
										$samonh = int(rand(8));
										if($samonh < 2){
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の $p_pet_name{$ebp_id[$ei]}[0] は白銀の爪を携えて猛然と敵部隊に襲い掛かる！！<br />$p_name{$kbp_id[$ki]}の部隊に２の追加ダメージ！！");

										$ebp_dmg[$ei] += 2;
										}elsif($samonh < 3){
									$addc = "";
									if($kbp_sikibou[$ki]){
									}else{
										$kbp_att[$ki] -= 5;
				$kbp_heisenia[$ki] = int($kbp_heisenia[$ki] * 0.85 * 100)/100;
									$addc = "$p_name{$kbp_id[$ki]}の部隊の士気が低下！！";
									}
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の $p_pet_name{$ebp_id[$ei]}[0] は渾身の力を込め、天に向かって一吼えした！！<br />辺り一帯に雷鳴の如き咆哮が轟く！！$addc");

										}
									}

#####

									if($ebp_f16[$ei] eq "2"){
										$samonh = int(rand(12));
										if($samonh < 3){
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の$p_pet_name{$ebp_id[$ei]}[0]は自らの巨大な甲羅を盾にして主を守護する！！<br />$p_name{$ebp_id[$ei]}の部隊はダメージを食らわない！！");

										$kbp_dmg[$ki] = 0;
										}elsif($samonh < 4){
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の$p_pet_name{$ebp_id[$ei]}[0]は毒の吐息を吐いた！！<br />$p_name{$kbp_id[$ki]}の部隊は猛毒に侵された！！");
										$kbp_doku[$ki] ++;
										}
									}
									if($ebp_f16[$ei] eq "3" and $kbp_att[$ki] > 2 and $p_kunren{$kbp_id[$ki]} > 9){
										$samonh = int(rand(10));
										if($samonh < 1){
										$srkami = int(rand($p_heisisuu{$kbp_id[$ki]})/2);
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の$p_pet_name{$ebp_id[$ei]}[0]は不吉な雨雲を呼び出して敵陣に雷を落とす！！<br />$p_name{$kbp_id[$ki]}の部隊に$srkamiの追加ダメージ！！");

										$ebp_dmg[$ei] += $srkami;
										}elsif($samonh < 2){
									$addc = "";
									if($kbp_sikibou[$ki]){
									}else{
										$kbp_att[$ki] -= 3;
				$kbp_heisenia[$ki] = int($kbp_heisenia[$ki] * 0.9 * 100)/100;
									$addc = "士気＆";
									}
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の$p_pet_name{$ebp_id[$ei]}[0]は天空を翔け抜け風を巻き起こし嵐を呼び寄せた！！<br />辺り一帯に黒い竜巻が吹き荒れる！！$p_name{$kbp_id[$ki]}の部隊の$addc訓練度が低下！！");

										$p_kunren{$kbp_id[$ki]} -= 10;
										}
									}
									if($ebp_f16[$ei] eq "4"){
										$samonh = int(rand(30));
										if($samonh < 4){
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の$p_pet_name{$ebp_id[$ei]}[0]は太陽のように光り輝き高温の風を巻き起こす！！<br />$p_name{$kbp_id[$ki]}の部隊は灼熱の炎に包まれた！！");
										$kbp_netu[$ki] ++;
										}elsif($samonh < 5){
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の$p_pet_name{$ebp_id[$ei]}[0]はゆったりと天を舞い転生の祈祷をささげた！！");
									$ebp_husi[$ei]=1;
										}
									}
								}
#####
									if($p_syomotu{$ebp_id[$ei]} eq "2011" and $ebp_samon[$ei] < 1){
										$samonh = int(rand(20));
										if($samonh < 7){
											$ebp_samon[$ei]=1;
										$ebp_hcc[$ei]= "";
										if($ebp_mg[$ei] ne ""){$ebp_hcc[$ei]= "<br />";
										}
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$ebp_mg[$ei]$ebp_hcc[$ei]$p_name{$ebp_id[$ei]}はネクロノミコンをさりげなく取り出し召喚魔法を唱え始めた！！<br />あたりに薄気味悪い瘴気が漂い始めると一筋の閃光と共にショゴスがあらわれた！！(　´_ゝ｀) ");
										}elsif($samonh < 8){
											$ebp_samon[$ei]=2;
										$ebp_hcc[$ei]= "";
										if($ebp_mg[$ei] ne ""){$ebp_hcc[$ei]= "<br />";
										}
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$ebp_mg[$ei]$ebp_hcc[$ei]$p_name{$ebp_id[$ei]}はネクロノミコンをさりげなく取り出し召喚魔法を唱え始めた！！<br />あたりに薄気味悪い瘴気が漂い始めると一筋の閃光と共にナイアラトテップがあらわれた！！(°∀°) ");
										}else{
										}
									}
#####
									if($p_heisyu{$ebp_id[$ei]} eq "46" and $ebp_samon[$ei] < 1){
										$samonh = int(rand(100));
										if($p_heisyu{$kbp_id[$ki]} eq "48"){
										$samonh = int(rand(30));
										}
										if($samonh < 1){
											$ebp_samon[$ei]=11;
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:<span class=\"cDA70D6\">【神霊召喚】</span>南山の奥深くに眠りし五色の狗神よ・・瑤十八神将が僕、$p_name{$ebp_id[$ei]}の意に従いて、<br />我が敵$p_name{$kbp_id[$ki]}を共に打ち滅ぼさんことを！！ ・・来たれ「槃瓠」！！<br />黒い雲が天を覆い尽くし、雷鳴が辺り一帯に轟き荒ぶ。・・狗達に得体の知れない者がとり憑き制御不能になりました。");

										}
									}
#####
								if($ebp_samon[$ei]){
									if($ebp_samon[$ei] == 1){
										$samonh = int(rand(3));
										if($samonh < 2){
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の(　°∀°) ショゴスはさりげなく敵陣にもぐりこみ<br />カプリと敵兵士の足元に噛り付く！！<br />$p_name{$kbp_id[$ki]}の部隊に１の追加ダメージ！！");

										$ebp_dmg[$ei] += 1;

										}else{
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の(　´_ゝ｀) ショゴスは静かにあたりの様子を伺っている・・・");
										}
									}


									if($ebp_samon[$ei] == 2){
										$samonh = int(rand(5));
										if($samonh < 1){
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:虚無の虚空に漂いしナイアラトテップは不可思議な呪文を唱え始めた。");
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:ナイアラトテップの精神攻撃発動！！<br />$p_name{$kbp_id[$ki]}の周りを強烈な電磁波が包み込む！！");
										$kbp_att[$ki] = int(rand($kbp_att[$ki]));
				$kbp_heisenia[$ki] = int(rand($kbp_heisenia[$ki] * 1 * 100))/100;
									if($ksikibou){
									}else{
										$kbp_att[$ki] = int(rand($kbp_att[$ki]));
				$kbp_heisenia[$ki] = int(rand($kbp_heisenia[$ki] * 1 * 100))/100;
									}
										}else{
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の(゜Д゜)ナイアラトテップは静かにあたりの様子を伺っている・・・");
										}
									}
									if($ebp_samon[$ei] == 11){
										$samonh = int(rand(7));
										if($samonh < 2){
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の狗達は五色の光に包まれ、稲妻の如き動きで敵兵に襲い掛かる！！");
										$ebp_dmg[$ei] += int((rand($kbp_att[$ki]+$ebp_att[$ei])+1) * 10);
										}else{
										$ebp_dmg[$ei] = 0;
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の狗達は地鳴りのような唸り声を上げ、じっとあたりの様子を伺っている・・・");
										}
									}
								}
#####
									if($p_syomotu{$ebp_id[$ei]} eq "2013"){
										$samonh = int(rand(5));
										if($samonh < 1){
										$ebp_hcc[$ei]= "";
										if($ebp_sk[$ei] ne ""){$ebp_hcc[$ei]= "<br />";
										}
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$ebp_sk[$ei]$ebp_hcc[$ei]$p_name{$ebp_id[$ei]}の部隊は五輪の書の効果で士気が上昇した！！");
										$ebp_att[$ei] += 3;
				$ebp_heisenia[$ei] = int($ebp_heisenia[$ei] * 1.05 * 100)/100;
										}
									}

									if($p_syomotu{$ebp_id[$ei]} eq "2008" and $kbp_dmg[$ki] > 19){
										$samonh = int(rand(4));
										if($samonh < 1){
										$ebp_hcc[$ei]= "";
										if($ebp_tr[$ei] ne ""){$ebp_hcc[$ei]= "<br />";
										}
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$ebp_tr[$ei]$ebp_hcc[$ei]$p_name{$ebp_id[$ei]}は青嚢書を使い兵士達を治療した！！ダメージを5％軽減した！！");

										$kbp_dmg[$ki] = int($kbp_dmg[$ki]*0.95);
										}
									}

									if($p_syomotu{$ebp_id[$ei]} eq "2006" and $kbp_att[$ki] > 4){
										$samonh = int(rand(10));
										if($samonh < 1){
										$ebp_hcc[$ei]= "";
										if($ebp_yj[$ei] ne ""){$ebp_hcc[$ei]= "<br />";
										}
									$addc = "";
									if($kbp_sikibou[$ki]){
									}else{
										$kbp_att[$ki] -= 5;
				$kbp_heisenia[$ki] = int($kbp_heisenia[$ki] * 0.85 * 100)/100;
									$addc = "$p_name{$kbp_id[$ki]}の士気が低下した！！";
									}
									$addc2 = "";
									if($p_syomotu{$ebp_id[$ei]} eq "2006"){
									$addc2 = "は太平要術の書を使い";
									}else{
									$addc2 = "の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]は";
									}
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$ebp_yj[$ei]$ebp_hcc[$ei]$p_name{$ebp_id[$ei]}$addc2妖術を解き放った！！$addc");

										}
									}
									if($p_syomotu{$ebp_id[$ei]} eq "2007" and $p_kunren{$kbp_id[$ki]} > 24){
										$samonh = int(rand(10));
										if($samonh < 1){
										$ebp_hcc[$ei]= "";
										if($ebp_gj[$ei] ne ""){$ebp_hcc[$ei]= "<br />";
										}
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$ebp_gj[$ei]$ebp_hcc[$ei]$p_name{$ebp_id[$ei]}は遁甲天書を使い幻術を解き放った！！$p_name{$kbp_id[$ki]}の訓練度が低下した！！");
										$p_kunren{$kbp_id[$ki]} -= 25;
										}
									}


									if($ebp_senjt[$ei] and $kbp_dmg[$ki] > 9){
										$samonh = int(rand(3));
										if($samonh < 1){
										$ebp_hcc[$ei]= "";
										if($ebp_sj[$ei] ne ""){$ebp_hcc[$ei]= "<br />";
										}
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$ebp_sj[$ei]$ebp_hcc[$ei]$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]は仙術を使い兵士達を治療した！！ダメージを10％軽減した！！");

										$kbp_dmg[$ki] = int($kbp_dmg[$ki]*0.9);
										}
									}
									if($ebp_genjt[$ei] and $p_kunren{$kbp_id[$ki]} > 24 and $battle_end < 1){
										$samonh = int(rand(10));
										if($samonh < 1){
										$ebp_hcc[$ei]= "";
										if($ebp_gj[$ei] ne ""){$ebp_hcc[$ei]= "<br />";
										}
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$ebp_gj[$ei]$ebp_hcc[$ei]$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]は幻術を解き放った！！$p_name{$kbp_id[$ki]}の訓練度が低下した！！");
										$p_kunren{$kbp_id[$ki]} -= 25;
										}
									}
#####
									if($ebp_tankigake[$ei] and !$p_bjijyou_w{$ebp_id[$ei]}[1]){
										$samonh = int(rand(40 - $item_seinou{$p_norimono{$ebp_id[$ei]}}));
										if($samonh < 8){
										$add_i_hit = int(rand(3));
										$ebp_strwd[$ei] += int(rand($bpi_dmg{$ebp_id[$ei]}[$add_i_hit]+10));
										$ebp_husyoukouw[$ei] = 80;
										$ebp_hcc[$ei]= "愛馬";
										if($ebp_sn1[$ei]){$ebp_hcc[$ei]= "$ebp_sn1[$ei]";
										}elsif($p_norimono{$ebp_id[$ei]} eq "107"){$ebp_hcc[$ei]= "$item_name{$p_norimono{$ebp_id[$ei]}}";
										}elsif($p_norimono{$ebp_id[$ei]} % 1000){$ebp_hcc[$ei]= "愛馬 $item_name{$p_norimono{$ebp_id[$ei]}}";
										}
										$dadd = int((rand($bpi_dmg{$ebp_id[$ei]}[$add_i_hit]) + int(10 * ($p_buryoku{$ebp_id[$ei]} + $ebp_sougou[$ei]) / ($p_buryoku{$kbp_id[$ki]} + $kbp_sougou[$ki]+1))) * $kbp_solm[$ki] * 0.002);
										$ebp_dmg[$ei] += $dadd;
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の単騎駆け！！<br />$bpi_name{$ebp_id[$ei]}[$add_i_hit]を構え、$ebp_hcc[$ei]と共に敵陣深く斬り込んでいく！！<br />$p_name{$kbp_id[$ki]}の部隊に$daddの追加ダメージ！！");

										}
									}

									if($ebp_husyoukou[$ei] and !$kbp_iku_hit[$ki] and !$kbp_husyoubou[$ki] and !$battle_end and !$p_bjijyou_w{$kbp_id[$ki]}[1] and !$p_bjijyou_w{$ebp_id[$ei]}[1]){
										$samonh = int(rand(100 - $ebp_husyoukouw[$ei])/$ebp_husyoukou[$ei]);
										if($samonh < 1){
										$dadd = $p_busyou_hp{$kbp_id[$ki]};
										$add_i_hit = int(rand(3));
										$ebp_strwd[$ei] += int(rand($bpi_dmg{$ebp_id[$ei]}[$add_i_hit]+10));
										$srkami = int((rand($bpi_dmg{$ebp_id[$ei]}[$add_i_hit]) + int(10 * ($p_buryoku{$ebp_id[$ei]} + $ebp_sougou[$ei]) / ($p_buryoku{$kbp_id[$ki]} + $kbp_sougou[$ki]+1)))* 0.9);
										$p_busyou_hp{$kbp_id[$ki]} -= $srkami;
										if($p_busyou_hp{$kbp_id[$ki]} < 1){
										$p_tairyoku{$kbp_id[$ki]} = int($p_tairyoku{$kbp_id[$ki]} * 0.7);
										$p_busyou_hp{$kbp_id[$ki]} = 0;
										$kbp_iku_hit[$ki] = 1;
										&E1LOGBL("<span class=\"cDA70D6\">【不意打ち】</span>$p_name{$ebp_id[$ei]}は戦場にて$p_name{$kbp_id[$ki]}発見し、死角より攻撃を仕掛けた！！<br />敵陣奥深く、$bpi_name{$ebp_id[$ei]}[$add_i_hit]の刃が$p_name{$kbp_id[$ki]}に迫る！！$p_name{$kbp_id[$ki]}に$srkamiのダメージ（HP：$dadd⇒$p_busyou_hp{$kbp_id[$ki]}）<br />$p_name{$ebp_id[$ei]}は$p_name{$kbp_id[$ki]}を討ち取りました！！<br />突如指揮官を失った$p_name{$kbp_id[$ki]}の部隊は大混乱に陥っています！！");
	&M2AP_LOG("&nbsp;&nbsp;&nbsp;<span class=\"cDA70D6\">◆</span>【敵将撃破】$p_p_b_a{$ebp_id[$ei]}は戦場にて強引に$p_p_b_a{$kbp_id[$ki]}を討ち取りました！（使用武器:$bpi_name{$ebp_id[$ei]}[$add_i_hit]）<br />突如指揮官を失った$p_name{$kbp_id[$ki]}の部隊は大混乱に陥っています！！");
										$kbp_clh2[$ki] += 2;
									$ttid = "blog/$kbp_id[$ki]";
									&PRLOG("\[$old_date\]$t_name{$ft_id}防衛戦・戦場にて$p_p_b_a{$ebp_id[$ei]}の攻撃を受け致命傷を負う。");
									$ttid = "blog/$ebp_id[$ei]";
									&PRLOG("\[$old_date\]$t_name{$ft_id}攻略戦・戦場にて$p_p_b_a{$kbp_id[$ki]}を討ち取る。使用武器:$bpi_name{$ebp_id[$ei]}[$add_i_hit]");
										}else{
										&E1LOGBL("<span class=\"cDA70D6\">【不意打ち】</span>$p_name{$ebp_id[$ei]}は戦場にて$p_name{$kbp_id[$ki]}発見し、死角より攻撃を仕掛けた！！<br />敵陣奥深く、$bpi_name{$ebp_id[$ei]}[$add_i_hit]の刃が$p_name{$kbp_id[$ki]}に迫る！！$p_name{$kbp_id[$ki]}に$srkamiのダメージ（HP：$dadd⇒$p_busyou_hp{$kbp_id[$ki]}）");
										}

										}
									}
									if($kbp_onmyou1add[$ki] and $k_kokkyou{$p_kunino{$ebp_id[$ei]}} eq "11"){$kbp_onmyou1add[$ki] ++;
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}＜月夜に舞いし十二月将よ、<br />我が意に従いて彼の者$p_name{$kbp_id[$ki]}に冥府の裁きを与え給え。<br />来たれ$JYUUNIGETU[$kbp_onmyou1add[$ki]]！！");
									
	if($kbp_onmyou1add[$ki] == 11){$kbp_onmyou1add[$ki] =0;
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}＜開け異界の門！！<br />《 悪 》<br />《 鬼 》<br />《 封 》<br />《 滅 》");

		if(int(rand(2))){
		if(!$p_bjijyou_w{$kbp_id[$ki]}[1]){
		$p_bjijyou{$kbp_id[$ki]}[4]=1;
	&BIJYOU_READ("$kbp_id[$ki]");
		}
		$add = 2 + int(48 / ($ebp_onmyou1r[$ei]+1));
		$p_bjijyouc{$kbp_id[$ki]}[$p_bjijyou_no{$kbp_id[$ki]}[1]] = 1+int(rand($add));
$kbp_att[$ki] = int(rand($kbp_att[$ki]));
				$kbp_heisenia[$ki] = int(rand($kbp_heisenia[$ki] * 1 * 100))/100;
$kbp_shousin1[$ki] = 0;
	$img_op_add{$kbp_id[$ki]} = 8;
										$kbp_clh2[$ki] += 1;
										&WBLOGBL("Phase<span class=\"cFF0000\">$count</span>:異界より現われし蒼白の光が辺り一帯を包み込み、$p_name{$kbp_id[$ki]}は石化しました。。<br />突如指揮官を失った$p_name{$kbp_id[$ki]}の部隊は大混乱に陥っています！！");
	&M2AP_LOG("&nbsp;&nbsp;&nbsp;<span class=\"cDA70D6\">◆</span>【武将石化】異界より現われし蒼白の光が辺り一帯を包み込み、$p_name{$kbp_id[$ki]}の体は石化しました。。");
		}else{
		if(!$p_hjijyou_w{$kbp_id[$ki]}[1]){
		$p_hjijyou{$kbp_id[$ki]}[4]=1;
	&HIJYOU_READ("$kbp_id[$ki]");
		}
		$add = 2 + int(48 / ($ebp_onmyou1r[$ei]+1));
		$p_hjijyouc{$kbp_id[$ki]}[$p_hjijyou_no{$kbp_id[$ki]}[1]] = 1+int(rand($add));
	$img_op_add{$kbp_id[$ki]} = 4;
										&WBLOGBL("Phase<span class=\"cFF0000\">$count</span>:異界より現われし蒼白の光が辺り一帯を包み込み、$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊は石化しました。。");
	&M2AP_LOG("&nbsp;&nbsp;&nbsp;<span class=\"cDA70D6\">◆</span>【部隊石化】異界より現われし蒼白の光が辺り一帯を包み込み、$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊は石化しました。。");
		}
	}
									}
									if($k_kokkyou{$p_kunino{$ebp_id[$ei]}} eq "11" and !$kbp_onmyou1add[$ki] and !$p_bjijyou_w{$kbp_id[$ki]}[1] and !$p_hjijyou_w{$kbp_id[$ki]}[1]){
	if($k_kokkyou_keika_nen{$p_kunino{$ebp_id[$ei]}} > 10){
										$samonh = int(rand($ebp_onmyou1r[$ei]));
										if($samonh < 1){
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}＜急急如律令！！月夜に舞いし十二月将よ、<br />我が意に従いて彼の者$p_name{$kbp_id[$ki]}に冥府の裁きを与え給え。<br />来たれ$JYUUNIGETU[$kbp_onmyou1add[$ki]]！！");
										$kbp_onmyou1add[$ki] ++;
										}
	}
									}
#####

										if($ebp_ff[$ei] eq "6" and int(rand(15)) < 1){
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}は風向きを確かめつつ、仕掛けた罠に火を放った！！<br />$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊は灼熱の炎に包まれる！！");
										$kbp_netu[$ki] ++;
							$p_ex_tousotu{$ebp_id[$ei]}++;
										}
									if($ebp_ff[$ei] eq "2" and $kbp_att[$ki] > 4 and int(rand(50)) < 1){
									$addc = "る";
									if($kbp_sikibou[$ki]){
									}else{
										$kbp_att[$ki] -= 5;
				$kbp_heisenia[$ki] = int($kbp_heisenia[$ki] * 0.85 * 100)/100;
									$addc = "り、兵士達はその場で凍りつき、震え慄く！！<br />$p_name{$kbp_id[$ki]}の部隊の士気が低下！！";
									}
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}は渾身の力を込め、敵兵に向かい一喝した！！<br />地も裂けんばかりの咆哮が辺り一帯に轟き渡$addc");

										$ebp_att[$ei] += 5;
				$ebp_heisenia[$ei] = int($ebp_heisenia[$ei] * 1.15 * 100)/100;
							$p_ex_buryoku{$ebp_id[$ei]}++;
									}
#####
#####
#####
						}

###############


									if($kbp_heisin[$ki]){
										$samonh = int(rand(7));
										if($samonh < 1){
										$kbp_hcc[$ki]= "";
										if($kbp_sk[$ki] ne ""){$kbp_hcc[$ki]= "<br />";
										}
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$kbp_sk[$ki]$kbp_hcc[$ki]$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊は$kbp_heisin_c[$ki]士気が上昇した！！");
										$kbp_att[$ki] += $kbp_heisin[$ki];
										$add= ($kbp_heisin[$ki]*0.03) + 1;
				$kbp_heisenia[$ki] = int($kbp_heisenia[$ki] * $add * 100)/100;
										}
									}

									if($ebp_heisin[$ei]){
										$samonh = int(rand(7));
										if($samonh < 1){
										$ebp_hcc[$ei]= "";
										if($ebp_sk[$ei] ne ""){$ebp_hcc[$ei]= "<br />";
										}
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$ebp_sk[$ei]$ebp_hcc[$ei]$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊は$kbp_heisin_c[$ki]士気が上昇した！！");
										$ebp_att[$ei] += $ebp_heisin[$ei];
										$add= ($ebp_heisin[$ei]*0.03) + 1;
				$ebp_heisenia[$ei] = int($ebp_heisenia[$ei] * $add * 100)/100;
										}
									}


									if($kbp_youjt[$ki] and $p_heisyu{$ebp_id[$ei]} ne "12" and $ebp_att[$ei] > 4 and $battle_end < 1){
										$samonh = int(rand(10));
										if($samonh < 1){
									$addc = "";
									if($ebp_sikibou[$ei]){
									}else{
										$ebp_att[$ei] -= 5;
				$ebp_heisenia[$ei] = int($ebp_heisenia[$ei] * 0.85 * 100)/100;
									$addc = "$p_name{$ebp_id[$ei]}の士気が低下した！！";
									}
									$addc2 = "";
									if($p_syomotu{$kbp_id[$ki]} eq "2006"){
									$addc2 = "は太平要術の書を使い";
									}else{
									$addc2 = "の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]は";
									}
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}$addc2[$ki]妖術を解き放った！！$addc");

										}
									}

									if($ebp_youjt[$ei] and $p_heisyu{$kbp_id[$ki]} ne "12" and $kbp_att[$ki] > 4){
										$samonh = int(rand(10));
										if($samonh < 1){
									$addc = "";
									if($kbp_sikibou[$ki]){
									}else{
										$kbp_att[$ki] -= 5;
				$kbp_heisenia[$ki] = int($kbp_heisenia[$ki] * 0.85 * 100)/100;
									$addc = "$p_name{$kbp_id[$ki]}の士気が低下した！！";
									}
									$addc2 = "";
									if($p_syomotu{$ebp_id[$ei]} eq "2006"){
									$addc2 = "は太平要術の書を使い";
									}else{
									$addc2 = "の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]は";
									}
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}$addc2妖術を解き放った！！$addc");

										}
									}


									if($kbp_sisihunjin[$ki] and $count > 2 and ($kbp_solm[$ki] * 0.1 > $p_heisisuu{$kbp_id[$ki]} or $kbp_solmax[$ki] * 0.05 > $p_heisisuu{$kbp_id[$ki]})){
										$samonh = int(rand(1));
										if($samonh < 1){
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:追い詰められた$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊は<br />背水の陣を敷き、獅子奮迅の勢いで敵軍に襲い掛かる！！");

										$kbp_dmg[$ki] += int(rand($kbp_dmg[$ki]));
										$ebp_dmg[$ei] = int(rand($ebp_dmg[$ei]));
										}
									}

									if($ebp_sisihunjin[$ei] and $count > 2 and ($ebp_solm[$ei] * 0.1 > $p_heisisuu{$ebp_id[$ei]} or $ebp_solmax[$ei] * 0.05 > $p_heisisuu{$ebp_id[$ei]})){
										$samonh = int(rand(1));
										if($samonh < 1){
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:追い詰められた$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊は<br />背水の陣を敷き、獅子奮迅の勢いで敵軍に襲い掛かる！！");

										$kbp_dmg[$ki] = int(rand($kbp_dmg[$ki]));
										$ebp_dmg[$ei] += int(rand($ebp_dmg[$ei]));
										}
									}

									if($p_heisyu{$kbp_id[$ki]} eq "93" and $battle_end < 1){
										$kbp_yuuhk[$ki] = int(rand(4));
							if($p_heisisuu{$kbp_id[$ki]} > int($kbp_solmax[$ki] / 3)){
								$kbp_yuuhk[$ki]++;
							}
										if($kbp_yuuhk[$ki] < 1){
$p_ex_karumalc{$kbp_id[$ki]} += 0;
$p_ex_karumald{$kbp_id[$ki]} -= 2;
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]は敵兵士の首筋をひと噛みした！！");
										}
										}

									if($p_heisyu{$ebp_id[$ei]} eq "93"){
										$kbp_yuuhe[$ki] = int(rand(4));
							if($p_heisisuu{$ebp_id[$ei]} > int($ebp_solmax[$ei] / 3)){
								$kbp_yuuhe[$ki]++;
							}
										if($kbp_yuuhe[$ki] < 1){
$p_ex_karumalc{$kbp_id[$ki]} += 0;
$p_ex_karumald{$kbp_id[$ki]} -= 2;
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]は敵兵士の首筋をひと噛みした！！");
										}
										}






									if($p_heisyu{$kbp_id[$ki]} eq "82"){
										$samonh = int(rand(4));
										if($samonh < 1){
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊は士気が上昇した！！<table><pre>
　　　   　∩ 
　　(　ﾟ∀ﾟ)彡　中黄太乙！中黄太乙！ 
　　 　 ⊂彡</pre></table>");
										$kbp_att[$ki] += 4;
				$kbp_heisenia[$ki] = int($kbp_heisenia[$ki] * 1.12 * 100)/100;
										}
									}

									if($p_heisyu{$ebp_id[$ei]} eq "82"){
										$samonh = int(rand(4));
										if($samonh < 1){
										&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊は士気が上昇した！！<table><pre>
　　　   　∩ 
　　(　ﾟ∀ﾟ)彡　中黄太乙！中黄太乙！ 
　　 　 ⊂彡</pre></table>");
										$ebp_att[$ei] += 4;
				$ebp_heisenia[$ei] = int($ebp_heisenia[$ei] * 1.12 * 100)/100;
										}
									}
 										$p_heisisuu{$ebp_id[$ei]} -= $kbp_dmg[$ki];
										$kbp_ex_add[$ki] += ($ebp_wsol[$ei] - $p_heisisuu{$ebp_id[$ei]});


 										$kbp_add_kyuuketu[$ki] = $kbp_dmg[$ki];
 										$ebp_add_kyuuketu[$ei] = $ebp_dmg[$ei];
										if($p_heisisuu{$ebp_id[$ei]} <= 0){
											if($ebp_husi[$ei] == 1){
										$p_heisisuu{$ebp_id[$ei]} += int($ebp_solh[$ei] * 0.8);
 										$kbp_dmg[$ki] -= int($ebp_solh[$ei] * 0.8);
										$ebp_husi[$ei] = 0;
										$ebp_solh[$ei] = $p_heisisuu{$ebp_id[$ei]};
											&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:転生の炎発動！！$p_name{$ebp_id[$ei]}の部隊は地獄の果てから蘇った！！");
											}elsif($p_heisyu{$ebp_id[$ei]} eq "94" and !int(rand(9))){
										$samonh = int(rand(70))+30;
										$p_heisisuu{$ebp_id[$ei]} = int($p_heisisuu{$kbp_id[$ki]} * $samonh / 100);
										$p_heisisuu{$kbp_id[$ki]} = int($p_heisisuu{$kbp_id[$ki]} * (100-$samonh) / 100);
											&E1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]は$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]に憑依した！！（$samonh％）");
											}
										}
										if($p_heisisuu{$ebp_id[$ei]} < 1 or $p_hjijyou_w{$ebp_id[$ei]}[1]){
										if($p_heisisuu{$ebp_id[$ei]} < 1){
											$p_heisisuu{$ebp_id[$ei]}=0;
										}
										$ebp_dmg[$ei] = 0;
		if($p_hjijyou_w{$ebp_id[$ei]}[1]){
										&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊は石像と化しています。。");
		}
											&STLOGBL("");

										$ebp_h_ko[$ei]=1;
										$ebp_b_ko[$ei]=1;
							@newbl_senid=();
							@newbl_senidds=();
							@newbl_senidts=();
									foreach(@ebl_senid){
										if($_ ne $ei and $_ ne ""){
								push(@newbl_senid,"$_");
										}
									}
									foreach(@ebl_senidds){
										if($_ ne $ei and $_ ne ""){
								push(@newbl_senidds,"$_");
										}
									}
									foreach(@ebl_senidts){
										if($_ ne $ei and $_ ne ""){
								push(@newbl_senidts,"$_");
										}
									}
							@ebl_senid = @newbl_senid;
							@ebl_senidds = @newbl_senidds;
							@ebl_senidts = @newbl_senidts;
					$boueijissuu = @ebl_senid;
					$boueidsjissuu = @ebl_senidds;
					$boueitsjissuu = @ebl_senidts;

	$add_w = $img_op_add{$kbp_id[$ki]};
	$img_op_add{$kbp_id[$ki]} = 3;
	$img_op_add{$ebp_id[$ei]} = 4;
										$kbp_hcc[$ki]= "";
										if($kbp_hy[$ki] ne ""){$kbp_hcc[$ki]= "<br />";
										}
										if((!$battle_endf and $ei eq "0") or !$boueijissuu){
										$pcount += 100;
										$pcount2 += 100;
										$win = 1;
	&K1LOGBL("$kbp_hy[$ki]$kbp_hcc[$ki]Phase<span class=\"cFF0000\">E</span>:<span class=\"c0000FF\">【撃破】</span>:$p_name{$kbp_id[$ki]}は敵軍司令官$p_name{$ebp_id[$ei]}を討ち取りました！！<br />統率を失った$k_name_d[$p_kunino{$e_id}]軍は戦場から離脱した模様です。");

										}else{
	&K1LOGBL("$kbp_hy[$ki]$kbp_hcc[$ki]<span class=\"c0000FF\">【撃破】</span>:$p_name{$kbp_id[$ki]}は$p_name{$ebp_id[$ei]}を倒しました！");
										}

										$p_gekiha{$kbp_id[$ki]}++;
									if(!$battle_end){
						$defaddpos = "0";
						$defadditi = "0";
						$defaddid = "$ebp_id[$ei]";
						$defaddname = "$p_name{$ebp_id[$ei]}";
						$defaddcon = "$p_kunino{$ebp_id[$ei]}";
						$defaddhei = "$p_heisyu{$ebp_id[$ei]}";
						$defadddbdb8 = "$defitidefo";
						$defadddbdb9 = "$cd_op2";
						&DEF_D;
$p_syubi_tosi{$ebp_id[$ei]} = 0;
$p_syubi_eria{$ebp_id[$ei]} = 0;
									}
					$kbp_xexadd[$ki] = ($p_buryoku{$ebp_id[$ei]} + $p_tiryoku{$ebp_id[$ei]} + $p_tousotu{$ebp_id[$ei]}) - ($p_buryoku{$kbp_id[$ki]} + $p_tiryoku{$kbp_id[$ki]} + $p_tousotu{$kbp_id[$ki]}) - 10;
					if($kbp_xexadd[$ki] > 9 and !$battle_end){
					$p_ex_buryoku{$kbp_id[$ki]} += int($kbp_xexadd[$ki] * $kbp_fs[$ki] / 300);
					$p_ex_tiryoku{$kbp_id[$ki]} += int($kbp_xexadd[$ki] * $kbp_fi[$ki] / 300);
					$p_ex_tousotu{$kbp_id[$ki]} += int($kbp_xexadd[$ki] * $kbp_fl[$ki] / 300);
			if($kbp_fi[$ki]>59 and $kbp_fl[$ki]>59 and $kbp_fs[$ki]>59){
					$p_ex_buryoku{$kbp_id[$ki]} += int($kbp_xexadd[$ki] * $kbp_fs[$ki] / 300);
					$p_ex_tiryoku{$kbp_id[$ki]} += int($kbp_xexadd[$ki] * $kbp_fi[$ki] / 300);
					$p_ex_tousotu{$kbp_id[$ki]} += int($kbp_xexadd[$ki] * $kbp_fl[$ki] / 300);
			if($kbp_fi[$ki]>89 and $kbp_fl[$ki]>89 and $kbp_fs[$ki]>89){
					$p_ex_buryoku{$kbp_id[$ki]} += int($kbp_xexadd[$ki] * $kbp_fs[$ki] / 300);
					$p_ex_tiryoku{$kbp_id[$ki]} += int($kbp_xexadd[$ki] * $kbp_fi[$ki] / 300);
					$p_ex_tousotu{$kbp_id[$ki]} += int($kbp_xexadd[$ki] * $kbp_fl[$ki] / 300);
			}
			}
					}
			if($p_heisyu{$kbp_id[$ki]} eq "96"){
			$add = int(($kbp_solm[$ki] - $p_heisisuu{$kbp_id[$ki]}) * 0.5);
			$p_heisisuu{$kbp_id[$ki]} += $add;
	&KWBLOGBL("<span class=\"c0000FF\">【再生】</span>:$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊の傷が見る見るうちに癒えていきます。");
			}elsif($k_kokkyou{$p_kunino{$kbp_id[$ki]}} eq "5"){
	if($k_kokkyou_keika_nen{$p_kunino{$kbp_id[$ki]}} > 10){
			$add = int(($kbp_solm[$ki] - $p_heisisuu{$kbp_id[$ki]}) * 0.1);
			$p_heisisuu{$kbp_id[$ki]} += $add;
	&KWBLOGBL("<span class=\"c0000FF\">【再生】</span>:$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊の傷が見る見るうちに癒えていきます。");
	}
			}
										&K_KYUUKETU_SOSEI("");
									if($kbp_sikikeitai[$ki] eq "0"){
									$p_hei_siki{$kbp_id[$ki]} += 5;
									}elsif($kbp_sikikeitai[$ki] eq "1"){
									$p_hei_siki{$kbp_id[$ki]} += 3;
									}elsif($kbp_sikikeitai[$ki] eq "2"){
									$p_hei_siki{$kbp_id[$ki]} += 3;
									}
									if($ebp_sikikeitai[$ei] eq "0"){
									$p_hei_siki{$ebp_id[$ei]} -= 4;
									}elsif($ebp_sikikeitai[$ei] eq "1"){
									$p_hei_siki{$ebp_id[$ei]} -= 4;
									}elsif($ebp_sikikeitai[$ei] eq "2"){
									$p_hei_siki{$ebp_id[$ei]} -= 6;
									}

	$w_id=$p_id{$kbp_id[$ki]};&P_LOG_W("&nbsp;&nbsp;&nbsp;<span class=\"c0000FF\">☆</span>&nbsp;$p_name{$kbp_id[$ki]}は$p_name{$ebp_id[$ei]}を倒した！");
	$w_id=$p_id{$ebp_id[$ei]};&P_LOG_W("&nbsp;&nbsp;&nbsp;<span class=\"cFF0000\">★</span>&nbsp;$p_name{$ebp_id[$ei]}は$p_name{$kbp_id[$ki]}に敗北した。。");
											&M2AP_LOG("&nbsp;&nbsp;&nbsp;<span class=\"c0000FF\">☆</span>&nbsp;$p_p_b_a{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊は$p_p_b_a{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊を倒しました！＠$t_name{$ft_id}$senno[$md_eria]");
			if(1 > int(rand(30))){
							$kitw = int(rand(10));
							$kitw = "2$kitw";
			if(1 > int(rand(3))){
							$kitw = int(rand(8))+1;
			}
							$f_idwit = $f_id;
							$f_id = $kbp_id[$ki];
		&ITEM_IN;
							$f_id = $f_idwit;
									$ttid = "blog/$kbp_id[$ki]";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の合戦場にて<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
	$w_id=$p_id{$kbp_id[$ki]};&P_LOG_W("$nen_genzai年$tuki_genzai月:戦利品として<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
							&K1LOGBL("$p_name{$kbp_id[$ki]}は合戦場にて<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
			}
	$img_op_add{$kbp_id[$ki]} = $add_w;
											next;
										}

										$p_heisisuu{$kbp_id[$ki]} -= $ebp_dmg[$ei];
										$ebp_ex_add[$ei] += ($kbp_wsol[$ki] - $p_heisisuu{$kbp_id[$ki]});
										if($p_heisisuu{$kbp_id[$ki]} <= 0){
											if($kbp_husi[$ki] == 1){
										$p_heisisuu{$kbp_id[$ki]} += int($kbp_solh[$ki] * 0.8);
 										$ebp_dmg[$ki] -= int($kbp_solh[$ei] * 0.8);
										$kbp_husi[$ki] = 0;
										$kbp_solh[$ki] = $p_heisisuu{$kbp_id[$ki]};
											&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:転生の炎発動！！$p_name{$kbp_id[$ki]}の部隊は地獄の果てから蘇った！！");

											}elsif($p_heisyu{$kbp_id[$ki]} eq "94" and !int(rand(9))){
										$samonh = int(rand(70))+30;
										$p_heisisuu{$kbp_id[$ki]} = int($p_heisisuu{$ebp_id[$ei]} * $samonh / 100);
										$p_heisisuu{$ebp_id[$ei]} = int($p_heisisuu{$ebp_id[$ei]} * (100-$samonh) / 100);
											&K1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]は$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]に憑依した！！（$samonh％）");
											}
										}
										if($p_heisisuu{$kbp_id[$ki]} <= 0 or $count==$btw or $p_hjijyou_w{$kbp_id[$ki]}[1]){

		if($p_hjijyou_w{$kbp_id[$ki]}[1]){
										&K1LOGBL("Phase<span class=\"cFF0000\">E</span>:$p_name{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊は石像と化しています。。");
		}
										if($p_heisisuu{$kbp_id[$ki]} < 1){
											$p_heisisuu{$kbp_id[$ki]}=0;
										}
											&STLOGBL("");

										$kbp_h_ko[$ki]=1;
										$kbp_b_ko[$ki]=1;
							@newbl_senid=();
							@newbl_senidds=();
							@newbl_senidts=();
									foreach(@kbl_senid){
										if($_ ne $ki and $_ ne ""){
								push(@newbl_senid,"$_");
										}
									}
									foreach(@kbl_senidds){
										if($_ ne $ki and $_ ne ""){
								push(@newbl_senidds,"$_");
										}
									}
									foreach(@kbl_senidts){
										if($_ ne $ki and $_ ne ""){
								push(@newbl_senidts,"$_");
										}
									}
							@kbl_senid = @newbl_senid;
							@kbl_senidds = @newbl_senidds;
							@kbl_senidts = @newbl_senidts;
					$kouryakujissuu = @kbl_senid;
					$kouryakudsjissuu = @kbl_senidds;
					$kouryakutsjissuu = @kbl_senidts;

										$ebp_hcc[$ei]= "";
										if($ebp_hy[$ei] ne ""){$ebp_hcc[$ei]= "<br />";
										}
										if($ki eq "0"){
										$pcount += 100;
										$pcount2 += 100;
											
	$add_w = $img_op_add{$ebp_id[$ei]};
	$img_op_add{$ebp_id[$ei]} = 3;
	$img_op_add{$kbp_id[$ki]} = 4;
										if($count==$btw){
	&KE1LOGBL("Phase<span class=\"cFF0000\">E</span>:<span class=\"c0000FF\">【時間切れ】</span>:$kbt_namae部隊と$ebt_namaeの部隊との戦いは決着がつきませんでした。<br />攻めあぐねた$k_name_d[$p_kunino{$f_id}]軍は戦場から離脱した模様です。");

										}else{
	&E1LOGBL("$ebp_hy[$ei]$ebp_hcc[$ei]Phase<span class=\"cFF0000\">E</span>:<span class=\"c0000FF\">【撃破】</span>:$p_name{$ebp_id[$ei]}は敵軍司令官$p_name{$kbp_id[$ki]}を討ち取りました！！<br />統率を失った$k_name_d[$p_kunino{$f_id}]軍は戦場から離脱した模様です。");
										}

										}else{
	&E1LOGBL("$ebp_hy[$ei]$ebp_hcc[$ei]<span class=\"c0000FF\">【撃破】</span>:$p_name{$ebp_id[$ei]}は$p_name{$kbp_id[$ki]}を倒しました！");
										}


										$p_gekiha{$ebp_id[$ei]}++;
					$ebp_xexadd[$ei]  = ($p_buryoku{$kbp_id[$ki]} + $p_tiryoku{$kbp_id[$ki]} + $p_tousotu{$kbp_id[$ki]}) - ($p_buryoku{$ebp_id[$ei]} + $p_tiryoku{$ebp_id[$ei]} + $p_tousotu{$ebp_id[$ei]}) - 10;
					if($ebp_xexadd[$ei] > 9 and !$battle_end){
					$p_ex_buryoku{$ebp_id[$ei]}  += int($ebp_xexadd[$ei] * $ebp_fs[$ei] / 300);
					$p_ex_tiryoku{$ebp_id[$ei]}  += int($ebp_xexadd[$ei] * $ebp_fi[$ei] / 300);
					$p_ex_tousotu{$ebp_id[$ei]}  += int($ebp_xexadd[$ei] * $ebp_fl[$ei] / 300);
			if($ebp_fi>59 and $ebp_fl>59 and $ebp_fs>59){
					$p_ex_buryoku{$ebp_id[$ei]}  += int($ebp_xexadd[$ei] * $ebp_fs[$ei] / 300);
					$p_ex_tiryoku{$ebp_id[$ei]}  += int($ebp_xexadd[$ei] * $ebp_fi[$ei] / 300);
					$p_ex_tousotu{$ebp_id[$ei]}  += int($ebp_xexadd[$ei] * $ebp_fl[$ei] / 300);
			if($ebp_fi>89 and $ebp_fl>89 and $ebp_fs>89){
					$p_ex_buryoku{$ebp_id[$ei]}  += int($ebp_xexadd[$ei] * $ebp_fs[$ei] / 300);
					$p_ex_tiryoku{$ebp_id[$ei]}  += int($ebp_xexadd[$ei] * $ebp_fi[$ei] / 300);
					$p_ex_tousotu{$ebp_id[$ei]}  += int($ebp_xexadd[$ei] * $ebp_fl[$ei] / 300);
			}
			}
					}
			if($p_heisyu{$ebp_id[$ei]} eq "96"){
			$add = int(($ebp_solm[$ei] - $p_heisisuu{$ebp_id[$ei]}) * 0.5);
			$p_heisisuu{$ebp_id[$ei]} += $add;
	&EWBLOGBL("<span class=\"c0000FF\">【再生】</span>:$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊の傷が見る見るうちに癒えていきます。");
			}elsif($k_kokkyou{$p_kunino{$ebp_id[$ei]}} eq "5"){
	if($k_kokkyou_keika_nen{$p_kunino{$ebp_id[$ei]}} > 10){
			$add = int(($ebp_solm[$ei] - $p_heisisuu{$ebp_id[$ei]}) * 0.1);
			$p_heisisuu{$ebp_id[$ei]} += $add;
	&EWBLOGBL("<span class=\"c0000FF\">【再生】</span>:$p_name{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊の傷が見る見るうちに癒えていきます。");
	}
			}
										&E_KYUUKETU_SOSEI("");
									if($kbp_sikikeitai[$ki] eq "0"){
									$p_hei_siki{$kbp_id[$ki]} -= 4;
									}elsif($kbp_sikikeitai[$ki] eq "1"){
									$p_hei_siki{$kbp_id[$ki]} -= 4;
									}elsif($kbp_sikikeitai[$ki] eq "2"){
									$p_hei_siki{$kbp_id[$ki]} -= 6;
									}
									if($ebp_sikikeitai[$ei] eq "0"){
									$p_hei_siki{$ebp_id[$ei]} += 5;
									}elsif($ebp_sikikeitai[$ei] eq "1"){
									$p_hei_siki{$ebp_id[$ei]} += 3;
									}elsif($ebp_sikikeitai[$ei] eq "2"){
									$p_hei_siki{$ebp_id[$ei]} += 3;
									}

									if($ebp_f16[$ei] ne "2" and $town_get[$p_kunino{$kbp_id[$ki]}] > 9 and $town_get[$p_kunino{$e_id}] == 1 and $p_kunino{$e_id} ne $p_kunino{$ebp_id[$ei]} and int(rand(10)) < 1){
									$ttid = "blog/$ebp_id[$ei]";
									&PRLOG("\[$old_date\]$t_name{$ft_id}防衛戦・戦場で玄武の巻物を発見。部隊に神獣：玄武が加わる。");
	$w_id=$p_id{$ebp_id[$ei]};&P_LOG_W("$p_name{$ebp_id[$ei]}は戦場で玄武の巻物を発見した！！<br />$p_name{$ebp_id[$ei]}は玄武を従えることに成功した。$p_name{$ebp_id[$ei]}の部隊に神獣：玄武が加わりました！！！");
							&E1LOGBL("$p_name{$ebp_id[$ei]}は戦場で玄武の巻物を発見した！！<br />$p_name{$ebp_id[$ei]}は玄武を従えることに成功した。$p_name{$ebp_id[$ei]}の部隊に神獣：玄武が加わりました！！！");
										&M2AP_LOG("$p_p_b_a{$ebp_id[$ei]}は玄武の巻物を発見しました！！");
$p_pet_type{$ebp_id[$ei]}[0] = 2;
$p_pet_name{$ebp_id[$ei]}[0] = $jyuu[$p_pet_type{$ebp_id[$ei]}[0]];
									}
	$w_id=$p_id{$kbp_id[$ki]};&P_LOG_W("&nbsp;&nbsp;&nbsp;<span class=\"cFF0000\">★</span>&nbsp;$p_name{$kbp_id[$ki]}は$p_name{$ebp_id[$ei]}に敗北した。。");
	$w_id=$p_id{$ebp_id[$ei]};&P_LOG_W("&nbsp;&nbsp;&nbsp;<span class=\"c0000FF\">☆</span>&nbsp;$p_name{$ebp_id[$ei]}は$p_name{$kbp_id[$ki]}を倒した！");
											&M2AP_LOG("&nbsp;&nbsp;&nbsp;<span class=\"cFF0000\">★</span>&nbsp;$p_p_b_a{$kbp_id[$ki]}の$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]部隊は$p_p_b_a{$ebp_id[$ei]}の$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]部隊に敗れ去りました！＠$t_name{$ft_id}$senno[$md_eria]");
			if(1 > int(rand(30))){
							$kitw = int(rand(10));
							$kitw = "2$kitw";
			if(1 > int(rand(3))){
							$kitw = int(rand(8))+1;
			}

							$f_idwit = $f_id;
							$f_id = $ebp_id[$ei];
		&ITEM_IN;
							$f_id = $f_idwit;
									$ttid = "blog/$ebp_id[$ei]";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の合戦場にて<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
	$w_id=$p_id{$ebp_id[$ei]};&P_LOG_W("$nen_genzai年$tuki_genzai月:戦利品として<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
							&E1LOGBL("$p_name{$ebp_id[$ei]}は合戦場にて<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
			}
	$img_op_add{$ebp_id[$ei]} = $add_w;
											next;
										}

										&STLOGBL("");

										&K_KYUUKETU_SOSEI("");
										&E_KYUUKETU_SOSEI("");

									if(!$battle_end){

									$ikuritu = $SKIKURITU[$ebp_sikikeitai[$ei]] + $BHIKURITU[$ebp_shousin1[$ei]] + $SKIKURITU[$kbp_sikikeitai[$ki]] + $BHIKURITU[$kbp_shousin1[$ki]] + $BKIKURITU[$p_b_kougun{$kbp_id[$ki]}] + $HKIKURITU[$p_h_kougun{$kbp_id[$ki]}];

										$ikur = int(rand(10- $ikuritu));
										$kbp_strw[$ki] = $p_buryoku{$kbp_id[$ki]}+200;
										$ikus = $kbp_strw[$ki]-$p_buryoku{$ebp_id[$ei]};

									if($ikur < 2 and !$kbp_iku_hit[$ki] and !$ebp_iku_hit[$ei] and $ikus >= 185 - $ikuritu and $ikus <= 215 + $ikuritu){
										&KE1LOGBL("Phase<span class=\"cFF0000\">$count</span>:$p_name{$kbp_id[$ki]}（武力$p_buryoku{$kbp_id[$ki]}）と$p_name{$ebp_id[$ei]}（武力$p_buryoku{$ebp_id[$ei]}）は<br />戦場で鉢合わせて一騎討ちへと突入した！！");

										if($p_busyou_hp{$kbp_id[$ki]} < $p_tairyoku{$kbp_id[$ki]}){
								$p_busyou_hp{$kbp_id[$ki]} = int($p_tairyoku{$kbp_id[$ki]}-(($p_tairyoku{$kbp_id[$ki]} - $p_busyou_hp{$kbp_id[$ki]})/4));
										}
										if($p_busyou_hp{$ebp_id[$ei]} < $p_tairyoku{$ebp_id[$ei]}){
								$p_busyou_hp{$ebp_id[$ei]} = int($p_tairyoku{$ebp_id[$ei]}-(($p_tairyoku{$ebp_id[$ei]} - $p_busyou_hp{$ebp_id[$ei]})/4));
										}
										$ikut = 0;
										$kbp_strwhp[$ki] = $p_busyou_hp{$kbp_id[$ki]};
										$ebp_strwhp[$ei] = $p_busyou_hp{$ebp_id[$ei]};
										&KE1LOGBL("<span class=\"cFF0000\">開始！！</span><br />$p_name{$kbp_id[$ki]}（武力$p_buryoku{$kbp_id[$ki]}）HP：$kbp_strwhp[$ki]● VS ●HP：$ebp_strwhp[$ei]（武力$p_buryoku{$ebp_id[$ei]}）$p_name{$ebp_id[$ei]}");


										$kbp_strwd[$ki] = int(rand($ikus/10))+ int($ikus/10);
										$ebp_strwd[$ei] = int(rand((400-$ikus)/10))+ int((400-$ikus)/10);

										$ikurh = int(rand(5));$kbp_wwname[$ki] = "";

									if($ikurh == 0){
										$add_i_hit = int(rand(3));
										$kbp_strwd[$ki] += int(rand($bpi_dmg{$kbp_id[$ki]}[$add_i_hit]+10));
									if($kbp_strwd[$ki] > 66){$kbp_strwd[$ki] = 100;$kbp_wwname[$ki] = "<br />あまりの速さに$p_name{$ebp_id[$ei]}は$bpi_name{$kbp_id[$ki]}[$add_i_hit]を避けきれない！！<br />$p_name{$ebp_id[$ei]}は一撃の下に斬り倒された！！";}

										$kbp_hcc1[$ki]= "$p_name{$kbp_id[$ki]}は初撃から必殺技を繰り出した！！";
										if($kbp_h1[$ki] ne ""){$kbp_hcc1[$ki]= "$kbp_h1[$ki]";
										}
										&K1LOGBL("<span class=\"cFF0000\">$kbp_hcc1[$ki]</span><br />$p_name{$kbp_id[$ki]}の渾身の一撃！！<br />$bpi_name{$kbp_id[$ki]}[$add_i_hit]を天高く振りかざし$p_name{$ebp_id[$ei]}に向かって振り下ろす！！$kbp_wwname[$ki]");
									}elsif($ikurh == 1){
										$add_i_hit = int(rand(3));
										$ebp_strwd[$ei] += int(rand($bpi_dmg{$ebp_id[$ei]}[$add_i_hit]+10));
									if($ebp_strwd[$ei] > 66){$ebp_strwd[$ei] = 100;$kbp_wwname[$ki] = "<br />あまりの速さに$p_name{$kbp_id[$ki]}は$bpi_name{$ebp_id[$ei]}[$add_i_hit]を避けきれない！！<br />$p_name{$kbp_id[$ki]}は一撃の下に斬り倒された！！";}

										$ebp_hcc1[$ei]= "$p_name{$ebp_id[$ei]}は初撃から必殺技を繰り出した！！";
										if($ebp_h1[$ei] ne ""){$ebp_hcc1[$ei]= "$ebp_h1[$ei]";
										}
										&E1LOGBL("<span class=\"cFF0000\">$ebp_hcc1[$ei]</span>:$p_name{$ebp_id[$ei]}の渾身の一撃！！<br />$bpi_name{$ebp_id[$ei]}[$add_i_hit]を天高く振りかざし$p_name{$kbp_id[$ki]}に向かって振り下ろす！！$kbp_wwname[$ki]");
									}elsif($ikurh == 2){
										&K1LOGBL("<span class=\"cFF0000\">壱合目！！</span><br />$p_name{$kbp_id[$ki]}は三連撃を繰り出していく。<br />一方の$p_name{$ebp_id[$ei]}はそれを慎重に見切りつつカウンターを仕掛ける！！");
									}elsif($ikurh == 3){
										&E1LOGBL("<span class=\"cFF0000\">壱合目！！</span><br />$p_name{$ebp_id[$ei]}は三連撃を繰り出していく。<br />一方の$p_name{$kbp_id[$ki]}はそれを慎重に見切りつつカウンターを仕掛ける！！");
									}elsif($ikurh == 4){
										&KE1LOGBL("<span class=\"cFF0000\">壱合目！！</span><br />$p_name{$kbp_id[$ki]}と$p_name{$ebp_id[$ei]}はほぼ同時に必殺の一撃を解き放つ！！");
										}

										$kbp_strwhp[$ki] -= $ebp_strwd[$ei];
										$ebp_strwhp[$ei] -= $kbp_strwd[$ki];
									if($ebp_strwhp[$ei] <= 0 and $kbp_strwhp[$ki] <= 0){$ebp_strwhp[$ei] = 1;$kbp_strwhp[$ki] = 1;
									}
										&KE1LOGBL("<span class=\"cFF0000\">壱合目！！</span><br />$p_name{$kbp_id[$ki]}（武力$p_buryoku{$kbp_id[$ki]}）HP：$kbp_strwhp[$ki]● VS ●HP：$ebp_strwhp[$ei]（武力$p_buryoku{$ebp_id[$ei]}）$p_name{$ebp_id[$ei]}");

									if($ebp_strwhp[$ei] <= 0){
											$ebp_iku_hit[$ei]=1;
										$p_ex_buryoku{$kbp_id[$ki]} +=30;
										$ebp_att[$ei] = int(rand($ebp_att[$ei]));
				$ebp_heisenia[$ei] = int(rand($ebp_heisenia[$ei] * 1 * 100))/100;
									$ttid = "blog/$kbp_id[$ki]";
									&PRLOG("\[$old_date\]$t_name{$ft_id}攻略戦・一騎討ちにて一閃の下に$p_p_b_a{$ebp_id[$ei]}を斬り捨てる。 使用武器:$bpi_name{$kbp_id[$ki]}[$add_i_hit]");
									if($kbp_f16v[$ki] ne "4" and int(rand(7)) < 1){
									$ttid = "blog/$kbp_id[$ki]";
									&PRLOG("\[$old_date\]$t_name{$ft_id}攻略戦・朱雀の巻物を発見。部隊に神獣：朱雀が加わる。");
										&K1LOGBL("$p_name{$kbp_id[$ki]}は戦場で朱雀の巻物を発見した！！<br />$p_name{$kbp_id[$ki]}は朱雀を従えることに成功した。$p_name{$kbp_id[$ki]}の部隊に神獣：朱雀が加わりました！！！");

$p_pet_type{$kbp_id[$ki]}[0] = 4;
$p_pet_name{$kbp_id[$ki]}[0] = $jyuu[$p_pet_type{$kbp_id[$ki]}[0]];
									}
										&K1LOGBL("<span class=\"cFF0000\">$p_name{$kbp_id[$ki]}は$p_name{$ebp_id[$ei]}に勝利した！！</span><br />$kbp_hi[$ki]<br />$p_name{$ebp_id[$ei]}の部隊の士気が低下！！$p_name{$kbp_id[$ki]}は武力経験をつんだ！！");
											&M2AP_LOG("&nbsp;&nbsp;&nbsp;<span class=\"cDA70D6\">◆</span>【一騎討ち】$p_p_b_a{$kbp_id[$ki]}は一閃の下に$p_p_b_a{$ebp_id[$ei]}を斬り捨てました！ 使用武器:$bpi_name{$kbp_id[$ki]}[$add_i_hit]");
											&MAP_LOG2("<span class=\"c0000FF\">【一騎討ち・名場面】</span>\[$old_date\]$t_name{$ft_id}攻略戦・$p_p_b_a{$kbp_id[$ki]}は一閃の下に$p_p_b_a{$ebp_id[$ei]}を斬り捨てました！ 使用武器:$bpi_name{$kbp_id[$ki]}[$add_i_hit]");
									}elsif($kbp_strwhp[$ki] <= 0){
											$kbp_iku_hit[$ki]=1;
										$p_ex_buryoku{$ebp_id[$ei]} +=30;
										$kbp_att[$ki] = int(rand($kbp_att[$ki]));
				$kbp_heisenia[$ki] = int(rand($kbp_heisenia[$ki] * 1 * 100))/100;
									$ttid = "blog/$ebp_id[$ei]";
									&PRLOG("\[$old_date\]$t_name{$ft_id}防衛戦・一騎討ちにて一閃の下に$p_p_b_a{$kbp_id[$ki]}を斬り捨てる。 使用武器:$bpi_name{$ebp_id[$ei]}[$add_i_hit]");
									if($ebp_f16[$ei] ne "4" and int(rand(7)) < 1){
									$ttid = "blog/$ebp_id[$ei]";
									&PRLOG("\[$old_date\]$t_name{$ft_id}防衛戦・朱雀の巻物を発見。部隊に神獣：朱雀が加わる。");
										&E1LOGBL("$p_name{$ebp_id[$ei]}は戦場で朱雀の巻物を発見した！！<br />$p_name{$ebp_id[$ei]}は朱雀を従えることに成功した。$p_name{$ebp_id[$ei]}の部隊に神獣：朱雀が加わりました！！！");

$p_pet_type{$ebp_id[$ei]}[0] = 4;
$p_pet_name{$ebp_id[$ei]}[0] = $jyuu[$p_pet_type{$ebp_id[$ei]}[0]];
									}
										&E1LOGBL("<span class=\"cFF0000\">$p_name{$ebp_id[$ei]}は$p_name{$kbp_id[$ki]}に勝利した！！</span><br />$ebp_hi[$ei]<br />$p_name{$kbp_id[$ki]}の部隊の士気が低下！！$p_name{$ebp_id[$ei]}は武力経験をつんだ！！");
											&M2AP_LOG("&nbsp;&nbsp;&nbsp;<span class=\"cDA70D6\">◆</span>【一騎討ち】$p_p_b_a{$ebp_id[$ei]}は一閃の下に$p_p_b_a{$kbp_id[$ki]}を斬り捨てました！ 使用武器:$bpi_name{$ebp_id[$ei]}[$add_i_hit]");
											&MAP_LOG2("<span class=\"c0000FF\">【一騎討ち・名場面】</span>\[$old_date\]$t_name{$ft_id}防衛戦・$p_p_b_a{$ebp_id[$ei]}は一閃の下に$p_p_b_a{$kbp_id[$ki]}を斬り捨てました！ 使用武器:$bpi_name{$ebp_id[$ei]}[$add_i_hit]");
										}



									if(!$kbp_iku_hit[$ki] and !$ebp_iku_hit[$ei]){

										$kbp_strwd[$ki] = int(rand($ikus/10))+ int($ikus/10);
										$ebp_strwd[$ei] = int(rand((400-$ikus)/10))+ int((400-$ikus)/10);

										$ikurh = int(rand(5));

									if($ikurh == 0){
										$add_i_hit = int(rand(3));
										$kbp_strwd[$ki] += int(rand($bpi_dmg{$kbp_id[$ki]}[$add_i_hit]+10));
										$kbp_hcc1[$ki]= "この一撃で決めてやる！！";
										if($kbp_h2[$ki] ne ""){$kbp_hcc1[$ki]= "$kbp_h2[$ki]";
										}
										&K1LOGBL("<span class=\"cFF0000\">$kbp_hcc1[$ki]</span><br />$p_name{$kbp_id[$ki]}の渾身の一撃！！<br />$bpi_name{$kbp_id[$ki]}[$add_i_hit]が風を斬り裂き$p_name{$ebp_id[$ei]}の喉笛めがけて襲い掛かる！！");
									}elsif($ikurh == 1){
										$add_i_hit = int(rand(3));
										$ebp_strwd[$ei] += int(rand($bpi_dmg{$ebp_id[$ei]}[$add_i_hit]+10));
										$ebp_hcc1[$ei]= "この一撃で決めてやる！！";
										if($ebp_h2[$ei] ne ""){$ebp_hcc1[$ei]= "$ebp_h2[$ei]";
										}
										&E1LOGBL("<span class=\"cFF0000\">$ebp_hcc1[$ei]</span><br />$p_name{$ebp_id[$ei]}の渾身の一撃！！<br />$bpi_name{$ebp_id[$ei]}[$add_i_hit]が風を斬り裂き$p_name{$kbp_id[$ki]}の喉笛めがけて襲い掛かる！！");
									}elsif($ikurh == 2){
										&K1LOGBL("<span class=\"cFF0000\">弐合目！！</span><br />$p_name{$kbp_id[$ki]}は三連撃を繰り出していく。<br />一方の$p_name{$ebp_id[$ei]}はそれを慎重に見切りつつカウンターを仕掛ける！！");
									}elsif($ikurh == 3){
										&E1LOGBL("<span class=\"cFF0000\">弐合目！！</span><br />$p_name{$ebp_id[$ei]}は三連撃を繰り出していく。<br />一方の$p_name{$kbp_id[$ki]}はそれを慎重に見切りつつカウンターを仕掛ける！！");
									}elsif($ikurh == 4){
										&K1LOGBL("<span class=\"cFF0000\">弐合目！！</span><br />$p_name{$kbp_id[$ki]}と$p_name{$ebp_id[$ei]}はほぼ同時に必殺の一撃を解き放つ！！");
										}

										$kbp_strwhp[$ki] -= $ebp_strwd[$ei];
										$ebp_strwhp[$ei] -= $kbp_strwd[$ki];
									if($ebp_strwhp[$ei] <= 0 and $kbp_strwhp[$ki] <= 0){$ebp_strwhp[$ei] = 1;$kbp_strwhp[$ki] = 1;
									}
										&KE1LOGBL("<span class=\"cFF0000\">弐合目！！</span><br />$p_name{$kbp_id[$ki]}（武力$p_buryoku{$kbp_id[$ki]}）HP：$kbp_strwhp[$ki]● VS ●HP：$ebp_strwhp[$ei]（武力$p_buryoku{$ebp_id[$ei]}）$p_name{$ebp_id[$ei]}");

									if($ebp_strwhp[$ei] <= 0){
											$ebp_iku_hit[$ei]=1;
										$p_ex_buryoku{$kbp_id[$ki]} +=10;
										$ebp_att[$ei] = int(rand($ebp_att[$ei]));
				$ebp_heisenia[$ei] = int(rand($ebp_heisenia[$ei] * 1 * 100))/100;
									$ttid = "blog/$kbp_id[$ki]";
									&PRLOG("\[$old_date\]$t_name{$ft_id}攻略戦・一騎討ちにて$p_p_b_a{$ebp_id[$ei]}を討ち取る。 使用武器:$bpi_name{$kbp_id[$ki]}[$add_i_hit]");
										&K1LOGBL("<span class=\"cFF0000\">$p_name{$kbp_id[$ki]}は$p_name{$ebp_id[$ei]}に勝利した！！</span><br />$kbp_hi[$ki]<br />$p_name{$ebp_id[$ei]}の部隊の士気が低下！！$p_name{$kbp_id[$ki]}は武力経験をつんだ！！");
											&M2AP_LOG("&nbsp;&nbsp;&nbsp;<span class=\"cDA70D6\">◆</span>【一騎討ち】$p_p_b_a{$kbp_id[$ki]}は圧倒的な力を持って$p_p_b_a{$ebp_id[$ei]}を討ち取りました！");
			if($kbp_fs[$ki]>59 and int(rand(4)) < 1 and $item_nedan{$p_migite{$kbp_id[$ki]}}+$item_nedan{$p_hidarite{$kbp_id[$ki]}} < $item_nedan{$p_migite{$ebp_id[$ei]}}+$item_nedan{$p_hidarite{$ebp_id[$ei]}} and $item_rea{$p_migite{$kbp_id[$ki]}}+$item_rea{$p_hidarite{$kbp_id[$ki]}} < 10000){

	$w_id=$p_id{$ebp_id[$ei]};&P_LOG_W("<span class=\"cFF0000\">$p_name{$kbp_id[$ki]}は$p_name{$ebp_id[$ei]}の$bpi_name{$ebp_id[$ei]}[2]を奪い取った！！</span><br />。。。$p_name{$ebp_id[$ei]}は戦場で幻の剣：妖刀村雨を発見した。（隠れ武器のため一般\表示無し）");
	$w_id=$p_id{$kbp_id[$ki]};&P_LOG_W("<span class=\"cFF0000\">$p_name{$kbp_id[$ki]}は$p_name{$ebp_id[$ei]}の$bpi_name{$ebp_id[$ei]}[2]を奪い取った！！</span>");
					$p_migite{$kbp_id[$ki]} = $p_migite{$ebp_id[$ei]};
					$p_hidarite{$kbp_id[$ki]} = $p_hidarite{$ebp_id[$ei]};
					$p_migite_lv{$kbp_id[$ki]} = $p_migite_lv{$ebp_id[$ei]};
					$p_hidarite_lv{$kbp_id[$ki]} = $p_hidarite_lv{$ebp_id[$ei]};
					$p_migite{$ebp_id[$ei]} = 1028;
					$p_hidarite{$ebp_id[$ei]} = 1000;
					$p_migite_lv{$ebp_id[$ei]} = 0;
					$p_hidarite_lv{$ebp_id[$ei]} = 0;
			}elsif($kbp_fs[$ki]>89 and int(rand(4)) < 1 and $item_nedan{$p_migite{$kbp_id[$ki]}}+$item_nedan{$p_hidarite{$kbp_id[$ki]}} < $item_nedan{$p_migite{$ebp_id[$ei]}}+$item_nedan{$p_hidarite{$ebp_id[$ei]}} and $item_rea{$p_migite{$kbp_id[$ki]}}+$item_rea{$p_hidarite{$kbp_id[$ki]}} < 10000){

	$w_id=$p_id{$ebp_id[$ei]};&P_LOG_W("<span class=\"cFF0000\">$p_name{$kbp_id[$ki]}は$p_name{$ebp_id[$ei]}の$bpi_name{$ebp_id[$ei]}[2]を奪い取った！！</span><br />。。。$p_name{$ebp_id[$ei]}は戦場で幻の槍：ロンギヌスの槍を発見した。（隠れ武器のため一般\表示無し）");
	$w_id=$p_id{$kbp_id[$ki]};&P_LOG_W("<span class=\"cFF0000\">$p_name{$kbp_id[$ki]}は$p_name{$ebp_id[$ei]}の$bpi_name{$ebp_id[$ei]}[2]を奪い取った！！</span>");
					$p_migite{$kbp_id[$ki]} = $p_migite{$ebp_id[$ei]};
					$p_hidarite{$kbp_id[$ki]} = $p_hidarite{$ebp_id[$ei]};
					$p_migite_lv{$kbp_id[$ki]} = $p_migite_lv{$ebp_id[$ei]};
					$p_hidarite_lv{$kbp_id[$ki]} = $p_hidarite_lv{$ebp_id[$ei]};
					$p_migite{$ebp_id[$ei]} = 1029;
					$p_hidarite{$ebp_id[$ei]} = 1000;
					$p_migite_lv{$ebp_id[$ei]} = 0;
					$p_hidarite_lv{$ebp_id[$ei]} = 0;
			}
									}elsif($kbp_strwhp[$ki] <= 0){
											$kbp_iku_hit[$ki]=1;
										$p_ex_buryoku{$ebp_id[$ei]} +=10;
										$kbp_att[$ki] = int(rand($kbp_att[$ki]));
				$kbp_heisenia[$ki] = int(rand($kbp_heisenia[$ki] * 1 * 100))/100;
									$ttid = "blog/$ebp_id[$ei]";
									&PRLOG("\[$old_date\]$t_name{$ft_id}防衛戦・一騎討ちにて$p_p_b_a{$kbp_id[$ki]}を討ち取る。 使用武器:$bpi_name{$ebp_id[$ei]}[$add_i_hit]");
										&E1LOGBL("<span class=\"cFF0000\">$p_name{$ebp_id[$ei]}は$p_name{$kbp_id[$ki]}に勝利した！！</span><br />$ebp_hi[$ei]<br />$p_name{$kbp_id[$ki]}の部隊の士気が低下！！$p_name{$ebp_id[$ei]}は武力経験をつんだ！！");
											&M2AP_LOG("&nbsp;&nbsp;&nbsp;<span class=\"cDA70D6\">◆</span>【一騎討ち】$p_p_b_a{$ebp_id[$ei]}は圧倒的な力を持って$p_p_b_a{$kbp_id[$ki]}を討ち取りました！");
			if($ebp_fs[$ei]>59 and int(rand(4)) < 1 and $item_nedan{$p_migite{$kbp_id[$ki]}}+$item_nedan{$p_hidarite{$kbp_id[$ki]}} > $item_nedan{$p_migite{$ebp_id[$ei]}}+$item_nedan{$p_hidarite{$ebp_id[$ei]}} and $item_rea{$p_migite{$ebp_id[$ei]}}+$item_rea{$p_hidarite{$ebp_id[$ei]}} < 10000){


	$w_id=$p_id{$ebp_id[$ei]};&P_LOG_W("<span class=\"cFF0000\">$p_name{$ebp_id[$ei]}は$p_name{$kbp_id[$ki]}の$bpi_name{$kbp_id[$ki]}[$add_i_hit]を奪い取った！！</span>");
	$w_id=$p_id{$kbp_id[$ki]};&P_LOG_W("<span class=\"cFF0000\">$p_name{$ebp_id[$ei]}は$p_name{$kbp_id[$ki]}の$bpi_name{$kbp_id[$ki]}[$add_i_hit]を奪い取った！！</span><br />。。。$p_name{$kbp_id[$ki]}は戦場で幻の剣：妖刀村雨を発見した。（隠れ武器のため一般\表示無し）");
					$p_migite{$ebp_id[$ei]} = $p_migite{$kbp_id[$ki]};
					$p_hidarite{$ebp_id[$ei]} = $p_hidarite{$kbp_id[$ki]};
					$p_migite_lv{$ebp_id[$ei]} = $p_migite_lv{$kbp_id[$ki]};
					$p_hidarite_lv{$ebp_id[$ei]} = $p_hidarite_lv{$kbp_id[$ki]};
					$p_migite{$kbp_id[$ki]} = 1028;
					$p_hidarite{$kbp_id[$ki]} = 1000;
					$p_migite_lv{$kbp_id[$ki]} = 0;
					$p_hidarite_lv{$kbp_id[$ki]} = 0;
			}elsif($ebp_fs[$ei]>89 and int(rand(4)) < 1 and $item_nedan{$p_migite{$kbp_id[$ki]}}+$item_nedan{$p_hidarite{$kbp_id[$ki]}} > $item_nedan{$p_migite{$ebp_id[$ei]}}+$item_nedan{$p_hidarite{$ebp_id[$ei]}} and $item_rea{$p_migite{$ebp_id[$ei]}}+$item_rea{$p_hidarite{$ebp_id[$ei]}} < 10000){

	$w_id=$p_id{$ebp_id[$ei]};&P_LOG_W("<span class=\"cFF0000\">$p_name{$ebp_id[$ei]}は$p_name{$kbp_id[$ki]}の$bpi_name{$kbp_id[$ki]}[$add_i_hit]を奪い取った！！</span>");
	$w_id=$p_id{$kbp_id[$ki]};&P_LOG_W("<span class=\"cFF0000\">$p_name{$ebp_id[$ei]}は$p_name{$kbp_id[$ki]}の$bpi_name{$kbp_id[$ki]}[$add_i_hit]を奪い取った！！</span><br />。。。$p_name{$kbp_id[$ki]}は戦場で幻の槍：ロンギヌスの槍を発見した。（隠れ武器のため一般\表示無し）");

					$p_migite{$ebp_id[$ei]} = $p_migite{$kbp_id[$ki]};
					$p_hidarite{$ebp_id[$ei]} = $p_hidarite{$kbp_id[$ki]};
					$p_migite_lv{$ebp_id[$ei]} = $p_migite_lv{$kbp_id[$ki]};
					$p_hidarite_lv{$ebp_id[$ei]} = $p_hidarite_lv{$kbp_id[$ki]};
					$p_migite{$kbp_id[$ki]} = 1029;
					$p_hidarite{$kbp_id[$ki]} = 1000;
					$p_migite_lv{$kbp_id[$ki]} = 0;
					$p_hidarite_lv{$kbp_id[$ki]} = 0;
			}
										}
										}


									if(!$kbp_iku_hit[$ki] and !$ebp_iku_hit[$ei]){

										$kbp_strwd[$ki] = int(rand($ikus/10))+ int($ikus/10);
										$ebp_strwd[$ei] = int(rand((400-$ikus)/10))+ int((400-$ikus)/10);

										$ikurh = int(rand(5));

									if($ikurh == 0){
										$add_i_hit = int(rand(3));
										$kbp_strwd[$ki] += int(rand($bpi_dmg{$kbp_id[$ki]}[$add_i_hit]+10));
										$kbp_hcc1[$ki]= "これで・・終わりだ！！";
										if($kbp_h3[$ki] ne ""){$kbp_hcc1[$ki]= "$kbp_h3[$ki]";
										}
										&K1LOGBL("<span class=\"cFF0000\">$kbp_hcc1[$ki]</span><br />$p_name{$kbp_id[$ki]}の渾身の一撃！！<br />$bpi_name{$kbp_id[$ki]}[$add_i_hit]が風を斬り裂き$p_name{$ebp_id[$ei]}の喉笛めがけて襲い掛かる！！");
									if($p_syomotu{$kbp_id[$ki]} eq "2013"){
										$add_i_hit = int(rand(3));
										$kbp_strwd[$ki] += int(rand($bpi_dmg{$kbp_id[$ki]}[$add_i_hit]+10));
										&K1LOGBL("<span class=\"cFF0000\">相手が悪かったな・・</span><br />$p_name{$kbp_id[$ki]}の二の太刀！！$bpi_name{$kbp_id[$ki]}[$add_i_hit]が$p_name{$ebp_id[$ei]}のわき腹を軽く貫く！！");
										&K1LOGBL("<span class=\"cFF0000\">さらばだ！！</span><br />$p_name{$kbp_id[$ki]}の三の太刀！！$bpi_name{$kbp_id[$ki]}[$add_i_hit]が容赦なく$p_name{$ebp_id[$ei]}の体を斬り刻む！！");
									}
									}elsif($ikurh == 1){
										$add_i_hit = int(rand(3));
										$ebp_strwd[$ei] += int(rand($bpi_dmg{$ebp_id[$ei]}[$add_i_hit]+10));
										$ebp_hcc1[$ei]= "これで・・終わりだ！！";
										if($ebp_h3[$ei] ne ""){$ebp_hcc1[$ei]= "$ebp_h3[$ei]";
										}
										&E1LOGBL("<span class=\"cFF0000\">$ebp_hcc1[$ei]</span><br />$p_name{$ebp_id[$ei]}の渾身の一撃！！<br />$bpi_name{$ebp_id[$ei]}[$add_i_hit]が風を斬り裂き$p_name{$kbp_id[$ki]}の喉笛めがけて襲い掛かる！！");
									if($p_syomotu{$ebp_id[$ei]} eq "2013"){
										$add_i_hit = int(rand(3));
										$ebp_strwd[$ei] += int(rand($bpi_dmg{$ebp_id[$ei]}[$add_i_hit]+10));
										&E1LOGBL("<span class=\"cFF0000\">相手が悪かったな・・</span><br />$p_name{$ebp_id[$ei]}の二の太刀！！$ebp_armnameが$p_name{$kbp_id[$ki]}のわき腹を軽く貫く！！");
										&E1LOGBL("<span class=\"cFF0000\">さらばだ！！</span><br />$p_name{$ebp_id[$ei]}の三の太刀！！$bpi_name{$ebp_id[$ei]}[$add_i_hit]が容赦なく$p_name{$kbp_id[$ki]}の体を斬り刻む！！");
									}
									}elsif($ikurh == 2){
										&K1LOGBL("<span class=\"cFF0000\">参合目！！</span><br />$p_name{$kbp_id[$ki]}は三連撃を繰り出していく。<br />一方の$p_name{$ebp_id[$ei]}はそれを慎重に見切りつつカウンターを仕掛ける！！");
									}elsif($ikurh == 3){
										&E1LOGBL("<span class=\"cFF0000\">参合目！！</span><br />$p_name{$ebp_id[$ei]}は三連撃を繰り出していく。<br />一方の$p_name{$kbp_id[$ki]}はそれを慎重に見切りつつカウンターを仕掛ける！！");
									}elsif($ikurh == 4){
										&KE1LOGBL("<span class=\"cFF0000\">参合目！！</span><br />$p_name{$kbp_id[$ki]}と$p_name{$ebp_id[$ei]}はほぼ同時に必殺の一撃を解き放つ！！");
										}


										$kbp_strwhp[$ki] -= $ebp_strwd[$ei];
										$ebp_strwhp[$ei] -= $kbp_strwd[$ki];
									if($ebp_strwhp[$ei] <= 0 and $kbp_strwhp[$ki] <= 0){$ebp_strwhp[$ei] = 1;$kbp_strwhp[$ki] = 1;
									}
										&KE1LOGBL("<span class=\"cFF0000\">参合目！！</span><br />$p_name{$kbp_id[$ki]}（武力$p_buryoku{$kbp_id[$ki]}）HP：$kbp_strwhp[$ki]● VS ●HP：$ebp_strwhp[$ei]（武力$p_buryoku{$ebp_id[$ei]}）$p_name{$ebp_id[$ei]}");

									if($ebp_strwhp[$ei] <= 0){
											$ebp_iku_hit[$ei]=1;
										$p_ex_buryoku{$kbp_id[$ki]} +=5;
										$ebp_att[$ei] = int(rand($ebp_att[$ei]));
				$ebp_heisenia[$ei] = int(rand($ebp_heisenia[$ei] * 1 * 100))/100;
									$ttid = "blog/$kbp_id[$ki]";
									&PRLOG("\[$old_date\]$t_name{$ft_id}攻略戦・一騎討ちにて激闘の末$p_p_b_a{$ebp_id[$ei]}を討ち取る。 使用武器:$bpi_name{$kbp_id[$ki]}[$add_i_hit]");
										&K1LOGBL("<span class=\"cFF0000\">$p_name{$kbp_id[$ki]}は$p_name{$ebp_id[$ei]}に勝利した！！</span><br />$kbp_hi[$ki]<br />$p_name{$ebp_id[$ei]}の部隊の士気が低下！！$p_name{$kbp_id[$ki]}は武力経験をつんだ！！");
											&M2AP_LOG("&nbsp;&nbsp;&nbsp;<span class=\"cDA70D6\">◆</span>【一騎討ち】$p_p_b_a{$kbp_id[$ki]}は激闘の末$p_p_b_a{$ebp_id[$ei]}を討ち取りました！");
									}elsif($kbp_strwhp[$ki] <= 0){
											$kbp_iku_hit[$ki]=1;
										$p_ex_buryoku{$ebp_id[$ei]} +=5;
										$kbp_att[$ki] = int(rand($kbp_att[$ki]));
				$kbp_heisenia[$ki] = int(rand($kbp_heisenia[$ki] * 1 * 100))/100;
									$ttid = "blog/$ebp_id[$ei]";
									&PRLOG("\[$old_date\]$t_name{$ft_id}防衛戦・一騎討ちにて激闘の末$p_p_b_a{$kbp_id[$ki]}を討ち取る。 使用武器:$bpi_name{$ebp_id[$ei]}[$add_i_hit]");
										&E1LOGBL("<span class=\"cFF0000\">$p_name{$ebp_id[$ei]}は$p_name{$kbp_id[$ki]}に勝利した！！</span><br />$ebp_hi[$ei]<br />$p_name{$kbp_id[$ki]}の部隊の士気が低下！！$p_name{$ebp_id[$ei]}は武力経験をつんだ！！");
											&M2AP_LOG("&nbsp;&nbsp;&nbsp;<span class=\"cDA70D6\">◆</span>【一騎討ち】$p_p_b_a{$ebp_id[$ei]}は激闘の末$p_p_b_a{$kbp_id[$ki]}を討ち取りました！");
									}else{
										&KE1LOGBL("<span class=\"cFF0000\">引き分け</span>:$p_name{$kbp_id[$ki]}と$p_name{$ebp_id[$ei]}の一騎討ち勝負は決着がつかなかった。。");
											&M2AP_LOG("&nbsp;&nbsp;&nbsp;<span class=\"cDA70D6\">◆</span>【一騎討ち】$p_p_b_a{$kbp_id[$ki]}と$p_p_b_a{$ebp_id[$ei]}は激しい戦いの末引き分けました！");
										}
										}
###########################################
						$p_busyou_hp{$kbp_id[$ki]} = $kbp_strwhp[$ki];
										if($p_busyou_hp{$kbp_id[$ki]} < 1){
											if(!$kbp_husyoubou[$ki]){
										$p_tairyoku{$kbp_id[$ki]} = int($p_tairyoku{$kbp_id[$ki]} * 0.7);
											}
										$p_busyou_hp{$kbp_id[$ki]} = 0;
										}
										if($p_busyou_hp{$kbp_id[$ki]} < $p_tairyoku{$kbp_id[$ki]}){
										if($kbp_husyoubou[$ki]){
								$p_busyou_hp{$kbp_id[$ki]} = int($p_tairyoku{$kbp_id[$ki]}-(($p_tairyoku{$kbp_id[$ki]} - $p_busyou_hp{$kbp_id[$ki]})/2));
										}
										}
						$p_busyou_hp{$ebp_id[$ei]} = $ebp_strwhp[$ei];
										if($p_busyou_hp{$ebp_id[$ei]} < 1){
											if(!$ebp_husyoubou[$ei]){
										$p_tairyoku{$ebp_id[$ei]} = int($p_tairyoku{$ebp_id[$ei]} * 0.7);
											}
										$p_busyou_hp{$ebp_id[$ei]} = 0;
										}

										if($p_busyou_hp{$ebp_id[$ei]} < $p_tairyoku{$ebp_id[$ei]}){
										if($ebp_husyoubou[$ei]){
								$p_busyou_hp{$ebp_id[$ei]} = int($p_tairyoku{$ebp_id[$ei]}-(($p_tairyoku{$ebp_id[$ei]} - $p_busyou_hp{$ebp_id[$ei]})/2));
										}
										}

############################################
										}

										}


#####################キャラ回転######################
									}

		$mapseiseiblm .= "
</table>

</td>
<td width=\"15\" class=\"bgcFFF0F5\" onclick=\"javascript:void(slm(1));\">↓</td>
</tr>
</table>
<br />";
#####################フェイズ回転######################
									}

		$mapseiseiblp .= "
<table cellspacing=\"2\" width=\"720\" border=\"2\">
<tr>
<td>
";
					$i =0;
						while ($i <= $count) {
	$add = sprintf("%02d", $i);
		$mapseiseiblp .= "
<a href=\"#$i\">$add</a> 
";
					$i ++;
						}
					$count ++;
		$mapseiseiblp .= "
<a href=\"#$count\">E</a> 
";
		$mapseiseiblp .= "
</td></tr>
</table>
";


###########################################

	&BAG_LOG2("BE\n");
			if($win){
				if($boueijissuu){
		$kaddc="$kouryakukazu ⇒ $kouryakujissuu（司令官撃破）<span class=\"c0000FF\">【勝利】</span>";
		$eaddc="<span class=\"cFF0000\">【敗北】</span>（司令官敗北）$boueikazu ⇒ $boueijissuu";
		$kaddc2="$kouryakukazu ⇒ $kouryakujissuu";
		$eaddc2="$boueikazu ⇒ $boueijissuu";
		$maddc="<span class=\"c0000FF\">【勝利】</span>";
		$kmaddc="<span class=\"c0000FF\">【敵軍撃破】</span>";
		$emaddc="<span class=\"cFF0000\">【壊走】</span>";
				}else{
		$kaddc="$kouryakukazu ⇒ $kouryakujissuu（完全勝利）<span class=\"c0000FF\">【勝利】</span>";
		$eaddc="<span class=\"cFF0000\">【敗北】</span>（部隊壊滅）$boueikazu ⇒ $boueijissuu";
		$kaddc2="$kouryakukazu ⇒ $kouryakujissuu";
		$eaddc2="$boueikazu ⇒ $boueijissuu";
		$maddc="<span class=\"c0000FF\">【勝利】</span>";
		$kmaddc="<span class=\"c0000FF\">【敵軍撃破】</span>";
		$emaddc="<span class=\"cFF0000\">【壊走】</span>";
				}
			}else{
				if($count>$btw){
		$kaddc="$kouryakukazu ⇒ $kouryakujissuu（時間切れ）<span class=\"cFF0000\">【敗北】</span>";
		$eaddc="<span class=\"c0000FF\">【勝利】</span>（時間切れ）$boueikazu ⇒ $boueijissuu";
		$kaddc2="$kouryakukazu ⇒ $kouryakujissuu";
		$eaddc2="$boueikazu ⇒ $boueijissuu";
		$maddc="<span class=\"cFF0000\">【敗北】</span>";
		$kmaddc="<span class=\"cFF0000\">【壊走】</span>";
		$emaddc="<span class=\"c0000FF\">【防衛成功】</span>";
				}elsif($kouryakujissuu){
		$kaddc="$kouryakukazu ⇒ $kouryakujissuu（司令官敗北）<span class=\"cFF0000\">【敗北】</span>";
		$eaddc="<span class=\"c0000FF\">【勝利】</span>（司令官撃破）$boueikazu ⇒ $boueijissuu";
		$kaddc2="$kouryakukazu ⇒ $kouryakujissuu";
		$eaddc2="$boueikazu ⇒ $boueijissuu";
		$maddc="<span class=\"cFF0000\">【敗北】</span>";
		$kmaddc="<span class=\"cFF0000\">【壊走】</span>";
		$emaddc="<span class=\"c0000FF\">【防衛成功】</span>";
				}else{
		$kaddc="$kouryakukazu ⇒ $kouryakujissuu（部隊壊滅）<span class=\"cFF0000\">【敗北】</span>";
		$eaddc="<span class=\"c0000FF\">【勝利】</span>（完全勝利）$boueikazu ⇒ $boueijissuu";
		$kaddc2="$kouryakukazu ⇒ $kouryakujissuu";
		$eaddc2="$boueikazu ⇒ $boueijissuu";
		$maddc="<span class=\"cFF0000\">【敗北】</span>";
		$kmaddc="<span class=\"cFF0000\">【壊走】</span>";
		$emaddc="<span class=\"c0000FF\">【防衛成功】</span>";
				}
			}
	$countb = $count - 1;
	$countf = $count + 1;
		$mapseiseiblm .= "
<a id=\"$count\"></a>
<table width=\"750\">
<tr>
<td width=\"15\" class=\"bgcFFF0F5\" onclick=\"javascript:void(slm(-1));\">↑</td>

<td width=\"720\">
<table cellspacing=\"2\" width=\"720\" border=\"2\">
<tr>
<td width=\"340\"></td><td width=\"20\"></td><td width=\"340\"></td>
</tr>
<tr>
<td class=\"txtc\" colspan=\"3\">
<table cellspacing=\"2\" width=\"700\" border=\"2\">
<tr>
<td width=\"270\" class=\"txtr\">$kaddc</td>
<td class=\"txth\" width=\"160\"><a href=\"#$countb\">↑</a>・<a href=\"#t\">Phase<span class=\"cFF0000\">E</span></a>・<a href=\"#$countf\">↓</a></td>
<td width=\"270\">$eaddc</td>
</tr>
</table>
</td>
</tr>
<tr>
<td class=\"txtc\" width=\"340\">$k_p_k_a{$p_kunino{$f_id}}：$t_name{$ft_id}$wincomelbs3攻略軍：$kbt_namae部隊
";


					$ki = 0;
					$ei = 0;
					$add2 = 0;
						while ($ki < $kouryakukazu) {
################
		$kbp_solmrain[$ki] = int($p_heisisuu{$kbp_id[$ki]} * 100 / $kbp_solmax[$ki]);
			if($kbp_solmrain[$ki] < 1){
		$kbp_solmrain[$ki] = 1;
			}
		$kbp_solmrainc[$ki] = "<tr height=\"3\" class=\"bgc333333\"><td width=\"$kbp_solmrain[$ki]\%\" class=\"bgcFF0000\">";
			if($kbp_solmrain[$ki] > 100){
		$kbp_solmrain[$ki] = int($kbp_solmrain[$ki] -100)/10;
				if($kbp_solmrain[$ki] > 100){
			$kbp_solmrain[$ki] = 100;
				}
		$kbp_solmrainc[$ki] = "<tr height=\"3\" class=\"bgcFF0000\"><td width=\"$kbp_solmrain[$ki]\%\" class=\"bgcFFC0CB\">";
			}
################
		$kbp_hpmrain[$ki] = $p_busyou_hp{$kbp_id[$ki]};
			if($kbp_hpmrain[$ki] < 1){
		$kbp_hpmrain[$ki] = 1;
			}
		$kbp_hpmrainc[$ki] = "<tr height=\"3\" class=\"bgc333333\"><td width=\"$kbp_hpmrain[$ki]\%\" class=\"bgcFF0000\">";
			if($kbp_solmrain[$ki] > 100){
		$kbp_hpmrain[$ki] = int($kbp_hpmrain[$ki] -100)/10;
				if($kbp_hpmrain[$ki] > 100){
			$kbp_hpmrain[$ki] = 100;
				}
		$kbp_hpmrainc[$ki] = "<tr height=\"3\" class=\"bgcFF0000\"><td width=\"$kbp_hpmrain[$ki]\%\" class=\"bgcFFC0CB\">";
			}
################
		$kbp_mpmrain[$ki] = $p_busyou_mp{$kbp_id[$ki]};
			if($kbp_mpmrain[$ki] < 1){
		$kbp_mpmrain[$ki] = 1;
			}
		$kbp_mpmrainc[$ki] = "<tr height=\"3\" class=\"bgc333333\"><td width=\"$kbp_mpmrain[$ki]\%\" class=\"bgcFF0000\">";
			if($kbp_solmrain[$ki] > 100){
		$kbp_mpmrain[$ki] = int($kbp_mpmrain[$ki] -100)/10;
				if($kbp_mpmrain[$ki] > 100){
			$kbp_mpmrain[$ki] = 100;
				}
		$kbp_mpmrainc[$ki] = "<tr height=\"3\" class=\"bgcFF0000\"><td width=\"$kbp_mpmrain[$ki]\%\" class=\"bgcFFC0CB\">";
			}
################
		$kbp_spmrain[$ki] = $p_busyou_sp{$kbp_id[$ki]};
			if($kbp_spmrain[$ki] < 1){
		$kbp_spmrain[$ki] = 1;
			}
		$kbp_spmrainc[$ki] = "<tr height=\"3\" class=\"bgc333333\"><td width=\"$kbp_spmrain[$ki]\%\" class=\"bgcFF0000\">";
			if($kbp_solmrain[$ki] > 100){
		$kbp_spmrain[$ki] = int($kbp_spmrain[$ki] -100)/10;
				if($kbp_spmrain[$ki] > 100){
			$kbp_spmrain[$ki] = 100;
				}
		$kbp_spmrainc[$ki] = "<tr height=\"3\" class=\"bgcFF0000\"><td width=\"$kbp_spmrain[$ki]\%\" class=\"bgcFFC0CB\">";
			}
################
$kbp_logf[$ki]++;
											$kbp_soltg[$ki]=$p_heisisuu{$kbp_id[$ki]} - $kbp_solm[$ki];
											$kbp_solt[$ki] = $p_heisisuu{$kbp_id[$ki]};
	$kbp_soltgc[$ki] = sprintf("%+d", $kbp_soltg[$ki]);
	&IMG_B_CG_SAKUSEI("$p_img{$kbp_id[$ki]}$p_cgno{$kbp_id[$ki]}[$img_op_add{$kbp_id[$ki]}]$p_img_f{$kbp_id[$ki]}","$img_wide_d","$img_height_d","$p_img_m{$kbp_id[$ki]}","b$kbp_id[$ki]\_$kbp_logf[$ki]","$kbp_2id[$ki]","$img_op_add{$kbp_id[$ki]}","","","","","","");
		$mapseiseiblm .= "<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>
<a id=\"$kbp_id[$ki]-$count\"></a>
<table cellspacing=\"2\" width=\"330\" border=\"2\">
<tr>
<td width=\"100\"></td><td width=\"40\"></td><td width=\"40\"></td><td width=\"40\"></td><td width=\"95\"></td>
</tr>
<tr>
<td rowspan=\"4\"><a href=\"#$kbp_id[$ki]-$countf\">$img_sakusei_kekka</a>
</td>
<td class=\"txtc\" colspan=\"3\">$p_p_b_a{$kbp_id[$ki]}</td>
<td class=\"txtc\">$BUHOUSIN[$kbp_shousin1[$ki]]</td>
</tr>

<tr>
<td class=\"txtc\" colspan=\"4\"></td>
</tr>

<tr>
<td class=\"txtc\">HP:$p_busyou_hp{$kbp_id[$ki]}
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$kbp_hpmrainc[$ki]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">MP:$p_busyou_mp{$kbp_id[$ki]}
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$kbp_mpmrainc[$ki]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">SP:$p_busyou_sp{$kbp_id[$ki]}
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$kbp_spmrainc[$ki]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">$b_st_w{$kbp_id[$ki]}</td>
</tr>

<tr>
<td class=\"txtc\" colspan=\"3\">$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}] $p_heisisuu{$kbp_id[$ki]}  ($kbp_soltgc[$ki])
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$kbp_solmrainc[$ki]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">$h_st_w{$kbp_id[$ki]}</td>
</tr>
</table>
";
			if($kbp_fs[$ki]>129 and $kbp_fi[$ki]>129){
						$p_ex_buryoku{$kbp_id[$ki]}++;
			}else{
						$p_ex_tousotu{$kbp_id[$ki]}++;
			}

$p_ex_karumalc{$kbp_id[$ki]} += 0;
$p_ex_karumald{$kbp_id[$ki]} += 5;
	if($md_eria eq "1" or $md_eria eq "2" or $md_eria eq "11"){
$p_gogyou_ka{$kbp_id[$ki]} += 10;
$p_gogyou_sui{$kbp_id[$ki]} -= 15;
$p_gogyou_moku{$kbp_id[$ki]} += 0;
$p_gogyou_kin{$kbp_id[$ki]} += 0;
$p_gogyou_do{$kbp_id[$ki]} += 5;
	}elsif($md_eria eq "3" or $md_eria eq "4" or $md_eria eq "12"){
$p_gogyou_ka{$kbp_id[$ki]} += 0;
$p_gogyou_sui{$kbp_id[$ki]} += 10;
$p_gogyou_moku{$kbp_id[$ki]} += 5;
$p_gogyou_kin{$kbp_id[$ki]} += 0;
$p_gogyou_do{$kbp_id[$ki]} -= 15;
	}elsif($md_eria eq "5" or $md_eria eq "6" or $md_eria eq "13"){
$p_gogyou_ka{$kbp_id[$ki]} += 5;
$p_gogyou_sui{$kbp_id[$ki]} += 0;
$p_gogyou_moku{$kbp_id[$ki]} += 10;
$p_gogyou_kin{$kbp_id[$ki]} -= 15;
$p_gogyou_do{$kbp_id[$ki]} += 0;
	}elsif($md_eria > 20 and $md_eria < 26){
$p_gogyou_ka{$kbp_id[$ki]} -= 15;
$p_gogyou_sui{$kbp_id[$ki]} += 5;
$p_gogyou_moku{$kbp_id[$ki]} += 0;
$p_gogyou_kin{$kbp_id[$ki]} += 10;
$p_gogyou_do{$kbp_id[$ki]} += 0;
	}elsif($md_eria eq "20"){
$p_gogyou_ka{$kbp_id[$ki]} += 0;
$p_gogyou_sui{$kbp_id[$ki]} += 0;
$p_gogyou_moku{$kbp_id[$ki]} -= 15;
$p_gogyou_kin{$kbp_id[$ki]} += 5;
$p_gogyou_do{$kbp_id[$ki]} += 10;
	}
									$kbp_ex_add[$ki] = int($kbp_ex_add[$ki]*1);
										$kbp_ex_add[$ki] = int($kbp_ex_add[$ki] * 450 / $kbp_sougou[$ki]);
											$kbp_ex_add[$ki] += 30;
									if($lbflag){
										$kbp_ex_add[$ki] = int($kbp_ex_add[$ki] * 0.3);
									}
											$p_kunkou{$kbp_id[$ki]} += $kbp_ex_add[$ki];
					$ki ++;
						}
		$mapseiseiblm .= "
</td>
<td class=\"txth\" width=\"20\"><a href=\"#$count\">Vs</a></td>
<td class=\"txtc\" width=\"340\">$k_p_k_a{$p_kunino{$e_id}}：$t_name{$ft_id}$wincomelbs3防衛軍：$ebt_namae部隊

";
					$ki = 0;
					$ei = 0;
						while ($ei < $boueikazu) {
################
		$ebp_solmrain[$ei] = int($p_heisisuu{$ebp_id[$ei]} * 100 / $ebp_solmax[$ei]);
			if($ebp_solmrain[$ei] < 1){
		$ebp_solmrain[$ei] = 1;
			}
		$ebp_solmrainc[$ei] = "<tr height=\"3\" class=\"bgcDDA0DD\"><td width=\"$ebp_solmrain[$ei]\%\" class=\"bgc0000FF\">";
			if($ebp_solmrain[$ei] > 100){
		$ebp_solmrain[$ei] = int($ebp_solmrain[$ei] -100)/10;
				if($ebp_solmrain[$ei] > 100){
			$ebp_solmrain[$ei] = 100;
				}
		$ebp_solmrainc[$ei] = "<tr height=\"3\" class=\"bgc0000FF\"><td width=\"$ebp_solmrain[$ei]\%\" class=\"bgc87CEFA\">";
			}
################
		$ebp_hpmrain[$ei] = $p_busyou_hp{$ebp_id[$ei]};
			if($ebp_hpmrain[$ei] < 1){
		$ebp_hpmrain[$ei] = 1;
			}
		$ebp_hpmrainc[$ei] = "<tr height=\"3\" class=\"bgcDDA0DD\"><td width=\"$ebp_hpmrain[$ei]\%\" class=\"bgc0000FF\">";
			if($ebp_solmrain[$ei] > 100){
		$ebp_hpmrain[$ei] = int($ebp_hpmrain[$ei] -100)/10;
				if($ebp_hpmrain[$ei] > 100){
			$ebp_hpmrain[$ei] = 100;
				}
		$ebp_hpmrainc[$ei] = "<tr height=\"3\" class=\"bgc0000FF\"><td width=\"$ebp_hpmrain[$ei]\%\" class=\"bgc87CEFA\">";
			}
################
		$ebp_mpmrain[$ei] = $p_busyou_mp{$ebp_id[$ei]};
			if($ebp_mpmrain[$ei] < 1){
		$ebp_mpmrain[$ei] = 1;
			}
		$ebp_mpmrainc[$ei] = "<tr height=\"3\" class=\"bgcDDA0DD\"><td width=\"$ebp_mpmrain[$ei]\%\" class=\"bgc0000FF\">";
			if($ebp_solmrain[$ei] > 100){
		$ebp_mpmrain[$ei] = int($ebp_mpmrain[$ei] -100)/10;
				if($ebp_mpmrain[$ei] > 100){
			$ebp_mpmrain[$ei] = 100;
				}
		$ebp_mpmrainc[$ei] = "<tr height=\"3\" class=\"bgc0000FF\"><td width=\"$ebp_mpmrain[$ei]\%\" class=\"bgc87CEFA\">";
			}
################
		$ebp_spmrain[$ei] = $p_busyou_sp{$ebp_id[$ei]};
			if($ebp_spmrain[$ei] < 1){
		$ebp_spmrain[$ei] = 1;
			}
		$ebp_spmrainc[$ei] = "<tr height=\"3\" class=\"bgcDDA0DD\"><td width=\"$ebp_spmrain[$ei]\%\" class=\"bgc0000FF\">";
			if($ebp_solmrain[$ei] > 100){
		$ebp_spmrain[$ei] = int($ebp_spmrain[$ei] -100)/10;
				if($ebp_spmrain[$ei] > 100){
			$ebp_spmrain[$ei] = 100;
				}
		$ebp_spmrainc[$ei] = "<tr height=\"3\" class=\"bgc0000FF\"><td width=\"$ebp_spmrain[$ei]\%\" class=\"bgc87CEFA\">";
			}
################
$ebp_logf[$ei]++;
											$ebp_soltg[$ei]=$p_heisisuu{$ebp_id[$ei]} - $ebp_solm[$ei];
											$ebp_solt[$ei] = $p_heisisuu{$ebp_id[$ei]};
	$ebp_soltgc[$ei] = sprintf("%+d", $ebp_soltg[$ei]);
	&IMG_B_CG_SAKUSEI("$p_img{$ebp_id[$ei]}$p_cgno{$ebp_id[$ei]}[$img_op_add{$ebp_id[$ei]}]$p_img_f{$ebp_id[$ei]}","$img_wide_d","$img_height_d","$p_img_m{$ebp_id[$ei]}","b$ebp_id[$ei]\_$ebp_logf[$ei]","$ebp_2id[$ei]","$img_op_add{$ebp_id[$ei]}","","","","","","");
		$mapseiseiblm .= "<a id=\"lf-$ebp_id[$ei]-$ebp_logf[$ei]\"></a>
<a id=\"$ebp_id[$ei]-$count\"></a>
<table cellspacing=\"2\" width=\"330\" border=\"2\">
<tr>
<td width=\"100\"></td><td width=\"40\"></td><td width=\"40\"></td><td width=\"40\"></td><td width=\"95\"></td>
</tr>
<tr>
<td rowspan=\"4\"><a href=\"#$ebp_id[$ei]-$countf\">$img_sakusei_kekka</a>
</td>
<td class=\"txtc\" colspan=\"3\">$p_p_b_a{$ebp_id[$ei]}</td>
<td width=\"110\" class=\"txtc\">$BUHOUSIN[$ebp_shousin1[$ei]]</td>
</tr>

<tr>
<td class=\"txtc\" colspan=\"4\"></td>
</tr>

<tr>
<td class=\"txtc\">HP:$p_busyou_hp{$ebp_id[$ei]}
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$ebp_hpmrainc[$ei]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">MP:$p_busyou_mp{$ebp_id[$ei]}
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$ebp_mpmrainc[$ei]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">SP:$p_busyou_sp{$ebp_id[$ei]}
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$ebp_spmrainc[$ei]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">$b_st_w{$ebp_id[$ei]}</td>
</tr>

<tr>
<td class=\"txtc\" colspan=\"3\">$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}] $p_heisisuu{$ebp_id[$ei]}  ($ebp_soltgc[$ei])
<table width=\"100%\" cellspacing=\"0\" border=\"0\">
$ebp_solmrainc[$ei]</td>
<td></td></tr></table>
</td>
<td class=\"txtc\">$h_st_w{$ebp_id[$ei]}</td>
</tr>
</table>
";

			if($ebp_fs[$ei]>129 and $ebp_fi[$ei]>129){
						$p_ex_buryoku{$ebp_id[$ei]}++;
			}else{
						$p_ex_tousotu{$ebp_id[$ei]}++;
			}
$p_ex_karumalc{$ebp_id[$ei]} += 0;
$p_ex_karumald{$ebp_id[$ei]} += 10;
	if($md_eria eq "1" or $md_eria eq "2" or $md_eria eq "11"){
$p_gogyou_ka{$ebp_id[$ei]} += 10;
$p_gogyou_sui{$ebp_id[$ei]} -= 15;
$p_gogyou_moku{$ebp_id[$ei]} += 0;
$p_gogyou_kin{$ebp_id[$ei]} += 0;
$p_gogyou_do{$ebp_id[$ei]} += 5;
	}elsif($md_eria eq "3" or $md_eria eq "4" or $md_eria eq "12"){
$p_gogyou_ka{$ebp_id[$ei]} += 0;
$p_gogyou_sui{$ebp_id[$ei]} += 10;
$p_gogyou_moku{$ebp_id[$ei]} += 5;
$p_gogyou_kin{$ebp_id[$ei]} += 0;
$p_gogyou_do{$ebp_id[$ei]} -= 15;
	}elsif($md_eria eq "5" or $md_eria eq "6" or $md_eria eq "13"){
$p_gogyou_ka{$ebp_id[$ei]} += 5;
$p_gogyou_sui{$ebp_id[$ei]} += 0;
$p_gogyou_moku{$ebp_id[$ei]} += 10;
$p_gogyou_kin{$ebp_id[$ei]} -= 15;
$p_gogyou_do{$ebp_id[$ei]} += 0;
	}elsif($md_eria > 20 and $md_eria < 26){
$p_gogyou_ka{$ebp_id[$ei]} -= 15;
$p_gogyou_sui{$ebp_id[$ei]} += 5;
$p_gogyou_moku{$ebp_id[$ei]} += 0;
$p_gogyou_kin{$ebp_id[$ei]} += 10;
$p_gogyou_do{$ebp_id[$ei]} += 0;
	}elsif($md_eria eq "20"){
$p_gogyou_ka{$ebp_id[$ei]} += 0;
$p_gogyou_sui{$ebp_id[$ei]} += 0;
$p_gogyou_moku{$ebp_id[$ei]} -= 15;
$p_gogyou_kin{$ebp_id[$ei]} += 5;
$p_gogyou_do{$ebp_id[$ei]} += 10;
	}

									$ebp_ex_add[$ei] = int($ebp_ex_add[$ei]*1);
										$ebp_ex_add[$ei] = int($ebp_ex_add[$ei] * 450 / $ebp_sougou[$ei]);
										$ebp_ex_add[$ei] += 30;
										$p_kunkou{$ebp_id[$ei]} += $ebp_ex_add[$ei];
					$ei ++;
						}

		$mapseiseiblm .= "
</td></tr>
</table>

</td>
<td width=\"15\" class=\"bgcFFF0F5\" onclick=\"javascript:void(slm(1));\">↓</td>
</tr>
<tr>
<td width=\"15\" class=\"bgcFFF0F5\" onclick=\"javascript:void(slm(-1));\">↑</td>

<a id=\"$count-b\"></a>
<td width=\"720\">
<table cellspacing=\"2\" width=\"720\" border=\"2\">
<tr>
<td width=\"105\"></td><td width=\"45\"></td><td width=\"20\"></td><td width=\"35\"></td><td width=\"40\"></td><td width=\"85\"></td>
<td width=\"20\"></td>
<td width=\"85\"></td><td width=\"40\"></td><td width=\"35\"></td><td width=\"20\"></td><td width=\"45\"></td><td width=\"115\"></td>
</tr>
";

###########################################
									$bouei_adddmg = 0;
###########################################


###########################################

		$addc = "";
					$ki = 0;
					$ei = 0;
						while ($ki < $kouryakukazu) {
		$addc .= "$p_name{$kbp_id[$ki]} ";


$kbp_logf[$ki]++;
$logfc="<a id=\"lf-$kbp_id[$ki]-$kbp_logf[$ki]\"></a>";
&KWBLOGBL("$p_name{$kbp_id[$ki]}は<span class=\"cFF0000\">$kbp_ex_add[$ki]</span>の貢献を得ました。");
										if($kbp_sikikeitai ne "2"){
									$p_b_hirou{$kbp_id[$ki]} += $SKHIROU[$p_jintousiki{$kbp_id[$ki]}] + $BHHIROU[$kbp_shousin1[$ki]];
										}
									$p_b_hirou{$kbp_id[$ki]} += $BKHIROU[$p_b_kougun{$kbp_id[$ki]}];
									$p_h_hirou{$kbp_id[$ki]} += 1;



							if($kbp_fsf[$ki] == 1){
$p_pet_type{$kbp_id[$ki]}[0] = int($kbp_f16v[$ki]);
$p_pet_name{$kbp_id[$ki]}[0] = $jyuu[$p_pet_type{$kbp_id[$ki]}[0]];
							}
				$kex_add += $kbp_ex_add[$ki];
					$ki ++;
					}
		$addc .= "《 Vs 》";
###########################################
					$ki = 0;
					$ei = 0;
						while ($ei < $boueikazu) {
		$addc .= "$p_name{$ebp_id[$ei]} ";
									if(!$battle_end){

$ebp_logf[$ei]++;
$logfc="<a id=\"lf-$ebp_id[$ei]-$ebp_logf[$ei]\"></a>";
&EWBLOGBL("$p_name{$ebp_id[$ei]}は<span class=\"cFF0000\">$ebp_ex_add[$ei]</span>の貢献を得ました。");
								if(int($cd_op1 / 10) eq "8" and $p_heisisuu{$ebp_id[$ei]}>0){
									if(!int(rand(5))){
									$ebp_gold_add[$ei] = $ebp_ex_add[$ei] * 20;
									$p_syoji_kin{$ebp_id[$ei]} += $ebp_gold_add[$ei];

	$w_id=$p_id{$ebp_id[$ei]};&P_LOG_W("$p_name{$ebp_id[$ei]}は敵部隊を蹴散らし、<br />捕虜の兵士から戦利品として金<span class=\"c0000FF\">$ebp_gold_add[$ei]</span>相当の装備品を奪い取りました。<br />闇市場にて換金致します。");
									}
								}
										if($ebp_id[$ei] ne ""){

										if($ebp_sikikeitai[$ei] ne "2"){
									$p_b_hirou{$ebp_id[$ei]} += $SKHIROU[$p_jintousiki{$ebp_id[$ei]}] + $BHHIROU[$ebp_shousin1[$ei]];
										}
									$p_h_hirou{$ebp_id[$ei]} += 1;


										}

									}else{
									$bouei_adddmg += $p_heisisuu{$ebp_id[$ei]} - 1;
									}

									

							if($ebp_fsf[$ei] == 1 and length($ebp_id[$ei]) > 3){

$p_pet_type{$ebp_id[$ei]}[0] = int($ebp_f16v[$ei]);
$p_pet_name{$ebp_id[$ei]}[0] = $jyuu[$p_pet_type{$ebp_id[$ei]}[0]];

							}
					$ei ++;
					}
###########################################

									$bouei_adddmg = $bouei_add3 - $bouei_adddmg;

							if($bouei_adddmg < 1){
									$bouei_adddmg = 0;
							}
										$ki = 0;
										$ei = 0;



###########################################
									if($win){
#				if($krrkkai == 1){
				$add_kousin_s{$f_id} = $p_h_kousin_s{$f_id};
#				}

###########################################
										if($battle_end){

									$kabebkn = 0;
									$wincomelb1 = "";
									$wincomelb2 = "";
			if(int($cd_op1 / 10) eq "9"){
									$add = $bouei_add2 -$bouei_adddmg;
									$bouei_add2 -= $bouei_adddmg;
									$add2 = $bouei_add2;
									if($add2 < 1){
									$add2 = 1;
									}
									$bouei_add2 -=  int((int($add / 10000) * 10000 * $bouei_adddmg) / $add2);
									$bouei_add = int($bouei_add2 / 30);
									if($bouei_add > 700 * $bouei_add_hosei){
									$t_siro_bouei_ti{$ft_id} = int(($bouei_add - 700 * $bouei_add_hosei) * 5)+1000 * $bouei_add_hosei;
									}elsif($bouei_add > 500 * $bouei_add_hosei){
									$t_siro_bouei_ti{$ft_id} = int(($bouei_add - 500 * $bouei_add_hosei) * 2.5)+500 * $bouei_add_hosei;
									}else{
									$t_siro_bouei_ti{$ft_id} = $bouei_add;
									}
									if($t_siro_bouei_ti{$ft_id} < 1){
												$t_zokuno{$ft_id} = 0;
									$t_siro_bouei_ti{$ft_id} = 0;
									$kabebkn = 2;
											$krrk += 100;
									}
										$t_siro_taikyuu_ti{$ft_id} -= int($kex_add * 150 / $p_sougou{$f_id});
										if($t_siro_taikyuu_ti{$ft_id} < 0){
											$t_siro_taikyuu_ti{$ft_id}=0;
										}
										$kex_add = int($kex_add * 0.3);
							$kgetm = int($t_ryoumin_suu{$ft_id} / 5);
									$wincomelb1 = "城内";
									$wincomelb2 = "の城";
										$boueizanc = "防衛力$boueizanc⇒$t_siro_bouei_ti{$ft_id}。";

									if(!int(rand(5))){
									$add_1 = $kex_add * 100;
									$p_syoji_kin{$f_id} += $add_1;
		&K1LOGBL("城内の一角を守備していた衛兵部隊を蹴散らし、城の金庫から金<span class=\"c0000FF\">$add_1</span>を奪い取りました。");
									}

			}elsif(int($cd_op1 / 10) eq "8"){
									$add = $bouei_add2 -$bouei_adddmg;
									$bouei_add2 -= $bouei_adddmg;
									$add2 = $bouei_add2;
									if($add2 < 1){
									$add2 = 1;
									}
									$bouei_add2 -=  int((int($add / 10000) * 10000 * $bouei_adddmg) / $add2);
									$bouei_add = int($bouei_add2 / 30);
									if($bouei_add > 700 * $bouei_add_hosei){
									$t_zoku_bouei_ti{$ft_id} = int(($bouei_add - 700 * $bouei_add_hosei) * 5)+1000 * $bouei_add_hosei;
									}elsif($bouei_add > 500 * $bouei_add_hosei){
									$t_zoku_bouei_ti{$ft_id} = int(($bouei_add - 500 * $bouei_add_hosei) * 2.5)+500 * $bouei_add_hosei;
									}else{
									$t_zoku_bouei_ti{$ft_id} = $bouei_add;
									}


										$t_zoku_taikyuu_ti{$ft_id} -= int($kex_add * 150 / $p_sougou{$f_id});
										if($t_zoku_taikyuu_ti{$ft_id} < 0){
											$t_zoku_taikyuu_ti{$ft_id}=0;
										}
										$kex_add = int($kex_add * 0.3);
							$kgetm = int(rand(3000)) + 3000;
									if($t_zoku_bouei_ti{$ft_id} < 1){
												$t_zoku_bouei_ti{$ft_id} = 0;
									$kabebkn = 3;
											$krrk += 100;
									}
									$wincomelb1 = "賊砦";
									$wincomelb2 = "の賊砦";
										$boueizanc = "防衛力$boueizanc⇒$t_zoku_bouei_ti{$ft_id}。";

									if(!int(rand(5))){
									$add_1 = $kex_add * 20;
									$p_syoji_kin{$f_id} += $add_1;
		&K1LOGBL("賊の１部隊を蹴散らし、蓄えていた金<span class=\"c0000FF\">$add_1</span>を奪い取りました。");
									}
			}else{
									$add = $bouei_add2 -$bouei_adddmg;
									$bouei_add2 -= $bouei_adddmg;
									$add2 = $bouei_add2;
									if($add2 < 1){
									$add2 = 1;
									}
									$bouei_add2 -=  int((int($add / 10000) * 10000 * $bouei_adddmg) / $add2);
									$bouei_add = int($bouei_add2 / 1);
									if($bouei_add > 700 * $bouei_add_hosei){
									$t_siro_bouei_ti{$ft_id} = int(($bouei_add - 700 * $bouei_add_hosei) * 5)+1000 * $bouei_add_hosei;
									}elsif($bouei_add > 500 * $bouei_add_hosei){
									$t_siro_bouei_ti{$ft_id} = int(($bouei_add - 500 * $bouei_add_hosei) * 2.5)+500 * $bouei_add_hosei;
									}else{
									$t_siro_bouei_ti{$ft_id} = $bouei_add;
									}
									if($t_siro_bouei_ti{$ft_id} < 1){
									$t_siro_bouei_ti{$ft_id} = 0;
									$kabebkn = 1;
											$krrk += 100;
									}
										$t_siro_taikyuu_ti{$ft_id} -= int($kex_add * 150 / $p_sougou{$f_id});
										if($t_siro_taikyuu_ti{$ft_id} < 0){
											$t_siro_taikyuu_ti{$ft_id}=0;
										}
							$kgetm = int($t_ryoumin_suu{$ft_id} / 5);
									$wincomelb1 = "城内";
									$wincomelb2 = "の城";
										$boueizanc = "防衛力$boueizanc⇒$t_siro_bouei_ti{$ft_id}。";
			}
										}

										if($battle_end and $kabebkn){
												$add_e_kuni = $p_kunino{$e_id};
												$kspos = $p_taizai_iti{$f_id};
	if(-e "./$mpg_r/sub_db/td/$kspos.$cd_op2.pl" or $kabebkn > 1){
												$t_kunino{$ft_id} = $p_kunino{$f_id};
	}else{
												$t_kunino{$ft_id} = 0;
	}
							$kgetmw = int($t_ryoumin_suu{$ft_id} / 70000);
							$kgetmw2 = 11;
												$kgetmw3 = ($kgetmw + 1) * 70;
												$p_kunkou{$f_id} += $kgetmw3;

										if($t_ryoumin_suu{$ft_id} < 100000){
							$kgetmw2 += int((100000 - $t_ryoumin_suu{$ft_id})/1000);
										}
										if($kgetmw > 9){
							$kgetmw = 10;
										}
										if($kabebkn == 3){
							$kgetmw2 = int($kgetmw2 * 10);
										}
			if(4 > int(rand($kgetmw2 - $kgetmw))){
							$kitw = int(rand(10));
							$kitw = "9$kitw";
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id} $wincomelb1制圧の最中、宝物庫に眠っていた<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");

							&K1LOGBL("$wincomelb1制圧中に、<span class=\"c0000FF\">$t_name{$ft_id}</span> 宝物庫に眠っていた<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました！");
			}

							$k_kokko_sougaku{$p_kunino{$f_id}} += $kgetm;
							&K1LOGBL("一番手柄の功績として、$p_name{$f_id}の勲功値が「<span class=\"c0000FF\">$kgetmw3</span>」上昇しました。<br /><span class=\"c0000FF\">$t_name{$ft_id}</span>を陥落させた戦利金として、金$kgetmが国庫に納入されました。");

	if($t_kunino{$ft_id} eq $p_kunino{$f_id}){$hantei = "tmrk$p_taizai_iti{$f_id}";
	}elsif($t_zokuno{$ft_id} and $t_zokuno{$ft_id} eq $p_kunino{$f_id}){$hantei = "tmrz$p_taizai_iti{$f_id}";
	}else{$hantei = "tmrx$p_taizai_iti{$f_id}";
	}

#										if($k_yakusyoku_id{$fk_id}[26] ne ""){									

#	$w_id=$p_id{$k_yakusyoku_id{$fk_id}[26]};&P_LOG_W("<span class=\"c0000FF\">$t_name{$ft_id}$wincomelb2</span>を陥落させた戦利金として、金$kgetmが国庫に納入されました。");
#										}
										if($kabebkn eq "1"){	
												$t_siro_bouei_ti{$ft_id} = 1;
												$t_nougyou_ti{$ft_id} = int($t_nougyou_ti{$ft_id}*0.8);
												$t_syougyou_ti{$ft_id} = int($t_syougyou_ti{$ft_id}*0.8);
												$t_ryoumin_suu{$ft_id} = int($t_ryoumin_suu{$ft_id}*0.4);
												$t_gijyutu_ti{$ft_id} = int($t_gijyutu_ti{$ft_id}*0.8);
												$t_siro_taikyuu_ti{$ft_id} = 0;
												$t_tian_ti{$ft_id} = int($t_tian_ti{$ft_id}*0.5);
	if(-e "./$mpg_r/sub_db/td/$kspos.$cd_op2.pl"){
												$p_taizai_iti{$f_id} = $cd_op2;
						$defaddpos = "20";
						$defadditi = "$p_taizai_iti{$f_id}";
						$defaddid = "$f_id";
						$defaddname = "$p_name{$f_id}";
						$defaddcon = "$p_kunino{$f_id}";
						$defaddhei = "$p_heisyu{$f_id}";
						$defadddbdb8 = "$p_syubi_eria{$f_id}";
						$defadddbdb9 = "$p_syubi_tosi{$f_id}";
						&DEF_M;
$kdbdb1 = "$t_name[$p_taizai_iti{$f_id}] $senno[20] ";
$p_syubi_tosi{$f_id} = $p_taizai_iti{$f_id};
$p_syubi_eria{$f_id} = 20;

	}
										}elsif($kabebkn eq "2"){
												$t_siro_bouei_ti{$ft_id} = 1;
												$t_nougyou_ti{$ft_id} = int($t_nougyou_ti{$ft_id}*0.8);
												$t_syougyou_ti{$ft_id} = int($t_syougyou_ti{$ft_id}*0.8);
												$t_ryoumin_suu{$ft_id} = int($t_ryoumin_suu{$ft_id}*0.4);
												$t_gijyutu_ti{$ft_id} = int($t_gijyutu_ti{$ft_id}*0.8);
												$t_siro_taikyuu_ti{$ft_id} = 0;
												$t_tian_ti{$ft_id} = int($t_tian_ti{$ft_id}*0.5);
												$t_zokuno{$ft_id} = 0;
												$p_taizai_iti{$f_id} = $cd_op2;

	foreach(@p_db_all_l){
			$d_id = $_;

												if($p_kunino{$d_id} eq $p_kunino{$f_id} and -e "./p_db/p/$p_id{$d_id}.cgi"){


						$defaddpos = "20";
						$defadditi = "$p_taizai_iti{$f_id}";
						$defaddid = "$p_id{$d_id}";
						$defaddname = "$p_name{$d_id}";
						$defaddcon = "$p_kunino{$d_id}";
						$defaddhei = "$p_heisyu{$d_id}";
						$defadddbdb8 = "$p_syubi_eria{$d_id}";
						$defadddbdb9 = "$p_syubi_tosi{$d_id}";
						&DEF_M;
$ddbdb1 = "$t_name[$p_taizai_iti{$f_id}] $senno[20] ";
$p_syubi_tosi{$d_id} = $p_taizai_iti{$f_id};
$p_syubi_eria{$d_id} = 20;


												}
	}
										}elsif($kabebkn eq "3"){
												$t_zoku_bouei_ti{$ft_id} = 3000;
												$t_zoku_taikyuu_ti{$ft_id} = $t_zoku_taikyuu_max{$ft_id};
												$t_zokuno{$ft_id} = 0;
										}


#	&T_SAVE("tosi_db","$ft_id","$ft_id");
												&RIKAUNTO;


									$vtcome = "る。";
									$vtcome2 = "る。";
				if($town_get[$p_kunino{$e_id}] <= 0){
	open(IN,"./pr/k/$p_kunino{$f_id}.cgi");
	@KUNI_PR = <IN>;
	close(IN);
	($hnof,$p_kuni_touyoubun{$p_kunino{$f_id}}) = split(/<>/,$KUNI_PR[7]);
				if($p_kunino{$e_id}){
									$vtcome = "、$k_name_d[$p_kunino{$e_id}]との戦いに終止符を打つ。";
									$vtcome2 = "、$k_name_d[$p_kunino{$e_id}]は滅亡の道を辿る。";
				}else{
									$vtcome = "る。";
									$vtcome2 = "る。";
				}
				}else{
		$fk_id = $p_kunino{$e_id};
			if($cd_op2 eq $k_outo{$fk_id}){
		$dt_id = 0;
		$zhit = 0;
		$hit = "";
		$thit = 0;
	while ($dt_id<$tosi_kazu) {
			if($p_kunino{$e_id} eq $t_kunino{$dt_id} and int($t_hanei{$dt_id} * $t_ryoumin_suu{$dt_id}) >= $zhit){
		$zhit = $t_hanei{$dt_id} * $t_ryoumin_suu{$dt_id};
		$hit = $dt_id;
			}
		$dt_id ++;
	}
	$ttid = "klog/$p_kunino{$e_id}";
	&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$e_id}}は$k_p_k_a{$p_kunino{$f_id}}に王都$t_name[$k_outo{$fk_id}]を落とされました。。天子$k_tensi_name{$p_kunino{$e_id}}は$t_name[$hit]を新しい王都として定め反撃の機を伺う模様です。");
	&MAP_LOG2("<span class=\"cFF0000\">【王都陥落】</span>\[$old_date\]$k_p_k_a{$p_kunino{$e_id}}は$k_p_k_a{$p_kunino{$f_id}}に王都$t_name[$k_outo{$fk_id}]を落とされました。。天子$k_tensi_name{$p_kunino{$e_id}}は$t_name[$hit]を新しい王都として定め反撃の機を伺う模様です。");
	&M2AP_LOG("<span class=\"cFF0000\">【王都陥落】</span>\[$old_date\]$k_p_k_a{$p_kunino{$e_id}}は$k_p_k_a{$p_kunino{$f_id}}に王都$t_name[$k_outo{$fk_id}]を落とされました。。天子$k_tensi_name{$p_kunino{$e_id}}は$t_name[$hit]を新しい王都として定め反撃の機を伺う模様です。");

		$t_siro_bouei_ti{$ft_id} = 300;
$k_kokko_sougaku{$p_kunino{$e_id}} -= int($k_kokko_sougaku{$p_kunino{$e_id}} * 0.2);
$k_kokko_sougaku{$p_kunino{$f_id}} += int($k_kokko_sougaku{$p_kunino{$e_id}} * 0.1);
		$k_outo{$ek_id} = $hit;
		$k_kokui{$ek_id} -= 5;
			if($k_kokui{$ek_id} < 0){
		$k_kokui{$ek_id} = 0;
			}
	

			}
		$fk_id = $p_kunino{$f_id};

				}
	$w_id=$p_id{$kbp_id[$ki]};&P_LOG_W("<span class=\"c0000FF\">$t_name{$ft_id}$wincomelb2</span>を陥落させ、<span class=\"cFF0000\">$kgetmw3</span>の貢献値を得ました！");
									$ttid = "blog/$f_id";
									$ttcome = "";
										if("$p_name{$e_id}" ne "城壁" and $kabebkn == 1){
									$ttcome = "$p_name{$e_id}を破り、";
										}
									&PRLOG("\[$old_date\]$SOL_TYPE[$p_heisyu{$f_id}]部隊を率いて$ttcome$k_p_k_a{$p_kunino{$e_id}}の$t_name{$ft_id}$wincomelb2を陥落させ$vtcome");
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$e_id}}の$t_name{$ft_id}$wincomelb2を陥落させ$vtcome");

	if(-e "./$mpg_r/sub_db/td/$kspos.$cd_op2.pl" and $kabebkn == 1){
									$ttid = "klog/$p_kunino{$e_id}";
									&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}に$t_name{$ft_id}$wincomelb2を奪われ$vtcome2");
											&MAP_LOG2("<span class=\"c0000FF\">【都市占領】</span>\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$p_p_b_a{$f_id}は、$k_p_k_a{$p_kunino{$e_id}}領 $t_name{$ft_id} を支配しました。");
											&M2AP_LOG("<span class=\"c0000FF\">【都市占領】</span>\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$p_p_b_a{$f_id}は、$k_p_k_a{$p_kunino{$e_id}}領 $t_name{$ft_id} を支配しました。");
		unlink("./w_db/mati/tyouheihit$ft_id.cgi");
	foreach(@{$t_setuzoku_saki{$ft_id}}){
		if("$_" ne ""){
		unlink("./w_db/mati/tyouheihit$_.cgi");
		}
	}
	}elsif($kabebkn == 2){
									$ttid = "klog/$p_kunino{$e_id}";
									&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}に$t_name{$ft_id}$wincomelb2を奪われ$vtcome2");
											if($k_kokka_keitai{$fk_id} eq "1"){
											&MAP_LOG2("<span class=\"c0000FF\">【都市占領】</span>\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$p_p_b_a{$f_id}は、$k_p_k_a{$p_kunino{$e_id}}領 $t_name{$ft_id} を占領しました。");
											&M2AP_LOG("<span class=\"c0000FF\">【都市占領】</span>\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$p_p_b_a{$f_id}は、$k_p_k_a{$p_kunino{$e_id}}領 $t_name{$ft_id} を占領しました。");
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]天子：$k_tensi_name{$p_kunino{$f_id}}を擁立し、$t_name{$ft_id} に<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$p_kunino{$f_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_name_k{$fk_id}</span></a>を建国。");
											&MAP_LOG2("<span class=\"c0000FF\">【建国】</span>\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}は天子：$k_tensi_name{$p_kunino{$f_id}}を擁立し、$t_name{$ft_id} に<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$p_kunino{$f_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_name_k{$fk_id}</span></a>を建国しました。");
											&M2AP_LOG("<span class=\"c0000FF\">【建国】</span>\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}は天子：$k_tensi_name{$p_kunino{$f_id}}を擁立し、$t_name{$ft_id} に<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$p_kunino{$f_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_name_k{$fk_id}</span></a>を建国しました。");
									$k_name{$fk_id} = $k_name_k{$fk_id};
									$k_name_d{$fk_id} = $k_name_k{$fk_id};
											}elsif($k_kokka_keitai{$fk_id} eq "2"){
$k_kokui{$p_kunino{$f_id}} += 10;
											&MAP_LOG2("<span class=\"c0000FF\">【都市占領】</span>\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$p_p_b_a{$f_id}は、$k_p_k_a{$p_kunino{$e_id}}領 $t_name{$ft_id} を占領しました。");
											&M2AP_LOG("<span class=\"c0000FF\">【都市占領】</span>\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$p_p_b_a{$f_id}は、$k_p_k_a{$p_kunino{$e_id}}領 $t_name{$ft_id} を占領しました。");
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]天子：$k_tensi_name{$p_kunino{$f_id}}を擁立し、$t_name{$ft_id} に<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$p_kunino{$f_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_name_k{$fk_id}</span></a>を再興。");
											&MAP_LOG2("<span class=\"c0000FF\">【国家再興】</span>\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}は天子：$k_tensi_name{$p_kunino{$f_id}}を擁立し、$t_name{$ft_id} に<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$p_kunino{$f_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_name_k{$fk_id}</span></a>を再興しました。");
											&M2AP_LOG("<span class=\"c0000FF\">【国家再興】</span>\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}は天子：$k_tensi_name{$p_kunino{$f_id}}を擁立し、$t_name{$ft_id} に<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$p_kunino{$f_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_name_k{$fk_id}</span></a>を再興しました。");
											}else{
											&MAP_LOG2("<span class=\"c0000FF\">【都市占領】</span>\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$p_p_b_a{$f_id}は、$k_p_k_a{$p_kunino{$e_id}}領 $t_name{$ft_id} を占領しました。");
											&M2AP_LOG("<span class=\"c0000FF\">【都市占領】</span>\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$p_p_b_a{$f_id}は、$k_p_k_a{$p_kunino{$e_id}}領 $t_name{$ft_id} を占領しました。");
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]天子：$k_tensi_name{$p_kunino{$f_id}}を擁立し、$t_name{$ft_id} に<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$p_kunino{$f_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_name_k{$fk_id}</span></a>を建国。");
											&MAP_LOG2("<span class=\"c0000FF\">【建国】</span>\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}は天子：$k_tensi_name{$p_kunino{$f_id}}を擁立し、$t_name{$ft_id} に<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$p_kunino{$f_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_name_k{$fk_id}</span></a>を建国しました。");
											&M2AP_LOG("<span class=\"c0000FF\">【建国】</span>\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}は天子：$k_tensi_name{$p_kunino{$f_id}}を擁立し、$t_name{$ft_id} に<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$p_kunino{$f_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$k_name_k{$fk_id}</span></a>を建国しました。");
									$k_name{$fk_id} = $k_name_k{$fk_id};
									$k_name_d{$fk_id} = $k_name_k{$fk_id};
											}
							$add_kousen_hit=0;
	$k_kousen_aite_name{$fk_id} = "";
		$k_name_d[0] = "";
	foreach(@{$k_kousen_aite_k{$fk_id}}){
							$add_no=int($_);
							$add_no=$k_kunino{$add_no};
		if($add_no){
	$k_kousen_aite_name{$fk_id} .= "『$k_p_k_a{$add_no}』";
		}
							$add_kousen_hit+=$add_no;
	}
		$k_name_d[0] = "無所属";

		if($add_kousen_hit < 1){
			$k_kousen_aite_name{$fk_id} = "無し";
		}
						if($k_kokusaku{$k_kunino{$fk_id}} eq "10"){
	$k_kousen_aite_name{$fk_id} = "全ての国";
						}
									$k_kokka_keitai{$fk_id} = 0;
												$t_zokuno{$ft_id} = 0;
	foreach(@p_db_all_l){
			$d_id = $_;
			if($p_kunino{$d_id} eq $fk_id){
$p_kunizokusei{$f_id} = 0;
		$ttid = "blog/$p_id{$d_id}";
		&PRLOG("\[$old_date\]仕官先の$k_p_k_a{$fk_id}が$t_name[$ft_id]の城を占拠する。");
												if(-e "./p_db/p/$p_id{$d_id}.cgi" and $p_heisisuu{$d_id}){


						$defaddpos = "20";
						$defadditi = "$ft_id";
						$defaddid = "$p_id{$d_id}";
						$defaddname = "$p_name{$d_id}";
						$defaddcon = "$p_kunino{$d_id}";
						$defaddhei = "$p_heisyu{$d_id}";
						$defadddbdb8 = "$p_syubi_eria{$d_id}";
						$defadddbdb9 = "$p_syubi_tosi{$d_id}";
						&DEF_M;
$ddbdb1 = "$t_name[$ft_id] $senno[20] ";
$p_syubi_tosi{$d_id} = $ft_id;
$p_syubi_eria{$d_id} = 20;

												}
			}

	}
			$d_id = "";
		$ek_id = $p_kunino{$e_id};

		$senhit3=0;
		&KOUSEN_AITE_HIT("$senhit3","$k_kunino{$fk_id}","$ek_id");
		$senhit3=$kousen_aite_hit;
		$tyohit_add{$k_kokusaku{$fk_id}}=$senhit3;
		$tyohit_add{10}=1;
		$senhit3=$tyohit_add{$k_kokusaku{$k_kunino{$fk_id}}};
												if($k_kunino{$fk_id} and $ek_id and !$senhit3){
											&CAUNTA;
												}
		unlink("./w_db/mati/tyouheihit$ft_id.cgi");
	foreach(@{$t_setuzoku_saki{$ft_id}}){
		if("$_" ne ""){
		unlink("./w_db/mati/tyouheihit$_.cgi");
		}
	}
	}elsif($kabebkn == 3){
									$ttid = "klog/$p_kunino{$e_id}";
									&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}に$t_name{$ft_id}$wincomelb2を奪われ$vtcome2");
											&MAP_LOG2("<span class=\"c0000FF\">【賊退治】</span>\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$p_p_b_a{$f_id}は、$t_name{$ft_id} の賊砦を制圧しました。");
											&M2AP_LOG("<span class=\"c0000FF\">【賊退治】</span>\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$p_p_b_a{$f_id}は、$t_name{$ft_id} の賊砦を制圧しました。");
	}else{
												$t_siro_bouei_ti{$ft_id} = 300;
												$t_siro_taikyuu_ti{$ft_id} = 500;
												$t_tian_ti{$ft_id} = 70;
									$ttid = "klog/$p_kunino{$e_id}";
									&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}に$t_name{$ft_id}を奪われ$vtcome2敵軍は武将を伴ってないため都市を占領できず、$t_name{$ft_id}は空白地となる。");
											&MAP_LOG2("<span class=\"c0000FF\">【都市陥落】</span>\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$p_p_b_a{$f_id}の$SOL_TYPE[$p_heisyu{$f_id}]部隊は、$k_p_k_a{$p_kunino{$e_id}}領 $t_name{$ft_id} を陥落させる。");
											&M2AP_LOG("<span class=\"c0000FF\">【都市陥落】</span>\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}の$p_p_b_a{$f_id}の$SOL_TYPE[$p_heisyu{$f_id}]部隊は、$k_p_k_a{$p_kunino{$e_id}}領 $t_name{$ft_id} を陥落させる。");
											&MAP_LOG2("<span class=\"cFF0000\">【空白地化】</span>\[$old_date\]占領軍は武将を伴っていなかったため、統治に失敗し $t_name{$ft_id} は空白地化しました。");
											&M2AP_LOG("<span class=\"cFF0000\">【空白地化】</span>\[$old_date\]占領軍は武将を伴っていなかったため、統治に失敗し $t_name{$ft_id} は空白地化しました。");
	}

									if($kf16v ne $ef16 and $ef16 ne "" and $kfvhit){
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}攻略戦・戦場で$kfvhitの巻物を発見。部隊に神獣：$kfvhitが加わる。");
	$w_id=$p_id{$kbp_id[$ki]};&P_LOG_W("$p_name{$f_id}は戦場で$kfvhitの巻物を発見した！！<br />$p_name{$f_id}は$kfvhitを従えることに成功した。$p_name{$f_id}の部隊に神獣：$kfvhitが加わりました！！！");
										&M2AP_LOG("$p_p_b_a{$f_id}は$kfvhit守護城壁を打ち破り、$kfvhitの巻物を発見しました！！");
$p_pet_type{$f_id}[0] = int($ef16);
$p_pet_name{$f_id}[0] = $jyuu[$p_pet_type{$f_id}[0]];
									}

	$zcc=0;
	foreach(@town_get){
	if($zcc){
	if($_ > $tosinokazu2){
		$kousinjyoutai = 999;
	}elsif($_ > 37 and $kousinjyoutai < 10){
		$kousinjyoutai = 9;
	}elsif($_ > 33 and $kousinjyoutai < 9){
		$kousinjyoutai = 8;
	}elsif($_ > 29 and $kousinjyoutai < 8){
		$kousinjyoutai = 7;
	}elsif($_ > 25 and $kousinjyoutai < 7){
		$kousinjyoutai = 6;
	}elsif($_ > 21 and $kousinjyoutai < 6){
		$kousinjyoutai = 5;
	}elsif($_ > 17 and $kousinjyoutai < 5){
		$kousinjyoutai = 4;
	}elsif($_ > 13 and $kousinjyoutai < 4){
		$kousinjyoutai = 3;
	}elsif($_ > 9 and $kousinjyoutai < 3){
		$kousinjyoutai = 2;
	}
	}
		$zcc++;
	}
splice( @JJM, 0, 1, "$keika_nen<>$tuki_genzai<>$m_tt<>$kousinjyoutai<>$tenkakaisuu<>$outyou<>$seibento1<>$seibento2<>$syuminzoku<>$msyuto<>$kaisinen<>$zenkaisinen<>$touitunen<>$sinkouminzoku1<>$sinkouminzoku2<>$zentensimei<><><><><>\n");

												if($town_get[$add_e_kuni] < $k_zenki_tosisuu{$add_e_kuni}){
											if(!$town_get[$p_kunino{$e_id}]){
							$k_kokusaku{$add_e_kuni} = 0;
											}
											if($k_kouryaku_mokuhyou{$add_e_kuni}[0] and $k_kouryaku_mokuhyou{$add_e_kuni}[0] ne "3"  and $k_kouryaku_mokuhyou{$add_e_kuni}[0] ne "4" and $k_kouryaku_mokuhyou{$add_e_kuni}[0] ne "13" and $k_kanraku_hantei{$add_e_kuni} ne "11"){
									$ttid = "klog/$p_kunino{$e_id}";
									&PRLOG("\[$old_date\]$t_name{$ft_id}を奪われた為、領土数が前期の$k_zenki_tosisuu{$add_e_kuni}を割り込んでしまい、攻略目標の達成に失敗致しました。。");

											}
							$k_kanraku_hantei{$add_e_kuni} = 11;

												}
											if($town_get[$p_kunino{$e_id}] <= 0 and $p_kunino{$e_id}){

		$hit = "";
		$dt_id = "";
		$zhit = 0;
	foreach(@{$t_setuzoku_saki{$ft_id}}){
			$dt_id = $_;
			if($dt_id ne "" and $k_kunino{$fk_id} ne $k_kunino{$t_kunino{$dt_id}} and !$k_kunino{$t_zokuno{$dt_id}} and int($t_hanei{$dt_id} * $t_ryoumin_suu{$dt_id}) >= $zhit){
		$zhit = $t_hanei{$dt_id} * $t_ryoumin_suu{$dt_id};
		$hit = $dt_id;
			}
	}
		$dt_id = "";
		$zhit = 0;
	foreach(@{$t_setuzoku_saki{$ft_id}}){
			$dt_id = $_;
			if($dt_id ne "" and !$k_kunino{$t_zokuno{$dt_id}} and int($t_hanei{$dt_id} * $t_ryoumin_suu{$dt_id}) >= $zhit){
		$zhit = $t_hanei{$dt_id} * $t_ryoumin_suu{$dt_id};
		$hit = $dt_id;
			}
	}
			if(!$k_kunino{$t_zokuno{$ft_id}}){
		$hit = $ft_id;
			}
						if($hit ne "" and !$k_kokka_keitai{$p_kunino{$e_id}}){
		$k_outo{$p_kunino{$e_id}} = $hit;
$k_kokka_keitai{$p_kunino{$e_id}}=2;
$k_kokui{$p_kunino{$e_id}} -= 10;
						if($k_kokui{$p_kunino{$e_id}} < 0){
$k_kokui{$p_kunino{$e_id}} = 0;
						}
		$t_zokuno{$hit} = $p_kunino{$e_id};
$k_kokko_sougaku{$p_kunino{$e_id}} -= int($k_kokko_sougaku{$p_kunino{$e_id}} * 0.4);
$k_kokko_sougaku{$p_kunino{$f_id}} += int($k_kokko_sougaku{$p_kunino{$e_id}} * 0.2);
		$t_siro_bouei_ti{$ft_id} = 300;
									$ttid = "klog/$p_kunino{$e_id}";
									&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$e_id}}は領土を失いました。。天子$k_tensi_name{$p_kunino{$e_id}}は$t_name[$hit]の賊砦に落ち延び、反撃の機を伺う模様です。");
												&MAP_LOG2("<span class=\"cFF0000\">【領土喪失】</span>\[$old_date\]$k_p_k_a{$p_kunino{$e_id}}は領土を失いました。。天子$k_tensi_name{$p_kunino{$e_id}}は$t_name[$hit]の賊砦に落ち延び、機を伺う模様です。");
												&M2AP_LOG("<span class=\"cFF0000\">【領土喪失】</span>\[$old_date\]$k_p_k_a{$p_kunino{$e_id}}は領土を失いました。。天子$k_tensi_name{$p_kunino{$e_id}}は$t_name[$hit]の賊砦に落ち延び、機を伺う模様です。");


	foreach(@p_db_all_l){
			$d_id = $_;
			if($p_kunino{$d_id} eq $add_e_kuni){
					if($p_kuni_touyoubun{$p_kunino{$f_id}}){
							@MES_REG2 = ();
							open(IN,"./w_db/jyusin/m_$p_id{$d_id}.cgi");
							@MES_REG2 = <IN>;
							close(IN);
#$k_tensi_id{$fk_id}
							unshift(@MES_REG2,"$p_id{$d_id}<>$f_id<>$p_taizai_iti{$f_id}<>$k_tensi_name{$p_kunino{$f_id}}<><a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$p_kunino{$f_id}\" target=\"_blank\"><span class=\"cFFFFFF\">$k_name{$fk_id}</span></a>の使者:$p_kuni_touyoubun{$p_kunino{$f_id}}$tt_date<>$p_name{$d_id}<>$p_cg_sabano{$k_tensi_id{$fk_id}}<>$p_img{$k_tensi_id{$fk_id}}$p_img_f{$k_tensi_id{$fk_id}}<>$p_kunino{$f_id}<>0<>$tt<>\n");
splice(@MES_REG2,10);
							open(OUT,">./w_db/jyusin/m_$p_id{$d_id}.cgi");
							print OUT @MES_REG2;
							close(OUT);
					}
$p_kunizokusei{$f_id} = 2;
		$ttid = "blog/$p_id{$d_id}";
		&PRLOG("\[$old_date\]仕官先の$k_p_k_a{$add_e_kuni}が領土を失い、$t_name[$hit]の賊砦に落ち延びる。");
												if(-e "./p_db/p/$p_id{$d_id}.cgi" and $p_heisisuu{$d_id}){


						$defaddpos = "20";
						$defadditi = "$hit";
						$defaddid = "$p_id{$d_id}";
						$defaddname = "$p_name{$d_id}";
						$defaddcon = "$p_kunino{$d_id}";
						$defaddhei = "$p_heisyu{$d_id}";
						$defadddbdb8 = "$p_syubi_eria{$d_id}";
						$defadddbdb9 = "$p_syubi_tosi{$d_id}";
						&DEF_M;
$ddbdb1 = "$t_name[$hit] $senno[20] ";
$p_syubi_tosi{$d_id} = $hit;
$p_syubi_eria{$d_id} = 20;

												}
			}

	}
						}else{
						if(!$k_kokka_keitai{$p_kunino{$e_id}}){
		$t_siro_bouei_ti{$ft_id} = 300;
						}
$k_kunino{$p_kunino{$e_id}}=0;
$k_name{$p_kunino{$e_id}}='無所属';
$k_iro_d{$p_kunino{$e_id}}=0;
$k_kokui{$p_kunino{$e_id}}=0;
$k_kokko_sougaku{$p_kunino{$e_id}} -= int($k_kokko_sougaku{$p_kunino{$e_id}} * 0.8);
$k_kokko_sougaku{$p_kunino{$f_id}} += int($k_kokko_sougaku{$p_kunino{$e_id}} * 0.4);
unlink("./w_db/kuni/coudata$p_kunino{$e_id}\.pl");
									$ttid = "klog/$p_kunino{$e_id}";
									&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$e_id}}は滅亡しました。。");
												&MAP_LOG2("<span class=\"cFF0000\">【滅亡】</span>\[$old_date\]$k_p_k_a{$p_kunino{$e_id}}は滅亡しました。。");
												&M2AP_LOG("<span class=\"cFF0000\">【滅亡】</span>\[$old_date\]$k_p_k_a{$p_kunino{$e_id}}は滅亡しました。。");

	foreach(@p_db_all_l){
			$d_id = $_;
			if($p_kunino{$d_id} eq $add_e_kuni){
					if($p_kuni_touyoubun{$p_kunino{$f_id}}){
							@MES_REG2 = ();
							open(IN,"./w_db/jyusin/m_$p_id{$d_id}.cgi");
							@MES_REG2 = <IN>;
							close(IN);
#$k_tensi_id{$fk_id}
							unshift(@MES_REG2,"$p_id{$d_id}<>$f_id<>$p_taizai_iti{$f_id}<>$k_tensi_name{$p_kunino{$f_id}}<><a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$p_kunino{$f_id}\" target=\"_blank\"><span class=\"cFFFFFF\">$k_name{$fk_id}</span></a>の使者:$p_kuni_touyoubun{$p_kunino{$f_id}}$tt_date<>$p_name{$d_id}<>$p_cg_sabano{$k_tensi_id{$fk_id}}<>$p_img{$k_tensi_id{$fk_id}}$p_img_f{$k_tensi_id{$fk_id}}<>$p_kunino{$f_id}<>0<>$tt<>\n");
splice(@MES_REG2,10);
							open(OUT,">./w_db/jyusin/m_$p_id{$d_id}.cgi");
							print OUT @MES_REG2;
							close(OUT);
					}
		$ttid = "blog/$p_id{$d_id}";
		&PRLOG("\[$old_date\]仕官先の$k_p_k_a{$add_e_kuni}が滅亡してしまい、放浪の旅に出る。。");
	&KUNI_KAKUDUKE("$d_id","$p_kunino{$d_id}","$p_kunino{$d_id}");
		$p_kuni_yakusyoku{$d_id} = 0;
			}

	}
						}
									
									$d_id = 0;
											}

											if($town_get[$p_kunino{$f_id}] >= $tosinokazu and int($cd_op1 / 10) ne "9" and int($cd_op1 / 10) ne "8"){

									$tenkahit = 1;
		$kousinjyoutai = 999;
									$tenkaid = $p_kunino{$f_id};
									$tenkaname = $k_name_d[$p_kunino{$f_id}];
		@tenka_new = ();
		unshift(@tenka_new,"$tenkaid<>$tenkaname<>\n");
		open(OUT,">./w_db/tenka.cgi");
		print OUT @tenka_new;
		close(OUT);
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$p_kunino{$f_id}\" target=\"_blank\"><span class=\"c0000FF\">$k_name_d[$p_kunino{$f_id}]</span></a>は全ての都市を制圧し、東アジア大陸を統一する。 天子：<a href=\"./?.m.=p_b&amp;.id.=$p_id{$coucid}\" target=\"_blank\"><span class=\"c0000FF\">$k_tensi_name{$p_kunino{$f_id}}</span></a>");
												&MAP_LOG2("<span class=\"c0000FF\">【天下統一】</span>\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$p_kunino{$f_id}\" target=\"_blank\"><span class=\"c0000FF\">$k_name_d[$p_kunino{$f_id}]</span></a>の天子：<a href=\"./?.m.=p_b&amp;.id.=$p_id{$coucid}\" target=\"_blank\"><span class=\"c0000FF\">$k_tensi_name{$p_kunino{$f_id}}</span></a>は東アジア大陸を統一しました。");
												&M2AP_LOG("<span class=\"c0000FF\">【天下統一】</span>\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$p_kunino{$f_id}\" target=\"_blank\"><span class=\"c0000FF\">$k_name_d[$p_kunino{$f_id}]</span></a>の天子：<a href=\"./?.m.=p_b&amp;.id.=$p_id{$coucid}\" target=\"_blank\"><span class=\"c0000FF\">$k_tensi_name{$p_kunino{$f_id}}</span></a>は東アジア大陸を統一しました。");

											}
												&MAPS;
###########################################
										}else{
###########################################
										}
									}else{

#				if($krrkkai == 1){
				$add_kousin_s{$f_id} = int($p_b_kousin_s{$f_id} * $kbp_bidouhosei[0]);
#				}
											if($battle_end){

			if(int($cd_op1 / 10) eq "9"){
									$add = $bouei_add2 -$bouei_adddmg;
									$bouei_add2 -= $bouei_adddmg;
									$add2 = $bouei_add2;
									if($add2 < 1){
									$add2 = 1;
									}
									$bouei_add2 -=  int((int($add / 10000) * 10000 * $bouei_adddmg) / $add2);
									$bouei_add = int($bouei_add2 / 30);
									if($bouei_add > 700 * $bouei_add_hosei){
									$t_siro_bouei_ti{$ft_id} = int(($bouei_add - 700 * $bouei_add_hosei) * 5)+1000 * $bouei_add_hosei;
									}elsif($bouei_add > 500 * $bouei_add_hosei){
									$t_siro_bouei_ti{$ft_id} = int(($bouei_add - 500 * $bouei_add_hosei) * 2.5)+500 * $bouei_add_hosei;
									}else{
									$t_siro_bouei_ti{$ft_id} = $bouei_add;
									}
									if($t_siro_bouei_ti{$ft_id} < 1){
									$t_siro_bouei_ti{$ft_id} = 1;
									$kabebkn = 2;
									}
										$t_siro_taikyuu_ti{$ft_id} -= int($kex_add * 150 / $p_sougou{$f_id});
										if($t_siro_taikyuu_ti{$ft_id} < 0){
											$t_siro_taikyuu_ti{$ft_id}=0;
										}
							$kgetm = int($t_ryoumin_suu{$ft_id} / 5);
									$wincomelb1 = "城内";
									$wincomelb2 = "の城";
										$boueizanc = "防衛力$boueizanc⇒$t_siro_bouei_ti{$ft_id}。";
			}elsif(int($cd_op1 / 10) eq "8"){
									$add = $bouei_add2 -$bouei_adddmg;
									$bouei_add2 -= $bouei_adddmg;
									$add2 = $bouei_add2;
									if($add2 < 1){
									$add2 = 1;
									}
									$bouei_add2 -=  int((int($add / 10000) * 10000 * $bouei_adddmg) / $add2);
									$bouei_add = int($bouei_add2 / 30);
									if($bouei_add > 700 * $bouei_add_hosei){
									$t_zoku_bouei_ti{$ft_id} = int(($bouei_add - 700 * $bouei_add_hosei) * 5)+1000 * $bouei_add_hosei;
									}elsif($bouei_add > 500 * $bouei_add_hosei){
									$t_zoku_bouei_ti{$ft_id} = int(($bouei_add - 500 * $bouei_add_hosei) * 2.5)+500 * $bouei_add_hosei;
									}else{
									$t_zoku_bouei_ti{$ft_id} = $bouei_add;
									}
									if($t_zoku_bouei_ti{$ft_id} < 1){
									$t_zoku_bouei_ti{$ft_id} = 1;
									$kabebkn = 3;
									}
										$t_zoku_taikyuu_ti{$ft_id} -= int($kex_add * 150 / $p_sougou{$f_id});
										if($t_zoku_taikyuu_ti{$ft_id} < 0){
											$t_zoku_taikyuu_ti{$ft_id}=0;
										}
							$kgetm = int(rand(3000)) + 3000;
									$wincomelb1 = "賊砦";
									$wincomelb2 = "の賊砦";
										$boueizanc = "防衛力$boueizanc⇒$t_zoku_bouei_ti{$ft_id}。";
			}else{
									$add = $bouei_add2 -$bouei_adddmg;
									$bouei_add2 -= $bouei_adddmg;
									$add2 = $bouei_add2;
									if($add2 < 1){
									$add2 = 1;
									}
									$bouei_add2 -=  int((int($add / 10000) * 10000 * $bouei_adddmg) / $add2);
									$bouei_add = int($bouei_add2 / 1);
									if($bouei_add > 700 * $bouei_add_hosei){
									$t_siro_bouei_ti{$ft_id} = int(($bouei_add - 700 * $bouei_add_hosei) * 5)+1000 * $bouei_add_hosei;
									}elsif($bouei_add > 500 * $bouei_add_hosei){
									$t_siro_bouei_ti{$ft_id} = int(($bouei_add - 500 * $bouei_add_hosei) * 2.5)+500 * $bouei_add_hosei;
									}else{
									$t_siro_bouei_ti{$ft_id} = $bouei_add;
									}
									if($t_siro_bouei_ti{$ft_id} < 1){
									$t_siro_bouei_ti{$ft_id} = 1;
									$kabebkn = 1;
									}
										$t_siro_taikyuu_ti{$ft_id} -= int($kex_add * 150 / $p_sougou{$f_id});
										if($t_siro_taikyuu_ti{$ft_id} < 0){
											$t_siro_taikyuu_ti{$ft_id}=0;
										}
							$kgetm = int($t_ryoumin_suu{$ft_id} / 5);
									$wincomelb1 = "城内";
									$wincomelb2 = "の城";
										$boueizanc = "防衛力$boueizanc⇒$t_siro_bouei_ti{$ft_id}。";
			}

											}else{
											}
											$krrk += 100;
									}

									


		$mapseiseiblp .= "
</td></tr>
</table>
";

		$mapseiseiblm .= "
</table>

</td>
<td width=\"15\" class=\"bgcFFF0F5\" onclick=\"javascript:void(slm(1));\">↓</td>
</tr>
</table>
<br />";
		$mapseiseibls = $mapseiseiblt;
		$mapseiseibls .= $mapseiseiblp;
		$mapseiseibls .= $mapseiseiblm;
		$mapseiseibls .= $mapseiseible;

	&BAG_LOG2("戦後E\n");
		@SLOG_DEL = ();
		@SLOG_LOGL = ();
	open(IN,"./p_db/slogid/m.cgi");
	$add = <IN>;
	close(IN);
		$add = int($add + 1);
		open(OUT,">./p_db/slogid/m.cgi");
		print OUT $add;
		close(OUT);

	$mapseiseibls =~  s/\.\//\.\.\//g;
		open(OUT,">./slog/$add.html");
		print OUT $mapseiseibls;
		close(OUT);

&M2AP_LOG("$maddc「$k_p_k_a{$p_kunino{$f_id}}$kbt_namae部隊：$kaddc2《 Vs 》$eaddc2：$k_p_k_a{$p_kunino{$e_id}}$ebt_namae部隊」<a href=\"./?.m.=logf&amp;.l.=$add&amp;.id.=$kbp_id[$ki]\" target=\"_blank\">戦闘結果</a>＠<a href=\"$URI/?.m.=$slog_kz2&amp;.id.=$cd_op2\" target=\"_blank\">$t_name{$ft_id}</a>$senno[$md_eria]$boueizanc<br />");
###################
	&BAG_LOG2("戦闘結果E\n");
					$ki = 0;
					$ei = 0;
				while ($ki < $kouryakukazu) {
#		@SLOG_LOGF = ();
#	unshift(@SLOG_LOGF,"$kbp_id[$ki]<>1<>$ki<>$kbp_logf[$ki]<>\n");
#		open(OUT,">./p_db/slogid/logf_$kbp_id[$ki].cgi");
#		print OUT @SLOG_LOGF;
#		close(OUT);

	unshift(@SLOG_LOGL,"logf_$kbp_id[$ki]<>1<>$ki<>$p_name{$kbp_id[$ki]}<>$kbp_logf[$ki]<>\n");

	open(IN,"./p_db/slogid/$kbp_id[$ki].cgi");
	@S_MOVEPR = <IN>;
	close(IN);
	unshift(@S_MOVEPR,"$add<>$slogt<>\[$old_date\]<>$tt<>$k_p_k_a{$p_kunino{$f_id}}：$kbt_namae部隊《 Vs 》$k_p_k_a{$p_kunino{$e_id}}<>\n");

			if($#S_MOVEPR){
	splice(@S_MOVEPR,50);
			}else{
	unshift(@SLOG_DEL,"$kbp_id[$ki]\n");
			}
		open(OUT,">./p_db/slogid/$kbp_id[$ki].cgi");
		print OUT @S_MOVEPR;
		close(OUT);

		$mapseiseiblm .= "$p_name{$kbp_id[$ki]}";
	$w_id=$p_id{$kbp_id[$ki]};&P_LOG_W("$p_name{$kbp_id[$ki]}は<span class=\"cFF0000\">$kbp_ex_add[$ki]</span>の貢献を得ました。$SOL_TYPE[$p_heisyu{$kbp_id[$ki]}]：$kbp_solm[$ki]⇒$p_heisisuu{$kbp_id[$ki]}<br />$kmaddc「$k_p_k_a{$p_kunino{$f_id}}$kbt_namae部隊：$kaddc2《 Vs 》$eaddc2：$k_p_k_a{$p_kunino{$e_id}}$ebt_namae部隊」<a href=\"./?.m.=logf&amp;.l.=$add&amp;.id.=$kbp_id[$ki]\" target=\"_blank\">戦闘結果</a>＠<a href=\"./?.m.=$slog_kz2&amp;.id.=$cd_op2\" target=\"_blank\">$t_name{$ft_id}</a>$senno[$md_eria]$boueizanc");

					$ki ++;
				}
				while ($ei < $boueikazu) {
#		@SLOG_LOGF = ();
#	unshift(@SLOG_LOGF,"$ebp_id[$ei]<>0<>$ei<>$ebp_logf[$ei]<>\n");
#		open(OUT,">./p_db/slogid/logf_$ebp_id[$ei].cgi");
#		print OUT @SLOG_LOGF;
#		close(OUT);
	unshift(@SLOG_LOGL,"logf_$ebp_id[$ei]<>0<>$ei<>$p_name{$ebp_id[$ei]}<>$ebp_logf[$ei]<>\n");
	open(IN,"./p_db/slogid/$ebp_id[$ei].cgi");
	@S_MOVEPR = <IN>;
	close(IN);
	unshift(@S_MOVEPR,"$add<>$slogt<>\[$old_date\]<>$tt<>$k_p_k_a{$p_kunino{$f_id}}：$kbt_namae部隊《 Vs 》$k_p_k_a{$p_kunino{$e_id}}<>\n");

			if($#S_MOVEPR){
	splice(@S_MOVEPR,50);
			}else{
	unshift(@SLOG_DEL,"$ebp_id[$ei]\n");
			}
		open(OUT,">./p_db/slogid/$ebp_id[$ei].cgi");
		print OUT @S_MOVEPR;
		close(OUT);

	$w_id=$p_id{$ebp_id[$ei]};&P_LOG_W("$p_name{$ebp_id[$ei]}は<span class=\"cFF0000\">$ebp_ex_add[$ei]</span>の貢献を得ました。$SOL_TYPE[$p_heisyu{$ebp_id[$ei]}]：$ebp_solm[$ei]⇒$p_heisisuu{$ebp_id[$ei]}<br />$emaddc「$k_p_k_a{$p_kunino{$f_id}}$kbt_namae部隊：$kaddc2《 Vs 》$eaddc2：$k_p_k_a{$p_kunino{$e_id}}$ebt_namae部隊」<a href=\"./?.m.=logf&amp;.l.=$add&amp;.id.=$ebp_id[$ei]\" target=\"_blank\">戦闘結果</a>＠<a href=\"./?.m.=$slog_kz2&amp;.id.=$cd_op2\" target=\"_blank\">$t_name{$ft_id}</a>$senno[$md_eria]$boueizanc");


					$ei ++;
				}

		open(OUT,">./p_db/slogid/logl_$add.cgi");
		print OUT @SLOG_LOGL;
		close(OUT);

	&BAG_LOG2("個人結果E\n");
###################
	open(IN,"./p_db/slogid/k_$p_kunino{$f_id}.cgi");
	@S_MOVEPR = <IN>;
	close(IN);
	unshift(@S_MOVEPR,"$add<>$slogt<>\[$old_date\]<>$tt<>$k_p_k_a{$p_kunino{$f_id}}：$kbt_namae部隊《 Vs 》$k_p_k_a{$p_kunino{$e_id}}<>\n");

			if($#S_MOVEPR){
	splice(@S_MOVEPR,50);
			}else{
	unshift(@SLOG_DEL,"k_$p_kunino{$f_id}\n");
			}
		open(OUT,">./p_db/slogid/k_$p_kunino{$f_id}.cgi");
		print OUT @S_MOVEPR;
		close(OUT);

	open(IN,"./p_db/slogid/k_$p_kunino{$e_id}.cgi");
	@S_MOVEPR = <IN>;
	close(IN);
	unshift(@S_MOVEPR,"$add<>$slogt<>\[$old_date\]<>$tt<>$k_p_k_a{$p_kunino{$f_id}}：$kbt_namae部隊《 Vs 》$k_p_k_a{$p_kunino{$e_id}}<>\n");

			if($#S_MOVEPR){
	splice(@S_MOVEPR,50);
			}else{
	unshift(@SLOG_DEL,"k_$p_kunino{$e_id}\n");
			}
		open(OUT,">./p_db/slogid/k_$p_kunino{$e_id}.cgi");
		print OUT @S_MOVEPR;
		close(OUT);


	open(IN,"./p_db/slogid/t_$slog_kz$cd_op2.cgi");
	@S_MOVEPR = <IN>;
	close(IN);
	unshift(@S_MOVEPR,"$add<>$t_name{$ft_id}$wincomelbs$wincomelbs2<>\[$old_date\]<>$tt<>$k_p_k_a{$p_kunino{$f_id}}：$kbt_namae部隊《 Vs 》$k_p_k_a{$p_kunino{$e_id}}<>\n");

			if($#S_MOVEPR){
	splice(@S_MOVEPR,50);
			}else{
	unshift(@SLOG_DEL,"t_$slog_kz$cd_op2.cgi\n");
			}
		open(OUT,">./p_db/slogid/t_$slog_kz$cd_op2.cgi");
		print OUT @S_MOVEPR;
		close(OUT);


		open(OUT,">./p_db/slogid/del_$add.cgi");
		print OUT @SLOG_DEL;
		close(OUT);
	&BAG_LOG2("SLOGE\n");
########################
		$add2 = int($sen_log_max);
				if(!$sen_log_max){
		$sen_log_max = 10000;
				}
				if($add > $add2){
		$add2 = int($add - $add2);
	open(IN,"./p_db/slogid/del_$add2.cgi");
	@SLOG_DEL = <IN>;
	close(IN);
	foreach(@SLOG_DEL){
	open(IN,"./p_db/slogid/$_.cgi");
	@S_MOVEPR = <IN>;
	close(IN);
		$add_id="$add2<";
@S_MOVEPR = grep( !/^$add_id/, @S_MOVEPR );
#			pop(@S_MOVEPR);
		open(OUT,">./p_db/slogid/$_.cgi");
		print OUT @S_MOVEPR;
		close(OUT);
			if($#S_MOVEPR < 1){
			unlink("./p_db/slogid/$_.cgi");
			}
	}
			unlink("./p_db/slogid/del_$add2.cgi");
	open(IN,"./p_db/slogid/logl_$add2.cgi");
	@SLOG_LOGL = <IN>;
	close(IN);

	foreach(@SLOG_LOGL){
	($loglno)=split(/<>/);
			unlink("./p_db/slogid/$loglno.cgi");
	}
			unlink("./slog/$add2.html");
			unlink("./p_db/slogid/logl_$add2.cgi");
				}
#######################
	&BAG_LOG2("DELE\n");
									}

	&BAG_LOG2("LOGE\n");
#_/_/_/_/_/連戦拡張_/_/_/_/_/_/_/#

											if($sph eq "2"){
									$sentouiti=$sentouitibk;
											$krrk -= 1;
											$krrkmax ++;
											if($krrkmax > 5){
							last;
											}
	&BAG_LOG("sph2\n");
											}else{
										$meidohan += int(rand(2));

										if($p_heisyu{$f_id} eq "15" or $p_h_kougun{$f_id} eq "6"){
										}elsif($p_heisyu{$f_id} eq "39"){
											$krrk-=1;
										}elsif($p_heisyu{$f_id} eq "30" or $p_heisyu{$f_id} eq "16" or $p_heisyu{$f_id} eq "41"){
											$krrk+=1;
										}elsif($p_heisyu{$f_id} eq "14" and $meidohan < 1){
											$krrk+=100;
										}elsif($p_heisyu{$f_id} eq "92" and $meidohan < 1){
											$krrk+=100;
										}else{
											if(($kbp_ff[0] eq "4" or $k_kokusaku{$p_kunino{$f_id}} eq "6") and !int(rand(2))){
											$krrk+=1;
											}elsif($k_kokusaku{$p_kunino{$f_id}} eq "7"){
											$krrk-= int(rand(3));
												if($krrkkai % 8 == 7){
											$krrk -= 8;
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$khc");
									&M2AP_LOG("$khc");
													if($krrkkai == 22){
											$krrk+=100;
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$khy");
									&M2AP_LOG("$khy");
													}
												}
											}elsif($kinukakuhen){
											$krrk -= 1;
									if(int(rand(3))){
											$kinukakuhen -= 1;
									}
									if(!$kinukakuhen){
											$krrk+=100;
									}
											}else{
											$krrk+=100;
											}
										}
													if($krrkkai == 22){
											$krrk+=100;
	$w_id=$p_id{$kbp_id[0]};&P_LOG_W("$khy");
									&M2AP_LOG("$khy");
													}
											$krrk += 1;
											}
													if($krrkkai == 50){
											$krrk+=100;
													}
									}
#_/_/_/_/_/連戦拡張_/_/_/_/_/_/_/#
										if($ksikikeitai ne "2"){
									$p_b_hirou{$f_id} += $SKHIROU[$p_jintousiki{$f_id}] + $BHHIROU[$kshousin1];
										}
									$p_b_hirou{$f_id} += $BKHIROU[$p_b_kougun{$f_id}];
									$p_h_hirou{$f_id} += $HKHIROU[$p_h_kougun{$f_id}];
									$p_ex_buryoku{$f_id}+=2;
									$p_kunkou{$f_id} += 20;

#									if($battle_end){
#	open(OUT,">>./p_db/senlog.cgi");
#	print OUT @F_LOG2;
#	close(OUT);
#									}
								}
							}
						}

}
#######################
sub CD_IDkome2 {

						$p_mikoudou_t{$f_id}=0;
	$ytsoubaf = $cd_op2;
						if($cd_op1<2){
							if($cd_op2 > 30000){
								$cd_op2 = 30000;
	$ytsoubaf = $cd_op2;
							}
							if($cd_no){
								if($p_syoji_kin{$f_id} >= int($cd_op2 / $t_kome_souba{$ft_id})){
									$kadd = int($cd_op2 / $t_kome_souba{$ft_id});
									$p_syoji_kin{$f_id} -= $kadd;
									$p_syoji_kome{$f_id} += $cd_op2;
								if(int(rand($add_naisei)) >= 10){
									$kadd4 = int(rand(5) +1) * 0.01;
									$kadd4 = int($ytsoubaf * $kadd4);
									$p_syoji_kome{$f_id} += $kadd4;
									$kadd3 = "更に、おまけとして$kadd4の米を商人から貰い受けました。";
								$p_ex_sinyou{$f_id}++;
								}
									$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【商人】：金$kaddを支払って$cd_op2の米を買いました。$kadd3");
								$p_ex_tiryoku{$f_id}++;
								}else{
									$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【商人】：所持金が足りないため、米が買えません。暇な時間を利用して巡察を行いました。");
							&R_JYUNSATU;
								}
							}else{
								if($p_syoji_kome{$f_id} >= $cd_op2 * $t_kome_souba{$ft_id}){
									$kadd = int($cd_op2 * $t_kome_souba{$ft_id});
									$p_syoji_kome{$f_id} -= $kadd;
									$p_syoji_kin{$f_id} += $cd_op2;
								if(int(rand($add_naisei)) >= 10){
									$kadd4 = int(rand(5) +1) * 0.01;
									$kadd4 = int($ytsoubaf * $kadd4);
									$p_syoji_kin{$f_id} += $kadd4;
									$kadd3 = "更に、おまけとして$kadd4の金を商人から貰い受けました。";
								$p_ex_sinyou{$f_id}++;
								}
									$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【商人】：$kaddの米を売って$cd_op2の金を入手しました。$kadd3");
								$p_ex_tiryoku{$f_id}++;
								}else{
									$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【商人】：所持米が足りないため、売却できません。暇な時間を利用して巡察を行いました。");
							&R_JYUNSATU;
								}
							}
						}else{
							if($cd_no){
	$ytsouba = 0.95;
							}else{
	$ytsouba = 1.05;
							}
			if($jfi>159 or ($jfl>129 and $jfi>129)){
	$ytsouba = 1;
							if($ytsoubaf > 30000){
								$ytsoubaf = 30000;
							}
			}
							if($cd_no){
								if($p_syoji_kin{$f_id} >= int($cd_op2 / $ytsouba)){
									$kadd = int($cd_op2 / $ytsouba);
									$p_syoji_kin{$f_id} -= $kadd;
									$p_syoji_kome{$f_id} += $cd_op2;
					$add_b_torihiki{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_sinyou{$f_id} * 2) + $p_jinbou{$f_id} + ($p_syakousei{$f_id} * 2) + ($p_kioku{$f_id} * 2) + $p_exluck{$f_id} + $p_yousi{$f_id} + $p_kotobadakumi{$f_id})*0.1));
					$add_naisei += $add_b_torihiki{$f_id};
									$kadd3 = "";
								if(int(rand($add_naisei)) >= 10){
									$kadd4 = int(rand(5) +1) * 0.01;
									$kadd4 = int($ytsoubaf * $kadd4);
									$p_syoji_kome{$f_id} += $kadd4;
									$kadd3 = "更に、おまけとして$kadd4の米を商人から貰い受けました。";
								$p_ex_sinyou{$f_id}++;
								}
									$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【商人】：金$kaddを支払って$cd_op2の米を買いました。$kadd3");
								$p_ex_tiryoku{$f_id}++;
								}else{
									$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【商人】：所持金が足りないため、米が買えません。暇な時間を利用して巡察を行いました。");
							&R_JYUNSATU;
								}
							}else{
								if($p_syoji_kome{$f_id} >= $cd_op2 * $ytsouba){
									$kadd = int($cd_op2 * $ytsouba);
									$p_syoji_kome{$f_id} -= $kadd;
									$p_syoji_kin{$f_id} += $cd_op2;
					$add_b_torihiki{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_sinyou{$f_id} * 2) + $p_jinbou{$f_id} + ($p_syakousei{$f_id} * 2) + ($p_kioku{$f_id} * 2) + $p_exluck{$f_id} + $p_yousi{$f_id} + $p_kotobadakumi{$f_id})*0.1));
					$add_naisei += $add_b_torihiki{$f_id};
									$kadd3 = "";
								if(int(rand($add_naisei)) >= 10){
									$kadd4 = int(rand(5) +1) * 0.01;
									$kadd4 = int($ytsoubaf * $kadd4);
									$p_syoji_kin{$f_id} += $kadd4;
									$kadd3 = "更に、おまけとして$kadd4の金を商人から貰い受けました。";
								$p_ex_sinyou{$f_id}++;
								}
									$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【商人】：$kaddの米を売って$cd_op2の金を入手しました。$kadd3");
								$p_ex_tiryoku{$f_id}++;
								}else{
									$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:【商人】：所持米が足りないため、売却できません。暇な時間を利用して巡察を行いました。");
							&R_JYUNSATU;
								}
							}
						}

}
#######################
sub CD_IDidou2 {

						$p_mikoudou_t{$f_id}=0;

						if(!-e "./$mpg_r/sub_db/td/$p_taizai_iti{$f_id}.$cd_op2.pl"){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name[$cd_op2]へ移動出来ません。現在位置：$t_name{$ft_id}。暇な時間を利用して巡察を行いました。");
									&R_JYUNSATU;
						}elsif($k_kokusaku{$t_kunino{$cd_op2}} eq "9" and $t_kunino{$cd_op2} ne $p_kunino{$f_id} and $k_kunino{$fk_id}){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:関所の監視が厳しく入国できません。行き先の都市では鎖国体制を布いている模様です。暇な時間を利用して巡察を行いました。");
									&R_JYUNSATU;
						}else{
							$ft_id = $cd_op2;
							$p_taizai_iti{$f_id} = $cd_op2;
							$kexaddw = int((rand(2)+1) * 30 / (10 + $p_b_idou_sokudo{$f_id}));
							if($k_kunino{$fk_id} ne "0"){
								$p_kunkou{$f_id} += int(20 * 30 / (10 + $p_b_idou_sokudo{$f_id}));
							}
			if($jfi>159 or ($jfi>129 and $jfl>129)){
							$p_ex_tiryoku{$f_id}+= $kexaddw;
			}elsif($jfs>159 or ($jfi>129 and $jfs>129)){
							$p_ex_buryoku{$f_id}+= $kexaddw;
			}elsif($jfl>159 or ($jfl>129 and $jfs>129)){
							$p_ex_tousotu{$f_id}+= $kexaddw;
			}else{
							$kexaddw= int(rand($kexaddw+1));
							$p_ex_tousotu{$f_id}+= $kexaddw;
							$p_ex_buryoku{$f_id}+= $kexaddw;
							$p_ex_tiryoku{$f_id}+= $kexaddw;
			}

									$p_b_hirou{$f_id} += $BKHIROU[$p_b_kougun{$f_id}];
				$add_kousin_s{$f_id} = $p_b_kousin_s{$f_id};
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name[$cd_op2]へ移動しました。");
						}
}
#######################
sub CD_IDsikan {
						$p_mikoudou_t{$f_id}=0;
		$fk_id = $p_kunino{$f_id};
						if(!$k_kunino{$fk_id}){
							if(!$k_kunino[$cd_op2]){
								$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:その国へは仕官できません。既に滅亡しているようです。");
							}elsif($cd_op2 ne $t_kunino{$ft_id} and $t_zokuno{$ft_id} ne $cd_op2){
								$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:コマンド入力時の仕官先：『$k_name_d[$cd_op2]』。現在滞在している都市『$t_name{$ft_id}』は『$k_name_d[$t_kunino[$ft_id]]』に支配されています。");
							}elsif("8" eq $k_kokusaku{$cd_op2}){
								$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$k_name_d[$cd_op2]では国策：聖戦を発動させています。国境付近で門前払いされました…。");
							}else{
									open(IN,"./w_db/k_sikan_kyozetu.cgi");
									@B_LIST = <IN>;
									close(IN);
	$b_hit=0;
	$hit=0;
	$i=0;
	while($i - $hit <= $#B_LIST){
		($kyozetu_id,$kyozetu_kunino,$kyozetu_name,$kyozetu_tt) = split(/<>/,$B_LIST[$i]);
		if($kyozetu_id eq $f_id and $kyozetu_kunino eq $cd_op2 and $kyozetu_tt + 7776000 > $tt){
			$b_hit=1;
		}
	$i++;
	}

		$fk_id = $cd_op2;
								if($b_hit and !$k_kokka_keitai{$k_kunino{$fk_id}}){
						$p_kuni_sikan_nensuu{$f_id}=0;
									$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$k_name_d[$cd_op2]への仕官は拒否されました");
								}else{
									$p_kunino{$f_id} = $cd_op2;
									$p_kuni_sikan_nensuu{$f_id} = 0;$p_kuni_kouken{$f_id} = 0;
		$p_kuni_yakusyoku{$f_id} = 0;
									$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$k_name_d[$cd_op2]へ仕官しました。");
									&M2AP_LOG("<span class=\"c0088CC\">【仕官】</span>$p_p_b_a{$f_id}は$k_p_k_a{$cd_op2}へ仕官しました。");
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$k_p_k_a{$cd_op2}へ仕官。");
								}
							}
						}else{
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:無所属でなければ仕官できません。");
						}
}
#######################
sub CD_IDbuki2 {

						$p_mikoudou_t{$f_id}=0;
						if($p_migite{$f_id} % 1000 and $item_2hf{$cd_op2}+$item_2hf{$p_migite{$f_id}} < 3){
$add_g=$p_syoji_kin{$f_id} + int($item_nedan{$p_hidarite{$f_id}}*0.7);
						}elsif($p_hidarite{$f_id} % 1000 and $item_2hf{$cd_op2}+$item_2hf{$p_hidarite{$f_id}} < 3){
$add_g=$p_syoji_kin{$f_id} + int($item_nedan{$p_migite{$f_id}}*0.7);
						}else{
$add_g=$p_syoji_kin{$f_id} + int($item_nedan{$p_migite{$f_id}}*0.7) + int($item_nedan{$p_hidarite{$f_id}}*0.7);
						}
						if($item_nedan{$cd_op2} > $add_g){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:所持金がたりません。$item_name{$cd_op2} 価格:$item_nedan{$cd_op2}。暇な時間を利用して巡察を行いました。");
							&R_JYUNSATU;
						}elsif($item_rea{$cd_op2} ne "0"){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:その商品は購入できません。$item_name{$cd_op2} 価格:$item_nedan{$cd_op2}。暇な時間を利用して巡察を行いました。");
							&R_JYUNSATU;
						}elsif(($p_migite{$f_id} % 1000) > 99 and $item_2hf{$cd_op2}+$item_2hf{$p_migite{$f_id}}+$item_2hf{$p_hidarite{$f_id}} > 2){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:売却できない装備品を所持しています。$item_name{$p_migite{$f_id}}。一旦外してください。暇な時間を利用して巡察を行いました。");
							&R_JYUNSATU;
						}elsif(($p_hidarite{$f_id} % 1000) > 99 and $item_2hf{$cd_op2}+$item_2hf{$p_hidarite{$f_id}}+$item_2hf{$p_migite{$f_id}} > 2){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:売却できない装備品を所持しています。一旦外してください。$item_name{$p_hidarite{$f_id}}。暇な時間を利用して巡察を行いました。");
							&R_JYUNSATU;
						}else{
						$add_c="";
						if($cd_op3 eq "2"){
						$add_g=int($item_nedan{$p_hidarite{$f_id}}*0.7);
							$p_syoji_kin{$f_id} += $add_g;
						if($p_hidarite{$f_id} % 1000){
						$add_c.="$item_name{$p_hidarite{$f_id}}を金<span class=\"cFF0000\">$add_g</span>で売り";
						}
							$p_hidarite{$f_id} = 1000;
						}elsif($cd_op3 eq "1"){
						$add_g=int($item_nedan{$p_migite{$f_id}}*0.7);
							$p_syoji_kin{$f_id} += $add_g;
						if($p_migite{$f_id} % 1000){
						$add_c.="$item_name{$p_migite{$f_id}}を金<span class=\"cFF0000\">$add_g</span>で売り";
						}
							$p_migite{$f_id} = 1000;
						}
						if($p_migite{$f_id} % 1000 and $item_2hf{$cd_op2}+$item_2hf{$p_migite{$f_id}} < 3){
						$add_g=int($item_nedan{$p_hidarite{$f_id}}*0.7);
							$p_syoji_kin{$f_id} += $add_g;
							$p_syoji_kin{$f_id} -= $item_nedan{$cd_op2};
					$add_b_torihiki{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_sinyou{$f_id} * 2) + $p_jinbou{$f_id} + ($p_syakousei{$f_id} * 2) + ($p_kioku{$f_id} * 2) + $p_exluck{$f_id} + $p_yousi{$f_id} + $p_kotobadakumi{$f_id})*0.1));
					$add_naisei += $add_b_torihiki{$f_id};
									$kadd3 = "";
								if(int(rand($add_naisei)) >= 10){
									$kadd4 = int(rand(11) +10) * 0.01;
									$kadd4 = int($add_g * $kadd4);
									$p_syoji_kin{$f_id} += $kadd4;
									$kadd3 = "更に、おまけとして$kadd4の金を商人から貰い受けました。";
								$p_ex_sinyou{$f_id}++;
								}
						if($p_hidarite{$f_id} % 1000){
						$add_c.="$item_name{$p_hidarite{$f_id}}を金<span class=\"cFF0000\">$add_g</span>で売り";
						}
							$p_hidarite{$f_id} = 1000;
							$p_hidarite{$f_id} = $cd_op2;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:武器：$add_c$item_name{$cd_op2}を購入しました。$kadd3");
						}elsif($p_hidarite{$f_id} % 1000 and $item_2hf{$cd_op2}+$item_2hf{$p_hidarite{$f_id}} < 3){
						$add_g=int($item_nedan{$p_migite{$f_id}}*0.7);
							$p_syoji_kin{$f_id} += $add_g;
							$p_syoji_kin{$f_id} -= $item_nedan{$cd_op2};
					$add_b_torihiki{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_sinyou{$f_id} * 2) + $p_jinbou{$f_id} + ($p_syakousei{$f_id} * 2) + ($p_kioku{$f_id} * 2) + $p_exluck{$f_id} + $p_yousi{$f_id} + $p_kotobadakumi{$f_id})*0.1));
					$add_naisei += $add_b_torihiki{$f_id};
									$kadd3 = "";
								if(int(rand($add_naisei)) >= 10){
									$kadd4 = int(rand(11) +10) * 0.01;
									$kadd4 = int($add_g * $kadd4);
									$p_syoji_kin{$f_id} += $kadd4;
									$kadd3 = "更に、おまけとして$kadd4の金を商人から貰い受けました。";
								$p_ex_sinyou{$f_id}++;
								}
						if($p_migite{$f_id} % 1000){
						$add_c.="$item_name{$p_migite{$f_id}}を金<span class=\"cFF0000\">$add_g</span>で売り";
						}
							$p_migite{$f_id} = 1000;
							$p_migite{$f_id} = $cd_op2;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:武器$add_c$item_name{$cd_op2}を購入しました。$kadd3");
						}else{
							if($p_hidarite{$f_id} % 1000){
						$add_g=int($item_nedan{$p_hidarite{$f_id}}*0.7);
							$p_syoji_kin{$f_id} += $add_g;
						if($p_hidarite{$f_id} % 1000){
						$add_c.="$item_name{$p_hidarite{$f_id}}を金<span class=\"cFF0000\">$add_g</span>で売り";
						}
							$p_hidarite{$f_id} = 1000;
							}
							if($p_migite{$f_id} % 1000){
						$add_g=int($item_nedan{$p_migite{$f_id}}*0.7);
							$p_syoji_kin{$f_id} += $add_g;
					$add_b_torihiki{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_sinyou{$f_id} * 2) + $p_jinbou{$f_id} + ($p_syakousei{$f_id} * 2) + ($p_kioku{$f_id} * 2) + $p_exluck{$f_id} + $p_yousi{$f_id} + $p_kotobadakumi{$f_id})*0.1));
					$add_naisei += $add_b_torihiki{$f_id};
									$kadd3 = "";
								if(int(rand($add_naisei)) >= 10){
									$kadd4 = int(rand(11) +10) * 0.01;
									$kadd4 = int($add_g * $kadd4);
									$p_syoji_kin{$f_id} += $kadd4;
									$kadd3 = "更に、おまけとして$kadd4の金を商人から貰い受けました。";
								$p_ex_sinyou{$f_id}++;
								}
						if($p_migite{$f_id} % 1000){
						$add_c.="$item_name{$p_migite{$f_id}}を金<span class=\"cFF0000\">$add_g</span>で売り";
						}
							$p_migite{$f_id} = 1000;
							}
							$p_syoji_kin{$f_id} -= $item_nedan{$cd_op2};
							$p_migite{$f_id} = $cd_op2;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:武器：$add_c$item_name{$cd_op2}を購入しました。$kadd3");
						}
						}
}
#######################
sub CD_IDsyomotu2 {
						$p_mikoudou_t{$f_id}=0;
						if($item_nedan{$cd_op2} > $p_syoji_kin{$f_id} + int($item_nedan{$p_syomotu{$f_id}}*0.7)){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:所持金がたりません。$item_name{$cd_op2} 価格:$item_nedan{$cd_op2}。暇な時間を利用して巡察を行いました。");
							&R_JYUNSATU;
						}elsif($item_rea{$cd_op2} ne "0"){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:その商品は購入できません。$item_name{$cd_op2} 価格:$item_nedan{$cd_op2}。暇な時間を利用して巡察を行いました。");
							&R_JYUNSATU;
						}elsif(($p_syomotu{$f_id} % 1000) > 99){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:装備品を売却できません。$item_name{$p_syomotu{$f_id}}。暇な時間を利用して巡察を行いました。");
							&R_JYUNSATU;
						}else{
						$add_g=int($item_nedan{$p_syomotu{$f_id}}*0.7);
							$p_syoji_kin{$f_id} += $add_g;
							$p_syoji_kin{$f_id} -= $item_nedan{$cd_op2};
					$add_b_torihiki{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_sinyou{$f_id} * 2) + $p_jinbou{$f_id} + ($p_syakousei{$f_id} * 2) + ($p_kioku{$f_id} * 2) + $p_exluck{$f_id} + $p_yousi{$f_id} + $p_kotobadakumi{$f_id})*0.1));
					$add_naisei += $add_b_torihiki{$f_id};
									$kadd3 = "";
								if(int(rand($add_naisei)) >= 10){
									$kadd4 = int(rand(11) +10) * 0.01;
									$kadd4 = int($add_g * $kadd4);
									$p_syoji_kin{$f_id} += $kadd4;
									$kadd3 = "更に、おまけとして$kadd4の金を商人から貰い受けました。";
								$p_ex_sinyou{$f_id}++;
								}
							$add_come = "";
						if($p_syomotu{$f_id} % 1000){
							$add_come = "$item_name{$p_syomotu{$f_id}}を金<span class=\"cFF0000\">$add_g</span>で売り、";
						}
							$p_syomotu{$f_id} = $cd_op2;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$add_come書物：$item_name{$cd_op2}を購入しました。$kadd3");
						}
}
#######################
sub CD_IDtouyou2 {

						$p_mikoudou_t{$f_id}=0;
						

						$e_id=$cd_op2;

						if($p_syoji_kin{$f_id} < 100){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:登用に必要な金が足りません。暇な時間を利用して巡察を行いました。");
							&R_JYUNSATU;
						}elsif($p_id{$e_id} eq ""){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:相手のIDが確認できないため、登用許可\が下りませんでした。$p_name{$f_id}は暇な時間を利用して巡察を行いました。");
							&R_JYUNSATU;
						}elsif($p_exgiri{$e_id} < 30){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:登用相手「$p_p_b_a{$p_id{$e_id}}」の義理の値が低すぎるため、登用許可\が下りませんでした。$p_name{$f_id}は暇な時間を利用して巡察を行いました。");
							&R_JYUNSATU;
						}else{

							$p_syoji_kin{$f_id}-=100;
							$p_kunkou{$f_id} += 30;
							@MES_REG2 = ();
							open(IN,"./w_db/jyusin/m_$cd_op2.cgi");
							@MES_REG2 = <IN>;
							close(IN);
							unshift(@MES_REG2,"$cd_op2<>$f_id<>$p_taizai_iti{$f_id}<>$p_name{$f_id}<>$cd_op1<>$cd_no<>$p_cg_sabano{$f_id}<>$p_img{$f_id}$p_cgno{$f_id}[0]$p_img_f{$f_id}<>$cd_op3<>0<>$tt<>\n");
splice(@MES_REG2,10);
							open(OUT,">./w_db/jyusin/m_$cd_op2.cgi");
							print OUT @MES_REG2;
							close(OUT);
							open(IN,"./w_db/jyusin/s_$f_id.cgi");
							@MES_REG2 = <IN>;
							close(IN);
	unshift(@MES_REG2,"$cd_op2<>$f_id<>$p_taizai_iti{$f_id}<>$p_name{$f_id}<>$cd_op1<>$cd_no<>$p_cg_sabano{$f_id}<>$p_img{$f_id}$p_cgno{$f_id}[0]$p_img_f{$f_id}<>$p_kunino{$f_id}<>0<>$tt<>\n");
splice(@MES_REG2 , 5);
							open(OUT,">./w_db/jyusin/s_$f_id.cgi");
							print OUT @MES_REG2;
							close(OUT);
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$cd_noに密書を送りました。");
							$p_ex_jinbou{$f_id}++;
							$p_ex_tiryoku{$f_id}++;
						}



}
#######################
sub CD_IDsouhu2 {

						$p_mikoudou_t{$f_id}=0;
						if($p_syoji_kin{$f_id} < $cd_op2 or $cd_op2 < 0){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:金が足りません。暇な時間を利用して巡察を行いました。");
							&R_JYUNSATU;
						}else{

							$cd_op2s = int($cd_op2/2);

							$eghit = 0;
										if($f_id eq $k_yakusyoku_id{$fk_id}[15] or $f_id eq $k_yakusyoku_id{$fk_id}[26] or $f_id eq $k_yakusyoku_id{$fk_id}[16] or $f_id eq $k_yakusyoku_id{$fk_id}[17] or $f_id eq $k_yakusyoku_id{$fk_id}[18] or $f_id eq $k_yakusyoku_id{$fk_id}[1] or $f_id eq $k_yakusyoku_id{$fk_id}[2] or $f_id eq $k_yakusyoku_id{$fk_id}[3] or $cd_no eq $k_yakusyoku_id{$fk_id}[15] or $cd_no eq $k_yakusyoku_id{$fk_id}[26] or $cd_no eq $k_yakusyoku_id{$fk_id}[16] or $cd_no eq $k_yakusyoku_id{$fk_id}[17] or $cd_no eq $k_yakusyoku_id{$fk_id}[18] or $cd_no eq $k_yakusyoku_id{$fk_id}[1] or $cd_no eq $k_yakusyoku_id{$fk_id}[2] or $cd_no eq $k_yakusyoku_id{$fk_id}[3]){
							$eghit = 2;
										}



							$e_id = $cd_no;

							$p_syoji_kin{$e_id} += $cd_op2s;
							$add_4 = 0;
							$add_4 += $cd_op2s;
										if($eghit >= 1){
							$p_syoji_kin{$e_id} += $cd_op2s;
							$add_4 += $cd_op2s;
										}
										if($p_id{$e_id} ne ""){									

	$w_id=$p_id{$e_id};&P_LOG_W("$p_name{$f_id}から金$add_4が送り届けられました。");
										}


							$p_syoji_kin{$f_id} -= $cd_op2;

										if($eghit == 2){
$p_ex_karumalc{$f_id} += 1;
$p_ex_karumald{$f_id} += 1;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$cd_op1に金$cd_op2を送付しました。無事に全額相手先に届きました。");


										}elsif($eghit == 1){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$cd_op1に金$cd_op2を送付しました。国の幹部が不在だったため全額相手先に届きました。");
										}else{
$p_ex_karumald{$f_id} += 1;

										if($p_kunino{$f_id} ne $p_kunino{$e_id}){
$p_ex_karumalc{$f_id} -= 5;
$p_ex_karumald{$f_id} -= 1;
										}
							$k_kokko_sougaku{$p_kunino{$f_id}} += $cd_op2s;


										if($k_yakusyoku_id{$fk_id}[26] ne ""){									

	$w_id=$p_id{$k_yakusyoku_id{$fk_id}[26]};&P_LOG_W("$p_name{$f_id}が$cd_op1に金$cd_op2を送付した手数料として、金$cd_op2sが国庫に納入されました。");
										}

							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$cd_op1に金$cd_op2を送付しました。相手先に届いた額は金$cd_op2s。（残りは国へ納入）");
										}

							$p_ex_jinbou{$f_id}++;
						}


}
#######################
sub CD_IDjyounou {
						$p_mikoudou_t{$f_id}=0;
						if($p_syoji_kin{$f_id} < $cd_op2){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:金が足りません。暇な時間を利用して巡察を行いました。");
							&R_JYUNSATU;
						}elsif(!$k_kunino{$fk_id}){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:貴方は現在放浪中です。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}else{


$p_ex_karumalc{$f_id} += 1;
$p_ex_karumald{$f_id} += 1;
							$eghit = 0;
										if($f_id eq $k_yakusyoku_id{$fk_id}[15] or $f_id eq $k_yakusyoku_id{$fk_id}[26] or $f_id eq $k_yakusyoku_id{$fk_id}[16] or $f_id eq $k_yakusyoku_id{$fk_id}[17] or $f_id eq $k_yakusyoku_id{$fk_id}[18] or $f_id eq $k_yakusyoku_id{$fk_id}[1] or $f_id eq $k_yakusyoku_id{$fk_id}[2] or $f_id eq $k_yakusyoku_id{$fk_id}[3] or $cd_no eq $k_yakusyoku_id{$fk_id}[15] or $cd_no eq $k_yakusyoku_id{$fk_id}[26] or $cd_no eq $k_yakusyoku_id{$fk_id}[16] or $cd_no eq $k_yakusyoku_id{$fk_id}[17] or $cd_no eq $k_yakusyoku_id{$fk_id}[18] or $cd_no eq $k_yakusyoku_id{$fk_id}[1] or $cd_no eq $k_yakusyoku_id{$fk_id}[2] or $cd_no eq $k_yakusyoku_id{$fk_id}[3]){
							$eghit = 2;
										}


		if($p_houbif{$f_id}[0] < 120){
$p_houbif{$f_id}[0] = 120;
		}
										if($k_yakusyoku_id{$fk_id}[26] ne ""){									

	$w_id=$p_id{$k_yakusyoku_id{$fk_id}[26]};&P_LOG_W("$p_name{$f_id}よりの上納金、金$cd_op2が国庫に納入されました。");
										}

							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:国庫に金$cd_op2を納付しました。");

							

							$e_id = $cd_no;

	$atted = 1000000;
		if($p_id{$e_id} and $p_kunino{$e_id} eq $k_kunino{$p_kunino{$f_id}}){
$p_ex_karumalc{$f_id} -= 2;
$p_ex_karumald{$f_id} += 2;
	$hit = 0;
	$p_sousisan{$e_id} = $p_syoji_kome{$e_id} + $p_syoji_kin{$e_id};
		if(!$p_mikoudou_t{$e_id}){
$kadd = int($k_kokko_sougaku{$p_kunino{$f_id}} * 0.0001);
$kadd2 = int($k_kokko_sougaku{$p_kunino{$f_id}} * 0.003);
			if($p_houbif{$e_id}[0] < 1){
	$hit = 1;
				if($kadd < $cd_op2 and $kadd2 *30 > $p_sousisan{$e_id} and int(rand($p_kotobadakumi{$f_id} + $p_seiji{$f_id})) > int(rand(40))){
		if($kadd2 > $cd_op2){
	$kadd2 = $cd_op2;
		}
	$kadd = 0.7;
		if($eghit == 2){
	$kadd = 0.9;
		}
$kadd = int($kadd2 * $kadd);
$k_kokko_sougaku{$p_kunino{$f_id}} -= $kadd;
$p_syoji_kin{$e_id} += $kadd;
	$p_ex_jinbou{$f_id} += int(rand(5))+3;
	$w_id=$p_id{$e_id};&P_LOG_W("$nen_genzai年$tuki_genzai月:$p_p_b_a{$f_id}の推薦により、天子：$k_tensi_name{$p_kunino{$f_id}}より褒美として金$kaddが下賜されました。");
										if($k_yakusyoku_id{$fk_id}[26] ne "" and $k_yakusyoku_id{$fk_id}[26] ne $p_id{$e_id}){									

	$w_id=$p_id{$k_yakusyoku_id{$fk_id}[26]};&P_LOG_W("$p_p_b_a{$f_id}の推薦により、天子：$k_tensi_name{$p_kunino{$f_id}}より$p_p_b_a{$p_id{$e_id}}に対し報奨金$kaddが支払われた模様です。");
										}
$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$p_p_b_a{$p_id{$e_id}}の推薦に成功し、天子：$k_tensi_name{$p_kunino{$f_id}}より$p_name{$e_id}に対し報奨金$kaddが支払われた模様です。");
							$p_neutral_meisei{$f_id} += 50;
	$hit = 2;
		if($p_houbif{$e_id}[0] < 1){
$p_houbif{$e_id}[0] = 0;
		}	
$p_houbif{$e_id}[0] += int($cd_op2 / 10000);
		if($p_houbif{$e_id}[0] > 2400){
$p_houbif{$e_id}[0] = 2400;
		}

				}
			}
		}
		if(!$hit){
$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$p_p_b_a{$p_id{$e_id}}の推薦は聞き入れられませんでした。");
		}
	$atted = 3000000;
		}

$hit = int($p_exgiri{$f_id} * $p_exgiri{$f_id} * ($k_kokko_sougaku{$p_kunino{$f_id}} + $atted) * 0.001 / $cd_op2);
		if(!int(rand($hit))){
$p_exgiri{$f_id} ++;
		}
							$p_syoji_kin{$f_id} -= $cd_op2;
							$k_kokko_sougaku{$p_kunino{$f_id}} += $cd_op2;


							$p_kuni_kouken{$f_id} += 35;
							$p_kunkou{$f_id} += 10;

							$kexaddw = 1 + int(rand(3));
			if($jfi>159 or ($jfi>129 and $jfl>129)){
							$p_ex_tiryoku{$f_id}+= $kexaddw;
			}elsif($jfs>159 or ($jfi>129 and $jfs>129)){
							$p_ex_buryoku{$f_id}+= $kexaddw;
			}elsif($jfl>159 or ($jfl>129 and $jfs>129)){
							$p_ex_tousotu{$f_id}+= $kexaddw;
			}else{
							$kexaddw= int(rand($kexaddw+1));
							$p_ex_tousotu{$f_id}+= $kexaddw;
							$p_ex_buryoku{$f_id}+= $kexaddw;
							$p_ex_tiryoku{$f_id}+= $kexaddw;
			}
						}


}
#######################
sub CD_IDtanren2 {

						$p_mikoudou_t{$f_id}=0;
						if($p_syoji_kin{$f_id} < 0){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:金が足りません。暇な時間を利用して巡察を行いました。");
							&R_JYUNSATU;
						}else{
							$cd_op3=int($cd_op3);
							$cd_op2=int($cd_op2);
							$p_kunkou{$f_id}+=1;
							$a_mp10=int(($sougouno1 + 5 - 150) * 20 / ($p_sougou{$f_id} - 145 - rand(2)));
							$a_cp10=int(($jyussyuno1 - 250) * 20 / ($p_10syu_sougou{$f_id} - 250 - rand(2)));

								$chstr_ex =$p_ex_buryoku{$f_id};
								$chlea_ex =$p_ex_tousotu{$f_id};
								$chint_ex =$p_ex_tiryoku{$f_id};
								$a_mes2 = "";

							if($a_mp10 >= 27){
							$a_mp10 += int($a_mp10 * 1.3);
							}
							if($a_mp10 < 25){
							$a_mp10 = 0;
								$a_mes2 .= "<br />三種総合\能力がプレイヤー平均値を大きく上回っているため、$SANSYU_TANREN[$cd_op2]鍛錬の効果が出ませんでした。";
							}
							if($a_cp10 >= 27){
							$a_cp10 += int($a_cp10 * 1.3);
							}
								$add_jyuu_f1 =int($cd_op3 % 100);
							if($a_cp10 < 25){
							$a_cp10 = 0;
								$a_mes2 .= "<br />十種総合\能力がプレイヤー平均値を大きく上回っているため、$JYUSSYU_TANREN[$add_jyuu_f1]鍛錬の効果が出ませんでした。";
							}
							$a_mp=int($a_mp10 / 10);
							$a_cp=int($a_cp10 / 10);

							if($a_cp > 450){
							$a_cp=450;
							}

							if($a_mp > 450){
							$a_mp=450;
							}

							if($a_cp < 1){
							$a_cp=1;
							}
							if($a_mp < 1){
							$a_mp=1;
							}
							if($a_cp > 3 and $a_cp < 10){
							$a_cp=10;
							}
							if($a_mp > 3 and $a_mp < 10){
							$a_mp=10;
							}
							if($cd_op2 eq "1"){
								$p_ex_buryoku{$f_id} +=int($a_mp * 1);
								$p_ex_tousotu{$f_id} +=int($a_mp * 0.55);
								$p_ex_tiryoku{$f_id} +=int($a_mp * 0.25);
							if($a_mp > 5){
								$p_ex_buryoku{$f_id} +=int($a_mp * 2);
								$p_ex_tousotu{$f_id} +=int($a_mp * 1.1);
								$p_ex_tiryoku{$f_id} +=int($a_mp * 0.5);
								$a_mes2 .= "<br />三種総合\能力がプレイヤー平均値を大きく下回っているため、$SANSYU_TANREN[$cd_op2]鍛錬にボーナス経験値が入りました。";
							}
							$p_ex_buryoku{$f_id}++;
							$p_ex_tousotu{$f_id}+= int(rand(2));
		$a_mes = "$SANSYU_TANREN[$cd_op2]";
							}elsif($cd_op2 eq "2"){
								$p_ex_buryoku{$f_id} +=int($a_mp * 0.25);
								$p_ex_tousotu{$f_id} +=int($a_mp * 0.55);
								$p_ex_tiryoku{$f_id} +=int($a_mp * 1);
							if($a_mp > 5){
								$p_ex_buryoku{$f_id} +=int($a_mp * 0.5);
								$p_ex_tousotu{$f_id} +=int($a_mp * 1.1);
								$p_ex_tiryoku{$f_id} +=int($a_mp * 2);
								$a_mes2 .= "<br />三種総合\能力がプレイヤー平均値を大きく下回っているため、$SANSYU_TANREN[$cd_op2]鍛錬にボーナス経験値が入りました。";
							}
							$p_ex_tiryoku{$f_id}++;
							$p_ex_tousotu{$f_id}+= int(rand(2));
		$a_mes = "$SANSYU_TANREN[$cd_op2]";
							}elsif($cd_op2 eq "3"){
								$p_ex_buryoku{$f_id} +=int($a_mp * 0.55);
								$p_ex_tousotu{$f_id} +=int($a_mp * 1);
								$p_ex_tiryoku{$f_id} +=int($a_mp * 0.25);
							if($a_mp > 5){
								$p_ex_buryoku{$f_id} +=int($a_mp * 1.1);
								$p_ex_tousotu{$f_id} +=int($a_mp * 2);
								$p_ex_tiryoku{$f_id} +=int($a_mp * 0.5);
								$a_mes2 .= "<br />三種総合\能力がプレイヤー平均値を大きく下回っているため、$SANSYU_TANREN[$cd_op2]鍛錬にボーナス経験値が入りました。";
							}
							$p_ex_tousotu{$f_id}++;
							$p_ex_buryoku{$f_id}+= int(rand(2));
		$a_mes = "$SANSYU_TANREN[$cd_op2]";
							}elsif($cd_op2 eq "12"){
								$p_ex_buryoku{$f_id} +=int($a_mp * 1);
								$p_ex_tousotu{$f_id} +=int($a_mp * 0.25);
								$p_ex_tiryoku{$f_id} +=int($a_mp * 0.55);
							if($a_mp > 5){
								$p_ex_buryoku{$f_id} +=int($a_mp * 2);
								$p_ex_tousotu{$f_id} +=int($a_mp * 0.5);
								$p_ex_tiryoku{$f_id} +=int($a_mp * 1.1);
								$a_mes2 .= "<br />三種総合\能力がプレイヤー平均値を大きく下回っているため、$SANSYU_TANREN[$cd_op2]鍛錬にボーナス経験値が入りました。";
							}
							$p_ex_buryoku{$f_id}++;
							$p_ex_tiryoku{$f_id}+= int(rand(2));
		$a_mes = "$SANSYU_TANREN[$cd_op2]";
							}elsif($cd_op2 eq "22"){
								$p_ex_buryoku{$f_id} +=int($a_mp * 0.55);
								$p_ex_tousotu{$f_id} +=int($a_mp * 0.25);
								$p_ex_tiryoku{$f_id} +=int($a_mp * 1);
							if($a_mp > 5){
								$p_ex_buryoku{$f_id} +=int($a_mp * 1.1);
								$p_ex_tousotu{$f_id} +=int($a_mp * 0.5);
								$p_ex_tiryoku{$f_id} +=int($a_mp * 2);
								$a_mes2 .= "<br />三種総合\能力がプレイヤー平均値を大きく下回っているため、$SANSYU_TANREN[$cd_op2]鍛錬にボーナス経験値が入りました。";
							}
							$p_ex_tiryoku{$f_id}++;
							$p_ex_buryoku{$f_id}+= int(rand(2));
		$a_mes = "$SANSYU_TANREN[$cd_op2]";
							}elsif($cd_op2 eq "32"){
								$p_ex_buryoku{$f_id} +=int($a_mp * 0.25);
								$p_ex_tousotu{$f_id} +=int($a_mp * 1);
								$p_ex_tiryoku{$f_id} +=int($a_mp * 0.55);
							if($a_mp > 5){
								$p_ex_buryoku{$f_id} +=int($a_mp * 0.5);
								$p_ex_tousotu{$f_id} +=int($a_mp * 2);
								$p_ex_tiryoku{$f_id} +=int($a_mp * 1.1);
								$a_mes2 .= "<br />三種総合\能力がプレイヤー平均値を大きく下回っているため、$SANSYU_TANREN[$cd_op2]鍛錬にボーナス経験値が入りました。";
							}
							$p_ex_tousotu{$f_id}++;
							$p_ex_tiryoku{$f_id}+= int(rand(2));
		$a_mes = "$SANSYU_TANREN[$cd_op2]";
							}
								$ch10_1ex =${$JYUSSYU_EX[$add_jyuu_f1]}{$f_id};
								${$JYUSSYU_EX[$add_jyuu_f1]}{$f_id} +=$a_cp + int(rand(2));
								$ch10_1ex2 =${$JYUSSYU_EX[$add_jyuu_f1]}{$f_id};
							$a_mp=$a_cp;
		$a_mes .= "＆$JYUSSYU_C2[$add_jyuu_f1]";
								$add_jyuu_f2 =int(rand(5));
								$add_jyuu_f2 =${$JYUSSYU_SUB[$add_jyuu_f1]}[$add_jyuu_f2];
								$ch10_2ex =${$JYUSSYU_EX[$add_jyuu_f2]}{$f_id};
								${$JYUSSYU_EX[$add_jyuu_f2]}{$f_id} +=int(($a_cp/3) + rand(2));
								$ch10_2ex2 =${$JYUSSYU_EX[$add_jyuu_f2]}{$f_id};
								$ch10_2ex =$ch10_2ex2 - $ch10_2ex;

								$chstr_ex =$p_ex_buryoku{$f_id} - $chstr_ex;
								$chlea_ex =$p_ex_tousotu{$f_id} - $chlea_ex;
								$chint_ex =$p_ex_tiryoku{$f_id} - $chint_ex;
								$ch10_1ex =$ch10_1ex2 - $ch10_1ex;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:自己鍛錬で$a_mesを強化。武力EX+$chstr_ex,知力EX+$chint_ex,統率EX+$chlea_ex,$JYUSSYU_TANREN[$add_jyuu_f1]EX+$ch10_1ex,$JYUSSYU_TANREN[$add_jyuu_f2]EX+$ch10_2ex。$a_mes2");
						}
}
#######################
sub CD_IDgijyutu {

						$p_mikoudou_t{$f_id}=0;
							$addmax = $t_gijyutu_max{$ft_id};

						if($p_syoji_kin{$f_id}<50){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:資金不足で実行できませんでした。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif($t_gijyutu_ti{$ft_id} >= $addmax and int(rand($jfi)) > 10){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:これ以上技術力は上昇しないようです。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}else{
					$add_b_gijyutu{$f_id} = int($item_seinou{$p_syomotu{$f_id}} + int(rand(($p_seiji{$f_id} * 2) + $p_jyuukisouda{$f_id} + ($p_kougaku_tekisei{$f_id} * 2) + ($p_hatumei{$f_id} * 2) + $p_syuutyuu{$f_id} + $p_excalm{$f_id} + $p_exluck{$f_id})*0.1));
					$add_naisei += $add_b_gijyutu{$f_id};
							$zsigotoadd = int(($p_tiryoku{$f_id}+$add_naisei)/12 + rand($p_tiryoku{$f_id}+$add_naisei) / 20);
						if($k_yakusyoku_id{$fk_id}[6] eq $f_id or $k_yakusyoku_id{$fk_id}[19] eq $f_id){
							$zsigotoadd += 6;
						}
							$hann = "";
							$maxhann = "";
							$atted = $t_gijyutu_ti{$ft_id};
							$t_gijyutu_ti{$ft_id} += $zsigotoadd;
							$p_syoji_kin{$f_id} -= 50;
							if($t_gijyutu_ti{$ft_id} > $addmax){
								$t_gijyutu_ti{$ft_id} = $addmax;
								if($atted < $addmax){$zsigotoadd = $addmax - $atted;
							$p_ex_tiryoku{$f_id}+= int(rand(3))+1;
							$maxhann = "MAX値に到達しました！";
								}else{
							$maxhann = "効果はありませんでした";$zsigotoadd = 0;
									if($jfi>129){
							$p_ex_tiryoku{$f_id}+= int(rand(2));
									}
								}
							}else{
$p_ex_karumalc{$f_id} += 0;
$p_ex_karumald{$f_id} += 0;
$p_gogyou_ka{$f_id} += 1;
$p_gogyou_sui{$f_id} += 0;
$p_gogyou_moku{$f_id} += 2;
$p_gogyou_kin{$f_id} -= 3;
$p_gogyou_do{$f_id} += 0;
							$p_ex_tiryoku{$f_id}+= int(rand(4));
							$p_kunkou{$f_id} += 15;
								$wadd = 24 + int($t_gijyutu_ti{$ft_id} * 50 / $addmax);
			if($jfi>129 and int(rand($wadd)) < 1){
								$wadd = $zsigotoadd + $item_seinou{$p_syomotu{$f_id}};
							@DEF_LISTW=();
							open(IN,"./w_db/mati/k$p_taizai_iti{$f_id}.cgi");
							@DEF_LISTW = <IN>;
							close(IN);

							unshift(@DEF_LISTW,"$f_id<>$p_name{$f_id}<>1<>$wadd<>$p_kunino{$f_id}<>0<>\n");
							open(OUT,">./w_db/mati/k$p_taizai_iti{$f_id}.cgi");
							print OUT @DEF_LISTW;
							close(OUT);
							$hann = "来るべき戦に備え、敵の注意をひきつける偽の砦を建築しました。";
							$p_ex_tiryoku{$f_id}+= int(rand(5))+7;
							$p_kunkou{$f_id} += 10;
			}elsif(1 > int(rand(120))){
							$kitw = int(rand(10));
							$kitw = "5$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}のとある廃屋の書斎にて<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:新たな技術を模索している最中、とある廃屋の書斎にて<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
			}
							}
							$p_kunkou{$f_id} += 30;
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の技術を<span class=\"cFF0000\">+$zsigotoadd</span>開発しました。$atted⇒$t_gijyutu_ti{$ft_id}/$addmax。$maxhann$hann");
							$p_ex_tiryoku{$f_id}++;
						}
}
#######################
sub CD_IDhosyuu {

						$p_mikoudou_t{$f_id}=0;
						if($p_syoji_kin{$f_id}<50){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:資金不足で実行できませんでした。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif($p_kunizokusei{$f_id} and $t_zoku_taikyuu_ti{$ft_id} >= $t_zoku_taikyuu_max{$ft_id} and int(rand($jfi)) > 10){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:これ以上賊砦の耐久は上昇しないようです。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif(!$p_kunizokusei{$f_id} and $t_siro_taikyuu_ti{$ft_id} >= $t_siro_taikyuu_max{$ft_id} and int(rand($jfi)) > 10){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:これ以上城壁耐久は上昇しないようです。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}else{
							$zsigotoadd = int(($p_tiryoku{$f_id}+$add_naisei + rand(40))/14 + rand($p_tiryoku{$f_id}+$add_naisei) / 20);
						if($k_yakusyoku_id{$fk_id}[6] eq $f_id){
							$zsigotoadd += 6;
						}
							$zsigotoadd = int($zsigotoadd * 2);
							$hann = "";
							$maxhann = "";
						if($p_kunizokusei{$f_id}){
							$atted = $t_zoku_taikyuu_ti{$ft_id};
							$attedmax = $t_zoku_taikyuu_max{$ft_id};
						}else{
							$atted = $t_siro_taikyuu_ti{$ft_id};
							$attedmax = $t_siro_taikyuu_max{$ft_id};
						}
							$attedw= $atted +$zsigotoadd;
							$p_syoji_kin{$f_id} -= 50;
							if($attedw > $attedmax){
								$attedw = $attedmax;
								if($atted < $attedmax){$zsigotoadd = $attedmax - $atted;
							$p_ex_tiryoku{$f_id}+= int(rand(3))+1;
							$maxhann = "MAX値に到達しました！";
								}else{
							$maxhann = "効果はありませんでした";
							$zsigotoadd = 0;
									if($jfi>129){
							$p_ex_tiryoku{$f_id}+= int(rand(2));
									}
								}
							}else{
$p_ex_karumalc{$f_id} += 0;
$p_ex_karumald{$f_id} += 0;
$p_gogyou_ka{$f_id} += 0;
$p_gogyou_sui{$f_id} += 2;
$p_gogyou_moku{$f_id} += 1;
$p_gogyou_kin{$f_id} += 0;
$p_gogyou_do{$f_id} -= 3;
							$p_ex_tiryoku{$f_id}+= int(rand(3));
							$p_kunkou{$f_id} += 15;
								$wadd = 24 + int($attedw * 50 / $attedmax);
			if($jfi>129 and int(rand($wadd)) < 1 and !$p_kunizokusei{$f_id}){
								$wadd = $zsigotoadd + $item_seinou{$p_syomotu{$f_id}};
							@DEF_LISTW=();
							open(IN,"./w_db/mati/s$p_taizai_iti{$f_id}.cgi");
							@DEF_LISTW = <IN>;
							close(IN);

							unshift(@DEF_LISTW,"$f_id<>$p_name{$f_id}<>1<>$wadd<>$p_kunino{$f_id}<>0<>\n");
							open(OUT,">./w_db/mati/s$p_taizai_iti{$f_id}.cgi");
							print OUT @DEF_LISTW;
							close(OUT);
							$hann = "来るべき戦に備え、城の片隅に落とし穴の罠を仕掛けました。";
							$p_ex_tiryoku{$f_id}+= int(rand(5))+7;
							$p_kunkou{$f_id} += 20;
			}elsif(1 > int(rand(120))){
							$kitw = int(rand(9));
							$kitw = "1$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}にて城壁耐久強化の作業中に<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:城壁耐久強化の作業中に<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
			}
							}


							$p_kunkou{$f_id} += 30;
							$zokucome = "";
							$zaddw = $attedw;
							$zaddwmax = $attedmax;
						if($p_kunizokusei{$f_id}){
									if(!int(rand(5))){
									$add_1 = $zsigotoadd * 30;
									$p_syoji_kin{$f_id} += $add_1;
							$hann = "<br />天子「$k_tensi_name{$p_kunino{$f_id}}」より、褒美として金<span class=\"cFF0000\">+$add_1</span>が手渡されました。";
									}
							$zokucome = "（賊砦）";
							$t_zoku_taikyuu_ti{$ft_id} = $attedw;
						}else{
							$t_siro_taikyuu_ti{$ft_id} = $attedw;
						}
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}$zokucomeの城壁耐久力を<span class=\"cFF0000\">+$zsigotoadd</span>強化しました。$atted⇒$zaddw/$zaddwmax。$maxhann$hann");
							$p_ex_tiryoku{$f_id}++;
						}


}
#######################
sub CD_IDkomedoro {
						$p_mikoudou_t{$f_id}=0;
						if($t_ryoumin_suu{$ft_id}<10000){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:人口が少なすぎます。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif($t_nougyou_ti{$ft_id} < 1 and int(rand($jfi)) > 10){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:農業値不足で農家の米が底をついています。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}else{
							$zsigotoadd = int((($p_tiryoku{$f_id}+$add_naisei)/12 + ($p_sougou{$f_id}/40) + rand($p_tiryoku{$f_id}+$add_naisei) / 20)*0.2);

							$hann = "";
							$maxhann = "";
							$atted = $t_nougyou_ti{$ft_id};
							$t_nougyou_ti{$ft_id} -= $zsigotoadd;
							if($t_nougyou_ti{$ft_id} < 1){
								$t_nougyou_ti{$ft_id} = 0;
								if($atted < 1){$zsigotoadd = $atted;
							$p_ex_tiryoku{$f_id}+= int(rand(3))+1;
							$maxhann = "";
								}else{
							$maxhann = "農業値が0になりました。";$zsigotoadd = 0;
									if($jfi>129){
							$p_ex_tiryoku{$f_id}+= int(rand(2));
									}
								}
							}else{
$p_ex_karumalc{$f_id} -= 2;
$p_ex_karumald{$f_id} += 0;
$p_gogyou_ka{$f_id} += 0;
$p_gogyou_sui{$f_id} += 0;
$p_gogyou_moku{$f_id} += 0;
$p_gogyou_kin{$f_id} -= 0;
$p_gogyou_do{$f_id} += 0;
							$p_ex_tiryoku{$f_id}+= int(rand(4));
							$p_kunkou{$f_id} += 15;
			if(1 > int(rand(120))){
							$kitw = int(rand(10));
							$kitw = "5$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}のとある廃屋の書斎にて<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:倉庫を物色している最中、とある廃屋の書斎にて<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
			}
							}
					$wadd2 = $zsigotoadd * 10;
					$p_syoji_kome{$f_id} += $wadd2;
					$t_ryoumin_suu{$ft_id} -= $wadd2;
							$p_kunkou{$f_id} += 30;
$SIGOTOSAKIK[0] = '農家';
$SIGOTOSAKIK[1] = '兵糧庫';
$SIGOTOSAKIK[2] = '兵舎';
$SIGOTOSAKIK[3] = '牧場';
$SIGOTOSAKIK[4] = '城';
$SIGOTOSAKIK[5] = '食堂';
$SIGOTOSAKIK[6] = '城';
$SIGOTOSAKIK[7] = '兵糧庫';
$SIGOTOSAKIK[8] = '兵舎';
$SIGOTOSAKIK[9] = '城';
							$sigotosaki = int(rand(10));
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の$SIGOTOSAKIK[$sigotosaki]に忍び込み、米を<span class=\"cFF0000\">$wadd2</span>頂戴しました。農業値$atted⇒$t_nougyou_ti{$ft_id}/$t_nougyou_max{$ft_id}。$maxhann$hann");
							$p_ex_tiryoku{$f_id}++;
						}
}
#######################
sub CD_IDgoudatu {
						$p_mikoudou_t{$f_id}=0;
						if($t_ryoumin_suu{$ft_id}<10000){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:人口が少なすぎます。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}elsif($t_syougyou_ti{$ft_id} < 1 and int(rand($jfi)) > 10){
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:商業値不足で商店の金が底をついています。替わりにその場で巡察を行いました。");
							&R_JYUNSATU;
						}else{
							$zsigotoadd = int((($p_buryoku{$f_id}+$item_seinou{$p_syomotu{$f_id}})/12 + ($p_sougou{$f_id}/40) + rand($p_buryoku{$f_id}+$item_seinou{$p_migite{$f_id}}) / 20)*0.2);

							$hann = "";
							$maxhann = "";
							$atted = $t_syougyou_ti{$ft_id};
							$t_syougyou_ti{$ft_id} -= $zsigotoadd;
							if($t_syougyou_ti{$ft_id} < 1){
								$t_syougyou_ti{$ft_id} = 0;
								if($atted < 1){$zsigotoadd = $atted;
							$p_ex_buryoku{$f_id}+= int(rand(3))+1;
							$maxhann = "";
								}else{
							$maxhann = "商業値が0になりました。";$zsigotoadd = 0;
									if($jfi>129){
							$p_ex_buryoku{$f_id}+= int(rand(2));
									}
								}
							}else{
$p_ex_karumalc{$f_id} -= 2;
$p_ex_karumald{$f_id} += 0;
$p_gogyou_ka{$f_id} += 0;
$p_gogyou_sui{$f_id} += 0;
$p_gogyou_moku{$f_id} += 0;
$p_gogyou_kin{$f_id} -= 0;
$p_gogyou_do{$f_id} += 0;
							$p_ex_buryoku{$f_id}+= int(rand(4));
							$p_kunkou{$f_id} += 15;
			if(1 > int(rand(120))){
							$kitw = int(rand(10));
							$kitw = "5$kitw";
			if(1 > int(rand(5))){
							$kitw = int(rand(8))+1;
			}
		&ITEM_IN;
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}のとある廃屋の書斎にて<span class=\"cFF0000\">$gitem[$kitw]</span>を入手する。");
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:金目の物を物色している最中、とある廃屋の書斎にて<span class=\"cFF0000\">$gitem[$kitw]</span>を入手しました。");
			}
							}
					$wadd2 = $zsigotoadd * 10;
					$p_syoji_kin{$f_id} += $wadd2;
					$t_ryoumin_suu{$ft_id} -= $wadd2;
							$p_kunkou{$f_id} += 30;
$SIGOTOSAKIG[0] = '高利貸';
$SIGOTOSAKIG[1] = '賭博場';
$SIGOTOSAKIG[2] = '酒屋';
$SIGOTOSAKIG[3] = '街道を歩いていた通行人';
$SIGOTOSAKIG[4] = '街道を歩いていた役人';
$SIGOTOSAKIG[5] = '風俗店';
$SIGOTOSAKIG[6] = '賭博場';
$SIGOTOSAKIG[7] = '高利貸';
$SIGOTOSAKIG[8] = '高利貸';
$SIGOTOSAKIG[9] = '賭博場';

$SIGOTOSAKIG2[0] = '売上';
$SIGOTOSAKIG2[1] = '売上';
$SIGOTOSAKIG2[2] = '売上';
$SIGOTOSAKIG2[3] = '所持';
$SIGOTOSAKIG2[4] = '所持';
$SIGOTOSAKIG2[5] = '売上';
$SIGOTOSAKIG2[6] = '売上';
$SIGOTOSAKIG2[7] = '売上';
$SIGOTOSAKIG2[8] = '売上';
$SIGOTOSAKIG2[9] = '売上';
							$sigotosaki = int(rand(10));
							$w_id=$f_id;&P_LOG_W("$nen_genzai年$tuki_genzai月:$t_name{$ft_id}の$SIGOTOSAKIG[$sigotosaki]から$SIGOTOSAKIG2[$sigotosaki]金<span class=\"cFF0000\">$wadd2</span>を強奪しました。商業値$atted⇒$t_syougyou_ti{$ft_id}/$t_syougyou_max{$ft_id}。$maxhann$hann");
							$p_ex_buryoku{$f_id}++;
						}

}
#######################
sub CD_ID {
}

############

sub SENTOU_SET {

									$kbp_str2[$ki] = $p_buryoku{$kbp_id[$ki]};
										$kbp_att_add[$ki] = 0;
										$kbp_att_def[$ki] = 0;

									$ebp_str2[$ei] = $p_buryoku{$ebp_id[$ei]};

										$ebp_att_add[$ei] = 0;
										$ebp_att_def[$ei] = 0;
										$p_heisyu{$kbp_id[$ki]} = int($p_heisyu{$kbp_id[$ki]});
										$p_heisyu{$ebp_id[$ei]} = int($p_heisyu{$ebp_id[$ei]});
						&{"SENTOU_TI_HEI_K$p_heisyu{$kbp_id[$ki]}"}();
						&{"SENTOU_TI_HEI_E$p_heisyu{$ebp_id[$ei]}"}();

									$kbp_att_add3[$ki] = int((${"tiko$md_eria"}[$p_heisyu{$kbp_id[$ki]}] - 20) * $p_sougou{$kbp_id[$ki]}/150)+$katt_add3;
									$ebp_att_add3[$ei] = int((${"tiko$md_eria"}[$p_heisyu{$ebp_id[$ei]}] - $tikohn) * $p_sougou{$ebp_id[$ei]}/150)+$eatt_add3;

										$kbp_att_def[$ki] -= $p_b_hirou{$kbp_id[$ki]} + $p_h_hirou{$kbp_id[$ki]} + $p_hei_siki{$kbp_id[$ki]} - 50;
										$ebp_att_def[$ei] -= $p_b_hirou{$ebp_id[$ei]} + $p_h_hirou{$ebp_id[$ei]} + $p_hei_siki{$ebp_id[$ei]} - 50;

										$add_i_hit = int(rand(3));
			$kbp_apadd[$ki] = int(($kbp_add_jyuu[$ki]+$kbp_str2[$ki] + $bpi_dmg{$kbp_id[$ki]}[$add_i_hit] + $kbp_att_add[$ki] + $kbp_att_add2[$ki] + $kbp_att_add3[$ki]) * $kbp_heisenia[$ki] /8);
			$kbp_acadd[$ki] = int(($kbp_add_jyuu[$ki]+$kbp_att_def[$ki] + int($p_kunren{$kbp_id[$ki]} / 2.5)) * $kbp_heisenid[$ki] /8);

										$add_i_hit = int(rand(3));
			$ebp_apadd[$ei] = int(($ebp_add_jyuu[$ei]+$ebp_str2[$ei] + $bpi_dmg{$ebp_id[$ei]}[$add_i_hit] + $ebp_att_add[$ei] + $ebp_att_add2[$ei] + $ebp_att_add3[$ei]) * $ebp_heisenia[$ei] /8);
			$ebp_acadd[$ei] = int(($ebp_add_jyuu[$ei]+$ebp_att_def[$ei] + $ebp_att_def2[$ei] + int($p_kunren{$ebp_id[$ei]} / 2.5)) * $ebp_heisenid[$ei] /8);

			$kbp_att[$ki] = $kbp_apadd[$ki] - $ebp_acadd[$ei];
									if($kbp_att[$ki] < 2){$kbp_att[$ki] = 2;}
			$ebp_att[$ei] = $ebp_apadd[$ei] - $kbp_acadd[$ki];
									if($ebp_att[$ei] < 2){$ebp_att[$ei] = 2;}


}

#######################
sub SENTOU_TI_HEI_K1 {

										$kbp_att_add[$ki] = 0;
										$kbp_att_def[$ki] = 0;
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "12"){
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.2);
										}
}

#######################
sub SENTOU_TI_HEI_K2 {
										$kbp_att_add[$ki] = 0;
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.05);
										$kbp_str2[$ki] = int($kbp_sougou[$ki] * 0.6);
										if($battle_end or int($md_eria / 10) == 1){
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.15);
										}
}
#######################
sub SENTOU_TI_HEI_K3 {

										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.06);
										$kbp_att_def[$ki] = 0;
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "1"){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.14);
										}elsif($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "3"){
										$kbp_att_def[$ki] += int($kbp_sougou[$ki] * 0.3);
										}
}
#######################
sub SENTOU_TI_HEI_K4 {

										$kbp_att_add[$ki] = 0;
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.05);
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));
}
#######################
sub SENTOU_TI_HEI_K5 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.15);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.20);
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));
}
#######################
sub SENTOU_TI_HEI_K6 {
										$kbp_att_add[$ki] = 0;
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.3);
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.6)+($p_tousotu{$kbp_id[$ki]} * 0.85));
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "5" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "6" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "7" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "13" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "17" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "18"){
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.5);
										}
										if($battle_end){
										$kbp_att_def[$ki] = 0;
										}
}
#######################
sub SENTOU_TI_HEI_K7 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.27);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.03);
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "1"){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.2);
										}elsif($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "6" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "7" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "17" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "18"){
										$kbp_att_def[$ki] += int($kbp_sougou[$ki] * 0.24);
										}
}
#######################
sub SENTOU_TI_HEI_K8 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.35);
										$kbp_att_def[$ki] = 0;
										$kbp_str2[$ki] = int(($p_tiryoku{$kbp_id[$ki]} * 0.85)+($p_buryoku{$kbp_id[$ki]} * 0.6));
										if(!$battle_end and ($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "4" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "9")){
										$kbp_att_add[$ki] += int($p_tiryoku{$kbp_id[$ki]} * 0.5) + int($p_buryoku{$kbp_id[$ki]} * 0.9);
										$kbp_att_def[$ki] += int($p_tiryoku{$kbp_id[$ki]} * 0.7) + int($p_buryoku{$kbp_id[$ki]} * 0.3);
											if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "9"){
									$kbp_tyakka[$ki] = 1;
											}
										}
}
#######################
sub SENTOU_TI_HEI_K9 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.25);
										$kbp_att_def[$ki] = int(rand((100-$p_jinbou{$kbp_id[$ki]}) * 0.5));
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.75)+($p_tiryoku{$kbp_id[$ki]} * 0.7));
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "20"){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.2);
										}

}
#######################
sub SENTOU_TI_HEI_K10 {
}
#######################
sub SENTOU_TI_HEI_K11 {
										$kbp_att_add[$ki] = 0;
										$kbp_att_def[$ki] = 0;
										$kbp_str2[$ki] = int($p_tiryoku{$kbp_id[$ki]} * 0.3)+ int($kbp_sougou[$ki] * 0.2);
										if($battle_end or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "11"){
										$kbp_att_add[$ki] += int($p_tiryoku{$kbp_id[$ki]} * 1)+ int($kbp_sougou[$ki] * 0.4);
										$kbp_att_def[$ki] += int($kbp_sougou[$ki] * 0.5);
										}
										

}
#######################
sub SENTOU_TI_HEI_K12 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.2);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.3);
										$kbp_str2[$ki] = int($p_tiryoku{$kbp_id[$ki]} * 1);
										if($battle_end){
										$kbp_att_add[$ki] = 0;
										$kbp_att_def[$ki] = 0;
										}elsif($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "9" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "10"){
										$kbp_att_add[$ki] += int($p_tiryoku{$kbp_id[$ki]} * 0.4);
											if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "9"){
									$kbp_tyakka[$ki] = 1;
											}
										}

}
#######################
sub SENTOU_TI_HEI_K13 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.3);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.35);
										$kbp_str2[$ki] = int(($p_tousotu{$kbp_id[$ki]} * 0.85)+($p_buryoku{$kbp_id[$ki]} * 0.6));

}
#######################
sub SENTOU_TI_HEI_K14 {
										$kbp_att_add[$ki] = int(rand($p_tousotu{$kbp_id[$ki]} * 1)+($kbp_sougou[$ki] * 0.15));
										$kbp_att_def[$ki] = int(rand($p_jinbou{$kbp_id[$ki]} * 1));
										$kbp_str2[$ki] = int($kbp_sougou[$ki] * 0.6);
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "15" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "19"){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.1);
										$kbp_att_def[$ki] += int($kbp_sougou[$ki] * 0.1);
										}

}
#######################
sub SENTOU_TI_HEI_K15 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.45);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.2);
										$kbp_str2[$ki] = int(($p_tousotu{$kbp_id[$ki]} * 0.85)+($p_buryoku{$kbp_id[$ki]} * 0.6));
}
#######################
sub SENTOU_TI_HEI_K16 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.3);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.2);
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.75)+($p_tiryoku{$kbp_id[$ki]} * 0.7));
}
#######################
sub SENTOU_TI_HEI_K17 {
										$kbp_att_add[$ki] = 0;
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.1);
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));
										if($battle_end){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.3);
										$kbp_att_def[$ki] += int($kbp_sougou[$ki] * 0.2);
										$p_kunren{$ebp_id[$ei]} = 0;
										}

}
#######################
sub SENTOU_TI_HEI_K18 {
										$kbp_att_add[$ki] = 0;
										$kbp_att_def[$ki] = 0;
										$kbp_str2[$ki] = int($kbp_sougou[$ki] * 0.5);
										if($battle_end){
										$kbp_att_add[$ki] += int(($p_tousotu{$kbp_id[$ki]} * 0.7 + $p_tiryoku{$kbp_id[$ki]} + $p_buryoku{$kbp_id[$ki]}) * 0.6);
										$kbp_att_def[$ki] += int(($p_tousotu{$kbp_id[$ki]} * 0.7 + $p_tiryoku{$kbp_id[$ki]} + $p_buryoku{$kbp_id[$ki]}) * 0.4);
										}
}
#######################
sub SENTOU_TI_HEI_K19 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.3);
										$kbp_att_def[$ki] = 0;
										$kbp_str2[$ki] = int(($p_tiryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));

										if($battle_end){
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.4);
										}elsif(int($md_eria / 10) == 1){
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.3);
										}
}
#######################
sub SENTOU_TI_HEI_K20 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.5);
										$kbp_att_def[$ki] = 0;
										$kbp_str2[$ki] = int(($p_tousotu{$kbp_id[$ki]} * 0.85)+($p_tiryoku{$kbp_id[$ki]} * 0.6));

										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "1" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "6" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "7" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "17" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "18"){
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.3);
										}

}
#######################
sub SENTOU_TI_HEI_K21 {
										$kbp_att_add[$ki] = int($p_buryoku{$kbp_id[$ki]} * 0.1);
										$kbp_att_def[$ki] = int($p_buryoku{$kbp_id[$ki]} * 0.5);
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));
										$kbp_sisihunjin[$ki] = 1;
}
#######################
sub SENTOU_TI_HEI_K22 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.1);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.2);
										$kbp_str2[$ki] = int(($p_tiryoku{$kbp_id[$ki]} * 0.85)+($p_buryoku{$kbp_id[$ki]} * 0.6));

										if($battle_end){
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.2);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.2);
										}
									$kbp_genjt[$ki]=1;
											if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "9"){
									$kbp_tyakka[$ki] = 1;
											}
}
#######################
sub SENTOU_TI_HEI_K23 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.35);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.20);
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "18" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "2"){
										$kbp_att_def[$ki] += int($kbp_sougou[$ki] * 0.1);
										}

}
#######################
sub SENTOU_TI_HEI_K24 {
										$kbp_att_add[$ki] = 0;
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.4);
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));
										if($p_heisyu{$ebp_id[$ei]} eq "12"){
										$kbp_att_def[$ki] = 0;
										}
}
#######################
sub SENTOU_TI_HEI_K25 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.35);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.20);
										$kbp_str2[$ki] = int(($p_tiryoku{$kbp_id[$ki]} * 0.85)+($p_buryoku{$kbp_id[$ki]} * 0.6));
									$kbp_youjt[$ki]=1;
			if($k_kokkyou{$p_kunino{$kbp_id[$ki]}} eq "4"){

	if($k_kokkyou_keika_nen{$p_kunino{$kbp_id[$ki]}} > 10){
				$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.15);
	}
			}
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "10" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "14" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "16"){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.1);
										}
}
#######################
sub SENTOU_TI_HEI_K26 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.5);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.1);
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "0" or $battle_end){
										$kbp_att_def[$ki] += int($kbp_sougou[$ki] * 0.1);
										}

}
#######################
sub SENTOU_TI_HEI_K27 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.3);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.3);
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "3" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "11"){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.4);
										}
										if($p_heisyu{$ebp_id[$ei]} eq "38"){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.1);
										}
}
#######################
sub SENTOU_TI_HEI_K28 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.1);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.45);
										$kbp_str2[$ki] = int(($p_tousotu{$kbp_id[$ki]} * 0.85)+($p_buryoku{$kbp_id[$ki]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "18" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "17"){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.1);
										}

}
#######################
sub SENTOU_TI_HEI_K29 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.15);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.25);
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));
										if($t_tiri_f1{$ft_id} eq "2"){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.1);
										}
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "21"){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.1);
										}

}
#######################
sub SENTOU_TI_HEI_K30 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.65);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.1);
										$kbp_str2[$ki] = int(($p_tousotu{$kbp_id[$ki]} * 0.85)+($p_buryoku{$kbp_id[$ki]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "0" or $battle_end){
										$kbp_att_def[$ki] += int($kbp_sougou[$ki] * 0.1);
										}

}
#######################
sub SENTOU_TI_HEI_K31 {
										$kbp_att_add[$ki] = 0;
										$kbp_att_def[$ki] = 0;
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));

										if(!$battle_end and ($t_tiri_f1{$ft_id} eq "1" or $md_eria eq "30")){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.25);
										$kbp_att_def[$ki] += int($kbp_sougou[$ki] * 0.3);
										}
}
#######################
sub SENTOU_TI_HEI_K32 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.1);
										$kbp_att_def[$ki] = int(rand((100-$p_jinbou{$kbp_id[$ki]}) * 0.5));
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.75)+($p_tiryoku{$kbp_id[$ki]} * 0.7));
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "20"){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.2);
										}
										if(!$battle_end and ($t_tiri_f1{$ft_id} eq "1" or $md_eria eq "30")){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.4);
										$kbp_att_def[$ki] += int($kbp_sougou[$ki] * 0.2);
										}

}
#######################
sub SENTOU_TI_HEI_K33 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.35);
										$kbp_att_def[$ki] = 0;
										$kbp_str2[$ki] = int(($p_tiryoku{$kbp_id[$ki]} * 0.85)+($p_buryoku{$kbp_id[$ki]} * 0.6));
										if(!$battle_end and ($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "4" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "9")){
										$kbp_att_add[$ki] += int($p_tiryoku{$kbp_id[$ki]} * 0.5) + int($p_buryoku{$kbp_id[$ki]} * 0.9);
										$kbp_att_def[$ki] += int($p_tiryoku{$kbp_id[$ki]} * 0.7) + int($p_buryoku{$kbp_id[$ki]} * 0.3);
											if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "9"){
									$kbp_tyakka[$ki] = 1;
											}
										}
}
#######################
sub SENTOU_TI_HEI_K34 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.1);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.3);
										$kbp_str2[$ki] = int(($p_tiryoku{$kbp_id[$ki]} * 0.85)+($p_buryoku{$kbp_id[$ki]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "14"){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.1);
										}
}
#######################
sub SENTOU_TI_HEI_K35 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.2);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.15);
										$kbp_str2[$ki] = int(($p_tousotu{$kbp_id[$ki]} * 0.85)+($p_buryoku{$kbp_id[$ki]} * 0.6));
										if(!$battle_end and ($t_tiri_f1{$ft_id} eq "1" or $md_eria eq "30")){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.2);
										$kbp_att_def[$ki] += int($kbp_sougou[$ki] * 0.05);
										}
}
#######################
sub SENTOU_TI_HEI_K36 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.25);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.1);
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));
										$kbp_sisihunjin[$ki] = 1;
}

#######################
sub SENTOU_TI_HEI_K37 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.15);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.25);
										$kbp_str2[$ki] = int(($p_tousotu{$kbp_id[$ki]} * 0.85)+($p_buryoku{$kbp_id[$ki]} * 0.6));
										$kbp_sikibou[$ki] =1;
}
#######################
sub SENTOU_TI_HEI_K38 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.2);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.3);
										$kbp_str2[$ki] = int(($p_tousotu{$kbp_id[$ki]} * 0.85)+($p_tiryoku{$kbp_id[$ki]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "0" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "2"){
										$kbp_att_def[$ki] += int($kbp_sougou[$ki] * 0.1);
										}
}
#######################
sub SENTOU_TI_HEI_K39 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.3);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.3);
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));
}
#######################
sub SENTOU_TI_HEI_K40 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.25);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.05);
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "1"){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.15);
										}
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "3"){
										$kbp_att_def[$ki] += int($kbp_sougou[$ki] * 0.3);
										}
									$kbp_hadoku[$ki]=6;

}
#######################
sub SENTOU_TI_HEI_K41 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.1);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.45);
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));
}
#######################
sub SENTOU_TI_HEI_K42 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.1);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.2);
										$kbp_str2[$ki] = int($p_tiryoku{$kbp_id[$ki]} * 1);
									$ei_add_iw = int(rand($boueikazu));
									$ebp_hukou[$ei_add_iw] += 1;
										if($sougouno1 * 0.5 < $p_tiryoku{$kbp_id[$ki]}){
									$ei_add_iw = int(rand($boueikazu));
									$ebp_hukou[$ei_add_iw] += 1;
										}
										if($sougouno1 * 0.6 < $p_tiryoku{$kbp_id[$ki]}){
									$ei_add_iw = int(rand($boueikazu));
									$ebp_hukou[$ei_add_iw] += 1;
										}
									$kbp_kouhuku[$ki] = 1;
									$kbp_husyoubou[$ki] = 1;
											if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "9"){
									$kbp_tyakka[$ki] = 1;
											}
}
#######################
sub SENTOU_TI_HEI_K43 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.45);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.05);
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));
										if($battle_end){
										$kbp_att_def[$ki] += int($kbp_sougou[$ki] * 0.3);
									$kbp_tyakka[$ki] = 1;
										}
}
#######################
sub SENTOU_TI_HEI_K44 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.3);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.15);
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));
										if($p_heisyu{$ebp_id[$ei]} eq "38"){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.1);
										}
}
#######################
sub SENTOU_TI_HEI_K45 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.45);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.05);
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));
										$kbp_bidouhosei[$ki] = 0.5;
}
#######################
sub SENTOU_TI_HEI_K46 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.35);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.10);
										$kbp_str2[$ki] = int(($p_tiryoku{$kbp_id[$ki]} * 0.85)+($p_buryoku{$kbp_id[$ki]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "21"){
										$kbp_att_def[$ki] += int($kbp_sougou[$ki] * 0.3);
										}
										if($p_heisyu{$ebp_id[$ei]} eq "16"){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.1);
										}
}
#######################
sub SENTOU_TI_HEI_K47 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.25);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.3);
										$kbp_str2[$ki] = int(($p_tousotu{$kbp_id[$ki]} * 0.85)+($p_buryoku{$kbp_id[$ki]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "0"){
										$kbp_att_def[$ki] += int($kbp_sougou[$ki] * 0.1);
										}
}
#######################
sub SENTOU_TI_HEI_K48 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.4);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.05);
										$kbp_str2[$ki] = int(($p_tiryoku{$kbp_id[$ki]} * 0.85)+($p_buryoku{$kbp_id[$ki]} * 0.6));
									$kbp_hadoku[$ki] = 4;
			if($k_kokkyou{$p_kunino{$kbp_id[$ki]}} eq "1"){
	if($k_kokkyou_keika_nen{$p_kunino{$kbp_id[$ki]}} > 10){
									$kbp_hadoku[$ki] -= 1;
	}
			}
										if($p_heisyu{$ebp_id[$ei]} eq "16"){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.1);
										}
}
#######################
sub SENTOU_TI_HEI_K49 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.1);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.25);
										$kbp_str2[$ki] = int($p_tiryoku{$kbp_id[$ki]} * 1);
											if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "9"){
									$kbp_tyakka[$ki] = 1;
											}
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "15" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "19"){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.1);
										$kbp_att_def[$ki] += int($kbp_sougou[$ki] * 0.1);
										}
}
#######################
sub SENTOU_TI_HEI_K81 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.1);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.2);
										$kbp_str2[$ki] = int(($p_tiryoku{$kbp_id[$ki]} * 0.85)+($p_buryoku{$kbp_id[$ki]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "4" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "9"){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.4);
											if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "9"){
									$kbp_tyakka[$ki] = 1;
											}
										}
									$kbp_senjt[$ki]=1;
									$kbp_youjt[$ki]=1;
									$kbp_genjt[$ki]=1;
}
#######################
sub SENTOU_TI_HEI_K82 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.1);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.25);
										$kbp_str2[$ki] = int($kbp_sougou[$ki] * 0.6);
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "4"){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.14);
										}
}
#######################
sub SENTOU_TI_HEI_K83 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.3);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.15);
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "1"){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.14);
										}elsif($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "3"){
										$kbp_att_def[$ki] += int($kbp_sougou[$ki] * 0.3);
										}

}
#######################
sub SENTOU_TI_HEI_K84 {
}
#######################
sub SENTOU_TI_HEI_K85 {
}
#######################
sub SENTOU_TI_HEI_K86 {
}
#######################
sub SENTOU_TI_HEI_K87 {
}
#######################
sub SENTOU_TI_HEI_K88 {
}
#######################
sub SENTOU_TI_HEI_K89 {
}
#######################
sub SENTOU_TI_HEI_K90 {
}
#######################
sub SENTOU_TI_HEI_K91 {
										$kbp_att_add[$ki] = int($p_tousotu{$kbp_id[$ki]} * 1);
										$kbp_att_def[$ki] = int($p_tiryoku{$kbp_id[$ki]} * 1.5);
										$kbp_str2[$ki] = int($p_buryoku{$kbp_id[$ki]} * 1.5);
									$kbp_senjt[$ki]=1;

}
#######################
sub SENTOU_TI_HEI_K92 {
										$kbp_att_add[$ki] = int(rand($kbp_sougou[$ki])+($kbp_sougou[$ki] * 0.18));
										$kbp_att_def[$ki] = int(rand($p_jinbou{$kbp_id[$ki]} * 1.5));
										$kbp_str2[$ki] = int($kbp_sougou[$ki] * 0.6);
										if($battle_end eq "1"){
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.2);
										$kbp_att_def[$ki] = 0;
										}
									$kbp_senjt[$ki]=1;

}

#######################
sub SENTOU_TI_HEI_K93 {
										$kbp_att_add[$ki] = int($p_buryoku{$kbp_id[$ki]} * 0.8);
										$kbp_att_def[$ki] = 0;
										$kbp_str2[$ki] = int(($p_buryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));
}
#######################
sub SENTOU_TI_HEI_K94 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.1);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.45);
										$kbp_str2[$ki] = int($p_tiryoku{$kbp_id[$ki]} * 1);
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "4"){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.3);
										}
									$kbp_youjt[$ki]=1;
									$kbp_genjt[$ki]=1;
}
#######################
sub SENTOU_TI_HEI_K95 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.2);
										$kbp_att_def[$ki] = 0;
										$kbp_str2[$ki] = int(($p_tousotu{$kbp_id[$ki]} * 0.85)+($kbp_sougou[$ki] * 0.15));
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "21" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "10" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "20"){
										$kbp_att_add[$ki] += int($kbp_sougou[$ki] * 0.1);
										$kbp_att_def[$ki] += int($kbp_sougou[$ki] * 0.1);
										}

}
#######################
sub SENTOU_TI_HEI_K96 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.25);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.45);
										$kbp_str2[$ki] = int($p_tiryoku{$kbp_id[$ki]} * 1);
}
#######################
sub SENTOU_TI_HEI_K97 {
										$kbp_att_add[$ki] = int($kbp_sougou[$ki] * 0.3);
										$kbp_att_def[$ki] = int($kbp_sougou[$ki] * 0.35);
										$kbp_str2[$ki] = int(($p_tiryoku{$kbp_id[$ki]} * 0.85)+($p_tousotu{$kbp_id[$ki]} * 0.6));

}
#######################
sub SENTOU_TI_HEI_K98 {
}
#######################
sub SENTOU_TI_HEI_K99 {
}
#######################
sub SENTOU_TI_HEI_K100 {
}
#######################
sub SENTOU_TI_HEI_K0 {
										$kbp_att_add[$ki] = 0;
										$kbp_att_def[$ki] = 0;
										$kbp_str2[$ki] = int($kbp_sougou[$ki] * 0.6);
}
#######################
sub SENTOU_TI_HEI_K {
}

#######################
sub SENTOU_TI_HEI_E1 {
										$ebp_att_add[$ei] = 0;
										$ebp_att_def[$ei] = 0;
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "12"){
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.2);
										}
}
#######################
sub SENTOU_TI_HEI_E2 {
										$ebp_att_add[$ei] = 0;
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.05);
										$ebp_str2[$ei] = int($ebp_sougou[$ei] * 0.6);
										if(int($md_eria / 10) == 1){
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.1);
										}
}
#######################
sub SENTOU_TI_HEI_E3 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.06);
										$ebp_att_def[$ei] = 0;
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "3"){
										$ebp_att_def[$ei] += int($ebp_sougou[$ei] * 0.3);
										}
}
#######################
sub SENTOU_TI_HEI_E4 {
										$ebp_att_add[$ei] = 0;
										$ebp_att_def[$ei] = int($kbp_sougou[$ki] * 0.1);
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "6" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "7" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "17" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "18"){
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.4);
										$kbp_att_add[$ki] = int($kbp_att_add[$ki] * 0.9);
										$kbp_att_def[$ki] = int($kbp_att_def[$ki] * 0.7);
										}elsif($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "12" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "13"){
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.3);
										}
}
#######################
sub SENTOU_TI_HEI_E5 {
										$ebp_att_add[$ei] = int($kbp_sougou[$ki] * 0.15);
										$ebp_att_def[$ei] = int($kbp_sougou[$ki] * 0.06);
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));
}
#######################
sub SENTOU_TI_HEI_E6 {
										$ebp_att_add[$ei] = 0;
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.3);
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.6)+($p_tousotu{$ebp_id[$ei]} * 0.85));
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "5" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "6" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "7" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "13" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "17" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "18"){
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.5);
										}
}
#######################
sub SENTOU_TI_HEI_E7 {
										$ebp_att_add[$ei] = int($kbp_sougou[$ki] * 0.27);
										$ebp_att_def[$ei] = int($kbp_sougou[$ki] * 0.08);
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "6" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "7" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "17" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "18"){
										$ebp_att_def[$ei] += int($ebp_sougou[$ei] * 0.32);
										}
}
#######################
sub SENTOU_TI_HEI_E8 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.35);
										$ebp_att_def[$ei] = 0;
										$ebp_str2[$ei] = int(($p_tiryoku{$ebp_id[$ei]} * 0.85)+($p_buryoku{$ebp_id[$ei]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "4" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "9"){
										$ebp_att_add[$ei] += int($p_tiryoku{$ebp_id[$ei]} * 0.6) + int($p_buryoku{$ebp_id[$ei]} * 0.9);
										$ebp_att_def[$ei] += int($p_tiryoku{$ebp_id[$ei]} * 0.7) + int($p_buryoku{$ebp_id[$ei]} * 0.4);
											if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "9"){
									$ebp_tyakka[$ei] = 1;
											}
										}
}
#######################
sub SENTOU_TI_HEI_E9 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.1);
										$ebp_att_def[$ei] = int(rand((100-$p_jinbou{$ebp_id[$ei]}) * 0.5));
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.75)+($p_tiryoku{$ebp_id[$ei]} * 0.7));
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "20"){
										$ebp_att_add[$ei] += int($ebp_sougou[$ei] * 0.2);
										}
}
#######################
sub SENTOU_TI_HEI_E10 {
}
#######################
sub SENTOU_TI_HEI_E11 {
										$ebp_att_add[$ei] = 0;
										$ebp_att_def[$ei] = 0;
										$ebp_str2[$ei] = int($p_tiryoku{$ebp_id[$ei]} * 0.3)+ int($ebp_sougou[$ei] * 0.2);
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "11"){
										$ebp_att_add[$ei] += int($p_tiryoku{$ebp_id[$ei]} * 1)+ int($ebp_sougou[$ei] * 0.95);
										}
}
#######################
sub SENTOU_TI_HEI_E12 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.1);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.4);
										$ebp_str2[$ei] = int($p_tiryoku{$ebp_id[$ei]} * 1);
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "9" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "10"){
										$ebp_att_add[$ei] += int($p_tiryoku{$ebp_id[$ei]} * 0.4);
											if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "9"){
									$ebp_tyakka[$ei] = 1;
											}
										}
}
#######################
sub SENTOU_TI_HEI_E13 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.2);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.4);
										$ebp_str2[$ei] = int(($p_tousotu{$ebp_id[$ei]} * 0.85)+($p_buryoku{$ebp_id[$ei]} * 0.6));

}
#######################
sub SENTOU_TI_HEI_E14 {
										$ebp_att_add[$ei] = int(rand($p_tousotu{$ebp_id[$ei]} * 1)+($ebp_sougou[$ei] * 0.15));
										$ebp_att_def[$ei] = int(rand($p_jinbou{$ebp_id[$ei]} * 1));
										$ebp_str2[$ei] = int($ebp_sougou[$ei] * 0.6);
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "15" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "19"){
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.1);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.1);
										}

}
#######################
sub SENTOU_TI_HEI_E15 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.45);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.1);
										$ebp_str2[$ei] = int(($p_tousotu{$ebp_id[$ei]} * 0.85)+($p_buryoku{$ebp_id[$ei]} * 0.6));
}
#######################
sub SENTOU_TI_HEI_E16 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.3);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.2);
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.75)+($p_tiryoku{$ebp_id[$ei]} * 0.7));
}
#######################
sub SENTOU_TI_HEI_E17 {
										$ebp_att_add[$ei] = 0;
										$ebp_att_def[$ei] = int($kbp_sougou[$ki] * 0.15);
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "6" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "7" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "17" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "18"){
										$ebp_att_add[$ei] = int($kbp_sougou[$ki] * 0.6);
										$kbp_att_add[$ki] = int($kbp_att_add[$ki] * 0.8);
										$kbp_att_def[$ki] = int($kbp_att_def[$ki] * 0.5);
											if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "7"){
										$kbp_att_add[$ki] = int($kbp_att_add[$ki] * 0.6);
											}
										}elsif($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "12" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "13"){
										$ebp_att_add[$ei] = int($kbp_sougou[$ki] * 0.4);
										}

}
#######################
sub SENTOU_TI_HEI_E18 {
										$ebp_att_add[$ei] = 0;
										$ebp_att_def[$ei] = 0;
										$ebp_str2[$ei] = int($ebp_sougou[$ei] * 0.5);

}
#######################
sub SENTOU_TI_HEI_E19 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.3);
										$ebp_att_def[$ei] = 0;
										$ebp_str2[$ei] = int(($p_tiryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));

										if(int($md_eria / 10) == 1){
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.3);
										}

}
#######################
sub SENTOU_TI_HEI_E20 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.5);
										$ebp_att_def[$ei] = 0;
										$ebp_str2[$ei] = int(($p_tousotu{$ebp_id[$ei]} * 0.85)+($p_tiryoku{$ebp_id[$ei]} * 0.6));

										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "1" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "6" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "7" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "17" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "18"){
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.3);
										}
}
#######################
sub SENTOU_TI_HEI_E21 {
										$ebp_att_add[$ei] = int($p_buryoku{$ebp_id[$ei]} * 0.1);
										$ebp_att_def[$ei] = int($p_buryoku{$ebp_id[$ei]} * 0.5);
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));

										$ebp_sisihunjin[$ei] = 1;
}
#######################
sub SENTOU_TI_HEI_E22 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.15);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.4);
										$ebp_str2[$ei] = int(($p_tiryoku{$ebp_id[$ei]} * 0.85)+($p_buryoku{$ebp_id[$ei]} * 0.6));
									$ebp_genjt[$ei]=1;
											if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "9"){
									$ebp_tyakka[$ei] = 1;
											}
}
#######################
sub SENTOU_TI_HEI_E23 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.25);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.15);
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "18" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "2"){
										$ebp_att_def[$ei] += int($ebp_sougou[$ei] * 0.1);
										}

}
#######################
sub SENTOU_TI_HEI_E24 {
										$ebp_att_add[$ei] = 0;
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.5);
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));
										if($p_heisyu{$kbp_id[$ki]} eq "12"){
										$ebp_att_def[$ei] = 0;
										}
}
#######################
sub SENTOU_TI_HEI_E25 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.35);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.20);
										$ebp_str2[$ei] = int(($p_tiryoku{$ebp_id[$ei]} * 0.85)+($p_buryoku{$ebp_id[$ei]} * 0.6));
									$ebp_youjt[$ei]=1;
			if($k_kokkyou{$p_kunino{$ebp_id[$ei]}} eq "4"){

	if($k_kokkyou_keika_nen{$p_kunino{$ebp_id[$ei]}} > 10){
				$ebp_att_add[$ei] += int($ebp_sougou[$ei] * 0.15);
	}
			}
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "10" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "14" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "16"){
										$ebp_att_add[$ei] += int($ebp_sougou[$ei] * 0.1);
										}

}
#######################
sub SENTOU_TI_HEI_E26 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.4);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.05);
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "0"){
										$ebp_att_def[$ei] += int($ebp_sougou[$ei] * 0.1);
										}
}
#######################
sub SENTOU_TI_HEI_E27 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.2);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.3);
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "3" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "11"){
										$ebp_att_add[$ei] += int($ebp_sougou[$ei] * 0.4);
										}
										if($p_heisyu{$kbp_id[$ki]} eq "38"){
										$ebp_att_add[$ei] += int($ebp_sougou[$ei] * 0.1);
										}

}
#######################
sub SENTOU_TI_HEI_E28 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.05);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.45);
										$ebp_str2[$ei] = int(($p_tousotu{$ebp_id[$ei]} * 0.85)+($p_buryoku{$ebp_id[$ei]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "18" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "17"){
										$ebp_att_add[$ei] += int($ebp_sougou[$ei] * 0.1);
										}

}
#######################
sub SENTOU_TI_HEI_E29 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.15);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.25);
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));
										if($t_tiri_f1{$ft_id} eq "2"){
										$ebp_att_add[$ei] += int($ebp_sougou[$ei] * 0.1);
										}
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "21"){
										$ebp_att_add[$ei] += int($ebp_sougou[$ei] * 0.1);
										}
}
#######################
sub SENTOU_TI_HEI_E30 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.55);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.1);
										$ebp_str2[$ei] = int(($p_tousotu{$ebp_id[$ei]} * 0.85)+($p_buryoku{$ebp_id[$ei]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "0"){
										$ebp_att_def[$ei] += int($ebp_sougou[$ei] * 0.1);
										}
}
#######################
sub SENTOU_TI_HEI_E31 {
										$ebp_att_add[$ei] = 0;
										$ebp_att_def[$ei] = 0;
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));

										if($t_tiri_f1{$ft_id} eq "1" or $md_eria eq "30"){
										$ebp_att_add[$ei] += int($ebp_sougou[$ei] * 0.25);
										$ebp_att_def[$ei] += int($ebp_sougou[$ei] * 0.3);
										}
}
#######################
sub SENTOU_TI_HEI_E32 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.1);
										$ebp_att_def[$ei] = int(rand((100-$p_jinbou{$ebp_id[$ei]}) * 0.5));
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.75)+($p_tiryoku{$ebp_id[$ei]} * 0.7));
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "20"){
										$ebp_att_add[$ei] += int($ebp_sougou[$ei] * 0.2);
										}
										if($t_tiri_f1{$ft_id} eq "1" or $md_eria eq "30"){
										$ebp_att_add[$ei] += int($ebp_sougou[$ei] * 0.4);
										$ebp_att_def[$ei] += int($ebp_sougou[$ei] * 0.2);
										}
}
#######################
sub SENTOU_TI_HEI_E33 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.35);
										$ebp_att_def[$ei] = 0;
										$ebp_str2[$ei] = int(($p_tiryoku{$ebp_id[$ei]} * 0.85)+($p_buryoku{$ebp_id[$ei]} * 0.6));
										if(!$battle_end and ($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "4" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "9")){
										$ebp_att_add[$ei] += int($p_tiryoku{$ebp_id[$ei]} * 0.6) + int($p_buryoku{$ebp_id[$ei]} * 0.9);
										$ebp_att_def[$ei] += int($p_tiryoku{$ebp_id[$ei]} * 0.7) + int($p_buryoku{$ebp_id[$ei]} * 0.4);
											if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "9"){
									$ebp_tyakka[$ei] = 1;
											}
										}

}
#######################
sub SENTOU_TI_HEI_E34 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.1);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.3);
										$ebp_str2[$ei] = int(($p_tiryoku{$ebp_id[$ei]} * 0.85)+($p_buryoku{$ebp_id[$ei]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "14"){
										$ebp_att_add[$ei] += int($ebp_sougou[$ei] * 0.1);
										}

}
#######################
sub SENTOU_TI_HEI_E35 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.2);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.15);
										$ebp_str2[$ei] = int(($p_tousotu{$ebp_id[$ei]} * 0.85)+($p_buryoku{$ebp_id[$ei]} * 0.6));
										if($t_tiri_f1{$ft_id} eq "1" or $md_eria eq "30"){
										$ebp_att_add[$ei] += int($ebp_sougou[$ei] * 0.2);
										}
}
#######################
sub SENTOU_TI_HEI_E36 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.25);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.1);
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));
										$ebp_sisihunjin[$ei] = 1;
}
#######################
sub SENTOU_TI_HEI_E37 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.15);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.25);
										$ebp_str2[$ei] = int(($p_tousotu{$ebp_id[$ei]} * 0.85)+($p_buryoku{$ebp_id[$ei]} * 0.6));
										$ebp_sikibou[$ei] =1;
}
#######################
sub SENTOU_TI_HEI_E38 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.2);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.3);
										$ebp_str2[$ei] = int(($p_tousotu{$ebp_id[$ei]} * 0.85)+($p_tiryoku{$ebp_id[$ei]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "0" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "2"){
										$ebp_att_def[$ei] += int($ebp_sougou[$ei] * 0.1);
										}
}
#######################
sub SENTOU_TI_HEI_E39 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.3);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.3);
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));
}
#######################
sub SENTOU_TI_HEI_E40 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.25);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.05);
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "3"){
										$ebp_att_def[$ei] += int($ebp_sougou[$ei] * 0.3);
										}
									$ebp_hadoku[$ei]=6;
}
#######################
sub SENTOU_TI_HEI_E41 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.1);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.4);
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));
}
#######################
sub SENTOU_TI_HEI_E42 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.1);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.3);
										$ebp_str2[$ei] = int($p_tiryoku{$ebp_id[$ei]} * 1);
									$ki_add_iw = int(rand($kouryakukazu));
									$kbp_hukou[$ki_add_iw] += 1;
										if($sougouno1 * 0.5 < $p_tiryoku{$ebp_id[$ei]}){
									$ki_add_iw = int(rand($kouryakukazu));
									$kbp_hukou[$ki_add_iw] += 1;
										}
										if($sougouno1 * 0.6 < $p_tiryoku{$ebp_id[$ei]}){
									$ki_add_iw = int(rand($kouryakukazu));
									$kbp_hukou[$ki_add_iw] += 1;
										}
									$ebp_kouhuku[$ei] = 1;
									$ebp_husyoubou[$ei] = 1;
											if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "9"){
									$ebp_tyakka[$ei] = 1;
											}
}
#######################
sub SENTOU_TI_HEI_E43 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.4);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.05);
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));

}
#######################
sub SENTOU_TI_HEI_E44 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.3);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.15);
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));
										if($p_heisyu{$kbp_id[$ki]} eq "38"){
										$ebp_att_add[$ei] += int($ebp_sougou[$ei] * 0.1);
										}
}
#######################
sub SENTOU_TI_HEI_E45 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.4);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.05);
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));
										$ebp_bidouhosei[$ei] = 0.5;
}
#######################
sub SENTOU_TI_HEI_E46 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.35);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.10);
										$ebp_str2[$ei] = int(($p_tiryoku{$ebp_id[$ei]} * 0.85)+($p_buryoku{$ebp_id[$ei]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "21"){
										$ebp_att_def[$ei] += int($ebp_sougou[$ei] * 0.3);
										}
										if($p_heisyu{$kbp_id[$ki]} eq "16"){
										$ebp_att_add[$ei] += int($ebp_sougou[$ei] * 0.1);
										}
}
#######################
sub SENTOU_TI_HEI_E47 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.25);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.3);
										$ebp_str2[$ei] = int(($p_tousotu{$ebp_id[$ei]} * 0.85)+($p_buryoku{$ebp_id[$ei]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "0"){
										$ebp_att_def[$ei] += int($ebp_sougou[$ei] * 0.1);
										}
}
#######################
sub SENTOU_TI_HEI_E48 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.4);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.05);
										$ebp_str2[$ei] = int(($p_tiryoku{$ebp_id[$ei]} * 0.85)+($p_buryoku{$ebp_id[$ei]} * 0.6));
									$ebp_hadoku[$ei] = 4;
			if($k_kokkyou{$p_kunino{$ebp_id[$ei]}} eq "1"){
	if($k_kokkyou_keika_nen{$p_kunino{$ebp_id[$ei]}} > 10){
									$ebp_hadoku[$ei] -= 1;
	}
			}
										if($p_heisyu{$kbp_id[$ki]} eq "16"){
										$ebp_att_add[$ei] += int($ebp_sougou[$ei] * 0.1);
										}
}
#######################
sub SENTOU_TI_HEI_E49 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.1);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.4);
										$ebp_str2[$ei] = int($p_tiryoku{$ebp_id[$ei]} * 1);
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "4" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "9"){
										$ebp_att_add[$ei] += int($ebp_sougou[$ei] * 0.4);
										}
											if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "9"){
									$ebp_tyakka[$ei] = 1;
											}
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "15" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "19"){
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.1);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.1);
										}
}
#######################
sub SENTOU_TI_HEI_E81 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.1);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.2);
										$ebp_str2[$ei] = int(($p_tiryoku{$ebp_id[$ei]} * 0.85)+($p_buryoku{$ebp_id[$ei]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "4" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "9"){
										$ebp_att_add[$ei] += int($ebp_sougou[$ei] * 0.4);
											if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "9"){
									$ebp_tyakka[$ei] = 1;
											}
										}
									$ebp_senjt[$ei]=1;
									$ebp_youjt[$ei]=1;
									$ebp_genjt[$ei]=1;
}
#######################
sub SENTOU_TI_HEI_E82 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.1);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.25);
										$ebp_str2[$ei] = int($ebp_sougou[$ei] * 0.6);
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "4"){
										$ebp_att_add[$ei] += int($ebp_sougou[$ei] * 0.14);
										}
}
#######################
sub SENTOU_TI_HEI_E83 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.25);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.2);
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "3"){
										$ebp_att_def[$ei] += int($ebp_sougou[$ei] * 0.3);
										}
}
#######################
sub SENTOU_TI_HEI_E84 {
}
#######################
sub SENTOU_TI_HEI_E85 {
}
#######################
sub SENTOU_TI_HEI_E86 {
}
#######################
sub SENTOU_TI_HEI_E87 {
}
#######################
sub SENTOU_TI_HEI_E88 {
}
#######################
sub SENTOU_TI_HEI_E89 {
}
#######################
sub SENTOU_TI_HEI_E90 {
}
#######################
sub SENTOU_TI_HEI_E91 {
										$ebp_att_add[$ei] = int($p_tousotu{$ebp_id[$ei]} * 1);
										$ebp_att_def[$ei] = int($p_tiryoku{$ebp_id[$ei]} * 1.5);
										$ebp_str2[$ei] = int($p_buryoku{$ebp_id[$ei]} * 1.5);
									$ebp_senjt[$ei]=1;

}
#######################
sub SENTOU_TI_HEI_E92 {
										$ebp_att_add[$ei] = int(rand($ebp_sougou[$ei])+($ebp_sougou[$ei] * 0.18));
										$ebp_att_def[$ei] = int(rand($p_jinbou{$ebp_id[$ei]} * 1.5));
										$ebp_str2[$ei] = int($ebp_sougou[$ei] * 0.6);
									$ebp_senjt[$ei]=1;
}
#######################
sub SENTOU_TI_HEI_E93 {
										$ebp_att_add[$ei] = int($p_buryoku{$ebp_id[$ei]} * 0.6);
										$ebp_att_def[$ei] = 0;
										$ebp_str2[$ei] = int(($p_buryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));
}
#######################
sub SENTOU_TI_HEI_E94 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.1);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.45);
										$ebp_str2[$ei] = int($p_tiryoku{$ebp_id[$ei]} * 1);
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "4"){
										$ebp_att_add[$ei] += int($ebp_sougou[$ei] * 0.3);
										}
									$ebp_genjt[$ei]=1;
									$ebp_youjt[$ei]=1;
}
#######################
sub SENTOU_TI_HEI_E95 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.2);
										$ebp_att_def[$ei] = 0;
										$ebp_str2[$ei] = int(($p_tousotu{$ebp_id[$ei]} * 0.85)+($ebp_sougou[$ei] * 0.15));
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "21" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "10" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "20"){
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.1);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.1);
										}

}
#######################
sub SENTOU_TI_HEI_E96 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.25);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.4);
										$ebp_str2[$ei] = int($p_tiryoku{$ebp_id[$ei]} * 1);
}
#######################
sub SENTOU_TI_HEI_E97 {
										$ebp_att_add[$ei] = int($ebp_sougou[$ei] * 0.3);
										$ebp_att_def[$ei] = int($ebp_sougou[$ei] * 0.35);
										$ebp_str2[$ei] = int(($p_tiryoku{$ebp_id[$ei]} * 0.85)+($p_tousotu{$ebp_id[$ei]} * 0.6));

}
#######################
sub SENTOU_TI_HEI_E98 {
}
#######################
sub SENTOU_TI_HEI_E99 {
}
#######################
sub SENTOU_TI_HEI_E100 {
}
#######################
sub SENTOU_TI_HEI_E0 {
										$ebp_att_add[$ei] = 0;
										$ebp_att_def[$ei] = 0;
										$ebp_str2[$ei] = int($ebp_sougou[$ei] * 0.6);
}
#######################
sub SENTOU_TI_HEI_E {
}


#######################
sub P_SAVE_FS {
		if($p_yomikaki{$f_id} eq "0"){
				&P_SAVE("p","$f_id","$f_id");
		}elsif($p_yomikaki{$f_id} eq "1"){
							unlink("./p_db/p/$f_id.cgi");
							unlink("./p_db/bl/$f_id.cgi");
				&TOUKETU_SAVE("bl","$f_id","$f_id");
		}elsif($p_yomikaki{$f_id} eq "2"){
							unlink("./p_db/p/$f_id.cgi");
							unlink("./p_db/touketu/$f_id.cgi");
		$p_yomikaki{$f_id} = 0;
				&TOUKETU_SAVE("touketu","$f_id","$f_id");
		}
}


sub IMG_2CSS_SEISEI {

		if(!$add_cg_css_open){
	open(IN,"./$menck.js");
	@add_cg_css_l = <IN>;
	close(IN);
		$add_cg_css_open = 1;
		}

		$add_id="$menck\_$w_id\_d";
@add_cg_css_l = grep( !/^$add_id/, @add_cg_css_l );
	$img_sakusei_kekka = "cg_youso['$add_id']='$p_img{$w_id}$p_img_f{$w_id}';";
$i =0;
	while ($i<10) {
	$img_sakusei_kekka .= "cg_youso['$add_id$i']='$p_img{$w_id}${$p_cgno{$w_id}}[$i]$p_img_f{$w_id}';";
$i++;
	}
$img_sakusei_kekka =~ s/&#47;/\//g;
$img_sakusei_kekka =~ s/&#46;/\./g;
	push(@add_cg_css_l,"$img_sakusei_kekka\n");
}


sub BL_K_YAKUSYOKU_B_K0 {
}
sub BL_K_YAKUSYOKU_B_K1 {
}
sub BL_K_YAKUSYOKU_B_K2 {
}
sub BL_K_YAKUSYOKU_B_K3 {
}
sub BL_K_YAKUSYOKU_B_K4 {
}
sub BL_K_YAKUSYOKU_B_K5 {
}
sub BL_K_YAKUSYOKU_B_K6 {
}
sub BL_K_YAKUSYOKU_B_K7 {
										$kbp_att_add2[$ki] = int(20 * $kbp_sougou[$ki]/150);
}
sub BL_K_YAKUSYOKU_B_K8 {
										$kbp_att_add2[$ki] = int(10 * $kbp_sougou[$ki]/150);
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "0" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "1" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "16" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "6"){
											$kbp_att_add2[$ki] = int(10 * $kbp_sougou[$ki]/150);
										}
}
sub BL_K_YAKUSYOKU_B_K9 {
										$kbp_att_add2[$ki] = int(10 * $kbp_sougou[$ki]/150);
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "13" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "2" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "18" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "6"){
											$kbp_att_add2[$ki] = int(10 * $kbp_sougou[$ki]/150);
										}
}
sub BL_K_YAKUSYOKU_B_K10 {
										$kbp_att_add2[$ki] = int(10 * $kbp_sougou[$ki]/150);
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "11" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "12" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "3" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "17" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "6"){
											$kbp_att_add2[$ki] = int(10 * $kbp_sougou[$ki]/150);
										}
}
sub BL_K_YAKUSYOKU_B_K11 {
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "1" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "2" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "18"){
											$kbp_att_add2[$ki] = int(10 * $kbp_sougou[$ki]/150);
										}
}
sub BL_K_YAKUSYOKU_B_K12 {
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "1" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "2" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "18"){
											$kbp_att_add2[$ki] = int(10 * $kbp_sougou[$ki]/150);
										}
}
sub BL_K_YAKUSYOKU_B_K13 {
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "1" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "2" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "18"){
											$kbp_att_add2[$ki] = int(10 * $kbp_sougou[$ki]/150);
										}
}
sub BL_K_YAKUSYOKU_B_K14 {
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "1" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "2" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "18"){
											$kbp_att_add2[$ki] = int(10 * $kbp_sougou[$ki]/150);
										}
}
sub BL_K_YAKUSYOKU_B_K15 {
}
sub BL_K_YAKUSYOKU_B_K16 {
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "16"){
											$kbp_att_add2[$ki] = int(10 * $kbp_sougou[$ki]/150);
										}
}
sub BL_K_YAKUSYOKU_B_K17 {
}
sub BL_K_YAKUSYOKU_B_K18 {
}
sub BL_K_YAKUSYOKU_B_K19 {
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "15"){
											$kbp_att_add2[$ki] = int(10 * $kbp_sougou[$ki]/150);
										}
}
sub BL_K_YAKUSYOKU_B_K20 {
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "6"){
											$kbp_att_add2[$ki] = int(10 * $kbp_sougou[$ki]/150);
										}
}
sub BL_K_YAKUSYOKU_B_K21 {
}
sub BL_K_YAKUSYOKU_B_K22 {
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "18"){
											$kbp_att_add2[$ki] = int(10 * $kbp_sougou[$ki]/150);
										}
}
sub BL_K_YAKUSYOKU_B_K23 {
}
sub BL_K_YAKUSYOKU_B_K24 {
}
sub BL_K_YAKUSYOKU_B_K25 {
}
sub BL_K_YAKUSYOKU_B_K26 {
}
sub BL_K_YAKUSYOKU_B_K27 {
										if($SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "11" or $SOL_ZOKUSEIT[$p_heisyu{$kbp_id[$ki]}] eq "12"){
											$kbp_att_add2[$ki] = int(10 * $kbp_sougou[$ki]/150);
										}
}
sub BL_K_YAKUSYOKU_B_K28 {
}
sub BL_K_YAKUSYOKU_B_K29 {
}
sub BL_K_YAKUSYOKU_B_K30 {
}

sub BL_K_YAKUSYOKU_B_E0 {
}
sub BL_K_YAKUSYOKU_B_E1 {
}
sub BL_K_YAKUSYOKU_B_E2 {
}
sub BL_K_YAKUSYOKU_B_E3 {
}
sub BL_K_YAKUSYOKU_B_E4 {
}
sub BL_K_YAKUSYOKU_B_E5 {
}
sub BL_K_YAKUSYOKU_B_E6 {
}
sub BL_K_YAKUSYOKU_B_E7 {
										$ebp_att_add2[$ei] = int(20 * ($ebp_sougou[$ei])/150);
}
sub BL_K_YAKUSYOKU_B_E8 {
										$ebp_att_add2[$ei] = int(10 * ($ebp_sougou[$ei])/150);
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "0" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "1" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "16" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "6"){
											$ebp_att_add2[$ei] = int(10 * ($ebp_sougou[$ei])/150);
										}
}
sub BL_K_YAKUSYOKU_B_E9 {
										$ebp_att_add2[$ei] = int(10 * ($ebp_sougou[$ei])/150);
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "13" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "2" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "18" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "6"){
											$ebp_att_add2[$ei] = int(10 * ($ebp_sougou[$ei])/150);
										}
}
sub BL_K_YAKUSYOKU_B_E10 {
										$ebp_att_add2[$ei] = int(10 * ($ebp_sougou[$ei])/150);
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "11" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "12" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "3" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "17" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "6"){
											$ebp_att_add2[$ei] = int(10 * ($ebp_sougou[$ei])/150);
										}
}
sub BL_K_YAKUSYOKU_B_E11 {
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "1" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "2" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "18"){
											$ebp_att_add2[$ei] = int(10 * ($ebp_sougou[$ei])/150);
										}
}
sub BL_K_YAKUSYOKU_B_E12 {
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "1" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "2" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "18"){
											$ebp_att_add2[$ei] = int(10 * ($ebp_sougou[$ei])/150);
										}
}
sub BL_K_YAKUSYOKU_B_E13 {
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "1" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "2" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "18"){
											$ebp_att_add2[$ei] = int(10 * ($ebp_sougou[$ei])/150);
										}
}
sub BL_K_YAKUSYOKU_B_E14 {
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "1" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "2" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "18"){
											$ebp_att_add2[$ei] = int(10 * ($ebp_sougou[$ei])/150);
										}
}
sub BL_K_YAKUSYOKU_B_E15 {
}
sub BL_K_YAKUSYOKU_B_E16 {
}
sub BL_K_YAKUSYOKU_B_E17 {
}
sub BL_K_YAKUSYOKU_B_E18 {
}
sub BL_K_YAKUSYOKU_B_E19 {
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "15"){
											$ebp_att_add2[$ei] = int(10 * $ebp_sougou[$ei]/150);
										}
}
sub BL_K_YAKUSYOKU_B_E20 {
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "6"){
											$ebp_att_add2[$ei] = int(10 * $ebp_sougou[$ei]/150);
										}
}
sub BL_K_YAKUSYOKU_B_E21 {
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "16"){
											$ebp_att_add2[$ei] = int(10 * $ebp_sougou[$ei]/150);
										}
}
sub BL_K_YAKUSYOKU_B_E22 {
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "18"){
											$ebp_att_add2[$ei] = int(10 * $ebp_sougou[$ei]/150);
										}
}
sub BL_K_YAKUSYOKU_B_E23 {
}
sub BL_K_YAKUSYOKU_B_E24 {
}
sub BL_K_YAKUSYOKU_B_E25 {
}
sub BL_K_YAKUSYOKU_B_E26 {
}
sub BL_K_YAKUSYOKU_B_E27 {
										if($SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "11" or $SOL_ZOKUSEIT[$p_heisyu{$ebp_id[$ei]}] eq "12"){
											$ebp_att_add2[$ei] = int(10 * $ebp_sougou[$ei]/150);
										}
}
sub BL_K_YAKUSYOKU_B_E28 {
}
sub BL_K_YAKUSYOKU_B_E29 {
}
sub BL_K_YAKUSYOKU_B_E30 {
}




1;