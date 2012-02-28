
sub MOVE {

	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
	&TT_GET;



$hou_dc[$in{'hou'}]=" selected=\"selected\"";

$in{'bed'}=int($in{'bed'});
$in{'hou'}=int($in{'hou'});

###############


$add_kl.="<option value=\"bk\">お気に入り";
###############

	open(IN,"./w_db/kuni_l/l0.cgi");
	@KUNI_DB = <IN>;
	close(IN);
		if (@KUNI_DB){
$datev2id.="	[";
$datev2name.="	[";
$datev2touketu.="	[";
$datev2sisan.="	[";
$datev2tyuusei.="	[";
$add_kl.="<option value=0>$k_name_d[0]";
#$add_bl.="<optgroup label=$k_name_d[0] >";

		foreach(@KUNI_DB){
		($uni_id,$uni_name,$uni_habatuno,$uni_mikoudou_t,$uni_sousisan,$uni_tyuusei)=split(/<>/);
$add_okiniiri{$uni_id}=$_;
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
$add_bl2.="<option value=\"$uni_id\">$uni_name（忠誠：$uni_tyuusei）";
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


################
	foreach(@k_seizon_l){
	open(IN,"./w_db/kuni_l/l$_.cgi");
	@KUNI_DB = <IN>;
	close(IN);
		if (@KUNI_DB){
$datev2id.="	[";
$datev2name.="	[";
$datev2touketu.="	[";
$datev2sisan.="	[";
$datev2tyuusei.="	[";
$add_kl.="<option value=\"$_\">$k_name_d[$_]";
#$add_bl.="<optgroup label=\"$k_name_d[$_] \">";

		foreach(@KUNI_DB){
		($uni_id,$uni_name,$uni_habatuno,$uni_mikoudou_t,$uni_sousisan,$uni_tyuusei)=split(/<>/);
$add_okiniiri{$uni_id}=$_;

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
$add_bl3.="<option value=\"$uni_id\">$uni_name（忠誠：$uni_tyuusei）";
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
	}

############

$datev2bk_id.="	[";
$datev2bk_name.="	[";
$datev2bk_touketu.="	[";
$datev2bk_sisan.="	[";
$datev2bk_tyuusei.="	[";
	open(IN,"./w_db/guest/msbk_$f_id.cgi");
	@add_list = <IN>;
	close(IN);
$okiniirikazu =0;
		if (@add_list){

	foreach(@add_list){
		($mdsid,$mdsname) = split(/<>/);
		if ($add_okiniiri{$mdsid}){
		($uni_id,$uni_name,$uni_habatuno,$uni_mikoudou_t,$uni_sousisan,$uni_tyuusei) = split(/<>/,$add_okiniiri{$mdsid});
$datev2bk_id.="\"$uni_id\",";
$datev2bk_id2.="\"$uni_id\",";
$datev2bk_touketu.="$uni_mikoudou_t,";
$datev2bk_touketu2.="$uni_mikoudou_t,";
$datev2bk_sisan.="$uni_sousisan,";
$datev2bk_sisan2.="$uni_sousisan,";
$datev2bk_tyuusei.="$uni_tyuusei,";
$datev2bk_tyuusei2.="$uni_tyuusei,";
$datev2bk_name.="\"$uni_name（忠誠：$uni_tyuusei）\",";
$datev2bk_name2.="\"$uni_name（忠誠：$uni_tyuusei）\",";
$add_bl1.="<option value=\"$uni_id\">$uni_name（忠誠：$uni_tyuusei）";
$okiniirikazu ++;
		}
	}
	chop($datev2bk_name);
	chop($datev2bk_id);
	chop($datev2bk_touketu);
	chop($datev2bk_sisan);
	chop($datev2bk_tyuusei);
		}
$datev2bk_id.="],";
$datev2bk_name.="],";
$datev2bk_touketu.="],";
$datev2bk_sisan.="],";
$datev2bk_tyuusei.="],";
############
$datev2id2="	\[$datev2bk_id2$datev2id2";
$datev2touketu2="	\[$datev2bk_touketu2$datev2touketu2";
$datev2sisan2="\[$datev2bk_sisan2$datev2sisan2";
$datev2tyuusei2="	\[$datev2bk_tyuusei2$datev2tyuusei2";
$datev2name2="\[$datev2bk_name2$datev2name2";


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


$add_bl="$add_bl1$add_bl2$add_bl3";
############
$datev2.="<script language=javascript><!--
litem = [ $datev2name2$datev2bk_name$datev2name ];sitem = [ $datev2id2$datev2bk_id$datev2id ];sisanitem = [ $datev2sisan2$datev2bk_sisan$datev2sisan ];tyuuseiitem = [ $datev2tyuusei2$datev2bk_tyuusei$datev2tyuusei ];touketuitem = [ $datev2touketu2$datev2bk_touketu$datev2touketu ];";
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
			document.kensaku.elements[4].value = sitem[wk][wb];
			document.kensaku.elements[2].value = litem[wk][wb] + \"・情報閲覧\";
			okiniiricome = '登録';
			if (wk < 2 && wb < $okiniirikazu){
			okiniiricome = '登録解除';
			}
			document.okiniiri.elements[0].value = sitem[wk][wb];
			document.okiniiri.elements[1].value = litem[wk][wb] + \"さんをお気に入り\" + okiniiricome;

			document.kyozetu.elements[0].value = sitem[wk][wb];
			document.kyozetu.elements[1].value = litem[wk][wb] + \"さんに関する受信拒否設定を変更\";
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

	&IMG_SAKUSEI("$IMG{0}/bbs0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	&HEADER;

	print <<"PRI";

<table class=\"bgc414141\" width=\"600\"><tr><td class=\"bgcFFFFFF\" width=\"100\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"490\">
<span class=\"cFFFFFF\">
《 個人宛手紙・武将検索 》<br /><br />他の武将に手紙を送ることができます。<br />必要条件を入力した上で武将名を選択してください<br />検索を利用する際はjavascriptオン必須です(WinIE6.0で動作確認)<br />検索が正常動作しない時は時間を置いた後リロードしてみて下さい。</span>
</td></tr></table>
<hr />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"messe\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value="手紙閲覧に戻る" /></div></form>


<hr />
<form action=\"$COMMAND\" name=\"kensaku2\" method=\"post\" utn=\"utn\"><div>
<input type=\"submit\" value=\"リロード\" />
<hr />
<table width=\"400\">

<tr><td>
【相手の名前】
<input type=\"text\" name=\".mkj.\" value=\"$in{'mkj'}\" size=\"12\" onChange=\"kunilno();\"></td></tr>
<tr><td colspan=\"2\">
【資産○以下】
<input type=\"text\" name=\".sisan.\" value=\"$in{'sisan'}\" size=\"12\" onChange=\"kunilno();\"></td></tr>
<tr><td colspan=\"2\">
【忠誠○以下】
<input type=\"text\" name=\".tiu.\" value=\"$in{'tiu'}\" size=\"3\" onChange=\"kunilno();\"></td>
</tr><tr><td colspan=\"2\">
【凍結ターン】
<select name=\".hou.\" onChange=\"kunilno()\">
<option value=\"10\"$hou_dc[1]>凍結ターン進み具合10ターン以内
<option value=\"0\"$hou_dc[0]>全武将</select>
<input type=\"hidden\" name=\".m.\" value=\"tegami\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".kai.\" value=\"1\" />
</tr></table></div></form>
<form action=\"$COMMAND\" method=\"post\" name=kensaku utn=\"utn\"><div>

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
<td><input type=\"button\" onclick=\"bjump();\" name=\"bldb\" value=\"武将名未選択です\" /></td></tr></table>
<input type=\"hidden\" name=\".bed.\" value=\"0\"><br />
相手先ID：<input type=\"text\" name=\".mes_id2.\" size=\"12\" />内容：<input type=\"text\" name=\".naiyou.\" size=\"65\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" />
<input type=\"hidden\" name=\".m.\" value=\"msend\" /><input type=\"submit\" value=\"手紙を送る\" /><br />
</div></form>
<hr />

<form action=\"$COMMAND\" method=\"post\" name=okiniiri utn=\"utn\"><div>
<input type=\"hidden\" name=\".mes_id2.\" value=\"\"><input type=\"submit\" value=\"武将名未選択です\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" />
<input type=\"hidden\" name=\".m.\" value=\"messeb\" /><input type=\"hidden\" name=\".addm.\" value=\"tegami\" />
</div></form><hr />
<form action=\"$COMMAND\" method=\"post\" name=\"kyozetu\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".mes_id2.\" value=\"\"><input type=\"submit\" value=\"武将名未選択です\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".name.\" value=\"$p_name{$f_id}\" />
<input type=\"hidden\" name=\".m.\" value=\"kousinmd\" /><input type=\"hidden\" name=\".addm.\" value=\"tegami\" />
</div></form>
PRI
	&FOOTER;
	exit;

}
1;