

sub MOVE {

	&P_OPEN;
	$datev2 = "<script type=\"text/javascript\" src=\"$CSS_URI/abata.js\"></script>";
$p_img{$f_id} =~ s/&#47;/\//g;
$p_img{$f_id} =~ s/&#46;/\./g;
		if($in{'icon_saba'} eq ""){
$in{'icon_saba'} = 4;
		}
	$in{'icon_saba'} = abs(int($in{'icon_saba'}));

$add_saba_sel[$in{'icon_saba'}] = " selected=\"selected\"";

$datev2cgl.="sitem = [";
$datev2cgs.="litem = [";
foreach $key ( keys %IMG ) {
$key=int($key);
$add_img[$key]=$key;
}


foreach (@add_img){
$add_g_saba_l.="<option value=$_$add_saba_sel[$_]>$IMG_SABA_NAME{$_}</option>";
$datev2cgl.="	[";
$datev2cgs.="	[";
	foreach (0..$KYARA_IMG_MAX{$_}){
$datev2cgl.="$_,";
$datev2cgs.="'イメージ\[$_\]',";
$IMAGEKAZU ++;
	}
	chop($datev2cgl);
$datev2cgl.="],";
	chop($datev2cgs);
$datev2cgs.="],";
$datev2saba.="saba[$_]='$IMG{$_}/';saba_f[$_]='$p_img_kakutyou{$_}';";
}
	chop($datev2cgl);
$datev2cgl.="];";
	chop($datev2cgs);
$datev2cgs.="];";

$IMAGEKAZU -= @add_img;

$datev4.="saba_i=0;saba=new Array();saba_f=new Array();$datev2saba$datev2cgl$datev2cgs durlw='$p_img{$f_id}$p_img_f{$f_id}';add_s();";
	&HEADER;

	print <<"PRI";

<a id=\"t\"></a>
<table width==\"100%=\">
<tr>
<td class=\"kbgcb0\">　<span class=\"kcc0\"><span class=\"fs4\">　　　＜＜<strong> * キャラ画像を変更 *</strong>＞＞</span>（設定画面を正しく表示\するにはjavascriptオン必須）</span>
</td>
</tr>
</table>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"gazou\" />
<input type=\"submit\" value=\"リロード\" />
</div></form>

<form action=\"$COMMAND\" method=\"post\" name=entry utn=\"utn\"><div>

<table class=\"bgc884422\" border=\"2\" width=\"600\">
<tr class=\"bgcFFF0F5\"><td width=\"120\"></td><td width=\"100\"></td><td></td></tr>
<tr class=\"bgcFFF0F5\"><td class=\"txtc\" colspan=\"3\">キャラ画像を変更</td></tr>

<tr><td class=\"bgc000000\">

<img src=\"$p_img{$f_id}$p_img_f{$f_id}\" width=\"$img_wide_d\" height=\"$img_height_d\" name=\"Img\" id=\"Img\" />
</td><td class=\"bgcFFF8F0\">
<select name=\".icon.\" onChange=\"cgimgno(this);\" size=\"20\">
PRI
$p_cgno_d{$f_id} = int($p_cgno_d{$f_id});
	foreach (0..$KYARA_IMG_MAX{$in{'icon_saba'}}){
	if($p_cgno_d{$f_id} eq "$_"){
print "<option value=\"$p_cgno_d{$f_id}\" selected=\"selected\">イメージ[$p_cgno_d{$f_id}]</option>\n";
	}else{
print "<option value=\"$_\">イメージ[$_]</option>\n";
	}
	}


print <<"PRI";
</select></td><td class=\"bgcFFF8F0\">・変更するパーツを選択してください。
<br />・
<span class=\"cFF0000\">輪郭</span><select name=\".rinkaku.\" onChange=\"cgabata(this,rinkaku);\">$add_g_saba_l</select>
</td></tr>
<tr class=\"bgcFFF8F0\"><td class=\"txtc\" colspan=\"3\">
<input type=\"hidden\" name=\".m.\" value=\"abata\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />

<input type=\"submit\" value=\"キャラ画像を変更\" /><br />
</td></tr></table></div></form>

PRI
	&FOOTER;

	exit;
}

1;