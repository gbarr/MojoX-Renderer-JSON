package MojoX::Renderer::JSON;

use strict;
use warnings;

require JSON;

our $VERSION = '0.10';

sub build {
  shift;    # ignore

  my $json = JSON->new;
  while (my ($method, $value) = splice(@_, 0, 2)) {
    $json->$method($value) if $json->can($method);
  }

  return sub {
    my ($mojo, $ctx, $output) = @_;
    $$output = $json->encode($ctx->stash->{result});
    return 1;
  };
}

1;

__END__

=encoding utf-8

=head1 NAME

MojoX::Renderer::JSON - JSON renderer for Mojo

=head1 SYNOPSIS

  use MojoX::Renderer::JSON;

  sub startup {
    my $self = shift;

    $self->types->type(json => 'application/json');

    my $render = MojoX::Renderer::JSON->build(
      canonical => 1,
      utf8      => 1,
    );

    $self->renderer->add_handler(json => $render);
  }

=head1 DESCRIPTION

Once added this renderer will be called by L<MojoX::Renderer> for any given template
where the suffix of the specified template matches the suffix used in the C<add_handler>
method.

This renderer converts the C<result> element in the stash to JSON using the given options.
The template name is ignored.

=head1 METHODS

=head2 build

This method returns a handler for the Mojo renderer.

Supported parameters are any method defined in L<JSON>, the given value will be passed as an argument.

=head1 AUTHOR

Graham Barr <gbarr@cpan.org>

=head1 BUGS

Please report any bugs or feature requests to C<bug-mojox-renderer-json at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=MojoX-Renderer-JSON>.
I will be notified, and then you'll automatically be notified of progress on your bug as I make changes.

=head1 SEE ALSO

L<JSON>, L<MojoX::Renderer>

=head1 COPYRIGHT & LICENSE

Copyright (C) 2008 Graham Barr

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut
