
sub MOVE {
require "./$mpg_r/sub_db/minzoku.pl";
	open(IN,"./w_db/jikan_jiku_main.cgi");
	@JJM = <IN>;
	close(IN);

	($keika_nen,$tuki_genzai,$m_tt,$kousinjyoutai,$tenkakaisuu,$outyou,$seibento1,$seibento2,$syuminzoku,$msyuto,$kaisinen,$zenkaisinen,$touitunen,$sinkouminzoku1,$sinkouminzoku2,$zentensimei) = split(/<>/,$JJM[0]);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$old_date = "<a href=\"./mapr/$yymaprid\">$old_date</a>";
$add =($keika_nen+100)*5000;


	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

	if((!$in{'chara_name'} or $in{'chara_name'} eq $p_name{$f_id}) and (!$in{'min'} or $in{'min'} eq $p_minzoku{$f_id})) { 

$i = 0;
	foreach(@MINZOKUSAN){
$addc = "";
if($i eq $p_minzoku{$f_id}) {
$addc = " selected=\"selected\"";
}
$addl .= "<option value=\"$i\"$addc>$MINZOKUSAN[$i]";
$i ++;
	}
	&HEADER;

	if($in{'i'} eq "i"){
	$come_cdl = <<"PRI";
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=\".m.\"><option value=\"$in{'m'}\">リロード</option><option value=\"i_cd\">コマンド</option><option value=\"i_s\">情報</option><option value=\"i_m\">手紙</option><option value=\"ikaigi\">門下省</option><option value="sirei">中書省</option><option value="ru-ru">尚書省</option><option value="ilog">過去ログ</option><option value="itemo">競売会場</option><option value="item">アイテム管理</option><option value="senpou">戦法設定</option><option value="gundan">軍団編成</option><option value="butai">部隊編成</option><option value="idkanri">LoginID管理</option><option value="come">コメント編集</option><option value="bcome">自己PR編集</option><option value="adcome">広告/OPT編集</option><option value="yakuba">国取役場</option><option value="tyuusei">忠誠度変更</option><option value="gazou">画像変更</option><option value="act_cd">アクティブC変更</option></select><input type=\"submit\" value=\"画面移動\" /><input type=\"hidden\" name=\".i.\" value=\"i\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /></div></form>

PRI
	}
	&IMG_SAKUSEI("$IMG{0}/bbs0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";
$come_cdl
<table width=\"300\" class=\"kbgcb$k_iro_d{$fk_id}\">
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>所持金</td><td class=\"txth\">$p_syoji_kin{$f_id}</td><td>所持米</td><td class=\"txth\">$p_syoji_kome{$f_id}</td></tr>
</table><br />
 - 役 場 - <br />
<table class=\"bgc414141\" width=\"600\"><tr><td class=\"bgcFFFFFF\" width=\"100\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"490\">
<span class=\"cFFFFFF\">《 国取役場 》<br /><br />
<br /><br />
ここでは武将の名前と種族を変更できます。（費用:金$add）<br />届出には多額の費用がかかりますので慎重に選択してください。</span>
</td></tr></table>
<br /><br />
<form action=\"$COMMAND\" target=\"$ktms4w\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"yakuba\" />
<select name=\".min.\" size=\"15\">$addl
</select>
<input type=\"text\" name=\".chara_name.\" size=\"20\" value=\"$p_name{$f_id}\" />
<input type=\"submit\" value=\"名前と種族を左記の物に変更\" /><br /><br />（キャラ名は全角換算１～８文字で入力してください）</div></form><br /><br />
PRI
	&FOOTER;

	exit;
	}

			if($add > $p_syoji_kin{$f_id}){
				&ER1("資金が不足しています。");
			}

	if($in{'kakunin'} eq "") { 

$in{'chara_name'} =~  s/ //g;
$in{'chara_name'} =~  s/　//g;
	&HEADER;

	print <<"PRI";

金$addを使用し、$in{'chara_name'} ：$MINZOKUSAN[$in{'min'}] に変更します。よろしいですか？


<br /><br />
<form action=\"$COMMAND\" target=\"$ktms4w\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".kakunin.\" value=\"1\" />
<input type=\"hidden\" name=\".m.\" value=\"yakuba\" />
<input type=\"hidden\" name=\".chara_name.\" value=\"$in{'chara_name'}\" />
<input type=\"hidden\" name=\".min.\" value=\"$in{'min'}\" />
<input type=\"submit\" value=\"はい\" /></div></form>
<form action=\"$COMMAND\" target=\"$ktms4w\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"yakuba\" />
<input type=\"submit\" value=\"いいえ\" /></div></form><br /><br />
PRI
	&FOOTER;

	exit;
	}
$hit = @MINZOKUSAN;
$in{'min'} = abs(int($in{'min'}));
	if($in{'min'} > $hit) { &ER1("0～$hitの間で入力してください。"); }
	&MOJISUU($in{'chara_name'},16);
	if($in{'chara_name'} eq "" or $mojisuu_h_all < 2 or $mojisuu_o) { &ER1("キャラクターの名前が正しく入力されていません。$in{'chara_name'}。$mojisuu_re"); }

$cnksw = $in{'chara_name'};
$cnksw =~  s/ //g;
$cnksw =~  s/　//g;
	foreach(@KSW){
if($_ and $cnksw =~ /\Q$_\E/ ) {
		&ER1("そのキャラネームは使用できません。『隠語・淫語フィルター』");}
	}

if($cnksw eq "") {
		&ER1("そのキャラネームは使用できません。『隠語・淫語フィルター』");}



	$dir="./p_db/p";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i){
			open(page,"$dir/$file");
			@page = <page>;
			close(page);
			push(@EN_DB,"$page[0]\n");
		}
	}
	closedir(DFR);

	$dir="./p_db/touketu";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i){
			open(page,"$dir/$file");
			@page = <page>;
			close(page);
			push(@EN_DB,"$page[0]\n");
		}
	}
	closedir(DFR);
