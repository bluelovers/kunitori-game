
sub MOVE {

	&P_OPEN;
	if($in{'tyuu'} eq "") { 

		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

	&HEADER;

	if($in{'i'} eq "i"){
	$come_cdl = <<"PRI";
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=\".m.\"><option value=\"$in{'m'}\">リロード</option><option value=\"i_cd\">コマンド</option><option value=\"i_s\">情報</option><option value=\"i_m\">手紙</option><option value=\"ikaigi\">門下省</option><option value="sirei">中書省</option><option value="ru-ru">尚書省</option><option value="ilog">過去ログ</option><option value="itemo">競売会場</option><option value="item">アイテム管理</option><option value="senpou">戦法設定</option><option value="gundan">軍団編成</option><option value="butai">部隊編成</option><option value="idkanri">LoginID管理</option><option value="come">コメント編集</option><option value="bcome">自己PR編集</option><option value="adcome">広告/OPT編集</option><option value="yakuba">国取役場</option><option value="tyuusei">忠誠度変更</option><option value="gazou">画像変更</option><option value="act_cd">アクティブC変更</option></select><input type=\"submit\" value=\"画面移動\" /><input type=\"hidden\" name=\".i.\" value=\"i\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /></div></form>

PRI
	}
	&IMG_SAKUSEI("$IMG{0}/bbs0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";
$come_cdl
<table class=\"bgc414141\" width=\"600\"><tr><td class=\"bgcFFFFFF\" width=\"100\">$img_sakusei_kekka</td>
<td class=\"bgc414141\" width=\"490\">
<span class=\"cFFFFFF\">《 忠誠度変更 》<br /><br />
<br /><br />
$k_name{$fk_id}に対する忠誠度を変更します。<br />入力された忠誠度は他国に開示されます。</span>
</td></tr></table>
<br /><br />
<form action=\"$COMMAND\" target=\"$ktms4w\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"tyuusei\" />
<input type=\"text\" name=\".tyuu.\" size=\"3\" value=\"$p_tyuusei{$f_id}\" />
<input type=\"submit\" value=\"忠誠度を左記の数値に変更\" /><br /><br />（0～100の半角数字で入力してください）</div></form><br /><br />
PRI
	&FOOTER;

	exit;
	}
	$in{'tyuu'} = abs(int($in{'tyuu'}));
	if($in{'tyuu'} > 100 ) { &ER1("0～100の間で入力してください。"); }




##########
$a_a_d="tyuusei<>0<>忠誠度を$in{'tyuu'}に設定 <><>$f_id<><>$in{'tyuu'}<><><><><><><>$p_kuni_yakusyoku{$f_id}<>$p_kunino{$f_id}<>\n";
		$xyz = "忠誠度を$in{'tyuu'}に設定 を<br />アクティブコマンドとして予約しました。";

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



	&CD_END("$xyz","$COMMAND","<input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"submit\" value=\"ＯＫ\" />","");#CD_END



	exit;

}
1;