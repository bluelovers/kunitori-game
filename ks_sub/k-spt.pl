
sub HOST_NAME {

	$host = $ENV{'HTTP_X_FORWARDED_FOR'};
 $host_name = $ENV{'HTTP_X_FORWARDED_FOR'};
 if (!$ENV{'HTTP_X_FORWARDED_FOR'}) {
	$host = $ENV{'REMOTE_ADDR'};
 $host_name = $ENV{'REMOTE_ADDR'};
 }
	$value = "$ENV{'HTTP_USER_AGENT'}$ENV{'HTTP_X_UP_SUBNO'}";

#$value =~ s/\&/&#38;/g;

$value =~ s/</&lt;/g;
$value =~ s/>/&gt;/g;
$value =~ s/$TAG_q0/&quot;/g;
$value =~ s/\//&#47;/g;
$value =~ s/,/&#44;/g;
$value =~ s/\'/&#39;/g;
$value =~ s/\\$/\\ /g;

$value =~ s/%/&#37;/g;
$value =~ s/=/&#61;/g;
#$value =~ s/@/&#64;/g;
#$value =~ s/`/&#96;/g;
#$value =~ s/}/&#125;/g;
#$value =~ s/{/&#123;/g;
$value =~ s/eval/&#101;val/g;

$value =~ s/\r//g;
$value =~ s/\n//g;
$hosta =$value;
$host =~ s/,/。/g;
$host_name =~ s/,/。/g;

}

sub P_READ {

			open(READ,"./p_db/$_[0]/$_[1].cgi");
			@p_db_view = <READ>;
			close(READ);

				&P_VIEW("$_[0]","$_[1]","$_[2]");
}

sub P_VIEW {
				&P_VW("$_[0]","$_[1]","$_[2]");
$p_img_w{$p_cg_sabano{$_[2]}}="$IMG{$p_cg_sabano{$_[2]}}/";
$p_img_w{$p_cg_sabano{$_[2]}}.=int($p_cgno_d{$_[2]});
$p_img_w{"gif"}="$p_cgno_d{$_[2]}";
$p_img_w{"jpg"}="$p_cgno_d{$_[2]}";
$p_img_w{"png"}="$p_cgno_d{$_[2]}";
$p_img_w{"jpeg"}="$p_cgno_d{$_[2]}";
$p_img{$_[2]}=$p_img_w{$p_cg_sabano{$_[2]}};
$p_img_f{$_[2]}=$p_img_kakutyou{$p_cg_sabano{$_[2]}};
$p_img_m{$_[2]}=$p_img_mime{$p_cg_sabano{$_[2]}};

$p_p_b_a{$_[2]} = "<a href=\"./?.m.=p_b&amp;.id.=$p_id{$_[2]}\" target=\"_blank\"><span class=\"kcb$p_k_iro_d{$_[2]}\">$p_name{$_[2]}</span></a>";
}

###########

sub P_SAVE {

				&P_SW("$_[0]","$_[1]","$_[2]");
	open(SAVE,">./p_db/$_[0]/$_[1].cgi");
	print SAVE @NEW_D;
	close(SAVE);
}

###########

sub TOUKETU_SAVE {

				&P_SAVE("$_[0]","$_[1]","$_[2]");
push(@NEW_D,"$tenkakaisuu<>$keika_nen<>\n");
	open(SAVE,">./p_db/$_[0]/$_[1].cgi");
	print SAVE @NEW_D;
	close(SAVE);
}
###########

sub BL_SAVE {

				&TOUKETU_SAVE("$_[0]","$_[1]","$_[2]");
push(@NEW_D,"$apontm<>$apontmk<>$host<>$ckid<>\n");
push(@NEW_D,"$a2pontm<>$a2pontmk<>$host<>$k2id<>\n");
	open(SAVE,">./p_db/$_[0]/$_[1].cgi");
	print SAVE @NEW_D;
	close(SAVE);
}

############

