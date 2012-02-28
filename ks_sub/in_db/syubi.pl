
sub MOVE {

	if($in{'no'} eq ""){&ER1("コマンドNoを入力してください。");}

	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
	if($k_kokka_keitai{$fk_id}){
$in{'rtb'} = 999;
	}
require "./$mpg_r/sub_db/tw.pl";
		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");

	if($in{'rtb'} eq ""){

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
		$cd_op0n="最終移動予約先の都市・";
		$cd_op0n2="最終移動予約先";
		}else{
		$cd_op0n2="現在地";
$cd_op0z = $p_taizai_iti{$f_id};
		}


	foreach(@no){
		$no_list .= "<input type=\"hidden\" name=\".no.\" value=\"$_\" />"
	}


				
	&HEADER;
	$no = $in{'no'} + 1;

	&IMG_SAKUSEI("$IMG{0}/bbs0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";

<table class=\"bgc414141\" width=\"600\"><tr><td class=\"bgcFFFFFF\" width=\"100\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"490\">
<span class=\"cFFFFFF\">
《 城の守備に就く 》<br /><br />
<br /><br />「$cd_op0n$t_name{$ft_id}」のどの防衛地点を守備しますか？</span>
</td></tr></table>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />

$no_list
<input type=\"hidden\" name=\".m.\" value=\"syubi\"><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<select name=\".rtb.\">
<option value=\"0\">運を天に任せる</option>
<optgroup label=\"国境\">
<option value=\"1\">山林</option>
<option value=\"2\">山道</option>
<option value=\"3\">川原沿い</option>
<option value=\"4\">草原</option>
<option value=\"5\">林道</option>
<option value=\"6\">森林</option>
</optgroup>
<optgroup label=\"砦\">
<option value=\"11\">山岳砦</option>
<option value=\"12\">平地砦</option>
<option value=\"13\">森林砦</option>
</optgroup>
<optgroup label=\"拠点\">
<option value=\"20\">郊外防衛拠点</option>
</optgroup>
<optgroup label=\"城門\">
<option value=\"21\">西門</option>
<option value=\"22\">北門</option>
<option value=\"23\">東門</option>
<option value=\"24\">南門</option>
</optgroup>
</select>
<select name=\".bsen.\">
<option value=\"0\">隊長の指示に従う</option>
<option value=\"1\">この戦法で固定</option></select>
<input type=\"submit\" value=\"守備に就く\" /></div></form>


<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"戻る\" /></div></form><br />
<object data=\"./w_db/map.html\" type=\"text/html\" width=\"400\" height=\"515\">オブジェクトタグに対応していない方は下のリンクで新しい窓を開いてください。<br /><a href=\"./w_db/map.html\" target=\"_blank\">勢力図</a></object>

PRI

	&FOOTER;

	}else{

$bsirei[0]="/指令受入";
$bsirei[1]="/作戦固定";
require "./$mpg_r/sub_db/tw.pl";
	if($in{'rtb'} eq "11"){
		$come = "（山砦）";
	}elsif($in{'rtb'} eq "12"){
		$come = "（平砦）";
	}elsif($in{'rtb'} eq "13"){
		$come = "（森砦）";
	}elsif($in{'rtb'} eq "21"){
		$come = "（西門）";
	}elsif($in{'rtb'} eq "22"){
		$come = "（北門）";
	}elsif($in{'rtb'} eq "23"){
		$come = "（東門）";
	}elsif($in{'rtb'} eq "24"){
		$come = "（南門）";
	}elsif($in{'rtb'} eq "20"){
		$come = "（拠点）";
	}elsif($in{'rtb'} eq "1"){
		$come = "（山林）";
	}elsif($in{'rtb'} eq "2"){
		$come = "（山道）";
	}elsif($in{'rtb'} eq "3"){
		$come = "（川原）";
	}elsif($in{'rtb'} eq "4"){
		$come = "（草原）";
	}elsif($in{'rtb'} eq "5"){
		$come = "（林道）";
	}elsif($in{'rtb'} eq "6"){
		$come = "（森林）";
	}elsif($in{'rtb'} eq "999"){
		$come = "（賊砦）";
	}else{
		$come = "（天運）";
		$in{'rtb'} = 0;

	}
	&P_OPEN;


require "./$mpg_r/sub_db/neko$KEITAI_T.pl";
&TAJYUU_HANTEI;


					$cdw_id = "$in{'m'}";
#コマンド状態配列格納用
					$cdw_no = "";
#コマンド名
					$cdw_name = "滞在都市$comeを守備$bsirei[$in{'bsen'}] ";
#コマンド内容
					$cdw_op0 = "";
					$cdw_op1 = "$in{'rtb'}";
					$cdw_op2 = "";
					$cdw_op3 = "$in{'bsen'}";
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

	}

	exit;

}
1;