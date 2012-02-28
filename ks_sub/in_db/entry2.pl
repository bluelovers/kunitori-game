
sub MOVE {

	&TT_GET;


$zzz = 0;
$zzz2 = 0;
	if(!$in{'doui'}) { &E_ERR("$GAME_TITLEに登録するには利用規約に同意する必要があります。"); }
#	if($in{'toi'} ne "7") { &E_ERR('トラブルがあったときの報告先が間違っています。<br />説明書（規約）をお読み下さい。'); }

	if($in{'toi2'} eq "") { &E_ERR('項目を埋めてください。toi2'); }
	if($in{'toi3'} eq "") { &E_ERR('項目を埋めてください。toi3'); }
	if($in{'toi4'} eq "") { &E_ERR('項目を埋めてください。toi4'); }
	if($in{'toi5'} eq "") { &E_ERR('項目を埋めてください。toi5'); }
	if($in{'toi6'} eq "") { &E_ERR('項目を埋めてください。toi6'); }
	if($in{'toi7'} eq "") { &E_ERR('項目を埋めてください。toi7'); }
	if($in{'min'} eq "") { &E_ERR('項目を埋めてください。min'); }
&HOST_NAME;
&GET_COOKIE;

#&E_ERR("新規登録は現在受け付けていません。");
	if ($cktime) {

	if(-e "./p_db/p/$ckid.cgi" or -e "./p_db/touketu/$ckid.cgi") {
&E_ERR("更新処理中です。しばらくお待ち下さい。");
	}else{
	}

	}

	if (-e $lockfile2) {&E_ERR("更新処理中です。しばらくお待ち下さい。");}
	&TT_GET;
	&CHEACKER;

$in{'id'} =~ tr/A-Z/a-z/;
	&MOJISUU($in{'keyw'},24);
	if ($mojisuu_o){&E_ERR("キーワードが長すぎます。$mojisuu_re");}
	if ($in{'min'} =~ m/[^0-9]/ or $in{'min'} > 14) {&E_ERR("正規のフォームで登録してください。"); }
	if ($in{'toi2'} =~ m/[^0-9]/ or $in{'toi2'} > 199) {&E_ERR("正規のフォームで登録してください。"); }
	if ($in{'id'} =~ m/[^0-9a-z]/) {&E_ERR("IDに半角英数字以外の文字が含まれています。半角英数字"); }
	if ($in{'id'} !~ m/[^0-9]/){&E_ERR("IDが数字のみで構成されています。英字を１字以上混ぜてください。"); }
	if ($in{'pass'} =~ m/[^0-9a-zA-Z]/) {&E_ERR("パスワードに半角英数字以外の文字が含まれています。"); }
	if($in{'id'} eq "" or length($in{'id'}) < 4 or length($in{'id'}) > 12) { &E_ERR("IDは、4文字以上、12文字以下で入力して下さい。"); }
	if($in{'k_no'} eq "") { &E_ERR("初期位置が選択されていません。"); }
	if($in{'pass'} eq "" or length($in{'pass'}) < 4 or length($in{'pass'}) > 8) { &E_ERR("パスワードは、4文字以上、8文字以下で入力して下さい。"); }
	&MOJISUU($in{'chara_name'},16);
	if($in{'chara_name'} eq "" or $mojisuu_h_all < 2 or $mojisuu_o) { &E_ERR("キャラクターの名前が正しく入力されていません。$in{'chara_name'}。$mojisuu_re"); }
	if($in{'id'} eq $in{'pass'}){&E_ERR("IDとパスワードが同じ場合、登録はできません"); }

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

$add = $in{'id'};
$add1 = $add;
$add2 = $add;
$add =~ s/(.)\1+/$1/g;
	if (length($add) < 4){&E_ERR("$in{'id'}←IDが単純すぎです。<br /><br />連続文字列が多すぎます。<br />（b111、777p2、4d222等は×）（uhyo22、paon5等は○）"); }
$add1 =~ tr/a-zA-Z//d;
$add1 =~ s/(.)\1+/$1/g;
$add2 =~ tr/a-zA-Z//cd;
$add2 =~ s/(.)\1+/$1/g;
	if (length($add1) < 3 and length($add2) < 3){&E_ERR("$in{'id'}←IDが単純すぎです。<br /><br />なるべく連続文字列を使わずに、もう少し文字数を増やしてください。"); }

$add = $in{'pass'};
$add1 = $add;
$add2 = $add;
$add =~ s/(.)\1+/$1/g;
	if (length($add) < 4){&E_ERR("$in{'pass'}←passが単純すぎです。<br /><br />連続文字列が多すぎます。<br />（b111、777p2、4d222等は×）（uhyo22、paon5等は○）"); }
$add1 =~ tr/a-zA-Z//d;
$add1 =~ s/(.)\1+/$1/g;
$add2 =~ tr/a-zA-Z//cd;
$add2 =~ s/(.)\1+/$1/g;
	if (length($add1) < 3 and length($add2) < 3){&E_ERR("$in{'pass'}←passが単純すぎです。<br /><br />なるべく連続文字列を使わずに、もう少し文字数を増やしてください。"); }



	$in{'str'} = abs(int($in{'str'}));
	$in{'int'} = abs(int($in{'int'}));
	$in{'tou'} = abs(int($in{'tou'}));

	$in{'icon'} = abs(int($in{'icon'}));
	$in{'icon_saba'} = abs(int($in{'icon_saba'}));

foreach $key ( keys %IMG ) {
$key=int($key);
$add_img[$key]=$key;
}
	if($in{'icon_saba'}>$#add_img){&E_ERR("画像鯖が正しく入力されていません。");}
	if($in{'icon'} > $KYARA_IMG_MAX{$in{'icon_saba'}}) { &ER1("0～$KYARA_IMG_MAX{$in{'icon_saba'}}の間で入力してください。"); }

	if($in{'str'} > 100){&E_ERR("武力が正しく入力されていません。");}
	if($in{'int'} > 100){&E_ERR("知力が正しく入力されていません。");}
	if($in{'tou'} > 100){&E_ERR("統率力が正しく入力されていません。");}
	$max = int($in{'str'} + $in{'int'} + $in{'tou'});
	if($max ne "150"){
		&E_ERR("三種能力の合計値が150ではありません。（計・$max）");
	}
$intosi = $in{'k_no'};
	$zokuhit = 0;
	if($in{'k_no'} =~ /c/ ) {
$intosi =~ s/c//g;
		$fk_id = $intosi;
	&K_OPEN("kuni_db","$fk_id","$fk_id");
		if(!$k_kunino{$fk_id}) {
		&E_ERR("その国は存在しないか既に滅亡しています。");
		}
$intosi = $k_outo{$fk_id};
		if($k_kokka_keitai{$fk_id}){
	$zokuhit = 1;
		}
	}elsif($in{'k_no'} =~ /z/ ) {
$intosi =~ s/z//g;
	$zokuhit = 1;
	}
$intosi =abs(int($intosi));
if($intosi >= $tosi_kazu) { &E_ERR("都市の入力が不正です。"); }
require "./$mpg_r/sub_db/ingo.pl";


$cnksw = $in{'chara_name'};
$cnksw =~  s/ //g;
$cnksw =~  s/　//g;
	foreach(@KSW){
if($_ and $cnksw =~ /\Q$_\E/ ) {
		&E_ERR("そのキャラネームは使用できません。$_『隠語・淫語フィルター』");}
	}

if($cnksw eq "") {&E_ERR("そのキャラネームは使用できません。『隠語・淫語フィルター』");}

#&Portscan($host);
#				open(IN,"./w_db/comip0.cgi");
#				@add_list0 = <IN>;
#				close(IN);
#
#
#	unshift(@add_list0,"$in{'id'}<>$host<>\n");
#	$taikai_max3 = @add_list0;
#	if($taikai_max3 > $sousu1 * 4) { pop(@add_list0); }
#
#	open(OUT,">./w_db/comip0.cgi") or &ER1('MAIN 新しいデータを書き込めません。');
#	print OUT @add_list0;
#	close(OUT);


	$f_id = $in{'id'};

$p_tyuusei{$f_id} = 100;
$p_ex_karumalc{$f_id} = 0;
$p_ex_karumald{$f_id} = 0;
$p_exgiri{$f_id} = 50;
$p_exyabou{$f_id} = 50;
$p_exbrave{$f_id} = 50;
$p_excalm{$f_id} = 50;
$p_exluck{$f_id} = 50;
$p_minzoku{$f_id} = $in{'min'};
$kjob1 = 0;
$kjob2 = 0;
$kjob3 = 0;
$kjob1ex = 0;
$kjob2ex = 0;
$kjob3ex = 0;
$p_gogyou_ka{$f_id} = 0;
$p_gogyou_sui{$f_id} = 0;
$p_gogyou_moku{$f_id} = 0;
$p_gogyou_kin{$f_id} = 0;
$p_gogyou_do{$f_id} = 0;


$kmeidoid1 = "";
$kmeidoid2 = "";
$kmeidoid3 = "";
$kmeidoid4 = "";
$kmeidosirei = 0;
$p_neutral_ex{$f_id} = 0;
$p_law_ex{$f_id} = 0;
$p_chaos_ex{$f_id} = 0;
$p_light_ex{$f_id} = 0;
$p_dark_ex{$f_id} = 0;
$p_gogyou_ka_ex{$f_id} = 0;
$p_gogyou_sui_ex{$f_id} = 0;
$p_gogyou_moku_ex{$f_id} = 0;
$p_gogyou_kin_ex{$f_id} = 0;
$p_gogyou_do_ex{$f_id} = 0;
$p_karisuma{$f_id} = 50;
$p_seisin{$f_id} = 50;
$p_nintai{$f_id} = 50;
$p_sinkousin{$f_id} = 50;
$p_jiseisin{$f_id} = 50;

$kpetid1 = "";
$kpetid2 = "";
$kpetid3 = "";
$kpetid4 = "";
$kpetsirei = 0;
$p_gundanid{$f_id} = "";
$p_gunsirei{$f_id}[0] = 0;
$p_gunsirei{$f_id}[1] = 0;
$p_butaiid{$f_id} = "";
$p_butaisirei{$f_id}[0] = 0;
$p_butaisirei{$f_id}[1] = 0;
$p_law_meisei{$f_id} = 0;
$p_chaos_meisei{$f_id} = 0;
$p_light_meisei{$f_id} = 0;
$p_dark_meisei{$f_id} = 0;
$p_bjijyou{$f_id}[0] = 0;
$p_bjijyouc{$f_id}[0] = 0;
$p_hjijyou{$f_id}[0] = 0;
$p_hjijyouc{$f_id}[0] = 0;
$p_jyoujihousin1{$f_id} = 0;

$p_jyoujihousin2{$f_id} = 0;
$kiekeitai = 0;
$kieiti = 0;
$p_tuusan_nensuu{$f_id} = 0;
$p_syussei{$f_id} = "$in{'toi2'}";
$p_migite_lv{$f_id} = 0;
$p_hidarite_lv{$f_id} = 0;
$p_syomotu_lv{$f_id} = 0;
$p_ihuku{$f_id} = 0;
$p_ihuku_lv{$f_id} = 0;
$p_norimono{$f_id} = 0;
$p_norimono_lv{$f_id} = 0;
$p_akusesari_b{$f_id}[0] = 0;
$p_akusesari_b_lv{$f_id}[0] = 0;
$p_akusesari_b{$f_id}[1] = 0;
$p_akusesari_b_lv{$f_id}[1] = 0;
$p_akusesari_b{$f_id}[2] = 0;
$p_akusesari_b_lv{$f_id}[2] = 0;
$p_akusesari_b{$f_id}[3] = 0;
$p_akusesari_b_lv{$f_id}[3] = 0;
$p_akusesari_b{$f_id}[4] = 0;
$p_akusesari_b_lv{$f_id}[4] = 0;
$p_jintousiki{$f_id} = 0;
$p_hei_siki{$f_id} = 50;
$p_h_kougun{$f_id} = 0;
$p_h_idou_sokudo{$f_id} = 20;
$p_h_hirou{$f_id} = 0;

$p_b_kougun{$f_id} = 0;
$p_b_idou_sokudo{$f_id} = 20;
$p_b_hirou{$f_id} = 0;
$p_akusesari_h{$f_id}[0] = 0;
$p_akusesari_h_lv{$f_id}[0] = 0;
$p_akusesari_h{$f_id}[1] = 0;
$p_akusesari_h_lv{$f_id}[1] = 0;
$p_akusesari_h{$f_id}[2] = 0;
$p_akusesari_h_lv{$f_id}[2] = 0;
$p_akusesari_h{$f_id}[3] = 0;
$p_akusesari_h_lv{$f_id}[3] = 0;
$p_akusesari_h{$f_id}[4] = 0;
$p_akusesari_h_lv{$f_id}[4] = 0;
$p_syuutyuu{$f_id} = 50;
$p_busyou_hp{$f_id} = 100;
$p_busyou_mp{$f_id} = 100;
$p_busyou_sp{$f_id} = 100;
$p_busyou_str{$f_id} = 30;
$p_busyou_dex{$f_id} = 30;
$p_busyou_agr{$f_id} = 30;
$kptid = "";
$kptsirei1 = 0;
$kptsirei2 = 0;
$p_pk_kaisuu{$f_id} = 0;
$p_sekentei{$f_id} = 0;
$p_kuni_yakusyoku{$f_id} = 0;
$p_yousi{$f_id} = 50;
$p_kotobadakumi{$f_id} = 50;

$kdbdb1 = " ";
$p_houbif{$f_id}[0] = 0;
$kdbdb3 = 0;
$kdbdb4 = 0;
$kdbdb5 = 0;
$kdbdb6 = 0;
$kdbdb7 = 0;
$p_syubi_eria{$f_id} = 0;
$p_syubi_tosi{$f_id} = 0;
$p_kunizokusei{$f_id} = $zokuhit;

$p_heisisuu_husyou{$f_id} = 0;
$p_sieki_heisisuu_husyou{$f_id} = 0;

$p_sieki_heisyu{$f_id} = 0;
$p_sieki_heisisuu{$f_id} = 0;
$p_sieki_heisisuu_max{$f_id} = 0;
$p_sieki_kunren{$f_id} = 0;
$p_sieki_heisisuu_husyou{$f_id} = 0;

$p_neutral_meisei{$f_id} = 0;

$p_yoti{$f_id} = 50;
$p_kikensatti{$f_id} = 50;
$p_dokusousei{$f_id} = 50;
$p_doubutu_tekisei{$f_id} = 50;
$p_kougaku_tekisei{$f_id} = 50;
$p_kyouyou{$f_id} = 50;
$p_kiokuryoku{$f_id} = 50;
$p_syakousei{$f_id} = 50;
$p_ihuu{$f_id} = 50;
$p_kihaku{$f_id} = 50;


$p_syakui{$f_id}=0;
$p_kijyou{$f_id} = int(rand(31))+30;
$p_syageki{$f_id} = int(rand(31))+30;
$p_bujyutu{$f_id} = int(rand(31))+30;
$p_jyujyutu{$f_id} = int(rand(31))+30;
$p_tyouhou{$f_id} = int(rand(31))+30;
$p_jyuukisouda{$f_id} = int(rand(31))+30;
$p_tyoukyou{$f_id} = int(rand(31))+30;
$p_seiji{$f_id} = int(rand(31))+30;
$p_sinyou{$f_id} = int(rand(31))+30;
$p_jinbou{$f_id} = int(rand(31))+30;

$p_kunino{$f_id} = int($p_kunino{$f_id});
$p_gundanno{$f_id} = int($p_gundanno{$f_id});
$p_guildno{$f_id} = int($p_guildno{$f_id});
$p_habatuno{$f_id} = int($p_habatuno{$f_id});
$p_butaino{$f_id} = int($p_butaino{$f_id});
$p_ptno{$f_id} = int($p_ptno{$f_id});
$p_kuni_yakusyoku{$f_id}=int($p_kuni_yakusyoku{$f_id});
$p_habatu_yakusyoku{$f_id}=int($p_habatu_yakusyoku{$f_id});
$p_gundan_yakusyoku{$f_id}=int($p_gundan_yakusyoku{$f_id});
$p_butai_yakusyoku{$f_id}=int($p_butai_yakusyoku{$f_id});
$p_guild_yakusyoku{$f_id}=int($p_guild_yakusyoku{$f_id});
$p_pt_yakusyoku{$f_id}=int($p_pt_yakusyoku{$f_id});
	$p_jinbou{$f_id} = int(rand(71))+30;

opendir(DFR,"./w_db/tosi_db");
	while($ft_id = readdir(DFR)){
		if($ft_id =~ /\.cgi/i){
$ft_id =~ s/\.cgi//;
	&T_READ("tosi_db","$ft_id","$ft_id");
		}
	}
closedir(DFR);



	$zc=0;$m_hit=0;
							$ft_id = $intosi;
	&T_OPEN("tosi_db","$ft_id","$ft_id");

	$add_dno = $t_kunino{$ft_id};
	if($zokuhit) {
	$add_dno = $t_zokuno{$ft_id};
	}
	if(!$add_dno){
		if($in{'ele'} eq ""){&E_ERR("建国・賊旗揚げの場合、国の色を選択してください。");}
	&MOJISUU($in{'kokumei'},16);
		if($in{'kokumei'} eq "" or $mojisuu_h_all < 2 or $mojisuu_o) { &E_ERR("国の名前が正しく入力されていません。$mojisuu_re"); }
	&MOJISUU($in{'mes'},16);
		if($in{'mes'} eq "" or $mojisuu_h_all < 2 or $mojisuu_o) { &E_ERR("天子の名前が正しく入力されていません。$mojisuu_re"); }

$cnksw = $in{'kokumei'};
$cnksw =~  s/ //g;
$cnksw =~  s/　//g;
	foreach(@KSW){
if($_ and $cnksw =~ /\Q$_\E/i ) {
		&E_ERR("その国名は使用できません。$_『隠語・淫語フィルター』");}
	}
if($cnksw eq "") {
		&E_ERR("その国名は使用できません。『隠語・淫語フィルター』");}
$cnksw = $in{'mes'};
$cnksw =~  s/ //g;
$cnksw =~  s/　//g;
	foreach(@KSW){
if($_ and $cnksw =~ /\Q$_\E/i ) {
		&E_ERR("天子にその名は使用できません。$_『隠語・淫語フィルター』");}
	}
if($cnksw eq "") {
		&E_ERR("天子にその名は使用できません。『隠語・淫語フィルター』");}

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
&E_ERR("その国名は既に使用されています。");
			}
		}
		$new_kuni_id_in =$kuni_kazu_max;
		if(!$new_kuni_id_in) { 
		$new_kuni_id_in =@k_name_d;
		}
		$new_kuni_id_in ++;
	if($zokuhit) {
	&MOJISUU($in{'zokumei'},16);
		if($in{'zokumei'} eq "" or $mojisuu_h_all < 2 or $mojisuu_o) { &E_ERR("賊の名前が正しく入力されていません。$mojisuu_re"); }
$cnksw = $in{'zokumei'};
$cnksw =~  s/ //g;
$cnksw =~  s/　//g;
	foreach(@KSW){
if($_ and $cnksw =~ /\Q$_\E/i ) {
		&E_ERR("賊名にその名は使用できません。$_『隠語・淫語フィルター』");}
	}
if($cnksw eq "") {
		&E_ERR("賊名にその名は使用できません。『隠語・淫語フィルター』");}
		$add_name_dz = "$in{'zokumei'} ";

		$wcou_name = "$add_name_dz";
$wcou_name =~  s/ //g;
$wcou_name =~  s/　//g;
		foreach(@k_name){
		$wx3name = "$_";
$wx3name =~  s/ //g;
$wx3name =~  s/　//g;
			if($wx3name eq $wcou_name){
&E_ERR("その賊名は既に使用されています。");
			}
		}
	}
		$hit = 1;
	}else{

	if(!$k_kunino[$add_dno]){
		&ER1("その国は存在しません。");
	}else{
		$p_kunino{$f_id} = $k_kunino[$add_dno];
	}
	}
		$fk_id = $p_kunino{$f_id};
	&K_READ("kuni_db","$fk_id","$fk_id");