sub P_OPEN {

	$kasouhit = 0;
		if(-e "./p_db/id/$in{'id'}.cgi"){
	$kasoupass=n;
	$kasouid = $in{'id'};
	$kasouhit = 1;
	open(IN,"./p_db/id/$kasouid.cgi");
	@CM_DATA = <IN>;
	close(IN);
	($kasouid,$kasoupass,$f_id,$kasou1ip,$kasou1tt,$kasou2ip,$kasou2tt,$kasou3ip,$kasou3tt) = split(/<>/,$CM_DATA[0]);

	if($in{'pass'} ne $kasoupass){
		if($kasouid and $in{'id'} ne $kasouid){
	&HEADER;
			if(!$in{'defoid'}){
	print <<"PRI";
<pre>
LoginIDが破損しています。
下記フォームよりデフォルトIDを追記し送信してください。
</pre>
<form action=\"$COMMAND\" method=\"post\" target=\"_top\" utn=\"utn\"><div>
<table class=\"bgc884422\"><tr><input type=\"hidden\" name=\".m.\" value=\"defo\" /><td class=\"bgcF8F0E8\">&nbsp;LoginID&nbsp;</td><td><input type=\"text\" size=\"15\" maxlength=\"12\" name=\".id.\" /></td></tr>
<tr><td class=\"bgcF8F0E8\">&nbsp;LoginPass&nbsp;</td><td><input type=\"password\" size=\"8\" maxlength=\"8\" name=\".pass.\" /></td></tr>
<tr><td class=\"bgcF8F0E8\">&nbsp;DefaultID&nbsp;</td><td><input type=\"text\" size=\"15\" maxlength=\"12\" name=\".defoid.\" /></td></tr>

<tr><td class=\"bgcF8F0E0\" class=\"txtc\" colspan=\"2\"><input type=\"submit\" value=\"LoginID修復\" /></td></tr></table></div></form>

PRI
	&FOOTER;
	exit;
			}

	open(IN,"./p_db/mid/$in{'defoid'}.cgi");
	@CM_DATA = <IN>;
	close(IN);
	($k0asouid,$k0asoupass,$k0id,$k0asou1ip,$k0asou1tt,$k0asou2ip,$k0asou2tt,$k0asou3ip,$k0asou3tt) = split(/<>/,$CM_DATA[0]);
	($k1asouid,$k1asoupass) = split(/<>/,$CM_DATA[1]);
	($k2asouid,$k2asoupass) = split(/<>/,$CM_DATA[2]);
	($k3asouid,$k3asoupass) = split(/<>/,$CM_DATA[3]);

	if(($k1asouid eq $in{'id'} and $k1asoupass eq $in{'pass'}) or ($k2asouid eq $in{'id'} and $k2asoupass eq $in{'pass'}) or ($k3asouid eq $in{'id'} and $k3asoupass eq $in{'pass'})){
	@KTM=();

	$kasouid = $in{'id'};
	$kasoupass = $in{'pass'};
	$f_id = $in{'defoid'};

	unshift(@KTM,"$kasouid<>$kasoupass<>$f_id<>$host_name<>$tt_date<><><><><>\n");
	open(OUT,">./p_db/id/$in{'id'}.cgi");
	print OUT @KTM;
	close(OUT);
	}else{ 
&ER2("IDが確認できません。");
	}
		}else{ 
	if(!$f_id){
&ER2("IDが確認できません。");
	}else{ 
&ER2("ID/パスが正しくありません");
	}
		}
	}
	&P_READ("p","$f_id","$f_id");

	if(!$f_id){
		if(-e "./p_db/touketu/$f_id.cgi"){
&ER2("貴方のIDは何らかの理由で凍結処理されています。ログイン画面にある「凍結解除」をお試しください。");
		}else{ 
&ER2("IDが確認できません。IDが凍結されている場合がありますので、ログイン画面にある「凍結解除」をお試しください。");
		}
	}
		}else{ 
	$kasouid = $in{'id'};
	$kasouhit2 = 0;
	if($in{'id'} eq "-$mpass"){
	$kasouid = $in{'pass'};
	$kasouhit2 = 1;
	}
	$p_pass{$f_id}=n;
	$f_id = $kasouid;

	&P_READ("p","$kasouid","$kasouid");

	if(!$p_id{$kasouid}){
		if(-e "./p_db/touketu/$kasouid.cgi"){
&ER2("貴方のIDは何らかの理由で凍結処理されています。ログイン画面にある「凍結解除」をお試しください。");
		}else{ 
&ER2("IDが確認できません。");
		}
	}
	if($in{'pass'} ne $p_pass{$f_id} and !$kasouhit2){
&ER2("ID/パスが正しくありません");
	}
	$kasouid = "";
		}

}

############
sub PRLOG {

	open(IN,"./pr/$ttid.cgi");
	@S_MOVEPR = <IN>;
	close(IN);

	unshift(@S_MOVEPR,"$_[0]$tt_date\n");


	open(OUT,">./pr/$ttid.cgi");
	print OUT @S_MOVEPR;
	close(OUT);

}
############

sub MAP_LOG {


$_[1] = $_[0]; 
$_[1] =~ s/<(.*?)>//g;

	open(OUT,">>./w_db/add_map_log.cgi");
	print OUT "$_[0]$tt_date<>$tt<>$tt_rss<>$_[1]<>$URI/?.m.=map2<>$_[2]<>$_[3]<>\n";
	close(OUT);

}

############

sub F_LOG {

	open(IN,"./p_db/my_log/$f_id.cgi");
	@F_LOG = <IN>;
	close(IN);

	unshift(@F_LOG,"$_[0]$tt_date\n");

	splice(@F_LOG,200);

	open(OUT,">./p_db/my_log/$f_id.cgi");
	print OUT @F_LOG;
	close(OUT);

}


############

sub TT_GET {
#	$tt = time();
	($sec,$min,$hour,$mday,$mon,$year,$wday,$yday) = localtime(time);
	$mon++;
	$year += 1900;
	$ww = (Sun,Mon,Tue,Wed,Thu,Fri,Sat)[$wday];
	$tt_date = sprintf("（$year %02d\/%02d\ %02d\:%02d\）", $mon, $mday, $hour, $min);
	$tt_rss = sprintf("$year-%02d\-%02d\T%02d\:%02d\+09:00", $mon, $mday, $hour, $min);
}


############

sub T_OPEN {

$ft_id = int($_[1]);
		if(-e "./w_db/tosi_db/$ft_id.cgi"){
	&T_READ("tosi_db","$ft_id","$ft_id");

		}else{ 
&ER1("その街は存在しません。");
		}
		if(-e "./w_db/allc_tosi_db.pl"){
require "./w_db/all_tosi_db.pl";

		}else{ 
require "./w_db/all2_tosi_db.pl";
		}

}

sub T_READ {

			open(READ,"./w_db/$_[0]/$_[1].cgi");
			@t_db_view = <READ>;
			close(READ);
				&T_VIEW("$_[0]","$_[1]","$_[2]");
}

sub T_VIEW {

				&T_VW("$_[0]","$_[1]","$_[2]");
}

###########

sub T_SAVE {

		if($t_id{$_[2]}eq""){
&ER1("記録エラー。管理人に報$t_id{$_[2]}$t_name{$_[2]}告してください$_[0]$_[1]$_[2]");

		}
		if(-e "./w_db/$_[0]/$_[1].cgi"){
	&T_N_SAVE("$_[0]","$_[1]","$_[2]");
		}

}

###########

