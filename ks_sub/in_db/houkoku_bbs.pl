
sub MOVE {

use LWP::Simple;
	&TT_GET;
	&HOST_NAME;
	&HEADER;

$bbsurl =$in{'ref_uri_d'};
	open(IN,"./w_db/bagu_end.cgi");
	@BAGU_END = <IN>;
	close(IN);
	$misyori_kazu = @BAGU_END;
	$misyori_c = "<br />現在、未処理の報告が$misyori_kazu件溜まっています。";
if($misyori_kazu > 30) {
	if($misyori_kazu > 50) {
	$misyori_c .= "<br />大変混雑していますので、後日改めてご報告下さい。";
	}else{
	$misyori_c .= "<br />混雑しているため、返答にはかなりの時間を要する可能性があります。";
	}
}

if($in{'id'} eq "-$mpass") {
	($p0name,$cgimg,$rank_mes,$ttadd,$p0f_id) = split(/<>/,$buffer);
$p0name ='管理人';
$cgimg ='0';
$rank_mes ='管理人';
$ttadd ='';
$p0f_id ='';

}else{
$buffer ="";
	$buffer = get("$bbsurl/$in{'bbsurl'}/drkunibbs.cgi?.id.=$in{'id'}&amp;.pass.=$in{'pass'}&amp;.t.=$n2");

#	if($buffer eq "") { &ER1("BBSサーバーが停止中です。しばらくたってからアクセスしてください。。"); }
	if($buffer !~ /<><>/) { &ER1("IDパスワードが一致しません。"); }
	($p0name,$cgimg,$rank_mes,$ttadd,$p0f_id) = split(/<>/,$buffer);
	if("$in{'bbsurl'}-$p0f_id" ne $in{'ita'}) { &ER1("面＆IDパスワードが一致しません。"); }
}

$p_kunino{$f_id} =$in{'ita'};
$bbsurl =$in{'ref_uri_d'};
$URI ="$URI_SP_D/$in{'bbsurl'}";
	&IMG_SAKUSEI("$IMG{0}/bbs0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";
<a id="t"></a>
<table width=\"100%\">
<tr>
<td class=\"kbgcb0\" width=\"100%\">　<span class=\"kcc0\"><span class=\"fs4\">　　　＜＜<strong> * $in{'ita'}専用・バグ報告掲示板 * </strong>＞＞</span></span>
</td>
</tr>
</table>

<table width=\"500\"><tr>
<td class=\"txth\" width=\"25%\">
<form action="$bbsurl/$in{'bbsurl'}/$COMMAND" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=houkoku>
<input type=\"hidden\" name=.ita. value=$in{'ita'}>
<input type=\"hidden\" name=.bbsurl. value=$in{'bbsurl'}>
<input type=\"submit\" value="バグ報告フォーム">
</div></form></td>
<td class=\"txth\" width=\"25%\">
<form action="$URI_SP_D/support/$COMMAND" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=houkoku_bbs>
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=.bbsurl. value=$in{'bbsurl'}>
<input type=\"hidden\" name=.ita. value=$in{'ita'}>
<input type=\"submit\" value="バグ報告掲示板">
</div></form></td>

</tr></table>

<table width=\"500\" class=\"bgc414141\"><tr><td width=\"96\" class=\"bgcFFFFFF\">$img_sakusei_kekka</td>
<td class=\"bgc414141\">
<span class=\"cFFFFFF\">受付：バグ報告掲示板へようこそ。<br />ここは貴方専用のバグ報告掲示板です。<br />新規報告を行う際はバグ報告フォームの方でお願い致します。<br />バグの修正までは時間がかかることがありますので<br />予めご了承ください。
$misyori_c</td></tr></table>
<br />

PRI



if($in{'id'} eq "-$mpass" and $in{'pass'} eq "ixchel") {

	open(IN,"./w_db/bagu_end.cgi");
	@BAGU_END = <IN>;
	close(IN);

$c_mesa = "";
$c_meslt = "";

$bno = 0;

$burlno = "$in{'b_no'}";

	if($in{'b_no'} ne ""){
	foreach(@BAGU_END){
		($bbsid0,$bbsno0,$bbstitle0,$bbsita,$bbsurl) = split(/<>/);

$p_kunino{$f_id} =$bbsita;
	if($bbsid0 eq $in{'b_no'}){
		if(-e "./w_db/cmes/all$p_kunino{$f_id}$bbsid0.pl"){
require "./w_db/cmes/all$p_kunino{$f_id}$burlno.pl";
		}else{
	open(IN,"./w_db/cmes/all$p_kunino{$f_id}$bbsid0.cgi");
	@c_mes = <IN>;
	close(IN);
	foreach(@c_mes){
$c_mesa .= "$_";
	}
		}
$bnot = $bno;
$bnon = $bno+1;
$bnob = $bno+2;
$c_mesa .= "<a id=w$bnot></a>
<table border=\"0\" width=\"700\" class=\"kbgcc$k_iro_d{$fk_id}\">

<tr>
<td colspan=\"2\" class=\"txtr\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<select name=.t.>
<option value=>通常
<option value=pre>図表
<option value=kaiketu>解決
<option value=ijyounasi>正常
<option value=douitu>同一
<option value=rogubusoku>不明
<option value=iken>意見
<option value=item1>Lv１
<option value=item2>Lv２
<option value=item3>Lv３
<option value=>＝＝
<option value=kiyaku>規約</select>
<select name=.sage.>
<option value=sage>sage
<option value=age>age</select> <textarea name=.ins. cols=65 rows=2></textarea>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=.b_no. value=$bbsid0>
<input type=\"hidden\" name=\".m.\" value=houkoku2>
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=.bbsurl. value=$in{'bbsurl'}>
<input type=\"hidden\" name=.ita. value=$p_kunino{$f_id}>
<input type=\"submit\" value=\"返信\" /></div></form>
</td></tr>
    <tr>
      <td colspan=\"2\" class=\"txtr\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=.b_no. value=$bbsid0>
<input type=\"hidden\" name=\".m.\" value=houkoku_bbs>
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=.bbsurl. value=$in{'bbsurl'}>
<input type=\"hidden\" name=.ita. value=$p_kunino{$f_id}>
<a href=#$bnot>【$bbstitle0】</a><input type=\"submit\" value=このスレッドを全部読む>
</div></form></td></tr></table><a id=$bnon></a>\n<a href=#$bnot>↑↑↑</a> <a href=\"#t\">戻</a> <a href=#w$bnon>書</a> <a href=#$bnob>↓↓↓</a>";
	}
	if($bno % 3 == 0 and $bno > 0){
$c_meslt .= "
</tr><tr>";
	}
$bno ++;
$c_meslt .= "
<td><a href=#$bnot>移</a></td><td class=\"bgc000000\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=.b_no. value=$bbsid0>
<input type=\"hidden\" name=\".m.\" value=houkoku_bbs>
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=.bbsurl. value=$in{'bbsurl'}>
<input type=\"hidden\" name=.ita. value=$p_kunino{$f_id}>
<input type=\"submit\" value=$bbstitle0・$bbsno0></div></form></td>";
}
	}else{

	foreach(@BAGU_END){
		($bbsid0,$bbsno0,$bbstitle0,$bbsita,$bbsurl) = split(/<>/);
$p_kunino{$f_id} =$bbsita;
$bnot = $bno;
$bnon = $bno+1;
$bnob = $bno+2;
		if($bno < 30){
		if(-e "./w_db/cmes/5g$p_kunino{$f_id}$bbsid0.pl"){
require "./w_db/cmes/5g$p_kunino{$f_id}$bbsid0.pl";
		}else{
	open(IN,"./w_db/cmes/5g$p_kunino{$f_id}$bbsid0.cgi");
	@c_mes = <IN>;
	close(IN);
	foreach(@c_mes){
$c_mesa .= "$_";
	}
		}
$c_mesa .= "<a id=w$bnot></a>
<table border=\"0\" width=\"70%\" class=\"kbgcc$k_iro_d{$fk_id}\">

<tr>

<td colspan=\"2\" class=\"txtr\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<select name=.t.>
<option value=>通常
<option value=pre>図表
<option value=kaiketu>解決
<option value=ijyounasi>正常
<option value=douitu>同一
<option value=rogubusoku>不明
<option value=iken>意見
<option value=item1>Lv１
<option value=item2>Lv２
<option value=item3>Lv３
<option value=>＝＝
<option value=kiyaku>規約</select>
<select name=.sage.>
<option value=sage>sage
<option value=age>age</select>  <textarea name=.ins. cols=65 rows=2></textarea>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=.b_no. value=$bbsid0>
<input type=\"hidden\" name=\".m.\" value=houkoku2>
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=.bbsurl. value=$in{'bbsurl'}>
<input type=\"hidden\" name=.ita. value=$p_kunino{$f_id}>
<input type=\"submit\" value=\"返信\" /></div></form>
</td></tr>
    <tr>
      <td colspan=\"2\" class=\"txtr\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=.b_no. value=$bbsid0>
<input type=\"hidden\" name=\".m.\" value=houkoku_bbs>
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=.bbsurl. value=$in{'bbsurl'}>
<input type=\"hidden\" name=.ita. value=$p_kunino{$f_id}>
<a href=#$bnot>【$bbstitle0】</a><input type=\"submit\" value=このスレッドを全部読む></div></form>
</td></tr></table><a id=$bnon></a>\n<a href=#$bnot>↑↑↑</a> <a href=\"#t\">戻</a> <a href=#w$bnon>書</a> <a href=#$bnob>↓↓↓</a> ";
		}
	if($bno % 3 == 0 and $bno > 0){
$c_meslt .= "
</tr><tr>";
	}

$bno ++;

$c_meslt .= "
<td><a href=#$bnot>移</a></td><td class=\"bgc000000\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=.b_no. value=$bbsid0>
<input type=\"hidden\" name=\".m.\" value=houkoku_bbs>
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=.bbsurl. value=$in{'bbsurl'}>
<input type=\"hidden\" name=.ita. value=$p_kunino{$f_id}>
<input type=\"submit\" value=$bbstitle0・$bbsno0>
</div></form></td>";
}
	}


print <<"PRI";
<table border=\"1\" width=\"700\">
<tr><td width=13></td><td width=220></td><td width=13></td><td width=220></td><td width=13></td><td width=220></td></tr>
<tr><td colspan=\"6\" class=\"txtc\"bgcolor=#D3D3D3>スレッド一覧</td></tr><tr>
<tr>$c_meslt</span>
</tr>
</table><a id=0></a>\n<a href=#0>↑↑↑</a> <a href=\"#t\">戻</a> <a href=#w0>書</a> <a href=#1>↓↓↓</a> 
$c_mesa
</span>

PRI


	&FOOTER;
	exit;


}else{
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
	open(IN,"./w_db/cmes/all$p_kunino{$f_id}$in{'b_no'}.cgi");
	@c_mes = <IN>;
	close(IN);
	foreach(@c_mes){
$c_mesa .= "$_";
	}
		}
$bnot = $bno;
$bnon = $bno+1;
$bnob = $bno+2;
$c_mesa .= "<a id=w$bnot></a>
<table border=\"0\" width=\"700\" class=\"kbgcc$k_iro_d{$fk_id}\">

<tr>
<td colspan=\"2\" class=\"txtr\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<select name=.t.>
<option value=>通常
<option value=pre>図表</select>
<select name=.sage.>
<option value=sage>sage
<option value=age>age</select> <textarea name=.ins. cols=65 rows=2></textarea>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=.b_no. value=$bbsid0>
<input type=\"hidden\" name=\".m.\" value=houkoku2>
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=.bbsurl. value=$in{'bbsurl'}>
<input type=\"hidden\" name=.ita. value=$in{'ita'}>
<input type=\"submit\" value=\"返信\" />
</div></form></td></tr>
    <tr>
      <td colspan=\"2\" class=\"txtr\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=.b_no. value=$bbsid0>
<input type=\"hidden\" name=\".m.\" value=houkoku_bbs>
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=.bbsurl. value=$in{'bbsurl'}>
<input type=\"hidden\" name=.ita. value=$in{'ita'}>
<a href=#$bnot>【$bbstitle0】</a><input type=\"submit\" value=このスレッドを全部読む>
</div></form></td></tr></table><a id=$bnon></a>\n<a href=#$bnot>↑↑↑</a> <a href=\"#t\">戻</a> <a href=#w$bnon>書</a> <a href=#$bnob>↓↓↓</a>";
	}
	if($bno % 3 == 0 and $bno > 0){
$c_meslt .= "
</tr><tr>";
	}
$bno ++;
$c_meslt .= "
<td><a href=#$bnot>移</a></td><td class=\"bgc000000\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=.b_no. value=$bbsid0>
<input type=\"hidden\" name=\".m.\" value=houkoku_bbs>
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=.bbsurl. value=$in{'bbsurl'}>
<input type=\"hidden\" name=.ita. value=$in{'ita'}>
<input type=\"submit\" value=$bbstitle0・$bbsno0></div></form></td>";
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
	open(IN,"./w_db/cmes/5g$p_kunino{$f_id}$bbsid0.cgi");
	@c_mes = <IN>;
	close(IN);
	foreach(@c_mes){
$c_mesa .= "$_";
	}
		}
