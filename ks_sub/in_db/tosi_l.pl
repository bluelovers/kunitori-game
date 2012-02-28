
sub MOVE {


	&P_OPEN;

		if(-e "./w_db/kuni/db$p_kunino{$f_id}.pl"){
require "./w_db/kuni/db$p_kunino{$f_id}.pl";
		}else{
							open(IN,"./w_db/kuni/db$p_kunino{$f_id}.cgi");
							$log_c = <IN>;
							close(IN);
		}

	&HEADER;
	print <<"PRI";


<table border=\"3\">
$t_list
</table>
<br />
<form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"submit\" value=\"コマンド入力画面へ\" /></div></form>
PRI

	&FOOTER;
	exit;


}

1;
