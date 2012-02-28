
require "$mpg_r/jcode.pl";
require "$mpg_r/spt.pl";
require "$mpg_r/sub_db/index.pl";

require "$mpg_r/sub_db/tw.pl";
#########
require "$mpg_r/k-spt.pl";
require "$mpg_r/k-ini.pl";

require "$mpg_r/sub_db/it.pl";
require "$mpg_r/sub_db/kanbu.pl";
require "$mpg_r/men_db/kts/$menck.pl";
require "$mpg_r/sub_db/minzoku.pl";
require "$mpg_r/sub_db/hei.pl";
require "$mpg_r/sub_db/cd.pl";
require "$mpg_r/bl-0.pl";
require "$mpg_r/sub_db/mapw.pl";
require "$mpg_r/sub_db/citem.pl";
require "$mpg_r/sub_db/kakuduke.pl";
require "$mpg_r/sub_db/kanbu.pl";
#########

require "$mpg_r/bl.pl";
require "$mpg_r/sub_db/senpou.pl";
require "$mpg_r/wl.pl";

sub RESET_MOVE{

	&TT_GET;
	&KOUSIN_LOCK;

	open(OUT,">./w_db/map_log2.txt");
	print OUT "";
	close(OUT);

	$dir="./p_db/p";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./p_db/act_cd";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);


	$dir="./p_db/cd";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./p_db/my_log";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./p_db/passport";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./p_db/touketu";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);


	$dir="./p_db/main";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./p_db/it";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./pr/b";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./pr/blog";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./pr/k";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./pr/klog";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./p_db/command";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./p_db/co";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./cg";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.html/i and $file !~ /index\.htm/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./slog";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.html/i and $file !~ /index\.htm/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./p_db/log";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./p_db/tt";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./p_db/jyuu";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./p_db/bl";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./p_db/id";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./p_db/mid";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./w_db/butai";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);
	$dir="./w_db/gundan_db";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);
	$dir="./w_db/gundan_m";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);


	$dir="./w_db/kuni_l";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./w_db/gundan_l";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./w_db/r_tosi_db";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./w_db/r_p_db";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./w_db/atc";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./w_db/kuni";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.html/i and $file !~ /index\./i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./w_db/r_kuni_db";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./w_db/cmes";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./w_db/guest";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./w_db/jyusin";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./w_db/kuni";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if(($file =~ /\.cgi/i or $file =~ /\.pl/i) and $file !~ /index\./i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./w_db/butai_m";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./w_db/butai_l";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i or $file =~ /\.pl/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);


	$dir="./w_db/mati";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if(($file =~ /\.cgi/i or $file =~ /\.pl/i) and $file !~ /index\./i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./w_db/mati";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.html/i and $file !~ /index\./i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./w_db/butai_db";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./w_db/touketu";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./w_db/kuni_db";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./p_db/rank";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./p_db/slogid";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./p_db/tt";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./p_db/ad";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);



	$dir="./ip_db/tajyuul";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./ip_db/jyuu";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./ip_db/ip";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./ip_db/giwaku";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.cgi/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);


	$dir="./mapr";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.html/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	$dir="./mapr/db";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.html/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);
	$dir="./mapr/tuki";
	opendir(DFR,"$dir");
	while($file = readdir(DFR)){
		if($file =~ /\.html/i){
			unlink("$dir/$file");
		}
	}
	closedir(DFR);

	@NEW_DATA = ();

	open(OUT,">./w_db/k_sikan_kyozetu.cgi");
	print OUT @NEW_DATA;
	close(OUT);

	open(OUT,">./w_db/comip.cgi");
	print OUT @NEW_DATA;
	close(OUT);
	open(OUT,">./w_db/comip0.cgi");
	print OUT @NEW_DATA;
	close(OUT);
	open(OUT,">./w_db/kyuuex.cgi");
	print OUT @NEW_DATA;
	close(OUT);

	open(OUT,">./w_db/apon.cgi");
	print OUT @NEW_DATA;
	close(OUT);

	open(OUT,">./w_db/gundan_list.cgi");
	print OUT @NEW_DATA;
	close(OUT);



	open(OUT,">./w_db/k_db_l_kuni_db.cgi");
	print OUT @NEW_DATA;
	close(OUT);

	open(OUT,">./w_db/k_db_b_l_kuni_db.cgi");
	print OUT @NEW_DATA;
	close(OUT);


	opendir(defd,"./w_db/def");
	while($defdir = readdir(defd)){
	opendir(defl,"./w_db/def/$defdir");
	while($deffile = readdir(defl)){
		if($deffile =~ /\.cgi/i){
	open(OUT,">./w_db/def/$defdir/$deffile");
	print OUT @NEW_DATA;
	close(OUT);
		}
	}
	closedir(defl);
	}
	closedir(defd);
							unlink("./seiryoku3.txt");

	open(OUT,">./w_db/map_log.cgi");
	print OUT @NEW_DATA;
	close(OUT);

	open(OUT,">./w_db/map_log2.cgi");
	print OUT @NEW_DATA;
	close(OUT);


	open(OUT,">./w_db/k_db_d_l_kuni_db.cgi");
	print OUT @NEW_DATA;
	close(OUT);

	open(OUT,">./w_db/kanyuu_bun.cgi");
	print OUT @NEW_DATA;
	close(OUT);

	open(OUT,">./w_db/local_rule.cgi");
	print OUT @NEW_DATA;
	close(OUT);

							unlink("./w_db/okusyon\.pl");

	open(OUT,">./w_db/okusyon.cgi");
	print OUT @NEW_DATA;
	close(OUT);
	open(IN,"./w_db/t_db_l_syoki_tosi.cgi");
	@F_T_DATA = <IN>;
	close(IN);
							unlink("./w_db/t_db_l_syoki_tosi.cgi");
	open(OUT,">./w_db/map_log2r.cgi");
	print OUT @NEW_DATA;
	close(OUT);
	open(OUT,">./w_db/map_log3.cgi");
	print OUT @NEW_DATA;
	close(OUT);

	open(OUT,">./w_db/t_db_l_tosi_db.cgi");
	print OUT @F_T_DATA;
	close(OUT);


							unlink("./b_itiran.html");
							unlink("./meisyou.html");
							unlink("./w_db/bs.cgi");


		$add_hit =0;
