
############

sub MAP_LOG2 {
$kuni_news_f= 1;

@M_LOG_L = ();
	open(IN,"./w_db/map_log2.cgi");
	@M_LOG_L = <IN>;
	close(IN);

#############title_subject_creator_
$_[1] = $_[0]; 
$_[1] =~ s/<(.*?)>//g;
	unshift(@M_LOG_L,"<strong>$_[0]</strong>$tt_date<>$tt<>$tt_rss<>$_[1]<>$URI/?.m.=map2<>$_[2]<>$_[3]<>\n");

	splice(@M_LOG_L,10);

	open(OUT,">./w_db/map_log2.cgi");
	print OUT @M_LOG_L;
	close(OUT);

	open(OUT,">./w_db/map_log2.txt");
	print OUT "$_[0]<>";
	close(OUT);
			$M_LOG_MES = "\$D_MES = \'";

#############
$RSS_LOG = '';
$RSS_LOG2 = '';
			
#############
	$p=0;
	while($p < 10){
############
($rss_log_db,$rss_tt_tt,$rss_tt_db,$rss_title_db,$rss_link_db,$subject_rss_db,$creator_rss_db) = split(/<>/,$M_LOG_L[$p]);

$RSS_LOG .= <<"PRI";
<item rdf:about="$rss_link_db?$p">
  <title><![CDATA[ $saba_name\ $rss_title_db]]></title>
  <link>$rss_link_db</link>
  <dc:date>$rss_tt_db</dc:date>
  <dc:language>ja</dc:language>
  <sy:updatePeriod>hourly</sy:updatePeriod>
</item>
PRI
$RSS_LOG2 .= <<"PRI";
    <rdf:li rdf:resource="$rss_link_db?$p"/>
PRI
#############
		$M_LOG_MES .= "・$rss_log_db<br />";
		$p++;
	}
	$M_LOG_MES .= "\';
1;";
	$RSS_LOG .= "

</rdf:RDF>";
$RSS_LOG =~ s/&nbsp;//g;
$RSS_LOG =~ s/&/&amp;/g;
$RSS_LOG0 = <<"PRI";
<?xml version="1.0" encoding="UTF-8" ?>
<rdf:RDF 
  xmlns="http://purl.org/rss/1.0/"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" 
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:sy="http://purl.org/rss/1.0/modules/syndication/"
  xml:lang="ja">

<channel rdf:about="$URI/rss/siki_all.rdf">
  <title><![CDATA[ $MEN_TITLE/史記]]></title>
  <link>$URI/?.m.=map2</link>
  <description><![CDATA[ $GAME_TITLE・$MEN_TITLE/史記新着情報をGET]]></description>
  <dc:publisher>MMO Communications</dc:publisher>
  <dc:rights>Copyright:(C) 2005 MMO Communications. All Rights Reserved.</dc:rights>
  <dc:date>$tt_rss</dc:date>
    <items>
    <rdf:Seq>
$RSS_LOG2
    </rdf:Seq>
  </items>
</channel>
PRI
											open(OUT,">./w_db/map2all.pl");
											print OUT $M_LOG_MES;
											close(OUT);
											open(OUT,">./rss/siki_all.rdf");
											print OUT "$RSS_LOG0$RSS_LOG";
											close(OUT);


$RSS_LOG = "$M_LOG_L[0]$GAME_TITLE・$MEN_TITLE<>";
$RSS_LOG =~ s/&nbsp;//g;
$RSS_LOG =~ s/&/&amp;/g;
											open(OUT,">./rss_k_news.txt");
											print OUT $RSS_LOG;
											close(OUT);

@M_LOG_L = ();
	open(IN,"./w_db/map_log2r.cgi");
	@M_LOG_L = <IN>;
	close(IN);
$mlog2rc = $_[0];
$mlog2rc =~  s/mapr\///g;

$_[1] = $_[0]; 
$_[1] =~ s/<(.*?)>//g;
	unshift(@M_LOG_L,"<strong>$mlog2rc</strong>$tt_date<>$tt<>$tt_rss<>$_[1]<>$URI/?.m.=map2<>$_[2]<>$_[3]<>\n");


	open(OUT,">./w_db/map_log2r.cgi");
	print OUT @M_LOG_L;
	close(OUT);
}

############

