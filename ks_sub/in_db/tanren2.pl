
sub MOVE {

	if($in{'no'} eq ""){&ER1("コマンドNoを入力してください。");}
	if($in{'num'} eq ""){&ER1("強化する個所が入力されていません。");}

	&P_OPEN;
	$in{'num'} = int($in{'num'});
	$in{'num2'} = int($in{'num2'});

	if($in{'num'} eq "1"){
		$a_mes = "武(強)＋率(弱)";
	}elsif($in{'num'} eq "2"){
		$a_mes = "知(強)＋率(弱)";
	}elsif($in{'num'} eq "3"){
		$a_mes = "率(強)＋武(弱)";
	}elsif($in{'num'} eq "12"){
		$a_mes = "武(強)＋知(弱)";
	}elsif($in{'num'} eq "22"){
		$a_mes = "知(強)＋武(弱)";
	}elsif($in{'num'} eq "32"){
		$a_mes = "率(強)＋知(弱)";
	}else{
		$in{'num'} = 1;
		$a_mes = "武(強)＋率(弱)";
	}
	if($in{'num2'} eq "100"){
		$a_mes .= "＆騎乗";
	}elsif($in{'num2'} eq "101"){
		$a_mes .= "＆射撃";
	}elsif($in{'num2'} eq "102"){
		$a_mes .= "＆武術";
	}elsif($in{'num2'} eq "103"){
		$a_mes .= "＆呪術";
	}elsif($in{'num2'} eq "104"){
		$a_mes .= "＆諜報";
	}elsif($in{'num2'} eq "105"){
		$a_mes .= "＆重機";
	}elsif($in{'num2'} eq "106"){
		$a_mes .= "＆調教";
	}elsif($in{'num2'} eq "107"){
		$a_mes .= "＆人望";
	}elsif($in{'num2'} eq "108"){
		$a_mes .= "＆政治";
	}elsif($in{'num2'} eq "109"){
		$a_mes .= "＆商才";
	}else{
		$in{'num2'} = 107;
		$a_mes .= "＆人望";
	}

require "./$mpg_r/sub_db/neko$KEITAI_T.pl";
&TAJYUU_HANTEI;
					$cdw_id = "$in{'m'}";
#コマンド状態配列格納用
					$cdw_no = "";
#コマンド名
					$cdw_name = "$a_mesを自己鍛錬 ";
#コマンド内容
					$cdw_op0 = "";
					$cdw_op1 = "";
					$cdw_op2 = "$in{'num'}";
					$cdw_op3 = "$in{'num2'}";
					$cdw_op4 = "";
#コマンド区分１（基礎0内政1軍事2商人3諜略4鍛錬5移動6その他9）
					$cdw_type1 = 5;
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