opendir(DFR,"./w_db/syoki_tosi");
	while($ft_id = readdir(DFR)){
		if($ft_id =~ /\.cgi/i){
$ft_id =~ s/\.cgi//;
	&T_READ("syoki_tosi","$ft_id","$ft_id");
$t_siro_taikyuu_max{$ft_id}=999;
$t_zoku_taikyuu_max{$ft_id}=999;
	&T_N_SAVE("tosi_db","$ft_id","$ft_id");
	&T_N_SAVE("syoki_tosi","$ft_id","$ft_id");
		}
	}
closedir(DFR);
##########



												&MAPS;
	&MAP_LOG("全データの初期化完了。");
	&MAP_LOG3("全データの初期化完了。");
												@listdf=();
			$p = 0;
	opendir(defd,"./w_db/def");
	while($defdir = readdir(defd)){
		if($p > 1){
	opendir(defl,"./w_db/def/$defdir");
	while($deffile = readdir(defl)){
		if($deffile =~ /\.cgi/i){
			open(IN,"./w_db/def/$defdir/$deffile");
			@DEF_LIST3 = <IN>;
			close(IN);
$deffile =~ s/\.cgi//g;
	if($md_eria eq "999"){
									foreach(@DEF_LIST3){
										($mdid,$mdname,$md_tosi,$md_eria,$md_kuni) = split(/<>/);
			$listdfz[$md_tosi] .= "$mdname ";
			$listdfzno[$md_tosi] ++;

			$dfihn = "dfi$md_tosi";
			$dfihnno = "dfino$md_tosi";
			${$dfihn}[$md_eria] .= "$mdname『$k_name_d[$md_kuni]』 ";
			${$dfihnno}[$md_eria] ++;
									}
	} else { 
									foreach(@DEF_LIST3){
										($mdid,$mdname,$md_tosi,$md_eria,$md_kuni) = split(/<>/);
			$listdf[$md_tosi] .= "$mdname ";
			$listdfno[$md_tosi] ++;

			$dfihn = "dfi$md_tosi";
			$dfihnno = "dfino$md_tosi";
			${$dfihn}[$md_eria] .= "$mdname『$k_name_d[$md_kuni]』 ";
			${$dfihnno}[$md_eria] ++;
									}
	}
		}
	}
	closedir(defl);
		}
			$p ++;
	}
	closedir(defd);


												@stv=();
	$zc=0;
	while ($zc<$tosi_kazu) {
							$dt_id = $zc;



   		$stv[$zc] = '$t_name{$ft_id} = \'' . $t_name{$dt_id} . '\';' . '$t_kunino{$ft_id} = \'' . $t_kunino{$dt_id} . '\';' . 
'$t_ryoumin_suu{$ft_id} = \'' . $t_ryoumin_suu{$dt_id} . '\';' . '$t_nougyou_ti{$ft_id} = \'' . $t_nougyou_ti{$dt_id} . '\';' . '$t_syougyou_ti{$ft_id} = \'' . $t_syougyou_ti{$dt_id} . '\';' . 
'$t_siro_bouei_ti{$ft_id} = \'' . $t_siro_bouei_ti{$dt_id} . '\';' . '$t_nougyou_max{$ft_id} = \'' . $t_nougyou_max{$dt_id} . '\';' . '$t_syougyou_max{$ft_id} = \'' . $t_syougyou_max{$dt_id} . '\';' . 
'$t_siro_bouei_max{$ft_id} = \'' . $t_siro_bouei_max{$dt_id} . '\';' . '$t_tian_ti{$ft_id} = \'' . $t_tian_ti{$dt_id} . '\';' . '$t_x_zahyou{$ft_id} = \'' . $t_x_zahyou{$dt_id} . '\';' . 
'$t_y_zahyou{$ft_id} = \'' . $t_y_zahyou{$dt_id} . '\';' . '$zsouba = \'' . "$t_kome_souba{$dt_id}" . '\';' . '$t_kome_souba{$ft_id} = \'' . $t_kome_souba{$ft_id} . '\';' . '$t_siro_taikyuu_ti{$ft_id} = \'' . $t_siro_taikyuu_ti{$dt_id} . '\';' . 
'$t_gijyutu_ti{$ft_id} = \'' . $t_gijyutu_ti{$dt_id} . '\';' . '$zsub2 = \'' . $z2sub2 . '\';' . 
'$t_setuzoku_saki{$ft_id}[0] = \'' . $t_setuzoku_saki{$dt_id}[0] . '\';' . '$t_setuzoku_saki{$ft_id}[1] = \'' . $t_setuzoku_saki{$dt_id}[1] . '\';' . '$t_setuzoku_saki{$ft_id}[2] = \'' . $t_setuzoku_saki{$dt_id}[2] . '\';' . 
'$t_setuzoku_saki{$ft_id}[3] = \'' . $t_setuzoku_saki{$dt_id}[3] . '\';' . '$t_setuzoku_saki{$ft_id}[4] = \'' . $t_setuzoku_saki{$dt_id}[4] . '\';' . '$t_setuzoku_saki{$ft_id}[5] = \'' . $t_setuzoku_saki{$dt_id}[5] . '\';' . 
'$t_setuzoku_saki{$ft_id}[6] = \'' . $t_setuzoku_saki{$dt_id}[6] . '\';' . '$t_setuzoku_saki{$ft_id}[7] = \'' . $t_setuzoku_saki{$dt_id}[7] . '\';' . 
'$listdf = \'' . "$listdf[$zc]（$listdfno[$zc]名）" . '\';' . '$listdfz = \'' . "$listdfz[$zc]（$listdfzno[$zc]名）" . '\';' . 
"\$\{$dfihn\}[1] = \'" . ${$dfihn}[1] . '\';' . "\$\{$dfihnno\}[1] = \'" . int(${$dfihnno}[1]) . '\';' . 
"\$\{$dfihn\}[2] = \'" . ${$dfihn}[2] . '\';' . "\$\{$dfihnno\}[2] = \'" . int(${$dfihnno}[2]) . '\';' . 
"\$\{$dfihn\}[3] = \'" . ${$dfihn}[3] . '\';' . "\$\{$dfihnno\}[3] = \'" . int(${$dfihnno}[3]) . '\';' . 
"\$\{$dfihn\}[4] = \'" . ${$dfihn}[4] . '\';' . "\$\{$dfihnno\}[4] = \'" . int(${$dfihnno}[4]) . '\';' . 
"\$\{$dfihn\}[5] = \'" . ${$dfihn}[5] . '\';' . "\$\{$dfihnno\}[5] = \'" . int(${$dfihnno}[5]) . '\';' . 
"\$\{$dfihn\}[6] = \'" . ${$dfihn}[6] . '\';' . "\$\{$dfihnno\}[6] = \'" . int(${$dfihnno}[6]) . '\';' . 
"\$\{$dfihn\}[11] = \'" . ${$dfihn}[11] . '\';' . "\$\{$dfihnno\}[11] = \'" . int(${$dfihnno}[11]) . '\';' . 
"\$\{$dfihn\}[12] = \'" . ${$dfihn}[12] . '\';' . "\$\{$dfihnno\}[12] = \'" . int(${$dfihnno}[12]) . '\';' . 
"\$\{$dfihn\}[13] = \'" . ${$dfihn}[13] . '\';' . "\$\{$dfihnno\}[13] = \'" . int(${$dfihnno}[13]) . '\';' . 
"\$\{$dfihn\}[20] = \'" . ${$dfihn}[20] . '\';' . "\$\{$dfihnno\}[20] = \'" . int(${$dfihnno}[20]) . '\';' . 
"\$\{$dfihn\}[21] = \'" . ${$dfihn}[21] . '\';' . "\$\{$dfihnno\}[21] = \'" . int(${$dfihnno}[21]) . '\';' . 
"\$\{$dfihn\}[22] = \'" . ${$dfihn}[22] . '\';' . "\$\{$dfihnno\}[22] = \'" . int(${$dfihnno}[22]) . '\';' . 
"\$\{$dfihn\}[23] = \'" . ${$dfihn}[23] . '\';' . "\$\{$dfihnno\}[23] = \'" . int(${$dfihnno}[23]) . '\';' . 
"\$\{$dfihn\}[24] = \'" . ${$dfihn}[24] . '\';' . "\$\{$dfihnno\}[24] = \'" . int(${$dfihnno}[24]) . '\';' . 
"\$\{$dfihn\}[999] = \'" . ${$dfihn}[999] . '\';' . "\$\{$dfihnno\}[999] = \'" . int(${$dfihnno}[999]) . '\';' . 
'1;';

											open(OUT,">./w_db/guest/stv$zc\.pl");
											print OUT $stv[$zc];
											close(OUT);
		$zc++;
	}


			$S_MES = "\$S_MES = \'
