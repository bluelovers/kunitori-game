
sub MOVE {

	if($in{'no'} eq ""){&ER1("コマンドNoを入力してください。");}
	if($in{'num'} eq ""){&ER1("取引数が入力されていません。");}
	if($in{'type2'} eq ""){&ER1("売買方法が入力されていません。");}
	if($in{'type'} eq ""){&ER1("売りor買いが入力されていません。");}
	if($in{'num'} =~ m/[^0-9]/){&ER1("不正入力です。"); }
	&P_OPEN;

		$in{'num'} = abs(int($in{'num'}));

	if($in{'type'}){
		$add_name = "米買い：米を$in{'num'}買う";
	}else{
		$add_name = "米売り：金を$in{'num'}入手";
	}

require "./$mpg_r/sub_db/neko$KEITAI_T.pl";
&TAJYUU_HANTEI;
					$cdw_id = "$in{'m'}";
#コマンド状態配列格納用
					$cdw_no = "$in{'type'}";
#コマンド名
					$cdw_name = "$add_name";
#コマンド内容
					$cdw_op0 = "";
					$cdw_op1 = "$in{'type2'}";
					$cdw_op2 = "$in{'num'}";
					$cdw_op3 = "";
					$cdw_op4 = "";
#コマンド区分１（基礎0内政1軍事2商人3諜略4鍛錬5移動6その他9）
					$cdw_type1 = 3;
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