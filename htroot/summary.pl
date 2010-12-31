#!/usr/bin/perl -T -I /home/www/
use strict;
use CGI;

use BlogDB;
use Nav;
my $q = new CGI;
print $q->header('text/html');
my $dbh = BlogDB::connect;
my $sth = $dbh->prepare("SELECT * FROM gmoney_posts ORDER BY id DESC") or die "Can't open Statement";
$sth->execute or die "Can't execute statement";
print $q->start_html("George's Blog");
Nav::nav($q);
while(my @row = $sth->fetchrow_array){
  pop @row;
  my $id = shift @row;
  print $q->a({href => "post.pl?id=$id"},$id);
  for my $x (@row){
    print $q->pre($x);
  }
}
print $q->end_html;
$dbh->disconnect;