$in{'chara_name'}="$in{'chara_name'} ";
		$wchara_name = "$in{'chara_name'}";
$wchara_name =~  s/ //g;
$wchara_name =~  s/　//g;
		foreach(@EN_DB){
			($rkid,$rkpass,$rkname) = split(/,/);
			if($rkname ne $p_name{$f_id}){
		$wrkname = "$rkname";
$wrkname =~  s/ //g;
$wrkname =~  s/　//g;
			if($wrkname eq "$wchara_name"){
				&ER1("その名前は既に登録されています。違う名前で登録してください。");
			}
			}
		}

	if ($in{'min'} eq $p_minzoku{$f_id} and $in{'chara_name'} eq $p_name{$f_id}){&ER1("以前と全く同じで変更点が見当たりません。"); }

#		$ft_id = $p_taizai_iti{$f_id};
#	&T_OPEN("tosi_db","$ft_id","$ft_id");

	if($p_minzoku{$f_id} ne $in{'min'}) {
	$res_mes2 = "$MINZOKUSAN[$p_minzoku{$f_id}]から$MINZOKUSAN[$in{'min'}]に国籍を移し";
	}


	if($p_name{$f_id} ne $in{'chara_name'}) {
	if($p_minzoku{$f_id} ne $in{'min'}) {
	$res_mes3 = "、";
	}
	$res_mes4 = "$in{'chara_name'}と改名";
	}

##########
$a_a_d="yakuba<>0<>名前と民族を変更 <><>$f_id<><>$in{'min'}<>$in{'chara_name'}<><><><><><>$p_kuni_yakusyoku{$f_id}<>$p_kunino{$f_id}<>\n";
		$xyz = "$p_name{$f_id}は$res_mes2$res_mes3$res_mes4 を<br />アクティブコマンドとして予約しました。";

	open(IN,"./p_db/act_cd/$f_id.cgi");
	@CD_DB = <IN>;
	close(IN);
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
##########


	&CD_END("$res_mes","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"submit\" value=\"ＯＫ\" />","");#CD_END

	exit;

}
1;