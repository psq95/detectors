use strict;
use warnings;

our %configuration;


sub tungstenCone()
{
	# original physicists design of the moeller shield
	# tapered tungsten with tapered aluminum vacuum pipe inside
	
	if($configuration{"variation"} eq "physicistsBaselineNoFT")
	{
		my $nplanes_tcone = 3;

		my $microgap = 0.1;
		
		# tapered aluminum pipe
		my @oradius_vbeam  = ( 24.0, 41.0,  41.0 );
		my @oradius_tcone  = ( 30.0, 90.0,  90.0 );
		
		my @iradius_tcone;
		for(my $i = 0; $i <$nplanes_tcone; $i++) {$iradius_tcone[$i] = $oradius_vbeam[$i] + $microgap;}

	
		my $pipeZstart    = 420.0;    # start of cone
		my $taperedLength = 1390.0;   # length of tapered part
		my $totalLength   = 2267.1;   # total cone length
	
		my @z_plane_tcone  = ( $pipeZstart, $taperedLength, $totalLength );
		
		# Tungsten Cone
		my %detector = init_det();
		$detector{"name"}        = "tungstenCone";
		$detector{"mother"}      = "root";
		$detector{"description"} = "tungsten moller shield";
		$detector{"color"}       = "ffff9b";
		$detector{"type"}        = "Polycone";
		my $dimen = "0.0*deg 360*deg $nplanes_tcone*counts";
		for(my $i = 0; $i <$nplanes_tcone; $i++) {$dimen = $dimen ." $iradius_tcone[$i]*mm";}
		for(my $i = 0; $i <$nplanes_tcone; $i++) {$dimen = $dimen ." $oradius_tcone[$i]*mm";}
		for(my $i = 0; $i <$nplanes_tcone; $i++) {$dimen = $dimen ." $z_plane_tcone[$i]*mm";}
		$detector{"dimensions"}  = $dimen;
		$detector{"material"}    = "beamline_W";
		$detector{"style"}       = 1;
		print_det(\%configuration, \%detector);
	}
	
}

