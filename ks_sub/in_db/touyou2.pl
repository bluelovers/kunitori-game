
sub MOVE {


	&TT_GET;

	if($in{'no'} eq ""){&ER1("コマンドNo:が入力されていません。");}
	if($in{'mes_id2'}) {
$in{'mes_id'}=$in{'mes_id2'};
	}
	if($in{'mes_id'} eq ""){&ER1("相手が入力されていません。");}
	&MOJISUU($in{'mes'},200);
	if($mojisuu_o) { &ER1("手短に用件を伝えてください。登用文。$mojisuu_re"); }

	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
	if($p_syoji_kin{$f_id} < 100){&ER1("金が足りません。");}

	$num = $in{'mes_id'};


	if(!-e "./p_db/p/$num.cgi"){
&ER1("そのキャラは存在しません。$num")
	}
	$e_id=$num;
	&P_READ("p","$e_id","$e_id");

	$add_mes = "<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$p_kunino{$f_id}\" target=\"_blank\"><span class=\"cFFFFFF\">$k_name{$fk_id}</span></a>の使者";

require "./$mpg_r/sub_db/neko$KEITAI_T.pl";
&TAJYUU_HANTEI;
					$cdw_id = "$in{'m'}";
#コマンド状態配列格納用
					$cdw_no = "$p_name{$e_id}";
#コマンド名
					$cdw_name = "$p_name{$e_id}を登用 ";
#コマンド内容
					$cdw_op0 = "";
					$cdw_op1 = "$add_mes:$in{'mes'}$tt_date";
					$cdw_op2 = "$in{'mes_id'}";
					$cdw_op3 = "$p_kunino{$f_id}";
					$cdw_op4 = "";
#コマンド区分１（基礎0内政1軍事2商人3諜略4鍛錬5移動6その他9）
					$cdw_type1 = 4;
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