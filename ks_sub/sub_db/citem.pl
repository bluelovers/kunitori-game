
############

sub P_ITEM_OPEN {

					$fi_id = $p_migite{$f_id};
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_hidarite{$f_id};
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_syomotu{$f_id};
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_norimono{$f_id};
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_ihuku{$f_id};
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_akusesari_b{$f_id}[0];
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_akusesari_b{$f_id}[1];
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_akusesari_b{$f_id}[2];
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_akusesari_b{$f_id}[3];
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_akusesari_b{$f_id}[4];
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_akusesari_h{$f_id}[0];
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_akusesari_h{$f_id}[1];
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_akusesari_h{$f_id}[2];
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_akusesari_h{$f_id}[3];
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_akusesari_h{$f_id}[4];
	&I_READ("it","$fi_id","$fi_id");
	if($p_id{$e_id}){
					$fi_id = $p_migite{$e_id};
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_hidarite{$e_id};
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_syomotu{$e_id};
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_norimono{$e_id};
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_ihuku{$e_id};
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_akusesari_b{$e_id}[0];
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_akusesari_b{$e_id}[1];
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_akusesari_b{$e_id}[2];
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_akusesari_b{$e_id}[3];
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_akusesari_b{$e_id}[4];
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_akusesari_h{$e_id}[0];
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_akusesari_h{$e_id}[1];
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_akusesari_h{$e_id}[2];
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_akusesari_h{$e_id}[3];
	&I_READ("it","$fi_id","$fi_id");
					$fi_id = $p_akusesari_h{$e_id}[4];
	&I_READ("it","$fi_id","$fi_id");
	}

}

1;