<span class=\"c228B22\">●</span>
<br />
<span class=\"c228B22\">●</span>
<br />
<span class=\"c228B22\">●</span>
<br />
<span class=\"c228B22\">●</span>
<br />
<span class=\"c228B22\">●</span>
<br />
\';
1;";
											open(OUT,">./w_db/map5.pl");
											print OUT $S_MES;
											close(OUT);


			$S_MES = "\$S_MES = \'・<br />・<br />・<br />・<br />・<br />\';
1;";
											open(OUT,">./w_db/mapall.pl");
											print OUT $S_MES;
											close(OUT);

			$S_MES = "\$D_MES = \'・<br />・<br />・<br />・<br />・<br />\';
1;";
											open(OUT,">./w_db/map2all.pl");
											print OUT $S_MES;
											close(OUT);



   		$kousen = "
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}

<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/main.css\"$TAG_s0>
<title>$GAME_TITLE</title>
</head>$TAG_body_s0
名将一覧は初年度1月に編集されます。<br />
データが作成されるまで暫くお待ち下さい。<br />
</div></body></html>";

	open(OUT,">./meisyou.html");
	print OUT $kousen;
	close(OUT);
   		$kousen = "
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}

<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/main.css\"$TAG_s0>
<title>$GAME_TITLE</title>
</head>$TAG_body_s0
まだゲーム本編が開始されていません。<br />
登録武将一覧は初年度1月に編集されます。<br />
データが作成されるまで暫くお待ち下さい。<br />
</div></body></html>";
	open(OUT,">./w_db/kuni/1.html");
	print OUT $kousen;
	close(OUT);
	open(OUT,">./w_db/kuni/t.html");
	print OUT $kousen;
	close(OUT);

	open(OUT,">./b_itiran.html");
	print OUT $kousen;
	close(OUT);
	# DATE LIST
		$m_tt = int(($tt-1079244120)/86400+7) * 86400+1079244120;

	$m_tt=$tt;
	$m_tt1=$m_tt;
			($qsec,$qmin,$qhour,$qday) = localtime($m_tt);
				&KTS1;
		if($m_tt ne $m_tt1){
	$m_tt=$m_tt1 + 14400;
	$m_tt1=$m_tt;
			($qsec,$qmin,$qhour,$qday) = localtime($m_tt);
				&KTS1;
		}
		if($m_tt ne $m_tt1){
	$m_tt=$m_tt1 + 14400;
	$m_tt1=$m_tt;
			($qsec,$qmin,$qhour,$qday) = localtime($m_tt);
				&KTS1;
		}
		if($m_tt ne $m_tt1){
	$m_tt=$m_tt1 + 14400;
	$m_tt1=$m_tt;
			($qsec,$qmin,$qhour,$qday) = localtime($m_tt);
				&KTS1;
		}
		if($m_tt ne $m_tt1){
	$m_tt=$m_tt1 + 14400;
	$m_tt1=$m_tt;
			($qsec,$qmin,$qhour,$qday) = localtime($m_tt);
				&KTS1;
		}
		if($m_tt ne $m_tt1){
	$m_tt=$m_tt1 + 14400;
	$m_tt1=$m_tt;
			($qsec,$qmin,$qhour,$qday) = localtime($m_tt);
				&KTS1;
		}
		if($m_tt ne $m_tt1){
	$m_tt=$m_tt1 + 14400;
	$m_tt1=$m_tt;
			($qsec,$qmin,$qhour,$qday) = localtime($m_tt);
				&KTS1;
		}
	$m_tt += 86400 * 7;

	$keika_nen = 0;
	$tuki_genzai = 0;
	$kousinjyoutai = 0;

	$tenkakaisuu = 1;
	$outyou = "後漢 暦";
	$seibento1 = 0;
	$seibento2 = 0;
	$syuminzoku = 0;
	$msyuto = 10;
	$kaisinen = 100;
	$zenkaisinen = 100;
	$touitunen = 400;
	$sinkouminzoku1 = 6;
	$sinkouminzoku2 = 10;
	$zentensimei = "光武帝 ";