sub T_W1_SAVE {
				&T_SW("$_[0]","$_[1]","$_[2]");
	open(SAVE,">./w_db/$_[0]/$_[1].cgi");
	print SAVE @TOSI_N_D;
	close(SAVE);
}
sub T_W2_SAVE {

$w_s_tosi = '';
@town_get = ();
@town_mes = ();
@N_T_DB_L = ();
opendir(SPDFRW,"./w_db/$_[0]");
	while($wt_id = readdir(SPDFRW)){
		if($wt_id =~ /\.cgi/i){
$wt_id =~ s/\.cgi//;
$wt_id = int($wt_id);
			if($t_id{$wt_id} eq "" or $_[1] eq $wt_id){
	&T_READ("$_[0]","$wt_id","$wt_id");
			}else{ 
			open(READ,"./w_db/$_[0]/$wt_id.cgi");
			@t_db_view = <READ>;
			close(READ);
	&T_VIEW("$_[0]","$wt_id","$wt_id");
			}
		$t_name[$wt_id] = $t_name{$wt_id};
		$t_kunino[$wt_id] = $t_kunino{$wt_id};
		$t_zokuno[$wt_id] = $t_zokuno{$wt_id};
		$town_get[$t_kunino{$wt_id}] ++;
		$town_mes[$t_kunino{$wt_id}] .="$t_name{$wt_id} ";
			if($town_get[$t_kunino{$wt_id}] % 13 == 0){
		$town_mes[$t_kunino{$wt_id}].="<br />";
			}
$w_s_tosi .= "\$t_name\[$wt_id\] = \'" . $t_name[$wt_id] . '\';' . "\$t_kunino\[$wt_id\] = \'" . $t_kunino[$wt_id] . '\';';
$w_s_tosi .= "\$t_zokuno\[$wt_id\] = \'" . $t_zokuno[$wt_id] . '\';';
			push(@N_T_DB_L,"@t_db_view");
		}
	}
closedir(SPDFRW);
	foreach(@k_no_all_l){
		$add_kid=$_;
		$add_kid=int($add_kid);
	if($k_outo{$add_kid} eq ""){
	&K_READ("kuni_db","$add_kid","$add_kid");
	}
	if($k_kokka_keitai{$add_kid}){
$town_mes[$add_kid] = "$t_name[$k_outo{$add_kid}]の賊砦";
	}else{
$town_mes[$add_kid] .= "<br />$town_get[$add_kid]都市/王都:$t_name[$k_outo{$add_kid}]";
	}
$w_s_tosi .= "\$town_get\[$add_kid\] = \'" . $town_get[$add_kid] . '\';';
$w_s_tosi .= "\$town_mes\[$add_kid\] = \'" . $town_mes[$add_kid] . '\';';
	}
	$tosi_kazu = @N_T_DB_L;
$w_s_tosi .= "\$tosi_kazu = \'" . $tosi_kazu . '\';';
	$w_s_tosi .= '1;';
							unlink("./w_db/allc_$_[0].pl");
							unlink("./w_db/all_$_[0].pl");
		open(OUT,">./w_db/all_$_[0].pl");
		print OUT $w_s_tosi;
		close(OUT);
		open(OUT,">./w_db/allc_$_[0].pl");
		print OUT $w_tosi_kazu_l;
		close(OUT);
		open(OUT,">./w_db/all2_$_[0].pl");
		print OUT $w_s_tosi;
		close(OUT);
		open(OUT,">./w_db/t_db_l_$_[0].cgi");
		print OUT @N_T_DB_L;
		close(OUT);
		open(OUT,">./w_db/tosi_kazu.cgi");
		print OUT $tosi_kazu;
		close(OUT);

}

sub T_N_SAVE {
				&T_W1_SAVE("$_[0]","$_[1]","$_[2]");
				&T_W2_SAVE("$_[0]","$_[1]","$_[2]");

}
############

sub K_OPEN {

$fk_id = int($_[1]);
		if(-e "./w_db/kuni_db/$fk_id.cgi"){
		if(-e "./w_db/allc_kuni_db.pl"){
require "./w_db/all_kuni_db.pl";
		}else{ 
require "./w_db/all2_kuni_db.pl";
		}
	&K_READ("kuni_db","$fk_id","$fk_id");
		}else{ 
			if($fk_id){
&ER1("その国は存在しません。");
			}
$k_name{$fk_id}= '無所属';
		if(-e "./w_db/allc_kuni_db.pl"){
require "./w_db/all_kuni_db.pl";
		}else{ 
require "./w_db/all2_kuni_db.pl";
		}
		}

}

sub K_READ {

			open(READ,"./w_db/$_[0]/$_[1].cgi");
			@k_db_view = <READ>;
			close(READ);
				&K_VIEW("$_[0]","$_[1]","$_[2]");
}

sub K_VIEW {
				&K_VW("$_[0]","$_[1]","$_[2]");
$k_p_k_a{$_[2]} = "<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_id{$_[2]}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$_[2]}\">$k_name_d{$_[2]}</span></a>";

}

###########

sub K_SAVE {

		if($k_id{$_[2]}eq""){
&ER1("記録エラー。管理人に報告してください$_[0]$_[1]$_[2]");

		}
		if(-e "./w_db/$_[0]/$_[1].cgi"){
	&K_N_SAVE("$_[0]","$_[1]","$_[2]");
		}

}

###########

sub K_W1_SAVE {
				&K_SW("$_[0]","$_[1]","$_[2]");
	open(SAVE,">./w_db/$_[0]/$_[1].cgi");
	print SAVE @KUNI_N_D;
	close(SAVE);
}

