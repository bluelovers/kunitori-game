
sub MOVE {
	&P_OPEN;

	open(IN,"./p_db/act_cd/$f_id.cgi");
	@CD_DB = <IN>;
	close(IN);
$KAZU_ACT_CD=@CD_DB;
			$MAX_ACT_CD = 10;
	if($in{'cdm'} and $KAZU_ACT_CD){
$in{'no'}=int($in{'no'});
					if($in{'cdm'} eq "del"){
	foreach (@no) {
$add_no=int($_);
splice(@CD_DB , $add_no, 1);
	}

					}elsif($in{'cdm'} eq "sounyuu"){
	foreach (@no) {
$add_no=int($_);
splice(@CD_DB , $add_no, 0 ,"sounyuu<>0<>アクティブコマンド挿入予約<><>$f_id<><><><><><><><><><><>\n");
	}
splice(@CD_DB , $MAX_ACT_CD);
					}elsif($in{'cdm'} eq "motikosi"){
	foreach (@no) {
$add_no=int($_);
splice(@CD_DB , $add_no, 0 ,"motikosi<>1<>次の判定に持越し<><>$f_id<><><><><><><><><><><>\n");
	}
splice(@CD_DB , $MAX_ACT_CD);
					}elsif($in{'cdm'} eq "horyuu"){
	foreach (@no) {
$add_no=int($_);
splice(@CD_DB , $add_no, 0 ,"horyuu<>2<>以後をしばらく保留<><>$f_id<><><><><><><><><><><>\n");
	}
splice(@CD_DB , $MAX_ACT_CD);
					}elsif($in{'cdm'} eq "ue"){
@no = grep( !/^0/, @no);
@no = sort {$b <=> $a} @no;
	foreach (@no) {
$add_no=int($_);
splice(@CD_DB , $add_no - 1, 0, $CD_DB[$add_no]);
splice(@CD_DB , $add_no + 1, 1);
	}
					}elsif($in{'cdm'} eq "sita"){
@no = grep( !/$MAX_ACT_CD/, @no);
	foreach (@no) {
$add_no=int($_);
splice(@CD_DB , $add_no + 2, 0, $CD_DB[$add_no]);
splice(@CD_DB , $add_no , 1);
	}
					}elsif($in{'cdm'} eq "top"){
@no = sort {$b <=> $a} @no;
	foreach (@no) {
$add_no=int($_);
unshift(@CD_DB, $CD_DB[$add_no]);
splice(@CD_DB , $add_no + 1, 1);
	}
					}elsif($in{'cdm'} eq "bottom"){
@no = sort {$b <=> $a} @no;
	foreach (@no) {
$add_no=int($_);
push(@CD_DB, $CD_DB[$add_no]);
splice(@CD_DB , $add_no , 1);
	}
					}

	open(OUT,">./p_db/act_cd/$f_id.cgi");
	print OUT @CD_DB;
	close(OUT);
	}
	if($in{'i'} eq "i"){
	$come_cdl = <<"PRI";
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=\".m.\"><option value=\"$in{'m'}\">リロード</option><option value=\"i_cd\">コマンド</option><option value=\"i_s\">情報</option><option value=\"i_m\">手紙</option><option value=\"ikaigi\">門下省</option><option value="sirei">中書省</option><option value="ru-ru">尚書省</option><option value="ilog">過去ログ</option><option value="itemo">競売会場</option><option value="item">アイテム管理</option><option value="senpou">戦法設定</option><option value="gundan">軍団編成</option><option value="butai">部隊編成</option><option value="idkanri">LoginID管理</option><option value="come">コメント編集</option><option value="bcome">自己PR編集</option><option value="adcome">広告/OPT編集</option><option value="yakuba">国取役場</option><option value="tyuusei">忠誠度変更</option><option value="gazou">画像変更</option><option value="act_cd">アクティブC変更</option></select><input type=\"submit\" value=\"画面移動\" /><input type=\"hidden\" name=\".i.\" value=\"i\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /></div></form>

PRI
	}
	&HEADER;
print <<"PRI";
$come_cdl
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<table class=\"kbgcb0 tlauto\" width=\"350\">
<tr class=\"kbgcb0\"><td class=\"txth\" colspan=\"4\"><span class=\"kcc0\">アクティブコマンド編集（5～10分間隔で稼動）</span></td></tr>


<tr class=\"kbgcc0\"><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".m.\" value=\"act_cd\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<td colspan=\"4\" class=\"txtc\">
<select name=\".no.\" size=\"10\" multiple=\"multiple\">
PRI

	for($i=0;$i<$MAX_ACT_CD;$i++){
		$no = $i+1;
		($acd_id{$facd_id}[$a_a_no],$acd_no{$facd_id}[$a_a_no],$acd_name{$facd_id}[$a_a_no],$acd_tt{$facd_id}[$a_a_no],$acd_p_id{$facd_id}[$a_a_no],$acd_e_id{$facd_id}[$a_a_no],$acd_sub1{$facd_id}[$a_a_no],$acd_sub2{$facd_id}[$a_a_no],$acd_sub3{$facd_id}[$a_a_no],$acd_sub4{$facd_id}[$a_a_no],$acd_sub5{$facd_id}[$a_a_no],$acd_sub6{$facd_id}[$a_a_no],$acd_sub7{$facd_id}[$a_a_no],$acd_sub8{$facd_id}[$a_a_no],$acd_sub9{$facd_id}[$a_a_no]) = split(/<>/,$CD_DB[$i]);
	$no = sprintf("%03d", $no);
		print "<option value=\"$i\">$no\ $acd_name{$facd_id}[$a_a_no] </option>";

	}


print <<"PRI";
</select>

<select name=\".cdm.\" size=\"10\">
<optgroup label=\"コマンド編集\">

<option value=\"del\">選択したコマンドを消去</option>
<option value=\"sounyuu\">この上にコマンドを挿入予約</option>
<option value=\"motikosi\">以後を次の判定に持越し</option>
<option value=\"horyuu\">以後をしばらく保留</option>
<option value=\"ue\">選択したコマンドを一つ上に</option>
<option value=\"sita\">選択したコマンドを一つ下に</option>
<option value=\"top\">選択したコマンドを先頭に</option>
<option value=\"bottom\">選択したコマンドを最後尾に</option>
</optgroup>
</select><br /><br /><input type=\"submit\" value=\"編集実行\" />
<div class=\"txtl\">※Noと編集内容を選択し『編集実行』を押して下さい
<br />※ctrlキーを押しながら連続Clickで実施期間の複数選択可\</div>
</td></tr>
</table></div></form>

PRI
	&FOOTER;
	exit;

}
1;