$woutyou =$outyou;
$woutyou =~  s/暦//g;
	@OUTYOU_DATA = ();
	$rekimaprid = sprintf("%05d\.html", $tenkakaisuu);
		$outyou_URL="<a href=\"../$rekimaprid\">$outyou</a>";
		unshift(@OUTYOU_DATA,"$tenkakaisuu<>$woutyou<>$rekimaprid<>$t_name[$msyuto]<>$zentensimei<>$tt_date<>\n");

	open(OUT,">./w_db/outyou.cgi");
	print OUT @OUTYOU_DATA;
	close(OUT);

	@jikan_jiku_new = ();
		unshift(@jikan_jiku_new,"$keika_nen<>$tuki_genzai<>$m_tt<>$kousinjyoutai<>$tenkakaisuu<>$outyou<>$seibento1<>$seibento2<>$syuminzoku<>$msyuto<>$kaisinen<>$zenkaisinen<>$touitunen<>$sinkouminzoku1<>$sinkouminzoku2<>$zentensimei<><><><><>\n");

	open(OUT,">./w_db/jikan_jiku_main.cgi");
	print OUT @jikan_jiku_new;
	close(OUT);

	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$maprid = sprintf("%05d\-%04d\-%02d\.html", $tenkakaisuu, $KAISI_NEN+$keika_nen, $tuki_genzai);
	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);
	$old_date = "<a href=\"./mapr/$yymaprid\">$old_date</a>";
