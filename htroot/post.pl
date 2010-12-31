#!/usr/bin/perl -T -I /home/www/
use strict;
use CGI;
use BlogDB;
use Nav;
my $q = new CGI;
print $q->header('text/html');
my $id = $q->param('id');
print $q->start_html($id);
Nav::nav($q);
my $dbh = BlogDB::connect;
my $sth = $dbh->prepare("SELECT * from gmoney_posts where id = ?") or die "Can't open Statement";
$sth->execute($id);
for my $x ($sth->fetchrow_array) {
  print $q->pre($x);
}
print $q->end_html;
$dbh->disconnect;
