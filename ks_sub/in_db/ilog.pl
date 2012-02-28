
sub MOVE {


	&P_OPEN;
require "./$mpg_r/sub_db/neko$KEITAI_T.pl";
&TAJYUU_HANTEI;
	open(IN,"./p_db/my_log/$f_id.cgi");
	@MY_LOG = <IN>;
	close(IN);

	$i=0;
	while($i<30){
$log_c .= "$MY_LOG[$i]<br />";
		if($i % 10 == 0){
		$log_c .= "<br />";
		}
		$i++;
	}
	&IMG_SAKUSEI("$p_img{$f_id}$p_img_f{$f_id}","$img_wide","$img_height","$p_img_m{$f_id}","b$f_id");

	&HEADER;
	print <<"PRI";

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=\".m.\"><option value=\"$in{'m'}\">リロード</option><option value=\"i_cd\">コマンド</option><option value=\"i_s\">情報</option><option value=\"i_m\">手紙</option><option value=\"ikaigi\">門下省</option><option value="sirei">中書省</option><option value="ru-ru">尚書省</option><option value="ilog">過去ログ</option><option value="itemo">競売会場</option><option value="item">アイテム管理</option><option value="senpou">戦法設定</option><option value="gundan">軍団編成</option><option value="butai">部隊編成</option><option value="idkanri">LoginID管理</option><option value="come">コメント編集</option><option value="bcome">自己PR編集</option><option value="adcome">広告/OPT編集</option><option value="yakuba">国取役場</option><option value="tyuusei">忠誠度変更</option><option value="gazou">画像変更</option><option value="act_cd">アクティブC変更</option></select><input type=\"submit\" value=\"画面移動\" /><input type=\"hidden\" name=\".i.\" value=\"i\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /></div></form>
$img_sakusei_kekka<br />
$p_p_b_a_i{$f_id}
<hr />
$log_c
PRI

	&FOOTER;
	exit;

}

1;
