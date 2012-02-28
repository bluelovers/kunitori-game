
sub P_READ {

			open(READ,"./p_db/$_[0]/$_[1].cgi");
			@p_db_view = <READ>;
			close(READ);

				&P_VIEW("$_[0]","$_[1]","$_[2]");
}

sub P_VIEW {
require "$mpg_r/sub_db/ini/p_v.pl";
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
$p_p_b_a_i{$_[2]} = "<a href=\"./?.i.=i&amp;.m.=p_b&amp;.id.=$p_id{$_[2]}\" target=\"_blank\"><span class=\"kcb$p_k_iro_d{$_[2]}\">$p_name{$_[2]}</span></a>";
}

###########

sub P_SAVE {

require "$mpg_r/sub_db/ini/p_s.pl";
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
<table class=\"bgc884422\">
<tr><input type=\"hidden\" name=\".m.\" value=\"defo\" /><td width=\"40\" class=\"bgcF8F0E8\">&nbsp;LoginID&nbsp;</td><td width=\"120\"><input type=\"text\" size=\"15\" maxlength=\"12\" name=\".id.\" /></td></tr>
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
&ER2("IDが確認できません。1/");
	}
		}else{ 
	if(!$f_id){
&ER2("IDが確認できません。2/");
	}else{ 
&ER2("ID/パスが正しくありません3");
	}
		}
	}
