
sub MOVE {
	&P_OPEN;
		$fk_id = $p_kunino{$f_id};
	&K_OPEN("kuni_db","$fk_id","$fk_id");

require "./p_db/tt/kcs4$f_id.pl";
	open(IN,"./p_db/tt/ktms4$f_id.cgi");
	@KTM = <IN>;
	close(IN);
	($ktms4,$ktms4w,$tmtmit,$tmtmw1,$tmtmw2,$tmtmw3) = split(/<>/,$KTM[0]);

$p_p_b_a_uri{$f_id} = "<a href=\"$URI/?.m.=p_b&amp;.id.=$p_id{$f_id}\" target=\"_blank\"><span class=\"kcb$p_k_iro_d{$f_id}\">$p_name{$f_id}</span></a>";
$k_p_k_a_uri{$fk_id} = "<a href=\"$URI/?.m.=p_k&amp;.tk.=$kuni_tenka_kaisuu&amp;.id.=$k_id{$fk_id}\" target=\"_blank\"><span class=\"kcb$k_iro_d{$fk_id}\">$k_name_d{$fk_id}</span></a>";
	print "Content-type: text/html\n\n";
	print <<"PRI";
<a href=\"$URI/?.m.=p_b&amp;.id.=$f_id\" target=\"_blank\"><span class=\"kcb$p_k_iro_d{$f_id}\">$p_name{$f_id}</span></a><>$p_img{$f_id}$p_cgno{$f_id}[0]$p_img_f{$f_id}<>$MEN_TITLE・$k_p_k_a_uri{$fk_id} $rank_mes<>$tmtmw3<>$f_id<>$p_img_m{$f_id}<><>
PRI
			
if(!$in{'t'}) {
	@KTM=();
$tmtmw3 = $tt+86400;
if($in{'tt'}) {
$tmtmw3 = $tt+$in{'tt'};
}
	unshift(@KTM,"$ktms4<>$ktms4w<>$tmtmit<>$tmtmw1<>$tmtmw2<>$tmtmw3<>\n");
	open(OUT,">./p_db/tt/ktms4$f_id.cgi");
	print OUT @KTM;
	close(OUT);
}
	exit;

}
1;