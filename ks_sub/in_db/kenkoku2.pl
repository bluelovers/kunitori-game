
sub MOVE {

		$come1 = "を建国";
$in{'min'} = $p_minzoku{$f_id};
$intosi = $in{'k_no'};
	$zokuhit = 0;
	if($in{'k_no'} =~ /z/ ) {
$intosi =~ s/z//g;
	$zokuhit = 1;
	}
$intosi =abs(int($intosi));
require "./$mpg_r/sub_db/ingo.pl";

require "./$mpg_r/sub_db/kakuduke.pl";
require "./$mpg_r/sub_db/kanbu.pl";
require "./$mpg_r/sub_db/mapw.pl";

	&TT_GET;
	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");
if($intosi >= $tosi_kazu) { &ER1("都市の入力が不正です。"); }

				&KANBU_NAME;

$in{'min'} = $p_minzoku{$f_id};
		$add_kn2 = $k_name{$fk_id};
				$add_k1 = $k_kunino{$p_kunino{$f_id}};

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



if($k_yakusyoku_id{$fk_id}[1] eq $f_id and $k_kunino{$fk_id} and $p_kuni_sikan_nensuu{$f_id} < 10) { &ER1("従年数10年以下の${$zokukanbuptn}[$p_kuni_yakusyoku{$f_id}]は建国並びに遠方建国＆遠方仕官できません。（建国→下野又は寝返り→建国→前に建てた国は武将不足で滅亡・・・の建国乱立防止のため）"); }

	if($tuki_genzai<1){
if($in{'k_no'} eq "") { &ER1("初期位置が選択されていません。"); }
	if (-e $lockfile2) {&ER2("更新処理中です。しばらくお待ち下さい。");}




	$zc=0;$m_hit=0;
							$ft_id = $intosi;
	&T_OPEN("tosi_db","$ft_id","$ft_id");

	$add_dno = $t_kunino{$ft_id};
	if($zokuhit) {
	$add_dno = $t_zokuno{$ft_id};
	}
if($add_dno eq $p_kunino{$f_id} and $p_kunino{$f_id}) { &ER1("貴方はその国に所属しています。"); }
	if(!$add_dno){
		if($in{'ele'} eq ""){&ER1("建国・賊旗揚げの場合、国の色を選択してください。");}
	&MOJISUU($in{'kokumei'},16);
		if($in{'kokumei'} eq "" or $mojisuu_h_all < 2 or $mojisuu_o) { &ER1("国の名前が正しく入力されていません。$mojisuu_re"); }
	&MOJISUU($in{'mes'},16);
		if($in{'mes'} eq "" or $mojisuu_h_all < 2 or $mojisuu_o) { &ER1("天子の名前が正しく入力されていません。$mojisuu_re"); }


$cnksw = $in{'kokumei'};
$cnksw =~  s/ //g;
$cnksw =~  s/　//g;
	foreach(@KSW){
if($_ and $cnksw =~ /\Q$_\E/i ) {
		&ER1("その国名は使用できません。$_『隠語・淫語フィルター』");}
	}
if($cnksw eq "") {
		&ER1("その国名は使用できません。『隠語・淫語フィルター』");}
$cnksw = $in{'mes'};
$cnksw =~  s/ //g;
$cnksw =~  s/　//g;
	foreach(@KSW){
if($_ and $cnksw =~ /\Q$_\E/i ) {
		&ER1("天子にその名は使用できません。$_『隠語・淫語フィルター』");}
	}
if($cnksw eq "") {
		&ER1("天子にその名は使用できません。『隠語・淫語フィルター』");}

		$m_hit = 1;



		$ft_id = $intosi;
	&T_OPEN("tosi_db","$ft_id","$ft_id");

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
	&MOJISUU($in{'zokumei'},16);
		if($in{'zokumei'} eq "" or $mojisuu_h_all < 2 or $mojisuu_o) { &ER1("賊の名前が正しく入力されていません。$mojisuu_re"); }
$cnksw = $in{'zokumei'};
$cnksw =~  s/ //g;
$cnksw =~  s/　//g;
	foreach(@KSW){
if($_ and $cnksw =~ /\Q$_\E/i ) {
		&ER1("賊名にその名は使用できません。$_『隠語・淫語フィルター』");}
	}
if($cnksw eq "") {
		&ER1("賊名にその名は使用できません。『隠語・淫語フィルター』");}
		$add_name_dz = "$in{'zokumei'} ";

		$wcou_name = "$add_name_dz";
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
###############
	}else{

	if(!$k_kunino[$add_dno]){
		&ER1("その国は存在しません。");
	}else{
		$p_kunino{$f_id} = $k_kunino[$add_dno];
	}
	}

&F_LOCK;

if($fk_id){
	&KUNI_KAKUDUKE("$f_id","$p_kunino{$f_id}","$p_kunino{$f_id}");
	&K_N_SAVE("kuni_db","$fk_id","$fk_id");
}
	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);
	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$old_date = "<a href=./mapr/$yymaprid>$old_date</a>";

	if($m_hit){
		$p_kunino{$f_id} = $new_kuni_id_in;
		$fk_id = $new_kuni_id_in;


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
	
	&K_READ("kuni_db","1","1");
$k_kousen_aite_k{$fk_id}[0] = '0';
	if($tenkakaisuu > 1 and $keika_nen < 100 and $k_kunino{"1"} eq "1"){
$k_kousen_aite_k{$fk_id}[0] = '1';
	}
$k_kousen_aite_k{$fk_id}[1] = '0';
$k_kousen_aite_k{$fk_id}[2] = '0';
$k_kousen_aite_k{$fk_id}[3] = '0';
$k_kousen_aite_k{$fk_id}[4] = '0';
$k_kousen_aite_k{$fk_id}[5] = '0';
$k_kousen_aite_k{$fk_id}[6] = '0';
$k_kousen_aite_k{$fk_id}[7] = '0';
$k_kousen_aite_k{$fk_id}[8] = '0';
$k_kousen_aite_k{$fk_id}[9] = '0';
	
$k_id{$fk_id} = $new_kuni_id_in;
$k_kunino{$fk_id} = $new_kuni_id_in;
$k_name{$fk_id} = "$in{'kokumei'} ";
$k_iro_d{$fk_id} = $in{'ele'};
$k_keika_t{$fk_id} = 0;
$k_kokui{$fk_id} = 50;
$k_sirei_bun{$fk_id} = " ";
$k_tensi_name{$fk_id} = "$in{'mes'} ";
$k_kouryaku_mokuhyou{$fk_id}[0] = 0;
$k_zenki_tosisuu{$fk_id} = 1;
$k_busyou_kazei{$fk_id} = 0;
$k_kokko_sougaku{$fk_id} = 0;
$k_zenki_sou_syuunyuu{$fk_id} = 0;
$k_yomikaki{$fk_id} = 0;
$k_kouhou_tyouhei_name{$fk_id} = "無し";
$k_name_d{$fk_id} = "$in{'kokumei'} ";
$k_name_k{$fk_id} = "$in{'kokumei'} ";
$k_name_outyou{$fk_id}="$in{'kokumei'} ";
$k_name_z{$fk_id} = "$in{'zokumei'} ";
$k_syuminzoku{$fk_id} = $in{'min'};
$k_yakusyoku_id{$fk_id}[1] = $f_id;

	&K_N_SAVE("kuni_db","$fk_id","$fk_id");



@new_charak=();
	open(OUT,">./pr/klog/$p_kunino{$f_id}.cgi");
	print OUT @new_charak;
	close(OUT);
	open(OUT,">./pr/k/$p_kunino{$f_id}.cgi");
	print OUT @new_charak;
	close(OUT);
	open(OUT,">./p_db/slogid/k_$p_kunino{$f_id}.cgi");
	print OUT @new_charak;
	close(OUT);


		$ft_id = $intosi;
	&T_OPEN("tosi_db","$ft_id","$ft_id");
	if($zokuhit) {
		$t_zokuno{$ft_id} = $new_kuni_id_in;
	}else{
		$t_kunino{$ft_id} = $new_kuni_id_in;
		$t_tian_ti{$ft_id} = 70;
	}
	&T_SAVE("tosi_db","$ft_id","$ft_id");


	unlink("./w_db/kuni/coudata$p_kunino{$f_id}\.pl");
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
												&MAPS;
	if($zokuhit) {
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$f_id}が$t_name{$ft_id}の賊砦にて$k_name_d[$p_kunino{$f_id}]を旗揚げ。");
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の賊砦にて$k_p_k_a{$p_kunino{$f_id}}を旗揚げする。");
		&MAP_LOG2("<span class=\"c000088\">【賊旗揚げ】</span>\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$add_k1\" target=\"_blank\"><span class=\"kcb$add_k1\">$add_kn2</span></a>の$p_p_b_a{$f_id}が$t_name{$ft_id}の賊砦にて$k_p_k_a{$p_kunino{$f_id}}を旗揚げしました。");
		&MAP_LOG("<span class=\"c000088\">【賊旗揚げ】</span><a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$add_k1\" target=\"_blank\"><span class=\"kcb$add_k1\">$add_kn2</span></a>の$p_p_b_a{$f_id}が$t_name{$ft_id}の賊砦にて$k_p_k_a{$p_kunino{$f_id}}を旗揚げしました。");

$k_kousen_aite_k{$fk_id}[0] = '0';
$k_kousen_aite_k{$fk_id}[1] = '0';
$k_kousen_aite_k{$fk_id}[2] = '0';
$k_kousen_aite_k{$fk_id}[3] = '0';
$k_kousen_aite_k{$fk_id}[4] = '0';
$k_kousen_aite_k{$fk_id}[5] = '0';
$k_kousen_aite_k{$fk_id}[6] = '0';
$k_kousen_aite_k{$fk_id}[7] = '0';
$k_kousen_aite_k{$fk_id}[8] = '0';
$k_kousen_aite_k{$fk_id}[9] = '0';
			$k_kousen_aite_name{$p_kunino{$f_id}} = "無し";
	if($tenkakaisuu > 1 and $keika_nen < 100 and $k_kunino{$fk_id} eq "1"){
			$k_kousen_aite_k{$p_kunino{$f_id}}[0] = 1;
			$k_kousen_aite_name{$p_kunino{$f_id}} = "$k_name_d[1]";
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]天子：$in{'mes'}は、時の支配勢力 $k_name_d[1]に対し宣戦布告を行いました。");
	}

	}else{
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$f_id}が天子：$in{'mes'}を擁立し、$t_name{$ft_id}の地に$k_name_d[$p_kunino{$f_id}]を建国。");
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]天子 $in{'mes'} を擁立し、$t_name{$ft_id}の地に$k_p_k_a{$p_kunino{$f_id}}を建国する。");
		&MAP_LOG2("<span class=\"c000088\">【建国】</span>\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$add_k1\" target=\"_blank\"><span class=\"kcb$add_k1\">$add_kn2</span></a>の$p_p_b_a{$f_id}が天子：$in{'mes'}を擁立し、$t_name{$ft_id}に$k_p_k_a{$p_kunino{$f_id}}を建国しました。");
		&MAP_LOG("<span class=\"c000088\">【建国】</span><a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$add_k1\" target=\"_blank\"><span class=\"kcb$add_k1\">$add_kn2</span></a>の$p_p_b_a{$f_id}が天子：$in{'mes'}を擁立し、$t_name{$ft_id}に$k_p_k_a{$p_kunino{$f_id}}を建国しました。");