if($k_kokusaku{$fk_id} eq "8"){
	&ER1("$add_name_dは国策：聖戦を発動させているため仕官できません…。他の国を選択してください。");
}


	&HOST_NAME;

	$pos = 2;

	$dir="./p_db/p";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i){
			open(page,"$dir/$file");
			@page = <page>;
			close(page);
			push(@EN_DB,"$page[0]\n");
		}
	}
	closedir(DFR);

	$dir="./p_db/touketu";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i){
			open(page,"$dir/$file");
			@page = <page>;
			close(page);
			push(@EN_DB,"$page[0]\n");
		}
	}
	closedir(DFR);

$in{'chara_name'}="$in{'chara_name'} ";
		$wchara_name = "$in{'chara_name'}";
$wchara_name =~  s/ //g;
$wchara_name =~  s/　//g;

	if(-e "./p_db/id/$in{'id'}.cgi") {&E_ERR("そのIDは登録済みです。違うIDを入力してください。");}

	if(-e "./p_db/bl/$in{'id'}.cgi") {&E_ERR("そのIDは登録済みです。違うIDを入力してください。");}
	if(-e "./p_db/touketu/$in{'id'}.cgi") {&E_ERR("そのIDは登録済みです。違うIDを入力してください。");}
	if(-e "./p_db/p/$in{'id'}.cgi") {&E_ERR("そのIDは登録済みです。違うIDを入力してください。");}

		foreach(@EN_DB){
			($rkid,$rkpass,$rkname) = split(/,/);

		$wrkname = "$rkname";
$wrkname =~  s/ //g;
$wrkname =~  s/　//g;
			if($wrkname eq "$wchara_name"){
				&E_ERR("その名前は既に登録されています。違う名前で登録してください。");
			}
		}

	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);
	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$old_date = "<a href=\"./mapr/$yymaprid\">$old_date</a>";


&F_LOCK;

	&SET_COOKIE;

