
sub MOVE {

	&P_OPEN;

		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");
require "./$mpg_r/sub_db/kanbu.pl";


				&KANBU_NAME;
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

	
	open(IN,"./w_db/kuni/lr$p_kunino{$f_id}.cgi");
	@LOCAL_DATA = <IN>;
	close(IN);


	&HEADER;

	&IMG_SAKUSEI("$IMG{0}/sansyou2$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";
<a id=0></a>
<table width=\"100%\">
<tr>
<td class=\"kbgcb0\" width=\"100%\">　<span class=\"kcc0\"><span class=\"fs4\">　　　＜＜<strong> * 尚書省 * </strong>＞＞（執行部からのお知らせ）</span></span>
</td>
</tr></table>
$come_cdl

<table width=\"500\" class=\"bgc414141\"><tr><td width=\"96\" class=\"bgcFFFFFF\">$img_sakusei_kekka</td>
<td class=\"bgc414141\">
<span class=\"cFFFFFF\">尚書令：尚書省にようこそ。<br />ここは「$k_name{$fk_id}」で定められた独自のルールや国の方針、<br />重要な情報等を書き残しておくための場所です。<br />質問がある場合は国の幹部又は担当者までお問い合わせ下さい。<br />最大３０件まで記録できます。
</td></tr>
</table>


PRI
	$s_n = 0;
	foreach(@LOCAL_DATA){
		($bbid,$bbval,$bbmes,$bbcgimg,$bbname,$bbhost,$bbtime,$bbkuniiro,$bbkuni,$bbtype,$bbno,$bbthreadno,$cgimgr2sabano,$bbsabaurl,$cgimgr2sabano,$bbsabaurl)=split(/<>/);
$bnot = $s_n+1;
$bnob = $s_n+2;
            $mes .= "<tr class=\"bgc414141\"><td width=\"30\" class=\"txth\"><a href=\"#$s_n\">↑</a><br /><input type=\"radio\" name=\".del_id.\" value=\"$bbval\" /><br /><a href=\"#$bnob\">↓</a></td><td class=\"msp\"><a id=\"$bnot\"></a><span class=\"cFFFFFF\"><br />$bbmes<br /><br /> <span class=\"fs1\">$bbname</span></span><br /><br /></td></tr>\n";
		$s_n++;
	}
print <<"PRI";
<br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<table border=\"0\" width=\"80%\" class=\"bgcFFFFFF\">
$mes
</table><br /><br />


<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"ru-rud\" />
<input type=\"submit\" value=\"国法の削除\" />
</div></form>（国法の削除権限は、${$zokukanbuptn}[27]か上公か三孤のみです）

<br /><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<textarea name=\".ins.\" cols=\"40\" rows=\"4\">
</textarea><br /><br />


<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"ru-ruw\" />
<select name=\".t.\">
<option value=\"\">通常</option>
<option value=\"pre\">図表</option></select>
<input type=\"submit\" value=\"国法の設定\" />
</div></form>（国法の設定権限は、幹部のみです）


PRI

	&FOOTER;
	exit;
}
1;