$k_kousen_aite_k{$fk_id}[0] = '0';
$k_kousen_aite_k{$fk_id}[1] = '0';
$k_kousen_aite_k{$fk_id}[2] = '0';
$k_kousen_aite_k{$fk_id}[3] = '0';
$k_kousen_aite_k{$fk_id}[4] = '0';
$k_kousen_aite_k{$fk_id}[5] = '0';
$k_kousen_aite_k{$fk_id}[6] = '0';
$k_kousen_aite_k{$fk_id}[7] = '0';
$k_kousen_aite_k{$fk_id}[8] = '0';
$k_kousen_aite_k{$fk_id}[9] = '0';
			$k_kousen_aite_name{$p_kunino{$f_id}} = "無し";
	if($tenkakaisuu > 1 and $keika_nen < 100 and $k_kunino[1] and $k_kunino{$fk_id} ne "1"){
			$k_kousen_aite_k{$p_kunino{$f_id}}[0] = 1;
			$k_kousen_aite_name{$p_kunino{$f_id}} = "$k_name_d[1]";
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]天子：$in{'mes'}は、時の支配勢力 $k_name_d[1]に対し宣戦布告を行いました。");
	}
	}

	$p_syoji_kin{$f_id} += 1000;
	$p_syoji_kome{$f_id} += 500;
	$p_kuni_kouken{$f_id} = 3000;
	$p_neutral_meisei{$f_id} += 3000;
		$p_kuni_yakusyoku{$f_id} = 1;