$p_jikan{$f_id} = $m_tt - $kousin_kankaku - int(rand($kousin_kankaku-1)+1);
							unlink("./p_db/my_log/$f_id.cgi");
							unlink("./p_db/cd/$f_id.cgi");
							unlink("./p_db/co/$f_id.cgi");
							unlink("./pr/b/$f_id.cgi");
							unlink("./pr/blog/$f_id.cgi");

	if($in{'toi2'} > 99){
$p_jiseisin{$f_id} -= 5;
$p_exbrave{$f_id} += 5;
$p_sex{$f_id} = 1;
	}elsif($in{'toi2'} < 100){
$p_exluck{$f_id} += 10;
$p_yousi{$f_id} += 5;
$p_nintai{$f_id} -= 5;
$p_excalm{$f_id} -= 5;
$p_exbrave{$f_id} -= 5;
$p_busyou_dex{$f_id} += 3;
$p_busyou_str{$f_id} -= 3;
$p_sex{$f_id} = 0;
	}

	$in{'toi2'} = $in{'toi2'} % 100;

	if($in{'toi2'} eq "1"){
$p_gogyou_ka{$f_id} += 40;
$p_gogyou_do{$f_id} += 20;
$p_gogyou_sui{$f_id} -= 60;
$p_exgiri{$f_id} += 15;
$p_exyabou{$f_id} -= 15;
$p_yousi{$f_id} -= 3;
$p_kotobadakumi{$f_id} -= 7;
$p_seisin{$f_id} += 2;
$p_syuutyuu{$f_id} += 2;
$p_nintai{$f_id} += 3;
$p_jiseisin{$f_id} += 3;
$p_busyou_str{$f_id} += 3;
$p_busyou_dex{$f_id} -= 2;
$p_busyou_agr{$f_id} -= 1;
	}elsif($in{'toi2'} eq "2"){
$p_exgiri{$f_id} -= 5;
$p_exyabou{$f_id} += 5;
$p_kotobadakumi{$f_id} -= 6;
$p_seisin{$f_id} += 3;
$p_nintai{$f_id} += 3;
$p_excalm{$f_id} -= 5;
$p_jiseisin{$f_id} -= 3;
$p_exbrave{$f_id} += 3;
$p_busyou_str{$f_id} += 3;
$p_busyou_dex{$f_id} -= 4;
$p_busyou_agr{$f_id} += 1;
$p_ex_karumalc{$f_id} += 100;
	}elsif($in{'toi2'} eq "3"){
$p_exgiri{$f_id} -= 5;
$p_exyabou{$f_id} += 5;
$p_kotobadakumi{$f_id} += 6;
$p_syuutyuu{$f_id} += 3;
$p_seisin{$f_id} += 3;
$p_excalm{$f_id} += 3;
$p_jiseisin{$f_id} -= 25;
$p_sinkousin{$f_id} -= 15;
$p_exbrave{$f_id} += 15;
$p_busyou_str{$f_id} -= 2;
$p_busyou_dex{$f_id} += 2;
$p_busyou_agr{$f_id} += 5;
$p_ex_karumalc{$f_id} -= 100;
	}elsif($in{'toi2'} eq "4"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_kotobadakumi{$f_id} -= 10;
$p_syuutyuu{$f_id} += 6;
$p_seisin{$f_id} += 2;
$p_nintai{$f_id} += 2;
$p_excalm{$f_id} -= 10;
$p_jiseisin{$f_id} -= 5;
$p_sinkousin{$f_id} -= 5;
$p_exbrave{$f_id} += 10;
$p_busyou_str{$f_id} += 1;
$p_busyou_dex{$f_id} += 2;
$p_busyou_agr{$f_id} += 2;
	}elsif($in{'toi2'} eq "5"){
$p_gogyou_do{$f_id} += 40;
$p_gogyou_kin{$f_id} += 20;
$p_gogyou_moku{$f_id} -= 60;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 5;
$p_karisuma{$f_id} += 10;
$p_kotobadakumi{$f_id} += 10;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 5;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} += 5;
$p_jiseisin{$f_id} -= 10;
$p_sinkousin{$f_id} -= 0;
$p_exbrave{$f_id} -= 20;
$p_busyou_str{$f_id} -= 1;
$p_busyou_dex{$f_id} += 2;
$p_busyou_agr{$f_id} -= 1;
	}elsif($in{'toi2'} eq "6"){
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} -= 10;
$p_yousi{$f_id} += 5;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 25;
$p_syuutyuu{$f_id} += 5;
$p_seisin{$f_id} += 10;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} += 5;
$p_exluck{$f_id} += 5;
$p_jiseisin{$f_id} += 5;
$p_sinkousin{$f_id} += 15;
$p_exbrave{$f_id} -= 15;
$p_busyou_str{$f_id} -= 4;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} -= 1;
	}elsif($in{'toi2'} eq "7"){
$p_gogyou_moku{$f_id} += 40;
$p_gogyou_ka{$f_id} += 20;
$p_gogyou_kin{$f_id} -= 60;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} -= 0;
$p_yousi{$f_id} -= 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 10;
$p_syuutyuu{$f_id} += 5;
$p_seisin{$f_id} -= 0;
$p_nintai{$f_id} += 5;
$p_excalm{$f_id} += 5;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += 0;
$p_sinkousin{$f_id} -= 5;
$p_exbrave{$f_id} -= 0;
$p_busyou_str{$f_id} -= 1;
$p_busyou_dex{$f_id} += 3;
$p_busyou_agr{$f_id} -= 2;
	}elsif($in{'toi2'} eq "8"){
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} -= 0;
$p_yousi{$f_id} -= 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} += 10;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} -= 5;
$p_nintai{$f_id} -= 5;
$p_excalm{$f_id} += 5;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} -= 5;
$p_busyou_str{$f_id} -= 1;
$p_busyou_dex{$f_id} += 2;
$p_busyou_agr{$f_id} -= 1;
	}elsif($in{'toi2'} eq "9"){
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} -= 0;
$p_yousi{$f_id} += 15;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} += 10;
$p_syuutyuu{$f_id} -= 5;
$p_seisin{$f_id} += 5;
$p_nintai{$f_id} -= 5;
$p_excalm{$f_id} -= 5;
$p_exluck{$f_id} += 5;
$p_jiseisin{$f_id} -= 10;
$p_sinkousin{$f_id} -= 5;
$p_exbrave{$f_id} -= 5;
$p_busyou_str{$f_id} -= 1;
$p_busyou_dex{$f_id} += 2;
$p_busyou_agr{$f_id} -= 1;
	}elsif($in{'toi2'} eq "10"){
$p_gogyou_sui{$f_id} += 40;
$p_gogyou_moku{$f_id} += 20;
$p_gogyou_do{$f_id} -= 60;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} -= 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 10;
$p_syuutyuu{$f_id} += 5;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += 10;
$p_excalm{$f_id} -= 10;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} -= 5;
$p_sinkousin{$f_id} -= 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 3;
$p_busyou_dex{$f_id} += 1;
$p_busyou_agr{$f_id} += 1;
	}elsif($in{'toi2'} eq "11"){
$p_exgiri{$f_id} += 20;
$p_exyabou{$f_id} -= 20;
$p_yousi{$f_id} += 5;
$p_karisuma{$f_id} -= 10;
$p_kotobadakumi{$f_id} -= 20;
$p_syuutyuu{$f_id} += 5;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += 10;
$p_excalm{$f_id} += 5;
$p_exluck{$f_id} -= 10;
$p_jiseisin{$f_id} += 5;
$p_sinkousin{$f_id} -= 5;
$p_exbrave{$f_id} += 5;
$p_busyou_str{$f_id} -= 5;
$p_busyou_dex{$f_id} += 3;
$p_busyou_agr{$f_id} += 7;
	}elsif($in{'toi2'} eq "12"){
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} -= 0;
$p_yousi{$f_id} += 15;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 5;
$p_seisin{$f_id} += 5;
$p_nintai{$f_id} -= 10;
$p_excalm{$f_id} -= 10;
$p_exluck{$f_id} += 15;
$p_jiseisin{$f_id} -= 15;
$p_sinkousin{$f_id} += 5;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} -= 15;
$p_busyou_dex{$f_id} += 3;
$p_busyou_agr{$f_id} += 7;
	}elsif($in{'toi2'} eq "13"){
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} -= 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 5;
$p_seisin{$f_id} += 5;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} -= 5;
$p_exluck{$f_id} -= 10;
$p_jiseisin{$f_id} += 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 5;
$p_busyou_str{$f_id} -= 5;
$p_busyou_dex{$f_id} += 3;
$p_busyou_agr{$f_id} += 2;
	}elsif($in{'toi2'} eq "14"){
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} -= 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 10;
$p_kotobadakumi{$f_id} -= 15;
$p_syuutyuu{$f_id} += 5;
$p_seisin{$f_id} += 5;
$p_nintai{$f_id} += 5;
$p_excalm{$f_id} -= 5;
$p_exluck{$f_id} -= 0;
$p_jiseisin{$f_id} -= 10;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 5;
$p_busyou_str{$f_id} += 4;
$p_busyou_dex{$f_id} += 3;
$p_busyou_agr{$f_id} += 3;
	}elsif($in{'toi2'} eq "15"){
$p_exgiri{$f_id} -= 10;
$p_exyabou{$f_id} += 10;
$p_yousi{$f_id} += 10;
$p_karisuma{$f_id} += 10;
$p_kotobadakumi{$f_id} += 5;
$p_syuutyuu{$f_id} -= 5;
$p_seisin{$f_id} += 5;
$p_nintai{$f_id} -= 10;
$p_excalm{$f_id} -= 5;
$p_exluck{$f_id} += 10;
$p_jiseisin{$f_id} -= 10;
$p_sinkousin{$f_id} += 5;
$p_exbrave{$f_id} += 5;
$p_busyou_str{$f_id} -= 2;
$p_busyou_dex{$f_id} -= 5;
$p_busyou_agr{$f_id} -= 3;
	}elsif($in{'toi2'} eq "16"){
$p_gogyou_kin{$f_id} += 40;
$p_gogyou_sui{$f_id} += 20;
$p_gogyou_ka{$f_id} -= 60;
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 0;
$p_kotobadakumi{$f_id} += 10;
$p_syuutyuu{$f_id} -= 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} -= 5;
$p_exluck{$f_id} -= 10;
$p_jiseisin{$f_id} -= 5;
$p_sinkousin{$f_id} -= 5;
$p_exbrave{$f_id} += 5;
$p_busyou_str{$f_id} += 5;
$p_busyou_dex{$f_id} += 3;
$p_busyou_agr{$f_id} -= 3;
	}elsif($in{'toi2'} eq "17"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 0;
$p_kotobadakumi{$f_id} += 15;
$p_syuutyuu{$f_id} += 5;
$p_seisin{$f_id} -= 3;
$p_nintai{$f_id} -= 2;
$p_excalm{$f_id} -= 0;
$p_exluck{$f_id} -= 0;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} -= 0;
$p_exbrave{$f_id} -= 5;
$p_busyou_str{$f_id} -= 7;
$p_busyou_dex{$f_id} += 7;
$p_busyou_agr{$f_id} -= 5;
	}elsif($in{'toi2'} eq "18"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} -= 0;
$p_karisuma{$f_id} += 5;
$p_kotobadakumi{$f_id} += 5;
$p_syuutyuu{$f_id} += 10;
$p_seisin{$f_id} += 5;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} += 15;
$p_exluck{$f_id} -= 10;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} -= 25;
$p_exbrave{$f_id} -= 5;
$p_busyou_str{$f_id} -= 2;
$p_busyou_dex{$f_id} += 7;
$p_busyou_agr{$f_id} -= 5;
	}elsif($in{'toi2'} eq "31"){
$p_gogyou_ka{$f_id} += 20;
$p_gogyou_sui{$f_id} += 20;
$p_gogyou_moku{$f_id} += 20;
$p_gogyou_kin{$f_id} += 20;
$p_gogyou_do{$f_id} += 20;
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 5;
$p_karisuma{$f_id} -= 10;
$p_kotobadakumi{$f_id} -= 25;
$p_syuutyuu{$f_id} += 5;
$p_seisin{$f_id} += 5;
$p_nintai{$f_id} += 5;
$p_excalm{$f_id} += 5;
$p_exluck{$f_id} += 5;
$p_jiseisin{$f_id} += 10;
$p_sinkousin{$f_id} += 10;
$p_exbrave{$f_id} -= 5;
$p_busyou_str{$f_id} -= 7;
$p_busyou_dex{$f_id} -= 7;
$p_busyou_agr{$f_id} += 4;
	}elsif($in{'toi2'} eq "32"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} -= 10;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 25;
$p_syuutyuu{$f_id} += 5;
$p_seisin{$f_id} += 5;
$p_nintai{$f_id} += 15;
$p_excalm{$f_id} += 5;
$p_exluck{$f_id} -= 10;
$p_jiseisin{$f_id} += 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 5;
$p_busyou_str{$f_id} += 1;
$p_busyou_dex{$f_id} += 1;
$p_busyou_agr{$f_id} += 3;
	}elsif($in{'toi2'} eq "33"){
$p_exgiri{$f_id} -= 10;
$p_exyabou{$f_id} += 10;
$p_yousi{$f_id} += 25;
$p_karisuma{$f_id} += 10;
$p_kotobadakumi{$f_id} -= 25;
$p_syuutyuu{$f_id} += 10;
$p_seisin{$f_id} += 10;
$p_nintai{$f_id} -= 10;
$p_excalm{$f_id} += 10;
$p_exluck{$f_id} -= 25;
$p_jiseisin{$f_id} -= 25;
$p_sinkousin{$f_id} -= 5;
$p_exbrave{$f_id} += 5;
$p_busyou_str{$f_id} += 7;
$p_busyou_dex{$f_id} -= 4;
$p_busyou_agr{$f_id} += 7;
$p_ex_karumald{$f_id} -= 100;
	}elsif($in{'toi2'} eq "34"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 10;
$p_karisuma{$f_id} -= 5;
$p_kotobadakumi{$f_id} -= 5;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 5;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} += 5;
$p_jiseisin{$f_id} -= 5;
$p_sinkousin{$f_id} += 5;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 1;
$p_busyou_dex{$f_id} -= 3;
$p_busyou_agr{$f_id} += 2;
	}

	if($in{'toi3'} eq "1"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 2;
$p_excalm{$f_id} += 3;
$p_exluck{$f_id} += 2;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} -= 5;
$p_busyou_str{$f_id} -= 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 1;
	}elsif($in{'toi3'} eq "2"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} -= 2;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} += 3;
$p_exluck{$f_id} -= 1;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} += 7;
$p_exbrave{$f_id} -= 7;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($in{'toi3'} eq "3"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} += 1;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 2;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} -= 3;
$p_exluck{$f_id} -= 2;
$p_jiseisin{$f_id} -= 5;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 5;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} += 1;
$p_busyou_agr{$f_id} += 0;
	}elsif($in{'toi3'} eq "4"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 2;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 1;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 3;
$p_excalm{$f_id} -= 2;
$p_exluck{$f_id} -= 1;
$p_jiseisin{$f_id} -= 2;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 5;
$p_busyou_str{$f_id} += 1;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($in{'toi3'} eq "5"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 5;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 1;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} -= 5;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} -= 5;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 2;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} += 1;
$p_busyou_agr{$f_id} += 0;
	}elsif($in{'toi3'} eq "6"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 3;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 1;
$p_syuutyuu{$f_id} += 1;
$p_seisin{$f_id} += 5;
$p_nintai{$f_id} -= 2;
$p_excalm{$f_id} -= 3;
$p_exluck{$f_id} -= 1;
$p_jiseisin{$f_id} -= 2;
$p_sinkousin{$f_id} -= 7;
$p_exbrave{$f_id} += 7;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($in{'toi3'} eq "7"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($in{'toi3'} eq "8"){
	}

	if($in{'toi4'} eq "1"){
$p_ex_karumald{$f_id} -= 50;
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 3;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 2;
$p_excalm{$f_id} -= 2;
$p_exluck{$f_id} -= 0;
$p_jiseisin{$f_id} -= 2;
$p_sinkousin{$f_id} -= 2;
$p_exbrave{$f_id} += 7;
$p_busyou_str{$f_id} += 2;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($in{'toi4'} eq "2"){
$p_ex_karumald{$f_id} += 50;
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} += 2;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 1;
$p_nintai{$f_id} += 2;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} -= 5;
$p_jiseisin{$f_id} += 2;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} -= 1;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($in{'toi4'} eq "3"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} += 3;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 2;
$p_nintai{$f_id} -= 1;
$p_excalm{$f_id} -= 2;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} -= 3;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($in{'toi4'} eq "4"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 3;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 2;
$p_nintai{$f_id} += 1;
$p_excalm{$f_id} += 3;
$p_exluck{$f_id} -= 3;
$p_jiseisin{$f_id} += 1;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} -= 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($in{'toi4'} eq "5"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 1;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} -= 1;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} -= 2;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} -= 1;
$p_sinkousin{$f_id} += 7;
$p_exbrave{$f_id} -= 2;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($in{'toi4'} eq "6"){
	}elsif($in{'toi4'} eq "7"){
	}elsif($in{'toi4'} eq "8"){
	}

	if($in{'toi5'} eq "1"){
$p_ex_karumald{$f_id} += 100;
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 0;
$p_kotobadakumi{$f_id} += 1;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} += 3;
$p_exluck{$f_id} -= 3;
$p_jiseisin{$f_id} += 1;
$p_sinkousin{$f_id} -= 2;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($in{'toi5'} eq "2"){
$p_ex_karumalc{$f_id} -= 100;
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 2;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} += 1;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} -= 5;
$p_sinkousin{$f_id} -= 3;
$p_exbrave{$f_id} += 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} += 1;
$p_busyou_agr{$f_id} += 1;
	}elsif($in{'toi5'} eq "3"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} += 3;
