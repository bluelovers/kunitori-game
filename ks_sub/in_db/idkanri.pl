
sub MOVE {

	&P_OPEN;

	&HOST_NAME;

	if($in{'i'} eq "i"){
	$come_cdl = <<"PRI";
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><select name=\".m.\"><option value=\"$in{'m'}\">リロード</option><option value=\"i_cd\">コマンド</option><option value=\"i_s\">情報</option><option value=\"i_m\">手紙</option><option value=\"ikaigi\">門下省</option><option value="sirei">中書省</option><option value="ru-ru">尚書省</option><option value="ilog">過去ログ</option><option value="itemo">競売会場</option><option value="item">アイテム管理</option><option value="senpou">戦法設定</option><option value="gundan">軍団編成</option><option value="butai">部隊編成</option><option value="idkanri">LoginID管理</option><option value="come">コメント編集</option><option value="bcome">自己PR編集</option><option value="adcome">広告/OPT編集</option><option value="yakuba">国取役場</option><option value="tyuusei">忠誠度変更</option><option value="gazou">画像変更</option><option value="act_cd">アクティブC変更</option></select><input type=\"submit\" value=\"画面移動\" /><input type=\"hidden\" name=\".i.\" value=\"i\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /></div></form>

PRI
	}
	open(IN,"./p_db/mid/$f_id.cgi");
	@CM_DATA = <IN>;
	close(IN);
	($k0asouid,$k0asoupass,$k0id,$k0asou1ip,$k0asou1tt,$k0asou2ip,$k0asou2tt,$k0asou3ip,$k0asou3tt) = split(/<>/,$CM_DATA[0]);
	($k1asouid,$k1asoupass) = split(/<>/,$CM_DATA[1]);
	($k2asouid,$k2asoupass) = split(/<>/,$CM_DATA[2]);
	($k3asouid,$k3asoupass) = split(/<>/,$CM_DATA[3]);

	if($k1asouid){
	open(IN,"./p_db/id/$k1asouid.cgi");
	@CM_DATA = <IN>;
	close(IN);
	($k1asouid,$k1asoupass,$k1id,$k1asou1ip,$k1asou1tt,$k1asou2ip,$k1asou2tt,$k1asou3ip,$k1asou3tt) = split(/<>/,$CM_DATA[0]);

		if($kasouid eq $k1asouid){
	$jyoukyouno = "LoginID Vol.1";

		}
	}
	if($k2asouid){
	open(IN,"./p_db/id/$k2asouid.cgi");
	@CM_DATA = <IN>;
	close(IN);
	($k2asouid,$k2asoupass,$k2id,$k2asou1ip,$k2asou1tt,$k2asou2ip,$k2asou2tt,$k2asou3ip,$k2asou3tt) = split(/<>/,$CM_DATA[0]);

		if($kasouid eq $k2asouid){
	$jyoukyouno = "LoginID Vol.2";

		}
	}
	if($k3asouid){
	open(IN,"./p_db/id/$k3asouid.cgi");
	@CM_DATA = <IN>;
	close(IN);
	($k3asouid,$k3asoupass,$k3id,$k3asou1ip,$k3asou1tt,$k3asou2ip,$k3asou2tt,$k3asou3ip,$k3asou3tt) = split(/<>/,$CM_DATA[0]);

		if($kasouid eq $k3asouid){
	$jyoukyouno = "LoginID Vol.3";

		}
	}

		if(!$kasouhit){
	$jyoukyouno = "デフォルトのID";
	$kasouid = $f_id;

		}
	$jyoukyou0 = "ご主人様のアカウントは現在$jyoukyouno（$kasouid）で認証されています。
<br />セキュリティ面から考えるとマスターIDを別途登録し、<br />ログイン専用IDを登録されることを強くお勧めいたします。<br />";

		if(!-e "./p_db/mid/$f_id.cgi"){
	$jyoukyou1 = "マスターIDは現在未設定です。<br />現マスターID/Passを空欄のまま、新マスターID/Passの設定を行ってください。";

		}else{ 
	if(!$kasouhit){
	$jyoukyou0 = "ご主人様のアカウントは現在$jyoukyouno（$kasouid）で認証されています。
<br />ログイン専用IDを登録されることを強くお勧めいたします。<br />";
	$jyoukyou1 = "マスターIDは設定済みです。<br />登録したマスターIDを利用して、新LoginIDの登録・編集を行って下さいませ。";
	}else{ 
	$jyoukyou0 = "ご主人様のアカウントは現在$jyoukyouno（$kasouid）で認証されています。
<br />";
	$jyoukyou1 = "マスターIDは設定済みです。LoginIDの登録・編集を行いますか？";
	}

		}

		if($in{'vol'} ne ""){
$in{'knid'} =~ tr/A-Z/a-z/;
	if ($in{'knid'} eq $f_id) {&ER2("マスターIDやLoginIDに、デフォルトID（$f_id）を使用することは出来ません。"); }
	if ($in{'vol'} and $in{'knid'} eq $k0asouid) {&ER2("LoginIDに、マスターID（$k0asouid）を使用することは出来ません。"); }
	if ($in{'knid'} =~ m/[^0-9a-zA-Z]/) {&ER2("IDに半角英数字以外の文字が含まれています。"); }
	if ($in{'knid'} !~ m/[^0-9]/){&ER2("IDが数字のみで構成されています。英字を１字以上混ぜてください。"); }
	if ($in{'knpass'} =~ m/[^0-9a-zA-Z]/) {&ER2("パスワードに半角英数字以外の文字が含まれています。"); }

	if(length($in{'knid'}) < 4 or length($in{'knid'}) > 12) { &ER2("IDは、4文字以上、12文字以下で入力して下さい。"); }
	if(length($in{'knpass'}) < 4 or length($in{'knpass'}) > 12) { &ER2("パスワードは、4文字以上、12文字以下で入力して下さい。"); }

$add = $in{'knid'};
$add1 = $add;
$add2 = $add;
$add =~ s/(.)\1+/$1/g;
	if (length($add) < 4){&ER2("$in{'knid'}←IDが単純すぎです。<br /><br />連続文字列が多すぎます。<br />（b111、777p2、4d222等は×）（uhyo22、paon5等は○）"); }
$add1 =~ tr/a-zA-Z//d;
$add1 =~ s/(.)\1+/$1/g;
$add2 =~ tr/a-zA-Z//cd;
$add2 =~ s/(.)\1+/$1/g;
	if (length($add1) < 3 and length($add2) < 3){&ER2("$in{'knid'}←IDが単純すぎです。<br /><br />なるべく連続文字列を使わずに、もう少し文字数を増やしてください。"); }

$add = $in{'knpass'};
$add1 = $add;
$add2 = $add;
$add =~ s/(.)\1+/$1/g;
	if (length($add) < 4){&ER2("$in{'knpass'}←passが単純すぎです。<br /><br />連続文字列が多すぎます。<br />（b111、777p2、4d222等は×）（uhyo22、paon5等は○）"); }
$add1 =~ tr/a-zA-Z//d;
$add1 =~ s/(.)\1+/$1/g;
$add2 =~ tr/a-zA-Z//cd;
$add2 =~ s/(.)\1+/$1/g;
	if (length($add1) < 3 and length($add2) < 3){&ER2("$in{'knpass'}←passが単純すぎです。<br /><br />なるべく連続文字列を使わずに、もう少し文字数を増やしてください。"); }




	if(-e "./p_db/id/$in{'knid'}.cgi") {&ER2("そのIDは登録済みです。違うIDを入力してください。");}

	if(-e "./p_db/bl/$in{'knid'}.cgi") {&ER2("そのIDは登録済みです。違うIDを入力してください。");}
	if(-e "./p_db/touketu/$in{'knid'}.cgi") {&ER2("そのIDは登録済みです。違うIDを入力してください。");}
	if(-e "./p_db/p/$in{'knid'}.cgi") {&ER2("そのIDは登録済みです。違うIDを入力してください。");}
		}

		if($in{'vol'} eq "0"){
			if(!$kasouhit or ($k0asouid eq $in{'koid'} and $k0asoupass eq $in{'kopass'})){
&TT_GET;
	if ($in{'knid'} eq $k1asouid) {&ER2("マスターIDに、LoginID Vol.1（$k1asouid）を使用することは出来ません。"); }
	if ($in{'knid'} eq $k2asouid) {&ER2("マスターIDに、LoginID Vol.2（$k2asouid）を使用することは出来ません。"); }
	if ($in{'knid'} eq $k3asouid) {&ER2("マスターIDに、LoginID Vol.3（$k3asouid）を使用することは出来ません。"); }
	if (!$kasouhit) {
	$jyoukyouz = "マスターIDは「ID管理」に必要な管理専用IDです。ログインには使用できません。<br />引き続き、登録したマスターIDを利用し、新LoginIDの登録・編集を行って下さいませ。";
	}else{ 
	$jyoukyouz = "以前使用していた旧マスターID（$k0asouid）は使用不能となりました。<br />尚、マスターIDは「ID管理」に必要な管理専用IDです。ログインには使用できません。";
	}
	$k0asouid = $in{'knid'};
	$k0asoupass = $in{'knpass'};
	@KTM=();
	if ($host_name ne $k0asou1ip) {
	unshift(@KTM,"$k0asouid<>$k0asoupass<>$k0id<>$host_name<>$tt_date<>$k0asou1ip<>$k0asou1tt<>$k0asou2ip<>$k0asou2tt<>\n");
	}else{ 
	unshift(@KTM,"$k0asouid<>$k0asoupass<>$k0id<>$k0asou1ip<>$k0asou1tt<>$k0asou2ip<>$k0asou2tt<>$k0asou3ip<>$k0asou3tt<>\n");
	}
			push(@KTM,"$k1asouid<>$k1asoupass<>\n");
			push(@KTM,"$k2asouid<>$k2asoupass<>\n");
			push(@KTM,"$k3asouid<>$k3asoupass<>\n");
	open(OUT,">./p_db/mid/$f_id.cgi");
	print OUT @KTM;
	close(OUT);

	$jyoukyou1 = "マスターIDの設定/変更が完了\しました。<br />再発行は出来ませんので、メモに取る等、大切に保管ください。<br /><br />新マスターID：$in{'knid'}、Pass：$in{'knpass'}<br /><br />$jyoukyouz";

			}else{ 
&ER2("マスターID/Passが正しくありません");
			}
		}elsif($in{'vol'} eq "1"){
			if(-e "./p_db/mid/$f_id.cgi" and $k0asouid eq $in{'koid'} and $k0asoupass eq $in{'kopass'}){
			if((!-e "./p_db/id/$in{'knid'}.cgi" or $k1asouid eq $in{'knid'}) and !-e "./p_db/p/$in{'knid'}.cgi" and !-e "./p_db/touketu/$in{'knid'}.cgi" and !-e "./p_db/bl/$in{'knid'}.cgi"){
&TT_GET;
	if (!$kasouhit) {
&F_LOCK;
	$p_pass{$f_id} = "\<$p_pass{$f_id}";
&P_SAVE("p","$f_id","$f_id");
	&UNLOCK_FILE;
	$jyoukyouz = "デフォルトのID/Passが使用不能になりました。<br />新しく発行されたIDを利用し、TOP画面から一度ログインしなおすようお願い致します。";
	}else{ 
		if ($k1asouid and $k1asouid ne $in{'knid'}) {
	$jyoukyouz = "以前使用していた旧LoginID Vol.1（$k1asouid）は使用不能となりました。";
		}
	}
	$jyoukyou1 = "LoginID Vol.1の設定/変更が完了\しました。<br />再発行は出来ませんので、メモに取る等、大切に保管ください。<br /><br />新LoginID Vol.1 ID：$in{'knid'}、Pass：$in{'knpass'}<br /><br />$jyoukyouz";

		unlink("./p_db/id/$k1asouid.cgi");

	$k1asouid = $in{'knid'};
	$k1asoupass = $in{'knpass'};
	$in{'id'} = $in{'knid'};
	$in{'pass'} = $in{'knpass'};
	@KTM=();
	if ($host_name ne $k0asou1ip) {
	unshift(@KTM,"$k0asouid<>$k0asoupass<>$k0id<>$host_name<>$tt_date<>$k0asou1ip<>$k0asou1tt<>$k0asou2ip<>$k0asou2tt<>\n");
	}else{ 
	unshift(@KTM,"$k0asouid<>$k0asoupass<>$k0id<>$k0asou1ip<>$k0asou1tt<>$k0asou2ip<>$k0asou2tt<>$k0asou3ip<>$k0asou3tt<>\n");
	}
			push(@KTM,"$k1asouid<>$k1asoupass<>\n");
			push(@KTM,"$k2asouid<>$k2asoupass<>\n");
			push(@KTM,"$k3asouid<>$k3asoupass<>\n");
	open(OUT,">./p_db/mid/$f_id.cgi");
	print OUT @KTM;
	close(OUT);
	@KTM=();
	unshift(@KTM,"$in{'knid'}<>$in{'knpass'}<>$f_id<>$host_name<>$tt_date<><><><><>\n");
	open(OUT,">./p_db/id/$in{'knid'}.cgi");
	print OUT @KTM;
	close(OUT);

			}else{ 
&ER2("そのIDは既に使用されています。");
			}
			}else{ 
&ER2("マスターID/Passが正しくありません");
			}
		}elsif($in{'vol'} eq "2"){
			if(-e "./p_db/mid/$f_id.cgi" and $k0asouid eq $in{'koid'} and $k0asoupass eq $in{'kopass'}){
			if((!-e "./p_db/id/$in{'knid'}.cgi" or $k2asouid eq $in{'knid'}) and !-e "./p_db/p/$in{'knid'}.cgi" and !-e "./p_db/touketu/$in{'knid'}.cgi" and !-e "./p_db/bl/$in{'knid'}.cgi"){
&TT_GET;
	if (!$kasouhit) {
&F_LOCK;
	$p_pass{$f_id} = "\<$p_pass{$f_id}";
&P_SAVE("p","$f_id","$f_id");
	&UNLOCK_FILE;

	$jyoukyouz = "デフォルトのID/Passが使用不能になりました。<br />新しく発行されたIDを利用し、TOP画面から一度ログインしなおすようお願い致します。";
	}else{ 
		if ($k2asouid and $k2asouid ne $in{'knid'}) {
	$jyoukyouz = "以前使用していた旧LoginID Vol.2（$k2asouid）は使用不能となりました。";
		}
	}
	$jyoukyou1 = "LoginID Vol.2の設定/変更が完了\しました。<br />再発行は出来ませんので、メモに取る等、大切に保管ください。<br /><br />新LoginID Vol.2 ID：$in{'knid'}、Pass：$in{'knpass'}<br /><br />$jyoukyouz";

		unlink("./p_db/id/$k2asouid.cgi");
	$k2asouid = $in{'knid'};
	$k2asoupass = $in{'knpass'};
	$in{'id'} = $in{'knid'};
	$in{'pass'} = $in{'knpass'};
	@KTM=();
	if ($host_name ne $k0asou1ip) {
	unshift(@KTM,"$k0asouid<>$k0asoupass<>$k0id<>$host_name<>$tt_date<>$k0asou1ip<>$k0asou1tt<>$k0asou2ip<>$k0asou2tt<>\n");
	}else{ 
	unshift(@KTM,"$k0asouid<>$k0asoupass<>$k0id<>$k0asou1ip<>$k0asou1tt<>$k0asou2ip<>$k0asou2tt<>$k0asou3ip<>$k0asou3tt<>\n");
	}
			push(@KTM,"$k1asouid<>$k1asoupass<>\n");
			push(@KTM,"$k2asouid<>$k2asoupass<>\n");
			push(@KTM,"$k3asouid<>$k3asoupass<>\n");
	open(OUT,">./p_db/mid/$f_id.cgi");
	print OUT @KTM;
	close(OUT);
	@KTM=();
	unshift(@KTM,"$in{'knid'}<>$in{'knpass'}<>$f_id<>$host_name<>$tt_date<><><><><>\n");
	open(OUT,">./p_db/id/$in{'knid'}.cgi");
	print OUT @KTM;
	close(OUT);

			}else{ 
&ER2("そのIDは既に使用されています。");
			}
			}else{ 
&ER2("マスターID/Passが正しくありません");
			}
		}elsif($in{'vol'} eq "3"){
			if(-e "./p_db/mid/$f_id.cgi" and $k0asouid eq $in{'koid'} and $k0asoupass eq $in{'kopass'}){
			if((!-e "./p_db/id/$in{'knid'}.cgi" or $k3asouid eq $in{'knid'}) and !-e "./p_db/p/$in{'knid'}.cgi" and !-e "./p_db/touketu/$in{'knid'}.cgi" and !-e "./p_db/bl/$in{'knid'}.cgi"){
&TT_GET;
	if (!$kasouhit) {
&F_LOCK;
	$p_pass{$f_id} = "\<$p_pass{$f_id}";
&P_SAVE("p","$f_id","$f_id");
	&UNLOCK_FILE;

	$jyoukyouz = "デフォルトのID/Passが使用不能になりました。<br />新しく発行されたIDを利用し、TOP画面から一度ログインしなおすようお願い致します。";
	}else{ 
		if ($k3asouid and $k3asouid ne $in{'knid'}) {
	$jyoukyouz = "以前使用していた旧LoginID Vol.3（$k3asouid）は使用不能となりました。";
		}
	}
	$jyoukyou1 = "LoginID Vol.3の設定/変更が完了\しました。<br />再発行は出来ませんので、メモに取る等、大切に保管ください。<br /><br />新LoginID Vol.3 ID：$in{'knid'}、Pass：$in{'knpass'}<br /><br />$jyoukyouz";

		unlink("./p_db/id/$k3asouid.cgi");
	$k3asouid = $in{'knid'};
	$k3asoupass = $in{'knpass'};
	$in{'id'} = $in{'knid'};
	$in{'pass'} = $in{'knpass'};
	@KTM=();
	if ($host_name ne $k0asou1ip) {
	unshift(@KTM,"$k0asouid<>$k0asoupass<>$k0id<>$host_name<>$tt_date<>$k0asou1ip<>$k0asou1tt<>$k0asou2ip<>$k0asou2tt<>\n");
	}else{ 
	unshift(@KTM,"$k0asouid<>$k0asoupass<>$k0id<>$k0asou1ip<>$k0asou1tt<>$k0asou2ip<>$k0asou2tt<>$k0asou3ip<>$k0asou3tt<>\n");
	}
			push(@KTM,"$k1asouid<>$k1asoupass<>\n");
			push(@KTM,"$k2asouid<>$k2asoupass<>\n");
			push(@KTM,"$k3asouid<>$k3asoupass<>\n");
	open(OUT,">./p_db/mid/$f_id.cgi");
	print OUT @KTM;
	close(OUT);
	@KTM=();
	unshift(@KTM,"$in{'knid'}<>$in{'knpass'}<>$f_id<>$host_name<>$tt_date<><><><><>\n");
	open(OUT,">./p_db/id/$in{'knid'}.cgi");
	print OUT @KTM;
	close(OUT);

			}else{ 
&ER2("そのIDは既に使用されています。");
			}
			}else{ 
&ER2("マスターID/Passが正しくありません");
			}
		}

		if($in{'vol2'} eq "1"){
			if(-e "./p_db/mid/$f_id.cgi" and $k0asouid eq $in{'koid'} and $k0asoupass eq $in{'kopass'}){
	$jyoukyouvol1 = "未設定";
	$jyoukyouvol2 = "未設定";
	$jyoukyouvol3 = "未設定";
		if($k1asouid){
	$jyoukyouvol1 = "id（$k1asouid）、pass（$k1asoupass）";

		}
		if($k2asouid){
	$jyoukyouvol2 = "id（$k2asouid）、pass（$k2asoupass）";

		}
		if($k3asouid){
	$jyoukyouvol3 = "id（$k3asouid）、pass（$k3asoupass）";

		}
	$jyoukyoue = "<br /><br />現在登録されているLoginIDは以下の通りです。<br /><br />LoginID Vol.1⇒$jyoukyouvol1<br />LoginID Vol.2⇒$jyoukyouvol2<br />LoginID Vol.3⇒$jyoukyouvol3";
			}else{ 
&ER2("マスターID/Passが正しくありません");
			}
		}
	&HEADER;

	&IMG_SAKUSEI("$IMG{0}/bbs0$p_img_kakutyou{0}","$img_wide_d","$img_height_d","$p_img_mime{0}","b$f_id");
	print <<"PRI";
$come_cdl

<table class=\"kbgcb$k_iro_d{$fk_id}\" width=\"700\">
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td class=\"txth\" width=\"100\">$p_name{$f_id}</td>
<td rowspan=\"4\" class=\"bgc414141\" width=\"600\">
<span class=\"cFFFFFF\">
《 LoginID管理 》<br /><br />

最初に登録したデフォルトIDでのログインを取り止め、ログイン専用のLoginIDを登録・編集します。
<br />マスターIDを設定し、LoginIDを複数登録することで、
ID/Passの度忘れやID乗っ取りをある程度回避可\能に。<br />
LoginIDは最大で3個まで登録可\能です。<br />尚、バグ報告を行う際はマスターIDやLoginIDではなく、デフォルトIDを添えてお願い致します。
<br /><br />デフォルトID⇒初期登録で登録したID。個人の伝記等でネット上に公開される為クラックされやすい。
<br />マスターID⇒LoginID管理画面を操作する際に必要。このIDではログイン不可\。
<br />LoginID⇒ログイン専用ID。デフォルトIDと別にすることでIDの推測を困難に。
</span></td></tr>

<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td width=\"15\">$img_sakusei_kekka</td></tr>
<tr class=\"kbgcc$k_iro_d{$fk_id}\"><td class=\"txth\">デフォルトID<br />$f_id</td></tr>

</table>

PRI


print <<"PRI";
<hr />
<div>

<table width=\"500\" class=\"bgc884422\">
<tr class=\"bgc884422\"><td></td><td></td><td></td></tr>
<tr class=\"bgcF8F0E8\"><td colspan=\"3\">$p_name{$f_id}の侍女
<br /><br />こんにちは、ご主人様。現在のシステム状況を報告致します。
<br /><br />$jyoukyou0$jyoukyou1$jyoukyoue
</td></tr>
</table>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<table width=\"500\" class=\"bgc884422\">
<tr class=\"bgc884422\"><td width=\"110\"></td><td width=\"120\"></td><td></td></tr>
<tr class=\"bgcFFF0F5\"><td colspan=\"3\" class=\"txth\">
マスターIDの設定
</td></tr>
<tr><td class=\"bgcF8F0E8\">現マスターID</td><td><input type=\"text\" size=\"10\" name=\".koid.\"></td>
<td rowspan=\"4\" class=\"bgcF8F0E8 txtc\">
IDの設定変更に使用されたIP。<br />（同一IPの場合ログには残りません）<br /><br />
前回、IP「$k0asou1ip」$k0asou1tt。<br />前々回、IP「$k0asou2ip」$k0asou2tt。<br />3回前、IP「$k0asou3ip」$k0asou3tt。</td>
</tr>
<tr><td class=\"bgcF8F0E8\">現マスターPass</td><td><input type=\"password\" size=\"10\" name=\".kopass.\" /></td></tr>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<tr><td class=\"bgcF8F0E8\">新マスターID</td><td><input type=\"text\" size=\"10\" name=\".knid.\" /></td></tr>
<tr><td class=\"bgcF8F0E8\">新マスターPass</td><td><input type=\"password\" size=\"10\" name=\".knpass.\" /></td></tr>
<input type=\"hidden\" name=\".m.\" value=\"idkanri\" /><input type=\"hidden\" name=\".vol.\" value=\"0\" />
<tr class=\"bgcF8F0E0\"><td class=\"txtc\" colspan=\"3\"><input type=\"submit\" value=\"設定\" /></td></tr></table>
</div></form>


<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<table width=\"500\" class=\"bgc884422\">
<tr class=\"bgc884422\"><td width=\"110\"></td><td width=\"120\"></td><td></td></tr>
<tr class=\"bgcFFF0F5\"><td colspan=\"3\" class=\"txth\">
LoginID Vol.1の設定
</td></tr>
<tr><td class=\"bgcF8F0E8\">現マスターID</td><td><input type=\"text\" size=\"10\" name=\".koid.\" /></td>
<td rowspan=\"4\" class=\"bgcF8F0E8 txtc\">
LoginID Vol.1でログインした際のIP。<br />（同一IPの場合ログには残りません）<br /><br />
前回、IP「$k1asou1ip」$k1asou1tt。<br />前々回、IP「$k1asou2ip」$k1asou2tt。<br />3回前、IP「$k1asou3ip」$k1asou3tt。</td>
</tr>
<tr><td class=\"bgcF8F0E8\">現マスターPass</td><td><input type=\"password\" size=\"10\" name=\".kopass.\" /></td></tr>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<tr><td class=\"bgcF8F0E8\">新LoginID Vol.1</td><td><input type=\"text\" size=\"10\" name=\".knid.\" /></td></tr>
<tr><td class=\"bgcF8F0E8\">新LoginPass Vol.1</td><td><input type=\"password\" size=\"10\" name=\".knpass.\" /></td></tr>
<input type=\"hidden\" name=\".m.\" value=\"idkanri\" /><input type=\"hidden\" name=\".vol.\" value=\"1\" />
<tr class=\"bgcF8F0E0\"><td class=\"txtc\" colspan=\"3\"><input type=\"submit\" value=\"設定\" /></td></tr></table>
</div></form>

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<table width=\"500\" class=\"bgc884422\">
<tr class=\"bgc884422\"><td width=\"110\"></td><td width=\"120\"></td><td></td></tr>
<tr class=\"bgcFFF0F5\"><td colspan=\"3\" class=\"txth\">
LoginID Vol.2の設定
</td></tr>
<tr><td class=\"bgcF8F0E8\">現マスターID</td><td><input type=\"text\" size=\"10\" name=\".koid.\" /></td>
<td rowspan=\"4\" class=\"bgcF8F0E8 txtc\">
LoginID Vol.2でログインした際のIP。<br />（同一IPの場合ログには残りません）<br /><br />
前回、IP「$k2asou1ip」$k2asou1tt。<br />前々回、IP「$k2asou2ip」$k2asou2tt。<br />3回前、IP「$k2asou3ip」$k2asou3tt。
</td>
</tr>
<tr><td class=\"bgcF8F0E8\">現マスターPass</td><td><input type=\"password\" size=\"10\" name=\".kopass.\" /></td></tr>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<tr><td class=\"bgcF8F0E8\">新LoginID Vol.2</td><td><input type=\"text\" size=\"10\" name=\".knid.\" /></td></tr>
<tr><td class=\"bgcF8F0E8\">新LoginPass Vol.2</td><td><input type=\"password\" size=\"10\" name=\".knpass.\" /></td></tr>
<input type=\"hidden\" name=\".m.\" value=\"idkanri\" /><input type=\"hidden\" name=\".vol.\" value=\"2\" />
<tr class=\"bgcF8F0E0\"><td class=\"txtc\" colspan=\"3\"><input type=\"submit\" value=\"設定\" /></td></tr></table>
</div></form>


<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<table width=\"500\" class=\"bgc884422\">
<tr class=\"bgc884422\"><td width=\"110\"></td><td width=\"120\"></td><td></td></tr>
<tr class=\"bgcFFF0F5\"><td colspan=\"3\" class=\"txth\">
LoginID Vol.3の設定
</td></tr>
<tr><td class=\"bgcF8F0E8\">現マスターID</td><td><input type=\"text\" size=\"10\" name=\".koid.\" /></td>
<td rowspan=\"4\" class=\"bgcF8F0E8 txtc\">
LoginID Vol.3でログインした際のIP。<br />（同一IPの場合ログには残りません）<br /><br />
前回、IP「$k3asou1ip」$k3asou1tt。<br />前々回、IP「$k3asou2ip」$k3asou2tt。<br />3回前、IP「$k3asou3ip」$k3asou3tt。
</td>
</tr>
<tr><td class=\"bgcF8F0E8\">現マスターPass</td><td><input type=\"password\" size=\"10\" name=\".kopass.\" /></td></tr>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<tr><td class=\"bgcF8F0E8\">新LoginID Vol.3</td><td><input type=\"text\" size=\"10\" name=\".knid.\" /></td></tr>
<tr><td class=\"bgcF8F0E8\">新LoginPass Vol.3</td><td><input type=\"password\" size=\"10\" name=\".knpass.\" /></td></tr>
<input type=\"hidden\" name=\".m.\" value=\"idkanri\" /><input type=\"hidden\" name=\".vol.\" value=\"3\" />
<tr><td class=\"bgcF8F0E0\" class=\"txtc\" colspan=\"3\"><input type=\"submit\" value=\"設定\" /></td></tr></table>
</div></form>



<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div>
<table width=\"500\" class=\"bgc884422\">
<tr class=\"bgc884422\"><td width=\"110\"></td><td width=\"120\"></td><td></td></tr>
<tr class=\"bgcFFF0F5\"><td colspan=\"3\" class=\"txth\">
LoginID一覧
</td></tr>
<tr><td class=\"bgcF8F0E8\">現マスターID</td><td><input type=\"text\" size=\"10\" name=\".koid.\" /></td>
<td rowspan=\"2\" class=\"bgcF8F0E8 txtc\">LoginIDを一覧表示\します。
</td>
</tr>
<tr><td class=\"bgcF8F0E8\">現マスターPass</td><td><input type=\"password\" size=\"10\" name=\".kopass.\" /></td></tr>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"idkanri\" /><input type=\"hidden\" name=\".vol2.\" value=\"1\" />
<tr class=\"bgcF8F0E0\"><td class=\"txtc\" colspan=\"3\"><input type=\"submit\" value=\"閲覧する\" /></td></tr></table>
</div></form>


</div>

PRI
	&FOOTER;

	exit;

}
1;