$p_exyabou{$f_id} += 20;
	}else{
		$p_kuni_yakusyoku{$f_id} = 0;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
	&KUNI_KAKUDUKE("$f_id","$fk_id","$add_k1");
if($add_k1){
	&K_SAVE("kuni_db","$add_k1","$add_k1");
}

		$ft_id = $intosi;
	&T_OPEN("tosi_db","$ft_id","$ft_id");
		$come1 = "に仕官";
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}に仕官しなおす。初期位置：$t_name{$ft_id}。");
		&MAP_LOG("<span class=\"c0088CC\">【仕官しなおし】</span><a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$add_k1\" target=\"_blank\"><span class=\"kcb$add_k1\">$add_kn2</span></a>の$p_p_b_a{$f_id}が$k_p_k_a{$p_kunino{$f_id}}に仕官しなおしました。初期位置：$t_name{$ft_id}");
	}

	$p_taizai_iti{$f_id} = $intosi;
	$p_kuni_sikan_nensuu{$f_id} = 0;$p_kuni_kouken{$f_id} = 0;

$p_kunizokusei{$f_id} = $zokuhit;

&P_SAVE("p","$f_id","$f_id");

	open(IN,"./p_db/tt/ktms4$f_id.cgi");
	@KTM = <IN>;
	close(IN);
	($ktms4,$ktms4w,$tmtmit,$tmtmw1,$tmtmw2,$tmtmw3) = split(/<>/,$KTM[0]);

	@KTM=();
	unshift(@KTM,"0<>$ktms4w<>$tmtmit<>$tmtmw1<>$tmtmw2<>$tmtmw3<>\n");
	open(OUT,">./p_db/tt/ktms4$f_id.cgi");
	print OUT @KTM;
	close(OUT);
	&UNLOCK_FILE; 