$p_exluck{$f_id} -= 1;
$p_jiseisin{$f_id} -= 1;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} -= 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($in{'toi5'} eq "4"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 5;
$p_nintai{$f_id} -= 1;
$p_excalm{$f_id} -= 2;
$p_exluck{$f_id} -= 3;
$p_jiseisin{$f_id} -= 2;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 3;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($in{'toi5'} eq "5"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} -= 1;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} -= 3;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} -= 2;
$p_sinkousin{$f_id} += 7;
$p_exbrave{$f_id} -= 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($in{'toi5'} eq "6"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} -= 0;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} += 3;
$p_exluck{$f_id} += 2;
$p_jiseisin{$f_id} += 2;
$p_sinkousin{$f_id} -= 5;
$p_exbrave{$f_id} -= 2;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($in{'toi5'} eq "7"){
	}elsif($in{'toi5'} eq "8"){
	}


	if($in{'toi6'} eq "1"){
$p_ex_karumalc{$f_id} += 100;
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 2;
$p_nintai{$f_id} += 1;
$p_excalm{$f_id} -= 3;
$p_exluck{$f_id} -= 10;
$p_jiseisin{$f_id} += 1;
$p_sinkousin{$f_id} += 7;
$p_exbrave{$f_id} += 2;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($in{'toi6'} eq "2"){
$p_ex_karumald{$f_id} += 100;
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 2;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} -= 1;
$p_exluck{$f_id} -= 5;
$p_jiseisin{$f_id} += 3;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($in{'toi6'} eq "3"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} += 3;
$p_exluck{$f_id} += 5;
$p_jiseisin{$f_id} -= 2;
$p_sinkousin{$f_id} -= 5;
$p_exbrave{$f_id} -= 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($in{'toi6'} eq "4"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 1;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} -= 1;
$p_nintai{$f_id} += 5;
$p_excalm{$f_id} += 3;
$p_exluck{$f_id} -= 5;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} -= 0;
$p_exbrave{$f_id} -= 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($in{'toi6'} eq "5"){
$p_ex_karumald{$f_id} += 100;
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 1;
$p_karisuma{$f_id} += 0;
$p_kotobadakumi{$f_id} += 1;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 7;
$p_nintai{$f_id} -= 3;
$p_excalm{$f_id} += 2;
$p_exluck{$f_id} += 1;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} -= 10;
$p_exbrave{$f_id} += 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;
	}elsif($in{'toi6'} eq "6"){
	}elsif($in{'toi6'} eq "7"){
	}elsif($in{'toi6'} eq "8"){
	}

	if($in{'toi7'} eq "1"){
$p_ex_karumald{$f_id} += 0;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 1;
$p_karisuma{$f_id} += 1;
$p_kotobadakumi{$f_id} += -1;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += -1;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += -1;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 1;
$p_busyou_str{$f_id} += -1;
$p_busyou_dex{$f_id} += 0;
$p_busyou_agr{$f_id} += 1;

$p_kijyou{$f_id} += 40;
$p_syageki{$f_id} += int(rand(41));
$p_bujyutu{$f_id} += int(rand(41));
$p_jyujyutu{$f_id} += int(rand(41));
$p_tyouhou{$f_id} += 25;
$p_jyuukisouda{$f_id} += -10;
$p_tyoukyou{$f_id} += 25;
$p_seiji{$f_id} += int(rand(41));
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += int(rand(41));

$p_yoti{$f_id} += 0;
$p_kikensatti{$f_id} += 0;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += 5;
$p_kougaku_tekisei{$f_id} += -15;
$p_kyouyou{$f_id} += 0;
$p_kiokuryoku{$f_id} += 0;
$p_syakousei{$f_id} += 0;
$p_ihuu{$f_id} += 5;
$p_kihaku{$f_id} += 5;
	}elsif($in{'toi7'} eq "2"){
$p_ex_karumald{$f_id} += 0;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 1;
$p_karisuma{$f_id} += 0;
$p_kotobadakumi{$f_id} += -2;
$p_syuutyuu{$f_id} += 1;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += -2;
$p_busyou_dex{$f_id} += 1;
$p_busyou_agr{$f_id} += 1;

$p_kijyou{$f_id} += 30;
$p_syageki{$f_id} += 30;
$p_bujyutu{$f_id} += int(rand(41));
$p_jyujyutu{$f_id} += int(rand(41));
$p_tyouhou{$f_id} += int(rand(41));
$p_jyuukisouda{$f_id} += -5;
$p_tyoukyou{$f_id} += 25;
$p_seiji{$f_id} += int(rand(41));
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += int(rand(41));

$p_yoti{$f_id} += 0;
$p_kikensatti{$f_id} += 0;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += 5;
$p_kougaku_tekisei{$f_id} += -15;
$p_kyouyou{$f_id} += 0;
$p_kiokuryoku{$f_id} += 0;
$p_syakousei{$f_id} += 0;
$p_ihuu{$f_id} += 5;
$p_kihaku{$f_id} += 5;
	}elsif($in{'toi7'} eq "3"){
$p_ex_karumald{$f_id} += 0;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 0;
$p_kotobadakumi{$f_id} += -1;
$p_syuutyuu{$f_id} += 1;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += -1;
$p_busyou_dex{$f_id} += 2;
$p_busyou_agr{$f_id} += -1;

$p_kijyou{$f_id} += int(rand(41));
$p_syageki{$f_id} += 40;
$p_bujyutu{$f_id} += int(rand(41));
$p_jyujyutu{$f_id} += int(rand(41));
$p_tyouhou{$f_id} += int(rand(41));
$p_jyuukisouda{$f_id} += 30;
$p_tyoukyou{$f_id} += int(rand(41));
$p_seiji{$f_id} += -10;
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += int(rand(41));

$p_yoti{$f_id} += 0;
$p_kikensatti{$f_id} += 0;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += 0;
$p_kougaku_tekisei{$f_id} += 5;
$p_kyouyou{$f_id} += 0;
$p_kiokuryoku{$f_id} += 0;
$p_syakousei{$f_id} += 0;
$p_ihuu{$f_id} += -10;
$p_kihaku{$f_id} += 5;
	}elsif($in{'toi7'} eq "4"){
$p_ex_karumald{$f_id} += 0;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 0;
$p_kotobadakumi{$f_id} += -1;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += -1;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 2;
$p_busyou_str{$f_id} += 2;
$p_busyou_dex{$f_id} += -1;
$p_busyou_agr{$f_id} += -1;

$p_kijyou{$f_id} += int(rand(41));
$p_syageki{$f_id} += 30;
$p_bujyutu{$f_id} += 40;
$p_jyujyutu{$f_id} += int(rand(41));
$p_tyouhou{$f_id} += int(rand(41));
$p_jyuukisouda{$f_id} += int(rand(41));
$p_tyoukyou{$f_id} += int(rand(41));
$p_seiji{$f_id} += -10;
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += int(rand(41));

$p_yoti{$f_id} += 0;
$p_kikensatti{$f_id} += 5;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += 0;
$p_kougaku_tekisei{$f_id} += -15;
$p_kyouyou{$f_id} += 0;
$p_kiokuryoku{$f_id} += 0;
$p_syakousei{$f_id} += 0;
$p_ihuu{$f_id} += 5;
$p_kihaku{$f_id} += 5;
	}elsif($in{'toi7'} eq "5"){
$p_ex_karumald{$f_id} += -50;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 0;
$p_kotobadakumi{$f_id} += 0;
$p_syuutyuu{$f_id} += 5;
$p_seisin{$f_id} += 2;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += -1;
$p_sinkousin{$f_id} += 3;
$p_exbrave{$f_id} += -5;
$p_busyou_str{$f_id} += -1;
$p_busyou_dex{$f_id} += 0;
$p_busyou_agr{$f_id} += -1;

$p_kijyou{$f_id} += int(rand(31));
$p_syageki{$f_id} += int(rand(41));
$p_bujyutu{$f_id} += int(rand(31));
$p_jyujyutu{$f_id} += 40;
$p_tyouhou{$f_id} += 25;
$p_jyuukisouda{$f_id} += int(rand(41));
$p_tyoukyou{$f_id} += 25;
$p_seiji{$f_id} += int(rand(41));
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += 0;

$p_yoti{$f_id} += 5;
$p_kikensatti{$f_id} += 0;
$p_dokusousei{$f_id} += 5;
$p_doubutu_tekisei{$f_id} += 5;
$p_kougaku_tekisei{$f_id} += 0;
$p_kyouyou{$f_id} += 0;
$p_kiokuryoku{$f_id} += 5;
$p_syakousei{$f_id} += -15;
$p_ihuu{$f_id} += -5;
$p_kihaku{$f_id} += 0;
	}elsif($in{'toi7'} eq "6"){
$p_ex_karumald{$f_id} += 0;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += -1;
$p_karisuma{$f_id} += 0;
$p_kotobadakumi{$f_id} += 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 1;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} += 1;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += 0;
$p_sinkousin{$f_id} += 1;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += -1;
$p_busyou_dex{$f_id} += 0;
$p_busyou_agr{$f_id} += 0;

$p_kijyou{$f_id} += int(rand(21));
$p_syageki{$f_id} += int(rand(21));
$p_bujyutu{$f_id} += int(rand(21));
$p_jyujyutu{$f_id} += 30;
$p_tyouhou{$f_id} += int(rand(41));
$p_jyuukisouda{$f_id} += 30;
$p_tyoukyou{$f_id} += int(rand(41));
$p_seiji{$f_id} += 30;
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += int(rand(41));

$p_yoti{$f_id} += 0;
$p_kikensatti{$f_id} += 0;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += 0;
$p_kougaku_tekisei{$f_id} += 5;
$p_kyouyou{$f_id} += 10;
$p_kiokuryoku{$f_id} += 10;
$p_syakousei{$f_id} += -10;
$p_ihuu{$f_id} += -10;
$p_kihaku{$f_id} += -5;
	}elsif($in{'toi7'} eq "7"){
$p_ex_karumald{$f_id} += 50;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += -10;
$p_karisuma{$f_id} += 0;
$p_kotobadakumi{$f_id} += 0;
$p_syuutyuu{$f_id} += 3;
$p_seisin{$f_id} += 2;
$p_nintai{$f_id} += 2;
$p_excalm{$f_id} += 2;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += 3;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += -2;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} += 0;
$p_busyou_agr{$f_id} += 0;

$p_kijyou{$f_id} += -10;
$p_syageki{$f_id} += int(rand(21));
$p_bujyutu{$f_id} += 30;
$p_jyujyutu{$f_id} += 35;
$p_tyouhou{$f_id} += int(rand(41));
$p_jyuukisouda{$f_id} += int(rand(41));
$p_tyoukyou{$f_id} += int(rand(41));
$p_seiji{$f_id} += int(rand(41));
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += 35;

$p_yoti{$f_id} += 5;
$p_kikensatti{$f_id} += 5;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += 5;
$p_kougaku_tekisei{$f_id} += 0;
$p_kyouyou{$f_id} += 0;
$p_kiokuryoku{$f_id} += 5;
$p_syakousei{$f_id} += -20;
$p_ihuu{$f_id} += 0;
$p_kihaku{$f_id} += 0;
	}elsif($in{'toi7'} eq "8"){
$p_ex_karumald{$f_id} += 0;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += -3;
$p_karisuma{$f_id} += 0;
$p_kotobadakumi{$f_id} += 2;
$p_syuutyuu{$f_id} += 2;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} += 2;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += 0;
$p_sinkousin{$f_id} += 2;
$p_exbrave{$f_id} += -3;
$p_busyou_str{$f_id} += -1;
$p_busyou_dex{$f_id} += 0;
$p_busyou_agr{$f_id} += 0;

$p_kijyou{$f_id} += 0;
$p_syageki{$f_id} += int(rand(21));
$p_bujyutu{$f_id} += int(rand(21));
$p_jyujyutu{$f_id} += 30;
$p_tyouhou{$f_id} += 30;
$p_jyuukisouda{$f_id} += 30;
$p_tyoukyou{$f_id} += int(rand(41));
$p_seiji{$f_id} += 30;
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += int(rand(41));

$p_yoti{$f_id} += 0;
$p_kikensatti{$f_id} += 0;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += 0;
$p_kougaku_tekisei{$f_id} += 5;
$p_kyouyou{$f_id} += 10;
$p_kiokuryoku{$f_id} += 10;
$p_syakousei{$f_id} += 0;
$p_ihuu{$f_id} += -5;
$p_kihaku{$f_id} += -20;
	}elsif($in{'toi7'} eq "9"){
$p_ex_karumald{$f_id} += 0;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += -2;
$p_karisuma{$f_id} += 0;
$p_kotobadakumi{$f_id} += 0;
$p_syuutyuu{$f_id} += 1;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} += 1;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} += 2;
$p_busyou_agr{$f_id} += -2;