$f_id =~ tr/A-Z/a-z/;
	&P_READ("p","$f_id","$f_id");

	if(!$p_id{$f_id}){
		if(-e "./p_db/touketu/$f_id.cgi"){
&ER2("貴方のIDは何らかの理由で凍結処理されています。ログイン画面にある「凍結解除」をお試しください。4");
		}else{ 
&ER2("IDが確認できません。IDが凍結されている場合がありますので、ログイン画面にある「凍結解除」をお試しください。5");
		}
	}
		}else{ 
	$kasouid = $in{'id'};
	$kasouhit2 = 0;
	if($in{'id'} eq "-$mpass"){
&HOST_NAME;
#		if($host !~ /$mip/i){
#&ER2("IDが確認できません。0/");
#		open(OUT,">>./mpass.txt");
#		print OUT "$host\n";
#		close(OUT);
#		}
	$kasouid = $in{'pass'};
	$kasouhit2 = 1;
	}
	$p_pass{$f_id}=n;
$kasouid =~ tr/A-Z/a-z/;
	$f_id = $kasouid;

	&P_READ("p","$kasouid","$kasouid");

	if(!$p_id{$kasouid}){
		if(-e "./p_db/touketu/$kasouid.cgi"){
&ER2("貴方のIDは何らかの理由で凍結処理されています。ログイン画面にある「凍結解除」をお試しください。6");
		}else{ 
&ER2("IDが確認できません。7/");
		}
	}
	if($in{'pass'} ne $p_pass{$f_id} and !$kasouhit2){
&ER2("ID/パスが正しくありません8");
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

	open(IN,"./w_db/map_log.cgi");
	@S_MOVE = <IN>;
	close(IN);

$_[1] = $_[0]; 
$_[1] =~ s/<(.*?)>//g;
	unshift(@S_MOVE,"$_[0]$tt_date<>$tt<>$tt_rss<>$_[1]<>$URI/?.m.=map2<>$_[2]<>$_[3]<>\n");

	splice(@S_MOVE,200);

	open(OUT,">./w_db/map_log.cgi");
	print OUT @S_MOVE;
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

	$add_l{$in{"pass"}}= $host;
	$add_l{"ixchel"}= "127.0.0.1";
	$host_tt= $add_l{$in{"pass"}};

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
require "$mpg_r/sub_db/ini/t_v.pl";

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
require "$mpg_r/sub_db/ini/t_s.pl";
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
require "$mpg_r/sub_db/ini/k_v.pl";
				&K_VW("$_[0]","$_[1]","$_[2]");

$k_p_k_a{$_[2]} = "<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_id{$_[2]}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$_[2]}\">$k_name_d{$_[2]}</span></a>";
$k_p_k_a_i{$_[2]} = "<a href=\"./?.i.=i&amp;.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_id{$_[2]}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$_[2]}\">$k_name_d{$_[2]}</span></a>";
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
$w_s_kuni .= "\$k_name\[0\] = \'" . '無所属' . '\';';
$w_s_kuni .= "\$kuni_kazu = \'" . $kuni_kazu . '\';';
$w_s_kuni .= "\$kuni_kazu_d = \'" . $kuni_kazu_d . '\';';
$w_s_kuni .= "\$kuni_kazu_max = \'" . $kuni_kazu_max . '\';';
$w_s_kuni .= "\$kuni_tenka_kaisuu = \'" . $tenkakaisuu . '\';';
	$w_s_kuni .= '1;';
							unlink("./w_db/allc_$_[0].pl");
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
require "$mpg_r/sub_db/ini/k_s.pl";
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
require "$mpg_r/sub_db/ini/butai_v.pl";
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
				if($wbutai_id > $butai_kazu_max){
$butai_kazu_max =$wbutai_id;
					if(!$butai_kazu_next and !$butai_no{$wbutai_id}){
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
	$butai_kazu_d = @N_BUTAI_DB_L;
$w_s_butai .= "\$butai_name\[0\] = \'" . '無所属' . '\';';
$w_s_butai .= "\$butai_kazu_d = \'" . $butai_kazu_d . '\';';
	$w_s_butai .= '1;';
							unlink("./w_db/allc_$_[0].pl");
		open(OUT,">./w_db/all_$_[0].pl");
		print OUT $w_s_butai;
		close(OUT);
		open(OUT,">./w_db/allc_$_[0].pl");
		print OUT $w_butai_kazu_l;
		close(OUT);
		open(OUT,">./w_db/all2_$_[0].pl");
		print OUT $w_s_butai;
		close(OUT);
		open(OUT,">./w_db/butai_db_l_$_[0].cgi");
		print OUT @N_BUTAI_DB_L;
		close(OUT);
}
sub BUTAI_N_SAVE {
require "$mpg_r/sub_db/ini/butai_s.pl";
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
require "$mpg_r/sub_db/ini/gundan_v.pl";
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
				if($wgundan_id > $gundan_kazu_max){
$gundan_kazu_max =$wgundan_id;
					if(!$gundan_kazu_next and $gundan_no{$wgundan_id}){
$gundan_kazu_next =$wgundan_id;
					}
				}
$gundan_kazu_d ++;
		}
	}
closedir(SPDFRW);

					if(!$gundan_kazu_next){
$gundan_kazu_next =$gundan_kazu_max+1;
					}
$w_s_gundan .= "\$gundan_kazu_next = \'" . $gundan_kazu_next . '\';';
$w_s_gundan .= "\$gundan_kazu_max = \'" . $gundan_kazu_max . '\';';

	$gundan_kazu_d = @N_GUNDAN_DB_L;
$w_s_gundan .= "\$gundan_name\[0\] = \'" . '無所属' . '\';';
$w_s_gundan .= "\$gundan_kazu_d = \'" . $gundan_kazu_d . '\';';
	$w_s_gundan .= '1;';
							unlink("./w_db/allc_$_[0].pl");
		open(OUT,">./w_db/all_$_[0].pl");
		print OUT $w_s_gundan;
		close(OUT);
		open(OUT,">./w_db/allc_$_[0].pl");
		print OUT $w_gundan_kazu_l;
		close(OUT);
		open(OUT,">./w_db/all2_$_[0].pl");
		print OUT $w_s_gundan;
		close(OUT);
		open(OUT,">./w_db/gundan_db_l_$_[0].cgi");
		print OUT @N_GUNDAN_DB_L;
		close(OUT);
}
sub GUNDAN_N_SAVE {
require "$mpg_r/sub_db/ini/gundan_s.pl";
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
require "$mpg_r/sub_db/ini/i_v.pl";

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

require "$mpg_r/sub_db/ini/i_s.pl";
				&I_SW("$_[0]","$_[1]","$_[2]");
	open(SAVE,">./$mpg_r/sub_db/$_[0]/$_[1].cgi");
	print SAVE @ITEM_N_D;
	close(SAVE);

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
		local($m_ttfl) = (stat($lockfiledf[$lockhit]))[9];
		if ($m_ttfl and $m_ttfl < time - 120) {
		while ($lockhit > 0) {
 &UNLOCK_FILE;
		}
		}
	}

	while (!mkdir($lockfiledf[$lockhit], 0755)) {
			if (!$nekonyanst) { 
	$m_ttfl="";
		local($m_ttfl) = (stat("$lockfiledf[$lockhit]"))[9];
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

sub CD_END {

	&HEADER;

	print <<"PRI";
<hr /><span class=\"fs4\">$_[0]</span><br /><br />
<form action=\"$_[1]\" method=\"post\" utn=\"utn\"><div>
<input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" />
<input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" />
<input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" />
$_[2]</div></form>$_[3]
PRI

	&FOOTER;

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
require "$mpg_r/sub_db/img_css_w.pl";

sub BIJYOU_READ
{

$b_st_w{$_[0]} = "";
@p_bjijyou_w{$_[0]} = ();
@p_bjijyou_no{$_[0]} = ();
		$add_pi=0;
@p_bjijyou{$_[0]} = sort { $b <=> $a } @p_bjijyou{$_[0]}; 
	foreach(@p_bjijyou{$_[0]}){
$p_bjijyou_w{$_[0]}[$p_bjijyou{$_[0]}[$add_pi]] = 1;
$p_bjijyou_no{$_[0]}[$p_bjijyou{$_[0]}[$add_pi]] = $add_pi;
$b_st_w{$_[0]} .= "$SYOUIJYOU[$p_bjijyou{$_[0]}[$add_pi]]";
		$add_pi++;
	}
$b_st_w{$_[0]} .= "$SEIJYOU_ST{$p_hjijyou{$_[0]}[0]}";
}
sub HIJYOU_READ
{
$h_st_w{$_[0]} = "";
@p_hjijyou_w{$_[0]} = ();
@p_hjijyou_no{$_[0]} = ();
		$add_pi=0;
@p_hjijyou{$_[0]} = sort { $b <=> $a } @p_hjijyou{$_[0]}; 
	foreach(@p_hjijyou{$_[0]}){
$p_hjijyou_w{$_[0]}[$p_hjijyou{$_[0]}[$add_pi]] = 1;
$p_hjijyou_no{$_[0]}[$p_hjijyou{$_[0]}[$add_pi]] = $add_pi;
$h_st_w{$_[0]} .= "$HEIIJYOU[$p_hjijyou{$_[0]}[$add_pi]]";
		$add_pi++;
	}
$h_st_w{$_[0]} .= "$SEIJYOU_ST{$p_hjijyou{$_[0]}[0]}";
}
sub KOUSEN_AITE_KOKUSAKU_HIT
{

		$kousen_aite_hit=$_[0];
		$kousen_aite_kokusaku_no=$_[1];
		$kousen_f_kunino=$_[2];
		$kousen_aite_hit=int($kousen_aite_hit);
		$kousen_aite_kokusaku_no=int($kousen_aite_kokusaku_no);
		$kousen_f_kunino=int($kousen_f_kunino);
		$kousen_aite_hit_add{$k_kokusaku{$k_kousen_aite_k{$kousen_f_kunino}[0]}}=$kousen_aite_hit;
		$kousen_aite_hit_add{$kousen_aite_kokusaku_no}=1;
		$kousen_aite_hit=$kousen_aite_hit_add{$k_kokusaku{$k_kousen_aite_k{$kousen_f_kunino}[0]}};
		$kousen_aite_hit_add{$k_kokusaku{$k_kousen_aite_k{$kousen_f_kunino}[1]}}=$kousen_aite_hit;
		$kousen_aite_hit_add{$kousen_aite_kokusaku_no}=1;
		$kousen_aite_hit=$kousen_aite_hit_add{$k_kokusaku{$k_kousen_aite_k{$kousen_f_kunino}[1]}};
		$kousen_aite_hit_add{$k_kokusaku{$k_kousen_aite_k{$kousen_f_kunino}[2]}}=$kousen_aite_hit;
		$kousen_aite_hit_add{$kousen_aite_kokusaku_no}=1;
		$kousen_aite_hit=$kousen_aite_hit_add{$k_kokusaku{$k_kousen_aite_k{$kousen_f_kunino}[2]}};
		$kousen_aite_hit_add{$k_kokusaku{$k_kousen_aite_k{$kousen_f_kunino}[3]}}=$kousen_aite_hit;
		$kousen_aite_hit_add{$kousen_aite_kokusaku_no}=1;
		$kousen_aite_hit=$kousen_aite_hit_add{$k_kokusaku{$k_kousen_aite_k{$kousen_f_kunino}[3]}};
		$kousen_aite_hit_add{$k_kokusaku{$k_kousen_aite_k{$kousen_f_kunino}[4]}}=$kousen_aite_hit;
		$kousen_aite_hit_add{$kousen_aite_kokusaku_no}=1;
		$kousen_aite_hit=$kousen_aite_hit_add{$k_kokusaku{$k_kousen_aite_k{$kousen_f_kunino}[4]}};
		$kousen_aite_hit_add{$k_kokusaku{$k_kousen_aite_k{$kousen_f_kunino}[5]}}=$kousen_aite_hit;
		$kousen_aite_hit_add{$kousen_aite_kokusaku_no}=1;
		$kousen_aite_hit=$kousen_aite_hit_add{$k_kokusaku{$k_kousen_aite_k{$kousen_f_kunino}[5]}};
		$kousen_aite_hit_add{$k_kokusaku{$k_kousen_aite_k{$kousen_f_kunino}[6]}}=$kousen_aite_hit;
		$kousen_aite_hit_add{$kousen_aite_kokusaku_no}=1;
		$kousen_aite_hit=$kousen_aite_hit_add{$k_kokusaku{$k_kousen_aite_k{$kousen_f_kunino}[6]}};
		$kousen_aite_hit_add{$k_kokusaku{$k_kousen_aite_k{$kousen_f_kunino}[7]}}=$kousen_aite_hit;
		$kousen_aite_hit_add{$kousen_aite_kokusaku_no}=1;
		$kousen_aite_hit=$kousen_aite_hit_add{$k_kokusaku{$k_kousen_aite_k{$kousen_f_kunino}[7]}};
		$kousen_aite_hit_add{$k_kokusaku{$k_kousen_aite_k{$kousen_f_kunino}[8]}}=$kousen_aite_hit;
		$kousen_aite_hit_add{$kousen_aite_kokusaku_no}=1;
		$kousen_aite_hit=$kousen_aite_hit_add{$k_kokusaku{$k_kousen_aite_k{$kousen_f_kunino}[8]}};
		$kousen_aite_hit_add{$k_kokusaku{$k_kousen_aite_k{$kousen_f_kunino}[9]}}=$kousen_aite_hit;
		$kousen_aite_hit_add{$kousen_aite_kokusaku_no}=1;
		$kousen_aite_hit=$kousen_aite_hit_add{$k_kokusaku{$k_kousen_aite_k{$kousen_f_kunino}[9]}};
}
sub KOUSEN_AITE_HIT
{

		$kousen_aite_hit=$_[0];
		$kousen_aite_kunino=$_[1];
		$kousen_f_kunino=$_[2];
		$kousen_aite_hit=int($kousen_aite_hit);
		$kousen_aite_kunino=int($kousen_aite_kunino);
		$kousen_f_kunino=int($kousen_f_kunino);
		$kousen_aite_hit_add{$kousen_aite_kunino}=$kousen_aite_hit;
		$kousen_aite_hit_add{$k_kousen_aite_k{$kousen_f_kunino}[0]}=1;
		$kousen_aite_hit_add{$k_kousen_aite_k{$kousen_f_kunino}[1]}=1;
		$kousen_aite_hit_add{$k_kousen_aite_k{$kousen_f_kunino}[2]}=1;
		$kousen_aite_hit_add{$k_kousen_aite_k{$kousen_f_kunino}[3]}=1;
		$kousen_aite_hit_add{$k_kousen_aite_k{$kousen_f_kunino}[4]}=1;
		$kousen_aite_hit_add{$k_kousen_aite_k{$kousen_f_kunino}[5]}=1;
		$kousen_aite_hit_add{$k_kousen_aite_k{$kousen_f_kunino}[6]}=1;
		$kousen_aite_hit_add{$k_kousen_aite_k{$kousen_f_kunino}[7]}=1;
		$kousen_aite_hit_add{$k_kousen_aite_k{$kousen_f_kunino}[8]}=1;
		$kousen_aite_hit_add{$k_kousen_aite_k{$kousen_f_kunino}[9]}=1;
		$kousen_aite_hit=$kousen_aite_hit_add{$kousen_aite_kunino};
}
1;