sub MAP_LOG3 {


@M_LOG_L = ();
	open(IN,"./w_db/map_log3.cgi");
	@M_LOG_L = <IN>;
	close(IN);

$_[1] = $_[0]; 
$_[1] =~ s/<(.*?)>//g;
	unshift(@M_LOG_L,"<strong>$_[0]</strong>$tt_date<>$tt<>$tt_rss<>$_[1]<>$URI/?.m.=map2<>$_[2]<>$_[3]<>\n");

	splice(@M_LOG_L,5);

	open(OUT,">./w_db/map_log3.cgi");
	print OUT @M_LOG_L;
	close(OUT);

			$M_LOG_MES = "\$I_MES = \'";

#############
$RSS_LOG = '';
$RSS_LOG2 = '';
#############
	$p=0;
	while($p < 5){
############
($rss_log_db,$rss_tt_tt,$rss_tt_db,$rss_title_db,$rss_link_db,$subject_rss_db,$creator_rss_db) = split(/<>/,$M_LOG_L[$p]);

$RSS_LOG .= <<"PRI";
<item rdf:about="$rss_link_db?$p">
  <title><![CDATA[ $saba_name\ $rss_title_db]]></title>
  <link>$rss_link_db</link>
  <dc:date>$rss_tt_db</dc:date>
  <dc:language>ja</dc:language>
  <sy:updatePeriod>hourly</sy:updatePeriod>
</item>
PRI
$RSS_LOG2 .= <<"PRI";
    <rdf:li rdf:resource="$rss_link_db?$p"/>
PRI
#############
		$M_LOG_MES .= "・$rss_log_db<br />";
		$p++;
	}
	$M_LOG_MES .= "\';
1;";
	$RSS_LOG .= "

</rdf:RDF>";
$RSS_LOG =~ s/&nbsp;//g;
$RSS_LOG =~ s/&/&amp;/g;
											open(OUT,">./w_db/map3all.pl");
											print OUT $M_LOG_MES;
											close(OUT);
$RSS_LOG0 = <<"PRI";
<?xml version="1.0" encoding="UTF-8" ?>
<rdf:RDF 
  xmlns="http://purl.org/rss/1.0/"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" 
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:sy="http://purl.org/rss/1.0/modules/syndication/"
  xml:lang="ja">

<channel rdf:about="$URI/rss/ibento_all.rdf">
  <title><![CDATA[ $MEN_TITLE/イベント]]></title>
  <link>$URI/?.m.=map3</link>
  <description><![CDATA[ $GAME_TITLE・$MEN_TITLE/イベント新着情報をGET]]></description>
  <dc:publisher>MMO Communications</dc:publisher>
  <dc:rights>Copyright:(C) 2005 MMO Communications. All Rights Reserved.</dc:rights>
  <dc:date>$tt_rss</dc:date>
    <items>
    <rdf:Seq>
$RSS_LOG2
    </rdf:Seq>
  </items>
</channel>
PRI
											open(OUT,">./rss/ibento_all.rdf");
											print OUT "$RSS_LOG0$RSS_LOG";
											close(OUT);
@M_LOG_L = ();
	open(IN,"./w_db/map_log2r.cgi");
	@M_LOG_L = <IN>;
	close(IN);
$mlog2rc = $_[0];
$mlog2rc =~  s/mapr\///g;

	unshift(@M_LOG_L,"<strong>$mlog2rc</strong>$tt_date\n");


	open(OUT,">./w_db/map_log2r.cgi");
	print OUT @M_LOG_L;
	close(OUT);
}

