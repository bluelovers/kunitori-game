
sub MOVE {


	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

		if("" eq $in{'mes_id2'}) {&ER2('相手を選択してください。'); }
	if(-e "./p_db/p/$in{'mes_id2'}.cgi") {
	open(IN,"./w_db/guest/msdk_$f_id.cgi");
	@add_list = <IN>;
	close(IN);
$addw=$f_id;

$e_id=$in{'mes_id2'};
	&P_READ("p","$e_id","$e_id");

	$hit=0;@add_list_new=();
	foreach(@add_list){
		($mdsid,$mdsname) = split(/<>/);
		if($mdsid eq $in{'mes_id2'}) {
			$hit=1;
$com = "$p_name{$e_id}さんに対する受信拒否設定を解除しました";

		}elsif(!$mdsname){
		}else{
			push(@add_list_new,"$_");
		}
	}

	if(!$hit){
		unshift(@add_list_new,"$p_id{$e_id}<>$p_name{$e_id}<>\n");
$com = "$p_name{$e_id}さんに対する受信拒否設定をしました";
	}

	}else{
	open(IN,"./w_db/guest/msdk_$p_kunino{$f_id}.cgi");
	@add_list = <IN>;
	close(IN);
$addw = $p_kunino{$f_id};
$p_id{$e_id} = $in{'mes_id2'};
$p_name{$e_id} = $k_name_d[$in{'mes_id2'}];
		if("" eq $p_name{$e_id}) {&ER2('相手を選択してください。'); }
$p_name{$e_id} = "$p_name{$e_id}からの国宛外交文";
	$hit=0;@add_list_new=();
	foreach(@add_list){
		($mdsid,$mdsname) = split(/<>/);
		if($mdsid eq $in{'mes_id2'}) {
			$hit=1;
$com = "$p_name{$e_id}に対する受信拒否設定を解除しました";

		}elsif(!$mdsname){
		}else{
			push(@add_list_new,"$_");
		}
	}

	if(!$hit){
		unshift(@add_list_new,"$p_id{$e_id}<>$p_name{$e_id}<>\n");
$com = "$p_name{$e_id}に対する受信拒否設定をしました";
	}

	}


	open(OUT,">./w_db/guest/msdk_$addw.cgi");
	print OUT @add_list_new;
	close(OUT);


	&HEADER;


	print <<"PRI";
<hr /><span class=\"fs4\">$com</span>
<hr />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".sv.\" value=\"$in{'sv'}\" />
<input type=\"hidden\" name=\".mkj.\" value=\"$in{'mkj'}\" />
<input type=\"hidden\" name=\".m.\" value=\"messed\" />
<input type=\"submit\" value=\"メッセージ/受信拒否設定に戻る\" />
</div></form>
<br /><br />
PRI

	&FOOTER;
	exit;
}

1;