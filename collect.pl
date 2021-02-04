#!/usr/bin/perl
 
use LWP::Simple;
use DBI;
 
# Download file from Mikrotik (/ip accounting web-access has to be active on remote Mikrotik)
my $url = "http://10.93.200.200/accounting/ip.cgi";
my $file = "/home/user/apps/accounting/datafile.txt";
my $status = getstore($url, $file);
 
if ( is_success($status) )
{
 
# Open database connection
$dbh = DBI->connect('DBI:mysql:databasename', 'dbuser', 'dbpassword') || die "Could not connect to database: $DBI::errstr";
 
# Open downloaded source file 
open (FILE, '/home/user/apps/accounting/datafile.txt');
 
# Insert data into database until row exists in source file
while (<FILE>) { 
chomp;
 ($srcaddress, $dstadddress, $bytes, $packets, $srcuser, $dstuser) = split(" ");
 $sth = $dbh->prepare('INSERT INTO collected_data (src_address_ipv4,dst_address_ipv4,packets,bytes,src_user,dst_user) VALUES (?,?,?,?,?,?)');
 $sth->execute($srcaddress, $dstadddress, $packets, $bytes, $srcuser, $dstuser);
 
 }
 
# Disconnect from database
 
$dbh->disconnect();
close (FILE);
 
}
else
{
  print "error downloading file: $status\n";
}
 
exit;