############
sub RIKAUNTO{

@town_get = ();
@town_mes = ();
		$wt_id = 0;
	while ($wt_id<$tosi_kazu) {
		$t_name[$wt_id] = $t_name{$wt_id};
		$t_kunino[$wt_id] = $t_kunino{$wt_id};
		$t_zokuno[$wt_id] = $t_zokuno{$wt_id};
		$town_get[$t_kunino{$wt_id}] ++;
		$town_mes[$t_kunino{$wt_id}] .="$t_name{$wt_id} ";
			if($town_get[$t_kunino{$wt_id}] % 13 == 0){
		$town_mes[$t_kunino{$wt_id}].="<br />";
			}
$wt_id ++;
	}

@k_seizon_l = ();
$kuni_kazu = 0;
$kuni_kazu_d = 0;
$kuni_kazu_max =0;
		$wk_id = 0;
	foreach(@k_no_all_l){
$wk_id = $_;
		$k_name[$wk_id] = $k_name{$wk_id};
		$k_kunino[$wk_id] = $k_kunino{$wk_id};
		$k_iro_d[$wk_id] = $k_iro_d{$wk_id};
		$k_busyou_suu[$wk_id] = $k_busyou_suu{$wk_id};
				if($k_kunino{$wk_id}){
		$k_seizon_l[$kuni_kazu] = $wk_id;
$kuni_kazu ++;
				}
	$k_name_d[$wk_id] = $k_name_d{$wk_id};
				if($wk_id > $kuni_kazu_max){
$kuni_kazu_max =$wk_id;
				}
$kuni_kazu_d ++;
	}
}

sub MAPS{
#		$k_name_d[0] = "";

		$mapseisei = "";
		$mapseiseiz = "";
		$mapseisei .= "
$TAG_html_s<head>$TAG_d_head
<meta http-equiv=\"Content-type\" content=\"text/html; charset=UTF-8\" />
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/main.css\" />
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/map.css\" />
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/op.css\" />
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/overflow_h.css\" />
<title>$GAME_TITLE勢力図・国（縮小版）</title>
</head><body>$TAG_div_s{$doc_mode}
<strong><a href=\"./map.html\" target=\"_self\">国</a>　～ 勢力図・国 ～　<a href=\"./mapz.html\" target=\"_self\">賊</a></strong>
<table class=\"bgc60AF60\" width=380 border=\"0\" cellspacing=\"0\">
<tr class=\"bgcF8F0E8\">
<td class=\"txth\" width=\"15\">・</td>";

		$mapseiseiz .= "
$TAG_html_s<head>$TAG_d_head
<meta http-equiv=\"Content-type\" content=\"text/html; charset=UTF-8\" />
<title></title></head><body>$TAG_div_s{$doc_mode}
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/main.css\" />
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/map.css\" />
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/op.css\" />
<link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_URI/overflow_h.css\" />
<title>$GAME_TITLE勢力図・賊（縮小版）</title>
</head><body>$TAG_div_s{$doc_mode}
<strong><a href=\"./map.html\" target=\"_self\">国</a>　～ 勢力図・賊 ～　<a href=\"./mapz.html\" target=\"_self\">賊</a></strong>
<table class=\"bgc60AF60\" width=380 border=\"0\" cellspacing=\"0\">
<tr class=\"bgcF8F0E8\">
<td class=\"txth\" width=\"15\">・</td>";
$i=1;
    while($i <= 10){
		$mapseisei .= "<td class=\"txth\" width=\"35\">$i</td>";
		$mapseiseiz .= "<td class=\"txth\" width=\"35\">$i</td>";
$i++;
	}
	$mapseisei .= "</tr>";
	$mapseiseiz .= "</tr>";
$i=0;
     while($i < 13){
		$p = $i+1;
		$mapseisei .= "<tr><td class=\"txth bgcFFF8F0\">$p</td>";
		$mapseiseiz .= "<tr><td class=\"txth bgcFFF8F0\">$p</td>";
$j=0;
		while($j < 10){
				$col="";
				if(-e "$mpg_r/sub_db/twid/$j\_$i.pl"){
	open(IN,"$mpg_r/sub_db/twid/$j\_$i.pl");
	$zc = <IN>;
	close(IN);
							$dt_id = $zc;

						$col = "kbgcm$k_iro_d[$t_kunino{$dt_id}]";
						$colz = "kbgcm$k_iro_d[$k_iro_d[$t_zokuno{$dt_id}]]";
				if(!$k_kunino[$t_kunino[$dt_id]]){$col = "bgcFFFFFF";
				}
				if(!$k_kunino[$t_zokuno[$dt_id]]){$colz = "bgcFFFFFF";
				}

#	&IMG_B_CG_SAKUSEI("$IMG{0}/m_$t_cgno_d{$dt_id}$p_img_kakutyou{0}","32","32","$p_img_mime{0}","t$dt_id","m_$t_cgno_d{$dt_id}","","$col","","","","","");

$mapseisei .= "<acronym title=\"$t_name{$dt_id}【$k_name_d[$t_kunino[$dt_id]]】\"><td class=\"$col\" title=\"$t_name{$dt_id}【$k_name_d[$t_kunino[$dt_id]]】\"><div class=\"m_$t_cgno_d{$dt_id}\"> </div></td></acronym>";

#	&IMG_B_CG_SAKUSEI("$IMG{0}/m_$t_cgno_d{$dt_id}$p_img_kakutyou{0}","32","32","$p_img_mime{0}","z$dt_id","m_$t_cgno_d{$dt_id}","","$colz","","","","","");
$mapseiseiz .= "<acronym title=\"$t_name{$dt_id}の賊砦【$k_name_d[$t_zokuno[$dt_id]]】\"><td class=\"$colz\" title=\"$t_name{$dt_id}の賊砦【$k_name_d[$t_zokuno[$dt_id]]】\"><div class=\"m_$t_cgno_d{$dt_id}\"> </div></td></acronym>";
	$mapcssseisei .= "";
	$mapcssseisei .= "";
				}else{
					$mapseisei .= "<td class=\"txth\"> </td>";
					$mapseiseiz .= "<td class=\"txth\"> </td>";
				}
$j++;
		}
		$mapseisei .= "</tr>";
		$mapseiseiz .= "</tr>";
$i++;
	}
   		$mapseisei .= "
      </table>
</div></body></html>";
   		$mapseiseiz .= "
      </table>
</div></body></html>";

	open(OUT,">./w_db/map.html");
	print OUT $mapseisei;
	close(OUT);
	open(OUT,">./w_db/mapz.html");
	print OUT $mapseiseiz;
	close(OUT);
#&TRMAP_SEISEI;
}



