
sub MOVE {

	&P_OPEN;
	open(IN,"./p_db/my_log/$f_id.cgi");
	@LOG_DATA = <IN>;
	close(IN);

	$i_max = @LOG_DATA;
	$i=0;
	while($i<$i_max){
$log_c .= "$LOG_DATA[$i]<br />";
		$i++;
		if($i % 10 == 0){
		$log_c .= "<br />";
		}
	}

	&HEADER;
	print <<"PRI";

<table width=\"100%\"><tr><td class=\"txth\"><form action=\"$COMMAND\" method=\"post\" utn=\"utn\"><div><input type=\"hidden\" name=\".m.\" value=\"$KEITAI_T\" /><input type=\"hidden\" name=\".i.\" value=\"$in{'i'}\" /><input type=\"hidden\" name=\".id.\" value=\"$in{'id'}\" /><input type=\"hidden\" name=\".pass.\" value=\"$in{'pass'}\" /><input type=\"submit\" value=\"コマンド入力画面へ\" />

</div></form>
</td></tr></table>

<table width=\"100%\" border=\"3\">
<tr class=\"bgcD3D3D3\"><td class=\"txth\">過去ログ</td></tr>
<tr><td>
$log_c
</td></tr></table>


PRI

	&FOOTER;
	exit;

}

1;