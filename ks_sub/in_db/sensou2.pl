
sub MOVE {

if(!-e "./w_db/tosi_db/$in{'num'}.cgi") { &ER1("都市の入力が不正です。"); }
	$in{'sen'} = int(abs($in{'sen'}));
	$in{'bsen'} = int(abs($in{'bsen'}));
	$senp=$in{'sen'};
	if($in{'sen'} > 5){$senp=0;}
	if($in{'no'} eq ""){&ER1("コマンドNoを入力してください。");}
	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
require "./$mpg_r/sub_db/tw.pl";
	$hit=0;

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
	if(int($in{'sen'} / 10) eq "9" and $k_kokka_keitai{$fk_id}){$in{'bsen'} = 1;$in{'num'} = $k_outo{$fk_id};$kougeki_m_kunino = $t_kunino{$k_outo{$fk_id}};$zokucome = "";$come = "（城内";$senp=90;
	}elsif(int($in{'sen'} / 10) eq "8" and !$k_kokka_keitai{$fk_id}){$in{'rty'} = 999;$in{'bsen'} = 1;$kougeki_m_kunino = $t_zokuno{$in{'num'}};$zokucome = "の賊砦";$come = "（賊砦拠点⇒賊砦";$senp=80;
	}else{
$kougeki_m_kunino = $t_kunino{$in{'num'}};
	if($in{'rty'} eq "1"){
		$come = "（山林⇒山砦⇒拠点⇒";
		$rty2 = 11;
	}elsif($in{'rty'} eq "2"){
		$come = "（山道⇒山砦⇒拠点⇒";
		$rty2 = 11;
	}elsif($in{'rty'} eq "3"){
		$come = "（川原⇒平砦⇒拠点⇒";
		$rty2 = 12;
	}elsif($in{'rty'} eq "4"){
		$come = "（草原⇒平砦⇒拠点⇒";
		$rty2 = 12;
	}elsif($in{'rty'} eq "5"){
		$come = "（林道⇒森砦⇒拠点⇒";
		$rty2 = 13;
	}elsif($in{'rty'} eq "6"){
		$come = "（森林⇒森砦⇒拠点⇒";
		$rty2 = 13;
	}else{
		$come = "（天運⇒天運⇒拠点⇒";
		$in{'rty'} = 0;

	}

	if($in{'rts'} eq "21"){
		$come .= "西門";
		$rts1 = 24;
		$rts2 = 22;
	}elsif($in{'rts'} eq "22"){
		$come .= "北門";
		$rts1 = 21;
		$rts2 = 23;
	}elsif($in{'rts'} eq "23"){
		$come .= "東門";
		$rts1 = 22;
		$rts2 = 24;
	}elsif($in{'rts'} eq "24"){
		$come .= "南門";
		$rts1 = 23;
		$rts2 = 21;
	}else{
		$come .= "天運";
		$in{'rts'} = 0;
	}

	}




	if($in{'num'} eq ""){&ER1("$in{'sen'}攻撃先が入力されていません。");}

		$sokudo_type = 10;
	if($p_heisyu{$f_id} eq "45"){
		$sokudo_type = 20;
	}
		$sokudo_type = int(abs($in{'yosoku'}));
	if($sokudo_type > 2){
		$sokudo_type = 2;
	}
		$comey{2} = "勝";
		$comey{1} = "負";
		$comey{0} = "";

require "./$mpg_r/sub_db/neko$KEITAI_T.pl";
&TAJYUU_HANTEI;

					$cdw_id = "$in{'m'}";
#コマンド状態配列格納用
					$cdw_no = "$in{'rty'},$rty2,20,$in{'rts'},$rts1,$rts2";
#コマンド名
					$cdw_name = "$t_name[$in{'num'}]へ出兵$come＠$setum{$senp}$bsirei[$in{'bsen'}]）$comey{$sokudo_type}";
#コマンド内容
					$cdw_op0 = "";
					$cdw_op1 = "$senp";
					$cdw_op2 = "$in{'num'}";
					$cdw_op3 = "$in{'bsen'}";
					$cdw_op4 = "$kougeki_m_kunino";
#コマンド区分１（基礎0内政1軍事2商人3諜略4鍛錬5移動6その他9）
					$cdw_type1 = 2;
#コマンド区分２（資金固定0・国威依存変動1）
					$cdw_type2 = 0;
#コマンド区分２（？）
					$cdw_type3 = "";
#実行速度（固定0・武将移動依存1・兵士移動依存2）
					$cdw_optts = $sokudo_type;
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