
sub MOVE {

	if($in{'no'} eq ""){&ER1("コマンドNoを入力してください。");}
	&P_OPEN;
		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");
	$item_nedan{$p_migite{$f_id}} = ($item_nedan{$p_migite{$f_id}} * 0.6);
	&HEADER;
	$no = $in{'no'} + 1;

require "$mpg_r/sub_db/citem.pl";
	&P_ITEM_OPEN;

	foreach(@no){
		$no_list .= "<input type=\"hidden\" name=\".no.\" value=\"$_\" />"
	}

$SYUBETU[1]='片手';
$SYUBETU[2]='両手';
		$kome = "が装備している<br />";
$hit=0;
$sell_list="<option value=\"\">武器を売却せず</option>";

						if($p_migite{$f_id}%1000){
						if($p_migite{$f_id}%1000 < 100){
$add_g=$item_nedan{$p_migite{$f_id}}*0.7;
		$kome .= "$SYUBETU[$item_2hf{$p_migite{$f_id}}]装備・$item_name{$p_migite{$f_id}}は金「<span class=\"cFFFFCC\">$add_g</span>」で下取り致します。<br />";
		$sell_list .= "<option value=\"1\">右手の$SYUBETU[$item_2hf{$p_migite{$f_id}}]武器：$item_name{$p_migite{$f_id}}を売却し</option>";
$hit=1;
						}else{
		$kome .= "$SYUBETU[$item_2hf{$p_migite{$f_id}}]装備・$item_name{$p_migite{$f_id}}はレアアイテムなため下取りできません。<br />";

						}
						}
						if($p_hidarite{$f_id}%1000){
						if($p_hidarite{$f_id}%1000 < 100){
$add_g=$item_nedan{$p_hidarite{$f_id}}*0.7;
		$kome .= "$SYUBETU[$item_2hf{$p_hidarite{$f_id}}]装備・$item_name{$p_hidarite{$f_id}}は金「<span class=\"cFFFFCC\">$add_g</span>」で下取り致します。<br />";
		$sell_list .= "<option value=\"2\">左手の$SYUBETU[$item_2hf{$p_hidarite{$f_id}}]武器：$item_name{$p_hidarite{$f_id}}を売却し</option>";
$hit=1;
						}else{
		$kome .= "$SYUBETU[$item_2hf{$p_hidarite{$f_id}}]装備・$item_name{$p_hidarite{$f_id}}はレアアイテムなため下取りできません。<br />";

						}
						}
#						if(!$hit){
#		$kome = "は両手に何も装備していません。<br />";
#						}

	&IMG_SAKUSEI("$IMG{0}/bukiya0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";


<table width=\"300\" class=\"kbgcb$p_k_iro_d{$f_id}\">
<tr class=\"kbgcc$p_k_iro_d{$f_id}\"><td>所持金</td><td class=\"txth\">$p_syoji_kin{$f_id}</td><td>所持米</td><td class=\"txth\">$p_syoji_kome{$f_id}</td></tr>
</table><br />
<br />
<table class=\"bgc414141\" width=\"600\"><tr><td class=\"bgcFFFFFF\" width=\"100\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"490\">
<span class=\"cFFFFFF\">《 武 器 屋 》<br /><br />売り子：いらっしゃいませ。
<br />ここではめったにお目にかかれない貴重な武器を販売しています。
<br />是非手にとって見ていってくださいね。
<br />尚、現在「$p_name{$f_id}」様$kome</span>
</td></tr></table>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<table class=\"bgc884422\" width=\"300\">
PRI

	$list = "<tr class=\"bgcFFF0F5\"><td width=\"26\">選択</td><td width=\"104\" class=\"txtr\">名称</td><td class=\"txtr\" width=\"80\">値段</td><td width=\"40\" class=\"txtr\">性能</td><td width=\"40\" class=\"txtr\">種別</td></tr>";
	$fi_id=1001;
	while($fi_id<1100){
	&I_READ("it","$fi_id","$fi_id");
		if($item_rea{$fi_id} eq "0"){
			$list .= "<tr class=\"bgcFFF8F0\"><td><input type=\"radio\" name=\".select.\" value=\"$fi_id\" /></td><td class=\"txtr\">$item_name{$fi_id}</td><td class=\"txtr\">$item_nedan{$fi_id}</td><td class=\"txtr\">$item_seinou{$fi_id}</td><td class=\"txtr\">$SYUBETU[$item_2hf{$fi_id}]$item_syurui{$fi_id}</td></tr>";
		}
		$fi_id++;
	}


print <<"PRI";
$list
</table>
$no_list

<select name=\".sell.\" size=\"2\">
$sell_list
</select>
<input type=\"hidden\" name=\".m.\" value=\"buki2\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"購入\" /></div></form>
※売却する武器を未選択で購入ボタンを押すと、空いている手に購入武器を自動で装備します。<br />
※両手持ち武器の売買を行う場合、手持ちのアイテムを売却した後、新しい武器を購入します。


<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"戻る\" /></div></form>

PRI

	&FOOTER;

	exit;

}
1;