sub K_W2_SAVE {
$w_s_kuni = '';
@N_K_DB_L = ();
@N_K_DB_L_D = ();
@k_seizon_l = ();
@k_no_all_l = ();
$kuni_kazu = 0;
$kuni_kazu_d = 0;
$kuni_kazu_max =0;
opendir(SPDFRW,"./w_db/$_[0]");
	while($wk_id = readdir(SPDFRW)){
		if($wk_id =~ /\.cgi/i){
$wk_id =~ s/\.cgi//;
$wk_id = int($wk_id);
			if(!$k_id{$wk_id} or $_[1] eq $wk_id){
	&K_READ("$_[0]","$wk_id","$wk_id");
			}else{ 
			open(READ,"./w_db/$_[0]/$wk_id.cgi");
			@k_db_view = <READ>;
			close(READ);
	&K_VIEW("$_[0]","$wk_id","$wk_id");
			}

		$k_name[$wk_id] = $k_name{$wk_id};
		$k_kunino[$wk_id] = $k_kunino{$wk_id};
		$k_iro_d[$wk_id] = $k_iro_d{$wk_id};
		$k_busyou_suu[$wk_id] = $k_busyou_suu{$wk_id};
$w_s_kuni .= "\$k_name\[$wk_id\] = \'" . $k_name[$wk_id] . '\';' . "\$k_kunino\[$wk_id\] = \'" . $k_kunino[$wk_id] . '\';';
$w_s_kuni .= "\$k_iro_d\[$wk_id\] = \'" . $k_iro_d[$wk_id] . '\';' . "\$k_busyou_suu\[$wk_id\] = \'" . $k_busyou_suu[$wk_id] . '\';';
			push(@N_K_DB_L_D,"@k_db_view");
				if($k_kunino{$wk_id}){
		$k_seizon_l[$kuni_kazu] = $wk_id;
$w_s_kuni .= "\$k_seizon_l\[$kuni_kazu\] = \'" . $wk_id . '\';';
			push(@N_K_DB_L,"@k_db_view");
$kuni_kazu ++;
				}
	$k_name_d[$wk_id] = $k_name_d{$wk_id};
$w_s_kuni .= "\$k_name_d\[$wk_id\] = \'" . $k_name_d{$wk_id} . '\';';
		$k_no_all_l[$kuni_kazu_d] = $wk_id;
$w_s_kuni .= "\$k_no_all_l\[$kuni_kazu_d\] = \'" . $wk_id . '\';';
				if($wk_id > $kuni_kazu_max){
$kuni_kazu_max =$wk_id;
				}
$kuni_kazu_d ++;
		}
	}
closedir(SPDFRW);

	$kuni_kazu = @N_K_DB_L;
	$kuni_kazu_d = @N_K_DB_L_D;
$w_s_kuni .= "\$k_name_d\[0\] = \'" . '無所属' . '\';';
$w_s_kuni .= "\$k_kunino\[0\] = \'" . '0' . '\';';
$w_s_kuni .= "\$k_iro_d\[0\] = \'" . '0' . '\';';
$w_s_kuni .= "\$k_name\[0\] = \'" . '無所属' . '\';';
$w_s_kuni .= "\$kuni_kazu = \'" . $kuni_kazu . '\';';
$w_s_kuni .= "\$kuni_kazu_d = \'" . $kuni_kazu_d . '\';';
$w_s_kuni .= "\$kuni_kazu_max = \'" . $kuni_kazu_max . '\';';
$w_s_kuni .= "\$kuni_tenka_kaisuu = \'" . $tenkakaisuu . '\';';
	$w_s_kuni .= '1;';
							unlink("./w_db/allc_$_[0].pl");
							unlink("./w_db/all_$_[0].pl");
		open(OUT,">./w_db/all_$_[0].pl");
		print OUT $w_s_kuni;
		close(OUT);
		open(OUT,">./w_db/allc_$_[0].pl");
		print OUT $w_kuni_kazu_l;
		close(OUT);
		open(OUT,">./w_db/all2_$_[0].pl");
		print OUT $w_s_kuni;
		close(OUT);
		open(OUT,">./w_db/k_db_l_$_[0].cgi");
		print OUT @N_K_DB_L;
		close(OUT);
		open(OUT,">./w_db/k_db_d_l_$_[0].cgi");
		print OUT @N_K_DB_L_D;
		close(OUT);
		open(OUT,">./w_db/kuni_kazu.cgi");
		print OUT $kuni_kazu;
		close(OUT);
		open(OUT,">./w_db/kuni_kazu_d.cgi");
		print OUT $kuni_kazu_d;
		close(OUT);
}
sub K_N_SAVE {
				&K_W1_SAVE("$_[0]","$_[1]","$_[2]");
				&K_W2_SAVE("$_[0]","$_[1]","$_[2]");

}


############

sub BUTAI_OPEN {

$fbutai_id = int($_[1]);
		if(-e "./w_db/butai_db/$fbutai_id.cgi"){
	&BUTAI_READ("butai_db","$fbutai_id","$fbutai_id");

		}else{ 
			if($fbutai_id){
&ER1("その部隊は存在しません。");
			}
$butai_name{$fbutai_id}= '無所属';
		}
		if(-e "./w_db/allc_butai_db.pl"){
require "./w_db/all_butai_db.pl";

		}else{ 
require "./w_db/all2_butai_db.pl";
		}

}

sub BUTAI_READ {

			open(READ,"./w_db/$_[0]/$_[1].cgi");
			@butai_db_view = <READ>;
			close(READ);
				&BUTAI_VIEW("$_[0]","$_[1]","$_[2]");
}

sub BUTAI_VIEW {
				&BUTAI_VW("$_[0]","$_[1]","$_[2]");

}

###########

sub BUTAI_SAVE {

		if($butai_id{$_[2]}eq""){
&ER1("記録エラー。管理人に報告してください$_[0]$_[1]$_[2]");

		}
		if(-e "./w_db/$_[0]/$_[1].cgi"){
	&BUTAI_N_SAVE("$_[0]","$_[1]","$_[2]");
		}

}