############
sub ADD_BL_SEISEI{

		$add_bl_seisei = "

<a id=\"$k_kunino{$fk_id}\"></a>
<div class=\"blt_div\">
<div class=\"blt_block1\"><a href=\"#$add_k_t[$k_kunino{$fk_id}]\">↑</a></div>
<div class=\"blt_block2\">
<table width=\"100%\" class=\"kbgcb$k_iro_d{$fk_id}\">
<tr color=$ELE_BG[$k_iro_d{$fk_id}]><td width=\"60\"></td><td width=\"120\"></td><td width=\"60\"></td><td width=\"120\"></td><td width=\"60\"></td><td width=\"45\"></td><td width=\"75\"></td>
</tr>
<tr><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcb$k_iro_d{$fk_id}\">天子</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$k_tensi_name{$k_kunino{$fk_id}}</div></td><td colspan=\"2\" class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txtc\"><span class=\"fs4\"><a href=\"./?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_id{$fk_id}\" target=\"_blank\"><span class=\"kcc$k_iro_d{$fk_id}\">$k_name_d{$fk_id}</span></a></span></div></td>
<td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcb$k_iro_d{$fk_id}\">主民族</span></div></td><td colspan=\"2\" class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcb$k_iro_d{$fk_id}\">$MINZOKUSAN[$k_syuminzoku{$fk_id}]</span></div></td>
</tr>

<tr><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[1]</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[1]}}</div></td><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[2]</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[2]}}</div></td><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[3]</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\" colspan=\"2\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[3]}}</div></td></tr>
<tr><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[5]</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[5]}}</div></td><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[4]</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[4]}}</div></td><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[6]</span></div></td><td colspan=\"2\" class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[6]}}</div></td></tr>

<tr><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[7]</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[7]}}</div></td><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[10]</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[10]}}</div></td><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[9]</span></div></td><td colspan=\"2\" class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[9]}}</div></td></tr>

<tr><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[8]</span></span></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[8]}}</span></td><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[11]</span></span></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[11]}}</span></td><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[12]</span></span></td><td colspan=\"2\" class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[12]}}</span></td></tr>
<tr><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[15]</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[15]}}</div></td><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[13]</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[13]}}</div></td><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[14]</span></div></td><td colspan=\"2\" class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[14]}}</div></td></tr>
<tr><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[16]</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[16]}}</div></td><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[17]</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[17]}}</div></td><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[18]</span></div></td><td colspan=\"2\" class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[18]}}</div></td></tr>
<tr><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[19]</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><span class=\"kcb$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[19]}}</div></td><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[20]</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[20]}}</div></td><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[21]</span></div></td><td colspan=\"2\" class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[21]}}</div></td></tr>
<tr><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[22]</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[22]}}</div></td><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[23]</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[23]}}</div></td><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[24]</span></div></td><td colspan=\"2\" class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[24]}}</div></td></tr>
<tr><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[25]</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[25]}}</div></td><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[26]</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[26]}}</div></td><td class=\"kbgcb$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcc$k_iro_d{$fk_id}\">${$zokukanbuptn}[27]</span></div></td><td colspan=\"2\" class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\">$p_p_b_a{$p_id{$k_yakusyoku_id{$k_kunino{$fk_id}}[27]}}</div></td></tr>