#########
	}else{
#########
	&BIJYOU_READ("$f_id");
if($p_bjijyou_w{$f_id}[101]) { &ER1("建国後放置して滅亡した国の建国者は一定期間建国できません。残り$p_bjijyouc{$f_id}[$p_bjijyou_no{$f_id}[101]]ヶ月お待ち下さい。（武将不足滅亡と建国の繰り返しによる無敵化防止のため）"); }
	if (-e $lockfile2) {&ER2("更新処理中です。しばらくお待ち下さい。");}


	$zc=0;$m_hit=0;
							$ft_id = $p_taizai_iti{$f_id};

$intosi = $p_taizai_iti{$f_id};
	$zokuhit = 0;
	if($t_kunino{$ft_id}) {
	$zokuhit = 1;
	}

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
if($_ and $cnksw =~ /\Q$_\E/i ) {
		&ER1("その国名は使用できません。$_『隠語・淫語フィルター』");}
	}
if($cnksw eq "") {
		&ER1("その国名は使用できません。『隠語・淫語フィルター』");}
$cnksw = $in{'mes'};
$cnksw =~  s/ //g;
$cnksw =~  s/　//g;
	foreach(@KSW){
if($_ and $cnksw =~ /\Q$_\E/i ) {
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
	&MOJISUU($in{'zokumei'},16);
		if($in{'zokumei'} eq "" or $mojisuu_h_all < 2 or $mojisuu_o) { &ER1("賊の名前が正しく入力されていません。$mojisuu_re"); }
$cnksw = $in{'zokumei'};
$cnksw =~  s/ //g;
$cnksw =~  s/　//g;
	foreach(@KSW){
if($_ and $cnksw =~ /\Q$_\E/i ) {
		&ER1("賊名にその名は使用できません。$_『隠語・淫語フィルター』");}
	}
if($cnksw eq "") {
		&ER1("賊名にその名は使用できません。『隠語・淫語フィルター』");}
		$add_name_dz = "$in{'zokumei'} ";

		$wcou_name = "$add_name_dz";
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
if($fk_id){
	&KUNI_KAKUDUKE("$f_id","$p_kunino{$f_id}","$p_kunino{$f_id}");
	&K_N_SAVE("kuni_db","$fk_id","$fk_id");
}
	
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
	
$k_kousen_aite_k{$fk_id}[0] = '0';
$k_kousen_aite_k{$fk_id}[1] = '0';
$k_kousen_aite_k{$fk_id}[2] = '0';
$k_kousen_aite_k{$fk_id}[3] = '0';
$k_kousen_aite_k{$fk_id}[4] = '0';
$k_kousen_aite_k{$fk_id}[5] = '0';
$k_kousen_aite_k{$fk_id}[6] = '0';
$k_kousen_aite_k{$fk_id}[7] = '0';
$k_kousen_aite_k{$fk_id}[8] = '0';
$k_kousen_aite_k{$fk_id}[9] = '0';
	if($tenkakaisuu > 1 and $keika_nen < 100 and $k_kunino{"1"} eq "1"){
$k_kousen_aite_k{$fk_id}[0] = '1';
	}
	

$k_id{$fk_id} = $new_kuni_id_in;
$k_kunino{$fk_id} = $new_kuni_id_in;
$k_name{$fk_id} = "$in{'kokumei'} ";
$k_iro_d{$fk_id} = $in{'ele'};
$k_keika_t{$fk_id} = 0;
$k_kokui{$fk_id} = 50;
$k_sirei_bun{$fk_id} = " ";
$k_tensi_name{$fk_id} = "$in{'mes'} ";
$k_kouryaku_mokuhyou{$fk_id}[0] = 0;
$k_zenki_tosisuu{$fk_id} = 1;
$k_busyou_kazei{$fk_id} = 0;
$k_kokko_sougaku{$fk_id} = 0;
$k_zenki_sou_syuunyuu{$fk_id} = 0;
$k_yomikaki{$fk_id} = 0;
$k_kouhou_tyouhei_name{$fk_id} = "無し";
$k_name_d{$fk_id} = "$in{'kokumei'} ";
$k_name_k{$fk_id} = "$in{'kokumei'} ";
$k_name_outyou{$fk_id}="$in{'kokumei'} ";
$k_name_z{$fk_id} = "$in{'zokumei'} ";
$k_syuminzoku{$fk_id} = $in{'min'};
$k_yakusyoku_id{$fk_id}[1] = $f_id;


	&K_N_SAVE("kuni_db","$fk_id","$fk_id");



@new_charak=();
	open(OUT,">./pr/klog/$p_kunino{$f_id}.cgi");
	print OUT @new_charak;
	close(OUT);
	open(OUT,">./p_db/slogid/k_$p_kunino{$f_id}.cgi");
	print OUT @new_charak;
	close(OUT);

		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");
	if($zokuhit) {
		$t_zokuno{$ft_id} = $new_kuni_id_in;
		$p_syoji_kin{$f_id} -= 200000;
	}else{
		$t_kunino{$ft_id} = $new_kuni_id_in;
		$t_tian_ti{$ft_id} = 70;
	}
	&T_SAVE("tosi_db","$ft_id","$ft_id");
	unlink("./w_db/kuni/coudata$p_kunino{$f_id}\.pl");
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
												&MAPS;
	if($zokuhit) {
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$f_id}が$t_name{$ft_id}の賊砦にて$k_name_d[$p_kunino{$f_id}]を旗揚げ。");
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の賊砦にて$k_p_k_a{$p_kunino{$f_id}}を旗揚げする。");
		&MAP_LOG2("<span class=\"c000088\">【賊旗揚げ】</span>\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$add_k1\" target=\"_blank\"><span class=\"kcb$add_k1\">$add_kn2</span></a>の$p_p_b_a{$f_id}が$t_name{$ft_id}の賊砦にて$k_p_k_a{$p_kunino{$f_id}}を旗揚げしました。");
		&MAP_LOG("<span class=\"c000088\">【賊旗揚げ】</span><a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$add_k1\" target=\"_blank\"><span class=\"kcb$add_k1\">$add_kn2</span></a>の$p_p_b_a{$f_id}が$t_name{$ft_id}の賊砦にて$k_p_k_a{$p_kunino{$f_id}}を旗揚げしました。");

$k_kousen_aite_k{$fk_id}[0] = '0';
$k_kousen_aite_k{$fk_id}[1] = '0';
$k_kousen_aite_k{$fk_id}[2] = '0';
$k_kousen_aite_k{$fk_id}[3] = '0';
$k_kousen_aite_k{$fk_id}[4] = '0';
$k_kousen_aite_k{$fk_id}[5] = '0';
$k_kousen_aite_k{$fk_id}[6] = '0';
$k_kousen_aite_k{$fk_id}[7] = '0';
$k_kousen_aite_k{$fk_id}[8] = '0';
$k_kousen_aite_k{$fk_id}[9] = '0';
			$k_kousen_aite_name{$p_kunino{$f_id}} = "無し";
	if($tenkakaisuu > 1 and $keika_nen < 100 and $k_kunino[1] and $k_kunino{$fk_id} ne "1"){
			$k_kousen_aite_k{$p_kunino{$f_id}}[0] = 1;
			$k_kousen_aite_name{$p_kunino{$f_id}} = "$k_name_d[1]";
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]天子：$in{'mes'}は、時の支配勢力 $k_name_d[1]に対し宣戦布告を行いました。");
	}

	}else{
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]$p_p_b_a{$f_id}が天子：$in{'mes'}を擁立し、$t_name{$ft_id}の地に$k_name_d[$p_kunino{$f_id}]を建国。");
									$ttid = "blog/$f_id";
									&PRLOG("\[$old_date\]天子 $in{'mes'} を擁立し、$t_name{$ft_id}の地に$k_p_k_a{$p_kunino{$f_id}}を建国する。");
		&MAP_LOG2("<span class=\"c000088\">【建国】</span>\[$old_date\]<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$add_k1\" target=\"_blank\"><span class=\"kcb$add_k1\">$add_kn2</span></a>の$p_p_b_a{$f_id}が天子：$in{'mes'}を擁立し、$t_name{$ft_id}に$k_p_k_a{$p_kunino{$f_id}}を建国しました。");
		&MAP_LOG("<span class=\"c000088\">【建国】</span><a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$add_k1\" target=\"_blank\"><span class=\"kcb$add_k1\">$add_kn2</span></a>の$p_p_b_a{$f_id}が天子：$in{'mes'}を擁立し、$t_name{$ft_id}に$k_p_k_a{$p_kunino{$f_id}}を建国しました。");