$p_kijyou{$f_id} += 0;
$p_syageki{$f_id} += int(rand(41));
$p_bujyutu{$f_id} += int(rand(21));
$p_jyujyutu{$f_id} += int(rand(41));
$p_tyouhou{$f_id} += 40;
$p_jyuukisouda{$f_id} += 40;
$p_tyoukyou{$f_id} += int(rand(21));
$p_seiji{$f_id} += int(rand(41));
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += int(rand(41));

$p_yoti{$f_id} += 0;
$p_kikensatti{$f_id} += 0;
$p_dokusousei{$f_id} += 15;
$p_doubutu_tekisei{$f_id} += -10;
$p_kougaku_tekisei{$f_id} += 15;
$p_kyouyou{$f_id} += 5;
$p_kiokuryoku{$f_id} += 5;
$p_syakousei{$f_id} += -10;
$p_ihuu{$f_id} += -10;
$p_kihaku{$f_id} += -10;
	}elsif($in{'toi7'} eq "10"){
$p_ex_karumald{$f_id} += 100;
$p_exgiri{$f_id} += 5;
$p_exyabou{$f_id} += -5;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 2;
$p_kotobadakumi{$f_id} += 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += 1;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} += -3;
$p_jiseisin{$f_id} += 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} += 0;
$p_busyou_agr{$f_id} += 0;

$p_kijyou{$f_id} += int(rand(41));
$p_syageki{$f_id} += int(rand(41));
$p_bujyutu{$f_id} += int(rand(41));
$p_jyujyutu{$f_id} += int(rand(41));
$p_tyouhou{$f_id} += -10;
$p_jyuukisouda{$f_id} += int(rand(41));
$p_tyoukyou{$f_id} += int(rand(41));
$p_seiji{$f_id} += int(rand(41));
$p_sinyou{$f_id} += 30;
$p_jinbou{$f_id} += 40;

$p_yoti{$f_id} += 0;
$p_kikensatti{$f_id} += -5;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += -5;
$p_kougaku_tekisei{$f_id} += 0;
$p_kyouyou{$f_id} += 0;
$p_kiokuryoku{$f_id} += 0;
$p_syakousei{$f_id} += 15;
$p_ihuu{$f_id} += 0;
$p_kihaku{$f_id} += -5;
	}elsif($in{'toi7'} eq "11"){
$p_ex_karumald{$f_id} += 0;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 0;
$p_kotobadakumi{$f_id} += 5;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 3;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} += -5;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += -5;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 2;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} += 0;
$p_busyou_agr{$f_id} += 0;

$p_kijyou{$f_id} += int(rand(41));
$p_syageki{$f_id} += int(rand(41));
$p_bujyutu{$f_id} += int(rand(41));
$p_jyujyutu{$f_id} += int(rand(41));
$p_tyouhou{$f_id} += 30;
$p_jyuukisouda{$f_id} += int(rand(41));
$p_tyoukyou{$f_id} += int(rand(41));
$p_seiji{$f_id} += 30;
$p_sinyou{$f_id} += int(rand(21));
$p_jinbou{$f_id} += int(rand(21));

$p_yoti{$f_id} += 5;
$p_kikensatti{$f_id} += -5;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += -5;
$p_kougaku_tekisei{$f_id} += 0;
$p_kyouyou{$f_id} += 5;
$p_kiokuryoku{$f_id} += 5;
$p_syakousei{$f_id} += -5;
$p_ihuu{$f_id} += 0;
$p_kihaku{$f_id} += 0;
	}elsif($in{'toi7'} eq "12"){
$p_ex_karumald{$f_id} += 0;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 1;
$p_kotobadakumi{$f_id} += 5;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 1;
$p_nintai{$f_id} += -2;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += -3;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} += 0;
$p_busyou_agr{$f_id} += -1;

$p_kijyou{$f_id} += int(rand(21));
$p_syageki{$f_id} += int(rand(21));
$p_bujyutu{$f_id} += int(rand(21));
$p_jyujyutu{$f_id} += int(rand(41));
$p_tyouhou{$f_id} += 30;
$p_jyuukisouda{$f_id} += int(rand(41));
$p_tyoukyou{$f_id} += int(rand(41));
$p_seiji{$f_id} += 40;
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += int(rand(41));

$p_yoti{$f_id} += 0;
$p_kikensatti{$f_id} += -5;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += -15;
$p_kougaku_tekisei{$f_id} += 0;
$p_kyouyou{$f_id} += 5;
$p_kiokuryoku{$f_id} += 0;
$p_syakousei{$f_id} += 15;
$p_ihuu{$f_id} += 0;
$p_kihaku{$f_id} += 0;
	}elsif($in{'toi7'} eq "13"){
$p_ex_karumald{$f_id} += 0;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 1;
$p_kotobadakumi{$f_id} += -1;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} += 0;
$p_busyou_agr{$f_id} += 0;

$p_kijyou{$f_id} += int(rand(41));
$p_syageki{$f_id} += int(rand(41));
$p_bujyutu{$f_id} += int(rand(41));
$p_jyujyutu{$f_id} += int(rand(41));
$p_tyouhou{$f_id} += int(rand(41));
$p_jyuukisouda{$f_id} += 0;
$p_tyoukyou{$f_id} += 40;
$p_seiji{$f_id} += int(rand(41));
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += int(rand(41));

$p_yoti{$f_id} += 0;
$p_kikensatti{$f_id} += 5;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += 15;
$p_kougaku_tekisei{$f_id} += -15;
$p_kyouyou{$f_id} += 0;
$p_kiokuryoku{$f_id} += 0;
$p_syakousei{$f_id} += -5;
$p_ihuu{$f_id} += 0;
$p_kihaku{$f_id} += 0;
	}elsif($in{'toi7'} eq "14"){
$p_ex_karumald{$f_id} += 0;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 2;
$p_karisuma{$f_id} += 0;
$p_kotobadakumi{$f_id} += 2;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += -2;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += -2;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} += 0;
$p_busyou_agr{$f_id} += 0;

$p_kijyou{$f_id} += int(rand(41));
$p_syageki{$f_id} += int(rand(41));
$p_bujyutu{$f_id} += int(rand(41));
$p_jyujyutu{$f_id} += 0;
$p_tyouhou{$f_id} += int(rand(41));
$p_jyuukisouda{$f_id} += int(rand(41));
$p_tyoukyou{$f_id} += int(rand(41));
$p_seiji{$f_id} += int(rand(41));
$p_sinyou{$f_id} += 40;
$p_jinbou{$f_id} += int(rand(41));

$p_yoti{$f_id} += -5;
$p_kikensatti{$f_id} += 0;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += 0;
$p_kougaku_tekisei{$f_id} += 0;
$p_kyouyou{$f_id} += 5;
$p_kiokuryoku{$f_id} += 0;
$p_syakousei{$f_id} += 15;
$p_ihuu{$f_id} += -5;
$p_kihaku{$f_id} += -10;
	}elsif($in{'toi7'} eq "15"){
$p_ex_karumald{$f_id} += 0;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 1;
$p_karisuma{$f_id} += 0;
$p_kotobadakumi{$f_id} += -1;
$p_syuutyuu{$f_id} += 2;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} += 1;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += -3;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} += 1;
$p_busyou_agr{$f_id} += -1;

$p_kijyou{$f_id} += int(rand(21));
$p_syageki{$f_id} += int(rand(21));
$p_bujyutu{$f_id} += int(rand(41));
$p_jyujyutu{$f_id} += 30;
$p_tyouhou{$f_id} += int(rand(41));
$p_jyuukisouda{$f_id} += 30;
$p_tyoukyou{$f_id} += int(rand(41));
$p_seiji{$f_id} += int(rand(41));
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += int(rand(41));

$p_yoti{$f_id} += 0;
$p_kikensatti{$f_id} += 0;
$p_dokusousei{$f_id} += 5;
$p_doubutu_tekisei{$f_id} += 0;
$p_kougaku_tekisei{$f_id} += 5;
$p_kyouyou{$f_id} += 5;
$p_kiokuryoku{$f_id} += 0;
$p_syakousei{$f_id} += 5;
$p_ihuu{$f_id} += 5;
$p_kihaku{$f_id} += -15;
	}elsif($in{'toi7'} eq "16"){
$p_ex_karumald{$f_id} += 0;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 5;
$p_karisuma{$f_id} += 1;
$p_kotobadakumi{$f_id} += -3;
$p_syuutyuu{$f_id} += 3;
$p_seisin{$f_id} += 1;
$p_nintai{$f_id} += 1;
$p_excalm{$f_id} += -3;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += -5;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += -2;
$p_busyou_dex{$f_id} += 1;
$p_busyou_agr{$f_id} += 1;

$p_kijyou{$f_id} += int(rand(41));
$p_syageki{$f_id} += 0;
$p_bujyutu{$f_id} += int(rand(41));
$p_jyujyutu{$f_id} += 40;
$p_tyouhou{$f_id} += int(rand(41));
$p_jyuukisouda{$f_id} += int(rand(21));
$p_tyoukyou{$f_id} += 30;
$p_seiji{$f_id} += int(rand(41));
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += int(rand(41));

$p_yoti{$f_id} += 5;
$p_kikensatti{$f_id} += 5;
$p_dokusousei{$f_id} += 5;
$p_doubutu_tekisei{$f_id} += 5;
$p_kougaku_tekisei{$f_id} += -20;
$p_kyouyou{$f_id} += 0;
$p_kiokuryoku{$f_id} += 0;
$p_syakousei{$f_id} += 15;
$p_ihuu{$f_id} += -10;
$p_kihaku{$f_id} += -5;
	}elsif($in{'toi7'} eq "17"){
$p_ex_karumald{$f_id} += 0;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 1;
$p_kotobadakumi{$f_id} += -5;
$p_syuutyuu{$f_id} += 1;
$p_seisin{$f_id} += 1;
$p_nintai{$f_id} += 1;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} += 0;
$p_busyou_agr{$f_id} += 0;

$p_kijyou{$f_id} += 30;
$p_syageki{$f_id} += int(rand(21));
$p_bujyutu{$f_id} += int(rand(41));
$p_jyujyutu{$f_id} += 30;
$p_tyouhou{$f_id} += int(rand(41));
$p_jyuukisouda{$f_id} += 0;
$p_tyoukyou{$f_id} += 40;
$p_seiji{$f_id} += 0;
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += 30;

$p_yoti{$f_id} += 5;
$p_kikensatti{$f_id} += 15;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += 15;
$p_kougaku_tekisei{$f_id} += -20;
$p_kyouyou{$f_id} += -10;
$p_kiokuryoku{$f_id} += 0;
$p_syakousei{$f_id} += -5;
$p_ihuu{$f_id} += 0;
$p_kihaku{$f_id} += 0;
	}elsif($in{'toi7'} eq "18"){
$p_ex_karumald{$f_id} += 0;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 1;
$p_karisuma{$f_id} += 1;
$p_kotobadakumi{$f_id} += -5;
$p_syuutyuu{$f_id} += 2;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 1;
$p_busyou_str{$f_id} += -2;
$p_busyou_dex{$f_id} += 1;
$p_busyou_agr{$f_id} += 1;

$p_kijyou{$f_id} += 30;
$p_syageki{$f_id} += int(rand(41));
$p_bujyutu{$f_id} += int(rand(41));
$p_jyujyutu{$f_id} += int(rand(41));
$p_tyouhou{$f_id} += 30;
$p_jyuukisouda{$f_id} += int(rand(21));
$p_tyoukyou{$f_id} += 30;
$p_seiji{$f_id} += 0;
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += int(rand(41));

$p_yoti{$f_id} += 0;
$p_kikensatti{$f_id} += 15;
$p_dokusousei{$f_id} += 5;
$p_doubutu_tekisei{$f_id} += 5;
$p_kougaku_tekisei{$f_id} += 0;
$p_kyouyou{$f_id} += -5;
$p_kiokuryoku{$f_id} += 0;
$p_syakousei{$f_id} += -15;
$p_ihuu{$f_id} += -5;
$p_kihaku{$f_id} += 0;
	}elsif($in{'toi7'} eq "19"){
$p_ex_karumald{$f_id} += 0;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 3;
$p_karisuma{$f_id} += 1;
$p_kotobadakumi{$f_id} += 1;
$p_syuutyuu{$f_id} += 3;
$p_seisin{$f_id} += 1;
$p_nintai{$f_id} += 1;
$p_excalm{$f_id} += -5;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += -5;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += -1;
$p_busyou_dex{$f_id} += 2;
$p_busyou_agr{$f_id} += -1;

$p_kijyou{$f_id} += 0;
$p_syageki{$f_id} += int(rand(21));
$p_bujyutu{$f_id} += int(rand(21));
$p_jyujyutu{$f_id} += 40;
$p_tyouhou{$f_id} += 30;
$p_jyuukisouda{$f_id} += int(rand(41));
$p_tyoukyou{$f_id} += 30;
$p_seiji{$f_id} += int(rand(21));
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += 30;

$p_yoti{$f_id} += 0;
$p_kikensatti{$f_id} += 0;
$p_dokusousei{$f_id} += 5;
$p_doubutu_tekisei{$f_id} += 5;
$p_kougaku_tekisei{$f_id} += 0;
$p_kyouyou{$f_id} += 0;
$p_kiokuryoku{$f_id} += 0;
$p_syakousei{$f_id} += 10;
$p_ihuu{$f_id} += -20;
$p_kihaku{$f_id} += 0;
	}elsif($in{'toi7'} eq "20"){
$p_ex_karumald{$f_id} += 0;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += -1;
$p_karisuma{$f_id} += 1;
$p_kotobadakumi{$f_id} += 1;
$p_syuutyuu{$f_id} += 3;
$p_seisin{$f_id} += 3;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} += 1;
$p_exluck{$f_id} += 1;
$p_jiseisin{$f_id} += 0;
$p_sinkousin{$f_id} += 1;
$p_exbrave{$f_id} += -10;
$p_busyou_str{$f_id} += -1;
$p_busyou_dex{$f_id} += 1;
$p_busyou_agr{$f_id} += -1;