###########

sub BUTAI_W1_SAVE {
				&BUTAI_SW("$_[0]","$_[1]","$_[2]");
	open(SAVE,">./w_db/$_[0]/$_[1].cgi");
	print SAVE @BUTAI_N_D;
	close(SAVE);
}

sub BUTAI_W2_SAVE {
$w_s_butai = '';
@N_BUTAI_DB_L = ();
@N_BUTAI_DB_L_D = ();
@butai_seizon_l = ();
$butai_kazu = 0;
$butai_kazu_d = 0;
$butai_kazu_max =0;
$butai_kazu_next =0;
opendir(SPDFRW,"./w_db/$_[0]");
	while($wbutai_id = readdir(SPDFRW)){
		if($wbutai_id =~ /\.cgi/i){
$wbutai_id =~ s/\.cgi//;
$wbutai_id = int($wbutai_id);
			if(!$butai_id{$wbutai_id} or $_[1] eq $wbutai_id){
	&BUTAI_READ("$_[0]","$wbutai_id","$wbutai_id");
			}else{ 
			open(READ,"./w_db/$_[0]/$wbutai_id.cgi");
			@butai_db_view = <READ>;
			close(READ);
	&BUTAI_VIEW("$_[0]","$wbutai_id","$wbutai_id");
			}

		$butai_name[$wbutai_id] = $butai_name{$wbutai_id};
		$butai_kunino[$wbutai_id] = $butai_kunino{$wbutai_id};
		$butai_habatuno[$wbutai_id] = $butai_habatuno{$wbutai_id};
		$butai_busyou_suu[$wbutai_id] = $butai_busyou_suu{$wbutai_id};
$w_s_butai .= "\$butai_name\[$wbutai_id\] = \'" . $butai_name[$wbutai_id] . '\';' . "\$butai_kunino\[$wbutai_id\] = \'" . $butai_kunino[$wbutai_id] . '\';' . "\$butai_habatuno\[$wbutai_id\] = \'" . $butai_habatuno[$wbutai_id] . '\';';
$w_s_butai .= "\$butai_busyou_suu\[$wbutai_id\] = \'" . $butai_busyou_suu[$wbutai_id] . '\';';
			push(@N_BUTAI_DB_L,"@butai_db_view");
		$butai_no_all_l[$butai_kazu_d] = $wbutai_id;
$w_s_butai .= "\$butai_no_all_l\[$butai_kazu_d\] = \'" . $wbutai_id . '\';';
				if(!$butai_kazu_next and $wbutai_id > $butai_kazu_max){
$butai_kazu_max =$wbutai_id;
					if(!$butai_no{$wbutai_id}){
$butai_kazu_next =$wbutai_id;
					}
				}
$butai_kazu_d ++;
		}
	}
closedir(SPDFRW);
					if(!$butai_kazu_next){
$butai_kazu_next =$butai_kazu_max + 1;
					}
$w_s_butai .= "\$butai_kazu_next = \'" . $butai_kazu_next . '\';';
$w_s_butai .= "\$butai_kazu_max = \'" . $butai_kazu_max . '\';';

	$butai_kazu_d = @N_BUTAI_DB_L;
$w_s_butai .= "\$butai_name\[0\] = \'" . '無所属' . '\';';
$w_s_butai .= "\$butai_kazu_d = \'" . $butai_kazu_d . '\';';
	$w_s_butai .= '1;';
							unlink("./w_db/allc_$_[0].pl");
							unlink("./w_db/all_$_[0].pl");
		open(OUT,">./w_db/all_$_[0].pl");
		print OUT $w_s_butai;
		close(OUT);
		open(OUT,">./w_db/allc_$_[0].pl");
		print OUT $w_butai_kazu_l;
		close(OUT);
		open(OUT,">./w_db/all2_$_[0].pl");
		print OUT $w_s_butai;
		close(OUT);
}
sub BUTAI_N_SAVE {
				&BUTAI_W1_SAVE("$_[0]","$_[1]","$_[2]");
				&BUTAI_W2_SAVE("$_[0]","$_[1]","$_[2]");

}

############

sub GUNDAN_OPEN {

$fgundan_id = int($_[1]);
		if(-e "./w_db/gundan_db/$fgundan_id.cgi"){
	&GUNDAN_READ("gundan_db","$fgundan_id","$fgundan_id");

		}else{ 
			if($fgundan_id){
&ER1("その部隊は存在しません。");
			}
$gundan_name{$fgundan_id}= '無所属';
		}
		if(-e "./w_db/allc_gundan_db.pl"){
require "./w_db/all_gundan_db.pl";

		}else{ 
require "./w_db/all2_gundan_db.pl";
		}

}

sub GUNDAN_READ {

			open(READ,"./w_db/$_[0]/$_[1].cgi");
			@gundan_db_view = <READ>;
			close(READ);
				&GUNDAN_VIEW("$_[0]","$_[1]","$_[2]");
}

sub GUNDAN_VIEW {
				&GUNDAN_VW("$_[0]","$_[1]","$_[2]");

}

###########

sub GUNDAN_SAVE {

		if($gundan_id{$_[2]}eq""){
&ER1("記録エラー。管理人に報告してください$_[0]$_[1]$_[2]");

		}
		if(-e "./w_db/$_[0]/$_[1].cgi"){
	&GUNDAN_N_SAVE("$_[0]","$_[1]","$_[2]");
		}

}

###########

sub GUNDAN_W1_SAVE {
				&GUNDAN_SW("$_[0]","$_[1]","$_[2]");
	open(SAVE,">./w_db/$_[0]/$_[1].cgi");
	print SAVE @GUNDAN_N_D;
	close(SAVE);
}

