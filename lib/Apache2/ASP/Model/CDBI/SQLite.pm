
package Apache2::ASP::Model::CDBI::SQLite;

our $VERSION = 0.01;

use strict;
use warnings 'all';
use base 'Class::DBI::SQLite';

BEGIN {
  # Load up the configuration file:
  use Apache2::ASP::Config;
  my $config =  $ENV{APACHE2_ASP_GLOBALCONFIG} ?
                  $ENV{APACHE2_ASP_GLOBALCONFIG}->find_current_config()
                  : Apache2::ASP::Config->new();
  
  # Load up the base class:
  my $pkg = $config->settings->orm_base_class . ".pm";
  $pkg =~ s/::/\//g;
  require $pkg
    unless $INC{$pkg};
  
  # Set our database connection:
  __PACKAGE__->connection(
    $config->settings->dsn,
    $config->settings->username,
    $config->settings->password,
  { __PACKAGE__->_default_attributes() } );
}

# Your code goes below:

1;# return true:

__END__

=pod

=head1 NAME

Apache2::ASP::Model::CDBI::SQLite - ORM base class for Apache2::ASP web applications

=head1 SYNOPSIS

  package MyApp::DBI;
  
  use strict;
  use warnings 'all';
  use base 'Apache2::ASP::Model::CDBI::SQLite';
  
  # Your code goes below:
  
  1;# return true:

=head1 DESCRIPTION

If you use L<Apache2::ASP>, L<Class::DBI> and SQLite, you should base your ORM base class on this class.

=head1 METHODS

None.

=head1 BUGS

It's possible that some bugs have found their way into this release.

Use RT L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Apache2-ASP> to submit bug reports.

=head1 HOMEPAGE

Please visit the Apache2::ASP homepage at L<http://www.devstack.com/> to see examples
of Apache2::ASP in action.

=head1 AUTHOR

John Drago L<mailto:jdrago_999@yahoo.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2007 John Drago, All rights reserved.

This software is free software.  It may be used and distributed under the
same terms as Perl itself.

=cut
