
sub MOVE {



	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");

							$fgundan_id = $p_gundanno{$f_id};
	&GUNDAN_OPEN("gundan_db","$fgundan_id","$fgundan_id");
	if($k_kunino{$fk_id} eq "0" or $k_kokka_keitai{$fk_id}){&ER1("無所属国並びに賊は実行できません。");}
		$fk_id_2 = $p_kunino{$f_id};

require "./$mpg_r/sub_db/mapw.pl";

	if($gundan_yakusyoku_id{$fgundan_id}[1] ne $f_id){
		&ER1("軍団長以外実行できません。");
	}

	if($in{'i'} eq "i"){
	$come_cdl = <<"PRI";
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=\".m.\"><option value=\"$in{'m'}\">リロード</option><option value=\"i_cd\">コマンド</option><option value=\"i_s\">情報</option><option value=\"i_m\">手紙</option><option value=\"ikaigi\">門下省</option><option value="sirei">中書省</option><option value="ru-ru">尚書省</option><option value="ilog">過去ログ</option><option value="itemo">競売会場</option><option value="item">アイテム管理</option><option value="senpou">戦法設定</option><option value="gundan">軍団編成</option><option value="butai">部隊編成</option><option value="idkanri">LoginID管理</option><option value="come">コメント編集</option><option value="bcome">自己PR編集</option><option value="adcome">広告/OPT編集</option><option value="yakuba">国取役場</option><option value="tyuusei">忠誠度変更</option><option value="gazou">画像変更</option><option value="act_cd">アクティブC変更</option></select><input type=\"submit\" value=\"画面移動\" /><input type=\"hidden\" name=\".i.\" value=\"i\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /></div></form>

PRI
	}else{
	$come_cdl = <<"PRI";
	
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"コマンド入力画面に戻る\" /></div></form>
PRI
	}
	if($in{'ele'}){
#########
    &F_LOCK;


$intosi = $p_taizai_iti{$f_id};
	$zokuhit = 1;
require "./$mpg_r/sub_db/ingo.pl";


	&TT_GET;
	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");
		$add_kn2 = $k_name{$fk_id};
				$add_k1 = $p_kunino{$f_id};


$p_kunizokusei{$f_id} = $zokuhit;

	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);

	($keika_nen,$tuki_genzai,$m_tt) = split(/<>/,$JJM[0]);


		if(-e "./w_db/allc_tosi_db.pl"){
require "./w_db/all_tosi_db.pl";

		}else{ 
require "./w_db/all2_tosi_db.pl";
		}
opendir(DFR,"./w_db/tosi_db");
	while($ft_id = readdir(DFR)){
		if($ft_id =~ /\.cgi/i){
$ft_id =~ s/\.cgi//;
	&T_READ("tosi_db","$ft_id","$ft_id");
		}
	}
closedir(DFR);




	$zc=0;$m_hit=0;
							$ft_id = $p_taizai_iti{$f_id};

	if($t_kunino{$ft_id} ne $p_kunino{$f_id}){&ER2("謀反は仕官先の支配域でのみ実行できます。");}

	if($zokuhit and $p_syoji_kin{$f_id} < 200000) {&ER2("ゲーム途中で賊を旗揚げするには、<br />軍資金として金200000が必要になります。");}


	$add_dno = $t_kunino{$ft_id};
	if($zokuhit) {
	$add_dno = $t_zokuno{$ft_id};
	}
	if($add_dno) { &ER1("国がある都市に建国はできません。"); }
	if(!$add_dno){
		if($in{'ele'} eq ""){&ER1("建国・賊旗揚げの場合、国の色を選択してください。");}
	&MOJISUU($in{'kokumei'},16);
		if($in{'kokumei'} eq "" or $mojisuu_h_all < 2 or $mojisuu_o) { &ER1("国の名前が正しく入力されていません。$mojisuu_re"); }
	&MOJISUU($in{'mes'},16);
		if($in{'mes'} eq "" or $mojisuu_h_all < 2 or $mojisuu_o) { &ER1("天子の名前が正しく入力されていません。$mojisuu_re"); }

		$m_hit = 1;
$cnksw = $in{'kokumei'};
$cnksw =~  s/ //g;
$cnksw =~  s/　//g;
	foreach(@KSW){
if($_ and $cnksw =~ /\Q$_\E/ ) {
		&ER1("その国名は使用できません。$_『隠語・淫語フィルター』");}
	}
if($cnksw eq "") {
		&ER1("その国名は使用できません。『隠語・淫語フィルター』");}
$cnksw = $in{'mes'};
$cnksw =~  s/ //g;
$cnksw =~  s/　//g;
	foreach(@KSW){
if($_ and $cnksw =~ /\Q$_\E/ ) {
		&ER1("天子にその名は使用できません。$_『隠語・淫語フィルター』");}
	}
if($cnksw eq "") {
		&ER1("天子にその名は使用できません。『隠語・淫語フィルター』");}
		$add_name_d = "$in{'kokumei'} ";

		$wcou_name = "$add_name_d";
$wcou_name =~  s/ //g;
$wcou_name =~  s/　//g;
		foreach(@k_name){
		$wx3name = "$_";
$wx3name =~  s/ //g;
$wx3name =~  s/　//g;
			if($wx3name eq $wcou_name){
&ER1("その国名は既に使用されています。");
			}
		}
		$new_kuni_id_in =$kuni_kazu_max;
		if(!$new_kuni_id_in) { 
		$new_kuni_id_in =@k_name_d;
		}
		$new_kuni_id_in ++;
	if($zokuhit) {
		if($in{'zokumei'} eq "" or $mojisuu_h_all < 2 or $mojisuu_o) { &ER1("賊の名前が正しく入力されていません。$mojisuu_re"); }
$cnksw = $in{'zokumei'};
$cnksw =~  s/ //g;
$cnksw =~  s/　//g;
	foreach(@KSW){
if($_ and $cnksw =~ /\Q$_\E/ ) {
		&ER1("賊名にその名は使用できません。$_『隠語・淫語フィルター』");}
	}
if($cnksw eq "") {
		&ER1("賊名にその名は使用できません。『隠語・淫語フィルター』");}
		$add_name_d = "$in{'zokumei'} ";

		$wcou_name = "$add_name_d";
$wcou_name =~  s/ //g;
$wcou_name =~  s/　//g;
		foreach(@k_name){
		$wx3name = "$_";
$wx3name =~  s/ //g;
$wx3name =~  s/　//g;
			if($wx3name eq $wcou_name){
&ER1("その賊名は既に使用されています。");
			}
		}
	}
		$hit = 1;
	}

	if($m_hit){
&F_LOCK;
				$p_kunino{$f_id} = $new_kuni_id_in;
		$fk_id = $new_kuni_id_in;

	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);
	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$old_date = "<a href=\"./mapr/$yymaprid\">$old_date</a>";

$k_name_d{$fk_id} = "$in{'kokumei'} ";
$xtoorina = '';
$k_name_z{$fk_id} = "$in{'zokumei'} ";
$xkokugou = '';
$k_outo{$fk_id} = $intosi;
$k_kokka_keitai{$fk_id} = $zokuhit;
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
	
$k_kousen_aite_k{$fk_id}[1] = '0';
$k_kousen_aite_k{$fk_id}[2] = '0';
$k_kousen_aite_k{$fk_id}[3] = '0';
$k_kousen_aite_k{$fk_id}[4] = '0';
$k_kousen_aite_k{$fk_id}[5] = '0';
$k_kousen_aite_k{$fk_id}[6] = '0';
$k_kousen_aite_k{$fk_id}[7] = '0';
$k_kousen_aite_k{$fk_id}[8] = '0';
$k_kousen_aite_k{$fk_id}[9] = '0';
$k_kousen_aite_k{$fk_id}[0] = '0';
			$k_kousen_aite_name{$fk_id} = "無し";
	if($tenkakaisuu > 1 and $keika_nen < 100 and $k_kunino{"1"} eq "1"){
$k_kousen_aite_k{$fk_id}[0] = $fk_id_2;
			$k_kousen_aite_name{$fk_id} = "$k_name_d[$fk_id_2]";
	}
	
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
$k_keika_t{$fk_id} = 69;
$k_kokui{$fk_id} = 50;
$k_sirei_bun{$fk_id} = " ";
$k_tensi_name{$fk_id} = $in{'mes'};
$k_kouryaku_mokuhyou{$fk_id}[0] = 0;
$k_zenki_tosisuu{$fk_id} = 1;
$k_busyou_kazei{$fk_id} = 0;
$k_kokko_sougaku{$fk_id} = 0;
$k_zenki_sou_syuunyuu{$fk_id} = 0;
$k_yomikaki{$fk_id} = 0;
$k_kouhou_tyouhei_name{$fk_id} = "無し";

	&K_N_SAVE("kuni_db","$fk_id","$fk_id");




		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");
	if($zokuhit) {
		$t_zokuno{$ft_id} = $new_kuni_id_in;
		$p_kuni_yakusyoku{$f_id} = 1;
		$p_syoji_kin{$f_id} -= 200000;

	}else{
		$t_kunino{$ft_id} = $new_kuni_id_in;
	}
	&T_SAVE("tosi_db","$ft_id","$ft_id");
	unlink("./w_db/kuni/coudata$p_kunino{$f_id}\.pl");
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
												&MAPS;

		$gundan_kunino{$fgundan_id} = $p_kunino{$f_id};
	&GUNDAN_SAVE("gundan_db","$fgundan_id","$fgundan_id");
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$f_id}が$t_name{$ft_id}の賊砦にて$k_name_d[$p_kunino{$f_id}]を旗揚げ。");
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の賊砦にて$k_p_k_a{$p_kunino{$f_id}}を旗揚げし、<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$add_k1\" target=\"_blank\"><span class=\"kcb$add_k1\">$add_kn2</span></a>に対して反旗を翻す。。");
		&MAP_LOG2("<span class=\"cFF0000\">【謀反】</span>\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$add_k1\" target=\"_blank\"><span class=\"kcb$add_k1\">$add_kn2</span></a>の軍団長を務める$p_p_b_a{$f_id}が反旗を翻し、$t_name{$ft_id}の賊砦にて$k_p_k_a{$p_kunino{$f_id}}を旗揚げしました。");
		&MAP_LOG("<span class=\"cFF0000\">【謀反】</span><a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$add_k1\" target=\"_blank\"><span class=\"kcb$add_k1\">$add_kn2</span></a>の軍団長を務める$p_p_b_a{$f_id}が反旗を翻し、$t_name{$ft_id}の賊砦にて$k_p_k_a{$p_kunino{$f_id}}を旗揚げしました。");

	open(IN,"./w_db/k_sikan_kyozetu.cgi");
	@B_LIST = <IN>;
	close(IN);

	@NEW_B_LIST=();
	$hit=0;
	foreach(@B_LIST){
		($bid,$bcon,$bname,$bsub) = split(/<>/);
		if($bid eq $f_id and $bcon eq $add_k1){
			$hit=1;
			push(@NEW_B_LIST,"$f_id<>$add_k1<>$p_name{$f_id}<><>\n");
		}else{
			push(@NEW_B_LIST,"$_");
		}
	}

	if(!$hit){
		unshift(@NEW_B_LIST,"$f_id<>$add_k1<>$p_name{$f_id}<><>\n");
	}

	open(OUT,">./w_db/k_sikan_kyozetu.cgi");
	print OUT @NEW_B_LIST;
	close(OUT);

			$k_kousen_aite_name{$p_kunino{$f_id}} = "無し";
	if($tenkakaisuu > 1 and $keika_nen < 100 and $k_kunino[1] and $k_kunino{$fk_id} ne "1"){
			$k_kousen_aite_name{$p_kunino{$f_id}} = "$k_name_d[1]";
			$k_kousen_aite_k{$p_kunino{$f_id}}[0] = 1;
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]天子：$in{'mes'}は、時の支配勢力 $k_name_d[1]に対し宣戦布告を行いました。");
	}
	open(IN,"./w_db/gundan_l/l$fgundan_id.cgi");
	@GUNDAN_DB = <IN>;
	close(IN);
							foreach(@GUNDAN_DB){
								($u_id,$uni_name)=split(/<>/);
								if($uid ne $f_id and $gundan_kunino{$p_gundanno{$f_id}} eq $add_k1){

	$e_id=$uid;
	&P_READ("p","$e_id","$e_id");
								
									if($p_id{$e_id} and $p_gunsirei{$e_id}[0] eq "2"){
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の賊砦にて$p_p_b_a{$f_id}らと共に$k_p_k_a{$p_kunino{$f_id}}を旗揚げし、<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$add_k1\" target=\"_blank\"><span class=\"kcb$add_k1\">$add_kn2</span></a>に対して反旗を翻す。");
	open(IN,"./p_db/my_log/$p_id{$e_id}.cgi");
	@F_LOG = <IN>;
	close(IN);

	unshift(@F_LOG,"<span class=\"cFF0000\">【謀反】</span>\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$add_k1\" target=\"_blank\"><span class=\"kcb$add_k1\">$add_kn2</span></a>の部隊長を務める$p_p_b_a{$f_id}が反旗を翻し、$t_name{$ft_id}の賊砦にて$k_p_k_a{$p_kunino{$f_id}}を旗揚げしました。$tt_date\n");

	splice(@F_LOG,200);

	open(OUT,">./p_db/my_log/$p_id{$e_id}.cgi");
	print OUT @F_LOG;
	close(OUT);
$p_kunino{$e_id} = $p_kunino{$f_id};
$p_taizai_iti{$p_id{$e_id}} = $p_taizai_iti{$f_id};
$p_exgiri{$e_id} -= 7;
$p_kunizokusei{$e_id} = 1;
		$p_kuni_yakusyoku{$e_id} = 0;

											&P_SAVE("p","$p_id{$e_id}","$p_id{$e_id}");
									}
								}
							}

	$p_kuni_kouken{$f_id} = 3000;
	$p_neutral_meisei{$f_id} += 3000;$p_kuni_sikan_nensuu{$f_id} = 0;$p_kuni_kouken{$f_id} = 0;