sub GUNDAN_W2_SAVE {
$w_s_gundan = '';
@N_GUNDAN_DB_L = ();
@N_GUNDAN_DB_L_D = ();
@gundan_seizon_l = ();
$gundan_kazu = 0;
$gundan_kazu_d = 0;
$gundan_kazu_max =0;
$gundan_kazu_next =0;
opendir(SPDFRW,"./w_db/$_[0]");
	while($wgundan_id = readdir(SPDFRW)){
		if($wgundan_id =~ /\.cgi/i){
$wgundan_id =~ s/\.cgi//;
$wgundan_id = int($wgundan_id);
			if(!$gundan_id{$wgundan_id} or $_[1] eq $wgundan_id){
	&GUNDAN_READ("$_[0]","$wgundan_id","$wgundan_id");
			}else{ 
			open(READ,"./w_db/$_[0]/$wgundan_id.cgi");
			@gundan_db_view = <READ>;
			close(READ);
	&GUNDAN_VIEW("$_[0]","$wgundan_id","$wgundan_id");
			}

		$gundan_name[$wgundan_id] = $gundan_name{$wgundan_id};
		$gundan_kunino[$wgundan_id] = $gundan_kunino{$wgundan_id};
		$gundan_habatuno[$wgundan_id] = $gundan_habatuno{$wgundan_id};
		$gundan_busyou_suu[$wgundan_id] = $gundan_busyou_suu{$wgundan_id};
$w_s_gundan .= "\$gundan_name\[$wgundan_id\] = \'" . $gundan_name[$wgundan_id] . '\';' . "\$gundan_kunino\[$wgundan_id\] = \'" . $gundan_kunino[$wgundan_id] . '\';' . "\$gundan_habatuno\[$wgundan_id\] = \'" . $gundan_habatuno[$wgundan_id] . '\';';
$w_s_gundan .= "\$gundan_busyou_suu\[$wgundan_id\] = \'" . $gundan_busyou_suu[$wgundan_id] . '\';';
			push(@N_GUNDAN_DB_L,"@gundan_db_view");
		$gundan_no_all_l[$gundan_kazu_d] = $wgundan_id;
$w_s_gundan .= "\$gundan_no_all_l\[$gundan_kazu_d\] = \'" . $wgundan_id . '\';';
				if(!$gundan_kazu_next and $wgundan_id > $gundan_kazu_max){
$gundan_kazu_max =$wgundan_id;
					if(!$gundan_no{$wgundan_id}){
$gundan_kazu_next =$wgundan_id;
					}
				}
$gundan_kazu_d ++;
		}
	}
closedir(SPDFRW);

					if(!$gundan_kazu_next){
$gundan_kazu_next =$gundan_kazu_max + 1;
					}
$w_s_gundan .= "\$gundan_kazu_next = \'" . $gundan_kazu_next . '\';';
$w_s_gundan .= "\$gundan_kazu_max = \'" . $gundan_kazu_max . '\';';

	$gundan_kazu_d = @N_GUNDAN_DB_L;
$w_s_gundan .= "\$gundan_name\[0\] = \'" . '無所属' . '\';';
$w_s_gundan .= "\$gundan_kazu_d = \'" . $gundan_kazu_d . '\';';
	$w_s_gundan .= '1;';
							unlink("./w_db/allc_$_[0].pl");
							unlink("./w_db/all_$_[0].pl");
		open(OUT,">./w_db/all_$_[0].pl");
		print OUT $w_s_gundan;
		close(OUT);
		open(OUT,">./w_db/allc_$_[0].pl");
		print OUT $w_gundan_kazu_l;
		close(OUT);
		open(OUT,">./w_db/all2_$_[0].pl");
		print OUT $w_s_gundan;
		close(OUT);
}
sub GUNDAN_N_SAVE {
				&GUNDAN_W1_SAVE("$_[0]","$_[1]","$_[2]");
				&GUNDAN_W2_SAVE("$_[0]","$_[1]","$_[2]");

}


############

sub I_OPEN {

$fi_id = $_;
		if(-e "./$mpg_r/sub_db/it/$fi_id.cgi"){
	&I_READ("it","$fi_id","$fi_id");

		}else{ 
&ER1("そのアイテムは存在しません。");
		}

}

sub I_READ {

			open(READ,"./$mpg_r/sub_db/$_[0]/$_[1].cgi");
			@i_db_view = <READ>;
			close(READ);
				&I_VIEW("$_[0]","$_[1]","$_[2]");
}

sub I_VIEW {

				&I_VW("$_[0]","$_[1]","$_[2]");
}

###########

sub I_SAVE {

		if(-e "./$mpg_r/sub_db/$_[0]/$_[1].cgi"){
	&I_N_SAVE("$_[0]","$_[1]","$_[2]");
		}

}

###########

sub I_N_SAVE {

				&I_SW("$_[0]","$_[1]","$_[2]");
	open(SAVE,">./$mpg_r/sub_db/$_[0]/$_[1].cgi");
	print SAVE @ITEM_N_D;
	close(SAVE);

}
############

sub ER1 {


	&HEADER;
	if ($lockhit > 0) { 
		while ($lockhit > 0) {
 &UNLOCK_FILE;
		}
	}
	print "<hr /><span class=\"fs4\">ヽ(｀Д´)ノ</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>$_[0]</strong></span>\n";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"submit\" value=\"コマンド入力画面へ戻る\" /></div></form>";
	print "<br /><br /><hr /><a href=\"./\"target=\"_top\">ログイン画面に戻る</a><br />\n</div></body></html>\n";
	exit;
}

