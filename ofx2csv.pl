#!/usr/bin/perl

use Finance::OFX::Parse::Simple;
 
my $parser = Finance::OFX::Parse::Simple->new;
 
my $data_from_file     = $parser->parse_file("CA20200229_190306.ofx"); # returns a reference to a list of hash references

foreach $account (@$data_from_file) {
#   printf "Account number $account->{account_id}\n";
   printf "Date,Amount,Payee\n";
   foreach $transaction (@{ $account->{transactions} }) {
      if (index ($transaction->{name}, "APPLI STAT PAY") == 0) {
         printf "$transaction->{date},$transaction->{amount},$transaction->{name}\n"
      }

#      while ( ($key, $value) = each %$transaction) {
#         printf "Key = $key, Value = $value\n"; 
#      }

   }
}

exit 0