require "$mpg_r/bl-1.pl";
	&RANK12;
#	&RANKD2;

		$S_MES = "";

	foreach(@OUTYOU_DATA){
		($outyouid,$outyouname,$outyouurl,$outyououto,$outyouki,$outyoutt)=split(/<>/);
		$S_MES .= "<br /><br /> - <a href=\"./$outyouurl\">$MEN_TITLE 第$outyouid部 $outyoutt～<br />$outyouname王朝：王都「$outyououto」：初代皇帝「$outyouki」</a> - ";
	}
		$mapseisei = "";
		$mapseisei .= "
$TAG_html_s{$doc_mode}<head>$TAG_d_head{$doc_mode}

<title>$GAME_TITLE$MEN_TITLE</title>
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/rekisi_main.css\"$TAG_s0>
</head><body>$TAG_div_s{$doc_mode}
<span class=\"fs5\"> - 歴史資料室 - </span><br />
$S_MES";

   		$mapseisei .= "<br /><br /><hr /><a href=\"../\"\"_top\">ログイン画面に戻る</a><br /></div></body></html>";
	open(OUT,">./mapr/index.html");
	print OUT $mapseisei;
	close(OUT);
				$new_kuni_id_in = 1;
				$p_kunino{$f_id} = $new_kuni_id_in;
