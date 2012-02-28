
sub MOVE {

	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");


	&HEADER;

	&IMG_SAKUSEI("$IMG{0}/sansyou1$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";
<a id=\"t\"></a>
<table width=\"100%\">
<tr>
<td class=\"kbgcb0\" width=\"100%\">　<span class=\"kcc0\"><span class=\"fs4\">　　　＜＜<strong> * 門下省 * </strong>＞＞（会議室） </span></span>
</td>
</tr>
</table>

<table width=\"500\"><tr>
<td class=\"txth\" width=\"20%\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"messe\" />
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"submit\" value=\"手紙閲覧\" /></div></form></td><td class=\"txth\" width=\"20%\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kaigi\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"submit\" value=\"門下省\" /></div></form>
</td>
<td class=\"txth\" width=\"20%\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"sirei\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<input type=\"submit\" value=\"中書省\" /></div></form>
</td>
<td class=\"txth\" width=\"20%\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"ru-ru\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<input type=\"submit\" value=\"尚書省\" /></div></form>
</td><td class=\"txth\" width=\"20%\">

<form action="$URI_SP_D/kunibbs/" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$URI_D\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$menck\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<input type=\"submit\" value=\"国取掲示板\" /></div></form>
</td>
</tr></table>



<table width=\"500\" class=\"bgc414141\"><tr><td width=\"96\" class=\"bgcFFFFFF\">$img_sakusei_kekka</td>
<td class=\"bgc414141\">
<span class=\"cFFFFFF\">侍中：門下省にようこそ。<br />ここは「$k_name{$fk_id}」専用の掲示板です。
<br />各種連絡や議論の場として、<br />コミュニケーションの場として、<br />お気軽にお使いください。
</td></tr></table>

<br />
<a href=\"#r\">新規投稿</a></td><br />
PRI



	open(IN,"./w_db/cmes/lt$p_kunino{$f_id}.cgi");
	@BBS_DATALT = <IN>;
	close(IN);

$c_mesa = "";
$c_meslt = "";

$bno = 0;

$burlno = "$in{'b_no'}";

	if($in{'b_no'} ne ""){
foreach(@BBS_DATALT){
		($bbsid0,$bbsno0,$bbstitle0) = split(/<>/);
	if($bbsid0 eq $in{'b_no'}){
		if(-e "./w_db/cmes/all$p_kunino{$f_id}$burlno.pl"){
require "./w_db/cmes/all$p_kunino{$f_id}$burlno.pl";
		}else{
#	open(IN,"./w_db/cmes/all$p_kunino{$f_id}$in{'b_no'}.cgi");
#	@c_mes = <IN>;
#	close(IN);
#	foreach(@c_mes){
#$c_mesa .= "$_";
#	}
		}
$bnot = $bno;
$bnon = $bno+1;
$bnob = $bno+2;
$c_mesa .= "<a id=\"w$bnot\"></a>
<table border=\"0\" width=\"700\" class=\"kbgcc$k_iro_d{$fk_id}\">

<tr>
<td colspan=\"2\" class=\"txtr\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<select name=\".t.\">
<option value=\"\">通常</option>
<option value=\"pre\">図表</option></select>
<select name=\".sage.\">
<option value=\"sage\">sage</option>
<option value=\"age\">age</option></select> <textarea name=\".ins.\" cols=\"65\" rows=\"2\"></textarea>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".b_no.\" value=\"$bbsid0\" />
<input type=\"hidden\" name=\".m.\" value=\"kaigiw\" />
<input type=\"hidden\" name=\".m_add.\" value=\"kaigi\" />
<input type=\"submit\" value=\"返信\" /></div></form>
</td></tr>
<tr>
<td colspan=\"2\" class=\"txtr\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".b_no.\" value=\"$bbsid0\" />
<input type=\"hidden\" name=\".m.\" value=\"kaigi\" />
<a href=\"#$bnot\">【$bbstitle0】</a><input type=\"submit\" value=\"このスレッドを全部読む\" /></div></form>
</td></tr></table><a id=\"$bnon\"></a>\n<a href=#$bnot>↑↑↑</a> <a href=\"#t\">戻</a> <a href=\"#w$bnon\">書</a> <a href=\"#$bnob\">↓↓↓</a>";
	}
	if($bno % 3 == 0 and $bno > 0){
$c_meslt .= "
</tr><tr>";
	}
$bno ++;
$c_meslt .= "
<td><a href=\"#$bnot\">移</a></td><td class=\"bgc000000\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".b_no.\" value=\"$bbsid0\" />
<input type=\"hidden\" name=\".m.\" value=\"kaigi\" />
<input type=\"submit\" value=\"$bbstitle0・$bbsno0\" /></div></form></td>";
}
	}else{
foreach(@BBS_DATALT){
		($bbsid0,$bbsno0,$bbstitle0) = split(/<>/);
$bnot = $bno;
$bnon = $bno+1;
$bnob = $bno+2;
		if($bno < 5){
		if(-e "./w_db/cmes/5g$p_kunino{$f_id}$bbsid0.pl"){
require "./w_db/cmes/5g$p_kunino{$f_id}$bbsid0.pl";
		}else{
#	open(IN,"./w_db/cmes/5g$p_kunino{$f_id}$bbsid0.cgi");
#	@c_mes = <IN>;
#	close(IN);
#	foreach(@c_mes){
#$c_mesa .= "$_";
#	}
		}
$c_mesa .= "<a id=\"w$bnot\"></a>
<table border=\"0\" width=\"70%\" class=\"kbgcc$k_iro_d{$fk_id}\">

<tr>
<td colspan=\"2\" class=\"txtr\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<select name=\".t.\">
<option value=\"\">通常</option>
<option value=\"pre\">図表</option></select>
<select name=\".sage.\">
<option value=\"sage\">sage</option>
<option value=\"age\">age</option></select>  <textarea name=\".ins.\" cols=\"65\" rows=\"2\"></textarea>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".b_no.\" value=\"$bbsid0\" />
<input type=\"hidden\" name=\".m.\" value=\"kaigiw\" />
<input type=\"hidden\" name=\".m_add.\" value=\"kaigi\" />
<input type=\"submit\" value=\"返信\" />
</div></form></td></tr>
<tr>
<td colspan=\"2\" class=\"txtr\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".b_no.\" value=\"$bbsid0\" />
<input type=\"hidden\" name=\".m.\" value=\"kaigi\" />
<a href=\"#$bnot\">【$bbstitle0】</a><input type=\"submit\" value=\"このスレッドを全部読む\" /></div></form>
</td></tr></table><a id=\"$bnon\"></a>\n<a href=\"#$bnot\">↑↑↑</a> <a href=\"#t\">戻</a> <a href=\"#w$bnon\">書</a> <a href=\"#$bnob\">↓↓↓</a> ";
		}
	if($bno % 3 == 0 and $bno > 0){
$c_meslt .= "
</tr><tr>";
	}

$bno ++;

$c_meslt .= "
<td><a href=\"#$bnot\">移</a></td><td class=\"bgc000000\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".b_no.\" value=\"$bbsid0\" />
<input type=\"hidden\" name=\".m.\" value=\"kaigi\" />
<input type=\"submit\" value=\"$bbstitle0・$bbsno0\" />
</div></form></td>";
}
	}


print <<"PRI";
<table border=\"1\" width=\"700\">
<tr><td width=\"13\"></td><td width=\"220\"></td><td width=\"13\"></td><td width=\"220\"></td><td width=\"13\"></td><td width=\"220\"></td></tr>
<tr class=\"bgcD3D3D3\"><td colspan=\"6\" class=\"txtc\">$MEN_TITLE・$k_name{$fk_id}門下省・スレッド一覧</td></tr>
<tr>$c_meslt</tr>
</table><a id=\"0\"></a>\n<a href=\"#0\">↑↑↑</a> <a href=\"#t\">戻</a> <a href=\"#w0\">書</a> <a href=\"#1\">↓↓↓</a> 
$c_mesa
<a id=\"r\"></a><br /><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<textarea name=\".ins.\" cols=\"60\" rows=\"5\">
</textarea><br /><br />
<a href=\"#t\">戻</a>・題名<input type=\"text\" name=\".title.\" size=\"40\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kaigiw\" />
<input type=\"hidden\" name=\".m_add.\" value=\"kaigi\" />
<select name=\".t.\">
<option value=\"\">通常</option>
<option value=\"pre\">図表</option></select>
<input type=\"submit\" value=\"掲示\" />
</div></form>



PRI

	&FOOTER;
	exit;
}
1;