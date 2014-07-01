#!/usr/bin/perl
#
#
#
open ( FILE , "file.txt"  );
open ( TCL  , "> tcl.txt" );
open ( VECF , "> f.txt"   );
while (<FILE>) {
  chop;
  my $line = $_;
  $line =~ s/@//;
  $line =~ s/\/$//;
  my $fline = "../".$line."/src/".$line.".v";
  my $tline = "\"$fline\" \\";
  printf VECF "$fline\n";
  printf TCL  "$tline\n";
}
close(FILE);
close(TCL);
close(VECF);
exit;