$p_kijyou{$f_id} += int(rand(21));
$p_syageki{$f_id} += int(rand(21));
$p_bujyutu{$f_id} += 0;
$p_jyujyutu{$f_id} += 40;
$p_tyouhou{$f_id} += 40;
$p_jyuukisouda{$f_id} += int(rand(41));
$p_tyoukyou{$f_id} += int(rand(41));
$p_seiji{$f_id} += int(rand(41));
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += int(rand(41));

$p_yoti{$f_id} += 15;
$p_kikensatti{$f_id} += 15;
$p_dokusousei{$f_id} += -15;
$p_doubutu_tekisei{$f_id} += 0;
$p_kougaku_tekisei{$f_id} += 0;
$p_kyouyou{$f_id} += 0;
$p_kiokuryoku{$f_id} += 0;
$p_syakousei{$f_id} += 5;
$p_ihuu{$f_id} += -10;
$p_kihaku{$f_id} += -10;
	}elsif($in{'toi7'} eq "21"){
$p_ex_karumald{$f_id} += 0;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 0;
$p_kotobadakumi{$f_id} += 0;
$p_syuutyuu{$f_id} += 1;
$p_seisin{$f_id} += 1;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} += -3;
$p_exluck{$f_id} += 3;
$p_jiseisin{$f_id} += -5;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 3;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} += 1;
$p_busyou_agr{$f_id} += -1;

$p_kijyou{$f_id} += int(rand(41));
$p_syageki{$f_id} += int(rand(41));
$p_bujyutu{$f_id} += 30;
$p_jyujyutu{$f_id} += 30;
$p_tyouhou{$f_id} += 30;
$p_jyuukisouda{$f_id} += int(rand(41));
$p_tyoukyou{$f_id} += 30;
$p_seiji{$f_id} += 0;
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += 0;

$p_yoti{$f_id} += 5;
$p_kikensatti{$f_id} += 5;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += 0;
$p_kougaku_tekisei{$f_id} += 0;
$p_kyouyou{$f_id} += -10;
$p_kiokuryoku{$f_id} += -10;
$p_syakousei{$f_id} += 0;
$p_ihuu{$f_id} += 0;
$p_kihaku{$f_id} += 10;
	}elsif($in{'toi7'} eq "22"){
$p_ex_karumald{$f_id} += 0;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 0;
$p_kotobadakumi{$f_id} += 2;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 5;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} += -3;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += -7;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 3;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} += 0;
$p_busyou_agr{$f_id} += 0;

$p_kijyou{$f_id} += int(rand(41));
$p_syageki{$f_id} += int(rand(41));
$p_bujyutu{$f_id} += 30;
$p_jyujyutu{$f_id} += 30;
$p_tyouhou{$f_id} += int(rand(41));
$p_jyuukisouda{$f_id} += int(rand(41));
$p_tyoukyou{$f_id} += int(rand(41));
$p_seiji{$f_id} += int(rand(21));
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += int(rand(21));

$p_yoti{$f_id} += 0;
$p_kikensatti{$f_id} += 0;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += 0;
$p_kougaku_tekisei{$f_id} += 0;
$p_kyouyou{$f_id} += -5;
$p_kiokuryoku{$f_id} += -10;
$p_syakousei{$f_id} += 0;
$p_ihuu{$f_id} += 0;
$p_kihaku{$f_id} += 15;
	}elsif($in{'toi7'} eq "23"){
$p_ex_karumald{$f_id} += -50;
$p_exgiri{$f_id} += -1;
$p_exyabou{$f_id} += 1;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 0;
$p_kotobadakumi{$f_id} += -3;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 3;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} += -2;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += -5;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 5;
$p_busyou_str{$f_id} += 1;
$p_busyou_dex{$f_id} += 0;
$p_busyou_agr{$f_id} += 0;

$p_kijyou{$f_id} += int(rand(41));
$p_syageki{$f_id} += int(rand(41));
$p_bujyutu{$f_id} += 40;
$p_jyujyutu{$f_id} += int(rand(41));
$p_tyouhou{$f_id} += int(rand(41));
$p_jyuukisouda{$f_id} += int(rand(41));
$p_tyoukyou{$f_id} += 40;
$p_seiji{$f_id} += 0;
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += 0;

$p_yoti{$f_id} += 0;
$p_kikensatti{$f_id} += 10;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += -10;
$p_kougaku_tekisei{$f_id} += 0;
$p_kyouyou{$f_id} += -5;
$p_kiokuryoku{$f_id} += -5;
$p_syakousei{$f_id} += -15;
$p_ihuu{$f_id} += 10;
$p_kihaku{$f_id} += 15;
	}elsif($in{'toi7'} eq "24"){
$p_ex_karumald{$f_id} += -100;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 0;
$p_kotobadakumi{$f_id} += 0;
$p_syuutyuu{$f_id} += 1;
$p_seisin{$f_id} += 1;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} += 1;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += -10;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 5;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} += 0;
$p_busyou_agr{$f_id} += 1;

$p_kijyou{$f_id} += int(rand(41));
$p_syageki{$f_id} += 30;
$p_bujyutu{$f_id} += 30;
$p_jyujyutu{$f_id} += int(rand(41));
$p_tyouhou{$f_id} += 40;
$p_jyuukisouda{$f_id} += int(rand(41));
$p_tyoukyou{$f_id} += 30;
$p_seiji{$f_id} += 0;
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += -10;

$p_yoti{$f_id} += 0;
$p_kikensatti{$f_id} += 15;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += -10;
$p_kougaku_tekisei{$f_id} += -10;
$p_kyouyou{$f_id} += 0;
$p_kiokuryoku{$f_id} += 0;
$p_syakousei{$f_id} += 0;
$p_ihuu{$f_id} += 5;
$p_kihaku{$f_id} += 0;
	}elsif($in{'toi7'} eq "25"){
$p_ex_karumald{$f_id} += 0;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 1;
$p_karisuma{$f_id} += -3;
$p_kotobadakumi{$f_id} += 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 1;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} += 1;
$p_jiseisin{$f_id} += 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} += 0;
$p_busyou_agr{$f_id} += 0;

$p_kijyou{$f_id} += int(rand(41));
$p_syageki{$f_id} += int(rand(41));
$p_bujyutu{$f_id} += int(rand(41));
$p_jyujyutu{$f_id} += int(rand(41));
$p_tyouhou{$f_id} += int(rand(41));
$p_jyuukisouda{$f_id} += int(rand(41));
$p_tyoukyou{$f_id} += int(rand(41));
$p_seiji{$f_id} += int(rand(41));
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += int(rand(41));

$p_yoti{$f_id} += 0;
$p_kikensatti{$f_id} += 5;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += 5;
$p_kougaku_tekisei{$f_id} += -5;
$p_kyouyou{$f_id} += 0;
$p_kiokuryoku{$f_id} += 0;
$p_syakousei{$f_id} += 10;
$p_ihuu{$f_id} += -5;
$p_kihaku{$f_id} += -10;
	}elsif($in{'toi7'} eq "26"){
$p_ex_karumald{$f_id} += 0;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 3;
$p_karisuma{$f_id} += -3;
$p_kotobadakumi{$f_id} += -10;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 10;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} += 3;
$p_jiseisin{$f_id} += 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += -3;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} += 0;
$p_busyou_agr{$f_id} += 0;

$p_kijyou{$f_id} += 0;
$p_syageki{$f_id} += int(rand(41));
$p_bujyutu{$f_id} += int(rand(41));
$p_jyujyutu{$f_id} += 30;
$p_tyouhou{$f_id} += int(rand(41));
$p_jyuukisouda{$f_id} += int(rand(41));
$p_tyoukyou{$f_id} += 30;
$p_seiji{$f_id} += int(rand(41));
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += int(rand(41));

$p_yoti{$f_id} += 10;
$p_kikensatti{$f_id} += 0;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += 15;
$p_kougaku_tekisei{$f_id} += 0;
$p_kyouyou{$f_id} += -5;
$p_kiokuryoku{$f_id} += 0;
$p_syakousei{$f_id} += 0;
$p_ihuu{$f_id} += -15;
$p_kihaku{$f_id} += -5;
	}elsif($in{'toi7'} eq "27"){
$p_ex_karumald{$f_id} += 0;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += -5;
$p_kotobadakumi{$f_id} += -3;
$p_syuutyuu{$f_id} += 4;
$p_seisin{$f_id} += 1;
$p_nintai{$f_id} += 3;
$p_excalm{$f_id} += 1;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += 7;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += -10;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} += 0;
$p_busyou_agr{$f_id} += 1;

$p_kijyou{$f_id} += int(rand(21));
$p_syageki{$f_id} += int(rand(41));
$p_bujyutu{$f_id} += int(rand(41));
$p_jyujyutu{$f_id} += 30;
$p_tyouhou{$f_id} += 40;
$p_jyuukisouda{$f_id} += int(rand(41));
$p_tyoukyou{$f_id} += int(rand(41));
$p_seiji{$f_id} += 0;
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += int(rand(41));

$p_yoti{$f_id} += 10;
$p_kikensatti{$f_id} += 15;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += 15;
$p_kougaku_tekisei{$f_id} += 0;
$p_kyouyou{$f_id} += 0;
$p_kiokuryoku{$f_id} += 0;
$p_syakousei{$f_id} += -15;
$p_ihuu{$f_id} += -15;
$p_kihaku{$f_id} += -10;
	}elsif($in{'toi7'} eq "27"){
$p_ex_karumald{$f_id} += 0;
$p_exgiri{$f_id} += 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 0;
$p_kotobadakumi{$f_id} += -3;
$p_syuutyuu{$f_id} += 4;
$p_seisin{$f_id} += 1;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} += 1;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} += 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += -3;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} += 0;
$p_busyou_agr{$f_id} += 1;

$p_kijyou{$f_id} += int(rand(41));
$p_syageki{$f_id} += int(rand(41));
$p_bujyutu{$f_id} += int(rand(41));
$p_jyujyutu{$f_id} += int(rand(41));
$p_tyouhou{$f_id} += int(rand(41));
$p_jyuukisouda{$f_id} += int(rand(41));
$p_tyoukyou{$f_id} += int(rand(41));
$p_seiji{$f_id} += int(rand(41));
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += int(rand(41));

$p_yoti{$f_id} += 0;
$p_kikensatti{$f_id} += 0;
$p_dokusousei{$f_id} += 15;
$p_doubutu_tekisei{$f_id} += 5;
$p_kougaku_tekisei{$f_id} += 0;
$p_kyouyou{$f_id} += 5;
$p_kiokuryoku{$f_id} += 5;
$p_syakousei{$f_id} += 0;
$p_ihuu{$f_id} += -15;
$p_kihaku{$f_id} += -15;
	}else{
$p_kijyou{$f_id} += int(rand(41));
$p_syageki{$f_id} += int(rand(41));
$p_bujyutu{$f_id} += int(rand(41));
$p_jyujyutu{$f_id} += int(rand(41));
$p_tyouhou{$f_id} += int(rand(41));
$p_jyuukisouda{$f_id} += int(rand(41));
$p_tyoukyou{$f_id} += int(rand(41));
$p_seiji{$f_id} += int(rand(41));
$p_sinyou{$f_id} += int(rand(41));
$p_jinbou{$f_id} += int(rand(41));
	}

	if($in{'min'} eq "0"){
$p_exgiri{$f_id} += 5;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 1;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} -= 0;
$p_jiseisin{$f_id} -= 1;
$p_sinkousin{$f_id} -= 1;
$p_exbrave{$f_id} += 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;

$p_yoti{$f_id} += 0;
$p_kikensatti{$f_id} += -3;
$p_dokusousei{$f_id} += -2;
$p_doubutu_tekisei{$f_id} += -2;
$p_kougaku_tekisei{$f_id} += 1;
$p_kyouyou{$f_id} += 1;
$p_kiokuryoku{$f_id} += 1;
$p_syakousei{$f_id} += 1;
$p_ihuu{$f_id} += 2;
$p_kihaku{$f_id} += 1;
	}elsif($in{'min'} eq "1"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 1;
$p_seisin{$f_id} += 1;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} -= 5;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 1;

