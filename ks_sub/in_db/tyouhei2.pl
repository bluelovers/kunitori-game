
sub MOVE {
$in{'type'} = int($in{'type'});
	&P_OPEN;
	if($in{'no'} eq ""){&ER1("コマンドNoを入力してください。");}
	if($SOL_TYPE[$in{'type'}] eq ""){&ER1("兵種が入力されていません。");}
require "$mpg_r/sub_db/hei.pl";
$tyouhei_kazu = abs(int($in{'num'}));
	$tyouhei_c = "$SOL_TYPE[$in{'type'}]徴兵"; 

	$get_sol[0] = $p_tousotu{$f_id} + int($p_sougou{$f_id}*0.1);
	$get_sol[1] = int($p_tiryoku{$f_id}*0.5) + int($p_sougou{$f_id}*0.1);
	$get_sol[2] = $p_buryoku{$f_id} + int($p_sougou{$f_id}*0.1);

	if($in{'cmaxf'} eq "max"){
$in{'num'} = $get_sol[$SOL_MAXT[$in{'type'}]];
$tyouhei_kazu = $get_sol[$SOL_MAXT[$in{'type'}]];
	}elsif($in{'cmaxf'} eq "husoku"){
$in{'num'} = $get_sol[$SOL_MAXT[$in{'type'}]] - $p_heisisuu{$f_id};
$tyouhei_kazu = $in{'num'};
	}elsif($in{'cmaxf'} eq "full"){
$tyouhei_kazu = $p_sougou{$f_id} * 1000;
	}elsif($in{'cmaxf'} eq "kaiko"){
$in{'num'} = abs(int($in{'num'}));
$tyouhei_kazu = 0 - $tyouhei_kazu;
$in{'type'} = $p_heisyu{$f_id};
$tyouhei_c = "$SOL_TYPE[$in{'type'}]解雇 ";
	}elsif($in{'cmaxf'} eq "tyouhei"){
$in{'num'} = abs(int($in{'num'}));
	}else{
$in{'num'} = abs(int($in{'num'}));
	}
		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");
require "./$mpg_r/sub_db/hei.pl";


		if($in{'pos'} eq ""){
	open(IN,"./p_db/cd/$f_id.cgi");
	@CD_DB = <IN>;
	close(IN);

		$cd_op0z="";
		$cd_op0o=0;
		$cd_op0n="";
	foreach(@CD_DB){
			($cd_id,$cd_no,$cd_name,$cd_op0,$cd_op1,$cd_op2,$cd_op3) = split(/<>/);

		if($cd_id eq "idou2" and $in{'no'} > $cd_op0o){
		$cd_op0z=$cd_op2;
		}
		$cd_op0o++;
	}
		}else{
		$cd_op0z=$in{'pos'};
		}
		if($cd_op0z ne ""){

		$ft_id = $cd_op0z;
	&T_OPEN("tosi_db","$ft_id","$ft_id");
		$cd_op0n="最終移動\予約先の都市・";
		}else{
		$cd_op0z=$p_taizai_iti{$f_id};
		}


		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

			if($in{'cmaxf'} eq "kaiko" and $p_kunino{$f_id} eq $t_kunino{$ft_id}){
			}else{
################

			$thadd = 0;
	if(!$k_kokka_keitai{$fk_id} and $k_kunino{$fk_id}){

	if($p_kunino{$f_id} eq $t_kunino{$ft_id}){
		if(!-e "./w_db/mati/tyouheihit$cd_op0z.cgi"){

################


	&K_READ("kuni_db","$k_kousen_aite_k{$fk_id}[0]","$k_kousen_aite_k{$fk_id}[0]");
	&K_READ("kuni_db","$k_kousen_aite_k{$fk_id}[1]","$k_kousen_aite_k{$fk_id}[1]");
	&K_READ("kuni_db","$k_kousen_aite_k{$fk_id}[2]","$k_kousen_aite_k{$fk_id}[2]");
	&K_READ("kuni_db","$k_kousen_aite_k{$fk_id}[3]","$k_kousen_aite_k{$fk_id}[3]");
	&K_READ("kuni_db","$k_kousen_aite_k{$fk_id}[4]","$k_kousen_aite_k{$fk_id}[4]");
	&K_READ("kuni_db","$k_kousen_aite_k{$fk_id}[5]","$k_kousen_aite_k{$fk_id}[5]");
	&K_READ("kuni_db","$k_kousen_aite_k{$fk_id}[6]","$k_kousen_aite_k{$fk_id}[6]");
	&K_READ("kuni_db","$k_kousen_aite_k{$fk_id}[7]","$k_kousen_aite_k{$fk_id}[7]");
	&K_READ("kuni_db","$k_kousen_aite_k{$fk_id}[8]","$k_kousen_aite_k{$fk_id}[8]");
	&K_READ("kuni_db","$k_kousen_aite_k{$fk_id}[9]","$k_kousen_aite_k{$fk_id}[9]");

		$tyohit3=0;
		&KOUSEN_AITE_KOKUSAKU_HIT("$toyhit3","10","$fk_id");
		$toyhit3=$kousen_aite_hit;

		if(!$tyohit3 and $cd_op0z ne $k_kouhou_tyouhei{$fk_id}[0] and $cd_op0z ne $k_kouhou_tyouhei{$fk_id}[1] and $cd_op0z ne $k_kouhou_tyouhei{$fk_id}[2] and $cd_op0z ne $k_kouhou_tyouhei{$fk_id}[3] and $cd_op0z ne $k_kouhou_tyouhei{$fk_id}[4]){


		if(-e "./w_db/allc_tosi_db.pl"){
require "./w_db/all_tosi_db.pl";

		}else{ 
require "./w_db/all2_tosi_db.pl";
		}

		$tyohit1=0;
		$tyohit2=0;
	foreach(@{$t_setuzoku_saki{$ft_id}}){
		if("$_" ne ""){
							$dt_id = $_;
			if($p_kunino{$f_id} eq $t_kunino[$dt_id]){
		$tyohit1=1;
			}else{
		&KOUSEN_AITE_HIT("$tyohit2","$t_kunino[$dt_id]","$fk_id");
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
################
			if($thadd){

			if($thadd > 1){
&ER1("他国の都市です。<br />この後方都市での徴兵は許可されていません。どうしても徴兵を行いたい場合は国の幹部に許可をもらってください。");
			}elsif($thadd == 1){
&ER1("交戦相手国に隣接していません。隣接自都市が存在します。<br />この後方都市での徴兵は許可されていません。どうしても徴兵を行いたい場合は国の幹部に許可をもらってください。");
			}

	exit;
			}
	}




		if($k_kokka_keitai{$fk_id}){
$t_gijyutu_ti{$ft_id} = 500;
		}elsif($k_kokkyou{$fk_id} eq "9"){
	if($k_kokkyou_keika_nen{$fk_id} > 5){
$t_gijyutu_ti{$ft_id} = 999;
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

	if($SOL_TYPE[$in{'type'}] and $t_gijyutu_ti{$ft_id} >= $SOL_TEC[$in{'type'}]){ 
		if($in{'type'} >= 21){ 
	foreach(@{$t_tiiki_hei_syu{$ft_id}}){
		if($in{'type'} eq "$_"){ 
	$hit = 1;
		}
	}
		}else{
	$hit = 1;
		}

	}

	if(!$hit){&ER1("雇用条件を満たしていません。"); }

			}


require "./$mpg_r/sub_db/neko$KEITAI_T.pl";
&TAJYUU_HANTEI;

					$cdw_id = "$in{'m'}";
#コマンド状態配列格納用
					$cdw_no = "";
#コマンド名
					$cdw_name = "$tyouhei_c（$in{'num'}） ";
#コマンド内容
					$cdw_op0 = "";
					$cdw_op1 = "$in{'type'}";
					$cdw_op2 = "$tyouhei_kazu";
					$cdw_op3 = "";
					$cdw_op4 = "";
#コマンド区分１（基礎0内政1軍事2商人3諜略4鍛錬5移動6その他9）
					$cdw_type1 = 2;
#コマンド区分２（資金固定0・国威依存変動1）
					$cdw_type2 = 0;
#コマンド区分２（？）
					$cdw_type3 = "";
#実行速度（固定0・武将移動依存1・兵士移動依存2）
					$cdw_optts = 0;
#コマンド入力時間（バグ調査用）
					$cdw_opttw = $tt;
#コマンド入力拡張（アレンジAIPLファイル読み込み）
					$cdw_ai = "";
#コマンドループ自動入力フラグ（切り替え判断基準0は切り替え無し）
					$cdw_r_f = 0;
#コマンドループ自動入力終了位置（切り替え範囲）
					$cdw_r_endno = 0;
#コマンドループ自動入力ループタイプ（使用するストック）
					$cdw_r_type = 0;
#コマンドループ自動入力拡張（ループアレンジAIPLファイル読み込み）
					$cdw_r_ai = "";

require "./$mpg_r/sub_db/cdw.pl";



	&CD_END("コマンドNo:$noに「$cdw_name」を入力しました。","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"submit\" value=\"ＯＫ\" />","");#CD_END




	exit;

}
1;