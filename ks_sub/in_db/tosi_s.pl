
sub MOVE {
	&P_OPEN;


		$ft_id = $p_taizai_iti{$f_id};
	&T_OPEN("tosi_db","$ft_id","$ft_id");

	if($t_kunino{$ft_id} eq $p_kunino{$f_id}){$hantei = "tmrk$p_taizai_iti{$f_id}";
	}elsif($t_zokuno{$ft_id} and $t_zokuno{$ft_id} eq $p_kunino{$f_id}){$hantei = "tmrz$p_taizai_iti{$f_id}";
	}else{$hantei = "tmrx$p_taizai_iti{$f_id}";
	}


	open(IN,"./w_db/mati/$hantei.cgi");
	@TMTM = <IN>;
	close(IN);
	($tmtm) = split(/<>/,$TMTM[0]);

		$add_tosi_s_url = "./w_db/mati/$hantei$tmtm.html";
	if(!-e "./w_db/mati/$hantei$tmtm.html"){
		$add_tosi_s_url = "./seiseityuu.html";
	}


	&HEADER;
	print <<"PRI";
<object data=\"$add_tosi_s_url\" type=\"text/html\" width=\"100%\" height=\"1000\">オブジェクトタグに対応していない方は下のリンクで新しい窓を開いてください。<br /><a href=\"$add_tosi_s_url\" target=\"_blank\">詳細情報</a></object> 

<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"submit\" value=\"コマンド入力画面へ\" /></div></form>


PRI

	&FOOTER;
	exit;

}

1;