sub ER3 {

	&HEADER;
	if ($lockhit > 0) { 
		while ($lockhit > 0) {
 &UNLOCK_FILE;
		}
	}
	print "<hr /><span class=\"fs4\">ヽ(｀Д´)ノ</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>$_[0]</strong></span>\n";
print "<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".m.\" value=\"defo\" /><input type=\"hidden\" name=\".sv.\" value=\"$in{'sv'}\" /><input type=\"submit\" value=\"コマンド入力画面へ戻る\" /></div></form>";
	print "<br /><br /><hr /><a href=\"./\"target=\"_top\">ログイン画面に戻る</a><br />\n</div></body></html>\n";
	exit;
}
############

sub ER2 {

	&HEADER;
	if ($lockhit > 0) { 
		while ($lockhit > 0) {
 &UNLOCK_FILE;
		}
	}
	print "<hr /><span class=\"fs4\">ヽ(｀Д´)ノ</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>$_[0]</strong></span>\n";
	print "<br /><br /><hr /><a href=\"./\"target=\"_top\">ログイン画面に戻る</a><br />\n</div></body></html>\n";
	exit;
}

############

sub F_LOCK {

	$lockhit++;
$lockfiledf[$lockhit]=$lockfile;
$lockfadd="_sub";
	if ($_[0]) {
$lockfiledf[$lockhit]="$lockfiled$_[0]";
$lockfiledf2[$lockhit]="$lockfiledf[$lockhit]$lockfadd";
		if (!$nekonyanst and -e "$lockfiledf2[$lockhit]") {
	$lockhit2=$lockhit;
	$m_ttfl="";
		$m_ttfl = (stat("$lockfiledf2[$lockhit]"))[9];
		if ($m_ttfl and $m_ttfl < time - 120) {
		while ($lockhit > 0) {
 &UNLOCK_FILE;
		}
		}else{
$lockhit-=1;
		while ($lockhit > 0) {
 &UNLOCK_FILE;
		}
		}
	&HEADER;
	print "<hr /><span class=\"fs4\">(´・ω・`)</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>メイン更新処理中なのら～<br />30秒くらいおいてから押すのら～</strong></span>\n";
	print "<br /><br /><hr />\n</div></body></html>\n";
	exit;
		}
	}elsif (-e $lockfile2) {
		
	&HEADER;
	print "<hr /><span class=\"fs4\">(´・ω・`)</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>メイン更新処理中なのら～<br />30秒くらいおいてから押すのら～</strong></span>\n";
	print "<br /><br /><hr />\n</div></body></html>\n";
	exit;
	}

	local($retry)=10;
	if (-e $lockfiledf[$lockhit]) {
	$m_ttfl="";
		$m_ttfl = (stat($lockfiledf[$lockhit]))[9];
		if ($m_ttfl and $m_ttfl < time - 120) {
		while ($lockhit > 0) {
 &UNLOCK_FILE;
		}
		}
	}

	while (!mkdir($lockfiledf[$lockhit], 0755)) {
			if (!$nekonyanst) { 
	$m_ttfl="";
		$m_ttfl = (stat("$lockfiledf[$lockhit]"))[9];
		if ($m_ttfl and $m_ttfl < time - 120) {
		while ($lockhit > 0) {
 &UNLOCK_FILE;
		}
		}else{
$lockhit-=1;
		while ($lockhit > 0) {
 &UNLOCK_FILE;
		}
		}
	&HEADER;
	print "<hr /><span class=\"fs4\">(´・ω・`)</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>コマンド更新処理中なのら～<br />5秒くらいおいてから押すのら～</strong></span>\n";
	print "<br /><br /><hr />\n</div></body></html>\n";
	exit;
			}
		if (--$retry > 0) { 
		sleep(1);
rmdir("$lockfiledf[$lockhit]");
	$lockhit2++;
$lockfiledf2[$lockhit2]="$lockfiledf[$lockhit]$lockfadd";
rmdir("$lockfiledf2[$lockhit2]");
mkdir("$lockfiledf2[$lockhit2]", 0755);
		}else{
		last;
		}
	}

}

############

sub UNLOCK_FILE
{
	if ($lockhit > 0) {
rmdir("$lockfiledf[$lockhit]");
		if ($lockhit2) {
rmdir("$lockfiledf2[$lockhit2]");$lockhit2-=1;
		}
$lockhit-=1;
	}
}


############
sub KOUSIN_LOCK {

	local($retry)=3;
$w_klf="";
	if (-e $lockfile2) {
opendir(CF,$lockfile2);
@cfs = (readdir(CF));
closedir(CF);
	$m_ttfl="";
		$m_ttfl = (stat($lockfile2))[9];
		if (($m_ttfl and $m_ttfl < $tt - 240 + int(rand(120))) or $#cfs eq "1") { $w_klf=1;&KOUSIN_UNLOCK; }
	}
	if (-e $lockfile2) {
	print <<"PRI";
Content-type: text/html\n\n
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
</head><body>$TAG_div_s{$doc_mode}
<hr /><span class=\"fs4\">ロックえらー !</span>
<br /><br /><span class=\"cFF0000\"><strong>$_[0]</strong></span>
<br /><br /><hr />\n</div></body></html>
PRI
	exit;
	}
		if (!mkdir($lockfile2, 0755)) { 
	print <<"PRI";
Content-type: text/html\n\n
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
</head><body>$TAG_div_s{$doc_mode}
<hr /><span class=\"fs4\">ロックえらー !</span>
<br /><br /><span class=\"cFF0000\"><strong>$_[0]</strong></span>
<br /><br /><hr />\n</div></body></html>
PRI
	exit;

		}
mkdir("$lockfile2/$$", 0755);

		sleep(2);
opendir(CF,$lockfile2);
@cfs = (readdir(CF));
closedir(CF);
		if ($#cfs ne "2") { 
	print <<"PRI";
Content-type: text/html\n\n
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
</head><body>$TAG_div_s{$doc_mode}
PRI
	print "<hr /><span class=\"fs4\">ロックえらー !</span>\n";
	print "<br /><br /><span class=\"cFF0000\"><strong>$_[0]</strong></span>\n";
	print "<br /><br /><hr />\n</div></body></html>\n";
rmdir("$lockfile2/$$");
	exit;
		}


	while (-e $lockfile) {
		sleep(2);
		if (--$retry <= 0) { 
rmdir("$lockfile");
		}
	}

}

########

sub KOUSIN_UNLOCK
{
		if ($w_klf) { 
	$dir="./$lockfile2";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file !~ /\./i and $file !~ /\//i){
			rmdir("$dir/$file");
		}
	}
	closedir(DFR);
		}
