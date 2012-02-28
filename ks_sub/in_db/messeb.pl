
sub MOVE {


	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

$e_id=$in{'mes_id2'};
	&P_READ("p","$e_id","$e_id");
	if(!-e "./p_db/p/$e_id.cgi" and !-e "./p_db/touketu/$e_id.cgi") {&ER1('相手のIDが存在しません。'); }
	open(IN,"./w_db/guest/msbk_$f_id.cgi");
	@add_list = <IN>;
	close(IN);
	if($#add_list > 48) {&ER2('お気に入り登録数が多すぎます。'); }
$addw=$f_id;


	$hit=0;@add_list_new=();
	foreach(@add_list){
		($mdsid,$mdsname) = split(/<>/);
		if($mdsid eq $e_id) {
			$hit=1;
$com = "$p_name{$e_id}さんに対するお気に入り登録を解除しました";

		}elsif(!$mdsname){
		}else{
			push(@add_list_new,"$_");
		}
	}

	if(!$hit){
		unshift(@add_list_new,"$p_id{$e_id}<>$p_name{$e_id}<>\n");
$com = "$p_name{$e_id}さんに対するお気に入り登録設定をしました";
	}


	open(OUT,">./w_db/guest/msbk_$f_id.cgi");
	print OUT @add_list_new;
	close(OUT);

$addcom{'tegami'} = "個人宛手紙・武将検索に戻る";
$addcom{'messe'} = "手紙閲覧に戻る";

	&HEADER;

	print <<"PRI";
<hr /><span class=\"fs4\">$com</span>
<hr />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".sv.\" value=\"$in{'sv'}\" />
<input type=\"hidden\" name=\".mkj.\" value=\"$in{'mkj'}\" />$in{'sisan'}$in{'tiu'}$in{'hou'}
<input type=\"hidden\" name=\".m.\" value=\"$in{'addm'}\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
<input type=\"submit\" value=\"$addcom{$in{'addm'}}\" />
</div></form>
<br /><br />
PRI

	&FOOTER;
	exit;
}

1;