$p_yoti{$f_id} += -1;
$p_kikensatti{$f_id} += 1;
$p_dokusousei{$f_id} += -1;
$p_doubutu_tekisei{$f_id} += +2;
$p_kougaku_tekisei{$f_id} += -1;
$p_kyouyou{$f_id} += -1;
$p_kiokuryoku{$f_id} += -1;
$p_syakousei{$f_id} += 0;
$p_ihuu{$f_id} += 1;
$p_kihaku{$f_id} += 1;
	}elsif($in{'min'} eq "2"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 1;
$p_excalm{$f_id} += 1;
$p_exluck{$f_id} += 1;
$p_jiseisin{$f_id} -= 1;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;

$p_yoti{$f_id} += -1;
$p_kikensatti{$f_id} += 1;
$p_dokusousei{$f_id} += -2;
$p_doubutu_tekisei{$f_id} += +2;
$p_kougaku_tekisei{$f_id} += -1;
$p_kyouyou{$f_id} += 0;
$p_kiokuryoku{$f_id} += -1;
$p_syakousei{$f_id} += 1;
$p_ihuu{$f_id} += 0;
$p_kihaku{$f_id} += 1;
	}elsif($in{'min'} eq "3"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 1;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} -= 0;
$p_jiseisin{$f_id} -= 2;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;

$p_yoti{$f_id} += 0;
$p_kikensatti{$f_id} += 1;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += 1;
$p_kougaku_tekisei{$f_id} += 0;
$p_kyouyou{$f_id} += -2;
$p_kiokuryoku{$f_id} += 1;
$p_syakousei{$f_id} += -1;
$p_ihuu{$f_id} += -1;
$p_kihaku{$f_id} += 1;
	}elsif($in{'min'} eq "4"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += 1;
$p_excalm{$f_id} += 1;
$p_exluck{$f_id} -= 2;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;

$p_yoti{$f_id} += -2;
$p_kikensatti{$f_id} += 1;
$p_dokusousei{$f_id} += 1;
$p_doubutu_tekisei{$f_id} += 2;
$p_kougaku_tekisei{$f_id} += 0;
$p_kyouyou{$f_id} += -1;
$p_kiokuryoku{$f_id} += 0;
$p_syakousei{$f_id} += -1;
$p_ihuu{$f_id} += -1;
$p_kihaku{$f_id} += 1;
	}elsif($in{'min'} eq "5"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 1;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} -= 1;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 1;

$p_yoti{$f_id} += -1;
$p_kikensatti{$f_id} += 1;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += 2;
$p_kougaku_tekisei{$f_id} += -1;
$p_kyouyou{$f_id} += 0;
$p_kiokuryoku{$f_id} += -1;
$p_syakousei{$f_id} += 0;
$p_ihuu{$f_id} += -1;
$p_kihaku{$f_id} += 1;
	}elsif($in{'min'} eq "6"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 1;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += 0;
$p_excalm{$f_id} += 1;
$p_exluck{$f_id} -= 5;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} += 1;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} += 1;
$p_busyou_agr{$f_id} += 0;

$p_yoti{$f_id} += 0;
$p_kikensatti{$f_id} += -1;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += 0;
$p_kougaku_tekisei{$f_id} += 0;
$p_kyouyou{$f_id} += -1;
$p_kiokuryoku{$f_id} += 0;
$p_syakousei{$f_id} += 1;
$p_ihuu{$f_id} += 1;
$p_kihaku{$f_id} += 0;
	}elsif($in{'min'} eq "7"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 1;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 1;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} += 1;
$p_exluck{$f_id} -= 7;
$p_jiseisin{$f_id} += 2;
$p_sinkousin{$f_id} += 2;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;

$p_yoti{$f_id} += -1;
$p_kikensatti{$f_id} += -5;
$p_dokusousei{$f_id} += 2;
$p_doubutu_tekisei{$f_id} += 1;
$p_kougaku_tekisei{$f_id} += 1;
$p_kyouyou{$f_id} += 2;
$p_kiokuryoku{$f_id} += 1;
$p_syakousei{$f_id} += 1;
$p_ihuu{$f_id} += 1;
$p_kihaku{$f_id} += -3;
	}elsif($in{'min'} eq "8"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 3;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} -= 0;
$p_exluck{$f_id} -= 5;
$p_jiseisin{$f_id} -= 1;
$p_sinkousin{$f_id} += 3;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;

$p_yoti{$f_id} += -2;
$p_kikensatti{$f_id} += 1;
$p_dokusousei{$f_id} += 0;
$p_doubutu_tekisei{$f_id} += 3;
$p_kougaku_tekisei{$f_id} += -3;
$p_kyouyou{$f_id} += -1;
$p_kiokuryoku{$f_id} += -1;
$p_syakousei{$f_id} += -1;
$p_ihuu{$f_id} += 1;
$p_kihaku{$f_id} += 3;
	}elsif($in{'min'} eq "9"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} += 1;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} -= 2;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;

$p_yoti{$f_id} += -2;
$p_kikensatti{$f_id} += -2;
$p_dokusousei{$f_id} += -1;
$p_doubutu_tekisei{$f_id} += 1;
$p_kougaku_tekisei{$f_id} += 0;
$p_kyouyou{$f_id} += 1;
$p_kiokuryoku{$f_id} += 1;
$p_syakousei{$f_id} += 0;
$p_ihuu{$f_id} += 1;
$p_kihaku{$f_id} += 1;
	}elsif($in{'min'} eq "10"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 5;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 1;
$p_excalm{$f_id} -= 1;
$p_exluck{$f_id} -= 2;
$p_jiseisin{$f_id} -= 1;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 0;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;

$p_yoti{$f_id} += -1;
$p_kikensatti{$f_id} += 2;
$p_dokusousei{$f_id} += -1;
$p_doubutu_tekisei{$f_id} += 5;
$p_kougaku_tekisei{$f_id} += -5;
$p_kyouyou{$f_id} += -1;
$p_kiokuryoku{$f_id} += 0;
$p_syakousei{$f_id} += 1;
$p_ihuu{$f_id} += -1;
$p_kihaku{$f_id} += 1;
	}elsif($in{'min'} eq "11"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} += 3;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 3;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 0;
$p_excalm{$f_id} += 0;
$p_exluck{$f_id} -= 10;
$p_jiseisin{$f_id} -= 0;
$p_sinkousin{$f_id} += 2;
$p_exbrave{$f_id} += 2;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;

$p_yoti{$f_id} += 3;
$p_kikensatti{$f_id} += -5;
$p_dokusousei{$f_id} += 2;
$p_doubutu_tekisei{$f_id} += 3;
$p_kougaku_tekisei{$f_id} += -1;
$p_kyouyou{$f_id} += 1;
$p_kiokuryoku{$f_id} += 0;
$p_syakousei{$f_id} += 1;
$p_ihuu{$f_id} += 1;
$p_kihaku{$f_id} += -5;
	}elsif($in{'min'} eq "12"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 1;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 2;
$p_excalm{$f_id} -= 1;
$p_exluck{$f_id} += 2;
$p_jiseisin{$f_id} -= 2;
$p_sinkousin{$f_id} += 1;
$p_exbrave{$f_id} += 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} += 1;
$p_busyou_agr{$f_id} += 0;

$p_yoti{$f_id} += 2;
$p_kikensatti{$f_id} += -2;
$p_dokusousei{$f_id} += 1;
$p_doubutu_tekisei{$f_id} += 2;
$p_kougaku_tekisei{$f_id} += -5;
$p_kyouyou{$f_id} += 0;
$p_kiokuryoku{$f_id} += -3;
$p_syakousei{$f_id} += 1;
$p_ihuu{$f_id} += 2;
$p_kihaku{$f_id} += 2;
	}elsif($in{'min'} eq "13"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 0;
$p_kotobadakumi{$f_id} -= 0;
$p_syuutyuu{$f_id} += 0;
$p_seisin{$f_id} += 0;
$p_nintai{$f_id} -= 1;
$p_excalm{$f_id} -= 1;
$p_exluck{$f_id} += 0;
$p_jiseisin{$f_id} -= 1;
$p_sinkousin{$f_id} += 0;
$p_exbrave{$f_id} += 1;
$p_busyou_str{$f_id} += 1;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;

$p_yoti{$f_id} += 0;
$p_kikensatti{$f_id} += 1;
$p_dokusousei{$f_id} += 3;
$p_doubutu_tekisei{$f_id} += 1;
$p_kougaku_tekisei{$f_id} += 0;
$p_kyouyou{$f_id} += -3;
$p_kiokuryoku{$f_id} += -1;
$p_syakousei{$f_id} += -3;
$p_ihuu{$f_id} += 0;
$p_kihaku{$f_id} += 2;
	}elsif($in{'min'} eq "14"){
$p_exgiri{$f_id} -= 0;
$p_exyabou{$f_id} += 0;
$p_yousi{$f_id} += 0;
$p_karisuma{$f_id} -= 10;
$p_kotobadakumi{$f_id} += 1;
$p_syuutyuu{$f_id} += 1;
$p_seisin{$f_id} += 1;
$p_nintai{$f_id} += 2;
$p_excalm{$f_id} += 1;
$p_exluck{$f_id} += 1;
$p_jiseisin{$f_id} += 1;
$p_sinkousin{$f_id} += 1;
$p_exbrave{$f_id} += 1;
$p_busyou_str{$f_id} += 0;
$p_busyou_dex{$f_id} -= 0;
$p_busyou_agr{$f_id} += 0;

$p_yoti{$f_id} += 0;
$p_kikensatti{$f_id} += -5;
$p_dokusousei{$f_id} += 3;
$p_doubutu_tekisei{$f_id} += 1;
$p_kougaku_tekisei{$f_id} += 2;
$p_kyouyou{$f_id} += 0;
$p_kiokuryoku{$f_id} += 1;
$p_syakousei{$f_id} += 0;
$p_ihuu{$f_id} += -3;
$p_kihaku{$f_id} += 1;
	}





	if($m_hit){
require "./$mpg_r/sub_db/mapw.pl";
		$p_kunino{$f_id} = $new_kuni_id_in;
		$fk_id = $new_kuni_id_in;

$xtoorina = '';
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
			$k_kousen_aite_name{$fk_id} = "無し";
$k_kousen_aite_k{$fk_id}[0] = '0';
	if($tenkakaisuu > 1 and $keika_nen < 100 and $k_kunino{"1"} eq "1"){
$k_kousen_aite_k{$fk_id}[0] = '1';
			$k_kousen_aite_name{$fk_id} = "$k_name_d[1]";
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
	
$k_name_d{$fk_id} = "$in{'kokumei'} ";
$k_name_k{$fk_id} = "$in{'kokumei'} ";
$k_name_outyou{$fk_id}="$in{'kokumei'} ";
$k_name_z{$fk_id} = "$in{'zokumei'} ";
$k_syuminzoku{$fk_id} = $in{'min'};
$k_yakusyoku_id{$fk_id}[1] = $in{'id'};

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
									&PRLOG("\[$old_date\]<a href=\"./?.m.=p_b&amp;.id.=$in{'id'}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$in{'chara_name'}</span></a>が$t_name{$ft_id}の賊砦にて$k_name_d[$p_kunino{$f_id}]を旗揚げ。");
									$ttid = "blog/$in{'id'}";
									&PRLOG("\[$old_date\]$t_name{$ft_id}の賊砦にて$k_p_k_a{$p_kunino{$f_id}}を旗揚げする。");
		&MAP_LOG2("<span class=\"c000088\">【賊旗揚げ】</span>\[$old_date\]新しく<a href=\"./?.m.=p_b&amp;.id.=$in{'id'}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$in{'chara_name'}</span></a>が$t_name{$ft_id}の賊砦にて$k_p_k_a{$p_kunino{$f_id}}を旗揚げしました。");
		&MAP_LOG("<span class=\"c000088\">【賊旗揚げ】</span>新しく<a href=\"./?.m.=p_b&amp;.id.=$in{'id'}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$in{'chara_name'}</span></a>が$t_name{$ft_id}の賊砦にて$k_p_k_a{$p_kunino{$f_id}}を旗揚げしました。");

	}else{
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]<a href=\"./?.m.=p_b&amp;.id.=$in{'id'}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$in{'chara_name'}</span></a>が天子：$in{'mes'}を擁立し、$t_name{$ft_id}の地に$k_name_d[$p_kunino{$f_id}]を建国。");
									$ttid = "blog/$in{'id'}";
									&PRLOG("\[$old_date\]天子 $in{'mes'} を擁立し、$t_name{$ft_id}の地に$k_p_k_a{$p_kunino{$f_id}}を建国する。");
		&MAP_LOG2("<span class=\"c000088\">【建国】</span>\[$old_date\]新しく<a href=\"./?.m.=p_b&amp;.id.=$in{'id'}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$in{'chara_name'}</span></a>が天子：$in{'mes'}を擁立し、$t_name{$ft_id}に$k_p_k_a{$p_kunino{$f_id}}を建国しました。");
		&MAP_LOG("<span class=\"c000088\">【建国】</span>新しく<a href=\"./?.m.=p_b&amp;.id.=$in{'id'}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$in{'chara_name'}</span></a>が天子：$in{'mes'}を擁立し、$t_name{$ft_id}に$k_p_k_a{$p_kunino{$f_id}}を建国しました。");

	}

			$k_kousen_aite_name{$p_kunino{$f_id}} = "無し";
	if($tenkakaisuu > 1 and $keika_nen < 100 and $k_kunino[1] and $k_kunino{$fk_id} eq "1"){
			$k_kousen_aite_k{$p_kunino{$f_id}}[0] = 1;
			$k_kousen_aite_name{$p_kunino{$f_id}} = "$k_name_d[1]";
									$ttid = "klog/$p_kunino{$f_id}";
									&PRLOG("\[$old_date\]天子：$in{'mes'}は、時の支配勢力 $k_name_d[1]に対し宣戦布告を行いました。");
	}


	$p_syoji_kin{$f_id} = 1000;
	$p_syoji_kome{$f_id} = 500;
	$p_kuni_kouken{$f_id} = 3000;
	$p_neutral_meisei{$f_id} = 3000;
		$p_kuni_yakusyoku{$f_id} = 1;
