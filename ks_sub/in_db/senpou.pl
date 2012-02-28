
sub MOVE {

require "./$mpg_r/sub_db/it.pl";
	&P_OPEN;
		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
require "./$mpg_r/sub_db/minzoku.pl";

	if($in{'i'} eq "i"){
	$come_cdl = <<"PRI";
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=\".m.\"><option value=\"$in{'m'}\">リロード</option><option value=\"i_cd\">コマンド</option><option value=\"i_s\">情報</option><option value=\"i_m\">手紙</option><option value=\"ikaigi\">門下省</option><option value="sirei">中書省</option><option value="ru-ru">尚書省</option><option value="ilog">過去ログ</option><option value="itemo">競売会場</option><option value="item">アイテム管理</option><option value="senpou">戦法設定</option><option value="gundan">軍団編成</option><option value="butai">部隊編成</option><option value="idkanri">LoginID管理</option><option value="come">コメント編集</option><option value="bcome">自己PR編集</option><option value="adcome">広告/OPT編集</option><option value="yakuba">国取役場</option><option value="tyuusei">忠誠度変更</option><option value="gazou">画像変更</option><option value="act_cd">アクティブC変更</option></select><input type=\"submit\" value=\"画面移動\" /><input type=\"hidden\" name=\".i.\" value=\"i\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /></div></form>

PRI
	}

		$come1 = "";
		$add_senpou_zc1 = 0;
		foreach(@BUKOUGUN){
		$come1 .= "<option value=\"$add_senpou_zc1\">$_</option>";
		$add_senpou_zc1++;
		}
		$come2 = "";
		$add_senpou_zc2 = 0;
		foreach(@HEIKOUGUN){
		$come2 .= "<option value=\"$add_senpou_zc2\">$_</option>";
		$add_senpou_zc2++;
		}
		$come3 = "";
		$add_senpou_zc3 = 0;
		foreach(@SIKIKEITAI){
		$come3 .= "<option value=\"$add_senpou_zc3\">$_</option>";
		$add_senpou_zc3++;
		}
		$come4 = "";
		$add_senpou_zc4 = 0;
		foreach(@BUHOUSIN){
		$come4 .= "<option value=\"$add_senpou_zc4\">$_</option>";
		$add_senpou_zc4++;
		}


	open(IN,"./p_db/act_cd/$f_id.cgi");
	@CD_DB = <IN>;
	close(IN);
	if($in{'no'} eq "1"){

$in{'bk'} = abs(int($in{'bk'}));
$in{'hk'} = abs(int($in{'hk'}));
$in{'sk'} = abs(int($in{'sk'}));
$in{'bh'} = abs(int($in{'bh'}));
	if ($in{'bk'} >=$add_senpou_zc1){&ER1("数値が異常です。"); }
	if ($in{'hk'} >=$add_senpou_zc2){&ER1("数値が異常です。"); }
	if ($in{'sk'} >=$add_senpou_zc3){&ER1("数値が異常です。"); }
	if ($in{'bh'} >=$add_senpou_zc4){&ER1("数値が異常です。"); }


################
$a_a_d="senpou<>0<>戦法を変更 <><>$f_id<><>$in{'bk'}<>$in{'hk'}<>$in{'sk'}<>$in{'bh'}<><><><><><>\n";
		$xyz = "戦法を将：行軍 $BUKOUGUN[$in{'bk'}]、兵：行軍 $HEIKOUGUN[$in{'hk'}]、指揮形態 $SIKIKEITAI[$in{'sk'}]、将：方針 $BUHOUSIN[$in{'bh'}]に変更 を<br />アクティブコマンドとして予約しました。";

$a_a_hit=0;
	foreach (@no) {
$a_a_no=int($_);
		($acd_id{$facd_id}[$a_a_no],$acd_no{$facd_id}[$a_a_no],$acd_name{$facd_id}[$a_a_no],$acd_tt{$facd_id}[$a_a_no],$acd_p_id{$facd_id}[$a_a_no],$acd_e_id{$facd_id}[$a_a_no],$acd_sub1{$facd_id}[$a_a_no],$acd_sub2{$facd_id}[$a_a_no],$acd_sub3{$facd_id}[$a_a_no],$acd_sub4{$facd_id}[$a_a_no],$acd_sub5{$facd_id}[$a_a_no],$acd_sub6{$facd_id}[$a_a_no],$acd_sub7{$facd_id}[$a_a_no],$acd_sub8{$facd_id}[$a_a_no],$acd_sub9{$facd_id}[$a_a_no]) = split(/<>/,$CD_DB[$a_a_no]);
		if($acd_id{$facd_id}[$a_a_no] eq "sounyuu" and !$a_a_hit){
splice(@CD_DB , $add_no, 0, "$a_a_d");
$a_a_hit++;
		}
	}
		if(!$a_a_hit){
push(@CD_DB, "$a_a_d");
		}
	open(OUT,">./p_db/act_cd/$f_id.cgi");
	print OUT @CD_DB;
	close(OUT);
################

	}
########
$a_a_no =0;
$a_a_hit =0;
			for(@CD_DB){
	($acd_id{$f_id}[$a_a_no],$acd_no{$f_id}[$a_a_no],$acd_name{$f_id}[$a_a_no],$acd_tt{$f_id}[$a_a_no],$acd_p_id{$f_id}[$a_a_no],$acd_e_id{$f_id}[$a_a_no],$acd_sub1{$f_id}[$a_a_no],$acd_sub2{$f_id}[$a_a_no],$acd_sub3{$f_id}[$a_a_no],$acd_sub4{$f_id}[$a_a_no],$acd_sub5{$f_id}[$a_a_no],$acd_sub6{$f_id}[$a_a_no],$acd_sub7{$f_id}[$a_a_no],$acd_sub8{$f_id}[$a_a_no],$acd_sub9{$f_id}[$a_a_no]) =split(/<>/,$CD_DB[$a_a_no]);

	if($acd_id{$f_id}[$a_a_no] eq "senpou"){

$in{'bk'} = $acd_sub1{$f_id}[$a_a_no];
$in{'hk'} = $acd_sub2{$f_id}[$a_a_no];
$in{'sk'} = $acd_sub3{$f_id}[$a_a_no];
$in{'bh'} = $acd_sub4{$f_id}[$a_a_no];
#########
		$xyz = "戦法を将：行軍 $BUKOUGUN[$in{'bk'}]、兵：行軍 $HEIKOUGUN[$in{'hk'}]、指揮形態 $SIKIKEITAI[$in{'sk'}]、将：方針 $BUHOUSIN[$in{'bh'}]に変更 を<br />アクティブコマンドとして予約しています。";
require "./$mpg_r/sub_db/citem.pl";
	&P_ITEM_OPEN;

$comew = "";
$p_jintousiki{$f_id} = $in{'sk'};
$p_jyoujihousin1{$f_id} = $in{'bh'};

				if($in{'bk'} eq "0"){
#通常移動(将疲1)
$p_b_idou_sokudo{$f_id} = 20 - 0 + $item_seinou{$p_norimono{$f_id}} + $p_norimono_lv{$f_id};
				}elsif($in{'bk'} eq "1"){
#早駆け(将疲3)
$p_b_idou_sokudo{$f_id} = 20 + 5 + $item_seinou{$p_norimono{$f_id}} + $p_norimono_lv{$f_id};
				}elsif($in{'bk'} eq "2"){
#強行(将疲6)
$p_b_idou_sokudo{$f_id} = 20 + 10 + $item_seinou{$p_norimono{$f_id}} + $p_norimono_lv{$f_id};
				}elsif($in{'bk'} eq "3"){
#警戒（罠・伏兵回避率UP・将疲2）
$p_b_idou_sokudo{$f_id} = 20 - 10 + $item_seinou{$p_norimono{$f_id}} + $p_norimono_lv{$f_id};
				}elsif($in{'bk'} eq "4"){
#隠密（負傷・一騎うち回避・将疲2）
$p_b_idou_sokudo{$f_id} = 20 - 5 + $item_seinou{$p_norimono{$f_id}} + $p_norimono_lv{$f_id};
				}
$p_b_kougun{$f_id} = $in{'bk'};

	if($p_jintousiki{$f_id} eq "2"){
		if($p_jyoujihousin1{$f_id} ne "0" and $p_jyoujihousin1{$f_id} ne "4"){
$comew .= "<span class=\"cFF0000\">指揮形態で「遠隔指令」を選択した場合、「将：方針」で「静観」又は「指令重視」以外選べません。</span><br />";
$p_jyoujihousin1{$f_id} = 0;
		}
		if($p_b_kougun{$f_id} eq "3"){
$comew .= "<span class=\"cFF0000\">指揮形態で「遠隔指令」を選択した場合、「将：行軍」で「警戒移動」は選択できません。</span><br />";
$p_b_kougun{$f_id} = 0;
#通常移動(将疲1)
$p_b_idou_sokudo{$f_id} = 20 - 0 + $item_seinou{$p_norimono{$f_id}} + $p_norimono_lv{$f_id};
		}
	}
	if($p_jintousiki{$f_id} eq "1"){
		if($p_jyoujihousin1{$f_id} eq "1" or $p_jyoujihousin1{$f_id} eq "2"){
$comew .= "<span class=\"cFF0000\">指揮形態で「後方采配」を選択した場合、「将：方針」で「単騎駆け」「獅子奮迅」は選べません。</span><br />";
$p_jyoujihousin1{$f_id} = 0;
		}
	}
				if($in{'hk'} eq "0"){
#通常移動(兵疲3)
$p_h_idou_sokudo{$f_id} = 20 - 0;
				}elsif($in{'hk'} eq "1"){
#早駆け(兵疲5)
$p_h_idou_sokudo{$f_id} = 20 + 5;
				}elsif($in{'hk'} eq "2"){
#強行軍(兵疲7)
$p_h_idou_sokudo{$f_id} = 20 + 10;
				}elsif($in{'hk'} eq "3"){
#警戒体制（罠・伏兵回避率UP・兵疲4）
$p_h_idou_sokudo{$f_id} = 20 - 10;
				}elsif($in{'hk'} eq "4"){
#突撃体制(突撃率3割増加・兵疲5)
$p_h_idou_sokudo{$f_id} = 20 + 0;
				}elsif($in{'hk'} eq "5"){
#一点突破(2発目以降は防御１ポイントずつ通過・兵疲7)
$p_h_idou_sokudo{$f_id} = 20 + 5;
				}elsif($in{'hk'} eq "6"){
#散開包囲(同一地点３連突・兵疲5)
$p_h_idou_sokudo{$f_id} = 20 - 5;
				}
$p_h_kougun{$f_id} = $in{'hk'};


	if($p_jintousiki{$f_id} ne "2" and $p_b_idou_sokudo{$f_id} < $p_h_idou_sokudo{$f_id}){
$comew .= "<span class=\"cFF0000\">「将：速度」が「兵：速度」を下回っているため、「兵：速度」が$p_h_idou_sokudo{$f_id}から$p_b_idou_sokudo{$f_id}に低下します。</span><br />";
$p_h_idou_sokudo{$f_id} = $p_b_idou_sokudo{$f_id};
	}
#########
	}
	if($acd_no{$f_id}[$a_a_no]){
last;
	}
$a_a_no ++;
			}
#########


	&HEADER;
	$no = $in{'no'} + 1;

	print <<"PRI";
	
	$come_cdl
<table border=\"0\" width=\"600\">
<tr><td width=\"400\"></td><td width=\"190\"></td></tr>
<tr class=\"bgc414141\"><td class=\"txth\" colspan=\"2\">
<span class=\"cFFFFFF\"> - 戦法設定 - </span>
</td></tr>
<tr><td>
<table width=\"390\" class=\"kbgcb$k_iro_d{$fk_id}\">
<tr><td width=\"60\"></td><td width=\"120\"></td><td width=\"90\"></td><td width=\"120\"></td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td class=\"txth\" colspan=\"4\"><a href=\"./?.m.=p_b&amp;.id.=$p_id{$f_id}\" target=\"_blank\">$p_name{$f_id}</a></td></tr>

<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>将：行軍</td><td class=\"txth\">$BUKOUGUN[$p_b_kougun{$f_id}]</td><td>将：速度/疲労</td><td class=\"txth\">$p_b_idou_sokudo{$f_id}/$p_b_hirou{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>兵：行軍</td><td class=\"txth\">$HEIKOUGUN[$p_h_kougun{$f_id}]</td><td>兵：速度/疲労</td><td class=\"txth\">$p_h_idou_sokudo{$f_id}/$p_h_hirou{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>指揮形態</td><td class=\"txth\">$SIKIKEITAI[$p_jintousiki{$f_id}]</td><td>将：方針</td><td class=\"txth\">$BUHOUSIN[$p_jyoujihousin1{$f_id}]</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>兵：訓練</td><td class=\"txth\">$p_kunren{$f_id}</td><td>兵：士気</td><td class=\"txth\">$p_hei_siki{$f_id}</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>兵種</td><td class=\"txth\">$SOL_TYPE[$p_heisyu{$f_id}]</td><td>兵数</td><td class=\"txth\">$p_heisisuu{$f_id}</td></tr>
</table>
</td>
<td>


<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".no.\" value=\"1\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".m.\" value=\"senpou\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />


将：行軍<select name=\".bk.\">
<option value=\"$p_b_kougun{$f_id}\">現状維持$come1</option>
</select>
<br />
兵：行軍<select name=\".hk.\">
<option value=\"$p_h_kougun{$f_id}\">現状維持$come2</option>
</select>
<br />
指揮形態<select name=\".sk.\">
<option value=\"$p_jintousiki{$f_id}\">現状維持$come3</option>
</select>
<br />

将：方針<select name=\".bh.\">
<option value=\"$p_jyoujihousin1{$f_id}\">現状維持$come4</option>
</select>

<input type=\"submit\" value=\"決定\" />
</div></form>
</td>
</tr></table>
PRI


print <<"PRI";
$comew<br /><br />$xyz<br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"コマンド入力画面へ\" /></div></form>


PRI

	&FOOTER;

	exit;

}
1;