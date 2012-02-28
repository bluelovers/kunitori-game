
sub MOVE {

use LWP::Simple;
print "Content-type: text/html; charset=UTF-8\n";
print "$cookh\n";


	$bufferno = get("$URI_SP_D/kunibbs/?.m.=0apl&amp;.saba_name.=$URI&amp;.i.=$in{'i'}&amp;.p_f0.=$in{'p_f0'}&amp;.p_f1.=$in{'p_f1'}&amp;.p_f2.=$in{'p_f2'}&amp;.p_f3.=$in{'p_f3'}&amp;.p_f4.=$in{'p_f4'}&amp;.p_f5.=$in{'p_f5'}&amp;.p_f6.=$in{'p_f6'}&amp;.p_f7.=$in{'p_f7'}&amp;.p_f8.=$in{'p_f8'}&amp;.p_f9.=$in{'p_f9'}");
$bufferno =~ s/\r\n//g;
$bufferno =~ s/\r//g;
$bufferno =~ s/\n//g;
	$buffer = get("$URI_SP_D/kunibbs/d_txt/$bufferno.txt");
	$buffer42 = $buffer;
	$bufferno = get("$URI_SP_D/kunibbs/delldindex.cgi?.m.=0txtdell&amp;.no.=$bufferno");
#&jcode'convert(*buffer, "utf8", "", "z");
$buffer =~ s/\r\n//g;
$buffer =~ s/\r//g;
$buffer =~ s/\n//g;

$buffer =~ s/\n//g;


	@buff = split(/\n/,$buffer42);
	foreach(@buff){
	print <<"PRI";
$_
PRI

	}


	exit;
	

}


1;