$k_kousen_aite_k{$fk_id}[0] = '0';
$k_kousen_aite_k{$fk_id}[1] = '0';
$k_kousen_aite_k{$fk_id}[2] = '0';
$k_kousen_aite_k{$fk_id}[3] = '0';
$k_kousen_aite_k{$fk_id}[4] = '0';
$k_kousen_aite_k{$fk_id}[5] = '0';
$k_kousen_aite_k{$fk_id}[6] = '0';
$k_kousen_aite_k{$fk_id}[7] = '0';
$k_kousen_aite_k{$fk_id}[8] = '0';
$k_kousen_aite_k{$fk_id}[9] = '0';
			$k_kousen_aite_name{$p_kunino{$f_id}} = "無し";
	if($tenkakaisuu > 1 and $keika_nen < 100 and $k_kunino[1] and $k_kunino{$fk_id} ne "1"){
			$k_kousen_aite_k{$p_kunino{$f_id}}[0] = 1;
			$k_kousen_aite_name{$p_kunino{$f_id}} = "$k_name_d[1]";
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]天子：$in{'mes'}は、時の支配勢力 $k_name_d[1]に対し宣戦布告を行いました。");
	}
	}

	$p_kuni_kouken{$f_id} = 3000;
	$p_neutral_meisei{$f_id} += 3000;$p_kuni_sikan_nensuu{$f_id} = 0;$p_kuni_kouken{$f_id} = 0;
		$p_kuni_yakusyoku{$f_id} = 1;
