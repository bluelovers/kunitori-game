
sub MOVE {

	if($in{'no'} eq ""){&ER1("コマンドNoを入力してください。");}
	&P_OPEN;
		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");

	$item_nedan{$p_syomotu{$f_id}} = int($item_nedan{$p_syomotu{$f_id}} * 0.6);
	&HEADER;
	$no = $in{'no'} + 1;


require "$mpg_r/sub_db/citem.pl";
	&P_ITEM_OPEN;

	foreach(@no){
		$no_list .= "<input type=\"hidden\" name=\".no.\" value=\"$_\" />";
	}
$buycome = "尚、現在「$p_name{$f_id}」様は書物を持参しておりません。<br />";
$add_g=$item_nedan{$p_syomotu{$f_id}}*0.7;
						if($p_syomotu{$f_id}%1000){
						if($p_syomotu{$f_id}%1000 < 100){
$buycome = "現在「$p_name{$f_id}」様が装備している$item_name{$p_syomotu{$f_id}}は金「<span class=\"cFFFFCC\">$add_g</span>」で下取り致します。<br />";
						}else{
		$buycome .= "$item_name{$p_syomotu{$f_id}}はレアアイテムなため下取りできません。<br />";

						}
						}

	&IMG_SAKUSEI("$IMG{0}/honya0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";


<table width=\"300\" class=\"kbgcb$k_iro_d{$fk_id}\">
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>所持金</td><td class=\"txth\">$p_syoji_kin{$f_id}</td><td>所持米</td><td class=\"txth\">$p_syoji_kome{$f_id}</td></tr>
</table><br />
<br />
<table class=\"bgc414141\" width=\"600\"><tr><td class=\"bgcFFFFFF\" width=\"100\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"490\">
<span class=\"cFFFFFF\">《 本 屋 》<br /><br />売り子：いらっしゃいませ。
<br />ここではなかなかお目にかかれない貴重な書物を販売しています。
<br />是非手にとって見ていってください。
<br />$buycome</span>
</td></tr></table>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<table class=\"bgc884422\" width=\"260\">
PRI

	$list = "<tr class=\"bgcFFF0F5\"><td width=\"30\">選択</td><td class=\"bgcF8F0E8\" width=\"100\">名称</td><td class=\"txtr\" class=\"bgcFFF8F0\" width=\"80\">値段</td><td width=\"40\">性能</td></tr>";
	$fi_id=2001;
	while($fi_id<2100){
	&I_READ("it","$fi_id","$fi_id");
		if($item_rea{$fi_id} eq "0"){
			$list .= "<tr class=\"bgcFFF8F0\"><td><input type=\"radio\" name=\".select.\" value=$fi_id /></td><td>$item_name{$fi_id}</td><td class=\"txtr\" class=\"bgcFFF8F0\">$item_nedan{$fi_id}</td><td class=\"txtr\" class=\"bgcF8F0E8\">$item_seinou{$fi_id}</td></tr>";
		}
		$fi_id++;
	}




print <<"PRI";
$list
</table>
$no_list
<input type=\"hidden\" name=\".m.\" value=syomotu2 /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"購入\" /></div></form>


<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"戻る\" /></div></form>

PRI

	&FOOTER;

	exit;

}
1;