rmdir("$lockfile2/$$");
rmdir("$lockfile2");
}

########Ver1.13

sub KUNITORI_NEWS
{
	if($NEWS_TOUROKU ne "1"){
use LWP::Simple;
		if(!$NEWS_TOUROKU){

mirror("$URI_SP_D/txt/tic.html", "tic.html");
$buffer = get("$URI_SP_D/kunibbs/?.m.=kuninews&.nt.=0&.rssuri.=$URI");

		open(OUT,">./sabaid.txt");
		print OUT $buffer;
		close(OUT);
		}else{
		unlink("./sabaid.txt");
$buffer = get("$URI_SP_D/kunibbs/?.m.=kuninews&.nt.=2&.rssuri.=$URI");
		}
	}
}


########・ks_Ver1.590より
sub APLINK
{
use LWP::Simple;
require "$mpg_r/ver.pl";
	$nen_getu = sprintf("%02d\年%02d\月", ($KAISI_NEN + $keika_nen), $tuki_genzai);
	$nen_getu_f = "第$tenkakaisuu部 $outyou $nen_getu";
		$aplink = "$KOUSIN_AUTO<>$GAME_TITLE $MEN_TITLE<>$nen_getu_f<>$MEN_SIYOU<>$kunitori_ver<>$m_tt<>$sousu1<>$sousu3<>$kousin_kankaku<>";
		open(OUT,">./aplink.txt");
		print OUT $aplink;
		close(OUT);
			
$buffer = get("$URI_SP_D/kunibbs/?.m.=aplink&.nt.=0&.rssuri.=$URI");
			
		if($buffer !~ /ok/i ){
			unlink("./aplinkon.txt");
		}else{
		open(OUT,">./aplinkon.txt");
		print OUT $aplink;
		close(OUT);
		}
}
############
sub GET_COOKIE {


	@pairs = split(/;/, $ENV{'HTTP_COOKIE'});
	$v=@pairs;
	foreach (@pairs) {
		local($key,$val) = split(/=/);
		$key =~ s/\s//g;
		$GET{$key} = $val;
	}
	@pairs = split(/,/, $GET{"KS$menck"});
	foreach (@pairs) {
		local($key,$value) = split(/<>/);
$value =~ s/&/&#38;/g;

$value =~ s/</&lt;/g;
$value =~ s/>/&gt;/g;
$value =~ s/$TAG_q0/&quot;/g;
$value =~ s/\//&#47;/g;
$value =~ s/,/&#44;/g;
$value =~ s/\'/&#39;/g;
$value =~ s/\\$/\\ /g;

$value =~ s/%/&#37;/g;
$value =~ s/=/&#61;/g;
$value =~ s/@/&#64;/g;
$value =~ s/%/&#37;/g;
$value =~ s/`/&#96;/g;
$value =~ s/}/&#125;/g;
$value =~ s/{/&#123;/g;
$value =~ s/eval/&#101;val/g;
$value =~ s/\r//g;
$value =~ s/\n//g;
		$COOK{$key} = $value;
	}
	$cktime = $COOK{'time'};
	$ckhost = $COOK{'host'};
	$ckid = $COOK{'id'};
	$cniti = $COOK{'niti'};


}

############
sub SET_COOKIE {

	local($sec,$min,$hour,$mday,$mon,$year,$wday) = gmtime(time+24*60*60*60);
	@month=('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec');
#	$gmt = sprintf("%s, %02d-%s-%04d %02d:%02d:%02d GMT",
#			$week[$wday],$mday,$month[$mon],$year+1900,$hour,$min,$sec);
	$cook="time<>$cktime,host<>$ckhost,id<>$ckid,niti<>$cniti";
	$i = $year+1910;
	$cookh="Set-Cookie: KS$menck=$cook; expires=Thu, 1-Jan-$i 00:00:00 GMT";
}
############

############メインフレームヘッダー（広告をつける場合はこちらに）
sub HEADER {

	print <<"PRI";
Content-type: text/html\n\n
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
PRI
	print <<"PRI";
$p_p_b_a{$f_id}
$datev2
<title>$GAME_TITLE$MEN_TITLE</title></head>
<body>$TAG_div_s{$doc_mode}

PRI


}

############インラインフレーム内ヘッダー（変更するとレイアウトが乱れる危険性あり）
sub HEADER_IF {

	print <<"PRI";
Content-type: text/html\n\n
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}
PRI
	print <<"PRI";
$p_p_b_a{$f_id}
$datev2
<title>$GAME_TITLE$MEN_TITLE</title></head>
<body>$TAG_div_s{$doc_mode}

PRI

}
############

sub FOOTER {
	print "<hr />(C) 2004 <a href=\"http://nullpo.in/\" target=\"_top\">nullpo.in</a> All Rights Reserved. \n";

	print "<hr /><a href=\"$URI/\" target=\"_top\">《 ログイン画面に戻る 》</a>\n<a href=\"http://kunitori.com/\" target=\"_top\">《 国取.comへ移動 》</a><br />\n";

    print "</div></body></html>\n";

}
require "$mpg_r/sub_db/img_css_w.pl";
1;