$p_exyabou{$f_id} += 20;
$p_kunizokusei{$f_id} = $zokuhit;

&P_SAVE("p","$f_id","$f_id");

	open(IN,"./p_db/tt/ktms4$f_id.cgi");
	@KTM = <IN>;
	close(IN);
	($ktms4,$ktms4w,$tmtmit,$tmtmw1,$tmtmw2,$tmtmw3) = split(/<>/,$KTM[0]);

	@KTM=();
	unshift(@KTM,"0<>$ktms4w<>$tmtmit<>$tmtmw1<>$tmtmw2<>$tmtmw3<>\n");
	open(OUT,">./p_db/tt/ktms4$f_id.cgi");
	print OUT @KTM;
	close(OUT);
	&UNLOCK_FILE;
	}
	}



	&HEADER;

	print <<"PRI";
<hr /><span class=\"fs4\">$p_name{$f_id}は$k_name_d[$p_kunino{$f_id}]$come1しました。</span><br /><br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"ＯＫ\" /></div></form>
PRI

	&FOOTER;

	exit;

}


#  ERROR

sub ER1 {

	&HEADER;
	if ($lockhit > 0) { 
		while ($lockhit > 0) {
 &UNLOCK_FILE;
		}
	}
	print "<hr /><span class=\"fs4\">ヽ(｀Д´)ノ</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>$_[0]</strong></span>\n";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".toi.\" value=\"$in{'toi'}\" /><input type=\"hidden\" name=\".toi2.\" value=\"$in{'toi2'}\" />
<input type=\"hidden\" name=\".toi3.\" value=\"$in{'toi3'}\" /><input type=\"hidden\" name=\".toi4.\" value=\"$in{'toi4'}\" />
<input type=\"hidden\" name=\".toi5.\" value=\"$in{'toi5'}\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"$in{'tyekku'}\" />
<input type=\"hidden\" name=\".toi6.\" value=\"$in{'toi6'}\" /><input type=\"hidden\" name=\".zokumei.\" value=\"$in{'zokumei'}\" />
<input type=\"hidden\" name=\".ele.\" value=\"$in{'ele'}\" /><input type=\"hidden\" name=\".kokumei.\" value=\"$in{'kokumei'}\" /><input type=\"hidden\" name=\".min.\" value=\"$in{'min'}\" /><input type=\"hidden\" name=\".icon.\" value=\"$in{'icon'}\" /><input type=\"hidden\" name=\".str.\" value=\"$in{'str'}\" /><input type=\"hidden\" name=\".int.\" value=\"$in{'int'}\"><input type=\"hidden\" name=\".tou.\" value=\"$in{'tou'}\"><input type=\"hidden\" name=\".k_no.\" value=\"$in{'k_no'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".chara_name.\" value=\"$in{'chara_name'}\"><input type=\"hidden\" name=\".mes.\" value=\"$in{'mes'}\" /><input type=\"submit\" value=\"入力に戻る\" /></div></form>";
	print "<br /><br /><hr />\n</div></body></html>\n";
	exit;
}
#  参加者上限

