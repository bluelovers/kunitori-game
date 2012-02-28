
sub RANK12 {
#   RANK1    #

	open(IN,"./w_db/add_map_log.cgi");
	@ADD_M2L = <IN>;
	close(IN);
	open(IN,"./w_db/map_log.cgi");
	@M2L = <IN>;
	close(IN);
	unlink(IN,"./w_db/add_map_log.cgi");
@ADD_M2L = reverse(@ADD_M2L);
@M2L = (@ADD_M2L,@M2L);
	splice(@M2L,200);
	open(OUT,">./w_db/map_log.cgi");
	print OUT @M2L;
	close(OUT);

opendir(DFR,"./$mpg_r/sub_db/it");
	while($fi_id = readdir(DFR)){
		if($fi_id =~ /\.cgi/i){
$fi_id =~ s/\.cgi//;
			if(!$item_name{$fi_id}){
	&I_READ("it","$fi_id","$fi_id");
			}
		}
	}
closedir(DFR);

require "./$mpg_r/sub_db/tw.pl";
		if(-e "./w_db/allc_tosi_db.pl"){
require "./w_db/all_tosi_db.pl";

		}else{ 
require "./w_db/all2_tosi_db.pl";
		}
#########
		if(-e "./w_db/allc_kuni_db.pl"){
require "./w_db/all_kuni_db.pl";

		}else{ 
require "./w_db/all2_kuni_db.pl";
		}
opendir(DFR,"./w_db/kuni_db");
	while($fk_id = readdir(DFR)){
		if($fk_id =~ /\.cgi/i){
$fk_id =~ s/\.cgi//;
			if(!$k_id{$fk_id}){
	&K_READ("kuni_db","$fk_id","$fk_id");
			}
		}
	}
closedir(DFR);
#########
		$listcc = "";
												@listbusyou=();
	foreach(@k_no_all_l){
		$i=int($_);
$listcc .= "<a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_id{$i}\" target=\"_blank\"><span class=\"c404000\">$k_name_d[$i]</a> ";
	}

#########
opendir(DFR,"./w_db/tosi_db");
	while($ft_id = readdir(DFR)){
		if($ft_id =~ /\.cgi/i){
$ft_id =~ s/\.cgi//;
			if($t_id{$ft_id} eq ""){
	&T_READ("tosi_db","$ft_id","$ft_id");
			}
		}
	}
closedir(DFR);
#########

@p_db_all_l = ();
	@CL_DATA=();
	opendir(DFR,"./p_db/p");
	while($f_id = readdir(DFR)){
		if($f_id =~ /\.cgi/i){
$f_id =~ s/\.cgi//;

		if($f_id){
			if(!$p_id{$f_id}){
	&P_READ("p","$f_id","$f_id");
	&BIJYOU_READ("$f_id");
	&HIJYOU_READ("$f_id");

	push(@{"kuni_l$k_kunino{$p_kunino{$f_id}}"},"$f_id<>$p_name{$f_id}<>$p_habatuno{$f_id}<>$p_mikoudou_t{$f_id}<>$p_sousisan{$f_id}<>$p_tyuusei{$f_id}<>\n");
	$kuni_l{$k_kunino{$p_kunino{$f_id}}} = "kuni_l$k_kunino{$p_kunino{$f_id}}";
			push(@CL_DATA,"$p_db_view[0]\n");
	push(@p_db_all_l,"$f_id");
			}
		}
		}
	}
	closedir(DFR);

################
		@{"kuni_l"}=();
foreach $key ( keys %kuni_l ) {
#			if($kuni_l{$key}){
		open(OUT,">./w_db/kuni_l/l$key.cgi");
		print OUT @{$kuni_l{$key}};
		close(OUT);
#			}
}
################
	@tmp = map {(split /,/)[186]} @CL_DATA;
	@CL_DATA = @CL_DATA[sort {$tmp[$b] <=> $tmp[$a]} 0 .. $#tmp];
opendir(CF,'./p_db/p');
@cfs = (readdir(CF));
	closedir(CF);
$sousu1 = $#cfs -2;
opendir(CF,'./p_db/touketu');
@cfs = (readdir(CF));
closedir(CF);
$sousu3 = $#cfs -2 +$sousu1;
	&RANK1;
#   RANK1    #

	foreach(@k_no_all_l){
		$fk_id=int($_);
$k_busyou_suu{$fk_id}=int($cbl[$k_kunino{$fk_id}]);
		if($k_kunino{$fk_id}){
	&K_SAVE("kuni_db","$fk_id","$fk_id");
		}
	}
	&MAPS;
}



sub RANKD2 {


#########
		if(-e "./w_db/allc_kuni_db.pl"){
require "./w_db/all_kuni_db.pl";

		}else{ 
require "./w_db/all2_kuni_db.pl";
		}
opendir(DFR,"./w_db/kuni_db");
	while($fk_id = readdir(DFR)){
		if($fk_id =~ /\.cgi/i){
$fk_id =~ s/\.cgi//;
			if(!$k_id{$fk_id}){
	&K_READ("kuni_db","$fk_id","$fk_id");
			}
		}
	}
closedir(DFR);
#########

opendir(DFR,"./$mpg_r/sub_db/it");
	while($fi_id = readdir(DFR)){
		if($fi_id =~ /\.cgi/i){
$fi_id =~ s/\.cgi//;
			if(!$item_name{$fi_id}){
	&I_READ("it","$fi_id","$fi_id");
			}
		}
	}
closedir(DFR);
		if(-e "./w_db/allc_tosi_db.pl"){
require "./w_db/all_tosi_db.pl";

		}else{ 
require "./w_db/all2_tosi_db.pl";
		}
#   RANKD    #
#   RANKK    #

@p_db_all_l = ();
	@CL_DATA=();
	opendir(DFR,"./p_db/p");
	while($f_id = readdir(DFR)){
		if($f_id =~ /\.cgi/i){
$f_id =~ s/\.cgi//;

		if($f_id){
	&P_READ("p","$f_id","$f_id");
	&BIJYOU_READ("$f_id");
	&HIJYOU_READ("$f_id");
			if(!$p_id{$f_id}){
			$p_sougou{$f_id} = $p_buryoku{$f_id}+$p_tiryoku{$f_id}+$p_tousotu{$f_id};
			$p_kuni_nenkou{$f_id} = $p_kuni_kouken{$f_id} + $p_kuni_sikan_nensuu{$f_id} * 150 + $p_neutral_meisei{$f_id};

	&P_SAVE("p","$f_id","$f_id");
			push(@CL_DATA,"@NEW_D");
	push(@p_db_all_l,"$f_id");
			}
		}
		}
	}
	closedir(DFR);




#########
opendir(DFR,"./w_db/tosi_db");
	while($ft_id = readdir(DFR)){
		if($ft_id =~ /\.cgi/i){
$ft_id =~ s/\.cgi//;
			if($t_id{$ft_id} eq ""){
	&T_READ("tosi_db","$ft_id","$ft_id");
			}
		}
	}
closedir(DFR);
#########
												@listbusyou=();
	foreach(@k_no_all_l){
		$fk_id=$_;
			$listbusyou[$fk_id] = "\$list = \'";
	}

		foreach(@p_db_all_l){
			$e_id = $_;
$p_taizai_iti{$p_id{$e_id}} =~ s/z//g;
$p_taizai_iti{$p_id{$e_id}} = int($p_taizai_iti{$p_id{$e_id}});
							$ft_id = $p_taizai_iti{$p_id{$e_id}};
		if($p_kunino{$e_id} eq $t_kunino{$ft_id}){
			$listtz[$p_taizai_iti{$p_id{$e_id}}] .= "$p_name{$e_id} ";
			$listtzno[$p_taizai_iti{$p_id{$e_id}}] ++;

		}
			$listbusyou[$p_kunino{$e_id}] .= "<option value=\"$p_id{$e_id}\">・$p_name{$e_id} ";

	}

	&RANKD;
#   RANKD    #

}


1;
