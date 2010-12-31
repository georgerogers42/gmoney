package BlogDB;
use strict;
use DBI;
my ($DBISTRING,$USERNAME,$PASSWORD) = ("db","user","pass"); 
sub connect {
    return DBI->connect("$DBISTRING", "$USERNAME","$PASSWORD") or die "Can't open DB";
}
1;
