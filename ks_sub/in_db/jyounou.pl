
sub MOVE {

	if($in{'no'} eq ""){&ER1("コマンドNoを入力してください。");}
	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

$in{'hou'}=int($in{'hou'});
$hou_dc[$in{'hou'}]=" selected=\"selected\"";
	$jyounou_max = int($p_syoji_kin{$f_id} * 0.3);
	if(!$in{'gsnum'}) {

		if(!$in{'m'} and $in{'kai'} ne "") {
	open(IN,"./w_db/busyoul.cgi");
	@CL_DATA = <IN>;
	close(IN);
	 	}
	foreach(@no){
		$no_list .= "<input type=\"hidden\" name=\".no.\" value=\"$_\" />"
	}




$in{'bed'}=int($in{'bed'});

$datev2id2.="	[";
$datev2name2.="	[";
$datev2touketu2.="	[";
$datev2sisan2.="	[";
$datev2tyuusei2.="	[";

	open(IN,"./w_db/kuni_l/l0.cgi");
	@KUNI_DB = <IN>;
	close(IN);
		if (@KUNI_DB){
$datev2id.="	[";
$datev2name.="	[";
$datev2touketu.="	[";
$datev2sisan.="	[";
$datev2tyuusei.="	[";
$add_kl.="<option value=\"0\">$k_name_d[0]</option>";
#$add_bl.="<optgroup label=\"$k_name_d[0]\"></option>";

		foreach(@KUNI_DB){
		($uni_id,$uni_name,$uni_habatuno,$uni_mikoudou_t,$uni_sousisan,$uni_tyuusei)=split(/<>/);
$datev2id.="\"$uni_id\",";
$datev2id2.="\"$uni_id\",";
$datev2touketu.="$uni_mikoudou_t,";
$datev2touketu2.="$uni_mikoudou_t,";
$datev2sisan.="$uni_sousisan,";
$datev2sisan2.="$uni_sousisan,";
$datev2tyuusei.="$uni_tyuusei,";
$datev2tyuusei2.="$uni_tyuusei,";
$datev2name.="\"$uni_name（忠誠：$uni_tyuusei）\",";
$datev2name2.="\"$uni_name（忠誠：$uni_tyuusei）\",";
$add_bl.="<option value=\"$uni_id\">$uni_name（忠誠：$uni_tyuusei）</option>";
		}
#$add_bl.="</optgroup>";
	chop($datev2name);
	chop($datev2id);
	chop($datev2touketu);
	chop($datev2sisan);
	chop($datev2tyuusei);
$datev2id.="],";
$datev2name.="],";
$datev2touketu.="],";
$datev2sisan.="],";
$datev2tyuusei.="],";
		}

	foreach(@k_seizon_l){
#		if ($_){
	open(IN,"./w_db/kuni_l/l$_.cgi");
	@KUNI_DB = <IN>;
	close(IN);
$datev2id.="	[";
$datev2name.="	[";
$datev2touketu.="	[";
$datev2sisan.="	[";
$datev2tyuusei.="	[";
$add_kl.="<option value=\"$_\">$k_name_d[$_]</option>";
#$add_bl.="<optgroup label=\"$k_name_d[$_]\"></option>";

		foreach(@KUNI_DB){
		($uni_id,$uni_name,$uni_habatuno,$uni_mikoudou_t,$uni_sousisan,$uni_tyuusei)=split(/<>/);
$datev2id.="\"$uni_id\",";
$datev2id2.="\"$uni_id\",";
$datev2touketu.="$uni_mikoudou_t,";
$datev2touketu2.="$uni_mikoudou_t,";
$datev2sisan.="$uni_sousisan,";
$datev2sisan2.="$uni_sousisan,";
$datev2tyuusei.="$uni_tyuusei,";
$datev2tyuusei2.="$uni_tyuusei,";
$datev2name.="\"$uni_name（忠誠：$uni_tyuusei）\",";
$datev2name2.="\"$uni_name（忠誠：$uni_tyuusei）\",";
$add_bl.="<option value=\"$uni_id\">$uni_name（忠誠：$uni_tyuusei）</option>";
		}
#$add_bl.="</optgroup>";
	chop($datev2name);
	chop($datev2id);
	chop($datev2touketu);
	chop($datev2sisan);
	chop($datev2tyuusei);
$datev2id.="],";
$datev2name.="],";
$datev2touketu.="],";
$datev2sisan.="],";
$datev2tyuusei.="],";
#		}
	}

	chop($datev2id2);
$datev2id2.="],";
	chop($datev2name2);
$datev2name2.="],";
	chop($datev2touketu2);
$datev2touketu2.="],";
	chop($datev2sisan2);
$datev2sisan2.="],";
	chop($datev2tyuusei2);
$datev2tyuusei2.="],";
	chop($datev2name);
	chop($datev2id);
	chop($datev2touketu);
	chop($datev2sisan);
	chop($datev2tyuusei);
$datev2.="<script type=\"text/javascript\"><!--
litem = [ $datev2name2$datev2name ];sitem = [ $datev2id2$datev2id ];sisanitem = [ $datev2sisan2$datev2sisan ];tyuuseiitem = [ $datev2tyuusei2$datev2tyuusei ];touketuitem = [ $datev2touketu2$datev2touketu ];";
$datev2.="
function syokika(delno){
	var i;
	for (i=0; i<delno; i++){
		document.kensaku.elements[1].options[i] = null;
	}
}

function blno(blid){
			wk = document.kensaku.elements[0].selectedIndex;
			wb = document.kensaku.elements[1].selectedIndex;
			wf = document.kensaku.elements[3].value;
			if (wf>0){
			wb = kensakuno[wb];
			}
			document.kensaku.elements[2].value = litem[wk][wb] + \"・情報閲覧\";
}

function bjump(blid){
			wk = document.kensaku.elements[0].selectedIndex;
			wb = document.kensaku.elements[1].selectedIndex;
			wf = document.kensaku.elements[3].value;
			if (wf>0){
			wb = kensakuno[wb];
			}
mado = window.open(\"\",\"blw\",\"\");
			mado.location.href = \'./?.m.=p_b&amp;.id.=\' + sitem[wk][wb];

}

function kunilno(){
			var n = document.kensaku.elements[0].selectedIndex;
	optlen = document.kensaku.elements[1].options.length;
	while(optlen > 0){
		syokika(optlen);
		optlen = document.kensaku.elements[1].options.length;
	}
	
	if (litem[n].length > 0){
kensakuno = new Array();
	 z = 0;
		for (i=0; i<litem[n].length; i++){
			f = 0;
	bnametxt = document.kensaku2.elements[1].value;
		if (bnametxt != \"\"){
	 str = litem[n][i];
			if (str.indexOf(bnametxt,0) < 0){
			f = 1;
			}
		}
	bsisantxt = document.kensaku2.elements[2].value;
		if (bsisantxt != \"\"){
	 bsisantxt = parseInt(bsisantxt);
	 str = parseInt(sisanitem[n][i]);
			if (str > bsisantxt){
			f = 1;
			}
		}
	btyuuseitxt = document.kensaku2.elements[3].value;
		if (btyuuseitxt != 0){
	 btyuuseitxt = parseInt(btyuuseitxt);
	 str = parseInt(tyuuseiitem[n][i]);
			if (str > btyuuseitxt){
			f = 1;
			}
		}
	btouketutxt = document.kensaku2.elements[4].value;
		if (btouketutxt != \"\"){
	 btouketutxt = parseInt(btouketutxt);
	 str = parseInt(touketuitem[n][i]);
			if (str > btouketutxt){
			f = 1;
			}

		}
		if (f == 0){
			document.kensaku.elements[1].options[z] = new Option(litem[n][i],sitem[n][i]);
kensakuno[z] = i;
	 z ++;
		}
		}

			document.kensaku.elements[3].value = 1;
	}
}

// --></script>
";


	&HEADER;
	$no = $in{'no'} + 1;

	&IMG_SAKUSEI("$IMG{0}/bbs0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";


<table width=\"300\" class=\"kbgcb$k_iro_d{$fk_id}\">
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>所持金</td><td class=\"txth\">$p_syoji_kin{$f_id}</td><td>所持米</td><td class=\"txth\">$p_syoji_kome{$f_id}</td></tr>
</table><br /><br />
<table class=\"bgc414141\" width=\"600\"><tr><td class=\"bgcFFFFFF\" width=\"100\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"490\">
<span class=\"cFFFFFF\">
《 金納付 》<br /><br />国庫に金を納付します。
<br />納付できる最高額は金$get_sol2。納付額が多ければ稀に義理が上昇します。<br />又、納付の際に自国の他の武将を推薦することで、天子より対象武将に対し<br />報奨金が支払われることがあります。(推薦対象武将の総資産が極端に少ない時のみ)
<br />
国庫に如何ほど金を納付しますか？</span>
</td></tr></table>

<hr /><form action=\"$COMMAND\" name=kensaku2 method=\"post\" utn=\"utn\"><div>
<input type=\"submit\" value=\"リロード\" /><hr />
<table>

<tr><td width=\"400\">必要条件を入力した上で武将名を選択してください<br />検索を利用する際はjavascriptオン必須です(WinIE6.0で動作確認)</td></tr><tr><td>
【推薦相手名】
<input type=\"text\" name=\".mkj.\" value=\"$in{'mkj'}\" size=\"12\" onChange=\"kunilno();\" /></td></tr><tr><td>
【資産○以下】
<input type=\"text\" name=\".sisan.\" value=\"$in{'sisan'}\" size=\"12\" onChange=\"kunilno();\" /></td></tr><tr><td>
【忠誠○以下】
<input type=\"text\" name=\".tiu.\" value=\"$in{'tiu'}\" size=\"3\" onChange=\"kunilno();\"></td>
</tr><tr><td>
【凍結ターン】
<select name=\".hou.\" onChange=\"kunilno();\">
<option value=\"10\"$hou_dc[1]>凍結ターン進み具合10ターン以内</option>
<option value=\"0\"$hou_dc[0]>全武将</option></select>
</td></tr></table>
<input type=\"hidden\" name=\".m.\" value=\"jyounou\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".kai.\" value=\"1\" />$no_list
</div></form>
<form action=\"$COMMAND\" method=\"post\" name=kensaku utn=\"utn\"><div>


<table>
<tr><td width=\"150\">国選択</td><td width=\"400\">武将選択</td></tr>
<tr><td>
<select name=\".kuni.\" size=\"10\" onChange=\"kunilno(this.selectedIndex);\">
<option value=\"all\" selected=\"selected\">全武将</option>
$add_kl
</select></td><td>
<select name=\".mes_id.\" size=\"10\" onChange=\"blno(this.selectedIndex);\">
$add_bl
</select>
</td></tr><tr><td>
</td>
<td><input type=\"button\" onclick=\"bjump();\" name=\".bldb.\" value=\"武将名未選択です\" /></td></tr></table>
<input type=\"hidden\" name=\".bed.\" value=\"0\" />
<br />
推薦相手ID：<input type=\"text\" name=\".mes_id2.\" size=\"12\" />納付額（上限$jyounou_max）：<input type=\"text\" name=\".gsnum.\" value=\"$get_sol2\" size=\"15\" />
$no_list
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />

<input type=\"hidden\" name=\".m.\" value=\"jyounou\" />
<input type=\"submit\" value=\"納付\" /></div></form>


<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"戻る\" /></div></form>

PRI

	&FOOTER;
	}else{

	if($in{'no'} eq ""){&ER1("コマンドNoを入力してください。");}
	if($in{'gsnum'} =~ m/[^0-9]/){&ER1("不正入力です。");}
	$in{'gsnum'} = abs(int($in{'gsnum'}));
	if($in{'gsnum'}< 1000){&ER1("そんなはした金では・・。せめて金1000以上でないと逆に天子の反感を買いそうです。");}
	if($in{'gsnum'} > $jyounou_max){$in{'gsnum'} = $jyounou_max;}

	if($in{'mes_id2'}) {
$in{'mes_id'}=$in{'mes_id2'};
	}
	$num = "$in{'mes_id'}";
	$hit=0;

	if($num){
	if(!-e "./p_db/p/$num.cgi"){
&ER1("そのIDは存在しません。")
	}
	$e_id=$num;
	&P_READ("p","$e_id","$e_id");

	$kadd = "（$p_name{$e_id}を推薦）";
	if($p_id{$e_id} eq $f_id){&ER1("国庫に金を納付をするということは自らを推奨しているのと同義です。<br />コマンド入力により自分を推奨することは出来ません。");}

	}


require "./$mpg_r/sub_db/neko$KEITAI_T.pl";
&TAJYUU_HANTEI;
					$cdw_id = "$in{'m'}";
#コマンド状態配列格納用
					$cdw_no = "$p_id{$e_id}";
#コマンド名
					$cdw_name = "国庫に金$in{'gsnum'}送付$kadd";
#コマンド内容
					$cdw_op0 = "";
					$cdw_op1 = "$p_name{$e_id}";
					$cdw_op2 = "$in{'gsnum'}";
					$cdw_op3 = "$p_kunino{$f_id}";
					$cdw_op4 = "";
#コマンド区分１（基礎0内政1軍事2商人3諜略4鍛錬5移動6その他9）
					$cdw_type1 = 9;
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