sub CHEACKER {


opendir(IN,'./p_db/p');
@cfs = (readdir(IN));
closedir(IN);
$sousu1 = $#cfs -2;


	$num = $sousu1;

		if($num > $EN_MAX){
			&ER1("最大登録数\[$EN_MAX\]を超えています。現在新規登録出来ません。");
		}

}

sub Portscan {
	my ($radd) = $_[0];
	($rfile = $radd) =~ s/\./_/g;
	if(!-f "../noproxy/$rfile"){
		for ('80', '8080', '3128', '6588', '4030'){
			&Error("PROXY!($_)") if (&Proxy($radd, $_) == 1);
		}
		open NOPROXY, ">../noproxy/$rfile";
		print NOPROXY 1;
		close NOPROXY;
	}
}

sub Proxy {
	my ($radd, $port) = @_;
	use IO::Socket;
	my $SOCKET = IO::Socket::INET -> new(	PeerAddr => $radd,
											PeerPort => $port,
											Proto	 => "tcp",
											Timeout	 => 1	);
	if ($SOCKET){
		$ret = 1;
		$SOCKET -> close();
	}else{
		$ret = 0;
	}
	return $ret;
}

sub Error {
	if ($lockhit > 0) { 
		while ($lockhit > 0) {
 &UNLOCK_FILE;
		}
	}
print <<"PRI";
content-type: text/html; charset=EUC-JP
cache-control: no-cache
pragma: no-cache

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="ja">
<head>$TAG_d_head{$doc_mode}
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-JP" $TAG_s0>
	<meta name="Author" content="Pao_JIZO" $TAG_s0>
	<title>ERROR - $_[0]</title>
</head>
<body>$TAG_div_s{$doc_mode}
<span class=\"fs4\">$_[0]</span>
</div></body>
</html>
PRI
	exit;
}

1;