$add_name_d = "漢 ";
$in{'zokumei'} = "$add_name_d ";
$in{'min'} = 0;
$in{'ele'} = 1;
$in{'id'} = "";
$in{'mes'} = "$zentensimei ";
		$fk_id = $new_kuni_id_in;
	&K_READ("kuni_db","$fk_id","$fk_id");
			$k_kousen_aite_name{$fk_id} = "無し";
$k_syuminzoku{$fk_id} = 0;
$k_name_d{$fk_id} = '';
$xtoorina = '';
$k_name_z{$fk_id} = '';
$xkokugou = '';
$k_outo{$fk_id} = 10;
$k_kokka_keitai{$fk_id} = 0;
$xflag2 = '';
$xflag3 = '';
$xflag4 = '';
$xflag5 = '';
@xtatemono = ();
$xdbdb1 = '';
$xdbdb2 = '';
$xdbdb3 = '';
$xdbdb4 = '';
$xdbdb5 = '';
$xdbdb6 = '';
$xdbdb7 = '';
$xdbdb8 = '';
$xdbdb9 = '';
$xdbdb10 = '';
	
$k_kousen_aite_k{$fk_id}[0] = '0';
$k_kousen_aite_k{$fk_id}[1] = '0';
$k_kousen_aite_k{$fk_id}[2] = '0';
$k_kousen_aite_k{$fk_id}[3] = '0';
$k_kousen_aite_k{$fk_id}[4] = '0';
$k_kousen_aite_k{$fk_id}[5] = '0';
$k_kousen_aite_k{$fk_id}[6] = '0';
$k_kousen_aite_k{$fk_id}[7] = '0';
$k_kousen_aite_k{$fk_id}[8] = '0';
$k_kousen_aite_k{$fk_id}[9] = '0';