<tr><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcb$k_iro_d{$fk_id}\">国威</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcb$k_iro_d{$fk_id}\">$k_kokui{$fk_id}</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcb$k_iro_d{$fk_id}\">国庫</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcb$k_iro_d{$fk_id}\">$k_kokko_sougaku{$fk_id}</span></div></td>
<td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcb$k_iro_d{$fk_id}\">税率</span></div></td><td colspan=\"2\" class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcb$k_iro_d{$fk_id}\">$k_busyou_kazei{$fk_id}％</span></div></td></tr>
<tr><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcb$k_iro_d{$fk_id}\">国策</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcb$k_iro_d{$fk_id}\">$KOKUSAKU[$k_kokusaku{$fk_id}]</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcb$k_iro_d{$fk_id}\">国教</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcb$k_iro_d{$fk_id}\">$KOKKYOU[$k_kokkyou{$fk_id}]</span></div></td>
<td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txtc\"><span class=\"kcb$k_iro_d{$fk_id}\">武将数</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcb$k_iro_d{$fk_id}\">$c[$k_kunino{$fk_id}]名</span></div></td><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\"><a href=\"./?.m.=blist&amp;.k.=$fk_id\" target=\"_blank\">武将一覧</a></div></td></tr>
<tr><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcb$k_iro_d{$fk_id}\">交戦相手</span></div></td><td colspan=\"6\" class=\"kbgcc$k_iro_d{$fk_id}\"><span class=\"kcb$k_iro_d{$fk_id}\">$wkousen[$k_kunino{$fk_id}]</span></td></tr>
<tr><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcb$k_iro_d{$fk_id}\">徴兵都市</span></div></td><td colspan=\"6\" class=\"kbgcc$k_iro_d{$fk_id}\"><span class=\"kcb$k_iro_d{$fk_id}\">$k_kouhou_tyouhei_name{$fk_id}</span></td></tr>
<tr><td class=\"kbgcc$k_iro_d{$fk_id}\"><div class=\"txth\"><span class=\"kcb$k_iro_d{$fk_id}\">支配都市</span></div></td><td colspan=\"6\" class=\"kbgcc$k_iro_d{$fk_id}\"><span class=\"kcb$k_iro_d{$fk_id}\">$town_mes[$k_kunino{$fk_id}]</span></td></tr>
</table></div>
<div class=\"blt_block3\"><a href=\"#$add_k_b[$k_kunino{$fk_id}]\">↓</a></div>
</div><div class=\"clear_b\"></div>
<br />

";

}

############
sub TRMAP_SEISEI{


		$mapseisei = "\$trmap = \"";

$i=0;
     while($i < 13){
		$p = $i+1;
		$mapseisei .= "<tr><td class=\\\"txth bgcFFF8F0\\\">$p</td>";
$j=0;
          while($j < 10){
				$col="";
				if(-e "$mpg_r/sub_db/twid/$j\_$i.pl"){
	open(IN,"$mpg_r/sub_db/twid/$j\_$i.pl");
	$zc = <IN>;
	close(IN);
							$dt_id = $zc;
						$mapseisei .= "<acronym title=\\\"$t_name{$dt_id}\\\"><td class=\\\"txth bgc\$bgcmap\[$zc\]\\\"><input type=\\\"radio\\\" name=\\\".num.\\\" value=\\\"$zc\\\" />$t_name{$dt_id}</td></acronym>
";

				}else{
					$mapseisei .= "<td> </td>";
				}
$j++;
		}
		$mapseisei .= "</tr>";
$i++;
	}

	$mapseisei .= "\";
1;";
	open(OUT,">./w_db/trmap.pl");
	print OUT $mapseisei;
	close(OUT);

}

1;