$p_exyabou{$f_id} += 20;
	}else{
	$p_syoji_kin{$f_id} = 0;
	$p_syoji_kome{$f_id} = 0;
	$p_kuni_kouken{$f_id} = 0;
		$ft_id = $intosi;
	&T_OPEN("tosi_db","$ft_id","$ft_id");
									$ttid = "blog/$in{'id'}";
									&PRLOG("\[$old_date\]$k_p_k_a{$p_kunino{$f_id}}に仕官。初期位置：$t_name{$ft_id}。");
		&MAP_LOG("<span class=\"c0088CC\">【仕官】</span>新しく<a href=\"./?.m.=p_b&amp;.id.=$in{'id'}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$p_kunino{$f_id}}\">$in{'chara_name'}</span></a>が$k_p_k_a{$p_kunino{$f_id}}に仕官しました。初期位置：$t_name{$ft_id}");
	}

	@NEW_COM=();
	for($i=0;$i<$MAX_CD;$i++){
		push(@NEW_COM,"<><>- 未入力 -<>$tt<><><>50<>\n");
	}

	open(OUT,">./p_db/cd/$in{'id'}.cgi");
	print OUT @NEW_COM;
	close(OUT);


	$p_jinbou{$f_id} = int(rand(71))+30;
	$p_heisisuu{$f_id} = 0;
	$p_kunren{$f_id} = 0;
	$p_kunkou{$f_id} = 30;
	$p_migite{$f_id} = 1099;
$p_hidarite{$f_id} = 1000;
$p_syomotu{$f_id} = $p_syomotu{$f_id}+2000;
$p_norimono{$f_id} = $p_norimono{$f_id}+3000;
$p_ihuku{$f_id} = $p_ihuku{$f_id}+4000;
$p_akusesari_b{$f_id}[0] = $p_akusesari_b{$f_id}[0]+5000;
$p_akusesari_b{$f_id}[1] = $p_akusesari_b{$f_id}[1]+5000;
$p_akusesari_b{$f_id}[2] = $p_akusesari_b{$f_id}[2]+5000;
$p_akusesari_b{$f_id}[3] = $p_akusesari_b{$f_id}[3]+5000;
$p_akusesari_b{$f_id}[4] = $p_akusesari_b{$f_id}[4]+5000;
$p_akusesari_h{$f_id}[0] = $p_akusesari_h{$f_id}[0]+6000;
$p_akusesari_h{$f_id}[1] = $p_akusesari_h{$f_id}[1]+6000;
$p_akusesari_h{$f_id}[2] = $p_akusesari_h{$f_id}[2]+6000;
$p_akusesari_h{$f_id}[3] = $p_akusesari_h{$f_id}[3]+6000;
$p_akusesari_h{$f_id}[4] = $p_akusesari_h{$f_id}[4]+6000;
	$p_mikoudou_t{$f_id} = $TOUKETU_T - 10;
	$p_buryoku{$f_id} = $in{'str'}+0;
	$p_tiryoku{$f_id} = $in{'int'}+0;
	$p_tousotu{$f_id} = $in{'tou'}+0;
	$p_id{$f_id} = $in{'id'};
	$p_pass{$f_id} = $in{'pass'};
	$p_name{$f_id} = $in{'chara_name'};
	$p_ex_buryoku{$f_id} = 0;
	$p_ex_tiryoku{$f_id} = 0;
	$p_ex_tousotu{$f_id} = 0;
	$p_cgno_d{$f_id} = $in{'icon'};
	$p_cg_sabano{$f_id} = int($in{'icon_saba'});
	$p_taizai_iti{$f_id} = $intosi;
	$p_tairyoku{$f_id} = 100;
	$p_syokihost{$f_id} = $host;
	$p_keyword{$f_id} = $in{'keyw'};
	$p_syokihost{$f_id} = $host;
$p_kuni_sikan_nensuu{$f_id} = 0;$p_kuni_kouken{$f_id} = 0;
	$p_ex_jinbou{$f_id} = 0;
	$p_ex_kijyou{$f_id} = 0;
	$p_ex_syageki{$f_id} = 0;
	$p_ex_bujyutu{$f_id} = 0;
	$p_ex_jyujyutu{$f_id} = 0;
	$p_ex_tyouhou{$f_id} = 0;
	$p_ex_jyuukisouda{$f_id} = 0;
	$p_ex_tyoukyou{$f_id} = 0;
	$p_ex_sinyou{$f_id} = 0;
	$p_ex_seiji{$f_id} = 0;

	$p_heisyu{$f_id} = 0;
	$p_gekiha{$f_id} = 0;


$p_yomikaki{$f_id} =0;

			$p_sougou{$f_id} = $p_buryoku{$f_id}+$p_tiryoku{$f_id}+$p_tousotu{$f_id};
$p_10syu_sougou{$f_id} = $p_kijyou{$f_id}+$p_syageki{$f_id}+$p_bujyutu{$f_id}+$p_jyujyutu{$f_id}+$p_tyouhou{$f_id}+$p_jyuukisouda{$f_id}+$p_tyoukyou{$f_id}+$p_jinbou{$f_id}+$p_seiji{$f_id}+$p_sinyou{$f_id};

				$datef1 = 0;
				$datef1 -= int($kousin_kankaku * $k_kokui{$fk_id} / 500);
				$datef1 -= int($kousin_kankaku * ($p_tairyoku{$f_id} - 100) * 2 / 500);
				$p_kousin_s{$f_id} = $kousin_kankaku + $datef1;

				$p_b_kousin_s{$f_id} = int($p_kousin_s{$f_id} * 30 / (10 + $p_b_idou_sokudo{$f_id}));
				$p_h_kousin_s{$f_id} = int($p_kousin_s{$f_id} * 30 / (10 + $p_h_idou_sokudo{$f_id}));
$p_k_iro_d{$f_id} = $k_iro_d[$k_kunino{$p_kunino{$f_id}}];
	&P_SAVE("p","$f_id","$f_id");


	&UNLOCK_FILE;


require "./$mpg_r/sub_db/tw.pl";
	&P_OPEN;
	&HEADER;
require "$mpg_r/sub_db/img_css_w.pl";
require "$mpg_r/vs-spt.pl";
$w_id = $f_id;

$p_img_w{$p_cg_sabano{$f_id}}="$IMG{$p_cg_sabano{$f_id}}/";
$p_img_w{$p_cg_sabano{$f_id}}.=int($p_cgno_d{$f_id});
$p_img_w{"gif"}="$p_cgno_d{$f_id}";
$p_img_w{"jpg"}="$p_cgno_d{$f_id}";
$p_img_w{"png"}="$p_cgno_d{$f_id}";
$p_img_w{"jpeg"}="$p_cgno_d{$f_id}";
$p_img{$f_id}=$p_img_w{$p_cg_sabano{$f_id}};
$p_img_f{$f_id}=$p_img_kakutyou{$p_cg_sabano{$f_id}};
$p_img_m{$f_id}=$p_img_mime{$p_cg_sabano{$f_id}};

&IMG_CSS_SEISEI;
	&IMG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide_d","$img_height_d","$p_img_m{$f_id}","b$f_id");
			$come_ml = "defo";
	if($in{'i'} eq "i"){
			$come_ml = "i_s";
	}
	print <<"PRI";
＜＜<strong> * 登録完了 * </strong>＞＞
<hr />
$GAME_TITLEへの登録手続きが完了しました。<br />IDとパスワードを忘れないよう、この画面を保存するか内容を書き留めておくようお願い致します。
<hr />
<br /><br />
<table width=\"155\" class=\"bgc884422\" class=\"txth\">
<tr class=\"bgc884422\"><td width=\"45\"></td><td width=\"110\"></td>
<tr class=\"bgcFFF0F5\"><td colspan=\"2\">新武将（登録内容）</td></tr>
<tr class=\"bgcFFFFFF\"><td colspan=\"2\">$img_sakusei_kekka</td></tr>
<tr class=\"bgcFFFFFF\"><td>ID</td><td><span class=\"cFF0000\">$in{'id'}</span></td></tr>
<tr class=\"bgcFFFFFF\"><td>Pass</td><td><span class=\"cFF0000\">$in{'pass'}</span></td></tr>
<tr class=\"bgcFFFFFF\"><td>武将名</td><td>$p_name{$f_id}</td></tr>

<tr class=\"bgcFFFFFF\"><td>滞在地</td><td>$t_name[$p_taizai_iti{$f_id}]</td></tr>
<tr class=\"bgcFFFFFF\"><td>所属国</td><td>$k_name_d[$p_kunino{$f_id}]</td></tr>
</table>

<br /><br />
<form action=\"$COMMAND\" method=\"post\" target=\"_top\" utn=\"utn\">
<div>
<input type=\"hidden\" name=\".m.\" value=\"$come_ml\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=.i. value=$in{'i'}>
<input type=\"submit\" value=\"ゲーム開始\" />
</div></form>
<br />
武将詳細データは<a href=\"./?.i.=$in{'i'}&amp;.m.=p_b&amp;.id.=$p_id{$f_id}\" target=\"_blank\"><span class=\"cFF0000\">こちら</span></a>

PRI

		&FOOTER;



	exit;
}


#  ERROR

sub E_ERR {

	&HEADER;
	if ($lockhit > 0) { 
		while ($lockhit > 0) {
 &UNLOCK_FILE;
		}
	}
$add_e_err = "entry";
	if ($in{'i'} eq "i") { 
$add_e_err = "i_entry3";
	}
	print "<hr /><span class=\"fs4\">ヽ(｀Д´)ノ</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>$_[0]</strong></span>\n";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\" />

<input type=\"hidden\" name=\".toi.\" value=\"$in{'toi'}\" /><input type=\"hidden\" name=\".toi2.\" value=\"$in{'toi2'}\" />
<input type=\"hidden\" name=\".toi3.\" value=\"$in{'toi3'}\" /><input type=\"hidden\" name=\".toi4.\" value=\"$in{'toi4'}\" />
<input type=\"hidden\" name=\".toi5.\" value=\"$in{'toi5'}\" />
<input type=\"hidden\" name=\".tyekku.\" value=\"$in{'tyekku'}\" />
<input type=\"hidden\" name=\".icon_saba.\" value=\"$in{'icon_saba'}\" />
<input type=\"hidden\" name=\".i.\" value=\"i\" />
<input type=\"hidden\" name=\".m.\" value=\"entry\" />
<input type=\"hidden\" name=\".toi6.\" value=\"$in{'toi6'}\" />
<input type=\"hidden\" name=\".toi7.\" value=\"$in{'toi7'}\" /><input type=\"hidden\" name=\".zokumei.\" value=\"$in{'zokumei'}\" />
<input type=\"hidden\" name=\".ele.\" value=\"$in{'ele'}\" /><input type=\"hidden\" name=\".kokumei.\" value=\"$in{'kokumei'}\" /><input type=\"hidden\" name=\".min.\" value=\"$in{'min'}\" /><input type=\"hidden\" name=\".icon.\" value=\"$in{'icon'}\" /><input type=\"hidden\" name=\".str.\" value=\"$in{'str'}\" /><input type=\"hidden\" name=\".int.\" value=\"$in{'int'}\" /><input type=\"hidden\" name=\".tou.\" value=\"$in{'tou'}\" /><input type=\"hidden\" name=\".k_no.\" value=\"$in{'k_no'}\" /><input type=\"hidden\" name=\".doui.\" value=\"$in{'doui'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".keyw.\" value=\"$in{'keyw'}\" /><input type=\"hidden\" name=\".url.\" value=\"$in{'url'}\" /><input type=\"hidden\" name=\".chara_name.\" value=\"$in{'chara_name'}\" /><input type=\"hidden\" name=\".mes.\" value=\"$in{'mes'}\" />
<input type=\"hidden\" name=\".m.\" value=\"$add_e_err\" /><input type=\"submit\" value=\"入力に戻る\" /></form>";
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
			&E_ERR("最大登録数\[$EN_MAX\]を超えています。現在新規登録出来ません。");
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