$k_name_d{$fk_id} = "$add_name_d ";
$k_name_k{$fk_id} = "$add_name_d ";
$k_name_outyou{$fk_id}="$add_name_d ";
$k_name_z{$fk_id} = "$in{'zokumei'} ";
$k_syuminzoku{$fk_id} = $in{'min'};
$k_yakusyoku_id{$fk_id}[1] = $in{'id'};

$k_id{$fk_id} = $new_kuni_id_in;
$k_kunino{$fk_id} = $new_kuni_id_in;
$k_name{$fk_id} = "$add_name_d ";
$k_iro_d{$fk_id} = $in{'ele'};
$k_keika_t{$fk_id} = 0;
$k_kokui{$fk_id} = 0;
$k_sirei_bun{$fk_id} = " ";
$k_tensi_name{$fk_id} = $in{'mes'};
$k_kouryaku_mokuhyou{$fk_id}[0] = 0;
$k_zenki_tosisuu{$fk_id} = 1;
$k_busyou_kazei{$fk_id} = 0;
$k_kokko_sougaku{$fk_id} = 1000000;
$k_zenki_sou_syuunyuu{$fk_id} = 0;
$k_kouhou_tyouhei{$fk_id}[0] = $msyuto;
$k_yomikaki{$fk_id} = 0;
$k_kouhou_tyouhei_name{$fk_id} = "$t_name[$msyuto]";

	&K_N_SAVE("kuni_db","$fk_id","$fk_id");
$gundan_yomikaki{$fgundan_id} = 0;
$butai_yomikaki{$fbutai_id} = 0;
$pt_yomikaki{$fpt_id} = 0;
$habatu_yomikaki{$fhabatu_id} = 0;
$guild_yomikaki{$fguild_id} = 0;



$gundan_kunino{1} = 0;
$gundan_habatuno{1} = 0;
$gundan_yomikaki{1} = 0;
$butai_kunino{1} = 0;
$butai_habatuno{1} = 0;
$butai_yomikaki{1} = 0;
$pt_kunino{1} = 0;
$pt_habatuno{1} = 0;
$pt_yomikaki{1} = 0;
$habatu_kunino{1} = 0;
$habatu_habatuno{1} = 0;
$habatu_yomikaki{1} = 0;
$guild_kunino{1} = 0;
$guild_habatuno{1} = 0;
$guild_yomikaki{1} = 0;
	&BUTAI_N_SAVE("butai_db","1","1");
	&GUNDAN_N_SAVE("gundan_db","1","1");

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
	$wzname=$t_name{$ft_id};
	@wz=();
	$zc=0;
	while ($zc<$tosi_kazu) {
							$ft_id = $zc;

	if("$msyuto" eq "$zc"){
	$wz[0] = $t_setuzoku_saki{$ft_id}[0];
	$wz[1] = $t_setuzoku_saki{$ft_id}[1];
	$wz[2] = $t_setuzoku_saki{$ft_id}[2];
	$wz[3] = $t_setuzoku_saki{$ft_id}[3];
	$wz[4] = $t_setuzoku_saki{$ft_id}[4];
	$wz[5] = $t_setuzoku_saki{$ft_id}[5];
	$wz[6] = $t_setuzoku_saki{$ft_id}[6];
	$wz[7] = $t_setuzoku_saki{$ft_id}[7];
	$wz[8] = $t_setuzoku_saki{$ft_id}[8];
	$wz[9] = $t_setuzoku_saki{$ft_id}[9];
$t_kunino{$ft_id}=1;
	}else{
$t_kunino{$ft_id}=0;
	}
	&T_N_SAVE("tosi_db","$ft_id","$ft_id");
		$zc++;
	}

	foreach(@wz){
	if("$_" ne ""){
							$ft_id = $_;

$t_kunino{$ft_id}=1;
	&T_N_SAVE("tosi_db","$ft_id","$ft_id");
	}
	}