$c_mesa .= "<a id=w$bnot></a>
<table border=\"0\" width=\"700\" class=\"kbgcc$k_iro_d{$fk_id}\">

<tr>
<td colspan=\"2\" class=\"txtr\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<select name=.t.>
<option value=>通常
<option value=pre>図表</select>
<select name=.sage.>
<option value=sage>sage
<option value=age>age</select>  <textarea name=.ins. cols=65 rows=2></textarea>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=.b_no. value=$bbsid0>
<input type=\"hidden\" name=\".m.\" value=houkoku2>
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=.bbsurl. value=$in{'bbsurl'}>
<input type=\"hidden\" name=.ita. value=$in{'ita'}>
<input type=\"submit\" value=\"返信\" />
</div></form></td></tr>
    <tr>
      <td colspan=\"2\" class=\"txtr\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=.b_no. value=$bbsid0>
<input type=\"hidden\" name=\".m.\" value=houkoku_bbs>
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=.bbsurl. value=$in{'bbsurl'}>
<input type=\"hidden\" name=.ita. value=$in{'ita'}>
<a href=#$bnot>【$bbstitle0】</a><input type=\"submit\" value=このスレッドを全部読む>
</div></form></td></tr></table><a id=$bnon></a>\n<a href=#$bnot>↑↑↑</a> <a href=\"#t\">戻</a> <a href=#w$bnon>書</a> <a href=#$bnob>↓↓↓</a> ";
		}
	if($bno % 3 == 0 and $bno > 0){
$c_meslt .= "
</tr><tr>";
	}

$bno ++;

$c_meslt .= "
<td><a href=#$bnot>移</a></td><td class=\"bgc000000\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=.b_no. value=$bbsid0>
<input type=\"hidden\" name=\".m.\" value=houkoku_bbs>
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=.bbsurl. value=$in{'bbsurl'}>
<input type=\"hidden\" name=.ita. value=$in{'ita'}>
<input type=\"submit\" value=$bbstitle0・$bbsno0>
</div></form></td>";
}
	}


print <<"PRI";
<table border=\"1\" width=\"700\">
<tr><td width=13></td><td width=220></td><td width=13></td><td width=220></td><td width=13></td><td width=220></td></tr>
<tr><td colspan=\"6\" class=\"txtc\"bgcolor=#D3D3D3>スレッド一覧</td></tr><tr>
<tr>$c_meslt
</tr>
</table><a id=0></a>\n<a href=#0>↑↑↑</a> <a href=\"#t\">戻</a> <a href=#w0>書</a> <a href=#1>↓↓↓</a> 
$c_mesa


PRI


	&FOOTER;
	exit;
}
}
1;