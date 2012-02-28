
sub MOVE {


$in{'ita'} =abs(int($in{'ita'}));

	if($in{'ita'} > 20){
$in{'ita'} =0;
	}

$bbs_link_type = "kunibbs";
	open(IN,"./w_db/bbs_link_c$bbs_link_type$in{'ita'}.cgi");
	($kunibbs_no,$kunibbs_tt)=split(/,/,<IN>);
	close(IN);
$kunibbs_no ++;
	open(OUT,">./w_db/bbs_link_c$bbs_link_type$in{'ita'}.cgi");
	print OUT "$kunibbs_no,$kunibbs_tt";
	close(OUT);

	if($tt > 86400 + $kunibbs_tt){
require "$mpg_r/sub_db/bbs_link_c.pl";

	open(OUT,">./w_db/bbs_link_c$bbs_link_type$in{'ita'}.cgi");
	print OUT "$kunibbs_no,$tt";
	close(OUT);

$p_kunino{$f_id} =$in{'ita'};
	&BBS_LINK_C("$bbs_link_type");
	}

	&HEADER;

$ITAID{''} ='総合';
$ITAID{'0'} ='総合';
$ITAID{'1'} ='外交';
$ITAID{'2'} ='ギルド';
$ITAID{'3'} ='傭兵';
$ITAID{'4'} ='';
$ITAID{'5'} ='';
$ITAID{'6'} ='仲間募集';
$ITAID{'7'} ='クエスト';
$ITAID{'8'} ='取引';
$ITAID{'9'} ='依頼';
$ITAID{'10'} ='イベント';
$ITAID{'11'} ='質問';
$ITAID{'12'} ='情報交換';
$ITAID{'13'} ='';
$ITAID{'14'} ='殿堂';
$ITAID{'15'} ='歴史';
$ITAID{'16'} ='雑談';
$ITAID{'17'} ='';
$ITAID{'18'} ='Off';
$ITAID{'19'} ='AA';
$ITAID{'20'} ='ネタ';
$p_kunino{$f_id} =abs(int($in{'ita'}));
$bbsurl =$in{'ref_uri_d'};
$URI ="$URI_SP_D/$in{'bbsurl'}";

	&IMG_SAKUSEI("$IMG{0}/bbs0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";
<a id=\"t\"></a>
<table width=\"100%\">
<tr>
<td class=\"kbgcb0\" width=\"100%\">　<span class=\"kcc0\"><span class=\"fs4\">　　　＜＜<strong> * 国取掲示板 * </strong>＞＞（$ITAID{$in{'ita'}}）</span></span>
</td>
</tr>
</table>

<table width=\"500\"><tr><td class=\"txth\" width=\"20%\">
<form action=\"$bbsurl/$in{'bbsurl'}/$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".m.\" value=\"messe\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"submit\" value=\"手紙閲覧\" /></div></form></td><td class=\"txth\" width=\"20%\">

<form action=\"$bbsurl/$in{'bbsurl'}/$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kaigi\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"submit\" value=\"門下省\" />
</div></form></td><td class=\"txth\" width=\"20%\">
<form action=\"$bbsurl/$in{'bbsurl'}/$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"sirei\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<input type=\"submit\" value=\"中書省\" />
</div></form></td><td class=\"txth\" width=\"20%\">

<form action=\"$bbsurl/$in{'bbsurl'}/$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"ru-ru\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"submit\" value=\"尚書省\" />
</div></form></td><td class=\"txth\" width=\"20%\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<input type=\"submit\" value=\"国取掲示板\" />
</div></form></td>


</tr></table>


<table width=\"500\" class=\"bgc414141\"><tr><td width=\"96\" class=\"bgcFFFFFF\">$img_sakusei_kekka</td>
<td class=\"bgc414141\">
<span class=\"cFFFFFF\">受付：国取掲示板へようこそ。<br />ここは全サーバー共通の掲示板になります。<br />マナーを守って楽しくお使い下さい。($kunibbs_no\/PV)<br />キャラクターアイコンは対象サーバーが呼び出せない場合、<br />空白画像に自動的に差し替えられます。</span>
</td></tr></table>
<br />
<a href=\"#r\">新規投稿</a>
<table width=\"700\" border=\"1\"><tr class=\"bgcD3D3D3\">
<td colspan=\"5\" class=\"txtc\">板一覧</td></tr><tr>
<td class=\"txth\" width=\"100%\" colspan=\"5\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"0\" />
<input type=\"submit\" value=\"総合\" />
</div></form></td>
</tr><tr><td class=\"txth\" width=\"140\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"1\" />
<input type=\"submit\" value=\"外交\" />
</div></form></td><td class=\"txth\" width=\"140\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"2\" />
<input type=\"submit\" value=\"ギルド\" />
</div></form></td><td class=\"txth\" width=\"140\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"3\" />
<input type=\"submit\" value=\"傭兵\" />
</div></form></td><td class=\"txth\" width=\"140\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"4\" />
</div></form></td><td class=\"txth\" width=\"140\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"5\" />
</div></form></td>
</tr><tr><td class=\"txth\" width=\"140\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"6\" />
<input type=\"submit\" value=\"仲間募集\" />
</div></form></td>
<td class=\"txth\" width=\"140\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"7\" />
<input type=\"submit\" value=\"クエスト\" />
</div></form></td><td class=\"txth\" width=\"140\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"8\">
<input type=\"submit\" value=\"取引\" />
</div></form></td><td class=\"txth\" width=\"140\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"9\" />
<input type=\"submit\" value=\"依頼\" />
</div></form></td>
<td class=\"txth\" width=\"140\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"10\" />
<input type=\"submit\" value=\"イベント\" />
</div></form></td>

</tr><tr>
<td class=\"txth\" width=140>
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"11\" />
<input type=\"submit\" value=\"質問\" />
</div></form></td><td class=\"txth\" width=\"140\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"12\" />
<input type=\"submit\" value=\"情報交換\" />
</div></form></td><td class=\"txth\" width=\"140\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"13\" />
</div></form></td>
<td class=\"txth\" width=\"140\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"14\" />
<input type=\"submit\" value=\"殿堂\" />
</div></form></td><td class=\"txth\" width=\"140\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"15\" />
<input type=\"submit\" value=\"歴史\" />
</div></form></td>
</tr><tr>
<td class=\"txth\" width=\"140\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"16\" />
<input type=\"submit\" value=\"雑談\" />
</div></form></td>
<td class=\"txth\" width=\"140\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"17\" />
</div></form></td><td class=\"txth\" width=\"140\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\">
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"18\" />
<input type=\"submit\" value=\"Off\" />
</div></form></td><td class=\"txth\" width=\"140\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"19\" />
<input type=\"submit\" value=\"AA\" />
</div></form></td>
<td class=\"txth\" width=\"140\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"20\" />
<input type=\"submit\" value=\"ネタ\" />
</div></form></td>


</tr></table>
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
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigiw\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<input type=\"submit\" value=\"返信\" />
</div></form></td></tr>
<tr>
<td colspan=\"2\" class=\"txtr\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".b_no.\" value=\"$bbsid0\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<a href=\"#$bnot\">【$bbstitle0】</a><input type=\"submit\" value=\"このスレッドを全部読む\" />
</div></form></td></tr></table><a id=\"$bnon\"></a>\n<a href=\"#$bnot\">↑↑↑</a> <a href=\"#t\">戻</a> <a href=\"#w$bnon\">書</a> <a href=\"#$bnob\">↓↓↓</a>";
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
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
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
	open(IN,"./w_db/cmes/5g$p_kunino{$f_id}$bbsid0.cgi");
	@c_mes = <IN>;
	close(IN);
	foreach(@c_mes){
$c_mesa .= "$_";
	}
		}
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
<option value=\"age\">age</option></select>  <textarea name=\".ins.\" cols=\"65\" rows=\"2\"></textarea>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".b_no.\" value=\"$bbsid0\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigiw\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<input type=\"submit\" value=\"返信\" />
</div></form></td></tr>
<tr>
<td colspan=\"2\" class=\"txtr\">
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".b_no.\" value=\"$bbsid0\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<a href=\"#$bnot\">【$bbstitle0】</a><input type=\"submit\" value=\"このスレッドを全部読む\">
</div></form></td></tr></table><a id=\"$bnon\"></a>\n<a href=\"#$bnot\">↑↑↑</a> <a href=\"#t\">戻</a> <a href=\"#w$bnon\">書</a> <a href=\"#$bnob\">↓↓↓</a> ";
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
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigi\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
<input type=\"submit\" value=\"$bbstitle0・$bbsno0\" />
</div></form></td>";
}
	}


