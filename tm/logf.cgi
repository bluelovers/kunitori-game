#!/usr/bin/perl
	$idurl='';
require "./men.pl";
require "$mpg_r/jcode.pl";
require "$mpg_r/0spt.pl";
&CODE;


 $buffer = $ENV{'QUERY_STRING'}; 
	@pairs = split(/&/, $buffer);

	$v=0;
	foreach (@pairs) {
		($name,$value) = split(/=/, $_);

		if($name eq 'no'){
			$no[$v] = $value;
			$v++;
			$in{$name} = $value;
		}elsif(!$value =~ m/[^0-9a-zA-Z]/){
			$in{$name} = $value;
		}else{
		$value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;

		# 文字コードをシフトJIS変換
		&jcode'convert(*value, "sjis", "", "z");

		$value =~ tr/+/ /;
		# タグ処理
		$value =~ s/</&lt;/g;
		$value =~ s/>/&gt;/g;
		$value =~ s/>/&gt;/g;
		$value =~ s/$TAG_q0/&quot;/g;
$value =~ s/\'/’/g;
$value =~ s/\\$/\\\\/g;

			$in{$name} = $value;
		}
	}



print "Location: $idurl./?.m.=logf&amp;.l.=$in{'l'}\n\n";






sub C_JP{


print "Location: $idurl./?.m.=slog_b&amp;.id.=$in{'id'}\n\n";

}

sub C_JP2{

print "Location: $idurl./?.m.=slog_k&amp;.id.=$in{'id'}\n\n";
}


sub C_JP3{


print "Location: $idurl./?.m.=slog_tk&amp;.id.=$in{'id'}\n\n";

}

sub C_JP4{

print "Location: $idurl./?.m.=slog_tz&amp;.id.=$in{'id'}\n\n";
}
