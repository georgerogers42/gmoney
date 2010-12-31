package Nav;
our %nav =
  (
   sumaries => "summary.pl",
   full     => "index.pl"
  );
sub nav {
  my $q = shift;
  for my $k (sort keys %nav) {
    print $q->a({href => $nav{$k}},$k);
    print $q->br;
  }
}
1;
