
sub MOVE {

	if($in{'no'} eq ""){&ER1("コマンドNoを入力してください。");}
	&P_OPEN;

		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");

	foreach(@no){
		$no_list .= "<input type=\"hidden\" name=\".no.\" value=\"$_\" />"
	}
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
		if($cd_op0z ne ""){

		$ft_id = $cd_op0z;
	&T_OPEN("tosi_db","$ft_id","$ft_id");
		}

		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

	if(!$t_zokuno{$ft_id} or $in{'k_no'}){
	if(!$in{'k_no'}){$in{'k_no'}=$t_kunino{$ft_id};
	}


require "./$mpg_r/sub_db/neko$KEITAI_T.pl";
&TAJYUU_HANTEI;

					$cdw_id = "$in{'m'}";
#コマンド状態配列格納用
					$cdw_no = "";
#コマンド名
					$cdw_name = "$k_name_d[$in{'k_no'}]へ仕官 ";
#コマンド内容
					$cdw_op0 = "";
					$cdw_op1 = "";
					$cdw_op2 = "$in{'k_no'}";
					$cdw_op3 = "";
					$cdw_op4 = "";
#コマンド区分１（基礎0内政1軍事2商人3諜略4鍛錬5移動6その他9）
					$cdw_type1 = 6;
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
	&HEADER;

	print <<"PRI";
<hr /><span class=\"fs4\">仕官先を選択してください。</span><br /><br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"sikan\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />$no_list
<select name=\".k_no.\" size=\"5\">
<option value=\"$t_kunino{$ft_id}\">$k_name_d[$t_kunino[$ft_id]]（$t_name{$ft_id}の城）へ</option>
<option value=\"$t_zokuno{$ft_id}\">$k_name_d[$t_zokuno[$ft_id]]（$t_name{$ft_id}の賊砦）へ</option></select>
<input type=\"submit\" value=\"仕官\" /></div></form>
PRI

	&FOOTER;

	exit;

}
1;