&MAP_LOG2("<br />・<span class=\"c0000FF\">【王朝設立】</span>\[$outyou元年\]$zentensimeiが$woutyou王朝を設立しました。王都：$t_name[$msyuto]<br />");
&MAP_LOG2("<span class=\"c0000FF\">【$GAME_TITLE$MEN_TITLE 第$tenkakaisuu部スタート】</span>$outyou、100年・・。光武帝の威信は消えかけ各地で不穏な動きが活発となる。新天子擁立をもくろむ野心家が世に溢れ、中国大陸に新たな風が吹き始めていた・・。");

	@TMTM=();
	unshift(@TMTM,"150<>100<>100<>100<>500<>\n");
	open(OUT,">./w_db/no1.cgi");
	print OUT @TMTM;
	close(OUT);

&MAPS;

	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);

		$pmyear=$keika_nen;
		$pmmonth=$tuki_genzai;
	$pmaprid = sprintf("%05d\-%04d\-%02d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear, $pmmonth);
	$yymaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$ryymaprid = sprintf("%05d\-%04d", $tenkakaisuu, $KAISI_NEN+$pmyear);
	$ypmaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear-1);

	$pold_date = $old_date;
	$old_date = "<a href=\"./mapr/$yymaprid\">$old_date</a>";


	$ryfmaprid = sprintf("%05d\-%04d", $tenkakaisuu, $KAISI_NEN+$pmyear+1);
	$yfmaprid = sprintf("%05d\-%04d\.html", $tenkakaisuu, $KAISI_NEN+$pmyear+1);

	$maprid = sprintf("%05d\-%04d\-%02d\.html", $tenkakaisuu, $KAISI_NEN+$keika_nen, $tuki_genzai);

	$old_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $tuki_genzai);
	$yold_date = $old_date;
	$old_date = "<a href=\"./mapr/$yfmaprid\">$old_date</a>";
		$fmmonth=$tuki_genzai+1;
		if($fmmonth > 12){
			$fmyear++;
			$fmmonth=1;
		}
	$fmaprid = sprintf("%05d\-%04d\-%02d\.html", $tenkakaisuu, $KAISI_NEN+$keika_nen, $fmmonth);
	$fold_date = sprintf("%02d\年%02d\月", $KAISI_NEN+$keika_nen, $fmmonth);
		$fmyear=$keika_nen+1;


	&RANK1;
		$outyou_URL="<a href=\"../$rekimaprid\">$outyou</a>";
		$p2old_date_URL="\[<a href=\"./$pmaprid\">$pold_date</a>\]←";
		$fold_dat_URL="→\[<a href=\"./$fmaprid\">$fold_date</a>\]";
		$mapseisei_in_URL="./mapr/tuki/map2.html";
	&MAPSR;

		$thit = 0;
	while ($thit<$tosi_kazu) {

	&T_SAVE("tosi_db","$thit","$thit");
$thit ++;
	}

require "$mpg_r/sub_db/img_css_w.pl";

opendir(DFR,"./$mpg_r/sub_db/d_cg");
	while($fi_id = readdir(DFR)){
		if(length($fi_id)>3){
	($add_fid,$add_mime) = split(/\./,$fi_id);
$w_id=$add_fid;
$p_cg_sabano{$w_id}=0;
$p_img{$w_id}="$IMG{0}/$add_fid";
$p_img_f{$w_id}="$p_img_kakutyou{$add_mime}";
$p_img_m{$w_id}="$p_img_mime{$add_mime}";
&IMG_CSS_SEISEI0();

		}
	}
closedir(DFR);
#####Ver1.13
	&KUNITORI_NEWS;
#####Ver1.15
	&TRMAP_SEISEI;
#####
	&KOUSIN_UNLOCK;
}
1;