$p_exyabou{$f_id} += 20;
$p_exgiri{$f_id} -= 20;
$p_kunizokusei{$f_id} = $zokuhit;


&P_SAVE("p","$f_id","$f_id");

	open(IN,"./p_db/tt/ktms4$f_id.cgi");
	@KTM = <IN>;
	close(IN);
	($ktms4,$ktms4w,$tmtmit,$tmtmw1,$tmtmw2,$tmtmw3) = split(/<>/,$KTM[0]);

			$ktms4 = 1;

			$tmtmw2 = 1;
	@KTM=();
	unshift(@KTM,"$ktms4<>$ktms4w<>$tmtmit<>$tmtmw1<>$tmtmw2<>$tmtmw3<>\n");
	open(OUT,">./p_db/tt/ktms4$f_id.cgi");
	print OUT @KTM;
	close(OUT);

	&UNLOCK_FILE();
	}
	&HEADER;

	print <<"PRI";
<hr /><span class=\"fs4\">$p_name{$f_id}は$k_name_d[$p_kunino{$f_id}]を旗揚げしました。</span><br /><br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"ＯＫ\" /></div></form>
PRI

	&FOOTER;

	exit;
	}else{
							$ft_id = $p_taizai_iti{$f_id};

$intosi = $p_taizai_iti{$f_id};
	$zokuhit = 1;
	$come1 = "謀反";
	$come2 = "仕官先に反旗を翻し賊空白域において賊を旗揚げします。<br />ゲーム途中で賊を旗揚げするには、<br />軍資金として金200000が必要になります。";
	$comez = "<tr class=\"bgcF8F0E0\"><td width=\"100\">賊名</td><td class=\"bgcFFF8F0\"><input type=\"text\" name=\".zokumei.\" size=\"30\" value=\"$in{'zokumei'}\" /><br />・賊砦でスタートする場合、建国成功後の新国家の名称と共に、賊の名称を決めてください。<br /> [全角大文字で１～８文字以内]/末尾に（○○賊）\表示\は有りません。</td></tr>";


	&HEADER;

	&IMG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id");
	print <<"PRI";


<table class=\"bgc414141\" width=\"600\"><tr><td class=\"bgcFFFFFF\" width=\"100\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"490\">
<span class=\"cFFFFFF\">
《 $come1 》<br /><br />
<br /><br />
$come2</span>
</td></tr></table>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />

<input type=\"hidden\" name=\".m.\" value=\"muhon\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<table width=\"80%\" class=\"bgc884422\">
<tr><td class=\"txth\" class=\"bgcFFF8F0\" colspan=\"2\">$come1</td></tr>
<tr><td class=\"bgcF8F0E0\" colspan=\"2\">
</td></tr>
<tr class=\"bgcF8F0E0\"><td width=\"100\">国名</td><td class=\"bgcFFF8F0\"><input type=\"text\" name=\".kokumei.\" size=\"30\" value=\"$in{'kokumei'}\" /><br />・新国家の名称を決めてください。<br /> [全角大文字で１～８文字以内]/末尾に（○○国）\表示\は有りません。</td></tr>
$comez
<tr class=\"bgcF8F0E0\"><td width=\"100\">天子</td><td class=\"bgcFFF8F0\"><input type=\"text\" name=\".mes.\" size=\"30\" value=\"$in{'mes'}\" /><br />・新国家の皇帝となる天子の名称を決めてください。<br /> [全角大文字で１～８文字以内]/例：霊帝。楓姫。</td></tr>
<tr><td class=\"bgcF8F0E0\">国の色</td><td class=\"bgcFFF8F0\"><table border=\"1\"><tr class=\"bgc60AF60\">
PRI

	if($in{'ele'} ne ""){print "<input type=\"radio\" name=\".ele.\" value=\"$in{'ele'}\" checked=\"checked\" /><span class=\"kcb$in{'ele'}\">■</span> \n";
	}
	$i=0;
	foreach(@ELE_BG){print "<td class=\"txth\"><span class=\"kcm$i\">■</span><br /><input type=\"radio\" name=\".ele.\" value=\"$i\" /></td>\n";$i++;}

	print <<"PRI";
</tr></table>・国の色を決めてください。</td></tr>$come3
</table>
<input type=\"submit\" value=\"$come1\" /></div></form>

$come_cdl

PRI

	&FOOTER;

	exit;

	}

}

1;