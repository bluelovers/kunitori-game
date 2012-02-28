
sub MOVE {

	if($in{'no'} eq ""){&ER1("コマンドNoを入力してください。");}
	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

	foreach(@no){
		$no_list .= "<input type=\"hidden\" name=\".no.\" value=\"$_\" />"
	}


$in{'hou'}=int($in{'hou'});
$hou_dc[$in{'hou'}]=" selected=\"selected\"";




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
$add_kl.="<option value=\"0\">$k_name_d[0]";
#$add_bl.="<optgroup label=\"$k_name_d[0] \">";

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
$add_bl.="<option value=\"$uni_id\">$uni_name（忠誠：$uni_tyuusei）";
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
$add_kl.="<option value=\"$_\">$k_name_d[$_]";
#$add_bl.="<optgroup label=\"$k_name_d[$_] \">";

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
$add_bl.="<option value=\"$uni_id\">$uni_name（忠誠：$uni_tyuusei）";
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
$datev2.="<script language=javascript><!--
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
		if (btyuuseitxt != \"\"){
	 btyuuseitxt = parseInt(btyuuseitxt);
	 str = parseInt(tyuuseiitem[n][i]);
			if (str > btyuuseitxt){
			f = 1;
			}
		}
	btouketutxt = document.kensaku2.elements[4].value;
		if (btouketutxt != 0){
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
《 登 用 》<br /><br />密書を送り、他の国の武将を登用します。<br />義理が30以下の武将は登用できません。<br />登用の密書を送るには金100必要になります。
<br /><br />
密書の文字数制限は全角100字以内です。</span>
</td></tr></table>
<hr />
<form action=\"$COMMAND\" name=\"kensaku2\" method=\"post\" utn=\"utn\"><div>
<input type=\"submit\" value=\"リロード\" />
<hr />
<table>
<tr><td width=\"400\">必要条件を入力した上で武将名を選択してください<br />検索を利用する際はjavascriptオン必須です(WinIE6.0で動作確認)</td></tr><tr><td>
【相手の名前】
<input type=\"text\" name=\".mkj.\" value=\"$in{'mkj'}\" size=\"12\" onChange=\"kunilno();\"></td></tr><tr><td>
【資産○以下】
<input type=\"text\" name=\".sisan.\" value=\"$in{'sisan'}\" size=\"12\" onChange=\"kunilno();\"></td></tr><tr><td>
【忠誠○以下】
<input type=\"text\" name=\".tiu.\" value=\"$in{'tiu'}\" size=\"3\" onChange=\"kunilno();\"></td>
</tr><tr><td>
【凍結ターン】
<select name=.hou. onChange="kunilno()">
<option value=10$hou_dc[1]>凍結ターン進み具合10ターン以内
<option value=0$hou_dc[0]>全武将</select>
</td></tr></table>
<input type=\"hidden\" name=\".m.\" value=\"touyou1\"><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".kai.\" value=\"1\">$no_list

</div></form>

<form action=\"$COMMAND\" method=\"post\" name=\"kensaku\" utn=\"utn\"><div>

<table>
<tr><td width=\"150\">国選択</td><td width=\"400\">武将選択</td></tr>
<tr><td>
<select name=\".kuni.\" size=\"10\" onChange=\"kunilno(this.selectedIndex);\">
<option value=\"all\" selected=\"selected\">全武将
$add_kl
</select></td><td>
<select name=\".mes_id.\" size=\"10\" onChange=\"blno(this.selectedIndex);\">
$add_bl
</select>
</td></tr><tr><td>
</td>
<td><input type=\"button\" onclick=\"bjump();\" name=\".bldb.\" value=\"武将名未選択です\" /></td></tr></table>
<br />
<input type=\"hidden\" name=\".bed.\" value=\"0\" />
相手先ID：<input type=\"text\" name=\".mes_id2.\" size=\"12\" />密書：<input type=\"text\" name=\".mes.\" size=\"60\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"touyou2\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />$no_list
<input type=\"submit\" value=\"実行\" /></div></form>


<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"戻る\" /></div></form>

PRI

	&FOOTER;

	exit;

}
1;