print <<"PRI";
<table border=\"1\" width=\"700\">
<tr><td width=\"13\"></td><td width=\"220\"></td><td width=\"13\"></td><td width=\"220\"></td><td width=\"13\"></td><td width=\"220\"></td></tr>
<tr class=\"bgcD3D3D3\"><td colspan=\"6\" class=\"txtc\">$ITAID{$in{'ita'}}板・スレッド一覧</td></tr><tr>
<tr>$c_meslt</span>
</tr>
</table><a id=\"0\"></a>\n<a href=\"#0\">↑↑↑</a> <a href=\"#t\">戻</a> <a href=\"#w0\">書</a> <a href=\"#1\">↓↓↓</a> 
$c_mesa
<a id=\"r\"></a><br /><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>

<textarea name=\".ins.\" cols=\"60\" rows=\"5\">
</textarea><br /><br />
<a href=\"#t\">戻</a>・題名<input type=\"text\" name=\".title.\" size=\"40\" />

<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"kunibbs_kaigiw\" />
<input type=\"hidden\" name=\".ref_uri_d.\" value=\"$in{'ref_uri_d'}\" />
<input type=\"hidden\" name=\".bbsurl.\" value=\"$in{'bbsurl'}\" />
<input type=\"hidden\" name=\".ita.\" value=\"$in{'ita'}\" />
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