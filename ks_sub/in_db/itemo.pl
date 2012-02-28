
sub MOVE {

require "./$mpg_r/sub_db/it.pl";
	&P_OPEN;


	if($in{'i'} eq "i"){
	$come_cdl = <<"PRI";
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=\".m.\"><option value=\"$in{'m'}\">リロード</option><option value=\"i_cd\">コマンド</option><option value=\"i_s\">情報</option><option value=\"i_m\">手紙</option><option value=\"ikaigi\">門下省</option><option value="sirei">中書省</option><option value="ru-ru">尚書省</option><option value="ilog">過去ログ</option><option value="itemo">競売会場</option><option value="item">アイテム管理</option><option value="senpou">戦法設定</option><option value="gundan">軍団編成</option><option value="butai">部隊編成</option><option value="idkanri">LoginID管理</option><option value="come">コメント編集</option><option value="bcome">自己PR編集</option><option value="adcome">広告/OPT編集</option><option value="yakuba">国取役場</option><option value="tyuusei">忠誠度変更</option><option value="gazou">画像変更</option><option value="act_cd">アクティブC変更</option></select><input type=\"submit\" value=\"画面移動\" /><input type=\"hidden\" name=\".i.\" value=\"i\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /></div></form>

PRI
	}
		if(-e "./w_db/okusyon\.pl"){
require "./w_db/okusyon\.pl";
		}else{
		}

	&HEADER;
	&IMG_SAKUSEI("$IMG{0}/kyoubai0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";
$come_cdl

<table width=\"300\" class=\"kbgcb$k_iro_d{$fk_id}\">
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td>所持金</td><td class=\"txth\">$p_syoji_kin{$f_id}</td><td>所持米</td><td class=\"txth\">$p_syoji_kome{$f_id}</td></tr>
</table><br />

<table width=\"245\">
<tr>

<td class=\"txth\" width=\"130\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"item\" />
<input type=\"submit\" value=\"アイテム管理\" /></div></form></td>
<td class=\"txth\" width=\"110\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"itemo\" />
<input type=\"submit\" value=\"画面更新\" /></div></form></td></tr>
</table>
<br />
<table width=\"600\" cellpadding=0 cellspacing=\"0\" border=\"0\">

<table class=\"bgc414141\"><tr><td class=\"bgcFFFFFF\" width=\"100\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"495\">
<span class=\"cFFFFFF\">案内人：競売会場へようこそ。
<br />ここではレアアイテムのオークションが行われています。
<br />入札をする場合は、アイテム欄右にあるcheckboxに黒印を付けてから<br />下にある入札確定ボタンを押してください。二日間キープで落札となります。<br />textbox内に値を入れることで、入札時に上乗せしたい金額を設定できます。
<br />$buycome</span>
</td></tr></table>
<br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".tt.\" value=\"$tt\" />
+<input type=\"text\" name=\".tuika.\" size=\"10\" value=\"0\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".m.\" value=\"itemn\" />
<input type=\"submit\" value=\"入札確定ボタン\" />
<br />
<table class=\"bgc884422\" width=\"760\">
<tr class=\"bgcFFF0F5\"><td class=\"txth\" width=\"155\">アイテム名</td><td class=\"txth\" width=\"60\">入札額</td><td class=\"txth\" width=\"90\">最終入札時刻</td><td class=\"txth\" width=\"170\">入札者（所属国）</td><td class=\"txth\" width=\"170\">出品者（所属国）</td><td class=\"txth\" width=\"125\">入札チェック</td></tr>
$ocdc
</table></div></form>

<br />
<br />★ 決まり事 ★<br />新規入札は現在入札額の２割り増し。落札時、売上高の２割は手数料としてシステム側が摂取。
<br />万が一売れ残った場合、商品は手元に戻ります。落札された商品の発送はゲーム内の月初めです。焦らずにお待ちください。
<br /><br />



<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"submit\" value=\"コマンド入力画面へ\" /></div></form>
PRI

	&FOOTER;
	exit;

}
1;