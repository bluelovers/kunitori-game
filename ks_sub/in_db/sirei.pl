

sub MOVE {

	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

require "./p_db/tt/kcs4$f_id.pl";

	if($in{'i'} eq "i"){
	$come_cdl = <<"PRI";
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=\".m.\"><option value=\"$in{'m'}\">リロード</option><option value=\"i_cd\">コマンド</option><option value=\"i_s\">情報</option><option value=\"i_m\">手紙</option><option value=\"ikaigi\">門下省</option><option value="sirei">中書省</option><option value="ru-ru">尚書省</option><option value="ilog">過去ログ</option><option value="itemo">競売会場</option><option value="item">アイテム管理</option><option value="senpou">戦法設定</option><option value="gundan">軍団編成</option><option value="butai">部隊編成</option><option value="idkanri">LoginID管理</option><option value="come">コメント編集</option><option value="bcome">自己PR編集</option><option value="adcome">広告/OPT編集</option><option value="yakuba">国取役場</option><option value="tyuusei">忠誠度変更</option><option value="gazou">画像変更</option><option value="act_cd">アクティブC変更</option></select><input type=\"submit\" value=\"画面移動\" /><input type=\"hidden\" name=\".i.\" value=\"i\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /></div></form>

PRI
	}else{
	$come_cdl = <<"PRI";
	
<table width=\"500\"><tr>
<td class=\"txth\" width=\"20%\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"messe\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"submit\" value="手紙閲覧" /></div></form></td><td class=\"txth\" width=\"20%\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kaigi\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"submit\" value=\"門下省\" />
</div></form></td>
<td class=\"txth\" width=\"20%\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"sirei\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<input type=\"submit\" value=\"中書省\" />
</div></form></td>
<td class=\"txth\" width=\"20%\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"ru-ru\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<input type=\"submit\" value=\"尚書省\" />
</div></form></td>
<td class=\"txth\" width=\"20%\">
<form action=\"$URI_SP_D/kunibbs/\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$URI_D\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$menck\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<input type=\"submit\" value=\"国取掲示板\" />
</div></form></td>
</tr></table>
PRI
	}
	if($f_id ne $k_yakusyoku_id{$fk_id}[$p_kuni_yakusyoku{$f_id}]){
	&HEADER;
	&IMG_SAKUSEI("$IMG{0}/sansyou3$add_gop$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";

<table width=\"100%\">
<tr>
<td class=\"kbgcb0\" width=\"100%\">　<span class=\"kcc0\"><span class=\"fs4\">　　　＜＜<strong> * 中書省 * </strong>＞＞（作戦司令室）</span></span>
</td>
</tr>
</table>
$come_cdl


<table class=\"bgc414141\" width=\"600\"><tr>
<td width=\"100\" class=\"bgcFFFFFF\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"495\">
<span class=\"cFFFFFF\">中書令：これはこれは $p_name{$f_id}様、中書省にようこそ。<br />ここでは天子様に進言を行いつつ「$k_name{$fk_id}」の国の方針を定めることができます。
<br />中書省を利用できるのは役職持ちの幹部だけになりますのでご了承下さい。
</td></tr></table>
<br />

PRI

	&FOOTER;
	exit;

	}

	if($k_yakusyoku_id{$fk_id}[15]){
$e_id=$k_yakusyoku_id{$fk_id}[15];
	&P_READ("p","$e_id","$e_id");
	}
	if($k_yakusyoku_id{$fk_id}[16]){
$e_id=$k_yakusyoku_id{$fk_id}[16];
	&P_READ("p","$e_id","$e_id");
	}
	if($k_yakusyoku_id{$fk_id}[17]){
$e_id=$k_yakusyoku_id{$fk_id}[17];
	&P_READ("p","$e_id","$e_id");
	}
	if($k_yakusyoku_id{$fk_id}[18]){
$e_id=$k_yakusyoku_id{$fk_id}[18];
	&P_READ("p","$e_id","$e_id");
	}

require "./$mpg_r/sub_db/kanbu.pl";

				&KANBU_NAME;
$itenmes = '首都移転';
	if($k_kokka_keitai{$fk_id}){
$itenmes = '賊砦移転';
$add_gop = 'z';
	}



	open(IN,"./w_db/kuni_l/l$fk_id.cgi");
	@KUNI_DB = <IN>;
	close(IN);

	foreach(@KUNI_DB){
		($uni_id,$uni_name)=split(/<>/);
						$list_k .= "<option value=$uni_id>$uni_name</option>";

	}

		if(-e "./w_db/allc_tosi_db.pl"){
require "./w_db/all_tosi_db.pl";

		}else{ 
require "./w_db/all2_tosi_db.pl";
		}
							$xx=0;
	while ($xx<$tosi_kazu) {
							$dt_id = $xx;
		if($p_kunino{$f_id} eq $t_kunino[$dt_id]){
			$lists .= "<option value=\"$xx\">$t_name[$dt_id]での徴兵を許可</option>";
		}
							$xx++;
	}

							$xx=0;
	foreach(@{$k_kouhou_tyouhei{$fk_id}}){
							$dt_id = $_;
		if($_ and $t_kunino[$dt_id] eq $p_kunino{$f_id}){
			$xnvv[$xx] = "$t_name[$dt_id]";
		}
							$xx++;
	}

$eleele = "<div class=\"kuniiro_div\">";
	$i=0;
	foreach(@ELE_BG){
$eleele .= "<div class=\"kuniiro_block\"><span class=\"kcm$i\">■</span><br /><input type=\"radio\" name=\".ele.\" value=\"$i\" /></div>";
	$i++;
	}

$eleele .= "</div><div class=\"clear_b\"></div>";

	&HEADER;
	&IMG_SAKUSEI("$IMG{0}/sansyou3$add_gop$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";

<table width=\"100%\">
<tr>
<td class=\"kbgcb0\" width=\"100%\">　<span class=\"kcc0\"><span class=\"fs4\">　　　＜＜<strong> * 中書省 * </strong>＞＞（作戦司令室）</span>
</td>
</tr>
</table>

$come_cdl

<table class=\"bgc414141\" width=\"600\"><tr>
<td width=\"100\" class=\"bgcFFFFFF\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"495\">
<span class=\"cFFFFFF\">中書令：これはこれは$rank_mes様、中書省にようこそ。<br />ここでは天子様に進言を行いつつ「$k_name{$fk_id}」の国の方針を定めることができます。
<br />各役職の権限に沿ったコマンドのみ利用できますので詳しくは説明書でご確認ください。
</td></tr></table>
<br />

<table class=\"bgc884422\" width=\"760\"><tr width=\"90\"><td></td><td width=\"360\"></td><td width=\"300\"></td></tr>
<tr class=\"bgcFFFFFF\"><td class=\"txth\">指令</td><td class=\"txtr\" colspan=\"2\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><textarea name=\".mes.\" cols=\"60\" rows=\"3\"></textarea>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".m.\" value=\"sireiw\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"submit\" value=\"指令変更\" /></div></form></td></tr>

<tr class=\"bgcFFFFFF\"><td class=\"txth\">守備位置確認</td><td class=\"txtr\" colspan=\"2\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><strong>各都市の守備の配置を確認できます。</strong><input type=\"hidden\" name=\".m.\" value=\"syubi_hyouji\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"submit\" value=\"確認画面へ\" /></div></form></td></tr>
<tr class=\"bgcFFFFFF\"><td class=\"txth\">評定会議</td><td class=\"txtr\" colspan=\"2\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><strong>今期の攻略目標と、来期の評定会議の方針を設定することが出来ます。</strong><input type=\"hidden\" name=\".m.\" value=\"hyoutei1\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"submit\" value=\"評定画面へ\" /></div></form></td></tr>
<tr class=\"bgcFFFFFF\"><td class=\"txth\">再評定</td><td class=\"txtr\" colspan=\"2\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><strong>評定で決めた攻略目標を再評定にかけ変更することが出来ます。</strong>
<input type=\"hidden\" name=\".m.\" value=hyoutei3><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"submit\" value=\"再評定画面へ\"></div></form></td></tr>
<tr class=\"bgcFFFFFF\"><td class=\"txth\">徴兵許可</td>
<td class=\"txth\">『１、$xnvv[0]』『２、$xnvv[1]』『３、$xnvv[2]』『４、$xnvv[3]』『５、$xnvv[4]』<br /><hr />後方徴兵都市をここで設定。<br />交戦相手国に隣接している都市は設定不要。</td><td class=\"txtr\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=.type.><option value=\"0\">No</option><option value=\"1\">１番</option><option value=\"2\">２番</option><option value=\"3\">３番</option><option value=\"4\">４番</option><option value=\"5\">５番</option></select>⇒<select name=\".sel.\"><option value=\"\">徴兵許可取り消し</option>$lists</option></select>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".m.\" value=tkyoka><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"submit\" value=\"設定\" /></div></form></td></tr>



<tr class=\"bgcFFFFFF\"><td class=\"txth\">${$zokukanbuptn}[15]任命</td><td class=\"txth\">現在の${$zokukanbuptn}[15]⇒$p_name{$k_yakusyoku_id{$fk_id}[15]}<br /><hr />${$zokukanbuptn}[15]を任命いたします。（${$zokukanbuptn}[15]or${$zokukanbuptn}[1]専用）<br />確認画面がないので任命ミスに注意。</td><td class=\"txtr\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=\".sel.\"><option value=\"\">選択して下さい</option>$list_k</select>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".m.\" value=\"ninmei\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"hidden\" name=\".type.\" value=\"15\" /><input type=\"submit\" value=\"任命\" /></div></form></td></tr>
<tr class=\"bgcFFFFFF\"><td class=\"txth\">${$zokukanbuptn}[16]任命</td><td class=\"txth\">現在の${$zokukanbuptn}[16]⇒$p_name{$k_yakusyoku_id{$fk_id}[16]}<br /><hr />${$zokukanbuptn}[16]を任命いたします。（${$zokukanbuptn}[1]専用）<br />確認画面がないので任命ミスに注意。</td><td class=\"txtr\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=\".sel.\"><option value=\"\">選択して下さい</option>$list_k</select>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".m.\" value=\"ninmei\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"hidden\" name=\".type.\" value=\"16\" /><input type=\"submit\" value=\"任命\" /></div></form></td></tr>
<tr class=\"bgcFFFFFF\"><td class=\"txth\">${$zokukanbuptn}[17]任命</td><td class=\"txth\">現在の${$zokukanbuptn}[17]⇒$p_name{$k_yakusyoku_id{$fk_id}[17]}<br /><hr />${$zokukanbuptn}[17]を任命いたします。（${$zokukanbuptn}[2]専用）<br />確認画面がないので任命ミスに注意。</td><td class=\"txtr\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=\".sel.\"><option value=\"\">選択して下さい</option>$list_k</select>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".m.\" value=\"ninmei\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"hidden\" name=\".type.\" value=\"17\" /><input type=\"submit\" value=\"任命\" /></div></form></td></tr>
<tr class=\"bgcFFFFFF\"><td class=\"txth\">${$zokukanbuptn}[18]任命</td><td class=\"txth\">現在の${$zokukanbuptn}[18]⇒$p_name{$k_yakusyoku_id{$fk_id}[18]}<br /><hr />${$zokukanbuptn}[18]を任命いたします。（${$zokukanbuptn}[3]専用）<br />確認画面がないので任命ミスに注意。</td><td class=\"txtr\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=\".sel.\"><option value=\"\">選択して下さい</option>$list_k</select>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".m.\" value=\"ninmei\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"hidden\" name=.type. value=18><input type=\"submit\" value=\"任命\" /></div></form></td></tr>
<tr class=\"bgcFFFFFF\"><td class=\"txth\">解雇</td><td class=\"txth\">国の武将を解雇します。（${$zokukanbuptn}[23]or上公or三孤専用）</td><td class=\"txtr\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=\".sel.\"><option value=\"\">選択して下さい</option>$list_k</select>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".m.\" value=\"kaiko\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"hidden\" name=\".type.\" value=\"5\" /><input type=\"submit\" value=\"解雇\" /></div></form></td></tr>
<tr class=\"bgcFFFFFF\"><td class=\"txth\">国の紹介文</td><td class=\"txtr\" colspan=\"2\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><strong>国家PR用の各種コメントの設定が出来ます。（${$zokukanbuptn}[25]or上公or三孤専用）</strong>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".m.\" value=kcome><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"submit\" value=\"設定画面へ\"></div></form></td></tr>
<tr class=\"bgcFFFFFF\"><td class=\"txth\">国の色の変更</td><td class=\"txtr\" colspan=\"2\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>$eleele<strong>・国の色を決めてください。（${$zokukanbuptn}[25]or上公or三孤専用）
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".m.\" value=\"kuniiro\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"submit\" value=\"国の色を変更\" /></div></form></td></tr>
<tr class=\"bgcFFFFFF\"><td class=\"txth\">新規入国者へ<br />の勧誘文</td><td class=\"txtr\" colspan=\"2\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"text\" name=\".mes.\" size=\"60\" /><strong>（${$zokukanbuptn}[25]or上公or三孤専用）</strong>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".m.\" value=\"kanyuu\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"submit\" value=\"勧誘文設定\" /></div></form></td></tr>
<tr class=\"bgcFFFFFF\"><td class=\"txth\">$itenmes</td><td class=\"txtr\" colspan=\"2\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><strong>我が国の新たな本拠地を指定します。（上公or三孤専用）</strong>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"hidden\" name=\".m.\" value=\"iten\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"submit\" value=\"$itenmes画面へ\" /></div></form></td></tr>
<tr class=\"bgcFFFFFF\"><td class=\"txth\">皇位禅譲</td><td class=\"txtr\" colspan=\"2\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><strong>来期に推奨する天子の名を設定できます。未入力なら現在の天子を引き続き支持します。</strong>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".m.\" value=\"hyoutei2\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"submit\" value=\"皇位禅譲画面へ\" /></div></form></td></tr>
</table><br />

PRI

	&FOOTER;

	exit;

}
1;